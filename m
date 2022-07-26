Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29B7A
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 09:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658827913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VyiB4zxFw64bAkuW/oan9XgxRx6B2jLzN4C+LGUB9BY=;
	b=fYS5q9Q2KAUk2zpm4DydS3VxgslF4wMpsRN/Qg/74jl9ysVma7e3WSbTzA0tXE6JymnbW/
	zugyk5Dv2JS8NE8witK0rLV9HbOGT5k752dp7P0zDnZB4/T3a6pmHJtY+3M5tsDkJBuYCQ
	hbx/p0zFYNQvVMIIpggIf+RKIzbM3zk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-Te8g9ApAPG2N0UUMjND4Fg-1; Tue, 26 Jul 2022 05:31:51 -0400
X-MC-Unique: Te8g9ApAPG2N0UUMjND4Fg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E593101A54E
	for <llvm@lists.linux.dev>; Tue, 26 Jul 2022 09:31:51 +0000 (UTC)
Received: from [172.64.4.23] (unknown [10.30.34.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB2C90A11;
	Tue, 26 Jul 2022 09:31:51 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4pyF?= PASS (29/492 SKIPPED): Test report for 5.19.0-rc7
 (mainline.kernel.org-clang) [4ba1329c]
Date: Tue, 26 Jul 2022 09:31:51 -0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Message-Id: <67489.122072605315100739@us-mta-271.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/48632

One or more kernel tests failed:

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
                 ppc64le - Storage - targetcli basic
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
                  x86_64 (debug) - Memory function: kaslr
                  x86_64 (debug) - Reboot test
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1983604#c3
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: Storage blktests - blk: scsi/007: Reading from scsi_debug fa=
iled
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2027550
            Affected tests:
                   s390x - Storage - blktests - blk
                  x86_64 - Storage - blktests - blk
        Issue: rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks
            URL: https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-63r-xJOFf=
2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
            Affected tests:
                  x86_64 - Storage - blktests - blk
        Issue: Storage - blktests - nvme-tcp: nvme/030: failed to lookup su=
bsystem for controller nvme0
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1274
            Affected tests:
                 aarch64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Bug 1895913 - nvme-tcp: IO timeout and reconnecting never es=
tablished after max reconnecting reached
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1895913
            Affected tests:
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: Podman: 170-run-userns.bats: FAIL: Check group leaked into u=
ser namespace
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1166
            Affected tests:
                 aarch64 - Podman system test - as root
                 ppc64le - Podman system test - as root
                  x86_64 - Podman system test - as root
        Issue: Podman: Error: netavark: failed to configure bridge and veth=
 interface
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1186
            Affected tests:
                 aarch64 - Podman system test - as root
                 ppc64le - Podman system test - as root
                   s390x - Podman system test - as root
                  x86_64 - Podman system test - as root
        Issue: Podman: 500-networking.bats: FAIL: Output does match contain=
er ID
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1167
            Affected tests:
                  x86_64 - Podman system test - as user
        Issue: LTP - syscalls: utime03.c:82: TFAIL: utime() did not set exp=
ected atime
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1127
            Affected tests:
                 ppc64le - LTP - syscalls
                   s390x - LTP - syscalls
        Issue: LTP - commands: df01 6 TFAIL: 'df -T -P' failed
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/972
            Affected tests:
                   s390x - LTP - commands
        Issue: LTP - commands: df01 2 TFAIL: 'df -a -P' failed
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1251
            Affected tests:
                   s390x - LTP - commands
        Issue: LTP - commands: df01 4 TFAIL: 'df -k -P' failed, not expecte=
d
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1264
            Affected tests:
                   s390x - LTP - commands
        Issue: Podman: 110-history.bats: FAIL: CreatedSince and CreatedAt f=
rom image history should =3D=3D image list
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1160
            Affected tests:
                 aarch64 - Podman system test - as root
                 aarch64 - Podman system test - as user
                 ppc64le - Podman system test - as root
                 ppc64le - Podman system test - as user
                   s390x - Podman system test - as root
                   s390x - Podman system test - as user
        Issue: storage: software RAID testing: SELinux prevents mdadm
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1213
            Affected tests:
                 aarch64 - Storage - swraid simple_reshape
                 ppc64le - Storage - swraid simple_reshape
                   s390x - Storage - swraid simple_reshape
        Issue: AMTU (Abstract Machine Test Utility): misc/amtu FAIL
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1162
            Affected tests:
                 ppc64le - AMTU (Abstract Machine Test Utility)
        Issue: trace/ftrace/tracer/include: line 4: echo: write error: No s=
uch device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/803
            Affected tests:
                 ppc64le - trace: ftrace/tracer
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
        Issue: [aarch64] [ampere] sysfs: cannot create duplicate filename '=
/devices/mc0'
            URL: http://lists.infradead.org/pipermail/linux-arm-kernel/2022=
-June/750380.html
            Affected tests:
                 aarch64 - Boot test
        Issue: Storage blktests - nvmeof-mp: Timeout
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2014813
            Affected tests:
                 aarch64 - Storage - blktests - nvmeof-mp
        Issue: LTP - commands: df01 7 TFAIL: 'df -v /dev/loop0 -P' failed.
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/755
            Affected tests:
                 aarch64 - LTP - commands
        Issue: LTP - commands: df01 5 TFAIL: 'df -t xfs -P' failed, not exp=
ected
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1249
            Affected tests:
                 aarch64 - LTP - commands
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
        Issue: xfstests - _check_xfs_filesystem: filesystem on /dev/nvme0n1=
p4 is inconsistent (r)
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1989409
            Affected tests:
                 aarch64 - xfstests - btrfs


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

