Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B31E3FC1
	for <llvm@lists.linux.dev>; Wed,  1 Sep 2021 06:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630479346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4R27WmoJLHUg9faJ1SpnE81AqX4b4H5E+jLBZWhgQEY=;
	b=Av3W7VQdP+tJ7nVvMGIxsybnAQyYaE3aAnGqJ7kbJvDenamsOT9RZ4J076yQeJvy+MXCAu
	Y4vEmfso2n0qE1ykCJId3SvoTbc+pk51Ak8Ed6fKJorTLniSG/FNNGh2CjDYqZphK461S9
	EO1NgYt/6dThIaj6AMEbcthCuaG1gao=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-N8S6XMqdP3G9_9yLudBcRA-1; Wed, 01 Sep 2021 02:55:43 -0400
X-MC-Unique: N8S6XMqdP3G9_9yLudBcRA-1
Received: by mail-lj1-f198.google.com with SMTP id bn35-20020a05651c17a3b02901b483917a19so714378ljb.2
        for <llvm@lists.linux.dev>; Tue, 31 Aug 2021 23:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4R27WmoJLHUg9faJ1SpnE81AqX4b4H5E+jLBZWhgQEY=;
        b=VnHfYqzffIDmlej/b/CeWwX9PGguQLsKB+vqt44zdSc2uoQfuMRIJkVlbziCLxH+FI
         0v9x/n0swbsdMNhMvQeHMx71G+JsgZxKCKgEPuFXD6hWnggwoS/UkIMS3GQ73Nq/CknA
         QOZfVYF5lN+rCefNTuhR9exPDqSvHe5gK0VuvjgonKK4NuJ2VBmkc+A5bT0V0+tbi2vO
         cPhlmYpXlU7vZUZD0ryKfLnLDxgjEvjVsfZYGzrZk9UvDTGM8ig8aUIxd+2hrToV0br1
         j4TniNrtv0cGFNCpMAIzAX7DeRl1MfPIB5EUhn23zwqXN5ig+vtYoTGDyhM4IfzMqpbg
         45rQ==
X-Gm-Message-State: AOAM531ZqRwMOqgM+D3mUP7hE6T7UtkFsPjiG3Wqa+IlCFl3nBKMyapF
	yGowT1P7IwpcpcWYILmq+C8y4xd+ljeqObO28YCX2aBBDzbHDduazrZvoTF6vv/fe9y7nVOwlG7
	4CNM/KwqlRy+Mm4JbmHSM+pH+58SxWw==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr29004981lji.296.1630479341947;
        Tue, 31 Aug 2021 23:55:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTxOaX0dbl2XjikHXckar9wVC9gu0NKny0lLHQrceKJx5Z+hR8HzggOclwvDarHMC4hDNcd7OaabrzalUgwd4=
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr29004960lji.296.1630479341551;
 Tue, 31 Aug 2021 23:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cki.FFEF33F166.699NRFYC13@redhat.com> <CALWRkkh3TSeC7ZW0CatLrzp1QVp785kwntnRKF9-1D_7GONm6A@mail.gmail.com>
In-Reply-To: <CALWRkkh3TSeC7ZW0CatLrzp1QVp785kwntnRKF9-1D_7GONm6A@mail.gmail.com>
From: Bruno Goncalves <bgoncalv@redhat.com>
Date: Wed, 1 Sep 2021 08:55:30 +0200
Message-ID: <CA+QYu4q_xiDGfbb1nQDzALk1QBF_yEDM+VxExnc1na+TrdNd=g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E2=9D=8C_FAIL=3A_Test_report_for_kernel_5=2E14=2E0=2Drc7_=28mai?=
	=?UTF-8?Q?nline=2Ekernel=2Eorg=2Dclang=2C_1a6d80ff=29?=
To: Murphy Zhou <xzhou@redhat.com>
Cc: CKI Project <cki-project@redhat.com>, skt-results-master@redhat.com, 
	llvm@lists.linux.dev, Memory Management <mm-qe@redhat.com>, Jan Stancek <jstancek@redhat.com>, 
	Filip Suba <fsuba@redhat.com>, Jiri Dluhos <jdluhos@redhat.com>, Milos Malik <mmalik@redhat.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Yi Zhang <yizhan@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bgoncalv@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 1, 2021 at 5:43 AM Murphy Zhou <xzhou@redhat.com> wrote:
>
>
>
> On Sat, Aug 28, 2021 at 6:40 AM CKI Project <cki-project@redhat.com> wrot=
e:
>>
>>
>> Hello,
>>
>> We ran automated tests on a recent commit from this kernel tree:
>>
>>        Kernel repo: https://git.kernel.org/pub/scm/linux/kernel/git/torv=
alds/linux.git
>>             Commit: 1a6d80ff2419 - Merge tag 'arm64-fixes' of git://git.=
kernel.org/pub/scm/linux/kernel/git/arm64/linux
>>
>> The results of these automated tests are provided below.
>>
>>     Overall result: FAILED (see details below)
>>              Merge: OK
>>            Compile: OK
>>  Selftests compile: FAILED
>>              Tests: FAILED
>>
>> All kernel binaries, config files, and logs are available for download h=
ere:
>>
>>   https://arr-cki-prod-datawarehouse-public.s3.amazonaws.com/index.html?=
prefix=3Ddatawarehouse-public/2021/08/26/360275124
>>
>> One or more kernel tests failed:
>>
>>     ppc64le:
>>      =E2=9D=8C Reboot test
>>      =E2=9D=8C LTP
>>
>>     aarch64:
>>      =E2=9D=8C LTP
>>      =E2=9D=8C LTP
>>
>>     x86_64:
>>      =F0=9F=92=A5 xfstests - cifsv3.11
>
>
> Linux mainline has updated for the new merge window. CIFS xfstests is hit=
ting some blocker. I'm working on it.
Hi,

This test failed on an issue that we've already reported:
https://lkml.org/lkml/2021/8/26/309

Bruno

>
>>
>>      =E2=9D=8C LTP
>>
>> We hope that these logs can help you find the problem quickly. For the f=
ull
>> detail on our testing procedures, please scroll to the bottom of this me=
ssage.
>>
>> Please reply to this email if you have any questions about the tests tha=
t we
>> ran or if you have any suggestions on how to make future tests more effe=
ctive.
>>
>>         ,-.   ,-.
>>        ( C ) ( K )  Continuous
>>         `-',-.`-'   Kernel
>>           ( I )     Integration
>>            `-'
>> ________________________________________________________________________=
______
>>
>> Compile testing
>> ---------------
>>
>> We compiled the kernel for 4 architectures:
>>
>>     aarch64:
>>       make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg
>>
>>     ppc64le:
>>       make options: make CC=3Dclang -j24 INSTALL_MOD_STRIP=3D1 targz-pkg
>>
>>     s390x:
>>       make options: make CC=3Dclang -j24 INSTALL_MOD_STRIP=3D1 targz-pkg
>>
>>     x86_64:
>>       make options: make LLVM=3D1 -j24 INSTALL_MOD_STRIP=3D1 targz-pkg
>>
>>
>> We built the following selftests:
>>
>>   x86_64:
>>       net: OK
>>       bpf: fail
>>       install and packaging: OK
>>
>> You can find the full log (build-selftests.log) in the artifact storage =
above.
>>
>>
>> Hardware testing
>> ----------------
>> We booted each kernel and ran the following tests:
>>
>>   aarch64:
>>     Host 1:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =E2=9C=85 ACPI table test
>>        =E2=9C=85 ACPI enabled test
>>        =E2=9C=85 LTP
>>        =E2=9C=85 CIFS Connectathon
>>        =E2=9C=85 POSIX pjd-fstest suites
>>        =E2=9C=85 Loopdev Sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>>        =E2=9C=85 Memory: fork_mem
>>        =E2=9C=85 Memory function: memfd_create
>>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>>        =E2=9C=85 Networking bridge: sanity
>>        =E2=9C=85 Ethernet drivers sanity
>>        =E2=9C=85 Networking socket: fuzz
>>        =E2=9C=85 Networking: igmp conformance test
>>        =E2=9C=85 Networking route: pmtu
>>        =E2=9C=85 Networking route_func - local
>>        =E2=9C=85 Networking route_func - forward
>>        =E2=9C=85 Networking TCP: keepalive test
>>        =E2=9C=85 Networking UDP: socket
>>        =E2=9C=85 Networking cki netfilter test
>>        =E2=9C=85 Networking tunnel: geneve basic test
>>        =E2=9C=85 Networking tunnel: gre basic
>>        =E2=9C=85 L2TP basic test
>>        =E2=9C=85 Networking tunnel: vxlan basic
>>        =E2=9C=85 Networking ipsec: basic netns - transport
>>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>>        =E2=9C=85 Libkcapi AF_ALG test
>>        =E2=9C=85 pciutils: update pci ids test
>>        =E2=9C=85 ALSA PCM loopback test
>>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>>        =E2=9C=85 storage: SCSI VPD
>>        =E2=9C=85 trace: ftrace/tracer
>>        =E2=9C=85 kdump - kexec_boot
>>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>>        =F0=9F=9A=A7 =E2=9C=85 i2c: i2cdetect sanity
>>        =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
>>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>>        =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm cache test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm snapper test
>>
>>     Host 2:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =E2=9C=85 xfstests - ext4
>>        =E2=9C=85 xfstests - xfs
>>        =E2=9C=85 Storage blktests
>>        =E2=9C=85 storage: software RAID testing
>>        =E2=9C=85 Storage: swraid mdadm raid_module test
>>        =F0=9F=9A=A7 =E2=9C=85 Podman system integration test - as root
>>        =F0=9F=9A=A7 =E2=9C=85 Podman system integration test - as user
>>        =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
>>        =F0=9F=9A=A7 =E2=9C=85 IPMI driver test
>>        =F0=9F=9A=A7 =E2=9C=85 IPMItool loop stress test
>>        =F0=9F=9A=A7 =E2=9D=8C selinux-policy: serge-testsuite
>>        =F0=9F=9A=A7 =E2=9C=85 Storage block - filesystem fio test
>>        =F0=9F=9A=A7 =E2=9C=85 Storage block - queue scheduler test
>>        =F0=9F=9A=A7 =E2=9D=8C Storage nvme - tcp
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng
>>
>>     Host 3:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =E2=9C=85 ACPI table test
>>        =E2=9C=85 ACPI enabled test
>>        =E2=9D=8C LTP
>>        =E2=9C=85 CIFS Connectathon
>>        =E2=9C=85 POSIX pjd-fstest suites
>>        =E2=9C=85 Loopdev Sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>>        =E2=9C=85 Memory: fork_mem
>>        =E2=9C=85 Memory function: memfd_create
>>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>>        =E2=9C=85 Networking bridge: sanity
>>        =E2=9C=85 Ethernet drivers sanity
>>        =E2=9C=85 Networking socket: fuzz
>>        =E2=9C=85 Networking: igmp conformance test
>>        =E2=9C=85 Networking route: pmtu
>>        =E2=9C=85 Networking route_func - local
>>        =E2=9C=85 Networking route_func - forward
>>        =E2=9C=85 Networking TCP: keepalive test
>>        =E2=9C=85 Networking UDP: socket
>>        =E2=9C=85 Networking cki netfilter test
>>        =E2=9C=85 Networking tunnel: geneve basic test
>>        =E2=9C=85 Networking tunnel: gre basic
>>        =E2=9C=85 L2TP basic test
>>        =E2=9C=85 Networking tunnel: vxlan basic
>>        =E2=9C=85 Networking ipsec: basic netns - transport
>>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>>        =E2=9C=85 Libkcapi AF_ALG test
>>        =E2=9C=85 pciutils: update pci ids test
>>        =E2=9C=85 ALSA PCM loopback test
>>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>>        =E2=9C=85 storage: SCSI VPD
>>        =E2=9C=85 trace: ftrace/tracer
>>        =E2=9C=85 kdump - kexec_boot
>>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>>        =F0=9F=9A=A7 =E2=9C=85 i2c: i2cdetect sanity
>>        =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
>>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>>        =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm cache test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm snapper test
>>
>>     Host 4:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =E2=9C=85 ACPI table test
>>        =E2=9C=85 ACPI enabled test
>>        =E2=9D=8C LTP
>>        =E2=9C=85 CIFS Connectathon
>>        =E2=9C=85 POSIX pjd-fstest suites
>>        =E2=9C=85 Loopdev Sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>>        =E2=9C=85 Memory: fork_mem
>>        =E2=9C=85 Memory function: memfd_create
>>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>>        =E2=9C=85 Networking bridge: sanity
>>        =E2=9C=85 Ethernet drivers sanity
>>        =E2=9C=85 Networking socket: fuzz
>>        =E2=9C=85 Networking: igmp conformance test
>>        =E2=9C=85 Networking route: pmtu
>>        =E2=9C=85 Networking route_func - local
>>        =E2=9C=85 Networking route_func - forward
>>        =E2=9C=85 Networking TCP: keepalive test
>>        =E2=9C=85 Networking UDP: socket
>>        =E2=9C=85 Networking cki netfilter test
>>        =E2=9C=85 Networking tunnel: geneve basic test
>>        =E2=9C=85 Networking tunnel: gre basic
>>        =E2=9C=85 L2TP basic test
>>        =E2=9C=85 Networking tunnel: vxlan basic
>>        =E2=9C=85 Networking ipsec: basic netns - transport
>>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>>        =E2=9C=85 Libkcapi AF_ALG test
>>        =E2=9C=85 pciutils: update pci ids test
>>        =E2=9C=85 ALSA PCM loopback test
>>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>>        =E2=9C=85 storage: SCSI VPD
>>        =E2=9C=85 trace: ftrace/tracer
>>        =E2=9C=85 kdump - kexec_boot
>>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>>        =F0=9F=9A=A7 =E2=9C=85 i2c: i2cdetect sanity
>>        =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
>>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>>        =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm cache test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm snapper test
>>
>>   ppc64le:
>>     Host 1:
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =F0=9F=9A=A7 =E2=9C=85 Storage: lvm device-mapper test - upstream
>>
>>     Host 2:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9C=85 Boot test
>>        =E2=9D=8C Reboot test
>>        =E2=9D=8C LTP
>>        =E2=9C=85 CIFS Connectathon
>>        =E2=9C=85 POSIX pjd-fstest suites
>>        =E2=9C=85 Loopdev Sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>>        =E2=9C=85 Memory: fork_mem
>>        =E2=9C=85 Memory function: memfd_create
>>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>>        =E2=9C=85 Networking bridge: sanity
>>        =E2=9C=85 Ethernet drivers sanity
>>        =E2=9C=85 Networking socket: fuzz
>>        =E2=9C=85 Networking route: pmtu
>>        =E2=9C=85 Networking route_func - local
>>        =E2=9C=85 Networking route_func - forward
>>        =E2=9C=85 Networking TCP: keepalive test
>>        =E2=9C=85 Networking UDP: socket
>>        =E2=9C=85 Networking cki netfilter test
>>        =E2=9C=85 Networking tunnel: geneve basic test
>>        =E2=9C=85 Networking tunnel: gre basic
>>        =E2=9C=85 L2TP basic test
>>        =E2=9C=85 Networking tunnel: vxlan basic
>>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>>        =E2=9C=85 Libkcapi AF_ALG test
>>        =E2=9C=85 pciutils: update pci ids test
>>        =E2=9C=85 ALSA PCM loopback test
>>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>>        =E2=9C=85 trace: ftrace/tracer
>>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>>        =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test
>>        =F0=9F=9A=A7 =E2=9D=8C lvm cache test
>>        =F0=9F=9A=A7 =E2=9D=8C lvm snapper test
>>
>>   s390x:
>>     Host 1:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - sysrq-c
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - file-load
>>
>>     Host 2:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: swraid mdadm raid_module tes=
t
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system integratio=
n test - as root
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system integratio=
n test - as user
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 selinux-policy: serge-te=
stsuite
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage nvme - tcp
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng
>>
>>     Host 3:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 LTP
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 CIFS Connectathon
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 POSIX pjd-fstest suites
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Loopdev Sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory: fork_mem
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: memfd_create
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 AMTU (Abstract Machine Test Utility)
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking bridge: sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Ethernet drivers sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route: pmtu
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - local
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking route_func - forward
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking TCP: keepalive test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking UDP: socket
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking cki netfilter test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: geneve basic test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: gre basic
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 L2TP basic test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking tunnel: vxlan basic
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - trans=
port
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Networking ipsec: basic netns - tunne=
l
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Libkcapi AF_ALG test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 trace: ftrace/tracer
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - kexec_boot
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 xarray-idr-radixtree-tes=
t
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Memory function: kaslr
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 audit: audit testsuite t=
est
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm cache test
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 lvm snapper test
>>
>>     Host 4:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - sysrq-c
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 kdump - file-load
>>
>>     Host 5:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Boot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Reboot test
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage blktests
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: swraid mdadm raid_module tes=
t
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system integratio=
n test - as root
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Podman system integratio=
n test - as user
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 selinux-policy: serge-te=
stsuite
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage nvme - tcp
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng
>>
>>   x86_64:
>>     Host 1:
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =E2=9C=85 xfstests - ext4
>>        =E2=9C=85 xfstests - xfs
>>        =E2=9C=85 xfstests - nfsv4.2
>>        =E2=9C=85 power-management: cpupower/sanity test
>>        =E2=9C=85 Storage blktests
>>        =E2=9C=85 storage: software RAID testing
>>        =E2=9C=85 Storage: swraid mdadm raid_module test
>>        =F0=9F=9A=A7 =E2=9C=85 Podman system integration test - as root
>>        =F0=9F=9A=A7 =E2=9C=85 Podman system integration test - as user
>>        =F0=9F=9A=A7 =E2=9C=85 CPU: Idle Test
>>        =F0=9F=9A=A7 =E2=9C=85 xfstests - btrfs
>>        =F0=9F=9A=A7 =F0=9F=92=A5 xfstests - cifsv3.11
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMI driver test
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 IPMItool loop stress tes=
t
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 selinux-policy: serge-te=
stsuite
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage block - filesyst=
em fio test
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage block - queue sc=
heduler test
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage nvme - tcp
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage nvdimm ndctl tes=
t suite
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 Storage: lvm device-mapp=
er test - upstream
>>        =F0=9F=9A=A7 =E2=9A=A1=E2=9A=A1=E2=9A=A1 stress: stress-ng
>>
>>     Host 2:
>>
>>        =E2=9A=A1 Internal infrastructure issues prevented one or more te=
sts (marked
>>        with =E2=9A=A1=E2=9A=A1=E2=9A=A1) from running on this architectu=
re.
>>        This is not the fault of the kernel that was tested.
>>
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =E2=9C=85 ACPI table test
>>        =E2=9D=8C LTP
>>        =E2=9C=85 CIFS Connectathon
>>        =E2=9C=85 POSIX pjd-fstest suites
>>        =E2=9C=85 Loopdev Sanity
>>        =E2=9A=A1=E2=9A=A1=E2=9A=A1 jvm - jcstress tests
>>        =E2=9C=85 Memory: fork_mem
>>        =E2=9C=85 Memory function: memfd_create
>>        =E2=9C=85 AMTU (Abstract Machine Test Utility)
>>        =E2=9C=85 Networking bridge: sanity
>>        =E2=9C=85 Ethernet drivers sanity
>>        =E2=9C=85 Networking socket: fuzz
>>        =E2=9C=85 Networking: igmp conformance test
>>        =E2=9C=85 Networking route: pmtu
>>        =E2=9C=85 Networking route_func - local
>>        =E2=9C=85 Networking route_func - forward
>>        =E2=9C=85 Networking TCP: keepalive test
>>        =E2=9C=85 Networking UDP: socket
>>        =E2=9C=85 Networking cki netfilter test
>>        =E2=9C=85 Networking tunnel: geneve basic test
>>        =E2=9C=85 Networking tunnel: gre basic
>>        =E2=9C=85 L2TP basic test
>>        =E2=9C=85 Networking tunnel: vxlan basic
>>        =E2=9C=85 Networking ipsec: basic netns - transport
>>        =E2=9C=85 Networking ipsec: basic netns - tunnel
>>        =E2=9C=85 Libkcapi AF_ALG test
>>        =E2=9C=85 pciutils: sanity smoke test
>>        =E2=9C=85 pciutils: update pci ids test
>>        =E2=9C=85 ALSA PCM loopback test
>>        =E2=9C=85 ALSA Control (mixer) Userspace Element test
>>        =E2=9C=85 storage: SCSI VPD
>>        =E2=9C=85 trace: ftrace/tracer
>>        =E2=9C=85 kdump - kexec_boot
>>        =F0=9F=9A=A7 =E2=9C=85 xarray-idr-radixtree-test
>>        =F0=9F=9A=A7 =E2=9C=85 i2c: i2cdetect sanity
>>        =F0=9F=9A=A7 =E2=9D=8C Firmware test suite
>>        =F0=9F=9A=A7 =E2=9C=85 Memory function: kaslr
>>        =F0=9F=9A=A7 =E2=9C=85 audit: audit testsuite test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm cache test
>>        =F0=9F=9A=A7 =E2=9C=85 lvm snapper test
>>
>>     Host 3:
>>        =E2=9C=85 Boot test
>>        =E2=9C=85 Reboot test
>>        =E2=9C=85 kdump - file-load
>>        =F0=9F=9A=A7 =E2=9C=85 kdump - sysrq-c
>>
>>   Test sources: https://gitlab.com/cki-project/kernel-tests
>>     =F0=9F=92=9A Pull requests are welcome for new tests or improvements=
 to existing tests!
>>
>> Aborted tests
>> -------------
>> Tests that didn't complete running successfully are marked with =E2=9A=
=A1=E2=9A=A1=E2=9A=A1.
>> If this was caused by an infrastructure issue, we try to mark that
>> explicitly in the report.
>>
>> Waived tests
>> ------------
>> If the test run included waived tests, they are marked with =F0=9F=9A=A7=
. Such tests are
>> executed but their results are not taken into account. Tests are waived =
when
>> their results are not reliable enough, e.g. when they're just introduced=
 or are
>> being fixed.
>>
>> Testing timeout
>> ---------------
>> We aim to provide a report within reasonable timeframe. Tests that haven=
't
>> finished running yet are marked with =E2=8F=B1.
>>

