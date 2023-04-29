Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCD2F35
	for <llvm@lists.linux.dev>; Sat, 29 Apr 2023 22:45:51 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-24df161f84bso85935a91.3
        for <llvm@lists.linux.dev>; Sat, 29 Apr 2023 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682808351; x=1685400351;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NId5zeunR9IcusayiFMqiFx/0KYK16PS7/Ea4/t38Gw=;
        b=Xmw/zFR6W5rNklDEikwMMihBD7aHECe77iea1GJJ74AHu7Rw8bu4ZicTsEDdvryytA
         G8W4y8IL+qNEY9udbjrO1XLuatRHcCvahuhVtAZFDgD/rdktlTK1pEmJ7hQEWl+QwmC7
         BlCcVoApPxshgWL/IGYwKGK2xc+kpJwX+lVvQaAVzhQXfQUwZlv5zUHM8021Mw+0nhEi
         1IottTIMJnxpfRt8iFJvW4/K20uTJIyXUv++tP4+gV/8WKTp7dyBxhg0wChQqtpQwyku
         1X0yBkZbeWNJKHBNimXkaBfSI0r2oIowV3+dOe1FWlgUS3H2IoqUxu4m5mrJmVWQiZ/V
         oe7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682808351; x=1685400351;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NId5zeunR9IcusayiFMqiFx/0KYK16PS7/Ea4/t38Gw=;
        b=iT0zywYIc9iO4aLwt8UWsNCJMQRmkadbAxH8BkHksGTJkZzG8uE7vmfyldvpmyEEZZ
         XwdR8smIrcTDE/EvGNf7+MvQyNymfo8Tu36M0Ee2BArnemlAK/WVzx2jJ6/1nQcrN+7y
         zm+XDVyoGBQmKgkUwS78ch/4cY2KMBJTap8gWolh5kiDaf1vc0Icl+Kg0Rf43nb2ug69
         9Mo6buqFNLrr4buCXSfC/FEvCwa3+kU82wcyvfy9Oj5NY49P2J2loo41HaKbimoKqtFA
         80LitG+VU2J6myXq26ZZtn9mW7xoQShCyBddwlRdv0NBlGMkk/0vgf/UYpE+WhPTT2tF
         aVJw==
X-Gm-Message-State: AC+VfDzhLp+H4l0qsZJPFKug3ilPjJJLz0gbruOPapZHfBZm3T0zjWiF
	5EtaUHl8tP6XVdc4ZYot2O6jXQ==
X-Google-Smtp-Source: ACHHUZ76uMCRODRyyxuV+voFwiaUpfb6gNlH7mLOoX0rL7tb6xEgW6nAEExAAMIr1pNjQ/US8vUZjA==
X-Received: by 2002:a17:90b:3a8e:b0:247:ab52:d5d8 with SMTP id om14-20020a17090b3a8e00b00247ab52d5d8mr9924428pjb.26.1682808351146;
        Sat, 29 Apr 2023 15:45:51 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id v6-20020a17090a088600b00246f73c3acesm16571585pjc.33.2023.04.29.15.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 15:45:50 -0700 (PDT)
Date: Sat, 29 Apr 2023 15:45:50 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 15:45:26 PDT (-0700)
Subject:     Re: [linux-stable-rc:linux-5.15.y 9996/9999] arch/riscv/mm/init.c:755:16: warning: mixing declarations and code is a C99 extension
In-Reply-To: <202304300429.SXZOA5up-lkp@intel.com>
CC: alexghiti@rivosinc.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
  Greg KH <gregkh@linuxfoundation.org>, Conor Dooley <conor.dooley@microchip.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: lkp@intel.com
Message-ID: <mhng-44f3af4a-8862-414a-b904-9daac2e21b4e@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sat, 29 Apr 2023 13:56:13 PDT (-0700), lkp@intel.com wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
> head:   64fb7ad7e758c85ebeb0c8c500e4175c65bf5778
> commit: 067df57aea8ea9d1d84c53d9925d58759ac90824 [9996/9999] riscv: Move early dtb mapping into the fixmap region
> config: riscv-randconfig-r026-20230430 (https://download.01.org/0day-ci/archive/20230430/202304300429.SXZOA5up-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install riscv cross compiling tool for clang build
>         # apt-get install binutils-riscv-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=067df57aea8ea9d1d84c53d9925d58759ac90824
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.15.y
>         git checkout 067df57aea8ea9d1d84c53d9925d58759ac90824
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/mm/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202304300429.SXZOA5up-lkp@intel.com/

Thanks, I sent along 
https://lore.kernel.org/r/20230429224330.18699-1-palmer@rivosinc.com/

>
> All warnings (new ones prefixed by >>):
>
>>> arch/riscv/mm/init.c:755:16: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
>            unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
>                          ^
>    1 warning generated.
>
>
> vim +755 arch/riscv/mm/init.c
>
>    731
>    732	static void __init setup_vm_final(void)
>    733	{
>    734		uintptr_t va, map_size;
>    735		phys_addr_t pa, start, end;
>    736		u64 i;
>    737
>    738		/**
>    739		 * MMU is enabled at this point. But page table setup is not complete yet.
>    740		 * fixmap page table alloc functions should be used at this point
>    741		 */
>    742		pt_ops.alloc_pte = alloc_pte_fixmap;
>    743		pt_ops.get_pte_virt = get_pte_virt_fixmap;
>    744	#ifndef __PAGETABLE_PMD_FOLDED
>    745		pt_ops.alloc_pmd = alloc_pmd_fixmap;
>    746		pt_ops.get_pmd_virt = get_pmd_virt_fixmap;
>    747	#endif
>    748		/* Setup swapper PGD for fixmap */
>    749	#if !defined(CONFIG_64BIT)
>    750		/*
>    751		 * In 32-bit, the device tree lies in a pgd entry, so it must be copied
>    752		 * directly in swapper_pg_dir in addition to the pgd entry that points
>    753		 * to fixmap_pte.
>    754		 */
>  > 755		unsigned long idx = pgd_index(__fix_to_virt(FIX_FDT));
>    756
>    757		set_pgd(&swapper_pg_dir[idx], early_pg_dir[idx]);
>    758	#endif
>    759		create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
>    760				   __pa_symbol(fixmap_pgd_next),
>    761				   PGDIR_SIZE, PAGE_TABLE);
>    762
>    763		/* Map all memory banks in the linear mapping */
>    764		for_each_mem_range(i, &start, &end) {
>    765			if (start >= end)
>    766				break;
>    767			if (start <= __pa(PAGE_OFFSET) &&
>    768			    __pa(PAGE_OFFSET) < end)
>    769				start = __pa(PAGE_OFFSET);
>    770			if (end >= __pa(PAGE_OFFSET) + memory_limit)
>    771				end = __pa(PAGE_OFFSET) + memory_limit;
>    772
>    773			map_size = best_map_size(start, end - start);
>    774			for (pa = start; pa < end; pa += map_size) {
>    775				va = (uintptr_t)__va(pa);
>    776
>    777				create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
>    778						   pgprot_from_va(va));
>    779			}
>    780		}
>    781
