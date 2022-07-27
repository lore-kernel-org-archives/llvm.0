Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE3A20
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 03:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658891504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wmEEG3TYRr+uk7XsLoqLkzq69L2mrrDNMElujdLcf+c=;
	b=MTIwaxeh63E8Da9n6y/qt2hTzYjVEM2eD+IpPw5aREZonsAJc6l2CMziGkpZ+TUW7D4HmA
	O1PWum+ETop+elBLtLDRMIQ1AYh46CWbBGZmgoC4TOVi4D8Q1EOcq3tDG/OhdccE6GgCam
	6EYERrNQFNaqMYUiDo+PqkVDRoKWjOA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-6oCAf0yzNc2y4RSw9tGFuQ-1; Tue, 26 Jul 2022 23:11:42 -0400
X-MC-Unique: 6oCAf0yzNc2y4RSw9tGFuQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0862101A589
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 03:11:40 +0000 (UTC)
Received: from [172.64.0.89] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2DD5492CA2;
	Wed, 27 Jul 2022 03:11:40 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 5.19.0-rc7
 (mainline.kernel.org-clang) [515f7141]
Date: Wed, 27 Jul 2022 03:11:40 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Message-Id: <33360.122072623114200238@us-mta-527.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/48668

One or more kernel tests failed:
    =E2=9D=97 Regression(s) detected:
         aarch64 - Networking bridge: sanity
                   Issue: Command 'bridge link show dev dummy0 | grep liste=
ning' (Expected 0, got 1)
                          https://gitlab.com/redhat/centos-stream/tests/ker=
nel/kernel-tests/-/issues/583
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4501807

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                  x86_64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
                  x86_64 (debug) - Firmware test suite
        Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: fatal error:=
 'gnu/stubs-32.h' file not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1222
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
        Issue: IBM System X3250 M4 - kernel: irq 16: nobody cared (try boot=
ing with the "irqpoll" option)
            URL: https://redhat.service-now.com/surl.do?n=3DRITM1202693
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: targetcli - module 'inspect' has no attribute 'getargspec'
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2102058
            Affected tests:
                 aarch64 - Storage - targetcli basic
                   s390x - Storage - targetcli basic
                  x86_64 - Storage - targetcli basic
                  x86_64 (debug) - Storage - targetcli basic
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - Firmware test suite
        Issue: SELinux prevents sendmail.service while running Memory funct=
ion: kaslr
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1169
            Affected tests:
                 aarch64 - Reboot test
                  x86_64 (debug) - Reboot test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage - blktests - nvme-tcp: nvme/030: failed to lookup su=
bsystem for controller nvme0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1274
            Affected tests:
                 aarch64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Podman: 170-run-userns.bats: FAIL: Check group leaked into u=
ser namespace
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1166
            Affected tests:
                  x86_64 - Podman system test - as root
        Issue: Podman: Error: netavark: failed to configure bridge and veth=
 interface
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1186
            Affected tests:
                   s390x - Podman system test - as root
                  x86_64 - Podman system test - as root
        Issue: Podman: 500-networking.bats: FAIL: Output does match contain=
er ID
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1167
            Affected tests:
                  x86_64 - Podman system test - as user
        Issue: LTP - commands: df01 5 TFAIL: 'df -t xfs -P' failed, not exp=
ected
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1249
            Affected tests:
                   s390x - LTP - commands
        Issue: Podman: 110-history.bats: FAIL: CreatedSince and CreatedAt f=
rom image history should =3D=3D image list
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1160
            Affected tests:
                 aarch64 - Podman system test - as user
                   s390x - Podman system test - as root
                   s390x - Podman system test - as user
        Issue: storage: software RAID testing: SELinux prevents mdadm
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1213
            Affected tests:
                   s390x - Storage - swraid simple_reshape
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                 aarch64 - Boot test
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                 aarch64 - Storage - block - storage fio numa
        Issue: LTP - syscalls: migrate_pages03: tst_test.c:1579: TBROK: Tes=
t killed! (timeout?)
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1218
            Affected tests:
                 aarch64 - LTP - syscalls
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083062
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Storage - software RAID testing
        Issue: Podman test: run_podman failed with status 124
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/609
            Affected tests:
                 aarch64 - Podman system test - as root


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

