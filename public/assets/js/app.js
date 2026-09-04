(() => {
  'use strict';

  const sidebar = document.getElementById('sidebar');
  const mobileMenu = document.getElementById('mobileMenu');
  if (mobileMenu && sidebar) {
    mobileMenu.addEventListener('click', () => sidebar.classList.toggle('open'));
  }

  document.querySelectorAll('[data-confirm]').forEach((element) => {
    element.addEventListener('click', (event) => {
      const message = element.dataset.confirm || 'Lanjutkan tindakan ini?';
      if (!window.confirm(message)) {
        event.preventDefault();
      }
    });
  });

  const classSelect = document.getElementById('activeClassSelect');
  if (classSelect) {
    classSelect.addEventListener('change', () => {
      classSelect.form?.submit();
    });
  }

  document.querySelectorAll('[data-auto-submit]').forEach((element) => {
    element.addEventListener('change', () => element.form?.submit());
  });

  const taskSearch = document.getElementById('taskSearch');
  if (taskSearch) {
    taskSearch.addEventListener('input', () => {
      const query = taskSearch.value.trim().toLowerCase();
      document.querySelectorAll('[data-task-student-row]').forEach((row) => {
        row.hidden = query !== '' && !row.dataset.search.includes(query);
      });
    });
  }

  const studentSearch = document.getElementById('studentSearch');
  if (studentSearch) {
    studentSearch.addEventListener('input', () => {
      const query = studentSearch.value.trim().toLowerCase();
      document.querySelectorAll('[data-student-row]').forEach((row) => {
        row.hidden = query !== '' && !row.dataset.search.includes(query);
      });
    });
  }

  const attendanceSearch = document.getElementById('attendanceSearch');
  if (attendanceSearch) {
    attendanceSearch.addEventListener('input', () => {
      const query = attendanceSearch.value.trim().toLowerCase();
      document.querySelectorAll('[data-attendance-card]').forEach((card) => {
        card.hidden = query !== '' && !card.dataset.search.includes(query);
      });
    });
  }


  const attendanceForm = document.getElementById('attendanceForm');
  if (attendanceForm) {
    const updateAttendanceSummary = () => {
      const counts = {H: 0, I: 0, S: 0, A: 0, blank: 0};

      attendanceForm.querySelectorAll('.attendance-status-input').forEach((input) => {
        const value = input.value;
        if (Object.prototype.hasOwnProperty.call(counts, value)) {
          counts[value] += 1;
        } else {
          counts.blank += 1;
        }
      });

      Object.entries(counts).forEach(([key, value]) => {
        const target = document.querySelector(`[data-attendance-count="${key}"]`);
        if (target) {
          target.textContent = String(value);
        }
      });
    };

    attendanceForm.addEventListener('click', (event) => {
      const button = event.target.closest('[data-attendance-status]');
      if (!button) {
        return;
      }

      event.preventDefault();

      const card = button.closest('[data-attendance-card]');
      const input = card?.querySelector('.attendance-status-input');
      if (!card || !input) {
        return;
      }

      const selectedStatus = button.dataset.attendanceStatus || '';
      input.value = selectedStatus;

      card.querySelectorAll('[data-attendance-status]').forEach((item) => {
        const isSelected = item === button;
        item.classList.toggle('active', isSelected);
        item.setAttribute('aria-pressed', isSelected ? 'true' : 'false');
      });

      card.classList.add('attendance-changed');
      updateAttendanceSummary();
    });

    updateAttendanceSummary();
  }


  /**
   * Mengaktifkan sorting pada tabel dashboard.
   * Klik header pertama kali = ascending, klik berikutnya = descending.
   * Nilai input/select dibaca dari value saat ini sehingga tabel nilai tetap akurat.
   */
  const normalizeSortableText = (value) => (
    String(value ?? '')
      .replace(/\s+/g, ' ')
      .trim()
  );

  const sortableCellValue = (cell) => {
    if (!cell) {
      return '';
    }

    if (cell.dataset.sortValue !== undefined) {
      return normalizeSortableText(cell.dataset.sortValue);
    }

    const select = cell.querySelector('select');
    if (select) {
      const selectedOption = select.options[select.selectedIndex];
      return normalizeSortableText(
        selectedOption?.textContent || select.value
      );
    }

    const input = cell.querySelector(
      'input:not([type="hidden"]), textarea'
    );
    if (input) {
      return normalizeSortableText(input.value);
    }

    return normalizeSortableText(cell.textContent);
  };

  const sortableNumericValue = (value) => {
    let text = normalizeSortableText(value);

    if (
      text === ''
      || text === '—'
      || text === '-'
      || text.toLowerCase() === 'belum'
    ) {
      return null;
    }

    const greaterThan = text.startsWith('>');
    text = text
      .replace(/[^\d,.\-]/g, '')
      .replace(',', '.');

    if (!text || text === '-' || text === '.') {
      return null;
    }

    const parsed = Number.parseFloat(text);
    if (!Number.isFinite(parsed)) {
      return null;
    }

    return greaterThan ? parsed + 0.000001 : parsed;
  };

  const compareSortableValues = (left, right, direction) => {
    const leftNumber = sortableNumericValue(left);
    const rightNumber = sortableNumericValue(right);

    let result = 0;

    if (leftNumber !== null && rightNumber !== null) {
      result = leftNumber - rightNumber;
    } else if (leftNumber !== null) {
      result = -1;
    } else if (rightNumber !== null) {
      result = 1;
    } else {
      result = String(left).localeCompare(
        String(right),
        'id-ID',
        {
          numeric: true,
          sensitivity: 'base'
        }
      );
    }

    return direction === 'desc' ? -result : result;
  };

  const clearTableSortState = (table, activeHeader) => {
    table.querySelectorAll('thead th[data-sortable-column]').forEach((header) => {
      if (header !== activeHeader) {
        header.removeAttribute('aria-sort');
        header.dataset.sortDirection = '';
      }
    });
  };

  const sortTableByColumn = (table, columnIndex, header) => {
    const tbody = table.tBodies[0];
    if (!tbody) {
      return;
    }

    const rows = Array.from(tbody.rows).filter(
      (row) => row.cells.length > columnIndex
    );

    if (rows.length < 2) {
      return;
    }

    const currentDirection = header.dataset.sortDirection || '';
    const nextDirection = currentDirection === 'asc' ? 'desc' : 'asc';

    rows.sort((leftRow, rightRow) => {
      const leftValue = sortableCellValue(leftRow.cells[columnIndex]);
      const rightValue = sortableCellValue(rightRow.cells[columnIndex]);

      const compared = compareSortableValues(
        leftValue,
        rightValue,
        nextDirection
      );

      if (compared !== 0) {
        return compared;
      }

      return Number(leftRow.dataset.originalOrder || 0)
        - Number(rightRow.dataset.originalOrder || 0);
    });

    rows.forEach((row) => tbody.appendChild(row));

    clearTableSortState(table, header);

    header.dataset.sortDirection = nextDirection;
    header.setAttribute(
      'aria-sort',
      nextDirection === 'asc' ? 'ascending' : 'descending'
    );
  };

  document.querySelectorAll('table').forEach((table) => {
    if (
      table.hasAttribute('data-no-sort')
      || !table.tHead
      || !table.tBodies.length
    ) {
      return;
    }

    const tbody = table.tBodies[0];
    const bodyRows = Array.from(tbody.rows);

    if (bodyRows.length < 2) {
      return;
    }

    bodyRows.forEach((row, index) => {
      if (row.dataset.originalOrder === undefined) {
        row.dataset.originalOrder = String(index);
      }
    });

    const headers = Array.from(
      table.tHead.rows[table.tHead.rows.length - 1]?.cells || []
    );

    headers.forEach((header, columnIndex) => {
      const title = normalizeSortableText(header.textContent);

      if (
        header.hasAttribute('data-no-sort')
        || title === ''
        || title.toLowerCase() === 'aksi'
      ) {
        return;
      }

      header.dataset.sortableColumn = String(columnIndex);
      header.tabIndex = 0;
      header.setAttribute('role', 'button');
      header.setAttribute(
        'aria-label',
        `${title}. Klik untuk mengurutkan kolom.`
      );

      const activateSorting = () => {
        sortTableByColumn(table, columnIndex, header);
      };

      header.addEventListener('click', activateSorting);

      header.addEventListener('keydown', (event) => {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          activateSorting();
        }
      });
    });
  });


  const seatState = { draggingEnrollment: null };

  document.querySelectorAll('[data-seat-enrollment]').forEach((seat) => {
    seat.addEventListener('dragstart', () => {
      seatState.draggingEnrollment = seat.dataset.seatEnrollment;
      seat.classList.add('dragging');
    });

    seat.addEventListener('dragend', () => {
      seat.classList.remove('dragging');
      seatState.draggingEnrollment = null;
      document.querySelectorAll('.pc-slot.drag-over').forEach((slot) => {
        slot.classList.remove('drag-over');
      });
    });
  });

  document.querySelectorAll('[data-pc-slot]').forEach((slot) => {
    slot.addEventListener('dragover', (event) => {
      event.preventDefault();
      slot.classList.add('drag-over');
    });

    slot.addEventListener('dragleave', () => {
      slot.classList.remove('drag-over');
    });

    slot.addEventListener('drop', async (event) => {
      event.preventDefault();
      slot.classList.remove('drag-over');

      const enrollmentId = seatState.draggingEnrollment;
      const pc = slot.dataset.pcSlot;
      const form = document.getElementById('seatMoveForm');
      if (!enrollmentId || !pc || !form) {
        return;
      }

      const body = new FormData(form);
      body.set('enrollment_id', enrollmentId);
      body.set('pc', pc);

      try {
        const response = await fetch(form.action, {
          method: 'POST',
          body,
          headers: {'X-Requested-With': 'XMLHttpRequest'}
        });

        const result = await response.json();
        if (!response.ok || !result.ok) {
          throw new Error(result.message || 'Gagal memindahkan posisi.');
        }

        window.location.reload();
      } catch (error) {
        window.alert(error.message || 'Gagal memindahkan posisi.');
      }
    });
  });

  document.querySelectorAll('[data-toggle-password]').forEach((button) => {
    button.addEventListener('click', () => {
      const input = document.getElementById(button.dataset.togglePassword);
      if (!input) return;
      input.type = input.type === 'password' ? 'text' : 'password';
      button.textContent = input.type === 'password' ? 'Lihat' : 'Sembunyikan';
    });
  });
})();
