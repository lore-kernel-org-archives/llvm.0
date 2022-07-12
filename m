Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EB31841
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 00:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657585866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=di2emvxhspFbgFU2zeJzMmxej3TrP7xlGoVylk47BYU=;
	b=fx3FD33pbny7SHBS4bYdOGe0DRJKWx3l2u0nKmP69Vw2NkUJGRbJlxbPsWW4VoZNmS+G35
	WK4OjYnzihYI9IvXn4kqSjCccLfuPNI0tRJ0C4yI7FPfmDgjqiXO/okzm3Z5w5+7pJ8P7Q
	YD1D9r97CinEGTej7SYGTLJOXeeWhaY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-FFaQEG4oNjOvzovDiOs5VQ-1; Mon, 11 Jul 2022 20:31:05 -0400
X-MC-Unique: FFaQEG4oNjOvzovDiOs5VQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F18E5380453A
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 00:31:04 +0000 (UTC)
Received: from [172.64.4.17] (unknown [10.30.34.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCCC81121319;
	Tue, 12 Jul 2022 00:31:04 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4pyF?= PASS (6/492 SKIPPED): Test report for d9919d43
 (mainline.kernel.org-clang)
Date: Tue, 12 Jul 2022 00:31:04 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Message-Id: <11276.122071120310500273@us-mta-427.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/47467

One or more kernel tests failed:

    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - Boot test
                   Issue: rcu: INFO: rcu_sched detected expedited stalls on=
 CPUs/tasks
                          https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-=
63r-xJOFf2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
                   Issue: [aarch64] [ampere] sysfs: cannot create duplicate=
 filename '/devices/mc0'
                          http://lists.infradead.org/pipermail/linux-arm-ke=
rnel/2022-June/750380.html
         aarch64 - LTP - commands
                   Issue: LTP - commands: df01 7 TFAIL: 'df -v /dev/loop0 -=
P' failed.
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/755
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
                   Issue: rcu: INFO: rcu_sched detected expedited stalls on=
 CPUs/tasks
                          https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-=
63r-xJOFf2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
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
           s390x - LTP - commands
                   Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/972
                   Issue: LTP - commands: df01 4 TFAIL: 'df -k -P' failed, =
not expected
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1264
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
          x86_64 - Memory function: kaslr
                   Issue: SELinux prevents sendmail.service while running M=
emory function: kaslr
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1169
          x86_64 - Reboot test
                   Issue: SELinux prevents sendmail.service while running M=
emory function: kaslr
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1169
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

