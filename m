Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E647B
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 08:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655540956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TlvlEq9GgxmUGtk99hhJhTzaLQIKPWmiImBwbQiy5vQ=;
	b=enp/+zrVhz3Xfyg1xKSOktf8VJ4wQQijnKTkA6R4FICBeALhQ1W+GyUoZ+zYO24WgFABgy
	v7ty5FQDX1qfT3EzZtka0p6WQNrmJ5rmSKjr4iT0T0tuR/HOkre4iosAi0n05PYMssNOt2
	/zT42feuD3FeMPxm96wsb09VTP6lQj0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-xIjTXuZ4MumT-EZPYfXiRw-1; Sat, 18 Jun 2022 04:29:15 -0400
X-MC-Unique: xIjTXuZ4MumT-EZPYfXiRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BF60B80B90C
	for <llvm@lists.linux.dev>; Sat, 18 Jun 2022 08:29:14 +0000 (UTC)
Received: from [172.64.10.32] (unknown [10.30.33.152])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A67EA1400E75;
	Sat, 18 Jun 2022 08:29:14 +0000 (UTC)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: skt-results-master@redhat.com, llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for kernel 5.19.0-rc2
 (mainline.kernel.org-clang, 462abc9d)
Date: Sat, 18 Jun 2022 08:29:14 -0000
Message-ID: <cki.G1XJ4CLF3IMZ87QMDPES@redhat.com>
X-Gitlab-Pipeline-ID: 566731534
X-Gitlab-Url: https://gitlab.com
X-Gitlab-Path: =?utf-8?q?/redhat/red-hat-ci-tools/kernel/cki-internal-pipeli?=
 =?utf-8?q?nes/cki-trusted-contributors/pipelines/566731534?=
X-DataWarehouse-Checkout-IID: 45539
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cki-project@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



Check out this report and any autotriaged failures in our web dashboard:
    https://datawarehouse.cki-project.org/kcidb/checkouts/45539

Hello,

We ran automated tests on a recent commit from this kernel tree:

       Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git
            Commit: 462abc9de7a1 - Merge tag 'block-5.19-2022-06-16' of git=
://git.kernel.dk/linux-block

The results of these automated tests are provided below.

    Overall result: FAILED (see details below)
             Merge: OK
           Compile: OK
 Selftests compile: FAILED
             Tests: FAILED
    Targeted tests: NO

All kernel binaries, config files, and logs are available for download here=
:

  https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?pre=
fix=3Ddatawarehouse-public/2022/06/17/566731534

One or more kernel tests failed:

    s390x:
     =E2=9D=8C CIFS Connectathon
     =E2=9D=8C Storage: swraid mdadm raid_module test
     =E2=9D=8C kdump - sysrq-c
     =E2=9D=8C kdump - file-load
     =E2=9D=8C Storage blktests - blk

    aarch64:
     =E2=9D=8C CIFS Connectathon
     =E2=9D=8C Networking cki netfilter test
     =E2=9D=8C ALSA PCM loopback test
     =E2=9D=8C storage: SCSI VPD
     =E2=9D=8C storage: software RAID testing
     =E2=9D=8C Storage: swraid mdadm raid_module test
     =E2=9D=8C Reboot test

    ppc64le:
     =E2=9D=8C selinux-policy: serge-testsuite
     =E2=9D=8C CIFS Connectathon
     =E2=9D=8C AMTU (Abstract Machine Test Utility)
     =E2=9D=8C Storage: swraid mdadm raid_module test
     =E2=9D=8C trace: ftrace/tracer
     =E2=9D=8C kdump - sysrq-c

    x86_64 (debug):
     =E2=9D=8C CIFS Connectathon
     =E2=9D=8C Storage: swraid mdadm raid_module test
     =E2=9D=8C Reboot test

    x86_64:
     =E2=9D=8C CIFS Connectathon
     =E2=9D=8C Storage: swraid mdadm raid_module test
     =E2=9D=8C Reboot test
     =E2=9D=8C xfstests - nfsv4.2

We hope that these logs can help you find the problem quickly. For the full
detail on our testing procedures, please scroll to the bottom of this messa=
ge.

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

Compile testing
---------------

We compiled the kernel for 5 architectures:

    aarch64:
      make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg

    ppc64le:
      make options: make CC=3Dclang LLVM_IAS=3D0 -j24 INSTALL_MOD_STRIP=3D1=
 targz-pkg

    s390x:
      make options: make CC=3Dclang LLVM_IAS=3D0 -j24 INSTALL_MOD_STRIP=3D1=
 targz-pkg

    x86_64:
      make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg

    x86_64:
      make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg


We built the following selftests:

  x86_64:
      net: fail
      bpf: fail
      seccomp: OK
      lkdtm: OK
      install and packaging: OK

You can find the full log (build-selftests.log) in the artifact storage abo=
ve.


Hardware testing
----------------
We booted each kernel and ran the following tests:

  aarch64:
    Host 1:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 selinux-policy: serge-testsuite
       =E2=9C=85 Reboot test

    Host 3:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 IPMI driver test
       =E2=9C=85 IPMItool loop stress test
       =E2=9C=85 Storage blktests - blk
       =E2=9C=85 Storage block - filesystem fio test
       =E2=9C=85 Storage block - queue scheduler test
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9C=85 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvme-tcp
       =F0=9F=9A=A7 =E2=9C=85 Storage block - storage fio numa
       =E2=9C=85 Reboot test

    Host 4:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 ACPI table test
       =E2=9C=85 ACPI enabled test
       =E2=9C=85 i2c: i2cdetect sanity
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9C=85 LTP - syscalls
       =E2=9C=85 LTP - can
       =E2=9C=85 LTP - commands
       =E2=9C=85 LTP - containers
       =E2=9C=85 LTP - dio
       =E2=9C=85 LTP - fs
       =E2=9C=85 LTP - fsx
       =E2=9C=85 LTP - math
       =E2=9C=85 LTP - hugetlb
       =E2=9C=85 LTP - mm
       =E2=9C=85 LTP - nptl
       =E2=9C=85 LTP - pty
       =E2=9C=85 LTP - ipc
       =E2=9C=85 LTP - tracing
       =E2=9C=85 LTP: openposix test suite
       =E2=9D=8C CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 jvm - jcstress tests
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9C=85 Networking bridge: sanity
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking MACsec: sanity
       =E2=9C=85 Networking socket: fuzz
       =E2=9C=85 Networking sctp-auth: sockopts test
       =E2=9C=85 Networking: igmp conformance test
       =E2=9C=85 Networking route: pmtu
       =E2=9C=85 Networking route_func - local
       =E2=9C=85 Networking route_func - forward
       =E2=9C=85 Networking TCP: keepalive test
       =E2=9C=85 Networking UDP: socket
       =E2=9D=8C Networking cki netfilter test
       =E2=9C=85 Networking tunnel: geneve basic test
       =E2=9C=85 Networking tunnel: gre basic
       =E2=9C=85 L2TP basic test
       =E2=9C=85 Networking tunnel: vxlan basic
       =E2=9C=85 Networking tunnel: permtest
       =E2=9C=85 Networking ipsec: basic netns - transport
       =E2=9C=85 Networking ipsec: basic netns - tunnel
       =E2=9C=85 Networking vnic: ipvlan/basic
       =E2=9C=85 Networking VRF: sanity
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9C=85 pciutils: update pci ids test
       =E2=9D=8C ALSA PCM loopback test
       =E2=9C=85 ALSA Control (mixer) Userspace Element test
       =E2=9C=85 Storage: block zstd compression test
       =E2=9C=85 Storage: block zstd smoke test
       =E2=9C=85 storage: dm/common
       =E2=9C=85 lvm thinp sanity
       =E2=9C=85 lvm thinp stqe test
       =E2=9C=85 lvm snapper test
       =E2=9D=8C storage: SCSI VPD
       =E2=9D=8C storage: software RAID testing
       =E2=9D=8C Storage: swraid mdadm raid_module test
       =E2=9C=85 Storage: swraid scsi_raid
       =E2=9C=85 storage: targetcli basic
       =E2=9C=85 trace: ftrace/tracer
       =E2=9C=85 kdump - kexec_boot
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as root
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as user
       =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
       =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 Usex - version 1.9-29
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =F0=9F=9A=A7 =E2=9C=85 kdump - kexec-file-load
       =E2=9D=8C Reboot test

    Host 5:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 kdump - sysrq-c
       =E2=9C=85 Reboot test

    Host 6:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =F0=9F=9A=A7 =E2=9D=8C Storage blktests - nvmeof-mp
       =E2=9C=85 Reboot test

    Host 7:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test

    Host 8:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =F0=9F=9A=A7 =E2=9D=8C xfstests - btrfs
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test

  ppc64le:
    Host 1:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9D=8C selinux-policy: serge-testsuite
       =E2=9C=85 Reboot test

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9C=85 LTP - syscalls
       =E2=9C=85 LTP - can
       =E2=9C=85 LTP - commands
       =E2=9C=85 LTP - containers
       =E2=9C=85 LTP - dio
       =E2=9C=85 LTP - fs
       =E2=9C=85 LTP - fsx
       =E2=9C=85 LTP - math
       =E2=9C=85 LTP - hugetlb
       =E2=9C=85 LTP - mm
       =E2=9C=85 LTP - nptl
       =E2=9C=85 LTP - pty
       =E2=9C=85 LTP - ipc
       =E2=9C=85 LTP - tracing
       =E2=9C=85 LTP: openposix test suite
       =E2=9D=8C CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 jvm - jcstress tests
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9D=8C AMTU (Abstract Machine Test Utility)
       =E2=9C=85 Networking bridge: sanity
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking MACsec: sanity
       =E2=9C=85 Networking socket: fuzz
       =E2=9C=85 Networking sctp-auth: sockopts test
       =E2=9C=85 Networking route: pmtu
       =E2=9C=85 Networking route_func - local
       =E2=9C=85 Networking route_func - forward
       =E2=9C=85 Networking TCP: keepalive test
       =E2=9C=85 Networking UDP: socket
       =E2=9C=85 Networking cki netfilter test
       =E2=9C=85 Networking tunnel: geneve basic test
       =E2=9C=85 Networking tunnel: gre basic
       =E2=9C=85 L2TP basic test
       =E2=9C=85 Networking tunnel: vxlan basic
       =E2=9C=85 Networking tunnel: permtest
       =E2=9C=85 Networking ipsec: basic netns - tunnel
       =E2=9C=85 Networking vnic: ipvlan/basic
       =E2=9C=85 Networking VRF: sanity
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9C=85 pciutils: update pci ids test
       =E2=9C=85 ALSA PCM loopback test
       =E2=9C=85 ALSA Control (mixer) Userspace Element test
       =E2=9C=85 storage: dm/common
       =E2=9C=85 lvm thinp sanity
       =E2=9C=85 lvm thinp stqe test
       =E2=9C=85 lvm snapper test
       =E2=9C=85 storage: software RAID testing
       =E2=9D=8C Storage: swraid mdadm raid_module test
       =E2=9C=85 Storage: swraid scsi_raid
       =E2=9C=85 storage: targetcli basic
       =E2=9D=8C trace: ftrace/tracer
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as root
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as user
       =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 Usex - version 1.9-29
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =E2=9C=85 Reboot test

    Host 3:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9D=8C kdump - sysrq-c
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - file-load
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test

  s390x:
    Host 1:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9C=85 LTP - syscalls
       =E2=9C=85 LTP - can
       =E2=9C=85 LTP - commands
       =E2=9C=85 LTP - containers
       =E2=9C=85 LTP - dio
       =E2=9C=85 LTP - fs
       =E2=9C=85 LTP - fsx
       =E2=9C=85 LTP - math
       =E2=9C=85 LTP - hugetlb
       =E2=9C=85 LTP - mm
       =E2=9C=85 LTP - nptl
       =E2=9C=85 LTP - pty
       =E2=9C=85 LTP - ipc
       =E2=9C=85 LTP - tracing
       =E2=9C=85 LTP: openposix test suite
       =E2=9D=8C CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 jvm - jcstress tests
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9C=85 Networking bridge: sanity
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking MACsec: sanity
       =E2=9C=85 Networking sctp-auth: sockopts test
       =E2=9C=85 Networking route: pmtu
       =E2=9C=85 Networking route_func - local
       =E2=9C=85 Networking route_func - forward
       =E2=9C=85 Networking TCP: keepalive test
       =E2=9C=85 Networking UDP: socket
       =E2=9C=85 Networking cki netfilter test
       =E2=9C=85 Networking tunnel: geneve basic test
       =E2=9C=85 Networking tunnel: gre basic
       =E2=9C=85 L2TP basic test
       =E2=9C=85 Networking tunnel: vxlan basic
       =E2=9C=85 Networking tunnel: permtest
       =E2=9C=85 Networking ipsec: basic netns - transport
       =E2=9C=85 Networking ipsec: basic netns - tunnel
       =E2=9C=85 Networking vnic: ipvlan/basic
       =E2=9C=85 Networking VRF: sanity
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9C=85 Storage: block zstd compression test
       =E2=9C=85 Storage: block zstd smoke test
       =E2=9C=85 storage: dm/common
       =E2=9C=85 lvm thinp sanity
       =E2=9C=85 lvm thinp stqe test
       =E2=9C=85 lvm snapper test
       =E2=9D=8C Storage: swraid mdadm raid_module test
       =E2=9C=85 Storage: swraid scsi_raid
       =E2=9C=85 storage: targetcli basic
       =E2=9C=85 trace: ftrace/tracer
       =E2=9C=85 kdump - kexec_boot
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as root
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as user
       =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =F0=9F=9A=A7 =E2=9C=85 kdump - kexec-file-load
       =E2=9C=85 Reboot test

    Host 2:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 Storage blktests - blk
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvme-tcp
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test

    Host 3:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9D=8C kdump - sysrq-c
       =E2=9D=8C kdump - file-load
       =E2=9C=85 Reboot test

    Host 4:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvmeof-mp
       =E2=9C=85 Reboot test

    Host 5:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 selinux-policy: serge-testsuite
       =E2=9C=85 Reboot test

    Host 6:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9D=8C Storage blktests - blk
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvme-tcp
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test

  x86_64 (debug):
    Host 1:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =E2=9C=85 xfstests - nfsv4.2
       =E2=9C=85 xfstests - cifsv3.11
       =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
       =E2=9C=85 Reboot test

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 selinux-policy: serge-testsuite
       =E2=9C=85 Reboot test

    Host 3:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 ACPI table test
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9C=85 LTP - syscalls
       =E2=9C=85 LTP - can
       =E2=9C=85 LTP - commands
       =E2=9C=85 LTP - containers
       =E2=9C=85 LTP - dio
       =E2=9C=85 LTP - fs
       =E2=9C=85 LTP - fsx
       =E2=9C=85 LTP - math
       =E2=9C=85 LTP - hugetlb
       =E2=9C=85 LTP - mm
       =E2=9C=85 LTP - nptl
       =E2=9C=85 LTP - pty
       =E2=9C=85 LTP - ipc
       =E2=9C=85 LTP - tracing
       =E2=9C=85 LTP: openposix test suite
       =E2=9D=8C CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking socket: fuzz
       =E2=9C=85 Networking sctp-auth: sockopts test
       =E2=9C=85 Networking: igmp conformance test
       =E2=9C=85 Networking route: pmtu
       =E2=9C=85 Networking route_func - local
       =E2=9C=85 Networking route_func - forward
       =E2=9C=85 Networking TCP: keepalive test
       =E2=9C=85 Networking UDP: socket
       =E2=9C=85 Networking cki netfilter test
       =E2=9C=85 Networking tunnel: geneve basic test
       =E2=9C=85 Networking tunnel: gre basic
       =E2=9C=85 L2TP basic test
       =E2=9C=85 Networking tunnel: vxlan basic
       =E2=9C=85 Networking tunnel: permtest
       =E2=9C=85 Networking VRF: sanity
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9C=85 pciutils: sanity smoke test
       =E2=9C=85 pciutils: update pci ids test
       =E2=9C=85 storage: dm/common
       =E2=9C=85 lvm thinp sanity
       =E2=9C=85 lvm thinp stqe test
       =E2=9C=85 storage: SCSI VPD
       =E2=9C=85 storage: software RAID testing
       =E2=9D=8C Storage: swraid mdadm raid_module test
       =E2=9C=85 Storage: swraid scsi_raid
       =E2=9C=85 storage: targetcli basic
       =E2=9C=85 trace: ftrace/tracer
       =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
       =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - net
       =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - forwarding
       =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - tc
       =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - bpf
       =F0=9F=9A=A7 =E2=9C=85 kselftests upstream - bpf_test_progs
       =F0=9F=9A=A7 =E2=9D=8C Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 Usex - version 1.9-29
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =E2=9D=8C Reboot test

    Host 4:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 CPU: Die Test
       =E2=9C=85 Reboot test

  x86_64:
    Host 1:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 selinux-policy: serge-testsuite
       =E2=9C=85 Reboot test

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 kdump - sysrq-c
       =E2=9C=85 kdump - file-load
       =E2=9C=85 Reboot test

    Host 3:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 machineinfo
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvmeof-m=
p
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test

    Host 4:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 ACPI table test
       =E2=9C=85 i2c: i2cdetect sanity
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9C=85 LTP - syscalls
       =E2=9C=85 LTP - can
       =E2=9C=85 LTP - commands
       =E2=9C=85 LTP - containers
       =E2=9C=85 LTP - dio
       =E2=9C=85 LTP - fs
       =E2=9C=85 LTP - fsx
       =E2=9C=85 LTP - math
       =E2=9C=85 LTP - hugetlb
       =E2=9C=85 LTP - mm
       =E2=9C=85 LTP - nptl
       =E2=9C=85 LTP - pty
       =E2=9C=85 LTP - ipc
       =E2=9C=85 LTP - tracing
       =E2=9C=85 LTP: openposix test suite
       =E2=9D=8C CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 jvm - jcstress tests
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9C=85 Networking bridge: sanity
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking MACsec: sanity
       =E2=9C=85 Networking socket: fuzz
       =E2=9C=85 Networking sctp-auth: sockopts test
       =E2=9C=85 Networking: igmp conformance test
       =E2=9C=85 Networking route: pmtu
       =E2=9C=85 Networking route_func - local
       =E2=9C=85 Networking route_func - forward
       =E2=9C=85 Networking TCP: keepalive test
       =E2=9C=85 Networking UDP: socket
       =E2=9C=85 Networking cki netfilter test
       =E2=9C=85 Networking tunnel: geneve basic test
       =E2=9C=85 Networking tunnel: gre basic
       =E2=9C=85 L2TP basic test
       =E2=9C=85 Networking tunnel: vxlan basic
       =E2=9C=85 Networking tunnel: permtest
       =E2=9C=85 Networking ipsec: basic netns - transport
       =E2=9C=85 Networking ipsec: basic netns - tunnel
       =E2=9C=85 Networking vnic: ipvlan/basic
       =E2=9C=85 Networking VRF: sanity
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9C=85 pciutils: sanity smoke test
       =E2=9C=85 pciutils: update pci ids test
       =E2=9C=85 ALSA PCM loopback test
       =E2=9C=85 ALSA Control (mixer) Userspace Element test
       =E2=9C=85 Storage: block zstd compression test
       =E2=9C=85 Storage: block zstd smoke test
       =E2=9C=85 storage: dm/common
       =E2=9C=85 lvm thinp sanity
       =E2=9C=85 lvm thinp stqe test
       =E2=9C=85 lvm snapper test
       =E2=9C=85 storage: SCSI VPD
       =E2=9C=85 storage: software RAID testing
       =E2=9D=8C Storage: swraid mdadm raid_module test
       =E2=9C=85 Storage: swraid scsi_raid
       =E2=9C=85 storage: targetcli basic
       =E2=9C=85 trace: ftrace/tracer
       =E2=9C=85 kdump - kexec_boot
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as root
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as user
       =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
       =F0=9F=9A=A7 =E2=9D=8C Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 Usex - version 1.9-29
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =F0=9F=9A=A7 =E2=9C=85 kdump - kexec-file-load
       =E2=9D=8C Reboot test

    Host 5:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 CPU: Die Test
       =E2=9C=85 IPMI driver test
       =E2=9C=85 IPMItool loop stress test
       =E2=9C=85 Storage blktests - blk
       =E2=9C=85 Storage block - filesystem fio test
       =E2=9C=85 Storage block - queue scheduler test
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9C=85 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvme-tcp
       =F0=9F=9A=A7 =E2=9D=8C Storage block - storage fio numa
       =E2=9C=85 Reboot test

    Host 6:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =E2=9D=8C xfstests - nfsv4.2
       =E2=9C=85 xfstests - cifsv3.11
       =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
       =E2=9C=85 Reboot test

    Host 7:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =F0=9F=9A=A7 =E2=9C=85 machineinfo
       =E2=9C=85 Boot test
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvmeof-mp
       =E2=9C=85 Reboot test

  Test sources: https://gitlab.com/redhat/centos-stream/tests/kernel/kernel=
-tests
    =F0=9F=92=9A Pull requests are welcome for new tests or improvements to=
 existing tests!

Aborted tests
-------------
Tests that didn't complete running successfully are marked with =E2=9A=A1=
=E2=9A=A1=E2=9A=A1.
If this was caused by an infrastructure issue, we try to mark that
explicitly in the report.

Waived tests
------------
If the test run included waived tests, they are marked with =F0=9F=9A=A7. S=
uch tests are
executed but their results are not taken into account. Tests are waived whe=
n
their results are not reliable enough, e.g. when they're just introduced or=
 are
being fixed.

Testing timeout
---------------
We aim to provide a report within reasonable timeframe. Tests that haven't
finished running yet are marked with =E2=8F=B1.
Targeted tests
--------------
Test runs for patches always include a set of base tests, plus some
tests chosen based on the file paths modified by the patch. The latter
are called "targeted tests". If no targeted tests are run, that means
no patch-specific tests are available. Please, consider contributing a
targeted test for related patches to increase test coverage. See
https://docs.engineering.redhat.com/x/_wEZB for more details.

