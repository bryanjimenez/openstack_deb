#!/bin/bash

nova boot --flavor 1 --image 61183da3-2756-45e3-a7f5-76140389c590 --nic net-id=d57206b6-56c8-4a74-9ce4-0ca35463dbe4 --key_name thekey firstinst
