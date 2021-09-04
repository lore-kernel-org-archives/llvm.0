Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571AE3FC0
	for <llvm@lists.linux.dev>; Sat,  4 Sep 2021 00:08:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 615C1610CF;
	Sat,  4 Sep 2021 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630714113;
	bh=cNUj1Vm2UUNtOOivRk44tffFm4bgNt1oc0KDK6qPw2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kK2njtxRaLIKi80tKeGGS4go+B0OsVzzRJa2wIJNTEbmuYuPoCoYh+ebb+NYS7iPe
	 0wqBfpagSEnBn6C10DrW5XMaIvUb3RxpIbTJnO+Gf3Nz5+hTQYCUCDmTGxT82uvV5M
	 RI2vFikCGPEsLegpnkDZDKgn3kw1b9nYCaOEU2XRc4cRhDtSiTc7o7+iPaTLCWGjy7
	 kcd3WXrS+0FYScVUfNSWXJFaj7Y+lVQiK1JOTn9LWN9LqpVsBYV4p7DaFThr9dezyc
	 ed8gI+Eh/8o60irJVg+b2bocM5fj2eRvOAzu3FcLm537IXibpgL9crfIHOc8iHb6HF
	 b0s6IQUD8dd1w==
Date: Fri, 3 Sep 2021 17:08:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: ci_notify@linaro.org
Cc: tcwg-validation@linaro.org, Maurizio Lombardi <mlombard@redhat.com>,
	linaro-toolchain@lists.linaro.org,
	clang-built-linux@googlegroups.com, arnd@linaro.org,
	llvm@lists.linux.dev
Subject: Re: [CI-NOTIFY]: TCWG Bisect
 tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig - Build # 16 -
 Successful!
Message-ID: <YTK4/8lnQykNLj/e@Ryzen-9-3900X.localdomain>
References: <1267539297.8788.1630713264409@localhost>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1267539297.8788.1630713264409@localhost>

On Fri, Sep 03, 2021 at 11:54:23PM +0000, ci_notify@linaro.org wrote:
> Successfully identified regression in *linux* in CI configuration tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig.  So far, this commit has regressed CI configurations:
>  - tcwg_kernel/llvm-master-aarch64-mainline-allyesconfig
> 
> Culprit:
> <cut>
> commit 342f43af70dbc74f8629381998f92c060e1763a2
> Author: Maurizio Lombardi <mlombard@redhat.com>
> Date:   Thu Jul 29 15:52:50 2021 +0200
> 
>     iscsi_ibft: fix crash due to KASLR physical memory remapping
>     
>     Starting with commit a799c2bd29d1
>     ("x86/setup: Consolidate early memory reservations")
>     memory reservations have been moved earlier during the boot process,
>     before the execution of the Kernel Address Space Layout Randomization code.
>     
>     setup_arch() calls the iscsi_ibft's find_ibft_region() function
>     to find and reserve the memory dedicated to the iBFT and this function
>     also saves a virtual pointer to the iBFT table for later use.
>     
>     The problem is that if KALSR is active, the physical memory gets
>     remapped somewhere else in the virtual address space and the pointer is
>     no longer valid, this will cause a kernel panic when the iscsi driver tries
>     to dereference it.
>     
>      iBFT detected.
>      BUG: unable to handle page fault for address: ffff888000099fd8
>      #PF: supervisor read access in kernel mode
>      #PF: error_code(0x0000) - not-present page
>      PGD 0 P4D 0
>      Oops: 0000 [#1] SMP PTI
>     
>     ..snip..
>     
>      Call Trace:
>       ? ibft_create_kobject+0x1d2/0x1d2 [iscsi_ibft]
>       do_one_initcall+0x44/0x1d0
>       ? kmem_cache_alloc_trace+0x119/0x220
>       do_init_module+0x5c/0x270
>       __do_sys_init_module+0x12e/0x1b0
>       do_syscall_64+0x40/0x80
>       entry_SYSCALL_64_after_hwframe+0x44/0xae
>     
>     Fix this bug by saving the address of the physical location
>     of the ibft; later the driver will use isa_bus_to_virt() to get
>     the correct virtual address.
>     
>     N.B. On each reboot KASLR randomizes the virtual addresses so
>     assuming phys_to_virt before KASLR does its deed is incorrect.
>     
>     Simplify the code by renaming find_ibft_region()
>     to reserve_ibft_region() and remove all the wrappers.
>     
>     Signed-off-by: Maurizio Lombardi <mlombard@redhat.com>
>     Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>
>     Signed-off-by: Konrad Rzeszutek Wilk <konrad@kernel.org>
> </cut>
> 
> Results regressed to (for first_bad == 342f43af70dbc74f8629381998f92c060e1763a2)
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 19722
> # First few build errors in logs:
> 
> from (for last_good == 62fb9874f5da54fdb243003b386128037319b219)
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 19795
> # linux build successful:
> all
> 
> Artifacts of last_good build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/16/artifact/artifacts/build-62fb9874f5da54fdb243003b386128037319b219/
> Artifacts of first_bad build: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/16/artifact/artifacts/build-342f43af70dbc74f8629381998f92c060e1763a2/
> Build top page/logs: https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-master-aarch64-mainline-allyesconfig/16/

00:04:11 drivers/firmware/iscsi_ibft.c:868:15: error: implicit declaration of function 'isa_bus_to_virt' [-Werror,-Wimplicit-function-declaration]
00:04:11                 ibft_addr = isa_bus_to_virt(ibft_phys_addr);
00:04:11                             ^
00:04:11 drivers/firmware/iscsi_ibft.c:868:13: warning: incompatible integer to pointer conversion assigning to 'struct acpi_table_ibft *' from 'int' [-Wint-conversion]
00:04:11                 ibft_addr = isa_bus_to_virt(ibft_phys_addr);
00:04:11                           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Should be fixed as of commit 799206c1302e ("iscsi_ibft: Fix
isa_bus_to_virt not working under ARM").

https://lore.kernel.org/r/20210901164722.GA2100627@roeck-us.net/
https://lore.kernel.org/r/YTJ5jFf9iBC50pMs@localhost.localdomain/

Is there any way to get these emails shifted from
clang-built-linux@googlegroups.com to llvm@lists.linux.dev? They are
very helpful but we'd like to have history of them on lore.kernel.org :)

Cheers,
Nathan
