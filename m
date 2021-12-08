Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8FB2C9D
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 03:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638933301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cGzmIeCy1bBWK02GSDUg7kT3BzDYDnRtHJbuFH/GV8g=;
	b=bsV01sQvv7EC8eRGRZkTfo1hyPq2gA4dAFYYaoWd6X88FGqMwqt6cBsyenhU8B6Vd8WAcN
	uKqlQWqwGN8Pxus0l9auzTldb/ufwWMC/Y/xG+0L37xL3U3zOijebuaiDUo6IhcHVXeeIy
	230cG2RzIqpfhiSlHtArrKKdMWfSxds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-QU3zHUB-PtKqpHMA8oWskg-1; Tue, 07 Dec 2021 22:14:56 -0500
X-MC-Unique: QU3zHUB-PtKqpHMA8oWskg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B32F12D0
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 03:14:55 +0000 (UTC)
Received: from localhost (ovpn-12-91.pek2.redhat.com [10.72.12.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13C8245D70;
	Wed,  8 Dec 2021 03:14:53 +0000 (UTC)
Date: Wed, 8 Dec 2021 11:14:51 +0800
From: Baoquan He <bhe@redhat.com>
To: CKI Project <cki-project@redhat.com>
Cc: skt-results-master@redhat.com, llvm@lists.linux.dev,
	Xiaowu Wu <xiawu@redhat.com>, Ziqian Sun <zsun@redhat.com>,
	Jiri Dluhos <jdluhos@redhat.com>, Milos Malik <mmalik@redhat.com>,
	Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: =?utf-8?Q?=E2=9D=8C_FAIL=3A_Test_repor?= =?utf-8?Q?t?= for
 kernel 5.16.0-rc4 (mainline.kernel.org-clang, cd8c917a)
Message-ID: <20211208031451.GA2062@MiWiFi-R3L-srv>
References: <cki.KR8DV5RYSQY9UFHO0SDJ@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cki.KR8DV5RYSQY9UFHO0SDJ@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bhe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On 12/08/21 at 01:43am, CKI Project wrote:
> 
> 
> Check out this report and any autotriaged failures in our web dashboard:
>     https://datawarehouse.cki-project.org/kcidb/checkouts/26271
> 
> Hello,
> 
> We ran automated tests on a recent commit from this kernel tree:
> 
>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>             Commit: cd8c917a56f2 - Makefile: Do not quote value for CONFIG_CC_IMPLICIT_FALLTHROUGH
> 
> The results of these automated tests are provided below.
> 
>     Overall result: FAILED (see details below)
>              Merge: OK
>            Compile: OK
>  Selftests compile: FAILED
>              Tests: FAILED
>     Targeted tests: NO
> 
> All kernel binaries, config files, and logs are available for download here:
> 
>   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?prefix=datawarehouse-public/2021/12/07/423882010
> 
> One or more kernel tests failed:
> 
>     aarch64:
>      ❌ kdump - sysrq-c

For this kdump failure on arm64, I have created a bug to track it,
Pingfan is working on that to find out root cause.

    [Bug 2028043] readpage_elf: Attempt to read non-existent page at 0x0
    https://bugzilla.redhat.com/show_bug.cgi?id=2028043

> 
>     x86_64:
>      ❌ trace: ftrace/tracer
>      ❌ kdump - sysrq-c

Is there anything wrong? I checked x86_64 builds, only saw a 
kselftest build - bpf failure, no other error.


>      ❌ selinux-policy: serge-testsuite
> 
> We hope that these logs can help you find the problem quickly. For the full
> detail on our testing procedures, please scroll to the bottom of this message.
> 
> Please reply to this email if you have any questions about the tests that we
> ran or if you have any suggestions on how to make future tests more effective.
> 
>         ,-.   ,-.
>        ( C ) ( K )  Continuous
>         `-',-.`-'   Kernel
>           ( I )     Integration
>            `-'
> ______________________________________________________________________________
> 
> Compile testing
> ---------------
> 
> We compiled the kernel for 5 architectures:
> 
>     aarch64:
>       make options: make LLVM=1 -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
>     ppc64le:
>       make options: make CC=clang LLVM_IAS=0 -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
>     s390x:
>       make options: make CC=clang LLVM_IAS=0 -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
>     x86_64:
>       make options: make LLVM=1 -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
>     x86_64:
>       make options: make LLVM=1 -j24 INSTALL_MOD_STRIP=1 targz-pkg
> 
> 
> We built the following selftests:
> 
>   x86_64:
>       net: OK
>       bpf: fail
>       seccomp: OK
>       lkdtm: OK
>       install and packaging: OK
> 
> You can find the full log (build-selftests.log) in the artifact storage above.
> 
> 
> Hardware testing
> ----------------
> We booted each kernel and ran the following tests:
> 
>   aarch64:
>     Host 1:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ ACPI table test
>        ⚡⚡⚡ ACPI enabled test
>        ⚡⚡⚡ LTP - cve
>        ⚡⚡⚡ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ jvm - jcstress tests
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Networking bridge: sanity
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking socket: fuzz
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Networking ipsec: basic netns - transport
>        ⚡⚡⚡ Networking ipsec: basic netns - tunnel
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ pciutils: update pci ids test
>        ⚡⚡⚡ ALSA PCM loopback test
>        ⚡⚡⚡ ALSA Control (mixer) Userspace Element test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ storage: SCSI VPD
>        ⚡⚡⚡ trace: ftrace/tracer
>        ⚡⚡⚡ kdump - kexec_boot
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ i2c: i2cdetect sanity
>        🚧 ⚡⚡⚡ Firmware test suite
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ Networking: igmp conformance test
>        🚧 ⚡⚡⚡ audit: audit testsuite test
> 
>     Host 2:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        🚧 ⚡⚡⚡ Storage blktests - srp
> 
>     Host 3:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ Networking bridge: sanity - mlx5
>        ⚡⚡⚡ Ethernet drivers sanity - mlx5
> 
>     Host 4:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        ✅ xfstests - ext4
>        ✅ xfstests - xfs
>        ✅ IPMI driver test
>        ✅ IPMItool loop stress test
>        ✅ selinux-policy: serge-testsuite
>        ✅ Storage blktests - blk
>        ✅ Storage block - filesystem fio test
>        ✅ Storage block - queue scheduler test
>        ✅ storage: software RAID testing
>        ✅ Storage: swraid mdadm raid_module test
>        ⚡⚡⚡ stress: stress-ng - interrupt
>        ⚡⚡⚡ stress: stress-ng - cpu
>        ⚡⚡⚡ stress: stress-ng - cpu-cache
>        ⚡⚡⚡ stress: stress-ng - memory
>        🚧 ⚡⚡⚡ Podman system test - as root
>        🚧 ⚡⚡⚡ Podman system test - as user
>        🚧 ⚡⚡⚡ xfstests - btrfs
>        🚧 ⚡⚡⚡ Storage blktests - nvme-tcp
>        🚧 ⚡⚡⚡ lvm cache test
>        🚧 ⚡⚡⚡ stress: stress-ng - os
> 
>     Host 5:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        🚧 ⚡⚡⚡ Storage blktests - nvmeof-mp
> 
>     Host 6:
>        ✅ Boot test
>        ✅ Reboot test
>        ❌ kdump - sysrq-c
> 
>     Host 7:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ ACPI table test
>        ⚡⚡⚡ ACPI enabled test
>        ⚡⚡⚡ LTP - cve
>        ⚡⚡⚡ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ jvm - jcstress tests
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Networking bridge: sanity
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking socket: fuzz
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Networking ipsec: basic netns - transport
>        ⚡⚡⚡ Networking ipsec: basic netns - tunnel
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ pciutils: update pci ids test
>        ⚡⚡⚡ ALSA PCM loopback test
>        ⚡⚡⚡ ALSA Control (mixer) Userspace Element test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ storage: SCSI VPD
>        ⚡⚡⚡ trace: ftrace/tracer
>        ⚡⚡⚡ kdump - kexec_boot
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ i2c: i2cdetect sanity
>        🚧 ⚡⚡⚡ Firmware test suite
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ Networking: igmp conformance test
>        🚧 ⚡⚡⚡ audit: audit testsuite test
> 
>     Host 8:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ Networking bridge: sanity - mlx5
>        ⚡⚡⚡ Ethernet drivers sanity - mlx5
> 
>   ppc64le:
>     Host 1:
>        ✅ Boot test
>        ✅ Reboot test
>        🚧 ✅ Storage blktests - srp
> 
>     Host 2:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ LTP - cve
>        ⚡⚡⚡ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ jvm - jcstress tests
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Networking bridge: sanity
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking socket: fuzz
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Networking ipsec: basic netns - tunnel
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ pciutils: update pci ids test
>        ⚡⚡⚡ ALSA PCM loopback test
>        ⚡⚡⚡ ALSA Control (mixer) Userspace Element test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ trace: ftrace/tracer
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ audit: audit testsuite test
> 
>     Host 3:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        🚧 ⚡⚡⚡ Storage: lvm device-mapper test - upstream
>        🚧 ✅ lvm cache test
> 
>     Host 4:
>        ✅ Boot test
>        ✅ Reboot test
>        ✅ kdump - sysrq-c
>        ✅ kdump - file-load
> 
>     Host 5:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ LTP - cve
>        ⚡⚡⚡ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ jvm - jcstress tests
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Networking bridge: sanity
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking socket: fuzz
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Networking ipsec: basic netns - tunnel
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ pciutils: update pci ids test
>        ⚡⚡⚡ ALSA PCM loopback test
>        ⚡⚡⚡ ALSA Control (mixer) Userspace Element test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ trace: ftrace/tracer
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ audit: audit testsuite test
> 
>     Host 6:
>        ✅ Boot test
>        ✅ Reboot test
>        ✅ LTP - cve
>        ✅ LTP - sched
>        ✅ LTP - syscalls
>        ✅ LTP - can
>        ✅ LTP - commands
>        ✅ LTP - containers
>        ✅ LTP - dio
>        ✅ LTP - fs
>        ✅ LTP - fsx
>        ✅ LTP - math
>        ✅ LTP - hugetlb
>        ✅ LTP - mm
>        ✅ LTP - nptl
>        ✅ LTP - pty
>        ✅ LTP - ipc
>        ✅ LTP - tracing
>        ✅ LTP: openposix test suite
>        ✅ CIFS Connectathon
>        ✅ POSIX pjd-fstest suites
>        ✅ Loopdev Sanity
>        ✅ jvm - jcstress tests
>        ✅ Memory: fork_mem
>        ✅ Memory function: memfd_create
>        ✅ AMTU (Abstract Machine Test Utility)
>        ✅ Networking bridge: sanity
>        ✅ Ethernet drivers sanity
>        ✅ Networking socket: fuzz
>        ✅ Networking route: pmtu
>        ✅ Networking route_func - local
>        ✅ Networking route_func - forward
>        ✅ Networking TCP: keepalive test
>        ✅ Networking UDP: socket
>        ✅ Networking cki netfilter test
>        ✅ Networking tunnel: geneve basic test
>        ✅ Networking tunnel: gre basic
>        ✅ L2TP basic test
>        ✅ Networking tunnel: vxlan basic
>        ✅ Networking ipsec: basic netns - tunnel
>        ✅ Libkcapi AF_ALG test
>        ✅ pciutils: update pci ids test
>        ✅ ALSA PCM loopback test
>        ✅ ALSA Control (mixer) Userspace Element test
>        ✅ storage: dm/common
>        ✅ lvm snapper test
>        ✅ trace: ftrace/tracer
>        🚧 ✅ xarray-idr-radixtree-test
>        🚧 ✅ Memory function: kaslr
>        🚧 ✅ audit: audit testsuite test
> 
>   s390x:
>     Host 1:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        ✅ LTP - cve
>        ✅ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ jvm - jcstress tests
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Networking bridge: sanity
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Networking ipsec: basic netns - transport
>        ⚡⚡⚡ Networking ipsec: basic netns - tunnel
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ trace: ftrace/tracer
>        ⚡⚡⚡ kdump - kexec_boot
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ audit: audit testsuite test
> 
>     Host 2:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ selinux-policy: serge-testsuite
>        ⚡⚡⚡ Storage blktests - blk
>        ⚡⚡⚡ Storage: swraid mdadm raid_module test
>        ⚡⚡⚡ stress: stress-ng - interrupt
>        ⚡⚡⚡ stress: stress-ng - cpu
>        ⚡⚡⚡ stress: stress-ng - cpu-cache
>        ⚡⚡⚡ stress: stress-ng - memory
>        🚧 ⚡⚡⚡ Podman system test - as root
>        🚧 ⚡⚡⚡ Podman system test - as user
>        🚧 ⚡⚡⚡ Storage blktests - nvme-tcp
>        🚧 ⚡⚡⚡ lvm cache test
>        🚧 ⚡⚡⚡ stress: stress-ng - os
> 
>     Host 3:
>        ✅ Boot test
>        ✅ Reboot test
>        🚧 ✅ Storage blktests - srp
> 
>     Host 4:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        ⚡⚡⚡ kdump - sysrq-c
>        ⚡⚡⚡ kdump - file-load
> 
>     Host 5:
>        ✅ Boot test
>        ✅ Reboot test
>        🚧 ✅ Storage blktests - nvmeof-mp
> 
>     Host 6:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        ⚡⚡⚡ kdump - sysrq-c
>        ⚡⚡⚡ kdump - file-load
> 
>     Host 7:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        ⚡⚡⚡ kdump - sysrq-c
>        ⚡⚡⚡ kdump - file-load
> 
>   x86_64 (debug):
>     Host 1:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ xfstests - ext4
>        ⚡⚡⚡ xfstests - xfs
>        ⚡⚡⚡ xfstests - nfsv4.2
>        ⚡⚡⚡ xfstests - cifsv3.11
>        ⚡⚡⚡ selinux-policy: serge-testsuite
>        ⚡⚡⚡ storage: software RAID testing
>        ⚡⚡⚡ Storage: swraid mdadm raid_module test
>        ⚡⚡⚡ stress: stress-ng - interrupt
>        ⚡⚡⚡ stress: stress-ng - cpu
>        ⚡⚡⚡ stress: stress-ng - cpu-cache
>        ⚡⚡⚡ stress: stress-ng - memory
>        🚧 ⚡⚡⚡ CPU: Idle Test
>        🚧 ⚡⚡⚡ xfstests - btrfs
>        🚧 ⚡⚡⚡ Storage: lvm device-mapper test - upstream
>        🚧 ⚡⚡⚡ lvm cache test
>        🚧 ⚡⚡⚡ stress: stress-ng - os
> 
>     Host 2:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ ACPI table test
>        ⚡⚡⚡ LTP - cve
>        ⚡⚡⚡ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking socket: fuzz
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ pciutils: sanity smoke test
>        ⚡⚡⚡ pciutils: update pci ids test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ storage: SCSI VPD
>        ⚡⚡⚡ trace: ftrace/tracer
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ Firmware test suite
>        🚧 ⚡⚡⚡ kselftests upstream - net
>        🚧 ⚡⚡⚡ kselftests upstream - forwarding
>        🚧 ⚡⚡⚡ kselftests upstream - tc
>        🚧 ⚡⚡⚡ kselftests upstream - bpf
>        🚧 ⚡⚡⚡ kselftests upstream - bpf_test_progs
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ Networking: igmp conformance test
> 
>     Host 3:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ ACPI table test
>        ⚡⚡⚡ LTP - cve
>        ⚡⚡⚡ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking socket: fuzz
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ pciutils: sanity smoke test
>        ⚡⚡⚡ pciutils: update pci ids test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ storage: SCSI VPD
>        ⚡⚡⚡ trace: ftrace/tracer
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ Firmware test suite
>        🚧 ⚡⚡⚡ kselftests upstream - net
>        🚧 ⚡⚡⚡ kselftests upstream - forwarding
>        🚧 ⚡⚡⚡ kselftests upstream - tc
>        🚧 ⚡⚡⚡ kselftests upstream - bpf
>        🚧 ⚡⚡⚡ kselftests upstream - bpf_test_progs
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ Networking: igmp conformance test
> 
>     Host 4:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ ACPI table test
>        ⚡⚡⚡ LTP - cve
>        ⚡⚡⚡ LTP - sched
>        ⚡⚡⚡ LTP - syscalls
>        ⚡⚡⚡ LTP - can
>        ⚡⚡⚡ LTP - commands
>        ⚡⚡⚡ LTP - containers
>        ⚡⚡⚡ LTP - dio
>        ⚡⚡⚡ LTP - fs
>        ⚡⚡⚡ LTP - fsx
>        ⚡⚡⚡ LTP - math
>        ⚡⚡⚡ LTP - hugetlb
>        ⚡⚡⚡ LTP - mm
>        ⚡⚡⚡ LTP - nptl
>        ⚡⚡⚡ LTP - pty
>        ⚡⚡⚡ LTP - ipc
>        ⚡⚡⚡ LTP - tracing
>        ⚡⚡⚡ LTP: openposix test suite
>        ⚡⚡⚡ CIFS Connectathon
>        ⚡⚡⚡ POSIX pjd-fstest suites
>        ⚡⚡⚡ Loopdev Sanity
>        ⚡⚡⚡ Memory: fork_mem
>        ⚡⚡⚡ Memory function: memfd_create
>        ⚡⚡⚡ AMTU (Abstract Machine Test Utility)
>        ⚡⚡⚡ Ethernet drivers sanity
>        ⚡⚡⚡ Networking socket: fuzz
>        ⚡⚡⚡ Networking route: pmtu
>        ⚡⚡⚡ Networking route_func - local
>        ⚡⚡⚡ Networking route_func - forward
>        ⚡⚡⚡ Networking TCP: keepalive test
>        ⚡⚡⚡ Networking UDP: socket
>        ⚡⚡⚡ Networking cki netfilter test
>        ⚡⚡⚡ Networking tunnel: geneve basic test
>        ⚡⚡⚡ Networking tunnel: gre basic
>        ⚡⚡⚡ L2TP basic test
>        ⚡⚡⚡ Networking tunnel: vxlan basic
>        ⚡⚡⚡ Libkcapi AF_ALG test
>        ⚡⚡⚡ pciutils: sanity smoke test
>        ⚡⚡⚡ pciutils: update pci ids test
>        ⚡⚡⚡ storage: dm/common
>        ⚡⚡⚡ lvm snapper test
>        ⚡⚡⚡ storage: SCSI VPD
>        ⚡⚡⚡ trace: ftrace/tracer
>        🚧 ⚡⚡⚡ xarray-idr-radixtree-test
>        🚧 ⚡⚡⚡ Firmware test suite
>        🚧 ⚡⚡⚡ kselftests upstream - net
>        🚧 ⚡⚡⚡ kselftests upstream - forwarding
>        🚧 ⚡⚡⚡ kselftests upstream - tc
>        🚧 ⚡⚡⚡ kselftests upstream - bpf
>        🚧 ⚡⚡⚡ kselftests upstream - bpf_test_progs
>        🚧 ⚡⚡⚡ Memory function: kaslr
>        🚧 ⚡⚡⚡ Networking: igmp conformance test
> 
>   x86_64:
>     Host 1:
>        ✅ Boot test
>        ✅ Reboot test
>        ✅ ACPI table test
>        ✅ LTP - cve
>        ✅ LTP - sched
>        ✅ LTP - syscalls
>        ✅ LTP - can
>        ✅ LTP - commands
>        ✅ LTP - containers
>        ✅ LTP - dio
>        ✅ LTP - fs
>        ✅ LTP - fsx
>        ✅ LTP - math
>        ✅ LTP - hugetlb
>        ✅ LTP - mm
>        ✅ LTP - nptl
>        ✅ LTP - pty
>        ✅ LTP - ipc
>        ✅ LTP - tracing
>        ✅ LTP: openposix test suite
>        ✅ CIFS Connectathon
>        ✅ POSIX pjd-fstest suites
>        ✅ Loopdev Sanity
>        ✅ jvm - jcstress tests
>        ✅ Memory: fork_mem
>        ✅ Memory function: memfd_create
>        ✅ AMTU (Abstract Machine Test Utility)
>        ✅ Networking bridge: sanity
>        ✅ Ethernet drivers sanity
>        ✅ Networking socket: fuzz
>        ✅ Networking route: pmtu
>        ✅ Networking route_func - local
>        ✅ Networking route_func - forward
>        ✅ Networking TCP: keepalive test
>        ✅ Networking UDP: socket
>        ✅ Networking cki netfilter test
>        ✅ Networking tunnel: geneve basic test
>        ✅ Networking tunnel: gre basic
>        ✅ L2TP basic test
>        ✅ Networking tunnel: vxlan basic
>        ✅ Networking ipsec: basic netns - transport
>        ✅ Networking ipsec: basic netns - tunnel
>        ✅ Libkcapi AF_ALG test
>        ✅ pciutils: sanity smoke test
>        ✅ pciutils: update pci ids test
>        ✅ ALSA PCM loopback test
>        ✅ ALSA Control (mixer) Userspace Element test
>        ✅ storage: dm/common
>        ✅ lvm snapper test
>        ✅ storage: SCSI VPD
>        ❌ trace: ftrace/tracer
>        ✅ kdump - kexec_boot
>        🚧 ✅ xarray-idr-radixtree-test
>        🚧 ✅ i2c: i2cdetect sanity
>        🚧 ❌ Firmware test suite
>        🚧 ✅ Memory function: kaslr
>        🚧 ✅ Networking: igmp conformance test
>        🚧 ✅ audit: audit testsuite test
> 
>     Host 2:
>        ✅ Boot test
>        ✅ Reboot test
>        🚧 ✅ Storage blktests - nvmeof-mp
> 
>     Host 3:
>        ✅ Boot test
>        ✅ Reboot test
>        🚧 ✅ Storage blktests - srp
> 
>     Host 4:
>        ✅ Boot test
>        ✅ Reboot test
>        ❌ kdump - sysrq-c
>        ✅ kdump - file-load
> 
>     Host 5:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ xfstests - ext4
>        ⚡⚡⚡ xfstests - xfs
>        ⚡⚡⚡ xfstests - nfsv4.2
>        ⚡⚡⚡ xfstests - cifsv3.11
>        ⚡⚡⚡ IPMI driver test
>        ⚡⚡⚡ IPMItool loop stress test
>        ⚡⚡⚡ selinux-policy: serge-testsuite
>        ⚡⚡⚡ Storage blktests - blk
>        ⚡⚡⚡ Storage block - filesystem fio test
>        ⚡⚡⚡ Storage block - queue scheduler test
>        ⚡⚡⚡ storage: software RAID testing
>        ⚡⚡⚡ Storage: swraid mdadm raid_module test
>        ⚡⚡⚡ stress: stress-ng - interrupt
>        ⚡⚡⚡ stress: stress-ng - cpu
>        ⚡⚡⚡ stress: stress-ng - cpu-cache
>        ⚡⚡⚡ stress: stress-ng - memory
>        🚧 ⚡⚡⚡ Podman system test - as root
>        🚧 ⚡⚡⚡ Podman system test - as user
>        🚧 ⚡⚡⚡ CPU: Idle Test
>        🚧 ⚡⚡⚡ xfstests - btrfs
>        🚧 ⚡⚡⚡ Storage blktests - nvme-tcp
>        🚧 ⚡⚡⚡ Storage nvdimm ndctl test suite
>        🚧 ⚡⚡⚡ Storage: lvm device-mapper test - upstream
>        🚧 ⚡⚡⚡ lvm cache test
>        🚧 ⚡⚡⚡ stress: stress-ng - os
> 
>     Host 6:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ⚡⚡⚡ Boot test
>        ⚡⚡⚡ Reboot test
>        ⚡⚡⚡ xfstests - ext4
>        ⚡⚡⚡ xfstests - xfs
>        ⚡⚡⚡ xfstests - nfsv4.2
>        ⚡⚡⚡ xfstests - cifsv3.11
>        ⚡⚡⚡ IPMI driver test
>        ⚡⚡⚡ IPMItool loop stress test
>        ⚡⚡⚡ selinux-policy: serge-testsuite
>        ⚡⚡⚡ Storage blktests - blk
>        ⚡⚡⚡ Storage block - filesystem fio test
>        ⚡⚡⚡ Storage block - queue scheduler test
>        ⚡⚡⚡ storage: software RAID testing
>        ⚡⚡⚡ Storage: swraid mdadm raid_module test
>        ⚡⚡⚡ stress: stress-ng - interrupt
>        ⚡⚡⚡ stress: stress-ng - cpu
>        ⚡⚡⚡ stress: stress-ng - cpu-cache
>        ⚡⚡⚡ stress: stress-ng - memory
>        🚧 ⚡⚡⚡ Podman system test - as root
>        🚧 ⚡⚡⚡ Podman system test - as user
>        🚧 ⚡⚡⚡ CPU: Idle Test
>        🚧 ⚡⚡⚡ xfstests - btrfs
>        🚧 ⚡⚡⚡ Storage blktests - nvme-tcp
>        🚧 ⚡⚡⚡ Storage nvdimm ndctl test suite
>        🚧 ⚡⚡⚡ Storage: lvm device-mapper test - upstream
>        🚧 ⚡⚡⚡ lvm cache test
>        🚧 ⚡⚡⚡ stress: stress-ng - os
> 
>     Host 7:
> 
>        ⚡ Internal infrastructure issues prevented one or more tests (marked
>        with ⚡⚡⚡) from running on this architecture.
>        This is not the fault of the kernel that was tested.
> 
>        ✅ Boot test
>        ✅ Reboot test
>        ✅ xfstests - ext4
>        ✅ xfstests - xfs
>        ✅ xfstests - nfsv4.2
>        ✅ xfstests - cifsv3.11
>        ✅ IPMI driver test
>        ✅ IPMItool loop stress test
>        ❌ selinux-policy: serge-testsuite
>        ✅ Storage blktests - blk
>        ✅ Storage block - filesystem fio test
>        ✅ Storage block - queue scheduler test
>        ✅ storage: software RAID testing
>        ✅ Storage: swraid mdadm raid_module test
>        ✅ stress: stress-ng - interrupt
>        ✅ stress: stress-ng - cpu
>        ✅ stress: stress-ng - cpu-cache
>        ✅ stress: stress-ng - memory
>        🚧 ✅ Podman system test - as root
>        🚧 ✅ Podman system test - as user
>        🚧 ✅ CPU: Idle Test
>        🚧 ✅ xfstests - btrfs
>        🚧 ✅ Storage blktests - nvme-tcp
>        🚧 ⚡⚡⚡ Storage nvdimm ndctl test suite
>        🚧 ⚡⚡⚡ Storage: lvm device-mapper test - upstream
>        🚧 ✅ lvm cache test
>        🚧 ✅ stress: stress-ng - os
> 
>   Test sources: https://gitlab.com/cki-project/kernel-tests
>     💚 Pull requests are welcome for new tests or improvements to existing tests!
> 
> Aborted tests
> -------------
> Tests that didn't complete running successfully are marked with ⚡⚡⚡.
> If this was caused by an infrastructure issue, we try to mark that
> explicitly in the report.
> 
> Waived tests
> ------------
> If the test run included waived tests, they are marked with 🚧. Such tests are
> executed but their results are not taken into account. Tests are waived when
> their results are not reliable enough, e.g. when they're just introduced or are
> being fixed.
> 
> Testing timeout
> ---------------
> We aim to provide a report within reasonable timeframe. Tests that haven't
> finished running yet are marked with ⏱.
> Targeted tests
> --------------
> Test runs for patches always include a set of base tests, plus some
> tests chosen based on the file paths modified by the patch. The latter
> are called "targeted tests". If no targeted tests are run, that means
> no patch-specific tests are available. Please, consider contributing a
> targeted test for related patches to increase test coverage. See
> https://docs.engineering.redhat.com/x/_wEZB for more details.
> 

