BB_ERROR_ASSERT_FAILED=10
BB_ERROR_WORKSPACE_CREATION_FAILED=11
BB_ERROR_EVENT_MAX_DEPTH_REACHED=12
BB_ERROR_TASK_BAD_CONTEXT=13
BB_ERROR_TASK_UNDEFINED=14

BB_ERROR=0

bb-error?() {
    BB_ERROR=$?
    (( BB_ERROR != 0 ))
}
