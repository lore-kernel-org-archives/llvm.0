Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2C7C
	for <llvm@lists.linux.dev>; Tue,  5 Jul 2022 05:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657000232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zrRckRPilR5v3NL6Kvm6tWpwI8a5qEDtV6Apm2edm90=;
	b=Bew9m6zyioiur+7Z8CQjljR+mcMpBP+wcLcgxP3F6imWzFg5ZW5ro4VU1+x4inOA5Wy+0Y
	X7YIP87SCA8AZWusebAFSeFwiWyZt9N3JF9qq+YiPeZlifIydKS3P2+3uRTtryu5w/02bC
	UncA3QsRRPNXn86bLO3IRKI8UtGE27U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-2uFPbgI5PnmllfjEHEHlwg-1; Tue, 05 Jul 2022 01:50:30 -0400
X-MC-Unique: 2uFPbgI5PnmllfjEHEHlwg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 868ED29ABA12
	for <llvm@lists.linux.dev>; Tue,  5 Jul 2022 05:50:30 +0000 (UTC)
Received: from [172.64.3.49] (unknown [10.30.32.240])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72B502026D64;
	Tue,  5 Jul 2022 05:50:30 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for c1084b6c
 (mainline.kernel.org-clang)
Date: Tue, 05 Jul 2022 05:50:29 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Message-Id: <10960.122070501503000255@us-mta-249.us.mimecast.lan>
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
              Test: OK


You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/46951

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         aarch64 - LTP - commands
                   Issue: LTP - commands: df01 7 TFAIL: 'df -v /dev/loop0 -=
P' failed.
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/755
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4215585
           s390x - LTP - commands
                   Issue: LTP - commands: df01 7 TFAIL: 'df -v /dev/loop0 -=
P' failed.
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/755
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4215487

    We also see the following known issues which are not related to your ch=
anges:
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
         ppc64le - LTP - commands
                   Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/972
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
           s390x - stress: stress-ng - memory
                   Issue: stress: stress-ng - memory: ERROR: Aborting curre=
nt task: Aborting due to system crash and reboot
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1236
           s390x - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
           s390x - Podman system test - as root
                   Issue: Podman: FAIL: stty under podman run reads the cor=
rect dimensions
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/683
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
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
          x86_64 - kselftest build - bpf
                   Issue: gcc: error: unrecognized command-line option =E2=
=80=98-Qunused-arguments=E2=80=99
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/513
          x86_64 - Boot test
                   Issue: IBM System X3250 M4 - kernel: irq 16: nobody care=
d (try booting with the "irqpoll" option)
                          https://redhat.service-now.com/surl.do?n=3DRITM12=
02693
          x86_64 - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
          x86_64 - trace: ftrace/tracer
                   Issue: trace: ftrace/tracer: make: *** No rule to make t=
arget 'testinfo.desc'.  Stop.
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1246
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
          x86_64 - Boot test
                   Issue: IBM System X3250 M4 - kernel: irq 16: nobody care=
d (try booting with the "irqpoll" option)
                          https://redhat.service-now.com/surl.do?n=3DRITM12=
02693
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

