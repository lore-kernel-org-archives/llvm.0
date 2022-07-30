Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D123A4
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 05:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659157917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y4HlmFyGdOtqkaxYVTOMObj3V097xUYQMMYAFTjZs/g=;
	b=B891yVTCDJFjeES9S6zvxj7duc8L7Bsf/P1sLHWcc4heXGm5OZM2kB3tm/FZRTrMJ4vxIM
	Tg+Jkq/I3pVQKXsep5jZ01y+kszpiYoejwoqa5xM/7CW/mwSKWAnH0ZED0Izev6NtgF0qf
	b5BNcTRXvtQv9rY9b+XuIKrOZNLCHa0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-Le-COSfVP22bBVDxcIR64g-1; Sat, 30 Jul 2022 01:11:56 -0400
X-MC-Unique: Le-COSfVP22bBVDxcIR64g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B4B001C05EB5
	for <llvm@lists.linux.dev>; Sat, 30 Jul 2022 05:11:55 +0000 (UTC)
Received: from [172.64.0.89] (unknown [10.30.32.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3DD540466AA;
	Sat, 30 Jul 2022 05:11:55 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 5.19.0-rc8
 (mainline.kernel.org-clang) [bb83c99d]
Date: Sat, 30 Jul 2022 05:11:55 -0000
CC: xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Message-Id: <21669.122073001115600147@us-mta-588.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/49235

One or more kernel tests failed:

    Unrecognized or new issues:
         aarch64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4592977
         aarch64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4592979
          x86_64 - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593249
          x86_64 - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593250
          x86_64 - xfstests - nfsv4.2
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593251
          x86_64 - xfstests - cifsv3.11
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593252
          x86_64 (debug) - xfstests - ext4
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593034
          x86_64 (debug) - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593035
          x86_64 (debug) - xfstests - nfsv4.2
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593036
          x86_64 (debug) - xfstests - cifsv3.11
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4593037

    We also see the following known issues which are not related to your ch=
anges:
        Issue: gcc: error: unrecognized command-line option =E2=80=98-Qunus=
ed-arguments=E2=80=99
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/513
            Affected tests:
                 aarch64 - LTP - cve
                 aarch64 - LTP - sched
                 aarch64 - LTP - syscalls
                 aarch64 - LTP - can
                 aarch64 - LTP - commands
                 aarch64 - LTP - containers
                 aarch64 - LTP - dio
                 aarch64 - LTP - fs
                 aarch64 - LTP - fsx
                 aarch64 - LTP - math
                 aarch64 - LTP - hugetlb
                 aarch64 - LTP - mm
                 aarch64 - LTP - nptl
                 aarch64 - LTP - pty
                 aarch64 - LTP - ipc
                 aarch64 - LTP - tracing
                 aarch64 - Firmware test suite
                   s390x - LTP - cve
                   s390x - LTP - sched
                   s390x - LTP - syscalls
                   s390x - LTP - can
                   s390x - LTP - commands
                   s390x - LTP - containers
                   s390x - LTP - dio
                   s390x - LTP - fs
                   s390x - LTP - fsx
                   s390x - LTP - math
                   s390x - LTP - hugetlb
                   s390x - LTP - mm
                   s390x - LTP - nptl
                   s390x - LTP - pty
                   s390x - LTP - ipc
                   s390x - LTP - tracing
                  x86_64 - LTP - cve
                  x86_64 - LTP - sched
                  x86_64 - LTP - syscalls
                  x86_64 - LTP - can
                  x86_64 - LTP - commands
                  x86_64 - LTP - containers
                  x86_64 - LTP - dio
                  x86_64 - LTP - fs
                  x86_64 - LTP - fsx
                  x86_64 - LTP - math
                  x86_64 - LTP - hugetlb
                  x86_64 - LTP - mm
                  x86_64 - LTP - nptl
                  x86_64 - LTP - pty
                  x86_64 - LTP - ipc
                  x86_64 - LTP - tracing
                  x86_64 - Firmware test suite
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
                  x86_64 (debug) - LTP - cve
                  x86_64 (debug) - LTP - sched
                  x86_64 (debug) - LTP - syscalls
                  x86_64 (debug) - LTP - can
                  x86_64 (debug) - LTP - commands
                  x86_64 (debug) - LTP - containers
                  x86_64 (debug) - LTP - dio
                  x86_64 (debug) - LTP - fs
                  x86_64 (debug) - LTP - fsx
                  x86_64 (debug) - LTP - math
                  x86_64 (debug) - LTP - hugetlb
                  x86_64 (debug) - LTP - mm
                  x86_64 (debug) - LTP - nptl
                  x86_64 (debug) - LTP - pty
                  x86_64 (debug) - LTP - ipc
                  x86_64 (debug) - LTP - tracing
                  x86_64 (debug) - Firmware test suite
        Issue: kselftest build: /usr/include/gnu/stubs.h:7:11: fatal error:=
 'gnu/stubs-32.h' file not found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1222
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
                  x86_64 (debug) - kselftest build - net
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
                  x86_64 (debug) - Memory function: kaslr
                  x86_64 (debug) - Reboot test
        Issue: rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks
            URL: https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-63r-xJOFf=
2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
            Affected tests:
                 aarch64 - Boot test
                  x86_64 (debug) - Boot test
        Issue: Podman: 170-run-userns.bats: FAIL: Check group leaked into u=
ser namespace
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1166
            Affected tests:
                 aarch64 - Podman system test - as root
                  x86_64 - Podman system test - as root
        Issue: Podman: 110-history.bats: FAIL: CreatedSince and CreatedAt f=
rom image history should =3D=3D image list
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1160
            Affected tests:
                 aarch64 - Podman system test - as root
                 aarch64 - Podman system test - as user
                   s390x - Podman system test - as root
                   s390x - Podman system test - as user
        Issue: podman: cannot assign requested address
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/852
            Affected tests:
                   s390x - Podman system test - as user
        Issue: storage: software RAID testing: SELinux prevents mdadm
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1213
            Affected tests:
                   s390x - Storage - swraid simple_reshape
        Issue: kdump - sysrq-c: vmcore-dmesg.txt is empty
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2101983
            Affected tests:
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
        Issue: [ppc64le] Boot test: tar: boot/vmlinux-kbuild-5.17.0: Cannot=
 write: No space left on device
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1047
            Affected tests:
                 ppc64le - Boot test
        Issue: avc:  denied  { sys_admin } for  pid=3D674004 comm=3D"system=
d-gpt-aut" capability=3D21  scontext=3Dsystem_u:system_r:systemd_gpt_genera=
tor_t:s0 tcontext=3Dsystem_u:system_r:systemd_gpt_generator_t:s0 tclass=3Dc=
apability permissive=3D0
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2083900
            Affected tests:
                 aarch64 - Networking cki netfilter test
                 aarch64 - ALSA PCM loopback test
                 aarch64 - Storage - SCSI VPD
                 aarch64 - Storage - software RAID testing


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

