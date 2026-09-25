(() => {
  'use strict';

  const sidebar = document.getElementById('sidebar');
  const sidebarToggle = document.getElementById('sidebarToggle');
  const sidebarBackdrop = document.getElementById('sidebarBackdrop');
  const appShell = document.getElementById('appShell') || document.querySelector('.app');

  if (sidebar && sidebarToggle && appShell) {
    const desktopSidebarMedia = window.matchMedia('(min-width: 901px)');
    const storageKey = 'academicMonitor.sidebarCollapsed';
    const toggleIcon = sidebarToggle.querySelector('[aria-hidden="true"]');
    const sidebarLinks = Array.from(sidebar.querySelectorAll('.nav a'));

    const readCollapsedPreference = () => {
      try {
        return window.localStorage.getItem(storageKey) === '1';
      } catch (error) {
        return false;
      }
    };

    const saveCollapsedPreference = (collapsed) => {
      try {
        window.localStorage.setItem(storageKey, collapsed ? '1' : '0');
      } catch (error) {
        // Sidebar tetap berfungsi bila penyimpanan lokal browser tidak tersedia.
      }
    };

    const setSidebarLinkTooltips = (collapsed) => {
      sidebarLinks.forEach((link) => {
        const label = link.dataset.sidebarLabel || link.textContent.trim().replace(/\s+/g, ' ');
        if (collapsed) {
          link.setAttribute('title', label || 'Menu');
        } else {
          link.removeAttribute('title');
        }
      });
    };

    const syncSidebarAccessibility = () => {
      const isDesktop = desktopSidebarMedia.matches;
      const isCollapsed = isDesktop && appShell.classList.contains('sidebar-collapsed');
      const isMobileOpen = !isDesktop && sidebar.classList.contains('open');

      sidebarToggle.setAttribute(
        'aria-expanded',
        isDesktop ? String(!isCollapsed) : String(isMobileOpen)
      );

      sidebarToggle.setAttribute(
        'aria-label',
        isDesktop
          ? (isCollapsed ? 'Buka sidebar' : 'Ciutkan sidebar')
          : (isMobileOpen ? 'Tutup menu navigasi' : 'Buka menu navigasi')
      );

      sidebarToggle.title = isDesktop
        ? (isCollapsed ? 'Buka sidebar' : 'Ciutkan sidebar')
        : (isMobileOpen ? 'Tutup menu' : 'Buka menu');

      if (toggleIcon) {
        toggleIcon.textContent = isDesktop
          ? (isCollapsed ? '☰' : '‹')
          : (isMobileOpen ? '×' : '☰');
      }

      setSidebarLinkTooltips(isCollapsed);
    };

    const closeMobileSidebar = () => {
      sidebar.classList.remove('open');
      sidebarBackdrop?.classList.remove('show');
      document.body.classList.remove('sidebar-mobile-open');
      syncSidebarAccessibility();
    };

    const openMobileSidebar = () => {
      sidebar.classList.add('open');
      sidebarBackdrop?.classList.add('show');
      document.body.classList.add('sidebar-mobile-open');
      syncSidebarAccessibility();
    };

    const applyResponsiveSidebarState = () => {
      if (desktopSidebarMedia.matches) {
        sidebar.classList.remove('open');
        sidebarBackdrop?.classList.remove('show');
        document.body.classList.remove('sidebar-mobile-open');
        appShell.classList.toggle('sidebar-collapsed', readCollapsedPreference());
      } else {
        appShell.classList.remove('sidebar-collapsed');
        closeMobileSidebar();
      }

      syncSidebarAccessibility();
    };

    sidebarToggle.addEventListener('click', () => {
      if (desktopSidebarMedia.matches) {
        const collapsed = !appShell.classList.contains('sidebar-collapsed');
        appShell.classList.toggle('sidebar-collapsed', collapsed);
        saveCollapsedPreference(collapsed);
        syncSidebarAccessibility();
        return;
      }

      if (sidebar.classList.contains('open')) {
        closeMobileSidebar();
      } else {
        openMobileSidebar();
      }
    });

    sidebarBackdrop?.addEventListener('click', closeMobileSidebar);

    sidebarLinks.forEach((link) => {
      link.addEventListener('click', () => {
        if (!desktopSidebarMedia.matches) {
          closeMobileSidebar();
        }
      });
    });

    document.addEventListener('keydown', (event) => {
      if (event.key === 'Escape' && sidebar.classList.contains('open')) {
        closeMobileSidebar();
        sidebarToggle.focus();
      }
    });

    if (typeof desktopSidebarMedia.addEventListener === 'function') {
      desktopSidebarMedia.addEventListener('change', applyResponsiveSidebarState);
    } else {
      desktopSidebarMedia.addListener(applyResponsiveSidebarState);
    }

    applyResponsiveSidebarState();
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
  const attendanceForm = document.getElementById('attendanceForm');
  if (attendanceForm) {
    const attendanceFilterButtons = Array.from(
      document.querySelectorAll('[data-attendance-filter]')
    );
    let activeAttendanceFilter = 'all';

    const applyAttendanceFilters = () => {
      const query = attendanceSearch?.value.trim().toLowerCase() || '';

      attendanceForm.querySelectorAll('[data-attendance-card]').forEach((card) => {
        const input = card.querySelector('.attendance-status-input');
        const currentStatus = input?.value || 'blank';
        const matchesSearch = query === '' || card.dataset.search.includes(query);
        const matchesStatus = activeAttendanceFilter === 'all'
          || currentStatus === activeAttendanceFilter;

        card.hidden = !(matchesSearch && matchesStatus);
      });
    };

    const updateAttendanceSummary = () => {
      const counts = {all: 0, H: 0, I: 0, S: 0, A: 0, blank: 0};

      attendanceForm.querySelectorAll('.attendance-status-input').forEach((input) => {
        const value = input.value;
        counts.all += 1;

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

    attendanceSearch?.addEventListener('input', applyAttendanceFilters);

    attendanceFilterButtons.forEach((button) => {
      button.addEventListener('click', () => {
        activeAttendanceFilter = button.dataset.attendanceFilter || 'all';

        attendanceFilterButtons.forEach((item) => {
          const isActive = item === button;
          item.classList.toggle('active', isActive);
          item.setAttribute('aria-pressed', isActive ? 'true' : 'false');
        });

        applyAttendanceFilters();
      });
    });

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
      applyAttendanceFilters();
    });

    updateAttendanceSummary();
    applyAttendanceFilters();
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
