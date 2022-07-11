Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF584411
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657554661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ko591qlSfGBSvf6IqjRiYYpfVXVJcYCgVwRz0kbS4R8=;
	b=Gy0MApA3lMnmSAxtLjxjLEV1IIWnUlAGCt5NJ3f2Ci6pwNSbjoXoF7yeYhyDmxp1dKYV+u
	FNjuCqbcc2PJCFfUzQ5xHF8ppywJyNLXCuDjlRdqyhK5/UHwFDt2xN+0iOlX4E9PO2ltUF
	fgcHRoUyO4ZKZ5RHs/Vnzui4+wnZsNQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-116-Bmw9H1TpM3WqcEyHu4mF0A-1; Mon, 11 Jul 2022 11:50:54 -0400
X-MC-Unique: Bmw9H1TpM3WqcEyHu4mF0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 24D8B1C13947
	for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 15:50:54 +0000 (UTC)
Received: from [172.64.4.17] (unknown [10.30.34.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 113702166B26;
	Mon, 11 Jul 2022 15:50:54 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4pyF?= PASS (7/492 SKIPPED): Test report for 525496a0
 (mainline.kernel.org-clang)
Date: Mon, 11 Jul 2022 15:50:50 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Message-Id: <84558.122071111505402295@us-mta-116.us.mimecast.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cki-project@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/47406

One or more kernel tests failed:

    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - Boot test
                   Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresig=
ht-etm4x: probe of ARMHC500:20 failed with error -17
                          https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFq=
BrMH0z927YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
         aarch64 - LTP - syscalls
                   Issue: LTP - syscalls: msync04.c:59: TFAIL: Expected dir=
ty bit to be set after writing to mmap()-ed area
                          https://lore.kernel.org/lkml/YT8HqsXsHFeMdDxS@yuk=
i/
         aarch64 - LTP - commands
                   Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/972
         aarch64 - Networking cki netfilter test
                   Issue: avc:  denied  { sys_admin } for  pid=3D674004 com=
m=3D"systemd-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd=
_gpt_generator_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0=
 tclass=3Dcapability permissive=3D0
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D208=
3062
         aarch64 - ALSA PCM loopback test
                   Issue: avc:  denied  { sys_admin } for  pid=3D674004 com=
m=3D"systemd-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd=
_gpt_generator_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0=
 tclass=3Dcapability permissive=3D0
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D208=
3062
         aarch64 - Storage - lvm thinp stqe test
                   Issue: rcu: INFO: rcu_sched detected expedited stalls on=
 CPUs/tasks
                          https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-=
63r-xJOFf2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
                   Issue: lvm thinp stqe test: FAIL: rcu: INFO: rcu_preempt=
 detected expedited stalls on CPUs/tasks
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1180
         aarch64 - Storage - SCSI VPD
                   Issue: avc:  denied  { sys_admin } for  pid=3D674004 com=
m=3D"systemd-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd=
_gpt_generator_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0=
 tclass=3Dcapability permissive=3D0
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D208=
3062
         aarch64 - Storage - software RAID testing
                   Issue: avc:  denied  { sys_admin } for  pid=3D674004 com=
m=3D"systemd-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd=
_gpt_generator_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0=
 tclass=3Dcapability permissive=3D0
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D208=
3062
         aarch64 - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
         aarch64 - Podman system test - as root
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
                   Issue: Podman: 170-run-userns.bats: FAIL: Check group le=
aked into user namespace
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1166
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
         aarch64 - Podman system test - as user
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
         aarch64 - Firmware test suite
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
                   Issue: Firmware test suite: modinfo: ERROR: Module efi_r=
untime not found
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1235
         aarch64 - Storage - swraid simple_reshape
                   Issue: storage: software RAID testing: SELinux prevents =
mdadm
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1213
         aarch64 - Reboot test
                   Issue: SELinux prevents sendmail.service while running M=
emory function: kaslr
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1169
         ppc64le - LTP - syscalls
                   Issue: LTP - syscalls: msync04.c:59: TFAIL: Expected dir=
ty bit to be set after writing to mmap()-ed area
                          https://lore.kernel.org/lkml/YT8HqsXsHFeMdDxS@yuk=
i/
         ppc64le - AMTU (Abstract Machine Test Utility)
                   Issue: AMTU (Abstract Machine Test Utility): misc/amtu F=
AIL
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1162
         ppc64le - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
         ppc64le - trace: ftrace/tracer
                   Issue: trace/ftrace/tracer/include: line 4: echo: write =
error: No such device
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/803
         ppc64le - Podman system test - as root
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
                   Issue: Podman: 170-run-userns.bats: FAIL: Check group le=
aked into user namespace
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1166
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
         ppc64le - Podman system test - as user
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
         ppc64le - Storage - swraid simple_reshape
                   Issue: storage: software RAID testing: SELinux prevents =
mdadm
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1213
         ppc64le - selinux-policy: serge-testsuite
                   Issue: selinux-policy: serge-testsuite: Failed test at p=
erf_event/test line 88, 104, 109, 115
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/814
           s390x - Storage - blktests - blk
                   Issue: Storage blktests - blk: scsi/007: Reading from sc=
si_debug failed
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D202=
7550
           s390x - LTP - syscalls
                   Issue: LTP: ioctl_loop05 - TBROK: Cannot find block devi=
ce for /mnt/testarea/ltp-w7JfbOmzJY/iocfULVTn/test.img
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/674
           s390x - LTP - commands
                   Issue: LTP - commands: df01 4 TFAIL: 'df -k -P' failed, =
not expected
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1264
                   Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/972
                   Issue: LTP - commands: df01 2 TFAIL: 'df -a -P' failed
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1251
           s390x - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
           s390x - Podman system test - as root
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
           s390x - Podman system test - as user
                   Issue: Podman: 110-history.bats: FAIL: CreatedSince and =
CreatedAt from image history should =3D=3D image list
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1160
           s390x - Storage - swraid simple_reshape
                   Issue: storage: software RAID testing: SELinux prevents =
mdadm
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1213
           s390x - kdump - sysrq-c
                   Issue: kdump - sysrq-c: vmcore-dmesg.txt is empty
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
1983
           s390x - kdump - file-load
                   Issue: kdump - sysrq-c: vmcore-dmesg.txt is empty
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
1983
          x86_64 - kselftest build - net
                   Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: f=
atal error: 'gnu/stubs-32.h' file not found
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1222
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
          x86_64 - kselftest build - bpf
                   Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: f=
atal error: 'gnu/stubs-32.h' file not found
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1222
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
          x86_64 - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
          x86_64 - Firmware test suite
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
                   Issue: Firmware test suite: modinfo: ERROR: Module efi_r=
untime not found
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1235
          x86_64 - kselftests upstream - net
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - forwarding
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - tc
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - bpf
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - bpf_test_progs
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - xfstests - nfsv4.2
                   Issue: avc:  denied  { name_bind } for  pid=3D897864 com=
m=3D"rpcbind" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontex=
t=3Dsystem_u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=
=3D1
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D198=
3604#c3
          x86_64 - Storage - blktests - blk
                   Issue: Storage blktests - blk: scsi/007: Reading from sc=
si_debug failed
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D202=
7550
                   Issue: rcu: INFO: rcu_sched detected expedited stalls on=
 CPUs/tasks
                          https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-=
63r-xJOFf2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
          x86_64 - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
          x86_64 - Podman system test - as root
                   Issue: Podman: 170-run-userns.bats: FAIL: Check group le=
aked into user namespace
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1166
                   Issue: Podman: Error: netavark: failed to configure brid=
ge and veth interface
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1186
          x86_64 - Podman system test - as user
                   Issue: Podman: 500-networking.bats: FAIL: Output does ma=
tch container ID
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1167
          x86_64 - Firmware test suite
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
                   Issue: Firmware test suite: modinfo: ERROR: Module efi_r=
untime not found
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1235
          x86_64 - kselftests upstream - net
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - forwarding
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - tc
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - bpf
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - kselftests upstream - bpf_test_progs
                   Issue: kselftests: fail to install bpftool-5.19.0-rc5
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1263
          x86_64 - xfstests - nfsv4.2
                   Issue: avc:  denied  { name_bind } for  pid=3D897864 com=
m=3D"rpcbind" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontex=
t=3Dsystem_u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=
=3D1
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D198=
3604#c3


If you find a failure unrelated to your changes, please tag it at https://d=
atawarehouse.cki-project.org .
This will prevent the failures from being incorrectly reported in the futur=
e.
If you don't have permissions to tag an issue, you can contact the CKI team=
 or
test maintainers.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

