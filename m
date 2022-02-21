Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484F47B
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 08:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1645432112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uoNzjI8GBaqsERl0yVMaqAW32dm+25kKNNQuf5ztr5c=;
	b=BttC7zLaE6akQDI6RZrqH+L234JxCCp6609TjDA7lar2HozNNzzqW7f4G/nGqnQp7BbzRa
	Gb0WXk2XL9jKO9U+P5i5t2wWiLYhHiJsi3e/ETrK5kgRGZgawIuXxngUVcjtE0f+HYGMlc
	o20AtZI37+A0UlONwlCUAqtIomxYFoo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-MSQE_nKlO5uEWbtLew-FSw-1; Mon, 21 Feb 2022 03:28:28 -0500
X-MC-Unique: MSQE_nKlO5uEWbtLew-FSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C97D61091DA1
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 08:28:27 +0000 (UTC)
Received: from [172.64.3.29] (unknown [10.30.32.237])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DED5B105C73C;
	Mon, 21 Feb 2022 08:27:46 +0000 (UTC)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: CKI Project <cki-project@redhat.com>
To: skt-results-master@redhat.com, llvm@lists.linux.dev
Subject: =?utf-8?b?4p2M?= FAIL: Test report for kernel 5.17.0-rc4
 (mainline.kernel.org-clang, 3324e6e8)
Date: Mon, 21 Feb 2022 08:27:45 -0000
CC: Bruno Goncalves <bgoncalv@redhat.com>,
 Fendy Tjahjadi <ftjahjad@redhat.com>, Memory Management <mm-qe@redhat.com>,
 Li Wang <liwang@redhat.com>, Jan Stancek <jstancek@redhat.com>,
 Fei Liu <feliu@redhat.com>, Guangwu Zhang <guazhang@redhat.com>,
 Xiong Zhou <xzhou@redhat.com>, Xiaowu Wu <xiawu@redhat.com>,
 Baoquan He <bhe@redhat.com>, Jiri Dluhos <jdluhos@redhat.com>,
 Hangbin Liu <haliu@redhat.com>, Ziqian Sun <zsun@redhat.com>,
 Milos Malik <mmalik@redhat.com>, Ondrej Mosnacek <omosnace@redhat.com>,
 David Arcari <darcari@redhat.com>, Jeff Bastian <jbastian@redhat.com>
Message-ID: <cki.XO403G7FRT6CPGP8N0S3@redhat.com>
X-Gitlab-Pipeline-ID: 475315678
X-Gitlab-Url: https://gitlab.com
X-Gitlab-Path: =?utf-8?q?/redhat/red-hat-ci-tools/kernel/cki-internal-pipeli?=
 =?utf-8?q?nes/cki-trusted-contributors/pipelines/475315678?=
X-DataWarehouse-Checkout-IID: 33055
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cki-project@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable



Check out this report and any autotriaged failures in our web dashboard:
    https://datawarehouse.cki-project.org/kcidb/checkouts/33055

Hello,

We ran automated tests on a recent commit from this kernel tree:

       Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git
            Commit: 3324e6e80315 - Merge tag 'locking_urgent_for_v5.17_rc5'=
 of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip

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
fix=3Ddatawarehouse-public/2022/02/20/475315678

One or more kernel tests failed:

    s390x:
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C LTP - syscalls
     =E2=9D=8C Networking bridge: sanity
     =E2=9D=8C storage: dm/common

    aarch64:
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C kdump - sysrq-c
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Networking bridge: sanity - mlx5
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C LTP - syscalls
     =E2=9D=8C Networking bridge: sanity

    ppc64le:
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test

    x86_64 (debug):
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C LTP - syscalls
     =E2=9D=8C storage: dm/common

    x86_64:
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C kdump - sysrq-c
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C LTP - syscalls
     =E2=9D=8C Networking bridge: sanity
     =E2=9D=8C storage: dm/common
     =E2=9D=8C trace: ftrace/tracer
     =E2=9D=8C kdump - kexec_boot
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test
     =E2=9D=8C selinux-policy: serge-testsuite
     =F0=9F=92=A5 stress: stress-ng - os
     =E2=9D=8C Boot test
     =E2=9D=8C Reboot test

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
      net: OK
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
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =E2=9C=85 IPMI driver test
       =E2=9C=85 IPMItool loop stress test
       =E2=9C=85 selinux-policy: serge-testsuite
       =E2=9C=85 Storage blktests - blk
       =E2=9C=85 Storage block - filesystem fio test
       =E2=9C=85 Storage block - queue scheduler test
       =E2=9C=85 storage: software RAID testing
       =E2=9C=85 Storage: swraid mdadm raid_module test
       =E2=9C=85 stress: stress-ng - interrupt
       =E2=9C=85 stress: stress-ng - cpu
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9C=85 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as root
       =F0=9F=9A=A7 =E2=9C=85 Podman system test - as user
       =F0=9F=9A=A7 =E2=9D=8C xfstests - btrfs
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - nvme-tcp
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage block - storage fio=
 numa
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm cache test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng - os

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9D=8C kdump - sysrq-c

    Host 3:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp

    Host 4:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ACPI table test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ACPI enabled test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - cve
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - sched
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - syscalls
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - can
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - commands
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - containers
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - dio
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fs
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fsx
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - math
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - hugetlb
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - mm
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - nptl
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - pty
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - ipc
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - tracing
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory: fork_mem
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking cki netfilter test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - transpor=
t
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Libkcapi AF_ALG test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 pciutils: update pci ids test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA PCM loopback test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA Control (mixer) Userspace Element t=
est
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm snapper test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: SCSI VPD
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - kexec_boot
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 i2c: i2cdetect sanity
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Firmware test suite
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking: igmp conformanc=
e test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test

    Host 5:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvmeof-mp

    Host 6:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9D=8C Networking bridge: sanity - mlx5
       =E2=9C=85 Ethernet drivers sanity - mlx5

    Host 7:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 ACPI table test
       =E2=9C=85 ACPI enabled test
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9D=8C LTP - syscalls
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
       =E2=9C=85 CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 jvm - jcstress tests
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9D=8C Networking bridge: sanity
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking socket: fuzz
       =E2=9C=85 Networking route: pmtu
       =E2=9C=85 Networking route_func - local
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking cki netfilter test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - transpor=
t
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Libkcapi AF_ALG test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 pciutils: update pci ids test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA PCM loopback test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA Control (mixer) Userspace Element t=
est
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm snapper test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: SCSI VPD
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - kexec_boot
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 i2c: i2cdetect sanity
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Firmware test suite
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking: igmp conformanc=
e test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test

  ppc64le:
    Host 1:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - cve
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - sched
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - syscalls
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - can
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - commands
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - containers
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - dio
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fs
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fsx
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - math
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - hugetlb
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - mm
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - nptl
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - pty
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - ipc
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - tracing
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory: fork_mem
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking cki netfilter test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Libkcapi AF_ALG test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 pciutils: update pci ids test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA PCM loopback test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA Control (mixer) Userspace Element t=
est
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm snapper test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 xarray-idr-radixtree-test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 kdump - sysrq-c
       =E2=9C=85 kdump - file-load

    Host 3:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp

    Host 4:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mapper =
test - upstream
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm cache test

    Host 5:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - cve
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - sched
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - syscalls
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - can
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - commands
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - containers
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - dio
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fs
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - fsx
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - math
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - hugetlb
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - mm
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - nptl
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - pty
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - ipc
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP - tracing
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP: openposix test suite
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory: fork_mem
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking socket: fuzz
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking cki netfilter test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunnel
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Libkcapi AF_ALG test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 pciutils: update pci ids test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA PCM loopback test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 ALSA Control (mixer) Userspace Element t=
est
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 storage: dm/common
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm snapper test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 xarray-idr-radixtree-test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite test

    Host 6:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp

  s390x:
    Host 1:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 selinux-policy: serge-testsuite
       =E2=9C=85 Storage blktests - blk
       =E2=9C=85 Storage: swraid mdadm raid_module test
       =E2=9C=85 stress: stress-ng - interrupt
       =E2=9C=85 stress: stress-ng - cpu
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9C=85 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as root
       =F0=9F=9A=A7 =E2=9C=85 Podman system test - as user
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvme-tcp
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =F0=9F=9A=A7 =E2=9C=85 stress: stress-ng - os

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvmeof-mp

    Host 3:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 kdump - sysrq-c
       =E2=9C=85 kdump - file-load

    Host 4:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9D=8C LTP - syscalls
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
       =E2=9C=85 CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 jvm - jcstress tests
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9D=8C Networking bridge: sanity
       =E2=9C=85 Ethernet drivers sanity
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
       =E2=9C=85 Networking ipsec: basic netns - transport
       =E2=9C=85 Networking ipsec: basic netns - tunnel
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9D=8C storage: dm/common
       =E2=9C=85 lvm snapper test
       =E2=9C=85 trace: ftrace/tracer
       =E2=9C=85 kdump - kexec_boot
       =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test

  x86_64 (debug):
    Host 1:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =E2=9C=85 xfstests - nfsv4.2
       =E2=9C=85 xfstests - cifsv3.11
       =E2=9C=85 selinux-policy: serge-testsuite
       =E2=9C=85 storage: software RAID testing
       =E2=9C=85 Storage: swraid mdadm raid_module test
       =E2=9C=85 stress: stress-ng - interrupt
       =E2=9C=85 stress: stress-ng - cpu
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9C=85 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9C=85 CPU: Idle Test
       =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mapper =
test - upstream
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =F0=9F=9A=A7 =E2=9C=85 stress: stress-ng - os

    Host 2:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 ACPI table test
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9D=8C LTP - syscalls
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
       =E2=9C=85 CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking socket: fuzz
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
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9C=85 pciutils: sanity smoke test
       =E2=9C=85 pciutils: update pci ids test
       =E2=9D=8C storage: dm/common
       =E2=9C=85 storage: SCSI VPD
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
       =F0=9F=9A=A7 =E2=9D=8C xarray-idr-radixtree-test
       =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
       =F0=9F=9A=A7 =E2=9D=8C kselftests upstream - net
       =F0=9F=9A=A7 =E2=9D=8C Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 Networking: igmp conformance test

  x86_64:
    Host 1:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9D=8C kdump - sysrq-c
       =E2=9C=85 kdump - file-load

    Host 2:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 ACPI table test
       =E2=9C=85 LTP - cve
       =E2=9C=85 LTP - sched
       =E2=9D=8C LTP - syscalls
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
       =E2=9C=85 CIFS Connectathon
       =E2=9C=85 POSIX pjd-fstest suites
       =E2=9C=85 Loopdev Sanity
       =E2=9C=85 jvm - jcstress tests
       =E2=9C=85 Memory: fork_mem
       =E2=9C=85 Memory function: memfd_create
       =E2=9C=85 AMTU (Abstract Machine Test Utility)
       =E2=9D=8C Networking bridge: sanity
       =E2=9C=85 Ethernet drivers sanity
       =E2=9C=85 Networking socket: fuzz
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
       =E2=9C=85 Networking ipsec: basic netns - transport
       =E2=9C=85 Networking ipsec: basic netns - tunnel
       =E2=9C=85 Libkcapi AF_ALG test
       =E2=9C=85 pciutils: sanity smoke test
       =E2=9C=85 pciutils: update pci ids test
       =E2=9C=85 ALSA PCM loopback test
       =E2=9C=85 ALSA Control (mixer) Userspace Element test
       =E2=9D=8C storage: dm/common
       =E2=9C=85 lvm snapper test
       =E2=9C=85 storage: SCSI VPD
       =E2=9D=8C trace: ftrace/tracer
       =E2=9D=8C kdump - kexec_boot
       =F0=9F=9A=A7 =E2=9D=8C xarray-idr-radixtree-test
       =F0=9F=9A=A7 =E2=9C=85 i2c: i2cdetect sanity
       =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
       =F0=9F=9A=A7 =E2=9D=8C Memory function: kaslr
       =F0=9F=9A=A7 =E2=9C=85 Networking: igmp conformance test
       =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test

    Host 3:
       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvmeof-mp

    Host 4:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =E2=9C=85 xfstests - ext4
       =E2=9C=85 xfstests - xfs
       =E2=9C=85 xfstests - nfsv4.2
       =E2=9C=85 xfstests - cifsv3.11
       =E2=9C=85 IPMI driver test
       =E2=9C=85 IPMItool loop stress test
       =E2=9D=8C selinux-policy: serge-testsuite
       =E2=9C=85 Storage blktests - blk
       =E2=9C=85 Storage block - filesystem fio test
       =E2=9C=85 Storage block - queue scheduler test
       =E2=9C=85 storage: software RAID testing
       =E2=9C=85 Storage: swraid mdadm raid_module test
       =E2=9C=85 stress: stress-ng - interrupt
       =E2=9C=85 stress: stress-ng - cpu
       =E2=9C=85 stress: stress-ng - cpu-cache
       =E2=9C=85 stress: stress-ng - memory
       =F0=9F=9A=A7 =E2=9D=8C Podman system test - as root
       =F0=9F=9A=A7 =E2=9C=85 Podman system test - as user
       =F0=9F=9A=A7 =E2=9D=8C CPU: Idle Test
       =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
       =F0=9F=9A=A7 =E2=9C=85 Storage blktests - nvme-tcp
       =F0=9F=9A=A7 =E2=9C=85 Storage block - storage fio numa
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mapper =
test - upstream
       =F0=9F=9A=A7 =E2=9C=85 lvm cache test
       =F0=9F=9A=A7 =F0=9F=92=A5 stress: stress-ng - os

    Host 5:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp

    Host 6:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 SELinux Custom Module Setup
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
       =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp

    Host 7:

       =E2=9A=A1 Internal infrastructure issues prevented one or more tests=
 (marked
       with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architecture.
       This is not the fault of the kernel that was tested.

       =F0=9F=9A=A7 =E2=9C=85 SELinux Custom Module Setup
       =E2=9D=8C Boot test
       =E2=9D=8C Reboot test
       =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests - srp

  Test sources: https://gitlab.com/cki-project/kernel-tests
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

