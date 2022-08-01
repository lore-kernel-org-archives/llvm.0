Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5687F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 11:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659352322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=diwiBuHSFm2s7JnLjBNOrdxizFPLTyR8sO9KtvxFcsU=;
	b=AFaEmYb2KHDRsjy7q9siWEFYmtbfEmyt6y6Z0E3tA8AXx9VPcQzsFSeB0108ztwiO26RMS
	RLaJYus8mjPbMmd8exLdJ9ef5L5Ex13g+ulTw2uXdXx7XjL/Zi41De3QWxP6VQkZG4AuOe
	bK4SF2L6rfrSqun+juEBBk5POxmD+UY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-BTspi_FkO7-ta9va3yCUAg-1; Mon, 01 Aug 2022 07:12:01 -0400
X-MC-Unique: BTspi_FkO7-ta9va3yCUAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06C48811E80
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 11:12:01 +0000 (UTC)
Received: from [172.64.5.13] (unknown [10.30.32.252])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB7174010D27;
	Mon,  1 Aug 2022 11:12:00 +0000 (UTC)
From: cki-project@redhat.com
To: llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for 5.19.0
 (mainline.kernel.org-clang) [3d7cb6b0]
Date: Mon, 01 Aug 2022 11:12:00 -0000
CC: mm-qe@redhat.com, jstancek@redhat.com, liwang@redhat.com, feliu@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Message-Id: <80845.122080107120100185@us-mta-100.us.mimecast.lan>
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
    https://datawarehouse.cki-project.org/kcidb/checkouts/49386

One or more kernel tests failed:

    Unrecognized or new issues:
         ppc64le - LTP - cve
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620565
         ppc64le - LTP - sched
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620566
         ppc64le - LTP - syscalls
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620567
         ppc64le - LTP - can
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620568
         ppc64le - LTP - commands
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620569
         ppc64le - LTP - containers
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620570
         ppc64le - LTP - dio
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620571
         ppc64le - LTP - fs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620572
         ppc64le - LTP - fsx
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620573
         ppc64le - LTP - math
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620574
         ppc64le - LTP - hugetlb
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620575
         ppc64le - LTP - mm
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620576
         ppc64le - LTP - nptl
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620577
         ppc64le - LTP - pty
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620578
         ppc64le - LTP - ipc
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620579
         ppc64le - LTP - tracing
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620580
          x86_64 (debug) - Networking MACsec: sanity
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
4620782

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
        Issue: rcu: INFO: rcu_sched detected expedited stalls on CPUs/tasks
            URL: https://lore.kernel.org/all/CA+QYu4qTWaDzep2GGxm-63r-xJOFf=
2rFCCNhWupAgZdKE7HV6w@mail.gmail.com/T/#u
            Affected tests:
                  x86_64 (debug) - Boot test
        Issue: stress: stress-ng - cpu-cache: fail to build core-affinity: =
error: redeclaration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1303
            Affected tests:
                  x86_64 (debug) - stress: stress-ng - cpu-cache
        Issue: stress: stress-ng: fatal: destination path '/opt/stress-ng' =
already exists and is not an empty directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1301
            Affected tests:
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - stress: stress-ng - memory
                  x86_64 (debug) - stress: stress-ng - memory
        Issue: Storage - blktests: fail to build mount_clear_sock: error: r=
edeclaration of enum fsconfig_command
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1300
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                 aarch64 - Storage - blktests - nvmeof-mp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - nvmeof-mp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - nvmeof-mp
                  x86_64 (debug) - Storage - blktests - nvme-tcp
                  x86_64 (debug) - Storage - blktests - nvmeof-mp
        Issue: Storage block - storage fio numa: Performance comparison: mi=
n:40535 * 1.15 < max:81259
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2032094
            Affected tests:
                  x86_64 (debug) - Storage - block - storage fio numa
        Issue: targetcli - module 'inspect' has no attribute 'getargspec'
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2102058
            Affected tests:
                 aarch64 - Storage - targetcli basic
                 ppc64le - Storage - targetcli basic
                   s390x - Storage - targetcli basic
                  x86_64 - Storage - targetcli basic
                  x86_64 (debug) - Storage - targetcli basic
        Issue: Podman: 040-ps.bats: FAIL: podman ps -a --external sees buil=
dah containers
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1092
            Affected tests:
                  x86_64 (debug) - Podman system test - as root
        Issue: Podman: 170-run-userns.bats: FAIL: Check group leaked into u=
ser namespace
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1166
            Affected tests:
                 aarch64 - Podman system test - as root
                 ppc64le - Podman system test - as root
                  x86_64 - Podman system test - as root
                  x86_64 (debug) - Podman system test - as root
        Issue: Firmware test suite: modinfo: ERROR: Module efi_runtime not =
found
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1235
            Affected tests:
                 aarch64 - Firmware test suite
                  x86_64 - Firmware test suite
                  x86_64 (debug) - Firmware test suite
        Issue: IBM System X3250 M4 - kernel: irq 16: nobody cared (try boot=
ing with the "irqpoll" option)
            URL: https://redhat.service-now.com/surl.do?n=3DRITM1202693
            Affected tests:
                  x86_64 - Boot test
                  x86_64 (debug) - Boot test
        Issue: xfstests: fail to build detached_mounts_propagation: error: =
redeclaration of 'enum fsconfig_command'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1302
            Affected tests:
                 aarch64 - xfstests - ext4
                 aarch64 - xfstests - xfs
                 aarch64 - xfstests - btrfs
                  x86_64 - xfstests - ext4
                  x86_64 - xfstests - xfs
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 - xfstests - btrfs
                  x86_64 (debug) - xfstests - ext4
                  x86_64 (debug) - xfstests - xfs
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - btrfs
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
        Issue: kdump - sysrq-c: vmcore-dmesg.txt is empty
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2101983
            Affected tests:
                   s390x - kdump - sysrq-c
                   s390x - kdump - file-load
        Issue: AMTU (Abstract Machine Test Utility): misc/amtu FAIL
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1162
            Affected tests:
                 ppc64le - AMTU (Abstract Machine Test Utility)
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

