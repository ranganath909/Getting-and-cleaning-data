# Code Book

**Variables in `df`:**

  * Variables 1-561 are described in `UCI HAR Dataset/features_info.txt`. For the sake of brevity, this information will not be duplicated here.

  * Variable 562: Subject

    Subject contains the id number associated with a give subject that participated in the study.
  
  * Variable 563: Activity

    Activiy describes the which activity the subject was performing while the observation was recorded.

**Variables in `avg_by_subject_and_activity`:**

  * Variables 1-561 are averages of the variables found in `df`. The averages were calculated after grouping each observation by subject and activity.

  * Variables 562-563: Subject and Activity

    Subject contains the id number associated with a give subject that participated in the study.
    Subject and activity are idententical to the values found in `df`.
