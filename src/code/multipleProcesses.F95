! Copyight 2003-2009, Regents of the University of Colorado. All right reserved
! Use and duplication is permitted under the terms of the
!   GNU public license, V2 : http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
! NASA has special rights noted in License.txt

! $Revision$, $Date$
! $URL$

module multipleProcesses
  !
  ! Module encapsulating all MPI calls needed in the I3RC model.
  !   These can be replaced with stubs and the code compiled without MPI.
  !
#ifdef USE_MPI
  use mpi
#endif

  implicit none

  logical :: MasterProc = .true.

  interface sumAcrossProcesses
    module procedure sumAcrossProcesses_Real_Scalar,                         &
                     sumAcrossProcesses_Real_1D, sumAcrossProcesses_Real_2D, &
                     sumAcrossProcesses_Real_3D, sumAcrossProcesses_Real_4D
  end interface sumAcrossProcesses
contains
  ! -----------------------------------------------------------
  subroutine initializeProcesses(numProcs, thisProcNum)
    integer, intent(out) :: numProcs, thisProcNum
    !
    !Initial MPI calls; how many processors are being used
    !   and which number is this one?
    !
#ifdef USE_MPI
    integer :: ierr

    call MPI_INIT(ierr)
    call MPI_COMM_RANK( MPI_COMM_WORLD, thisProcNum, ierr )
    call MPI_COMM_SIZE( MPI_COMM_WORLD, numProcs, ierr )
    MasterProc = (thisProcNum == 0)
#else
    numProcs = 1
    thisProcNum = 0
#endif

  end subroutine initializeProcesses
  ! -----------------------------------------------------------
  subroutine synchronizeProcesses
    !
    ! Wait for all processors to get to this point
    !
#ifdef USE_MPI
    integer :: ierr

    CALL MPI_Barrier( MPI_COMM_WORLD, ierr )
#else
    continue
#endif
  end subroutine synchronizeProcesses
  ! -----------------------------------------------------------
  subroutine finalizeProcesses
#ifdef USE_MPI
    integer :: ierr

    call MPI_FINALIZE(ierr)
#else
    continue
#endif
  end subroutine finalizeProcesses
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_Scalar(x)
    !
    ! Add values across all processors
    !
    real, intent(in) :: x
    real             :: sumAcrossProcesses_Real_Scalar

#ifdef USE_MPI
    real    :: temp
    integer :: ierr

    call MPI_REDUCE(x, temp, 1, MPI_REAL, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
    sumAcrossProcesses_Real_Scalar = temp
#else
    sumAcrossProcesses_Real_Scalar = x
#endif

  end function sumAcrossProcesses_Real_Scalar
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_1D(x)
    !
    ! Add values across all processors
    !
    real, dimension(:), intent(in) :: x
    real, dimension(size(x))       :: sumAcrossProcesses_Real_1D

#ifdef USE_MPI
    real, dimension(size(x)) :: temp
    integer :: ierr

    call MPI_REDUCE(x, temp, size(x), MPI_REAL, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
    sumAcrossProcesses_Real_1D(:) = temp(:)
#else
    sumAcrossProcesses_Real_1D(:) = x(:)
#endif

  end function sumAcrossProcesses_Real_1D
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_2D(x)
    !
    ! Add values across all processors
    !
    real, dimension(:, :),       intent(in) :: x
    real, dimension(size(x, 1), size(x, 2)) :: sumAcrossProcesses_Real_2D

#ifdef USE_MPI
    real, dimension(size(x, 1), size(x, 2)) :: temp
    integer :: ierr

    call MPI_REDUCE(x, temp, size(x), MPI_REAL, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
    sumAcrossProcesses_Real_2D(:, :) = temp(:, :)
#else
    sumAcrossProcesses_Real_2D(:, :) = x(:, :)
#endif

  end function sumAcrossProcesses_Real_2D
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_3D(x)
    !
    ! Add values across all processors
    !
    real, dimension(:, :, :), intent(in) :: x
    real, dimension(size(x, 1), size(x, 2), &
                    size(x, 3))          :: sumAcrossProcesses_Real_3D

#ifdef USE_MPI
    real, dimension(size(x, 1), size(x, 2), &
                    size(x, 3))             :: temp
    integer :: ierr

    call MPI_REDUCE(x, temp, size(x), MPI_REAL, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
    sumAcrossProcesses_Real_3D(:, :, :) = temp(:, :, :)
#else
    sumAcrossProcesses_Real_3D(:, :, :) = x(:, :, :)
#endif

  end function sumAcrossProcesses_Real_3D
  ! -----------------------------------------------------------
  function sumAcrossProcesses_Real_4D(x)
    real, dimension(:, :, :, :), intent(in) :: x
    real, dimension(size(x, 1), size(x, 2), &
                    size(x, 3), size(x, 4)) :: sumAcrossProcesses_Real_4D

#ifdef USE_MPI
    real, dimension(size(x, 1), size(x, 2), &
                    size(x, 3), size(x, 4)) :: temp
    integer :: ierr

    call MPI_REDUCE(x, temp, size(x), MPI_REAL, MPI_SUM, 0, MPI_COMM_WORLD, ierr)
    sumAcrossProcesses_Real_4D(:, :, :, :) = temp(:, :, :, :)
#else
    sumAcrossProcesses_Real_4D(:, :, :, :) = x(:, :, :, :)
#endif

  end function sumAcrossProcesses_Real_4D
  ! -----------------------------------------------------------

end module multipleProcesses
