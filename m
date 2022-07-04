Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9617E
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 05:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656913893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UXfFyoJ3xDKZzYCNKZvsJ71yrEMXeUNrt0KGXjWU+ls=;
	b=K9GBETVCm0aVrkwGC6+J81HdloV/Es5IeueE+xxQm3A5LUfUeBplT8XQ2nQLoMpW9vg27N
	j9tDgNHb9Xwi+dd9vYB+kXqQsSZpBXSjeiax/2hybQu1fQxQRsZyfjXInazyM6r4Ov53Y0
	S+kl9qqGmKidJRPdEaaoVpGkRjwNGRQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-262-yeNd3uZaP5qDG3DXasXUrA-1; Mon, 04 Jul 2022 01:51:30 -0400
X-MC-Unique: yeNd3uZaP5qDG3DXasXUrA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8D87429AB41E
	for <llvm@lists.linux.dev>; Mon,  4 Jul 2022 05:51:30 +0000 (UTC)
Received: from [172.64.0.111] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64F9640C1241;
	Mon,  4 Jul 2022 05:51:30 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 20855e4c
 (mainline.kernel.org-clang)
Date: Mon, 04 Jul 2022 05:51:30 -0000
CC: liwang@redhat.com, bgoncalv@redhat.com, mm-qe@redhat.com,
 jstancek@redhat.com, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Message-Id: <18634.122070401513000351@us-mta-262.us.mimecast.lan>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cki-project@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/46874

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         aarch64 - LTP - commands
                   Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
                          https://datawarehouse.cki-project.org/kcidb/tests=
/2472230
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4199170
           s390x - LTP - commands
                   Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
                          https://datawarehouse.cki-project.org/kcidb/tests=
/2472230
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4199274

    Unrecognized or new issues:
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4199044
          x86_64 - xfstests - cifsv3.11
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4199028

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
         aarch64 - Storage - blktests - nvmeof-mp
                   Issue: Storage blktests - nvmeof-mp: Timeout
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D201=
4813
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
         ppc64le - LTP - syscalls
                   Issue: LTP - syscalls: fanotify10.c:538: TFAIL: group 0 =
(4) with FAN_MARK_FILESYSTEM did not get event
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1239
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
          x86_64 - Memory function: kaslr
                   Issue: SELinux prevents sendmail.service while running M=
emory function: kaslr
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1169
          x86_64 - Storage - block - storage fio numa
                   Issue: Storage block - storage fio numa: Performance com=
parison: min:40535 * 1.15 < max:81259
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D203=
2094
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
          x86_64 - Boot test
                   Issue: rcu: INFO: rcu_sched detected expedited stalls on=
 CPUs/tasks
                          https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-=
63r-xJOFf2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
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

