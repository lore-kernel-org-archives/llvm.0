Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76C036B
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 05:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658034717;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Qr9JccyFJcLo6qB+JNrievVr6ijlwSX4P/s9QX7YZ34=;
	b=T3JfYDtcFEC2wbsoQi4nZTdfRtNULlmUijqWvbvRmtAhSFl+FbmDAqjrIRJYksmV3y+uWx
	buvhOFwZu2NaUzjlu5O5kklM2mDW0eJzNFg3iKZV3s8tCc0Swb+jaN/RvOtEfzyiag2BNA
	iTUWJRyMn6OsYoqQyPtY1eamaI/272c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-W4Lp4D4aM4uhjR_QUkKWOw-1; Sun, 17 Jul 2022 01:11:55 -0400
X-MC-Unique: W4Lp4D4aM4uhjR_QUkKWOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18EC81C04B40
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 05:11:55 +0000 (UTC)
Received: from [172.64.4.17] (unknown [10.30.34.251])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 04F0B1121314;
	Sun, 17 Jul 2022 05:11:54 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 9ed714db
 (mainline.kernel.org-clang)
Date: Sun, 17 Jul 2022 05:11:52 -0000
CC: bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Message-Id: <95283.122071701115500606@us-mta-589.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/48042

One or more kernel tests failed:

    Unrecognized or new issues:
          x86_64 - kselftest build - bpf
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4396582
          x86_64 - kselftest build - net
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4396585
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4397391

    We also see the following known issues which are not related to your ch=
anges:
         aarch64 - Boot test
                   Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresig=
ht-etm4x: probe of ARMHC500:20 failed with error -17
                          https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFq=
BrMH0z927YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
         aarch64 - Storage - block - storage fio numa
                   Issue: Storage block - storage fio numa: Performance com=
parison: min:40535 * 1.15 < max:81259
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D203=
2094
         aarch64 - Storage - blktests - nvmeof-mp
                   Issue: Storage blktests - nvmeof-mp: Timeout
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D201=
4813
         aarch64 - LTP - commands
                   Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/972
                   Issue: LTP - commands: df01 2 TFAIL: 'df -a -P' failed
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1251
                   Issue: LTP - commands: df01 4 TFAIL: 'df -k -P' failed, =
not expected
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1264
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
         aarch64 - xfstests - btrfs
                   Issue: xfstests - _check_xfs_filesystem: filesystem on /=
dev/nvme0n1p4 is inconsistent (r)
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D198=
9409
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
                   Issue: Storage - swraid simple_reshape: mdadm: super1.x =
cannot open /dev/loop0: Device or resource busy
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1238
         ppc64le - selinux-policy: serge-testsuite
                   Issue: (ppc64le) selinux-policy: serge-testsuite: ld: ca=
nnot find arch/powerpc/lib/crtsavres.o: No such file or directory
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1267
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
          x86_64 - Boot test
                   Issue: IBM System X3250 M4 - kernel: irq 16: nobody care=
d (try booting with the "irqpoll" option)
                          https://redhat.service-now.com/surl.do?n=3DRITM12=
02693
          x86_64 - xfstests - nfsv4.2
                   Issue: avc:  denied  { name_bind } for  pid=3D897864 com=
m=3D"rpcbind" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontex=
t=3Dsystem_u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=
=3D1
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D198=
3604#c3
          x86_64 - Storage - targetcli basic
                   Issue: targetcli - module 'inspect' has no attribute 'ge=
targspec'
                          https://bugzilla.redhat.com/show_bug.cgi?id=3D210=
2058
          x86_64 - Podman system test - as root
                   Issue: Podman: 500-networking.bats: Error: netavark: : E=
OF
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1242
                   Issue: Podman test: fail to run podman login
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/740
                   Issue: Podman: 170-run-userns.bats: FAIL: Check group le=
aked into user namespace
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1166
          x86_64 - Podman system test - as user
                   Issue: Podman: 500-networking.bats: Error: netavark: : E=
OF
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/1242
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
                   Issue: IBM System X3250 M4 - kernel: irq 16: nobody care=
d (try booting with the "irqpoll" option)
                          https://redhat.service-now.com/surl.do?n=3DRITM12=
02693


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

