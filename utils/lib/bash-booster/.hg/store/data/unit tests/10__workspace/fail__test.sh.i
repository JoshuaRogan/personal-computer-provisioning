         �   �       g��������_V���2d�|�͘�fv`�^�            u#!/bin/bash

# expect: CODE=10

unset CDPATH
cd "$( dirname "${BASH_SOURCE[0]}" )"

BB_WORKSPACE="/unexisted/workspace"
source ../../bashbooster.sh
     �         �       n    ���������������Ak#���n�                      #!/usr/bin/env bash
     �     2   �      �   ����Q��	"$��uX��R\���               \   �   &BB_WORKSPACE="/nonexistent/workspace"
     �     "   �      �   �������	*���;��
�[�P�               �   �   source "$BASHBOOSTER"
    	     ?   �      �   �����&X�r�:I3L�m�;+�aaL                  '   3# expect: CODE=$BB_ERROR_WORKSPACE_CREATION_FAILED
