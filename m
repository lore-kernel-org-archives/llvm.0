Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C573729A1;
	Fri, 13 Jan 2023 10:51:38 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id k22-20020a05600c1c9600b003d1ee3a6289so17071594wms.2;
        Fri, 13 Jan 2023 02:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjFJhTW9oslnc2wf5qiIqA3DfxS01F6ZiLYq8LfqJTU=;
        b=lW7dN36+qkw7+YoOQLD5X8Van2V24W9ljjFc593UYAQT4ScBB1jtiKLHQsB9FcZMpT
         wG9Hx1P354+FF6wJckcyrdKsPPbwcpnKqNwcMNZ2YqlL5N5fbkwKi0Wr3Bp7+U+dLsyi
         ZlUWJMHstB+M2JT3gk82lwgASz3Xjh4mvjHIQL5Uj7uDk3vPK+0HBlkCOFv/JvD+nAgp
         zqDccObeuZdN2oLj+W3vteNwHtb5UE3cclQcXpxKvuQxwS54bqWHCQ31vfDtT0zj1DXy
         oHz0Tf/etZhs5kLZwJ1u+LdwFoVhgHzlDuTVqdhcq7fFcEJmsPktyyHyudOtFD1O0w11
         sf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjFJhTW9oslnc2wf5qiIqA3DfxS01F6ZiLYq8LfqJTU=;
        b=tYINYXa+qvfhOno8mHoNJGeC/0rh2uGCgZhgrAAt/+ppBE+Nf3NsiLzxfQbkDkKcju
         Zt6/ltnt9M67J9kD0Piz5osRjvjFe2dAf4W8hOdWMI8CB41v3Vu4AbawnkPisUwqqxKQ
         R7nO4Z6Qoi+9inSxp51NN2BdsDpZQbWDJ26D/1Bm2wjK3O4qjam03o4Iyq8wdr7uougr
         OykZBK919aGgcW9sTAcYyWn2mdFMV4p8wIol9HrLKLZPqJPpel8RVkyTLtnHYEGq99iF
         +KoMl9KgIGuthZuIabZnuvwAwnhdJBNZiH6g8IGlUQUoTbipRLpdyO6HsNkUiNNs+YS5
         39Xw==
X-Gm-Message-State: AFqh2krtDdb42VK/FTl5AUahPigZTE0YmP2SRac/SYdFbozVODtm5Xb+
	iTUSUKNckSPR6eI2DnpH5xpvLqeB14o=
X-Google-Smtp-Source: AMrXdXtNscNNMzyXnD3MC0TgYY9ViKkO9sge1hYj4Qpw+Rt7XOrGb/ibS2Js0AIDCpoDR+fT9Fjr0A==
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id ay24-20020a05600c1e1800b003d25e4e0701mr58154847wmb.31.1673607096017;
        Fri, 13 Jan 2023 02:51:36 -0800 (PST)
Received: from localhost (host86-164-169-89.range86-164.btcentralplus.com. [86.164.169.89])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c358300b003d1f2c3e571sm32473744wmq.33.2023.01.13.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:51:34 -0800 (PST)
Date: Fri, 13 Jan 2023 10:51:33 +0000
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 4/5] mm: mlock: update the interface to use folios
Message-ID: <Y8E3tf3Q1IE1ro0s@lucifer>
References: <cba12777c5544305014bc0cbec56bb4cc71477d8.1673526881.git.lstoakes@gmail.com>
 <202301131846.A1d5DF7q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202301131846.A1d5DF7q-lkp@intel.com>

+ Geert

On Fri, Jan 13, 2023 at 06:38:08PM +0800, kernel test robot wrote:
> Hi Lorenzo,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on geert-m68k/for-next]
> [also build test ERROR on geert-m68k/for-linus vfs-idmapping/for-next linus/master v6.2-rc3]
> [cannot apply to akpm-mm/mm-everything next-20230113]

I feel like a mistake has been made somewhere, perhaps I didn't make clear what
tree this should be applied to? The build issues raised below are a product of
this series relying on existing work in mm-unstable (and -next):-

1. release_pages() being extended to support folios too
2. vm_normal_folio() being added

If applied against a tree with these in place everything is fine :)

> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-pagevec-add-folio_batch_reinit/20230112-204200
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git for-next
> patch link:    https://lore.kernel.org/r/cba12777c5544305014bc0cbec56bb4cc71477d8.1673526881.git.lstoakes%40gmail.com
> patch subject: [PATCH v4 4/5] mm: mlock: update the interface to use folios
> config: mips-randconfig-r026-20230112
> compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mipsel-linux-gnu
>         # https://github.com/intel-lab-lkp/linux/commit/cf27780989ade768c28fef99f42d2d9be5504b4d
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Lorenzo-Stoakes/mm-pagevec-add-folio_batch_reinit/20230112-204200
>         git checkout cf27780989ade768c28fef99f42d2d9be5504b4d
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    mm/mlock.c:209:16: error: incompatible pointer types passing 'struct folio *[15]' to parameter of type 'struct page **' [-Werror,-Wincompatible-pointer-types]
>            release_pages(fbatch->folios, fbatch->nr);
>                          ^~~~~~~~~~~~~~
>    include/linux/mm.h:1182:34: note: passing argument to parameter 'pages' here
>    void release_pages(struct page **pages, int nr);
>                                     ^
> >> mm/mlock.c:335:11: error: call to undeclared function 'vm_normal_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                    folio = vm_normal_folio(vma, addr, *pte);
>                            ^
>    mm/mlock.c:335:11: note: did you mean 'vm_normal_page'?
>    include/linux/mm.h:1863:14: note: 'vm_normal_page' declared here
>    struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>                 ^
> >> mm/mlock.c:335:9: error: incompatible integer to pointer conversion assigning to 'struct folio *' from 'int' [-Wint-conversion]
>                    folio = vm_normal_folio(vma, addr, *pte);
>                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    3 errors generated.
>
>
> vim +/vm_normal_folio +335 mm/mlock.c
>
>    307
>    308	static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>    309				   unsigned long end, struct mm_walk *walk)
>    310
>    311	{
>    312		struct vm_area_struct *vma = walk->vma;
>    313		spinlock_t *ptl;
>    314		pte_t *start_pte, *pte;
>    315		struct folio *folio;
>    316
>    317		ptl = pmd_trans_huge_lock(pmd, vma);
>    318		if (ptl) {
>    319			if (!pmd_present(*pmd))
>    320				goto out;
>    321			if (is_huge_zero_pmd(*pmd))
>    322				goto out;
>    323			folio = page_folio(pmd_page(*pmd));
>    324			if (vma->vm_flags & VM_LOCKED)
>    325				mlock_folio(folio);
>    326			else
>    327				munlock_folio(folio);
>    328			goto out;
>    329		}
>    330
>    331		start_pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
>    332		for (pte = start_pte; addr != end; pte++, addr += PAGE_SIZE) {
>    333			if (!pte_present(*pte))
>    334				continue;
>  > 335			folio = vm_normal_folio(vma, addr, *pte);
>    336			if (!folio || folio_is_zone_device(folio))
>    337				continue;
>    338			if (folio_test_large(folio))
>    339				continue;
>    340			if (vma->vm_flags & VM_LOCKED)
>    341				mlock_folio(folio);
>    342			else
>    343				munlock_folio(folio);
>    344		}
>    345		pte_unmap(start_pte);
>    346	out:
>    347		spin_unlock(ptl);
>    348		cond_resched();
>    349		return 0;
>    350	}
>    351
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests

> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/mips 6.1.0-rc1 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT="clang version 16.0.0 (git://gitmirror/llvm_project 8d9828ef5aa9688500657d36cd2aefbe12bbd162)"
> CONFIG_GCC_VERSION=0
> CONFIG_CC_IS_CLANG=y
> CONFIG_CLANG_VERSION=160000
> CONFIG_AS_IS_LLVM=y
> CONFIG_AS_VERSION=160000
> CONFIG_LD_VERSION=0
> CONFIG_LD_IS_LLD=y
> CONFIG_LLD_VERSION=160000
> CONFIG_RUST_IS_AVAILABLE=y
> CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
> CONFIG_TOOLS_SUPPORT_RELR=y
> CONFIG_CC_HAS_ASM_INLINE=y
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
> CONFIG_PAHOLE_VERSION=123
> CONFIG_IRQ_WORK=y
> CONFIG_BUILDTIME_TABLE_SORT=y
>
> #
> # General setup
> #
> CONFIG_BROKEN_ON_SMP=y
> CONFIG_INIT_ENV_ARG_LIMIT=32
> CONFIG_COMPILE_TEST=y
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=""
> CONFIG_BUILD_SALT=""
> CONFIG_HAVE_KERNEL_GZIP=y
> CONFIG_HAVE_KERNEL_BZIP2=y
> CONFIG_HAVE_KERNEL_LZMA=y
> CONFIG_HAVE_KERNEL_XZ=y
> CONFIG_HAVE_KERNEL_LZO=y
> CONFIG_HAVE_KERNEL_LZ4=y
> CONFIG_HAVE_KERNEL_ZSTD=y
> # CONFIG_KERNEL_GZIP is not set
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> CONFIG_KERNEL_LZ4=y
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=""
> CONFIG_DEFAULT_HOSTNAME="(none)"
> CONFIG_SYSVIPC=y
> CONFIG_SYSVIPC_SYSCTL=y
> CONFIG_WATCH_QUEUE=y
> # CONFIG_CROSS_MEMORY_ATTACH is not set
> # CONFIG_USELIB is not set
>
> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=y
> CONFIG_GENERIC_IRQ_SHOW=y
> CONFIG_GENERIC_IRQ_CHIP=y
> CONFIG_IRQ_DOMAIN=y
> CONFIG_IRQ_SIM=y
> CONFIG_IRQ_DOMAIN_HIERARCHY=y
> CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
> CONFIG_GENERIC_MSI_IRQ=y
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
> CONFIG_IRQ_FORCED_THREADING=y
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> # end of IRQ subsystem
>
> CONFIG_GENERIC_TIME_VSYSCALL=y
> CONFIG_GENERIC_CLOCKEVENTS=y
> CONFIG_GENERIC_CMOS_UPDATE=y
>
> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=y
> CONFIG_NO_HZ_COMMON=y
> # CONFIG_HZ_PERIODIC is not set
> CONFIG_NO_HZ_IDLE=y
> CONFIG_NO_HZ=y
> # CONFIG_HIGH_RES_TIMERS is not set
> # end of Timers subsystem
>
> CONFIG_BPF=y
> CONFIG_HAVE_EBPF_JIT=y
>
> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=y
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
> # end of BPF subsystem
>
> CONFIG_PREEMPT_NONE_BUILD=y
> CONFIG_PREEMPT_NONE=y
> # CONFIG_PREEMPT_VOLUNTARY is not set
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=y
>
> #
> # CPU/Task time and stats accounting
> #
> CONFIG_TICK_CPU_ACCOUNTING=y
> # CONFIG_VIRT_CPU_ACCOUNTING_GEN is not set
> CONFIG_IRQ_TIME_ACCOUNTING=y
> CONFIG_BSD_PROCESS_ACCT=y
> CONFIG_BSD_PROCESS_ACCT_V3=y
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
>
> # CONFIG_CPU_ISOLATION is not set
>
> #
> # RCU Subsystem
> #
> CONFIG_TINY_RCU=y
> CONFIG_RCU_EXPERT=y
> CONFIG_SRCU=y
> CONFIG_TINY_SRCU=y
> CONFIG_TASKS_RCU_GENERIC=y
> # CONFIG_FORCE_TASKS_RCU is not set
> CONFIG_FORCE_TASKS_RUDE_RCU=y
> CONFIG_TASKS_RUDE_RCU=y
> # CONFIG_FORCE_TASKS_TRACE_RCU is not set
> CONFIG_TASKS_TRACE_RCU=y
> CONFIG_RCU_NEED_SEGCBLIST=y
> # CONFIG_TASKS_TRACE_RCU_READ_MB is not set
> # end of RCU Subsystem
>
> CONFIG_IKCONFIG=y
> CONFIG_IKCONFIG_PROC=y
> CONFIG_IKHEADERS=y
> CONFIG_LOG_BUF_SHIFT=17
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
> # CONFIG_PRINTK_INDEX is not set
> CONFIG_GENERIC_SCHED_CLOCK=y
>
> #
> # Scheduler features
> #
> # end of Scheduler features
>
> CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
> CONFIG_GCC12_NO_ARRAY_BOUNDS=y
> CONFIG_CGROUPS=y
> CONFIG_PAGE_COUNTER=y
> # CONFIG_CGROUP_FAVOR_DYNMODS is not set
> CONFIG_MEMCG=y
> CONFIG_MEMCG_KMEM=y
> CONFIG_BLK_CGROUP=y
> CONFIG_CGROUP_WRITEBACK=y
> # CONFIG_CGROUP_SCHED is not set
> # CONFIG_CGROUP_PIDS is not set
> # CONFIG_CGROUP_RDMA is not set
> CONFIG_CGROUP_FREEZER=y
> # CONFIG_CGROUP_DEVICE is not set
> # CONFIG_CGROUP_CPUACCT is not set
> # CONFIG_CGROUP_BPF is not set
> # CONFIG_CGROUP_MISC is not set
> CONFIG_CGROUP_DEBUG=y
> CONFIG_NAMESPACES=y
> # CONFIG_UTS_NS is not set
> CONFIG_IPC_NS=y
> # CONFIG_USER_NS is not set
> CONFIG_PID_NS=y
> # CONFIG_CHECKPOINT_RESTORE is not set
> # CONFIG_SCHED_AUTOGROUP is not set
> # CONFIG_SYSFS_DEPRECATED is not set
> # CONFIG_RELAY is not set
> # CONFIG_BLK_DEV_INITRD is not set
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_INITRAMFS_PRESERVE_MTIME=y
> # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
> CONFIG_CC_OPTIMIZE_FOR_SIZE=y
> CONFIG_HAVE_LD_DEAD_CODE_DATA_ELIMINATION=y
> CONFIG_LD_ORPHAN_WARN=y
> CONFIG_SYSCTL=y
> CONFIG_SYSCTL_EXCEPTION_TRACE=y
> # CONFIG_EXPERT is not set
> CONFIG_MULTIUSER=y
> CONFIG_SGETMASK_SYSCALL=y
> CONFIG_SYSFS_SYSCALL=y
> CONFIG_FHANDLE=y
> CONFIG_POSIX_TIMERS=y
> CONFIG_PRINTK=y
> CONFIG_BUG=y
> CONFIG_ELF_CORE=y
> CONFIG_BASE_FULL=y
> CONFIG_FUTEX=y
> CONFIG_FUTEX_PI=y
> CONFIG_EPOLL=y
> CONFIG_SIGNALFD=y
> CONFIG_TIMERFD=y
> CONFIG_EVENTFD=y
> CONFIG_SHMEM=y
> CONFIG_AIO=y
> CONFIG_IO_URING=y
> CONFIG_ADVISE_SYSCALLS=y
> CONFIG_MEMBARRIER=y
> CONFIG_KALLSYMS=y
> CONFIG_KALLSYMS_ALL=y
> CONFIG_KALLSYMS_BASE_RELATIVE=y
> CONFIG_RSEQ=y
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=y
> CONFIG_PERF_USE_VMALLOC=y
>
> #
> # Kernel Performance Events And Counters
> #
> # CONFIG_PERF_EVENTS is not set
> # end of Kernel Performance Events And Counters
>
> CONFIG_PROFILING=y
> CONFIG_TRACEPOINTS=y
> # end of General setup
>
> CONFIG_MIPS=y
>
> #
> # Machine selection
> #
> # CONFIG_MIPS_GENERIC_KERNEL is not set
> # CONFIG_MIPS_ALCHEMY is not set
> # CONFIG_AR7 is not set
> # CONFIG_ATH25 is not set
> # CONFIG_ATH79 is not set
> # CONFIG_BMIPS_GENERIC is not set
> CONFIG_BCM47XX=y
> # CONFIG_BCM63XX is not set
> # CONFIG_MIPS_COBALT is not set
> # CONFIG_MACH_DECSTATION is not set
> # CONFIG_MACH_JAZZ is not set
> # CONFIG_MACH_INGENIC_SOC is not set
> # CONFIG_LANTIQ is not set
> # CONFIG_MACH_LOONGSON32 is not set
> # CONFIG_MACH_LOONGSON2EF is not set
> # CONFIG_MACH_LOONGSON64 is not set
> # CONFIG_MIPS_MALTA is not set
> # CONFIG_MACH_PIC32 is not set
> # CONFIG_MACH_NINTENDO64 is not set
> # CONFIG_RALINK is not set
> # CONFIG_MACH_REALTEK_RTL is not set
> # CONFIG_SGI_IP22 is not set
> # CONFIG_SGI_IP27 is not set
> # CONFIG_SGI_IP28 is not set
> # CONFIG_SGI_IP30 is not set
> # CONFIG_SGI_IP32 is not set
> # CONFIG_SIBYTE_CRHINE is not set
> # CONFIG_SIBYTE_CARMEL is not set
> # CONFIG_SIBYTE_CRHONE is not set
> # CONFIG_SIBYTE_RHONE is not set
> # CONFIG_SIBYTE_SWARM is not set
> # CONFIG_SIBYTE_LITTLESUR is not set
> # CONFIG_SIBYTE_SENTOSA is not set
> # CONFIG_SIBYTE_BIGSUR is not set
> # CONFIG_SNI_RM is not set
> # CONFIG_MACH_TX49XX is not set
> # CONFIG_MIKROTIK_RB532 is not set
> # CONFIG_CAVIUM_OCTEON_SOC is not set
> CONFIG_BCM47XX_SSB=y
> CONFIG_BCM47XX_BCMA=y
> # end of Machine selection
>
> CONFIG_GENERIC_HWEIGHT=y
> CONFIG_GENERIC_CALIBRATE_DELAY=y
> CONFIG_SCHED_OMIT_FRAME_POINTER=y
> CONFIG_BOOT_RAW=y
> CONFIG_CEVT_R4K=y
> CONFIG_CSRC_R4K=y
> CONFIG_MIPS_CLOCK_VSYSCALL=y
> CONFIG_ARCH_SUPPORTS_UPROBES=y
> CONFIG_DMA_NONCOHERENT=y
> CONFIG_SYS_HAS_EARLY_PRINTK=y
> CONFIG_CPU_LITTLE_ENDIAN=y
> CONFIG_SYS_SUPPORTS_LITTLE_ENDIAN=y
> CONFIG_NO_EXCEPT_FILL=y
> CONFIG_MIPS_L1_CACHE_SHIFT=5
>
> #
> # CPU selection
> #
> CONFIG_CPU_MIPS32_R1=y
> # CONFIG_CPU_MIPS32_R2 is not set
> # CONFIG_CPU_BMIPS is not set
> CONFIG_SYS_SUPPORTS_ZBOOT=y
> CONFIG_SYS_HAS_CPU_MIPS32_R1=y
> CONFIG_SYS_HAS_CPU_MIPS32_R2=y
> CONFIG_SYS_HAS_CPU_BMIPS=y
> CONFIG_SYS_HAS_CPU_BMIPS32_3300=y
> # end of CPU selection
>
> CONFIG_CPU_MIPS32=y
> CONFIG_CPU_MIPSR1=y
> CONFIG_TARGET_ISA_REV=1
> CONFIG_SYS_SUPPORTS_32BIT_KERNEL=y
> CONFIG_CPU_SUPPORTS_32BIT_KERNEL=y
> CONFIG_HARDWARE_WATCHPOINTS=y
>
> #
> # Kernel type
> #
> CONFIG_32BIT=y
> CONFIG_ZBOOT_LOAD_ADDRESS=0xffffffff80400000
> # CONFIG_PAGE_SIZE_4KB is not set
> # CONFIG_PAGE_SIZE_16KB is not set
> CONFIG_PAGE_SIZE_64KB=y
> CONFIG_ARCH_FORCE_MAX_ORDER=11
> CONFIG_CPU_HAS_PREFETCH=y
> CONFIG_CPU_GENERIC_DUMP_TLB=y
> CONFIG_MIPS_FP_SUPPORT=y
> CONFIG_CPU_R4K_FPU=y
> CONFIG_CPU_R4K_CACHE_TLB=y
> CONFIG_CPU_NEEDS_NO_SMARTMIPS_OR_MICROMIPS=y
> CONFIG_CPU_MIPSR2_IRQ_VI=y
> CONFIG_CPU_HAS_SYNC=y
> CONFIG_MIPS_ASID_SHIFT=0
> CONFIG_MIPS_ASID_BITS=8
> # CONFIG_HIGHMEM is not set
> CONFIG_CPU_SUPPORTS_HIGHMEM=y
> CONFIG_SYS_SUPPORTS_HIGHMEM=y
> CONFIG_SYS_SUPPORTS_MIPS16=y
> CONFIG_ARCH_FLATMEM_ENABLE=y
> # CONFIG_HZ_24 is not set
> # CONFIG_HZ_48 is not set
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_128 is not set
> CONFIG_HZ_250=y
> # CONFIG_HZ_256 is not set
> # CONFIG_HZ_1000 is not set
> # CONFIG_HZ_1024 is not set
> CONFIG_SYS_SUPPORTS_ARBIT_HZ=y
> CONFIG_HZ=250
> # CONFIG_KEXEC is not set
> CONFIG_CRASH_DUMP=y
> CONFIG_PHYSICAL_START=0xffffffff84000000
> CONFIG_MIPS_O32_FP64_SUPPORT=y
> CONFIG_MIPS_CMDLINE_FROM_BOOTLOADER=y
> # end of Kernel type
>
> CONFIG_LOCKDEP_SUPPORT=y
> CONFIG_STACKTRACE_SUPPORT=y
> CONFIG_PGTABLE_LEVELS=2
>
> #
> # Bus options (PCI, PCMCIA, EISA, ISA, TC)
> #
> CONFIG_PCI_DRIVERS_LEGACY=y
> CONFIG_MMU=y
> CONFIG_ARCH_MMAP_RND_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_BITS_MAX=15
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=15
> # end of Bus options (PCI, PCMCIA, EISA, ISA, TC)
>
> CONFIG_TRAD_SIGNALS=y
>
> #
> # Power management options
> #
> CONFIG_ARCH_HIBERNATION_POSSIBLE=y
> CONFIG_ARCH_SUSPEND_POSSIBLE=y
> # CONFIG_SUSPEND is not set
> CONFIG_PM=y
> CONFIG_PM_DEBUG=y
> # CONFIG_PM_ADVANCED_DEBUG is not set
> CONFIG_PM_CLK=y
> CONFIG_PM_GENERIC_DOMAINS=y
> CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
> CONFIG_CPU_PM=y
> # end of Power management options
>
> #
> # CPU Power Management
> #
>
> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=y
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=y
> # CONFIG_CPU_IDLE_GOV_TEO is not set
>
> #
> # MIPS CPU Idle Drivers
> #
> # end of MIPS CPU Idle Drivers
> # end of CPU Idle
> # end of CPU Power Management
>
> CONFIG_VIRTUALIZATION=y
> CONFIG_MIPS_LD_CAN_LINK_VDSO=y
>
> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=y
> # CONFIG_JUMP_LABEL is not set
> CONFIG_ARCH_USE_BUILTIN_BSWAP=y
> CONFIG_HAVE_IOREMAP_PROT=y
> CONFIG_HAVE_KPROBES=y
> CONFIG_HAVE_KRETPROBES=y
> CONFIG_HAVE_NMI=y
> CONFIG_TRACE_IRQFLAGS_SUPPORT=y
> CONFIG_HAVE_ARCH_TRACEHOOK=y
> CONFIG_HAVE_DMA_CONTIGUOUS=y
> CONFIG_GENERIC_SMP_IDLE_THREAD=y
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
> CONFIG_ARCH_HAS_DMA_SET_UNCACHED=y
> CONFIG_ARCH_32BIT_OFF_T=y
> CONFIG_HAVE_ASM_MODVERSIONS=y
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
> CONFIG_HAVE_RSEQ=y
> CONFIG_HAVE_PERF_REGS=y
> CONFIG_HAVE_PERF_USER_STACK_DUMP=y
> CONFIG_HAVE_ARCH_JUMP_LABEL=y
> CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
> CONFIG_HAVE_ARCH_SECCOMP=y
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
> # CONFIG_SECCOMP is not set
> CONFIG_HAVE_STACKPROTECTOR=y
> CONFIG_STACKPROTECTOR=y
> CONFIG_STACKPROTECTOR_STRONG=y
> CONFIG_LTO_NONE=y
> CONFIG_HAVE_CONTEXT_TRACKING_USER=y
> CONFIG_HAVE_TIF_NOHZ=y
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
> CONFIG_HAVE_EXIT_THREAD=y
> CONFIG_ARCH_MMAP_RND_BITS=8
> CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
> CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT=y
> CONFIG_CLONE_BACKWARDS=y
> CONFIG_COMPAT_32BIT_TIME=y
> CONFIG_HAVE_ARCH_COMPILER_H=y
> CONFIG_LOCK_EVENT_COUNTS=y
> CONFIG_HAVE_SPARSE_SYSCALL_NR=y
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
>
> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
> # end of GCOV-based kernel profiling
>
> CONFIG_HAVE_GCC_PLUGINS=y
> # end of General architecture-dependent options
>
> CONFIG_RT_MUTEXES=y
> CONFIG_BASE_SMALL=0
> # CONFIG_MODULES is not set
> CONFIG_BLOCK=y
> # CONFIG_BLOCK_LEGACY_AUTOLOAD is not set
> CONFIG_BLK_DEV_BSG_COMMON=y
> CONFIG_BLK_DEV_BSGLIB=y
> CONFIG_BLK_DEV_INTEGRITY=y
> CONFIG_BLK_DEV_INTEGRITY_T10=y
> CONFIG_BLK_DEV_ZONED=y
> # CONFIG_BLK_DEV_THROTTLING is not set
> CONFIG_BLK_WBT=y
> # CONFIG_BLK_WBT_MQ is not set
> CONFIG_BLK_CGROUP_IOLATENCY=y
> # CONFIG_BLK_CGROUP_FC_APPID is not set
> # CONFIG_BLK_CGROUP_IOCOST is not set
> # CONFIG_BLK_CGROUP_IOPRIO is not set
> # CONFIG_BLK_DEBUG_FS is not set
> # CONFIG_BLK_SED_OPAL is not set
> # CONFIG_BLK_INLINE_ENCRYPTION is not set
>
> #
> # Partition Types
> #
> # CONFIG_PARTITION_ADVANCED is not set
> CONFIG_AMIGA_PARTITION=y
> CONFIG_MSDOS_PARTITION=y
> CONFIG_EFI_PARTITION=y
> # end of Partition Types
>
> CONFIG_BLK_MQ_PCI=y
> CONFIG_BLK_MQ_VIRTIO=y
> CONFIG_BLK_PM=y
> CONFIG_BLOCK_HOLDER_DEPRECATED=y
> CONFIG_BLK_MQ_STACKING=y
>
> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=y
> CONFIG_MQ_IOSCHED_KYBER=y
> # CONFIG_IOSCHED_BFQ is not set
> # end of IO Schedulers
>
> CONFIG_ASN1=y
> CONFIG_UNINLINE_SPIN_UNLOCK=y
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
> CONFIG_FREEZER=y
>
> #
> # Executable file formats
> #
> # CONFIG_BINFMT_ELF is not set
> CONFIG_ARCH_BINFMT_ELF_STATE=y
> CONFIG_BINFMT_SCRIPT=y
> # CONFIG_BINFMT_MISC is not set
> CONFIG_COREDUMP=y
> # end of Executable file formats
>
> #
> # Memory Management options
> #
> # CONFIG_SWAP is not set
> CONFIG_ZSMALLOC=y
> CONFIG_ZSMALLOC_STAT=y
>
> #
> # SLAB allocator options
> #
> # CONFIG_SLAB is not set
> CONFIG_SLUB=y
> # CONFIG_SLAB_MERGE_DEFAULT is not set
> CONFIG_SLAB_FREELIST_RANDOM=y
> CONFIG_SLAB_FREELIST_HARDENED=y
> # CONFIG_SLUB_STATS is not set
> # end of SLAB allocator options
>
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
> CONFIG_COMPAT_BRK=y
> CONFIG_FLATMEM=y
> CONFIG_HAVE_FAST_GUP=y
> CONFIG_ARCH_KEEP_MEMBLOCK=y
> CONFIG_MEMORY_ISOLATION=y
> CONFIG_EXCLUSIVE_SYSTEM_RAM=y
> CONFIG_SPLIT_PTLOCK_CPUS=4
> # CONFIG_COMPACTION is not set
> # CONFIG_PAGE_REPORTING is not set
> CONFIG_MIGRATION=y
> CONFIG_CONTIG_ALLOC=y
> # CONFIG_KSM is not set
> CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
> CONFIG_NEED_PER_CPU_KM=y
> CONFIG_CMA=y
> # CONFIG_CMA_DEBUG is not set
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_SYSFS=y
> CONFIG_CMA_AREAS=7
> # CONFIG_IDLE_PAGE_TRACKING is not set
> CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
> CONFIG_VM_EVENT_COUNTERS=y
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=y
> # CONFIG_ANON_VMA_NAME is not set
> # CONFIG_USERFAULTFD is not set
> CONFIG_LRU_GEN=y
> # CONFIG_LRU_GEN_ENABLED is not set
> CONFIG_LRU_GEN_STATS=y
>
> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
>
> # CONFIG_NET is not set
>
> #
> # Device Drivers
> #
> CONFIG_HAVE_PCI=y
> CONFIG_PCI=y
> CONFIG_PCI_DOMAINS=y
> # CONFIG_PCIEPORTBUS is not set
> CONFIG_PCIEASPM=y
> # CONFIG_PCIEASPM_DEFAULT is not set
> CONFIG_PCIEASPM_POWERSAVE=y
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PTM=y
> CONFIG_PCI_MSI=y
> CONFIG_PCI_MSI_IRQ_DOMAIN=y
> CONFIG_PCI_MSI_ARCH_FALLBACKS=y
> CONFIG_PCI_QUIRKS=y
> # CONFIG_PCI_DEBUG is not set
> CONFIG_PCI_STUB=y
> CONFIG_PCI_ATS=y
> CONFIG_PCI_DOE=y
> # CONFIG_PCI_IOV is not set
> # CONFIG_PCI_PRI is not set
> CONFIG_PCI_PASID=y
> CONFIG_VGA_ARB=y
> CONFIG_VGA_ARB_MAX_GPUS=16
> # CONFIG_HOTPLUG_PCI is not set
>
> #
> # PCI controller drivers
> #
> # CONFIG_PCIE_XILINX_NWL is not set
> CONFIG_PCI_TEGRA=y
> # CONFIG_PCIE_RCAR_HOST is not set
> # CONFIG_PCIE_XILINX is not set
> # CONFIG_PCIE_XILINX_CPM is not set
> # CONFIG_PCI_VERSATILE is not set
> CONFIG_PCIE_ALTERA=y
> # CONFIG_PCIE_ALTERA_MSI is not set
> # CONFIG_PCIE_MEDIATEK_GEN3 is not set
> CONFIG_PCIE_MT7621=y
>
> #
> # DesignWare PCI Core Support
> #
> CONFIG_PCIE_DW=y
> CONFIG_PCIE_DW_HOST=y
> # CONFIG_PCIE_DW_PLAT_HOST is not set
> CONFIG_PCI_EXYNOS=y
> # CONFIG_PCI_IMX6 is not set
> # CONFIG_PCIE_SPEAR13XX is not set
> # CONFIG_PCI_KEYSTONE_HOST is not set
> CONFIG_PCIE_ARMADA_8K=y
> CONFIG_PCIE_ARTPEC6=y
> CONFIG_PCIE_ARTPEC6_HOST=y
> CONFIG_PCIE_KEEMBAY=y
> CONFIG_PCIE_KEEMBAY_HOST=y
> CONFIG_PCIE_HISI_STB=y
> CONFIG_PCI_MESON=y
> CONFIG_PCIE_TEGRA194=y
> CONFIG_PCIE_TEGRA194_HOST=y
> # CONFIG_PCIE_VISCONTI_HOST is not set
> # CONFIG_PCIE_FU740 is not set
> # end of DesignWare PCI Core Support
>
> #
> # Mobiveil PCIe Core Support
> #
> # CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
> # end of Mobiveil PCIe Core Support
>
> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
>
> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
>
> #
> # PCI switch controller drivers
> #
> CONFIG_PCI_SW_SWITCHTEC=y
> # end of PCI switch controller drivers
>
> CONFIG_CXL_BUS=y
> CONFIG_CXL_PCI=y
> # CONFIG_CXL_MEM_RAW_COMMANDS is not set
> # CONFIG_CXL_MEM is not set
> CONFIG_CXL_PORT=y
> CONFIG_PCCARD=y
> CONFIG_PCMCIA=y
> CONFIG_PCMCIA_LOAD_CIS=y
> # CONFIG_CARDBUS is not set
>
> #
> # PC-card bridges
> #
> # CONFIG_YENTA is not set
> CONFIG_PD6729=y
> CONFIG_I82092=y
> CONFIG_PCCARD_NONSTATIC=y
> CONFIG_RAPIDIO=y
> CONFIG_RAPIDIO_DISC_TIMEOUT=30
> # CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
> CONFIG_RAPIDIO_DMA_ENGINE=y
> CONFIG_RAPIDIO_DEBUG=y
> CONFIG_RAPIDIO_ENUM_BASIC=y
> CONFIG_RAPIDIO_CHMAN=y
> CONFIG_RAPIDIO_MPORT_CDEV=y
>
> #
> # RapidIO Switch drivers
> #
> CONFIG_RAPIDIO_CPS_XX=y
> CONFIG_RAPIDIO_CPS_GEN2=y
> CONFIG_RAPIDIO_RXS_GEN3=y
> # end of RapidIO Switch drivers
>
> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=y
> # CONFIG_UEVENT_HELPER is not set
> # CONFIG_DEVTMPFS is not set
> CONFIG_STANDALONE=y
> # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>
> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=y
> CONFIG_FW_LOADER_PAGED_BUF=y
> CONFIG_FW_LOADER_SYSFS=y
> CONFIG_EXTRA_FIRMWARE=""
> # CONFIG_FW_LOADER_USER_HELPER is not set
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_UPLOAD=y
> # end of Firmware loader
>
> CONFIG_ALLOW_DEV_COREDUMP=y
> CONFIG_DEBUG_DRIVER=y
> # CONFIG_DEBUG_DEVRES is not set
> CONFIG_DEBUG_TEST_DRIVER_REMOVE=y
> CONFIG_GENERIC_CPU_AUTOPROBE=y
> CONFIG_SOC_BUS=y
> CONFIG_REGMAP=y
> CONFIG_REGMAP_I2C=y
> CONFIG_REGMAP_SLIMBUS=y
> CONFIG_REGMAP_W1=y
> CONFIG_REGMAP_MMIO=y
> CONFIG_REGMAP_IRQ=y
> CONFIG_REGMAP_I3C=y
> CONFIG_DMA_SHARED_BUFFER=y
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
>
> #
> # Bus devices
> #
> # CONFIG_ARM_INTEGRATOR_LM is not set
> # CONFIG_BRCMSTB_GISB_ARB is not set
> # CONFIG_BT1_APB is not set
> # CONFIG_BT1_AXI is not set
> CONFIG_HISILICON_LPC=y
> # CONFIG_INTEL_IXP4XX_EB is not set
> CONFIG_QCOM_EBI2=y
> CONFIG_MHI_BUS=y
> # CONFIG_MHI_BUS_DEBUG is not set
> CONFIG_MHI_BUS_PCI_GENERIC=y
> # CONFIG_MHI_BUS_EP is not set
> # end of Bus devices
>
> #
> # Firmware Drivers
> #
>
> #
> # ARM System Control and Management Interface Protocol
> #
> # CONFIG_ARM_SCMI_PROTOCOL is not set
> # end of ARM System Control and Management Interface Protocol
>
> # CONFIG_ARM_SCPI_PROTOCOL is not set
> CONFIG_MTK_ADSP_IPC=y
> CONFIG_QCOM_SCM=y
> # CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
> CONFIG_BCM47XX_NVRAM=y
> CONFIG_BCM47XX_SPROM=y
> CONFIG_TEE_BNXT_FW=y
> CONFIG_CS_DSP=y
> # CONFIG_GOOGLE_FIRMWARE is not set
> CONFIG_IMX_DSP=y
> CONFIG_IMX_SCU=y
> # CONFIG_IMX_SCU_PD is not set
>
> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
>
> # CONFIG_GNSS is not set
> CONFIG_MTD=y
>
> #
> # Partition parsers
> #
> CONFIG_MTD_AR7_PARTS=y
> CONFIG_MTD_BCM47XX_PARTS=y
> # CONFIG_MTD_BCM63XX_PARTS is not set
> CONFIG_MTD_BRCM_U_BOOT=y
> # CONFIG_MTD_CMDLINE_PARTS is not set
> CONFIG_MTD_PARSER_IMAGETAG=y
> CONFIG_MTD_PARSER_TRX=y
> # CONFIG_MTD_SHARPSL_PARTS is not set
> CONFIG_MTD_REDBOOT_PARTS=y
> CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
> # CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
> CONFIG_MTD_REDBOOT_PARTS_READONLY=y
> # end of Partition parsers
>
> #
> # User Modules And Translation Layers
> #
> CONFIG_MTD_BLKDEVS=y
> # CONFIG_MTD_BLOCK is not set
> CONFIG_MTD_BLOCK_RO=y
>
> #
> # Note that in some cases UBI block is preferred. See MTD_UBI_BLOCK.
> #
> # CONFIG_FTL is not set
> CONFIG_NFTL=y
> # CONFIG_NFTL_RW is not set
> # CONFIG_INFTL is not set
> CONFIG_RFD_FTL=y
> # CONFIG_SSFDC is not set
> # CONFIG_SM_FTL is not set
> CONFIG_MTD_OOPS=y
> # CONFIG_MTD_PSTORE is not set
> # CONFIG_MTD_PARTITIONED_MASTER is not set
>
> #
> # RAM/ROM/Flash chip drivers
> #
> # CONFIG_MTD_CFI is not set
> CONFIG_MTD_JEDECPROBE=y
> CONFIG_MTD_GEN_PROBE=y
> CONFIG_MTD_CFI_ADV_OPTIONS=y
> # CONFIG_MTD_CFI_NOSWAP is not set
> CONFIG_MTD_CFI_BE_BYTE_SWAP=y
> # CONFIG_MTD_CFI_LE_BYTE_SWAP is not set
> CONFIG_MTD_CFI_GEOMETRY=y
> # CONFIG_MTD_MAP_BANK_WIDTH_1 is not set
> CONFIG_MTD_MAP_BANK_WIDTH_2=y
> CONFIG_MTD_MAP_BANK_WIDTH_4=y
> CONFIG_MTD_MAP_BANK_WIDTH_8=y
> CONFIG_MTD_MAP_BANK_WIDTH_16=y
> # CONFIG_MTD_MAP_BANK_WIDTH_32 is not set
> CONFIG_MTD_CFI_I1=y
> # CONFIG_MTD_CFI_I2 is not set
> CONFIG_MTD_CFI_I4=y
> CONFIG_MTD_CFI_I8=y
> CONFIG_MTD_OTP=y
> CONFIG_MTD_CFI_INTELEXT=y
> CONFIG_MTD_CFI_AMDSTD=y
> CONFIG_MTD_CFI_STAA=y
> CONFIG_MTD_CFI_UTIL=y
> CONFIG_MTD_RAM=y
> CONFIG_MTD_ROM=y
> CONFIG_MTD_ABSENT=y
> # end of RAM/ROM/Flash chip drivers
>
> #
> # Mapping drivers for chip access
> #
> CONFIG_MTD_COMPLEX_MAPPINGS=y
> CONFIG_MTD_PHYSMAP=y
> # CONFIG_MTD_PHYSMAP_COMPAT is not set
> CONFIG_MTD_PHYSMAP_GPIO_ADDR=y
> CONFIG_MTD_TS5500=y
> # CONFIG_MTD_PCI is not set
> CONFIG_MTD_PCMCIA=y
> # CONFIG_MTD_PCMCIA_ANONYMOUS is not set
> CONFIG_MTD_INTEL_VR_NOR=y
> CONFIG_MTD_PLATRAM=y
> # end of Mapping drivers for chip access
>
> #
> # Self-contained MTD device drivers
> #
> # CONFIG_MTD_PMC551 is not set
> # CONFIG_MTD_SPEAR_SMI is not set
> CONFIG_MTD_SLRAM=y
> CONFIG_MTD_PHRAM=y
> # CONFIG_MTD_MTDRAM is not set
> CONFIG_MTD_BLOCK2MTD=y
>
> #
> # Disk-On-Chip Device Drivers
> #
> # CONFIG_MTD_DOCG3 is not set
> # end of Self-contained MTD device drivers
>
> #
> # NAND
> #
> CONFIG_MTD_NAND_CORE=y
> # CONFIG_MTD_ONENAND is not set
> CONFIG_MTD_RAW_NAND=y
>
> #
> # Raw/parallel NAND flash controllers
> #
> CONFIG_MTD_NAND_DENALI=y
> CONFIG_MTD_NAND_DENALI_PCI=y
> # CONFIG_MTD_NAND_AMS_DELTA is not set
> # CONFIG_MTD_NAND_SHARPSL is not set
> CONFIG_MTD_NAND_CAFE=y
> CONFIG_MTD_NAND_ATMEL=y
> # CONFIG_MTD_NAND_MARVELL is not set
> CONFIG_MTD_NAND_SLC_LPC32XX=y
> # CONFIG_MTD_NAND_MLC_LPC32XX is not set
> CONFIG_MTD_NAND_BRCMNAND=y
> CONFIG_MTD_NAND_BRCMNAND_BCM63XX=y
> CONFIG_MTD_NAND_BRCMNAND_BCMA=y
> CONFIG_MTD_NAND_BRCMNAND_BCMBCA=y
> # CONFIG_MTD_NAND_BRCMNAND_BRCMSTB is not set
> CONFIG_MTD_NAND_BRCMNAND_IPROC=y
> # CONFIG_MTD_NAND_BCM47XXNFLASH is not set
> CONFIG_MTD_NAND_OXNAS=y
> CONFIG_MTD_NAND_GPMI_NAND=y
> CONFIG_MTD_NAND_FSL_IFC=y
> CONFIG_MTD_NAND_VF610_NFC=y
> CONFIG_MTD_NAND_SH_FLCTL=y
> CONFIG_MTD_NAND_DAVINCI=y
> CONFIG_MTD_NAND_TXX9NDFMC=y
> CONFIG_MTD_NAND_SUNXI=y
> CONFIG_MTD_NAND_HISI504=y
> # CONFIG_MTD_NAND_QCOM is not set
> CONFIG_MTD_NAND_MTK=y
> CONFIG_MTD_NAND_MXIC=y
> CONFIG_MTD_NAND_TEGRA=y
> # CONFIG_MTD_NAND_STM32_FMC2 is not set
> # CONFIG_MTD_NAND_MESON is not set
> # CONFIG_MTD_NAND_GPIO is not set
> # CONFIG_MTD_NAND_PLATFORM is not set
> # CONFIG_MTD_NAND_CADENCE is not set
> CONFIG_MTD_NAND_ARASAN=y
> # CONFIG_MTD_NAND_INTEL_LGM is not set
> CONFIG_MTD_NAND_RENESAS=y
>
> #
> # Misc
> #
> CONFIG_MTD_SM_COMMON=y
> CONFIG_MTD_NAND_NANDSIM=y
> CONFIG_MTD_NAND_RICOH=y
> CONFIG_MTD_NAND_DISKONCHIP=y
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADVANCED=y
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_ADDRESS=0
> CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH=y
> CONFIG_MTD_NAND_DISKONCHIP_BBTWRITE=y
>
> #
> # ECC engine support
> #
> CONFIG_MTD_NAND_ECC=y
> CONFIG_MTD_NAND_ECC_SW_HAMMING=y
> CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC=y
> CONFIG_MTD_NAND_ECC_SW_BCH=y
> # CONFIG_MTD_NAND_ECC_MXIC is not set
> CONFIG_MTD_NAND_ECC_MEDIATEK=y
> # end of ECC engine support
> # end of NAND
>
> #
> # LPDDR & LPDDR2 PCM memory drivers
> #
> # CONFIG_MTD_LPDDR is not set
> # end of LPDDR & LPDDR2 PCM memory drivers
>
> CONFIG_MTD_UBI=y
> CONFIG_MTD_UBI_WL_THRESHOLD=4096
> CONFIG_MTD_UBI_BEB_LIMIT=20
> CONFIG_MTD_UBI_FASTMAP=y
> # CONFIG_MTD_UBI_GLUEBI is not set
> # CONFIG_MTD_UBI_BLOCK is not set
> # CONFIG_MTD_HYPERBUS is not set
> # CONFIG_OF is not set
> CONFIG_PARPORT=y
> CONFIG_PARPORT_PC=y
> # CONFIG_PARPORT_PC_FIFO is not set
> CONFIG_PARPORT_PC_PCMCIA=y
> CONFIG_PARPORT_AX88796=y
> CONFIG_PARPORT_1284=y
> CONFIG_PARPORT_NOT_PC=y
> CONFIG_BLK_DEV=y
> CONFIG_BLK_DEV_NULL_BLK=y
> # CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION is not set
> CONFIG_CDROM=y
> CONFIG_PARIDE=y
>
> #
> # Parallel IDE high-level drivers
> #
> CONFIG_PARIDE_PD=y
> CONFIG_PARIDE_PCD=y
> # CONFIG_PARIDE_PF is not set
> CONFIG_PARIDE_PT=y
> CONFIG_PARIDE_PG=y
>
> #
> # Parallel IDE protocol modules
> #
> # CONFIG_PARIDE_ATEN is not set
> CONFIG_PARIDE_BPCK=y
> CONFIG_PARIDE_BPCK6=y
> CONFIG_PARIDE_COMM=y
> # CONFIG_PARIDE_DSTR is not set
> CONFIG_PARIDE_FIT2=y
> CONFIG_PARIDE_FIT3=y
> CONFIG_PARIDE_EPAT=y
> CONFIG_PARIDE_EPATC8=y
> # CONFIG_PARIDE_EPIA is not set
> CONFIG_PARIDE_FRIQ=y
> CONFIG_PARIDE_FRPW=y
> CONFIG_PARIDE_KBIC=y
> CONFIG_PARIDE_KTTI=y
> CONFIG_PARIDE_ON20=y
> # CONFIG_PARIDE_ON26 is not set
> CONFIG_BLK_DEV_PCIESSD_MTIP32XX=y
> CONFIG_ZRAM=y
> CONFIG_ZRAM_DEF_COMP_LZORLE=y
> # CONFIG_ZRAM_DEF_COMP_ZSTD is not set
> # CONFIG_ZRAM_DEF_COMP_LZ4 is not set
> # CONFIG_ZRAM_DEF_COMP_LZO is not set
> # CONFIG_ZRAM_DEF_COMP_842 is not set
> CONFIG_ZRAM_DEF_COMP="lzo-rle"
> CONFIG_ZRAM_WRITEBACK=y
> CONFIG_ZRAM_MEMORY_TRACKING=y
> CONFIG_BLK_DEV_LOOP=y
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=8
>
> #
> # DRBD disabled because PROC_FS or INET not selected
> #
> CONFIG_BLK_DEV_RAM=y
> CONFIG_BLK_DEV_RAM_COUNT=16
> CONFIG_BLK_DEV_RAM_SIZE=4096
> CONFIG_CDROM_PKTCDVD=y
> CONFIG_CDROM_PKTCDVD_BUFFERS=8
> CONFIG_CDROM_PKTCDVD_WCACHE=y
> # CONFIG_VIRTIO_BLK is not set
> # CONFIG_BLK_DEV_UBLK is not set
>
> #
> # NVME Support
> #
> CONFIG_NVME_CORE=y
> # CONFIG_BLK_DEV_NVME is not set
> CONFIG_NVME_MULTIPATH=y
> CONFIG_NVME_VERBOSE_ERRORS=y
> CONFIG_NVME_HWMON=y
> CONFIG_NVME_FABRICS=y
> CONFIG_NVME_FC=y
> # CONFIG_NVME_AUTH is not set
> CONFIG_NVME_TARGET=y
> CONFIG_NVME_TARGET_PASSTHRU=y
> # CONFIG_NVME_TARGET_LOOP is not set
> CONFIG_NVME_TARGET_FC=y
> # CONFIG_NVME_TARGET_FCLOOP is not set
> # CONFIG_NVME_TARGET_AUTH is not set
> # end of NVME Support
>
> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=y
> CONFIG_AD525X_DPOT=y
> CONFIG_AD525X_DPOT_I2C=y
> CONFIG_DUMMY_IRQ=y
> CONFIG_PHANTOM=y
> CONFIG_TIFM_CORE=y
> # CONFIG_TIFM_7XX1 is not set
> CONFIG_ICS932S401=y
> CONFIG_ATMEL_SSC=y
> # CONFIG_ENCLOSURE_SERVICES is not set
> CONFIG_HP_ILO=y
> CONFIG_QCOM_COINCELL=y
> # CONFIG_QCOM_FASTRPC is not set
> CONFIG_APDS9802ALS=y
> CONFIG_ISL29003=y
> CONFIG_ISL29020=y
> # CONFIG_SENSORS_TSL2550 is not set
> CONFIG_SENSORS_BH1770=y
> CONFIG_SENSORS_APDS990X=y
> CONFIG_HMC6352=y
> CONFIG_DS1682=y
> CONFIG_PCH_PHUB=y
> # CONFIG_SRAM is not set
> CONFIG_DW_XDATA_PCIE=y
> CONFIG_PCI_ENDPOINT_TEST=y
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=y
> # CONFIG_HISI_HIKEY_USB is not set
> CONFIG_C2PORT=y
>
> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> CONFIG_EEPROM_LEGACY=y
> CONFIG_EEPROM_MAX6875=y
> CONFIG_EEPROM_93CX6=y
> CONFIG_EEPROM_IDT_89HPESX=y
> CONFIG_EEPROM_EE1004=y
> # end of EEPROM support
>
> CONFIG_CB710_CORE=y
> CONFIG_CB710_DEBUG=y
> CONFIG_CB710_DEBUG_ASSUMPTIONS=y
>
> #
> # Texas Instruments shared transport line discipline
> #
> # end of Texas Instruments shared transport line discipline
>
> CONFIG_SENSORS_LIS3_I2C=y
> CONFIG_ALTERA_STAPL=y
> # CONFIG_ECHO is not set
> CONFIG_BCM_VK=y
> # CONFIG_BCM_VK_TTY is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=y
> CONFIG_MISC_RTSX_USB=y
> # CONFIG_HABANA_AI is not set
> CONFIG_UACCE=y
> # CONFIG_PVPANIC is not set
> CONFIG_GP_PCI1XXXX=y
> # end of Misc devices
>
> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=y
> CONFIG_RAID_ATTRS=y
> CONFIG_SCSI_COMMON=y
> CONFIG_SCSI=y
> CONFIG_SCSI_DMA=y
> # CONFIG_SCSI_PROC_FS is not set
>
> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=y
> # CONFIG_CHR_DEV_ST is not set
> CONFIG_BLK_DEV_SR=y
> CONFIG_CHR_DEV_SG=y
> CONFIG_BLK_DEV_BSG=y
> # CONFIG_CHR_DEV_SCH is not set
> # CONFIG_SCSI_CONSTANTS is not set
> # CONFIG_SCSI_LOGGING is not set
> CONFIG_SCSI_SCAN_ASYNC=y
>
> #
> # SCSI Transports
> #
> # CONFIG_SCSI_SPI_ATTRS is not set
> CONFIG_SCSI_SAS_ATTRS=y
> CONFIG_SCSI_SAS_LIBSAS=y
> # CONFIG_SCSI_SAS_ATA is not set
> # CONFIG_SCSI_SAS_HOST_SMP is not set
> CONFIG_SCSI_SRP_ATTRS=y
> # end of SCSI Transports
>
> # CONFIG_SCSI_LOWLEVEL is not set
> # CONFIG_SCSI_DH is not set
> # end of SCSI device support
>
> CONFIG_ATA=y
> CONFIG_SATA_HOST=y
> # CONFIG_ATA_VERBOSE_ERROR is not set
> CONFIG_ATA_FORCE=y
> CONFIG_SATA_PMP=y
>
> #
> # Controllers with non-SFF native interface
> #
> # CONFIG_SATA_AHCI is not set
> # CONFIG_SATA_AHCI_PLATFORM is not set
> # CONFIG_AHCI_BRCM is not set
> CONFIG_AHCI_DA850=y
> CONFIG_AHCI_DM816=y
> CONFIG_AHCI_DWC=y
> CONFIG_AHCI_ST=y
> # CONFIG_AHCI_IMX is not set
> # CONFIG_AHCI_MTK is not set
> # CONFIG_AHCI_MVEBU is not set
> CONFIG_AHCI_SUNXI=y
> CONFIG_AHCI_TEGRA=y
> CONFIG_AHCI_XGENE=y
> CONFIG_SATA_FSL=y
> # CONFIG_SATA_AHCI_SEATTLE is not set
> CONFIG_SATA_INIC162X=y
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> # CONFIG_ATA_SFF is not set
> CONFIG_MD=y
> # CONFIG_BLK_DEV_MD is not set
> # CONFIG_BCACHE is not set
> CONFIG_BLK_DEV_DM_BUILTIN=y
> CONFIG_BLK_DEV_DM=y
> CONFIG_DM_DEBUG=y
> CONFIG_DM_BUFIO=y
> CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING=y
> # CONFIG_DM_DEBUG_BLOCK_STACK_TRACING is not set
> CONFIG_DM_BIO_PRISON=y
> CONFIG_DM_PERSISTENT_DATA=y
> CONFIG_DM_UNSTRIPED=y
> # CONFIG_DM_CRYPT is not set
> CONFIG_DM_SNAPSHOT=y
> CONFIG_DM_THIN_PROVISIONING=y
> # CONFIG_DM_CACHE is not set
> # CONFIG_DM_WRITECACHE is not set
> # CONFIG_DM_EBS is not set
> CONFIG_DM_ERA=y
> CONFIG_DM_CLONE=y
> # CONFIG_DM_MIRROR is not set
> # CONFIG_DM_RAID is not set
> # CONFIG_DM_ZERO is not set
> CONFIG_DM_MULTIPATH=y
> CONFIG_DM_MULTIPATH_QL=y
> CONFIG_DM_MULTIPATH_ST=y
> # CONFIG_DM_MULTIPATH_HST is not set
> CONFIG_DM_MULTIPATH_IOA=y
> # CONFIG_DM_DELAY is not set
> CONFIG_DM_DUST=y
> CONFIG_DM_INIT=y
> CONFIG_DM_UEVENT=y
> CONFIG_DM_FLAKEY=y
> CONFIG_DM_VERITY=y
> # CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
> CONFIG_DM_VERITY_FEC=y
> CONFIG_DM_SWITCH=y
> # CONFIG_DM_LOG_WRITES is not set
> # CONFIG_DM_INTEGRITY is not set
> CONFIG_DM_ZONED=y
> CONFIG_TARGET_CORE=y
> CONFIG_TCM_IBLOCK=y
> CONFIG_TCM_FILEIO=y
> # CONFIG_TCM_PSCSI is not set
> # CONFIG_LOOPBACK_TARGET is not set
> CONFIG_SBP_TARGET=y
> # CONFIG_FUSION is not set
>
> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=y
> # CONFIG_FIREWIRE_OHCI is not set
> CONFIG_FIREWIRE_SBP2=y
> CONFIG_FIREWIRE_NOSY=y
> # end of IEEE 1394 (FireWire) support
>
> #
> # Input device support
> #
> CONFIG_INPUT=y
> # CONFIG_INPUT_LEDS is not set
> CONFIG_INPUT_FF_MEMLESS=y
> CONFIG_INPUT_SPARSEKMAP=y
> CONFIG_INPUT_MATRIXKMAP=y
> CONFIG_INPUT_VIVALDIFMAP=y
>
> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=y
> CONFIG_INPUT_MOUSEDEV_PSAUX=y
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
> # CONFIG_INPUT_JOYDEV is not set
> CONFIG_INPUT_EVDEV=y
> # CONFIG_INPUT_EVBUG is not set
>
> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=y
> CONFIG_KEYBOARD_ADC=y
> # CONFIG_KEYBOARD_ADP5520 is not set
> # CONFIG_KEYBOARD_ADP5588 is not set
> CONFIG_KEYBOARD_ADP5589=y
> # CONFIG_KEYBOARD_ATKBD is not set
> CONFIG_KEYBOARD_QT1050=y
> # CONFIG_KEYBOARD_QT1070 is not set
> CONFIG_KEYBOARD_QT2160=y
> CONFIG_KEYBOARD_CLPS711X=y
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_EP93XX is not set
> CONFIG_KEYBOARD_GPIO=y
> CONFIG_KEYBOARD_GPIO_POLLED=y
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> CONFIG_KEYBOARD_LM8323=y
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> CONFIG_KEYBOARD_MCS=y
> CONFIG_KEYBOARD_MPR121=y
> CONFIG_KEYBOARD_IMX=y
> CONFIG_KEYBOARD_IMX_SC_KEY=y
> CONFIG_KEYBOARD_NEWTON=y
> CONFIG_KEYBOARD_OPENCORES=y
> # CONFIG_KEYBOARD_PINEPHONE is not set
> # CONFIG_KEYBOARD_PMIC8XXX is not set
> CONFIG_KEYBOARD_SAMSUNG=y
> # CONFIG_KEYBOARD_GOLDFISH_EVENTS is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_ST_KEYSCAN is not set
> CONFIG_KEYBOARD_SUNKBD=y
> CONFIG_KEYBOARD_SH_KEYSC=y
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> CONFIG_KEYBOARD_XTKBD=y
> # CONFIG_KEYBOARD_MT6779 is not set
> CONFIG_KEYBOARD_MTK_PMIC=y
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> CONFIG_INPUT_MOUSE=y
> CONFIG_MOUSE_PS2=y
> CONFIG_MOUSE_PS2_ALPS=y
> CONFIG_MOUSE_PS2_BYD=y
> CONFIG_MOUSE_PS2_LOGIPS2PP=y
> CONFIG_MOUSE_PS2_SYNAPTICS=y
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
> CONFIG_MOUSE_PS2_CYPRESS=y
> CONFIG_MOUSE_PS2_TRACKPOINT=y
> CONFIG_MOUSE_PS2_ELANTECH=y
> CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
> # CONFIG_MOUSE_PS2_SENTELIC is not set
> CONFIG_MOUSE_PS2_TOUCHKIT=y
> CONFIG_MOUSE_PS2_FOCALTECH=y
> CONFIG_MOUSE_PS2_SMBUS=y
> # CONFIG_MOUSE_SERIAL is not set
> CONFIG_MOUSE_APPLETOUCH=y
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=y
> CONFIG_MOUSE_ELAN_I2C=y
> # CONFIG_MOUSE_ELAN_I2C_I2C is not set
> CONFIG_MOUSE_ELAN_I2C_SMBUS=y
> CONFIG_MOUSE_VSXXXAA=y
> CONFIG_MOUSE_GPIO=y
> # CONFIG_MOUSE_SYNAPTICS_I2C is not set
> CONFIG_MOUSE_SYNAPTICS_USB=y
> CONFIG_INPUT_JOYSTICK=y
> CONFIG_JOYSTICK_ANALOG=y
> CONFIG_JOYSTICK_A3D=y
> CONFIG_JOYSTICK_ADC=y
> # CONFIG_JOYSTICK_ADI is not set
> # CONFIG_JOYSTICK_COBRA is not set
> # CONFIG_JOYSTICK_GF2K is not set
> CONFIG_JOYSTICK_GRIP=y
> # CONFIG_JOYSTICK_GRIP_MP is not set
> # CONFIG_JOYSTICK_GUILLEMOT is not set
> CONFIG_JOYSTICK_INTERACT=y
> CONFIG_JOYSTICK_SIDEWINDER=y
> # CONFIG_JOYSTICK_TMDC is not set
> # CONFIG_JOYSTICK_IFORCE is not set
> # CONFIG_JOYSTICK_WARRIOR is not set
> CONFIG_JOYSTICK_MAGELLAN=y
> # CONFIG_JOYSTICK_SPACEORB is not set
> # CONFIG_JOYSTICK_SPACEBALL is not set
> # CONFIG_JOYSTICK_STINGER is not set
> CONFIG_JOYSTICK_TWIDJOY=y
> CONFIG_JOYSTICK_ZHENHUA=y
> # CONFIG_JOYSTICK_DB9 is not set
> CONFIG_JOYSTICK_GAMECON=y
> # CONFIG_JOYSTICK_TURBOGRAFX is not set
> CONFIG_JOYSTICK_AS5011=y
> CONFIG_JOYSTICK_JOYDUMP=y
> CONFIG_JOYSTICK_XPAD=y
> CONFIG_JOYSTICK_XPAD_FF=y
> CONFIG_JOYSTICK_XPAD_LEDS=y
> # CONFIG_JOYSTICK_PXRC is not set
> # CONFIG_JOYSTICK_QWIIC is not set
> CONFIG_JOYSTICK_FSIA6B=y
> # CONFIG_JOYSTICK_SENSEHAT is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> # CONFIG_RMI4_CORE is not set
>
> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=y
> CONFIG_SERIO_SERPORT=y
> CONFIG_SERIO_PARKBD=y
> CONFIG_SERIO_PCIPS2=y
> CONFIG_SERIO_LIBPS2=y
> CONFIG_SERIO_RAW=y
> # CONFIG_SERIO_ALTERA_PS2 is not set
> CONFIG_SERIO_PS2MULT=y
> # CONFIG_SERIO_ARC_PS2 is not set
> CONFIG_SERIO_OLPC_APSP=y
> # CONFIG_SERIO_SUN4I_PS2 is not set
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> CONFIG_GAMEPORT=y
> CONFIG_GAMEPORT_NS558=y
> CONFIG_GAMEPORT_L4=y
> # CONFIG_GAMEPORT_EMU10K1 is not set
> CONFIG_GAMEPORT_FM801=y
> # end of Hardware I/O ports
> # end of Input device support
>
> #
> # Character devices
> #
> CONFIG_TTY=y
> CONFIG_VT=y
> CONFIG_CONSOLE_TRANSLATIONS=y
> CONFIG_VT_CONSOLE=y
> CONFIG_HW_CONSOLE=y
> CONFIG_VT_HW_CONSOLE_BINDING=y
> CONFIG_UNIX98_PTYS=y
> CONFIG_LEGACY_PTYS=y
> CONFIG_LEGACY_PTY_COUNT=256
> CONFIG_LDISC_AUTOLOAD=y
>
> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=y
> CONFIG_SERIAL_8250=y
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_16550A_VARIANTS=y
> CONFIG_SERIAL_8250_FINTEK=y
> # CONFIG_SERIAL_8250_CONSOLE is not set
> CONFIG_SERIAL_8250_DMA=y
> # CONFIG_SERIAL_8250_PCI is not set
> CONFIG_SERIAL_8250_CS=y
> CONFIG_SERIAL_8250_MEN_MCB=y
> CONFIG_SERIAL_8250_NR_UARTS=4
> CONFIG_SERIAL_8250_RUNTIME_UARTS=4
> CONFIG_SERIAL_8250_EXTENDED=y
> CONFIG_SERIAL_8250_MANY_PORTS=y
> CONFIG_SERIAL_8250_SHARE_IRQ=y
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=y
> CONFIG_SERIAL_8250_DWLIB=y
> CONFIG_SERIAL_8250_BCM2835AUX=y
> # CONFIG_SERIAL_8250_DW is not set
> CONFIG_SERIAL_8250_EM=y
> CONFIG_SERIAL_8250_IOC3=y
> CONFIG_SERIAL_8250_RT288X=y
> CONFIG_SERIAL_8250_OMAP=y
> # CONFIG_SERIAL_8250_MT6577 is not set
> # CONFIG_SERIAL_8250_UNIPHIER is not set
> CONFIG_SERIAL_8250_LPSS=y
> # CONFIG_SERIAL_8250_MID is not set
> # CONFIG_SERIAL_8250_PERICOM is not set
> CONFIG_SERIAL_8250_PXA=y
> CONFIG_SERIAL_8250_TEGRA=y
> CONFIG_SERIAL_8250_BCM7271=y
>
> #
> # Non-8250 serial port support
> #
> CONFIG_SERIAL_AMBA_PL010=y
> # CONFIG_SERIAL_AMBA_PL010_CONSOLE is not set
> # CONFIG_SERIAL_ATMEL is not set
> CONFIG_SERIAL_MESON=y
> # CONFIG_SERIAL_MESON_CONSOLE is not set
> # CONFIG_SERIAL_CLPS711X is not set
> CONFIG_SERIAL_SAMSUNG=y
> CONFIG_SERIAL_SAMSUNG_UARTS_4=y
> CONFIG_SERIAL_SAMSUNG_UARTS=4
> # CONFIG_SERIAL_SAMSUNG_CONSOLE is not set
> CONFIG_SERIAL_TEGRA=y
> CONFIG_SERIAL_TEGRA_TCU=y
> # CONFIG_SERIAL_TEGRA_TCU_CONSOLE is not set
> CONFIG_SERIAL_IMX=y
> CONFIG_SERIAL_IMX_CONSOLE=y
> CONFIG_SERIAL_UARTLITE=y
> CONFIG_SERIAL_UARTLITE_CONSOLE=y
> CONFIG_SERIAL_UARTLITE_NR_UARTS=1
> CONFIG_SERIAL_SH_SCI=y
> CONFIG_SERIAL_SH_SCI_NR_UARTS=2
> CONFIG_SERIAL_SH_SCI_CONSOLE=y
> CONFIG_SERIAL_CORE=y
> CONFIG_SERIAL_CORE_CONSOLE=y
> # CONFIG_SERIAL_PIC32 is not set
> CONFIG_SERIAL_ICOM=y
> CONFIG_SERIAL_JSM=y
> CONFIG_SERIAL_MSM=y
> # CONFIG_SERIAL_MSM_CONSOLE is not set
> CONFIG_SERIAL_QCOM_GENI=y
> CONFIG_SERIAL_QCOM_GENI_CONSOLE=y
> CONFIG_SERIAL_VT8500=y
> CONFIG_SERIAL_VT8500_CONSOLE=y
> CONFIG_SERIAL_OMAP=y
> # CONFIG_SERIAL_OMAP_CONSOLE is not set
> # CONFIG_SERIAL_LANTIQ is not set
> CONFIG_SERIAL_SCCNXP=y
> CONFIG_SERIAL_SCCNXP_CONSOLE=y
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_TIMBERDALE is not set
> CONFIG_SERIAL_BCM63XX=y
> CONFIG_SERIAL_BCM63XX_CONSOLE=y
> CONFIG_SERIAL_ALTERA_JTAGUART=y
> CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
> # CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_PCH_UART=y
> # CONFIG_SERIAL_PCH_UART_CONSOLE is not set
> # CONFIG_SERIAL_MXS_AUART is not set
> # CONFIG_SERIAL_AR933X is not set
> # CONFIG_SERIAL_MPS2_UART_CONSOLE is not set
> CONFIG_SERIAL_MPS2_UART=y
> CONFIG_SERIAL_ARC=y
> # CONFIG_SERIAL_ARC_CONSOLE is not set
> CONFIG_SERIAL_ARC_NR_PORTS=1
> CONFIG_SERIAL_RP2=y
> CONFIG_SERIAL_RP2_NR_UARTS=32
> CONFIG_SERIAL_FSL_LPUART=y
> # CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> CONFIG_SERIAL_ST_ASC=y
> CONFIG_SERIAL_ST_ASC_CONSOLE=y
> CONFIG_SERIAL_MEN_Z135=y
> # CONFIG_SERIAL_SPRD is not set
> CONFIG_SERIAL_STM32=y
> # CONFIG_SERIAL_STM32_CONSOLE is not set
> CONFIG_SERIAL_MVEBU_UART=y
> CONFIG_SERIAL_MVEBU_CONSOLE=y
> CONFIG_SERIAL_OWL=y
> # CONFIG_SERIAL_OWL_CONSOLE is not set
> CONFIG_SERIAL_RDA=y
> # CONFIG_SERIAL_RDA_CONSOLE is not set
> CONFIG_SERIAL_LITEUART=y
> CONFIG_SERIAL_LITEUART_MAX_PORTS=1
> CONFIG_SERIAL_LITEUART_CONSOLE=y
> CONFIG_SERIAL_SUNPLUS=y
> CONFIG_SERIAL_SUNPLUS_CONSOLE=y
> # end of Serial drivers
>
> CONFIG_SERIAL_MCTRL_GPIO=y
> CONFIG_SERIAL_NONSTANDARD=y
> CONFIG_MOXA_INTELLIO=y
> CONFIG_MOXA_SMARTIO=y
> # CONFIG_SYNCLINK_GT is not set
> CONFIG_N_HDLC=y
> # CONFIG_GOLDFISH_TTY is not set
> CONFIG_NOZOMI=y
> CONFIG_NULL_TTY=y
> CONFIG_HVC_DRIVER=y
> # CONFIG_RPMSG_TTY is not set
> CONFIG_SERIAL_DEV_BUS=y
> # CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
> CONFIG_PRINTER=y
> CONFIG_LP_CONSOLE=y
> CONFIG_PPDEV=y
> CONFIG_VIRTIO_CONSOLE=y
> CONFIG_IPMI_HANDLER=y
> CONFIG_IPMI_PLAT_DATA=y
> # CONFIG_IPMI_PANIC_EVENT is not set
> CONFIG_IPMI_DEVICE_INTERFACE=y
> CONFIG_IPMI_SI=y
> # CONFIG_IPMI_SSIF is not set
> CONFIG_IPMI_IPMB=y
> CONFIG_IPMI_WATCHDOG=y
> # CONFIG_IPMI_POWEROFF is not set
> CONFIG_IPMI_KCS_BMC=y
> CONFIG_ASPEED_KCS_IPMI_BMC=y
> # CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
> CONFIG_IPMI_KCS_BMC_CDEV_IPMI=y
> CONFIG_IPMI_KCS_BMC_SERIO=y
> CONFIG_ASPEED_BT_IPMI_BMC=y
> # CONFIG_IPMB_DEVICE_INTERFACE is not set
> CONFIG_HW_RANDOM=y
> CONFIG_HW_RANDOM_TIMERIOMEM=y
> CONFIG_HW_RANDOM_BA431=y
> CONFIG_HW_RANDOM_BCM2835=y
> CONFIG_HW_RANDOM_IPROC_RNG200=y
> # CONFIG_HW_RANDOM_IXP4XX is not set
> # CONFIG_HW_RANDOM_OMAP is not set
> CONFIG_HW_RANDOM_OMAP3_ROM=y
> CONFIG_HW_RANDOM_VIRTIO=y
> CONFIG_HW_RANDOM_IMX_RNGC=y
> CONFIG_HW_RANDOM_NOMADIK=y
> CONFIG_HW_RANDOM_STM32=y
> CONFIG_HW_RANDOM_POLARFIRE_SOC=y
> # CONFIG_HW_RANDOM_MESON is not set
> CONFIG_HW_RANDOM_MTK=y
> CONFIG_HW_RANDOM_EXYNOS=y
> CONFIG_HW_RANDOM_NPCM=y
> # CONFIG_HW_RANDOM_XIPHERA is not set
> CONFIG_APPLICOM=y
>
> #
> # PCMCIA character devices
> #
> # CONFIG_SYNCLINK_CS is not set
> # CONFIG_CARDMAN_4000 is not set
> # CONFIG_CARDMAN_4040 is not set
> CONFIG_SCR24X=y
> # end of PCMCIA character devices
>
> # CONFIG_DEVMEM is not set
> # CONFIG_DEVPORT is not set
> CONFIG_TCG_TPM=y
> CONFIG_HW_RANDOM_TPM=y
> CONFIG_TCG_TIS_CORE=y
> # CONFIG_TCG_TIS_I2C is not set
> CONFIG_TCG_TIS_SYNQUACER=y
> CONFIG_TCG_TIS_I2C_CR50=y
> # CONFIG_TCG_TIS_I2C_ATMEL is not set
> # CONFIG_TCG_TIS_I2C_INFINEON is not set
> # CONFIG_TCG_TIS_I2C_NUVOTON is not set
> CONFIG_TCG_ATMEL=y
> CONFIG_TCG_VTPM_PROXY=y
> CONFIG_TCG_TIS_ST33ZP24=y
> CONFIG_TCG_TIS_ST33ZP24_I2C=y
> CONFIG_XILLYBUS_CLASS=y
> CONFIG_XILLYBUS=y
> # CONFIG_XILLYBUS_PCIE is not set
> CONFIG_XILLYUSB=y
> CONFIG_RANDOM_TRUST_CPU=y
> CONFIG_RANDOM_TRUST_BOOTLOADER=y
> # end of Character devices
>
> #
> # I2C support
> #
> CONFIG_I2C=y
> CONFIG_I2C_BOARDINFO=y
> CONFIG_I2C_COMPAT=y
> CONFIG_I2C_CHARDEV=y
> CONFIG_I2C_MUX=y
>
> #
> # Multiplexer I2C Chip support
> #
> CONFIG_I2C_MUX_GPIO=y
> CONFIG_I2C_MUX_LTC4306=y
> CONFIG_I2C_MUX_PCA9541=y
> CONFIG_I2C_MUX_PCA954x=y
> CONFIG_I2C_MUX_REG=y
> CONFIG_I2C_MUX_MLXCPLD=y
> # end of Multiplexer I2C Chip support
>
> # CONFIG_I2C_HELPER_AUTO is not set
> CONFIG_I2C_SMBUS=y
>
> #
> # I2C Algorithms
> #
> CONFIG_I2C_ALGOBIT=y
> CONFIG_I2C_ALGOPCF=y
> CONFIG_I2C_ALGOPCA=y
> # end of I2C Algorithms
>
> #
> # I2C Hardware Bus support
> #
>
> #
> # PC SMBus host controller drivers
> #
> CONFIG_I2C_CCGX_UCSI=y
> CONFIG_I2C_ALI1535=y
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> # CONFIG_I2C_AMD756 is not set
> CONFIG_I2C_AMD8111=y
> CONFIG_I2C_HIX5HD2=y
> CONFIG_I2C_I801=y
> # CONFIG_I2C_ISCH is not set
> CONFIG_I2C_PIIX4=y
> # CONFIG_I2C_NFORCE2 is not set
> CONFIG_I2C_NVIDIA_GPU=y
> # CONFIG_I2C_SIS5595 is not set
> CONFIG_I2C_SIS630=y
> CONFIG_I2C_SIS96X=y
> CONFIG_I2C_VIA=y
> CONFIG_I2C_VIAPRO=y
>
> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> CONFIG_I2C_ASPEED=y
> CONFIG_I2C_AT91=y
> # CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL is not set
> CONFIG_I2C_AXXIA=y
> # CONFIG_I2C_BCM2835 is not set
> # CONFIG_I2C_BCM_IPROC is not set
> CONFIG_I2C_BCM_KONA=y
> # CONFIG_I2C_BRCMSTB is not set
> CONFIG_I2C_CADENCE=y
> # CONFIG_I2C_CBUS_GPIO is not set
> # CONFIG_I2C_DAVINCI is not set
> CONFIG_I2C_DESIGNWARE_CORE=y
> CONFIG_I2C_DESIGNWARE_SLAVE=y
> CONFIG_I2C_DESIGNWARE_PLATFORM=y
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> CONFIG_I2C_DIGICOLOR=y
> CONFIG_I2C_EG20T=y
> CONFIG_I2C_EMEV2=y
> CONFIG_I2C_GPIO=y
> CONFIG_I2C_GPIO_FAULT_INJECTOR=y
> CONFIG_I2C_HIGHLANDER=y
> # CONFIG_I2C_HISI is not set
> CONFIG_I2C_IMG=y
> CONFIG_I2C_IMX=y
> # CONFIG_I2C_IMX_LPI2C is not set
> # CONFIG_I2C_IOP3XX is not set
> # CONFIG_I2C_JZ4780 is not set
> # CONFIG_I2C_KEMPLD is not set
> # CONFIG_I2C_MESON is not set
> # CONFIG_I2C_MT65XX is not set
> CONFIG_I2C_MT7621=y
> CONFIG_I2C_MV64XXX=y
> # CONFIG_I2C_MXS is not set
> CONFIG_I2C_NPCM=y
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_OMAP=y
> CONFIG_I2C_OWL=y
> CONFIG_I2C_APPLE=y
> # CONFIG_I2C_PCA_PLATFORM is not set
> CONFIG_I2C_PNX=y
> # CONFIG_I2C_PXA is not set
> CONFIG_I2C_QCOM_CCI=y
> # CONFIG_I2C_QCOM_GENI is not set
> # CONFIG_I2C_QUP is not set
> CONFIG_I2C_RIIC=y
> CONFIG_I2C_RZV2M=y
> CONFIG_I2C_S3C2410=y
> CONFIG_I2C_SH_MOBILE=y
> CONFIG_I2C_SIMTEC=y
> CONFIG_I2C_SPRD=y
> # CONFIG_I2C_ST is not set
> CONFIG_I2C_STM32F4=y
> CONFIG_I2C_STM32F7=y
> # CONFIG_I2C_SUN6I_P2WI is not set
> CONFIG_I2C_SYNQUACER=y
> CONFIG_I2C_TEGRA_BPMP=y
> # CONFIG_I2C_UNIPHIER is not set
> # CONFIG_I2C_UNIPHIER_F is not set
> CONFIG_I2C_VERSATILE=y
> # CONFIG_I2C_WMT is not set
> CONFIG_I2C_XILINX=y
> # CONFIG_I2C_XLP9XX is not set
> # CONFIG_I2C_RCAR is not set
>
> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> CONFIG_I2C_DLN2=y
> CONFIG_I2C_CP2615=y
> CONFIG_I2C_PARPORT=y
> CONFIG_I2C_PCI1XXXX=y
> CONFIG_I2C_ROBOTFUZZ_OSIF=y
> CONFIG_I2C_TAOS_EVM=y
> # CONFIG_I2C_TINY_USB is not set
> CONFIG_I2C_VIPERBOARD=y
>
> #
> # Other I2C/SMBus bus drivers
> #
> # CONFIG_I2C_MLXCPLD is not set
> CONFIG_I2C_VIRTIO=y
> # end of I2C Hardware Bus support
>
> CONFIG_I2C_SLAVE=y
> # CONFIG_I2C_SLAVE_EEPROM is not set
> # CONFIG_I2C_SLAVE_TESTUNIT is not set
> CONFIG_I2C_DEBUG_CORE=y
> # CONFIG_I2C_DEBUG_ALGO is not set
> CONFIG_I2C_DEBUG_BUS=y
> # end of I2C support
>
> CONFIG_I3C=y
> CONFIG_CDNS_I3C_MASTER=y
> CONFIG_DW_I3C_MASTER=y
> CONFIG_SVC_I3C_MASTER=y
> # CONFIG_MIPI_I3C_HCI is not set
> # CONFIG_SPI is not set
> # CONFIG_SPMI is not set
> CONFIG_HSI=y
> CONFIG_HSI_BOARDINFO=y
>
> #
> # HSI controllers
> #
>
> #
> # HSI clients
> #
> # CONFIG_HSI_CHAR is not set
> CONFIG_PPS=y
> CONFIG_PPS_DEBUG=y
>
> #
> # PPS clients support
> #
> CONFIG_PPS_CLIENT_KTIMER=y
> CONFIG_PPS_CLIENT_LDISC=y
> CONFIG_PPS_CLIENT_PARPORT=y
> # CONFIG_PPS_CLIENT_GPIO is not set
>
> #
> # PPS generators support
> #
>
> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK_OPTIONAL=y
>
> #
> # Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
> #
> # end of PTP clock support
>
> CONFIG_PINCTRL=y
> CONFIG_PINMUX=y
> CONFIG_PINCONF=y
> CONFIG_GENERIC_PINCONF=y
> # CONFIG_DEBUG_PINCTRL is not set
> # CONFIG_PINCTRL_AMD is not set
> CONFIG_PINCTRL_CY8C95X0=y
> CONFIG_PINCTRL_DA9062=y
> CONFIG_PINCTRL_MCP23S08_I2C=y
> CONFIG_PINCTRL_MCP23S08=y
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_MADERA=y
> CONFIG_PINCTRL_CS47L35=y
> CONFIG_PINCTRL_CS47L85=y
> CONFIG_PINCTRL_CS47L90=y
>
> #
> # Intel pinctrl drivers
> #
> # end of Intel pinctrl drivers
>
> #
> # MediaTek pinctrl drivers
> #
> CONFIG_EINT_MTK=y
> # end of MediaTek pinctrl drivers
>
> CONFIG_PINCTRL_PXA=y
> # CONFIG_PINCTRL_PXA25X is not set
> CONFIG_PINCTRL_PXA27X=y
> CONFIG_PINCTRL_MSM=y
> CONFIG_PINCTRL_SM8350=y
> # CONFIG_PINCTRL_LPASS_LPI is not set
>
> #
> # Renesas pinctrl drivers
> #
> # CONFIG_PINCTRL_RENESAS is not set
> CONFIG_PINCTRL_SH_PFC=y
> CONFIG_PINCTRL_SH_PFC_GPIO=y
> CONFIG_PINCTRL_SH_FUNC_GPIO=y
> # CONFIG_PINCTRL_PFC_EMEV2 is not set
> CONFIG_PINCTRL_PFC_R8A77995=y
> CONFIG_PINCTRL_PFC_R8A7794=y
> # CONFIG_PINCTRL_PFC_R8A77990 is not set
> # CONFIG_PINCTRL_PFC_R8A7779 is not set
> CONFIG_PINCTRL_PFC_R8A7790=y
> # CONFIG_PINCTRL_PFC_R8A77950 is not set
> CONFIG_PINCTRL_PFC_R8A77951=y
> CONFIG_PINCTRL_PFC_R8A7778=y
> CONFIG_PINCTRL_PFC_R8A7793=y
> # CONFIG_PINCTRL_PFC_R8A7791 is not set
> # CONFIG_PINCTRL_PFC_R8A77965 is not set
> CONFIG_PINCTRL_PFC_R8A77960=y
> # CONFIG_PINCTRL_PFC_R8A77961 is not set
> # CONFIG_PINCTRL_PFC_R8A779F0 is not set
> # CONFIG_PINCTRL_PFC_R8A7792 is not set
> # CONFIG_PINCTRL_PFC_R8A77980 is not set
> # CONFIG_PINCTRL_PFC_R8A77970 is not set
> CONFIG_PINCTRL_PFC_R8A779A0=y
> # CONFIG_PINCTRL_PFC_R8A779G0 is not set
> # CONFIG_PINCTRL_PFC_R8A7740 is not set
> # CONFIG_PINCTRL_PFC_R8A73A4 is not set
> # CONFIG_PINCTRL_PFC_R8A77470 is not set
> CONFIG_PINCTRL_PFC_R8A7745=y
> CONFIG_PINCTRL_PFC_R8A7742=y
> CONFIG_PINCTRL_PFC_R8A7743=y
> CONFIG_PINCTRL_PFC_R8A7744=y
> CONFIG_PINCTRL_PFC_R8A774C0=y
> # CONFIG_PINCTRL_PFC_R8A774E1 is not set
> # CONFIG_PINCTRL_PFC_R8A774A1 is not set
> CONFIG_PINCTRL_PFC_R8A774B1=y
> # CONFIG_PINCTRL_PFC_SH7203 is not set
> CONFIG_PINCTRL_PFC_SH7264=y
> CONFIG_PINCTRL_PFC_SH7269=y
> # CONFIG_PINCTRL_PFC_SH7720 is not set
> CONFIG_PINCTRL_PFC_SH7722=y
> CONFIG_PINCTRL_PFC_SH7734=y
> CONFIG_PINCTRL_PFC_SH7757=y
> CONFIG_PINCTRL_PFC_SH7785=y
> CONFIG_PINCTRL_PFC_SH7786=y
> # CONFIG_PINCTRL_PFC_SH73A0 is not set
> # CONFIG_PINCTRL_PFC_SH7723 is not set
> CONFIG_PINCTRL_PFC_SH7724=y
> # CONFIG_PINCTRL_PFC_SHX3 is not set
> # end of Renesas pinctrl drivers
>
> CONFIG_GPIOLIB=y
> CONFIG_GPIOLIB_FASTPATH_LIMIT=512
> CONFIG_GPIOLIB_IRQCHIP=y
> CONFIG_DEBUG_GPIO=y
> CONFIG_GPIO_CDEV=y
> CONFIG_GPIO_CDEV_V1=y
> CONFIG_GPIO_GENERIC=y
>
> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_ATH79=y
> CONFIG_GPIO_CLPS711X=y
> CONFIG_GPIO_DWAPB=y
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> # CONFIG_GPIO_HISI is not set
> CONFIG_GPIO_IMX_SCU=y
> CONFIG_GPIO_IOP=y
> CONFIG_GPIO_MB86S7X=y
> # CONFIG_GPIO_MENZ127 is not set
> CONFIG_GPIO_MPC8XXX=y
> # CONFIG_GPIO_MXC is not set
> # CONFIG_GPIO_MXS is not set
> # CONFIG_GPIO_PXA is not set
> CONFIG_GPIO_RCAR=y
> # CONFIG_GPIO_ROCKCHIP is not set
> CONFIG_GPIO_SIOX=y
> CONFIG_GPIO_VX855=y
> CONFIG_GPIO_XGENE_SB=y
> # CONFIG_GPIO_XLP is not set
> CONFIG_GPIO_AMD_FCH=y
> # CONFIG_GPIO_IDT3243X is not set
> # end of Memory mapped GPIO drivers
>
> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_MAX7300 is not set
> CONFIG_GPIO_MAX732X=y
> CONFIG_GPIO_MAX732X_IRQ=y
> CONFIG_GPIO_PCA953X=y
> # CONFIG_GPIO_PCA953X_IRQ is not set
> CONFIG_GPIO_PCA9570=y
> CONFIG_GPIO_PCF857X=y
> # CONFIG_GPIO_TPIC2810 is not set
> # CONFIG_GPIO_TS4900 is not set
> # end of I2C GPIO expanders
>
> #
> # MFD GPIO expanders
> #
> # CONFIG_GPIO_ADP5520 is not set
> # CONFIG_GPIO_DLN2 is not set
> CONFIG_GPIO_JANZ_TTL=y
> CONFIG_GPIO_KEMPLD=y
> CONFIG_GPIO_LP873X=y
> CONFIG_GPIO_MADERA=y
> # CONFIG_GPIO_SL28CPLD is not set
> # CONFIG_GPIO_TPS65910 is not set
> CONFIG_GPIO_TQMX86=y
> CONFIG_GPIO_TWL6040=y
> CONFIG_GPIO_WM831X=y
> CONFIG_GPIO_WM8350=y
> # CONFIG_GPIO_WM8994 is not set
> # end of MFD GPIO expanders
>
> #
> # PCI GPIO expanders
> #
> CONFIG_GPIO_AMD8111=y
> # CONFIG_GPIO_BT8XX is not set
> CONFIG_GPIO_ML_IOH=y
> CONFIG_GPIO_PCH=y
> CONFIG_GPIO_PCI_IDIO_16=y
> CONFIG_GPIO_PCIE_IDIO_24=y
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
>
> #
> # USB GPIO expanders
> #
> CONFIG_GPIO_VIPERBOARD=y
> # end of USB GPIO expanders
>
> #
> # Virtual GPIO drivers
> #
> CONFIG_GPIO_AGGREGATOR=y
> CONFIG_GPIO_MOCKUP=y
> # CONFIG_GPIO_VIRTIO is not set
> CONFIG_GPIO_SIM=y
> # end of Virtual GPIO drivers
>
> CONFIG_W1=y
>
> #
> # 1-wire Bus Masters
> #
> CONFIG_W1_MASTER_MATROX=y
> CONFIG_W1_MASTER_DS2490=y
> CONFIG_W1_MASTER_DS2482=y
> CONFIG_W1_MASTER_MXC=y
> CONFIG_W1_MASTER_DS1WM=y
> # CONFIG_W1_MASTER_GPIO is not set
> # CONFIG_W1_MASTER_SGI is not set
> # end of 1-wire Bus Masters
>
> #
> # 1-wire Slaves
> #
> CONFIG_W1_SLAVE_THERM=y
> CONFIG_W1_SLAVE_SMEM=y
> CONFIG_W1_SLAVE_DS2405=y
> # CONFIG_W1_SLAVE_DS2408 is not set
> CONFIG_W1_SLAVE_DS2413=y
> CONFIG_W1_SLAVE_DS2406=y
> CONFIG_W1_SLAVE_DS2423=y
> CONFIG_W1_SLAVE_DS2805=y
> # CONFIG_W1_SLAVE_DS2430 is not set
> CONFIG_W1_SLAVE_DS2431=y
> CONFIG_W1_SLAVE_DS2433=y
> # CONFIG_W1_SLAVE_DS2433_CRC is not set
> CONFIG_W1_SLAVE_DS2438=y
> CONFIG_W1_SLAVE_DS250X=y
> CONFIG_W1_SLAVE_DS2780=y
> CONFIG_W1_SLAVE_DS2781=y
> CONFIG_W1_SLAVE_DS28E04=y
> # CONFIG_W1_SLAVE_DS28E17 is not set
> # end of 1-wire Slaves
>
> CONFIG_POWER_RESET=y
> CONFIG_POWER_RESET_ATC260X=y
> CONFIG_POWER_RESET_BRCMKONA=y
> CONFIG_POWER_RESET_BRCMSTB=y
> # CONFIG_POWER_RESET_OCELOT_RESET is not set
> # CONFIG_POWER_RESET_PIIX4_POWEROFF is not set
> # CONFIG_POWER_RESET_MT6323 is not set
> CONFIG_POWER_RESET_RESTART=y
> CONFIG_POWER_RESET_KEYSTONE=y
> CONFIG_POWER_RESET_RMOBILE=y
> # CONFIG_POWER_RESET_SC27XX is not set
> CONFIG_POWER_SUPPLY=y
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> # CONFIG_POWER_SUPPLY_HWMON is not set
> CONFIG_PDA_POWER=y
> CONFIG_GENERIC_ADC_BATTERY=y
> # CONFIG_IP5XXX_POWER is not set
> CONFIG_MAX8925_POWER=y
> # CONFIG_WM831X_BACKUP is not set
> # CONFIG_WM831X_POWER is not set
> # CONFIG_WM8350_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> CONFIG_BATTERY_ACT8945A=y
> # CONFIG_BATTERY_CW2015 is not set
> CONFIG_BATTERY_DS2760=y
> CONFIG_BATTERY_DS2780=y
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SAMSUNG_SDI is not set
> CONFIG_BATTERY_INGENIC=y
> CONFIG_BATTERY_SBS=y
> # CONFIG_CHARGER_SBS is not set
> CONFIG_MANAGER_SBS=y
> CONFIG_BATTERY_BQ27XXX=y
> CONFIG_BATTERY_BQ27XXX_I2C=y
> CONFIG_BATTERY_BQ27XXX_HDQ=y
> CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
> CONFIG_BATTERY_DA9150=y
> CONFIG_BATTERY_MAX17040=y
> # CONFIG_BATTERY_MAX17042 is not set
> CONFIG_BATTERY_MAX1721X=y
> CONFIG_CHARGER_PCF50633=y
> CONFIG_CHARGER_ISP1704=y
> CONFIG_CHARGER_MAX8903=y
> CONFIG_CHARGER_LP8727=y
> # CONFIG_CHARGER_LP8788 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_MANAGER is not set
> CONFIG_CHARGER_LT3651=y
> # CONFIG_CHARGER_LTC4162L is not set
> # CONFIG_CHARGER_MAX77693 is not set
> CONFIG_CHARGER_MAX77976=y
> CONFIG_CHARGER_MP2629=y
> # CONFIG_CHARGER_MT6360 is not set
> CONFIG_CHARGER_MT6370=y
> CONFIG_CHARGER_BQ2415X=y
> CONFIG_CHARGER_BQ24190=y
> # CONFIG_CHARGER_BQ24257 is not set
> CONFIG_CHARGER_BQ24735=y
> CONFIG_CHARGER_BQ2515X=y
> # CONFIG_CHARGER_BQ25890 is not set
> CONFIG_CHARGER_BQ25980=y
> CONFIG_CHARGER_BQ256XX=y
> CONFIG_CHARGER_SMB347=y
> CONFIG_CHARGER_TPS65090=y
> CONFIG_BATTERY_GAUGE_LTC2941=y
> # CONFIG_BATTERY_GOLDFISH is not set
> CONFIG_BATTERY_RT5033=y
> CONFIG_CHARGER_RT9455=y
> CONFIG_CHARGER_SC2731=y
> CONFIG_FUEL_GAUGE_SC27XX=y
> CONFIG_CHARGER_BD99954=y
> CONFIG_BATTERY_ACER_A500=y
> CONFIG_BATTERY_UG3105=y
> CONFIG_HWMON=y
> CONFIG_HWMON_VID=y
> # CONFIG_HWMON_DEBUG_CHIP is not set
>
> #
> # Native drivers
> #
> CONFIG_SENSORS_AD7414=y
> # CONFIG_SENSORS_AD7418 is not set
> # CONFIG_SENSORS_ADM1025 is not set
> # CONFIG_SENSORS_ADM1026 is not set
> CONFIG_SENSORS_ADM1029=y
> # CONFIG_SENSORS_ADM1031 is not set
> CONFIG_SENSORS_ADM1177=y
> # CONFIG_SENSORS_ADM9240 is not set
> CONFIG_SENSORS_ADT7X10=y
> CONFIG_SENSORS_ADT7410=y
> CONFIG_SENSORS_ADT7411=y
> CONFIG_SENSORS_ADT7462=y
> CONFIG_SENSORS_ADT7470=y
> # CONFIG_SENSORS_ADT7475 is not set
> # CONFIG_SENSORS_AHT10 is not set
> # CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
> # CONFIG_SENSORS_AS370 is not set
> # CONFIG_SENSORS_ASC7621 is not set
> CONFIG_SENSORS_AXI_FAN_CONTROL=y
> CONFIG_SENSORS_ASB100=y
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=y
> CONFIG_SENSORS_BT1_PVT=y
> # CONFIG_SENSORS_BT1_PVT_ALARMS is not set
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> # CONFIG_SENSORS_DRIVETEMP is not set
> CONFIG_SENSORS_DS620=y
> CONFIG_SENSORS_DS1621=y
> # CONFIG_SENSORS_I5K_AMB is not set
> CONFIG_SENSORS_SPARX5=y
> CONFIG_SENSORS_F71805F=y
> CONFIG_SENSORS_F71882FG=y
> # CONFIG_SENSORS_F75375S is not set
> CONFIG_SENSORS_MC13783_ADC=y
> CONFIG_SENSORS_FSCHMD=y
> CONFIG_SENSORS_GL518SM=y
> CONFIG_SENSORS_GL520SM=y
> CONFIG_SENSORS_G760A=y
> CONFIG_SENSORS_G762=y
> CONFIG_SENSORS_HIH6130=y
> CONFIG_SENSORS_IBMAEM=y
> CONFIG_SENSORS_IBMPEX=y
> CONFIG_SENSORS_IIO_HWMON=y
> CONFIG_SENSORS_IT87=y
> # CONFIG_SENSORS_JC42 is not set
> CONFIG_SENSORS_POWR1220=y
> # CONFIG_SENSORS_LAN966X is not set
> # CONFIG_SENSORS_LINEAGE is not set
> CONFIG_SENSORS_LTC2945=y
> CONFIG_SENSORS_LTC2947=y
> CONFIG_SENSORS_LTC2947_I2C=y
> CONFIG_SENSORS_LTC2990=y
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=y
> CONFIG_SENSORS_LTC4215=y
> CONFIG_SENSORS_LTC4222=y
> CONFIG_SENSORS_LTC4245=y
> CONFIG_SENSORS_LTC4260=y
> CONFIG_SENSORS_LTC4261=y
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=y
> CONFIG_SENSORS_MAX1619=y
> # CONFIG_SENSORS_MAX1668 is not set
> CONFIG_SENSORS_MAX197=y
> # CONFIG_SENSORS_MAX31730 is not set
> CONFIG_SENSORS_MAX31760=y
> # CONFIG_SENSORS_MAX6620 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=y
> # CONFIG_SENSORS_MAX6650 is not set
> # CONFIG_SENSORS_MAX6697 is not set
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=y
> CONFIG_SENSORS_TC654=y
> CONFIG_SENSORS_TPS23861=y
> # CONFIG_SENSORS_MR75203 is not set
> CONFIG_SENSORS_LM63=y
> # CONFIG_SENSORS_LM73 is not set
> CONFIG_SENSORS_LM75=y
> CONFIG_SENSORS_LM77=y
> CONFIG_SENSORS_LM78=y
> # CONFIG_SENSORS_LM80 is not set
> CONFIG_SENSORS_LM83=y
> # CONFIG_SENSORS_LM85 is not set
> CONFIG_SENSORS_LM87=y
> CONFIG_SENSORS_LM90=y
> # CONFIG_SENSORS_LM92 is not set
> # CONFIG_SENSORS_LM93 is not set
> CONFIG_SENSORS_LM95234=y
> CONFIG_SENSORS_LM95241=y
> # CONFIG_SENSORS_LM95245 is not set
> CONFIG_SENSORS_PC87360=y
> CONFIG_SENSORS_PC87427=y
> CONFIG_SENSORS_NTC_THERMISTOR=y
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775_CORE=y
> # CONFIG_SENSORS_NCT6775 is not set
> CONFIG_SENSORS_NCT6775_I2C=y
> # CONFIG_SENSORS_NCT7802 is not set
> CONFIG_SENSORS_NPCM7XX=y
> CONFIG_SENSORS_NZXT_KRAKEN2=y
> # CONFIG_SENSORS_NZXT_SMART2 is not set
> CONFIG_SENSORS_OCC_P8_I2C=y
> CONFIG_SENSORS_OCC=y
> CONFIG_SENSORS_PCF8591=y
> # CONFIG_SENSORS_PECI_CPUTEMP is not set
> # CONFIG_SENSORS_PECI_DIMMTEMP is not set
> CONFIG_PMBUS=y
> CONFIG_SENSORS_PMBUS=y
> # CONFIG_SENSORS_ADM1266 is not set
> CONFIG_SENSORS_ADM1275=y
> CONFIG_SENSORS_BEL_PFE=y
> CONFIG_SENSORS_BPA_RS600=y
> # CONFIG_SENSORS_DELTA_AHE50DC_FAN is not set
> # CONFIG_SENSORS_FSP_3Y is not set
> CONFIG_SENSORS_IBM_CFFPS=y
> CONFIG_SENSORS_DPS920AB=y
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> CONFIG_SENSORS_IR35221=y
> CONFIG_SENSORS_IR36021=y
> CONFIG_SENSORS_IR38064=y
> # CONFIG_SENSORS_IR38064_REGULATOR is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> # CONFIG_SENSORS_LM25066 is not set
> CONFIG_SENSORS_LT7182S=y
> CONFIG_SENSORS_LTC2978=y
> CONFIG_SENSORS_LTC2978_REGULATOR=y
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX15301=y
> # CONFIG_SENSORS_MAX16064 is not set
> CONFIG_SENSORS_MAX16601=y
> CONFIG_SENSORS_MAX20730=y
> CONFIG_SENSORS_MAX20751=y
> CONFIG_SENSORS_MAX31785=y
> CONFIG_SENSORS_MAX34440=y
> CONFIG_SENSORS_MAX8688=y
> CONFIG_SENSORS_MP2888=y
> # CONFIG_SENSORS_MP2975 is not set
> CONFIG_SENSORS_MP5023=y
> CONFIG_SENSORS_PIM4328=y
> CONFIG_SENSORS_PLI1209BC=y
> # CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
> CONFIG_SENSORS_PM6764TR=y
> CONFIG_SENSORS_PXE1610=y
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> CONFIG_SENSORS_STPDDC60=y
> CONFIG_SENSORS_TPS40422=y
> CONFIG_SENSORS_TPS53679=y
> # CONFIG_SENSORS_TPS546D24 is not set
> CONFIG_SENSORS_UCD9000=y
> CONFIG_SENSORS_UCD9200=y
> # CONFIG_SENSORS_XDPE152 is not set
> CONFIG_SENSORS_XDPE122=y
> CONFIG_SENSORS_XDPE122_REGULATOR=y
> CONFIG_SENSORS_ZL6100=y
> # CONFIG_SENSORS_PWM_FAN is not set
> CONFIG_SENSORS_RASPBERRYPI_HWMON=y
> CONFIG_SENSORS_SL28CPLD=y
> CONFIG_SENSORS_SBTSI=y
> CONFIG_SENSORS_SBRMI=y
> CONFIG_SENSORS_SHT15=y
> # CONFIG_SENSORS_SHT21 is not set
> CONFIG_SENSORS_SHT3x=y
> # CONFIG_SENSORS_SHT4x is not set
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SIS5595=y
> # CONFIG_SENSORS_SY7636A is not set
> # CONFIG_SENSORS_DME1737 is not set
> CONFIG_SENSORS_EMC1403=y
> CONFIG_SENSORS_EMC2103=y
> # CONFIG_SENSORS_EMC2305 is not set
> # CONFIG_SENSORS_EMC6W201 is not set
> CONFIG_SENSORS_SMSC47M1=y
> # CONFIG_SENSORS_SMSC47M192 is not set
> # CONFIG_SENSORS_SMSC47B397 is not set
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS7828=y
> CONFIG_SENSORS_AMC6821=y
> # CONFIG_SENSORS_INA209 is not set
> # CONFIG_SENSORS_INA2XX is not set
> CONFIG_SENSORS_INA238=y
> # CONFIG_SENSORS_INA3221 is not set
> CONFIG_SENSORS_TC74=y
> CONFIG_SENSORS_THMC50=y
> CONFIG_SENSORS_TMP102=y
> CONFIG_SENSORS_TMP103=y
> CONFIG_SENSORS_TMP108=y
> CONFIG_SENSORS_TMP401=y
> # CONFIG_SENSORS_TMP421 is not set
> CONFIG_SENSORS_TMP464=y
> CONFIG_SENSORS_TMP513=y
> CONFIG_SENSORS_VIA686A=y
> CONFIG_SENSORS_VT1211=y
> CONFIG_SENSORS_VT8231=y
> CONFIG_SENSORS_W83773G=y
> # CONFIG_SENSORS_W83781D is not set
> CONFIG_SENSORS_W83791D=y
> # CONFIG_SENSORS_W83792D is not set
> CONFIG_SENSORS_W83793=y
> CONFIG_SENSORS_W83795=y
> CONFIG_SENSORS_W83795_FANCTRL=y
> # CONFIG_SENSORS_W83L785TS is not set
> CONFIG_SENSORS_W83L786NG=y
> CONFIG_SENSORS_W83627HF=y
> CONFIG_SENSORS_W83627EHF=y
> CONFIG_SENSORS_WM831X=y
> CONFIG_SENSORS_WM8350=y
> CONFIG_THERMAL=y
> CONFIG_THERMAL_STATISTICS=y
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
> # CONFIG_THERMAL_HWMON is not set
> # CONFIG_THERMAL_WRITABLE_TRIPS is not set
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> # CONFIG_THERMAL_GOV_FAIR_SHARE is not set
> CONFIG_THERMAL_GOV_STEP_WISE=y
> CONFIG_THERMAL_GOV_BANG_BANG=y
> CONFIG_THERMAL_GOV_USER_SPACE=y
> CONFIG_DEVFREQ_THERMAL=y
> # CONFIG_THERMAL_EMULATION is not set
> # CONFIG_K3_THERMAL is not set
> CONFIG_ROCKCHIP_THERMAL=y
> CONFIG_RCAR_THERMAL=y
> CONFIG_MTK_THERMAL=y
>
> #
> # Intel thermal drivers
> #
>
> #
> # ACPI INT340X thermal drivers
> #
> # end of ACPI INT340X thermal drivers
> # end of Intel thermal drivers
>
> #
> # Broadcom thermal drivers
> #
> CONFIG_BRCMSTB_THERMAL=y
> # CONFIG_BCM_NS_THERMAL is not set
> CONFIG_BCM_SR_THERMAL=y
> # end of Broadcom thermal drivers
>
> #
> # Texas Instruments thermal drivers
> #
> CONFIG_TI_SOC_THERMAL=y
> # CONFIG_TI_THERMAL is not set
> CONFIG_OMAP3_THERMAL=y
> CONFIG_OMAP4_THERMAL=y
> # CONFIG_OMAP5_THERMAL is not set
> CONFIG_DRA752_THERMAL=y
> # end of Texas Instruments thermal drivers
>
> #
> # Samsung thermal drivers
> #
> # end of Samsung thermal drivers
>
> #
> # NVIDIA Tegra thermal drivers
> #
> CONFIG_TEGRA_SOCTHERM=y
> # CONFIG_TEGRA_BPMP_THERMAL is not set
> CONFIG_TEGRA30_TSENSOR=y
> # end of NVIDIA Tegra thermal drivers
>
> CONFIG_GENERIC_ADC_THERMAL=y
>
> #
> # Qualcomm thermal drivers
> #
> # end of Qualcomm thermal drivers
>
> # CONFIG_SPRD_THERMAL is not set
> # CONFIG_WATCHDOG is not set
> CONFIG_SSB_POSSIBLE=y
> CONFIG_SSB=y
> CONFIG_SSB_SPROM=y
> CONFIG_SSB_PCIHOST_POSSIBLE=y
> CONFIG_SSB_PCIHOST=y
> CONFIG_SSB_B43_PCI_BRIDGE=y
> CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
> # CONFIG_SSB_PCMCIAHOST is not set
> CONFIG_SSB_SDIOHOST_POSSIBLE=y
> CONFIG_SSB_SDIOHOST=y
> CONFIG_SSB_HOST_SOC=y
> CONFIG_SSB_SERIAL=y
> CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
> CONFIG_SSB_DRIVER_PCICORE=y
> CONFIG_SSB_PCICORE_HOSTMODE=y
> CONFIG_SSB_DRIVER_MIPS=y
> CONFIG_SSB_SFLASH=y
> CONFIG_SSB_EMBEDDED=y
> CONFIG_SSB_DRIVER_EXTIF=y
> # CONFIG_SSB_DRIVER_GIGE is not set
> CONFIG_SSB_DRIVER_GPIO=y
> CONFIG_BCMA_POSSIBLE=y
> CONFIG_BCMA=y
> CONFIG_BCMA_HOST_PCI_POSSIBLE=y
> CONFIG_BCMA_HOST_PCI=y
> CONFIG_BCMA_HOST_SOC=y
> CONFIG_BCMA_DRIVER_PCI=y
> CONFIG_BCMA_DRIVER_PCI_HOSTMODE=y
> CONFIG_BCMA_DRIVER_MIPS=y
> CONFIG_BCMA_PFLASH=y
> # CONFIG_BCMA_SFLASH is not set
> CONFIG_BCMA_NFLASH=y
> # CONFIG_BCMA_DRIVER_GMAC_CMN is not set
> CONFIG_BCMA_DRIVER_GPIO=y
> CONFIG_BCMA_DEBUG=y
>
> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=y
> CONFIG_MFD_SUN4I_GPADC=y
> # CONFIG_MFD_AS3711 is not set
> CONFIG_PMIC_ADP5520=y
> CONFIG_MFD_AAT2870_CORE=y
> CONFIG_MFD_AT91_USART=y
> CONFIG_MFD_ATMEL_SMC=y
> CONFIG_MFD_BCM590XX=y
> # CONFIG_MFD_BD9571MWV is not set
> # CONFIG_MFD_AXP20X_I2C is not set
> CONFIG_MFD_MADERA=y
> # CONFIG_MFD_MADERA_I2C is not set
> # CONFIG_MFD_CS47L15 is not set
> CONFIG_MFD_CS47L35=y
> CONFIG_MFD_CS47L85=y
> CONFIG_MFD_CS47L90=y
> # CONFIG_MFD_CS47L92 is not set
> # CONFIG_MFD_ASIC3 is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> CONFIG_MFD_DA9062=y
> # CONFIG_MFD_DA9063 is not set
> CONFIG_MFD_DA9150=y
> CONFIG_MFD_DLN2=y
> CONFIG_MFD_ENE_KB3930=y
> CONFIG_MFD_EXYNOS_LPASS=y
> CONFIG_MFD_MC13XXX=y
> CONFIG_MFD_MC13XXX_I2C=y
> CONFIG_MFD_MP2629=y
> # CONFIG_MFD_MXS_LRADC is not set
> CONFIG_MFD_MX25_TSADC=y
> CONFIG_HTC_PASIC3=y
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_LPC_ICH is not set
> CONFIG_LPC_SCH=y
> # CONFIG_INTEL_SOC_PMIC is not set
> # CONFIG_MFD_IQS62X is not set
> CONFIG_MFD_JANZ_CMODIO=y
> CONFIG_MFD_KEMPLD=y
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77620 is not set
> # CONFIG_MFD_MAX77650 is not set
> # CONFIG_MFD_MAX77686 is not set
> CONFIG_MFD_MAX77693=y
> # CONFIG_MFD_MAX77714 is not set
> CONFIG_MFD_MAX77843=y
> # CONFIG_MFD_MAX8907 is not set
> CONFIG_MFD_MAX8925=y
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> CONFIG_MFD_MT6360=y
> CONFIG_MFD_MT6370=y
> CONFIG_MFD_MT6397=y
> # CONFIG_MFD_MENF21BMC is not set
> CONFIG_MFD_VIPERBOARD=y
> # CONFIG_MFD_NTXEC is not set
> # CONFIG_MFD_RETU is not set
> CONFIG_MFD_PCF50633=y
> CONFIG_PCF50633_ADC=y
> CONFIG_PCF50633_GPIO=y
> CONFIG_MFD_PM8XXX=y
> CONFIG_MFD_SY7636A=y
> # CONFIG_MFD_RDC321X is not set
> CONFIG_MFD_RT4831=y
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RT5120 is not set
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SIMPLE_MFD_I2C=y
> CONFIG_MFD_SL28CPLD=y
> # CONFIG_MFD_SM501 is not set
> CONFIG_MFD_SKY81452=y
> # CONFIG_ABX500_CORE is not set
> # CONFIG_MFD_SUN6I_PRCM is not set
> CONFIG_MFD_SYSCON=y
> CONFIG_MFD_TI_AM335X_TSCADC=y
> # CONFIG_MFD_LP3943 is not set
> CONFIG_MFD_LP8788=y
> CONFIG_MFD_TI_LMU=y
> # CONFIG_MFD_PALMAS is not set
> CONFIG_TPS6105X=y
> CONFIG_TPS65010=y
> CONFIG_TPS6507X=y
> # CONFIG_MFD_TPS65086 is not set
> CONFIG_MFD_TPS65090=y
> CONFIG_MFD_TI_LP873X=y
> # CONFIG_MFD_TPS6586X is not set
> CONFIG_MFD_TPS65910=y
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_TWL4030_CORE is not set
> CONFIG_TWL6040_CORE=y
> CONFIG_MFD_WL1273_CORE=y
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TIMBERDALE is not set
> CONFIG_MFD_TQMX86=y
> CONFIG_MFD_VX855=y
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_WM8400 is not set
> CONFIG_MFD_WM831X=y
> CONFIG_MFD_WM831X_I2C=y
> CONFIG_MFD_WM8350=y
> CONFIG_MFD_WM8350_I2C=y
> CONFIG_MFD_WM8994=y
> CONFIG_MFD_STW481X=y
> CONFIG_MFD_STM32_LPTIMER=y
> CONFIG_MFD_STM32_TIMERS=y
> # CONFIG_MFD_STMFX is not set
> CONFIG_MFD_WCD934X=y
> CONFIG_MFD_ATC260X=y
> CONFIG_MFD_ATC260X_I2C=y
> # CONFIG_MFD_KHADAS_MCU is not set
> CONFIG_MFD_ACER_A500_EC=y
> CONFIG_RAVE_SP_CORE=y
> # end of Multifunction device drivers
>
> CONFIG_REGULATOR=y
> CONFIG_REGULATOR_DEBUG=y
> CONFIG_REGULATOR_FIXED_VOLTAGE=y
> # CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
> CONFIG_REGULATOR_USERSPACE_CONSUMER=y
> # CONFIG_REGULATOR_88PG86X is not set
> CONFIG_REGULATOR_ACT8865=y
> CONFIG_REGULATOR_AD5398=y
> # CONFIG_REGULATOR_ANATOP is not set
> CONFIG_REGULATOR_AAT2870=y
> CONFIG_REGULATOR_ARIZONA_LDO1=y
> CONFIG_REGULATOR_ARIZONA_MICSUPP=y
> # CONFIG_REGULATOR_ATC260X is not set
> CONFIG_REGULATOR_BCM590XX=y
> CONFIG_REGULATOR_DA9062=y
> CONFIG_REGULATOR_DA9210=y
> # CONFIG_REGULATOR_DA9211 is not set
> CONFIG_REGULATOR_FAN53555=y
> # CONFIG_REGULATOR_FAN53880 is not set
> CONFIG_REGULATOR_GPIO=y
> # CONFIG_REGULATOR_ISL9305 is not set
> # CONFIG_REGULATOR_ISL6271A is not set
> CONFIG_REGULATOR_LM363X=y
> CONFIG_REGULATOR_LP3971=y
> # CONFIG_REGULATOR_LP3972 is not set
> CONFIG_REGULATOR_LP872X=y
> # CONFIG_REGULATOR_LP8755 is not set
> CONFIG_REGULATOR_LP8788=y
> CONFIG_REGULATOR_LTC3589=y
> CONFIG_REGULATOR_LTC3676=y
> # CONFIG_REGULATOR_MAX1586 is not set
> # CONFIG_REGULATOR_MAX77620 is not set
> # CONFIG_REGULATOR_MAX77650 is not set
> CONFIG_REGULATOR_MAX8649=y
> # CONFIG_REGULATOR_MAX8660 is not set
> CONFIG_REGULATOR_MAX8893=y
> CONFIG_REGULATOR_MAX8907=y
> CONFIG_REGULATOR_MAX8925=y
> # CONFIG_REGULATOR_MAX8952 is not set
> CONFIG_REGULATOR_MAX20086=y
> CONFIG_REGULATOR_MAX77686=y
> CONFIG_REGULATOR_MAX77693=y
> # CONFIG_REGULATOR_MAX77802 is not set
> CONFIG_REGULATOR_MAX77826=y
> CONFIG_REGULATOR_MC13XXX_CORE=y
> CONFIG_REGULATOR_MC13783=y
> # CONFIG_REGULATOR_MC13892 is not set
> # CONFIG_REGULATOR_MP8859 is not set
> # CONFIG_REGULATOR_MP886X is not set
> CONFIG_REGULATOR_MT6311=y
> CONFIG_REGULATOR_MT6323=y
> CONFIG_REGULATOR_MT6331=y
> CONFIG_REGULATOR_MT6332=y
> CONFIG_REGULATOR_MT6358=y
> # CONFIG_REGULATOR_MT6359 is not set
> CONFIG_REGULATOR_MT6360=y
> CONFIG_REGULATOR_MT6370=y
> CONFIG_REGULATOR_MT6397=y
> CONFIG_REGULATOR_PBIAS=y
> CONFIG_REGULATOR_PCA9450=y
> # CONFIG_REGULATOR_PCF50633 is not set
> # CONFIG_REGULATOR_PV88060 is not set
> # CONFIG_REGULATOR_PV88080 is not set
> # CONFIG_REGULATOR_PV88090 is not set
> # CONFIG_REGULATOR_PWM is not set
> # CONFIG_REGULATOR_QCOM_RPMH is not set
> CONFIG_REGULATOR_QCOM_SPMI=y
> # CONFIG_REGULATOR_QCOM_USB_VBUS is not set
> CONFIG_REGULATOR_RT4801=y
> # CONFIG_REGULATOR_RT4831 is not set
> CONFIG_REGULATOR_RT5190A=y
> # CONFIG_REGULATOR_RT5759 is not set
> CONFIG_REGULATOR_RT6160=y
> CONFIG_REGULATOR_RT6245=y
> CONFIG_REGULATOR_RTQ2134=y
> CONFIG_REGULATOR_RTMV20=y
> CONFIG_REGULATOR_RTQ6752=y
> CONFIG_REGULATOR_S2MPA01=y
> CONFIG_REGULATOR_S2MPS11=y
> CONFIG_REGULATOR_S5M8767=y
> CONFIG_REGULATOR_SC2731=y
> # CONFIG_REGULATOR_SKY81452 is not set
> CONFIG_REGULATOR_SLG51000=y
> # CONFIG_REGULATOR_STM32_BOOSTER is not set
> CONFIG_REGULATOR_STM32_VREFBUF=y
> CONFIG_REGULATOR_STM32_PWR=y
> CONFIG_REGULATOR_TI_ABB=y
> CONFIG_REGULATOR_STW481X_VMMC=y
> # CONFIG_REGULATOR_SY7636A is not set
> # CONFIG_REGULATOR_SY8106A is not set
> # CONFIG_REGULATOR_SY8824X is not set
> # CONFIG_REGULATOR_SY8827N is not set
> CONFIG_REGULATOR_TPS51632=y
> # CONFIG_REGULATOR_TPS6105X is not set
> # CONFIG_REGULATOR_TPS62360 is not set
> CONFIG_REGULATOR_TPS65023=y
> CONFIG_REGULATOR_TPS6507X=y
> CONFIG_REGULATOR_TPS65090=y
> CONFIG_REGULATOR_TPS65132=y
> # CONFIG_REGULATOR_TPS65910 is not set
> CONFIG_REGULATOR_TPS68470=y
> # CONFIG_REGULATOR_WM831X is not set
> CONFIG_REGULATOR_WM8350=y
> # CONFIG_REGULATOR_WM8994 is not set
> CONFIG_REGULATOR_QCOM_LABIBB=y
> # CONFIG_RC_CORE is not set
> CONFIG_CEC_CORE=y
> CONFIG_CEC_NOTIFIER=y
> CONFIG_CEC_PIN=y
>
> #
> # CEC support
> #
> CONFIG_CEC_PIN_ERROR_INJ=y
> CONFIG_MEDIA_CEC_SUPPORT=y
> CONFIG_CEC_CH7322=y
> # CONFIG_CEC_MESON_AO is not set
> CONFIG_CEC_GPIO=y
> # CONFIG_CEC_SAMSUNG_S5P is not set
> CONFIG_CEC_STI=y
> CONFIG_CEC_STM32=y
> CONFIG_CEC_TEGRA=y
> # CONFIG_USB_PULSE8_CEC is not set
> # CONFIG_USB_RAINSHADOW_CEC is not set
> # end of CEC support
>
> # CONFIG_MEDIA_SUPPORT is not set
>
> #
> # Graphics support
> #
> CONFIG_APERTURE_HELPERS=y
> CONFIG_IMX_IPUV3_CORE=y
> # CONFIG_DRM is not set
>
> #
> # ARM devices
> #
> # end of ARM devices
>
> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=y
> CONFIG_FB_NOTIFY=y
> CONFIG_FB=y
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_DDC=y
> CONFIG_FB_CFB_FILLRECT=y
> CONFIG_FB_CFB_COPYAREA=y
> CONFIG_FB_CFB_IMAGEBLIT=y
> CONFIG_FB_CFB_REV_PIXELS_IN_BYTE=y
> CONFIG_FB_SYS_FILLRECT=y
> CONFIG_FB_SYS_COPYAREA=y
> CONFIG_FB_SYS_IMAGEBLIT=y
> CONFIG_FB_FOREIGN_ENDIAN=y
> # CONFIG_FB_BOTH_ENDIAN is not set
> # CONFIG_FB_BIG_ENDIAN is not set
> CONFIG_FB_LITTLE_ENDIAN=y
> CONFIG_FB_SYS_FOPS=y
> CONFIG_FB_DEFERRED_IO=y
> CONFIG_FB_SVGALIB=y
> CONFIG_FB_BACKLIGHT=y
> CONFIG_FB_MODE_HELPERS=y
> CONFIG_FB_TILEBLITTING=y
>
> #
> # Frame buffer hardware drivers
> #
> CONFIG_FB_CIRRUS=y
> # CONFIG_FB_PM2 is not set
> CONFIG_FB_CLPS711X=y
> # CONFIG_FB_IMX is not set
> CONFIG_FB_CYBER2000=y
> CONFIG_FB_CYBER2000_DDC=y
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_CONTROL is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_GBE is not set
> CONFIG_FB_PVR2=y
> CONFIG_FB_OPENCORES=y
> # CONFIG_FB_S1D13XXX is not set
> CONFIG_FB_NVIDIA=y
> # CONFIG_FB_NVIDIA_I2C is not set
> # CONFIG_FB_NVIDIA_DEBUG is not set
> # CONFIG_FB_NVIDIA_BACKLIGHT is not set
> CONFIG_FB_RIVA=y
> CONFIG_FB_RIVA_I2C=y
> CONFIG_FB_RIVA_DEBUG=y
> # CONFIG_FB_RIVA_BACKLIGHT is not set
> CONFIG_FB_I740=y
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> CONFIG_FB_SIS=y
> CONFIG_FB_SIS_300=y
> # CONFIG_FB_SIS_315 is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> CONFIG_FB_3DFX=y
> CONFIG_FB_3DFX_ACCEL=y
> # CONFIG_FB_3DFX_I2C is not set
> CONFIG_FB_VOODOO1=y
> CONFIG_FB_VT8623=y
> CONFIG_FB_TRIDENT=y
> # CONFIG_FB_ARK is not set
> CONFIG_FB_PM3=y
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_WM8505 is not set
> # CONFIG_FB_PXA168 is not set
> CONFIG_FB_W100=y
> CONFIG_FB_SH_MOBILE_LCDC=y
> CONFIG_FB_TMIO=y
> # CONFIG_FB_TMIO_ACCELL is not set
> CONFIG_FB_S3C=y
> # CONFIG_FB_S3C_DEBUG_REGWRITE is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> CONFIG_FB_IBM_GXT4500=y
> CONFIG_FB_GOLDFISH=y
> CONFIG_FB_DA8XX=y
> CONFIG_FB_VIRTUAL=y
> CONFIG_FB_METRONOME=y
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_BROADSHEET=y
> CONFIG_FB_SIMPLE=y
> # CONFIG_FB_SSD1307 is not set
> # CONFIG_FB_SM712 is not set
> # CONFIG_FB_OMAP_LCD_H3 is not set
> # CONFIG_MMP_DISP is not set
> # end of Frame buffer Devices
>
> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=y
> CONFIG_LCD_PLATFORM=y
> CONFIG_BACKLIGHT_CLASS_DEVICE=y
> CONFIG_BACKLIGHT_KTD253=y
> CONFIG_BACKLIGHT_OMAP1=y
> CONFIG_BACKLIGHT_PWM=y
> CONFIG_BACKLIGHT_MAX8925=y
> CONFIG_BACKLIGHT_MT6370=y
> CONFIG_BACKLIGHT_QCOM_WLED=y
> CONFIG_BACKLIGHT_RT4831=y
> CONFIG_BACKLIGHT_WM831X=y
> CONFIG_BACKLIGHT_ADP5520=y
> CONFIG_BACKLIGHT_ADP8860=y
> CONFIG_BACKLIGHT_ADP8870=y
> CONFIG_BACKLIGHT_PCF50633=y
> CONFIG_BACKLIGHT_AAT2870=y
> CONFIG_BACKLIGHT_LM3630A=y
> CONFIG_BACKLIGHT_LM3639=y
> CONFIG_BACKLIGHT_LP855X=y
> CONFIG_BACKLIGHT_LP8788=y
> # CONFIG_BACKLIGHT_SKY81452 is not set
> CONFIG_BACKLIGHT_GPIO=y
> CONFIG_BACKLIGHT_LV5207LP=y
> # CONFIG_BACKLIGHT_BD6107 is not set
> CONFIG_BACKLIGHT_ARCXCNN=y
> CONFIG_BACKLIGHT_RAVE_SP=y
> # end of Backlight & LCD device support
>
> CONFIG_VGASTATE=y
> CONFIG_VIDEOMODE_HELPERS=y
> CONFIG_HDMI=y
>
> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=y
> CONFIG_DUMMY_CONSOLE=y
> CONFIG_DUMMY_CONSOLE_COLUMNS=80
> CONFIG_DUMMY_CONSOLE_ROWS=25
> CONFIG_FRAMEBUFFER_CONSOLE=y
> # CONFIG_FRAMEBUFFER_CONSOLE_LEGACY_ACCELERATION is not set
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER=y
> # end of Console display driver support
>
> CONFIG_LOGO=y
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> # CONFIG_LOGO_LINUX_CLUT224 is not set
> # end of Graphics support
>
> CONFIG_SOUND=y
> CONFIG_SND=y
> CONFIG_SND_TIMER=y
> CONFIG_SND_PCM=y
> CONFIG_SND_PCM_ELD=y
> CONFIG_SND_PCM_IEC958=y
> CONFIG_SND_DMAENGINE_PCM=y
> CONFIG_SND_HWDEP=y
> CONFIG_SND_SEQ_DEVICE=y
> CONFIG_SND_RAWMIDI=y
> CONFIG_SND_COMPRESS_OFFLOAD=y
> CONFIG_SND_JACK=y
> CONFIG_SND_JACK_INPUT_DEV=y
> # CONFIG_SND_OSSEMUL is not set
> CONFIG_SND_PCM_TIMER=y
> CONFIG_SND_DYNAMIC_MINORS=y
> CONFIG_SND_MAX_CARDS=32
> CONFIG_SND_SUPPORT_OLD_API=y
> CONFIG_SND_PROC_FS=y
> # CONFIG_SND_VERBOSE_PROCFS is not set
> CONFIG_SND_VERBOSE_PRINTK=y
> CONFIG_SND_CTL_FAST_LOOKUP=y
> CONFIG_SND_DEBUG=y
> CONFIG_SND_DEBUG_VERBOSE=y
> # CONFIG_SND_CTL_INPUT_VALIDATION is not set
> # CONFIG_SND_CTL_DEBUG is not set
> # CONFIG_SND_JACK_INJECTION_DEBUG is not set
> CONFIG_SND_VMASTER=y
> CONFIG_SND_CTL_LED=y
> CONFIG_SND_SEQUENCER=y
> CONFIG_SND_SEQ_DUMMY=y
> CONFIG_SND_SEQ_MIDI_EVENT=y
> CONFIG_SND_SEQ_MIDI=y
> CONFIG_SND_MPU401_UART=y
> CONFIG_SND_DRIVERS=y
> CONFIG_SND_DUMMY=y
> # CONFIG_SND_ALOOP is not set
> # CONFIG_SND_VIRMIDI is not set
> CONFIG_SND_MTPAV=y
> CONFIG_SND_MTS64=y
> # CONFIG_SND_SERIAL_U16550 is not set
> CONFIG_SND_MPU401=y
> CONFIG_SND_PORTMAN2X4=y
> # CONFIG_SND_PCI is not set
>
> #
> # HD-Audio
> #
> CONFIG_SND_HDA=y
> CONFIG_SND_HDA_GENERIC_LEDS=y
> CONFIG_SND_HDA_HWDEP=y
> CONFIG_SND_HDA_RECONFIG=y
> CONFIG_SND_HDA_INPUT_BEEP=y
> CONFIG_SND_HDA_INPUT_BEEP_MODE=1
> CONFIG_SND_HDA_PATCH_LOADER=y
> # CONFIG_SND_HDA_CODEC_REALTEK is not set
> CONFIG_SND_HDA_CODEC_ANALOG=y
> CONFIG_SND_HDA_CODEC_SIGMATEL=y
> CONFIG_SND_HDA_CODEC_VIA=y
> # CONFIG_SND_HDA_CODEC_HDMI is not set
> CONFIG_SND_HDA_CODEC_CIRRUS=y
> # CONFIG_SND_HDA_CODEC_CS8409 is not set
> CONFIG_SND_HDA_CODEC_CONEXANT=y
> CONFIG_SND_HDA_CODEC_CA0110=y
> CONFIG_SND_HDA_CODEC_CA0132=y
> CONFIG_SND_HDA_CODEC_CA0132_DSP=y
> # CONFIG_SND_HDA_CODEC_CMEDIA is not set
> CONFIG_SND_HDA_CODEC_SI3054=y
> CONFIG_SND_HDA_GENERIC=y
> CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
> # end of HD-Audio
>
> CONFIG_SND_HDA_CORE=y
> CONFIG_SND_HDA_DSP_LOADER=y
> CONFIG_SND_HDA_EXT_CORE=y
> CONFIG_SND_HDA_PREALLOC_SIZE=64
> # CONFIG_SND_MIPS is not set
> # CONFIG_SND_USB is not set
> # CONFIG_SND_FIREWIRE is not set
> # CONFIG_SND_PCMCIA is not set
> CONFIG_SND_SOC=y
> CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
> CONFIG_SND_SOC_COMPRESS=y
> CONFIG_SND_SOC_TOPOLOGY=y
> # CONFIG_SND_SOC_ADI is not set
> # CONFIG_SND_SOC_AMD_ACP is not set
> CONFIG_SND_AMD_ACP_CONFIG=y
> CONFIG_SND_SOC_APPLE_MCA=y
> CONFIG_SND_ATMEL_SOC=y
> CONFIG_SND_ATMEL_SOC_PDC=y
> CONFIG_SND_ATMEL_SOC_DMA=y
> CONFIG_SND_ATMEL_SOC_SSC=y
> # CONFIG_SND_ATMEL_SOC_SSC_PDC is not set
> CONFIG_SND_ATMEL_SOC_SSC_DMA=y
> # CONFIG_SND_AT91_SOC_SAM9G20_WM8731 is not set
> CONFIG_SND_ATMEL_SOC_WM8904=y
> CONFIG_SND_AT91_SOC_SAM9X5_WM8731=y
> CONFIG_SND_ATMEL_SOC_CLASSD=y
> # CONFIG_SND_BCM2835_SOC_I2S is not set
> CONFIG_SND_SOC_CYGNUS=y
> # CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
> CONFIG_SND_EP93XX_SOC=y
> # CONFIG_SND_DESIGNWARE_I2S is not set
>
> #
> # SoC Audio for Freescale CPUs
> #
>
> #
> # Common SoC Audio options for Freescale CPUs:
> #
> CONFIG_SND_SOC_FSL_ASRC=y
> CONFIG_SND_SOC_FSL_SAI=y
> # CONFIG_SND_SOC_FSL_MQS is not set
> CONFIG_SND_SOC_FSL_AUDMIX=y
> CONFIG_SND_SOC_FSL_SSI=y
> CONFIG_SND_SOC_FSL_SPDIF=y
> # CONFIG_SND_SOC_FSL_ESAI is not set
> CONFIG_SND_SOC_FSL_MICFIL=y
> CONFIG_SND_SOC_FSL_EASRC=y
> # CONFIG_SND_SOC_FSL_XCVR is not set
> # CONFIG_SND_SOC_FSL_AUD2HTX is not set
> CONFIG_SND_SOC_FSL_UTILS=y
> # CONFIG_SND_SOC_FSL_RPMSG is not set
> CONFIG_SND_SOC_IMX_AUDMUX=y
> # CONFIG_SND_IMX_SOC is not set
> # end of SoC Audio for Freescale CPUs
>
> # CONFIG_SND_I2S_HI6210_I2S is not set
> CONFIG_SND_JZ4740_SOC_I2S=y
> # CONFIG_SND_KIRKWOOD_SOC is not set
> # CONFIG_SND_SOC_IMG is not set
> # CONFIG_SND_SOC_INTEL_SST_TOPLEVEL is not set
> # CONFIG_SND_SOC_INTEL_KEEMBAY is not set
> # CONFIG_SND_SOC_INTEL_AVS is not set
> # CONFIG_SND_SOC_MT8186 is not set
> CONFIG_SND_SOC_MTK_BTCVSD=y
> # CONFIG_SND_SOC_MT8195 is not set
>
> #
> # ASoC support for Amlogic platforms
> #
> CONFIG_SND_MESON_AIU=y
> CONFIG_SND_MESON_AXG_FIFO=y
> CONFIG_SND_MESON_AXG_FRDDR=y
> # CONFIG_SND_MESON_AXG_TODDR is not set
> CONFIG_SND_MESON_AXG_TDM_FORMATTER=y
> CONFIG_SND_MESON_AXG_TDM_INTERFACE=y
> CONFIG_SND_MESON_AXG_TDMIN=y
> # CONFIG_SND_MESON_AXG_TDMOUT is not set
> CONFIG_SND_MESON_AXG_SOUND_CARD=y
> CONFIG_SND_MESON_AXG_SPDIFOUT=y
> CONFIG_SND_MESON_AXG_SPDIFIN=y
> # CONFIG_SND_MESON_AXG_PDM is not set
> CONFIG_SND_MESON_CARD_UTILS=y
> CONFIG_SND_MESON_CODEC_GLUE=y
> CONFIG_SND_MESON_GX_SOUND_CARD=y
> CONFIG_SND_MESON_G12A_TOACODEC=y
> CONFIG_SND_MESON_G12A_TOHDMITX=y
> CONFIG_SND_SOC_MESON_T9015=y
> # end of ASoC support for Amlogic platforms
>
> # CONFIG_SND_MXS_SOC is not set
> # CONFIG_SND_PXA2XX_SOC is not set
> # CONFIG_SND_SOC_QCOM is not set
> # CONFIG_SND_SOC_ROCKCHIP is not set
> CONFIG_SND_SOC_SAMSUNG=y
> CONFIG_SND_S3C24XX_I2S=y
> CONFIG_SND_SAMSUNG_PCM=y
> CONFIG_SND_SAMSUNG_SPDIF=y
> CONFIG_SND_SAMSUNG_I2S=y
> CONFIG_SND_SOC_SAMSUNG_NEO1973_WM8753=y
> CONFIG_SND_SOC_SAMSUNG_SMDK_WM8580=y
> # CONFIG_SND_SOC_SAMSUNG_SMDK_WM8994 is not set
> CONFIG_SND_SOC_SAMSUNG_S3C24XX_UDA134X=y
> CONFIG_SND_SOC_SAMSUNG_SIMTEC=y
> CONFIG_SND_SOC_SAMSUNG_SIMTEC_TLV320AIC23=y
> # CONFIG_SND_SOC_SAMSUNG_SIMTEC_HERMES is not set
> # CONFIG_SND_SOC_SAMSUNG_H1940_UDA1380 is not set
> CONFIG_SND_SOC_SAMSUNG_RX1950_UDA1380=y
> # CONFIG_SND_SOC_SMARTQ is not set
> # CONFIG_SND_SOC_SAMSUNG_SMDK_SPDIF is not set
> CONFIG_SND_SOC_SMDK_WM8994_PCM=y
> # CONFIG_SND_SOC_TOBERMORY is not set
> # CONFIG_SND_SOC_LOWLAND is not set
> # CONFIG_SND_SOC_LITTLEMILL is not set
> # CONFIG_SND_SOC_SNOW is not set
> # CONFIG_SND_SOC_ODROID is not set
> CONFIG_SND_SOC_ARNDALE=y
> CONFIG_SND_SOC_SAMSUNG_ARIES_WM8994=y
> # CONFIG_SND_SOC_SAMSUNG_MIDAS_WM1811 is not set
>
> #
> # SoC Audio support for Renesas SoCs
> #
> CONFIG_SND_SOC_SH4_FSI=y
> # CONFIG_SND_SOC_RCAR is not set
> # CONFIG_SND_SOC_RZ is not set
> # end of SoC Audio support for Renesas SoCs
>
> CONFIG_SND_SOC_SOF_TOPLEVEL=y
> CONFIG_SND_SOC_SOF_PCI_DEV=y
> CONFIG_SND_SOC_SOF_PCI=y
> CONFIG_SND_SOC_SOF_ACPI=y
> # CONFIG_SND_SOC_SOF_OF is not set
> CONFIG_SND_SOC_SOF=y
> CONFIG_SND_SOC_SOF_IPC3=y
> CONFIG_SND_SOC_SOF_AMD_TOPLEVEL=y
> CONFIG_SND_SOC_SOF_AMD_COMMON=y
> CONFIG_SND_SOC_SOF_AMD_RENOIR=y
> CONFIG_SND_SOC_SOF_AMD_REMBRANDT=y
> # CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL is not set
> CONFIG_SND_SOC_SPRD=y
> CONFIG_SND_SOC_SPRD_MCDT=y
> CONFIG_SND_SOC_STI=y
>
> #
> # STMicroelectronics STM32 SOC audio support
> #
> CONFIG_SND_SOC_STM32_SAI=y
> CONFIG_SND_SOC_STM32_I2S=y
> # CONFIG_SND_SOC_STM32_SPDIFRX is not set
> CONFIG_SND_SOC_STM32_DFSDM=y
> # end of STMicroelectronics STM32 SOC audio support
>
> #
> # Allwinner SoC Audio support
> #
> CONFIG_SND_SUN4I_CODEC=y
> CONFIG_SND_SUN8I_CODEC_ANALOG=y
> # CONFIG_SND_SUN50I_CODEC_ANALOG is not set
> CONFIG_SND_SUN4I_I2S=y
> CONFIG_SND_SUN50I_DMIC=y
> CONFIG_SND_SUN8I_ADDA_PR_REGMAP=y
> # end of Allwinner SoC Audio support
>
> # CONFIG_SND_SOC_TEGRA is not set
>
> #
> # Audio support for Texas Instruments SoCs
> #
> CONFIG_SND_SOC_TI_EDMA_PCM=y
> CONFIG_SND_SOC_TI_SDMA_PCM=y
> CONFIG_SND_SOC_TI_UDMA_PCM=y
>
> #
> # Texas Instruments DAI support for:
> #
> CONFIG_SND_SOC_DAVINCI_ASP=y
> CONFIG_SND_SOC_DAVINCI_MCASP=y
> CONFIG_SND_SOC_DAVINCI_VCIF=y
> # CONFIG_SND_SOC_OMAP_DMIC is not set
> # CONFIG_SND_SOC_OMAP_MCBSP is not set
> # CONFIG_SND_SOC_OMAP_MCPDM is not set
>
> #
> # Audio support for boards with Texas Instruments SoCs
> #
> # CONFIG_SND_SOC_OMAP_ABE_TWL6040 is not set
> CONFIG_SND_SOC_OMAP_HDMI=y
> # CONFIG_SND_SOC_J721E_EVM is not set
> # end of Audio support for Texas Instruments SoCs
>
> CONFIG_SND_SOC_UNIPHIER=y
> CONFIG_SND_SOC_UNIPHIER_AIO=y
> CONFIG_SND_SOC_UNIPHIER_LD11=y
> CONFIG_SND_SOC_UNIPHIER_PXS2=y
> CONFIG_SND_SOC_UNIPHIER_EVEA_CODEC=y
> # CONFIG_SND_SOC_XILINX_I2S is not set
> CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=y
> CONFIG_SND_SOC_XILINX_SPDIF=y
> # CONFIG_SND_SOC_XTFPGA_I2S is not set
> CONFIG_SND_SOC_I2C_AND_SPI=y
>
> #
> # CODEC drivers
> #
> CONFIG_SND_SOC_ALL_CODECS=y
> # CONFIG_SND_SOC_88PM860X is not set
> CONFIG_SND_SOC_WM_HUBS=y
> CONFIG_SND_SOC_WM_ADSP=y
> # CONFIG_SND_SOC_AB8500_CODEC is not set
> # CONFIG_SND_SOC_AC97_CODEC is not set
> # CONFIG_SND_SOC_AD1836 is not set
> CONFIG_SND_SOC_AD193X=y
> # CONFIG_SND_SOC_AD193X_SPI is not set
> CONFIG_SND_SOC_AD193X_I2C=y
> # CONFIG_SND_SOC_AD1980 is not set
> CONFIG_SND_SOC_AD73311=y
> CONFIG_SND_SOC_ADAU_UTILS=y
> # CONFIG_SND_SOC_ADAU1372_I2C is not set
> # CONFIG_SND_SOC_ADAU1372_SPI is not set
> CONFIG_SND_SOC_ADAU1373=y
> CONFIG_SND_SOC_ADAU1701=y
> CONFIG_SND_SOC_ADAU17X1=y
> CONFIG_SND_SOC_ADAU1761=y
> CONFIG_SND_SOC_ADAU1761_I2C=y
> # CONFIG_SND_SOC_ADAU1761_SPI is not set
> CONFIG_SND_SOC_ADAU1781=y
> CONFIG_SND_SOC_ADAU1781_I2C=y
> # CONFIG_SND_SOC_ADAU1781_SPI is not set
> CONFIG_SND_SOC_ADAU1977=y
> # CONFIG_SND_SOC_ADAU1977_SPI is not set
> CONFIG_SND_SOC_ADAU1977_I2C=y
> CONFIG_SND_SOC_ADAU7002=y
> CONFIG_SND_SOC_ADAU7118=y
> CONFIG_SND_SOC_ADAU7118_HW=y
> CONFIG_SND_SOC_ADAU7118_I2C=y
> CONFIG_SND_SOC_ADAV80X=y
> # CONFIG_SND_SOC_ADAV801 is not set
> CONFIG_SND_SOC_ADAV803=y
> CONFIG_SND_SOC_ADS117X=y
> # CONFIG_SND_SOC_AK4104 is not set
> CONFIG_SND_SOC_AK4118=y
> # CONFIG_SND_SOC_AK4375 is not set
> # CONFIG_SND_SOC_AK4458 is not set
> CONFIG_SND_SOC_AK4535=y
> # CONFIG_SND_SOC_AK4554 is not set
> CONFIG_SND_SOC_AK4613=y
> CONFIG_SND_SOC_AK4641=y
> CONFIG_SND_SOC_AK4642=y
> CONFIG_SND_SOC_AK4671=y
> # CONFIG_SND_SOC_AK5386 is not set
> CONFIG_SND_SOC_AK5558=y
> CONFIG_SND_SOC_ALC5623=y
> CONFIG_SND_SOC_ALC5632=y
> CONFIG_SND_SOC_AW8738=y
> CONFIG_SND_SOC_BD28623=y
> CONFIG_SND_SOC_BT_SCO=y
> CONFIG_SND_SOC_CPCAP=y
> CONFIG_SND_SOC_CQ0093VC=y
> # CONFIG_SND_SOC_CROS_EC_CODEC is not set
> CONFIG_SND_SOC_CS35L32=y
> CONFIG_SND_SOC_CS35L33=y
> CONFIG_SND_SOC_CS35L34=y
> # CONFIG_SND_SOC_CS35L35 is not set
> CONFIG_SND_SOC_CS35L36=y
> CONFIG_SND_SOC_CS35L41_LIB=y
> CONFIG_SND_SOC_CS35L41=y
> # CONFIG_SND_SOC_CS35L41_SPI is not set
> CONFIG_SND_SOC_CS35L41_I2C=y
> CONFIG_SND_SOC_CS35L45_TABLES=y
> CONFIG_SND_SOC_CS35L45=y
> # CONFIG_SND_SOC_CS35L45_SPI is not set
> CONFIG_SND_SOC_CS35L45_I2C=y
> CONFIG_SND_SOC_CS42L42_CORE=y
> CONFIG_SND_SOC_CS42L42=y
> CONFIG_SND_SOC_CS42L51=y
> CONFIG_SND_SOC_CS42L51_I2C=y
> CONFIG_SND_SOC_CS42L52=y
> # CONFIG_SND_SOC_CS42L56 is not set
> # CONFIG_SND_SOC_CS42L73 is not set
> CONFIG_SND_SOC_CS42L83=y
> # CONFIG_SND_SOC_CS4234 is not set
> CONFIG_SND_SOC_CS4265=y
> CONFIG_SND_SOC_CS4270=y
> CONFIG_SND_SOC_CS4271=y
> CONFIG_SND_SOC_CS4271_I2C=y
> # CONFIG_SND_SOC_CS4271_SPI is not set
> # CONFIG_SND_SOC_CS42XX8_I2C is not set
> CONFIG_SND_SOC_CS43130=y
> CONFIG_SND_SOC_CS4341=y
> CONFIG_SND_SOC_CS4349=y
> # CONFIG_SND_SOC_CS47L15 is not set
> # CONFIG_SND_SOC_CS47L24 is not set
> CONFIG_SND_SOC_CS47L35=y
> CONFIG_SND_SOC_CS47L85=y
> CONFIG_SND_SOC_CS47L90=y
> # CONFIG_SND_SOC_CS47L92 is not set
> CONFIG_SND_SOC_CS53L30=y
> CONFIG_SND_SOC_CX20442=y
> # CONFIG_SND_SOC_CX2072X is not set
> # CONFIG_SND_SOC_JZ4740_CODEC is not set
> # CONFIG_SND_SOC_JZ4725B_CODEC is not set
> # CONFIG_SND_SOC_JZ4760_CODEC is not set
> # CONFIG_SND_SOC_JZ4770_CODEC is not set
> CONFIG_SND_SOC_L3=y
> CONFIG_SND_SOC_DA7210=y
> # CONFIG_SND_SOC_DA7213 is not set
> CONFIG_SND_SOC_DA7218=y
> CONFIG_SND_SOC_DA7219=y
> CONFIG_SND_SOC_DA732X=y
> CONFIG_SND_SOC_DA9055=y
> CONFIG_SND_SOC_DMIC=y
> CONFIG_SND_SOC_HDMI_CODEC=y
> CONFIG_SND_SOC_ES7134=y
> CONFIG_SND_SOC_ES7241=y
> CONFIG_SND_SOC_ES8316=y
> CONFIG_SND_SOC_ES8326=y
> # CONFIG_SND_SOC_ES8328_I2C is not set
> # CONFIG_SND_SOC_ES8328_SPI is not set
> CONFIG_SND_SOC_GTM601=y
> CONFIG_SND_SOC_HDAC_HDMI=y
> CONFIG_SND_SOC_HDAC_HDA=y
> CONFIG_SND_SOC_HDA=y
> # CONFIG_SND_SOC_ICS43432 is not set
> # CONFIG_SND_SOC_INNO_RK3036 is not set
> CONFIG_SND_SOC_ISABELLE=y
> CONFIG_SND_SOC_LM49453=y
> CONFIG_SND_SOC_LOCHNAGAR_SC=y
> CONFIG_SND_SOC_MADERA=y
> CONFIG_SND_SOC_MAX98088=y
> CONFIG_SND_SOC_MAX98090=y
> CONFIG_SND_SOC_MAX98095=y
> CONFIG_SND_SOC_MAX98357A=y
> CONFIG_SND_SOC_MAX98371=y
> # CONFIG_SND_SOC_MAX98504 is not set
> # CONFIG_SND_SOC_MAX9867 is not set
> CONFIG_SND_SOC_MAX98925=y
> CONFIG_SND_SOC_MAX98926=y
> CONFIG_SND_SOC_MAX98927=y
> CONFIG_SND_SOC_MAX98520=y
> CONFIG_SND_SOC_MAX98373=y
> CONFIG_SND_SOC_MAX98373_I2C=y
> # CONFIG_SND_SOC_MAX98373_SDW is not set
> # CONFIG_SND_SOC_MAX98390 is not set
> CONFIG_SND_SOC_MAX98396=y
> CONFIG_SND_SOC_MAX9850=y
> CONFIG_SND_SOC_MAX9860=y
> CONFIG_SND_SOC_MSM8916_WCD_ANALOG=y
> CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=y
> CONFIG_SND_SOC_PCM1681=y
> # CONFIG_SND_SOC_PCM1789_I2C is not set
> CONFIG_SND_SOC_PCM179X=y
> CONFIG_SND_SOC_PCM179X_I2C=y
> # CONFIG_SND_SOC_PCM179X_SPI is not set
> CONFIG_SND_SOC_PCM186X=y
> CONFIG_SND_SOC_PCM186X_I2C=y
> # CONFIG_SND_SOC_PCM186X_SPI is not set
> CONFIG_SND_SOC_PCM3008=y
> # CONFIG_SND_SOC_PCM3060_I2C is not set
> # CONFIG_SND_SOC_PCM3060_SPI is not set
> CONFIG_SND_SOC_PCM3168A=y
> CONFIG_SND_SOC_PCM3168A_I2C=y
> # CONFIG_SND_SOC_PCM3168A_SPI is not set
> # CONFIG_SND_SOC_PCM5102A is not set
> CONFIG_SND_SOC_PCM512x=y
> CONFIG_SND_SOC_PCM512x_I2C=y
> # CONFIG_SND_SOC_PCM512x_SPI is not set
> CONFIG_SND_SOC_RK3328=y
> CONFIG_SND_SOC_RK817=y
> CONFIG_SND_SOC_RL6231=y
> CONFIG_SND_SOC_RL6347A=y
> CONFIG_SND_SOC_RT274=y
> CONFIG_SND_SOC_RT286=y
> CONFIG_SND_SOC_RT298=y
> CONFIG_SND_SOC_RT1011=y
> CONFIG_SND_SOC_RT1015=y
> CONFIG_SND_SOC_RT1015P=y
> CONFIG_SND_SOC_RT1016=y
> CONFIG_SND_SOC_RT1019=y
> CONFIG_SND_SOC_RT1305=y
> CONFIG_SND_SOC_RT1308=y
> # CONFIG_SND_SOC_RT1308_SDW is not set
> # CONFIG_SND_SOC_RT1316_SDW is not set
> CONFIG_SND_SOC_RT5514=y
> CONFIG_SND_SOC_RT5616=y
> CONFIG_SND_SOC_RT5631=y
> CONFIG_SND_SOC_RT5640=y
> CONFIG_SND_SOC_RT5645=y
> CONFIG_SND_SOC_RT5651=y
> # CONFIG_SND_SOC_RT5659 is not set
> CONFIG_SND_SOC_RT5660=y
> CONFIG_SND_SOC_RT5663=y
> CONFIG_SND_SOC_RT5665=y
> CONFIG_SND_SOC_RT5668=y
> CONFIG_SND_SOC_RT5670=y
> CONFIG_SND_SOC_RT5677=y
> CONFIG_SND_SOC_RT5682=y
> CONFIG_SND_SOC_RT5682_I2C=y
> # CONFIG_SND_SOC_RT5682_SDW is not set
> CONFIG_SND_SOC_RT5682S=y
> # CONFIG_SND_SOC_RT700_SDW is not set
> # CONFIG_SND_SOC_RT711_SDW is not set
> # CONFIG_SND_SOC_RT711_SDCA_SDW is not set
> # CONFIG_SND_SOC_RT715_SDW is not set
> # CONFIG_SND_SOC_RT715_SDCA_SDW is not set
> CONFIG_SND_SOC_RT9120=y
> # CONFIG_SND_SOC_SDW_MOCKUP is not set
> # CONFIG_SND_SOC_SGTL5000 is not set
> CONFIG_SND_SOC_SI476X=y
> CONFIG_SND_SOC_SIGMADSP=y
> CONFIG_SND_SOC_SIGMADSP_I2C=y
> CONFIG_SND_SOC_SIGMADSP_REGMAP=y
> CONFIG_SND_SOC_SIMPLE_AMPLIFIER=y
> CONFIG_SND_SOC_SIMPLE_MUX=y
> CONFIG_SND_SOC_SPDIF=y
> CONFIG_SND_SOC_SRC4XXX_I2C=y
> CONFIG_SND_SOC_SRC4XXX=y
> CONFIG_SND_SOC_SSM2305=y
> CONFIG_SND_SOC_SSM2518=y
> CONFIG_SND_SOC_SSM2602=y
> # CONFIG_SND_SOC_SSM2602_SPI is not set
> CONFIG_SND_SOC_SSM2602_I2C=y
> CONFIG_SND_SOC_SSM4567=y
> # CONFIG_SND_SOC_STA32X is not set
> CONFIG_SND_SOC_STA350=y
> CONFIG_SND_SOC_STA529=y
> # CONFIG_SND_SOC_STAC9766 is not set
> # CONFIG_SND_SOC_STI_SAS is not set
> CONFIG_SND_SOC_TAS2552=y
> CONFIG_SND_SOC_TAS2562=y
> # CONFIG_SND_SOC_TAS2764 is not set
> CONFIG_SND_SOC_TAS2770=y
> CONFIG_SND_SOC_TAS2780=y
> CONFIG_SND_SOC_TAS5086=y
> # CONFIG_SND_SOC_TAS571X is not set
> # CONFIG_SND_SOC_TAS5720 is not set
> CONFIG_SND_SOC_TAS5805M=y
> CONFIG_SND_SOC_TAS6424=y
> CONFIG_SND_SOC_TDA7419=y
> CONFIG_SND_SOC_TFA9879=y
> # CONFIG_SND_SOC_TFA989X is not set
> # CONFIG_SND_SOC_TLV320ADC3XXX is not set
> CONFIG_SND_SOC_TLV320AIC23=y
> CONFIG_SND_SOC_TLV320AIC23_I2C=y
> # CONFIG_SND_SOC_TLV320AIC23_SPI is not set
> # CONFIG_SND_SOC_TLV320AIC26 is not set
> CONFIG_SND_SOC_TLV320AIC31XX=y
> # CONFIG_SND_SOC_TLV320AIC32X4_I2C is not set
> # CONFIG_SND_SOC_TLV320AIC32X4_SPI is not set
> # CONFIG_SND_SOC_TLV320AIC3X_I2C is not set
> # CONFIG_SND_SOC_TLV320AIC3X_SPI is not set
> CONFIG_SND_SOC_TLV320DAC33=y
> CONFIG_SND_SOC_TLV320ADCX140=y
> CONFIG_SND_SOC_TS3A227E=y
> # CONFIG_SND_SOC_TSCS42XX is not set
> CONFIG_SND_SOC_TSCS454=y
> # CONFIG_SND_SOC_TWL4030 is not set
> CONFIG_SND_SOC_TWL6040=y
> # CONFIG_SND_SOC_UDA1334 is not set
> CONFIG_SND_SOC_UDA134X=y
> CONFIG_SND_SOC_UDA1380=y
> # CONFIG_SND_SOC_WCD9335 is not set
> CONFIG_SND_SOC_WCD_MBHC=y
> CONFIG_SND_SOC_WCD934X=y
> # CONFIG_SND_SOC_WCD938X_SDW is not set
> CONFIG_SND_SOC_WL1273=y
> # CONFIG_SND_SOC_WM0010 is not set
> CONFIG_SND_SOC_WM1250_EV1=y
> CONFIG_SND_SOC_WM2000=y
> CONFIG_SND_SOC_WM2200=y
> CONFIG_SND_SOC_WM5100=y
> # CONFIG_SND_SOC_WM5102 is not set
> # CONFIG_SND_SOC_WM5110 is not set
> CONFIG_SND_SOC_WM8350=y
> # CONFIG_SND_SOC_WM8400 is not set
> CONFIG_SND_SOC_WM8510=y
> # CONFIG_SND_SOC_WM8523 is not set
> CONFIG_SND_SOC_WM8524=y
> CONFIG_SND_SOC_WM8580=y
> CONFIG_SND_SOC_WM8711=y
> CONFIG_SND_SOC_WM8727=y
> CONFIG_SND_SOC_WM8728=y
> CONFIG_SND_SOC_WM8731=y
> CONFIG_SND_SOC_WM8731_I2C=y
> # CONFIG_SND_SOC_WM8731_SPI is not set
> CONFIG_SND_SOC_WM8737=y
> # CONFIG_SND_SOC_WM8741 is not set
> CONFIG_SND_SOC_WM8750=y
> CONFIG_SND_SOC_WM8753=y
> # CONFIG_SND_SOC_WM8770 is not set
> CONFIG_SND_SOC_WM8776=y
> # CONFIG_SND_SOC_WM8782 is not set
> CONFIG_SND_SOC_WM8804=y
> CONFIG_SND_SOC_WM8804_I2C=y
> # CONFIG_SND_SOC_WM8804_SPI is not set
> CONFIG_SND_SOC_WM8900=y
> # CONFIG_SND_SOC_WM8903 is not set
> CONFIG_SND_SOC_WM8904=y
> CONFIG_SND_SOC_WM8940=y
> CONFIG_SND_SOC_WM8955=y
> CONFIG_SND_SOC_WM8960=y
> CONFIG_SND_SOC_WM8961=y
> CONFIG_SND_SOC_WM8962=y
> CONFIG_SND_SOC_WM8971=y
> # CONFIG_SND_SOC_WM8974 is not set
> CONFIG_SND_SOC_WM8978=y
> CONFIG_SND_SOC_WM8983=y
> CONFIG_SND_SOC_WM8985=y
> CONFIG_SND_SOC_WM8988=y
> CONFIG_SND_SOC_WM8990=y
> CONFIG_SND_SOC_WM8991=y
> CONFIG_SND_SOC_WM8993=y
> CONFIG_SND_SOC_WM8994=y
> CONFIG_SND_SOC_WM8995=y
> CONFIG_SND_SOC_WM8996=y
> # CONFIG_SND_SOC_WM8997 is not set
> # CONFIG_SND_SOC_WM8998 is not set
> CONFIG_SND_SOC_WM9081=y
> CONFIG_SND_SOC_WM9090=y
> # CONFIG_SND_SOC_WM9705 is not set
> # CONFIG_SND_SOC_WM9712 is not set
> # CONFIG_SND_SOC_WM9713 is not set
> # CONFIG_SND_SOC_WSA881X is not set
> # CONFIG_SND_SOC_WSA883X is not set
> # CONFIG_SND_SOC_ZL38060 is not set
> CONFIG_SND_SOC_LM4857=y
> CONFIG_SND_SOC_MAX9759=y
> CONFIG_SND_SOC_MAX9768=y
> CONFIG_SND_SOC_MAX9877=y
> CONFIG_SND_SOC_MC13783=y
> CONFIG_SND_SOC_ML26124=y
> CONFIG_SND_SOC_MT6351=y
> CONFIG_SND_SOC_MT6358=y
> # CONFIG_SND_SOC_MT6359 is not set
> CONFIG_SND_SOC_MT6660=y
> CONFIG_SND_SOC_NAU8315=y
> CONFIG_SND_SOC_NAU8540=y
> CONFIG_SND_SOC_NAU8810=y
> # CONFIG_SND_SOC_NAU8821 is not set
> # CONFIG_SND_SOC_NAU8822 is not set
> CONFIG_SND_SOC_NAU8824=y
> CONFIG_SND_SOC_NAU8825=y
> # CONFIG_SND_SOC_TPA6130A2 is not set
> CONFIG_SND_SOC_LPASS_MACRO_COMMON=y
> CONFIG_SND_SOC_LPASS_WSA_MACRO=y
> # CONFIG_SND_SOC_LPASS_VA_MACRO is not set
> CONFIG_SND_SOC_LPASS_RX_MACRO=y
> # CONFIG_SND_SOC_LPASS_TX_MACRO is not set
> # end of CODEC drivers
>
> CONFIG_SND_SIMPLE_CARD_UTILS=y
> CONFIG_SND_SIMPLE_CARD=y
> # CONFIG_SND_VIRTIO is not set
>
> #
> # HID support
> #
> CONFIG_HID=y
> CONFIG_HID_BATTERY_STRENGTH=y
> CONFIG_HIDRAW=y
> CONFIG_UHID=y
> CONFIG_HID_GENERIC=y
>
> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=y
> # CONFIG_HID_ACCUTOUCH is not set
> CONFIG_HID_ACRUX=y
> CONFIG_HID_ACRUX_FF=y
> CONFIG_HID_APPLE=y
> CONFIG_HID_APPLEIR=y
> # CONFIG_HID_ASUS is not set
> # CONFIG_HID_AUREAL is not set
> # CONFIG_HID_BELKIN is not set
> CONFIG_HID_BETOP_FF=y
> CONFIG_HID_BIGBEN_FF=y
> # CONFIG_HID_CHERRY is not set
> CONFIG_HID_CHICONY=y
> CONFIG_HID_CORSAIR=y
> CONFIG_HID_COUGAR=y
> CONFIG_HID_MACALLY=y
> CONFIG_HID_PRODIKEYS=y
> # CONFIG_HID_CMEDIA is not set
> CONFIG_HID_CP2112=y
> # CONFIG_HID_CREATIVE_SB0540 is not set
> CONFIG_HID_CYPRESS=y
> CONFIG_HID_DRAGONRISE=y
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELAN is not set
> # CONFIG_HID_ELECOM is not set
> CONFIG_HID_ELO=y
> # CONFIG_HID_EZKEY is not set
> CONFIG_HID_FT260=y
> CONFIG_HID_GEMBIRD=y
> CONFIG_HID_GFRM=y
> CONFIG_HID_GLORIOUS=y
> CONFIG_HID_HOLTEK=y
> CONFIG_HOLTEK_FF=y
> CONFIG_HID_VIVALDI_COMMON=y
> CONFIG_HID_VIVALDI=y
> # CONFIG_HID_GT683R is not set
> # CONFIG_HID_KEYTOUCH is not set
> # CONFIG_HID_KYE is not set
> CONFIG_HID_UCLOGIC=y
> CONFIG_HID_WALTOP=y
> # CONFIG_HID_VIEWSONIC is not set
> CONFIG_HID_VRC2=y
> # CONFIG_HID_XIAOMI is not set
> CONFIG_HID_GYRATION=y
> # CONFIG_HID_ICADE is not set
> CONFIG_HID_ITE=y
> # CONFIG_HID_JABRA is not set
> CONFIG_HID_TWINHAN=y
> # CONFIG_HID_KENSINGTON is not set
> CONFIG_HID_LCPOWER=y
> CONFIG_HID_LED=y
> # CONFIG_HID_LENOVO is not set
> CONFIG_HID_LETSKETCH=y
> # CONFIG_HID_LOGITECH is not set
> CONFIG_HID_MAGICMOUSE=y
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_MEGAWORLD_FF is not set
> CONFIG_HID_REDRAGON=y
> CONFIG_HID_MICROSOFT=y
> CONFIG_HID_MONTEREY=y
> CONFIG_HID_MULTITOUCH=y
> # CONFIG_HID_NINTENDO is not set
> CONFIG_HID_NTI=y
> CONFIG_HID_NTRIG=y
> CONFIG_HID_ORTEK=y
> # CONFIG_HID_PANTHERLORD is not set
> CONFIG_HID_PENMOUNT=y
> # CONFIG_HID_PETALYNX is not set
> CONFIG_HID_PICOLCD=y
> CONFIG_HID_PICOLCD_FB=y
> CONFIG_HID_PICOLCD_BACKLIGHT=y
> CONFIG_HID_PICOLCD_LCD=y
> CONFIG_HID_PICOLCD_LEDS=y
> CONFIG_HID_PLANTRONICS=y
> CONFIG_HID_PLAYSTATION=y
> # CONFIG_PLAYSTATION_FF is not set
> # CONFIG_HID_PXRC is not set
> CONFIG_HID_RAZER=y
> CONFIG_HID_PRIMAX=y
> CONFIG_HID_RETRODE=y
> # CONFIG_HID_ROCCAT is not set
> CONFIG_HID_SAITEK=y
> CONFIG_HID_SAMSUNG=y
> CONFIG_HID_SEMITEK=y
> CONFIG_HID_SIGMAMICRO=y
> CONFIG_HID_SONY=y
> CONFIG_SONY_FF=y
> CONFIG_HID_SPEEDLINK=y
> CONFIG_HID_STEAM=y
> CONFIG_HID_STEELSERIES=y
> # CONFIG_HID_SUNPLUS is not set
> # CONFIG_HID_RMI is not set
> CONFIG_HID_GREENASIA=y
> # CONFIG_GREENASIA_FF is not set
> # CONFIG_HID_SMARTJOYPLUS is not set
> CONFIG_HID_TIVO=y
> CONFIG_HID_TOPSEED=y
> # CONFIG_HID_TOPRE is not set
> # CONFIG_HID_THINGM is not set
> CONFIG_HID_THRUSTMASTER=y
> # CONFIG_THRUSTMASTER_FF is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_U2FZERO is not set
> CONFIG_HID_WACOM=y
> CONFIG_HID_WIIMOTE=y
> CONFIG_HID_XINMO=y
> CONFIG_HID_ZEROPLUS=y
> CONFIG_ZEROPLUS_FF=y
> # CONFIG_HID_ZYDACRON is not set
> # CONFIG_HID_SENSOR_HUB is not set
> # CONFIG_HID_ALPS is not set
> # CONFIG_HID_MCP2221 is not set
> # end of Special HID drivers
>
> #
> # USB HID support
> #
> CONFIG_USB_HID=y
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> # end of USB HID support
>
> #
> # I2C HID support
> #
> # end of I2C HID support
>
> #
> # Intel ISH HID support
> #
> # end of Intel ISH HID support
>
> #
> # AMD SFH HID Support
> #
> # CONFIG_AMD_SFH_HID is not set
> # end of AMD SFH HID Support
> # end of HID support
>
> CONFIG_USB_OHCI_LITTLE_ENDIAN=y
> CONFIG_USB_SUPPORT=y
> CONFIG_USB_COMMON=y
> CONFIG_USB_LED_TRIG=y
> CONFIG_USB_ULPI_BUS=y
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=y
> CONFIG_USB=y
> # CONFIG_USB_PCI is not set
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
>
> #
> # Miscellaneous USB options
> #
> # CONFIG_USB_DEFAULT_PERSIST is not set
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> CONFIG_USB_OTG=y
> CONFIG_USB_OTG_PRODUCTLIST=y
> # CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB is not set
> CONFIG_USB_OTG_FSM=y
> CONFIG_USB_LEDS_TRIGGER_USBPORT=y
> CONFIG_USB_AUTOSUSPEND_DELAY=2
> CONFIG_USB_MON=y
>
> #
> # USB Host Controller Drivers
> #
> CONFIG_USB_C67X00_HCD=y
> CONFIG_USB_XHCI_HCD=y
> # CONFIG_USB_XHCI_DBGCAP is not set
> # CONFIG_USB_XHCI_PCI_RENESAS is not set
> CONFIG_USB_XHCI_PLATFORM=y
> # CONFIG_USB_XHCI_HISTB is not set
> CONFIG_USB_XHCI_MTK=y
> CONFIG_USB_XHCI_MVEBU=y
> # CONFIG_USB_XHCI_RCAR is not set
> # CONFIG_USB_BRCMSTB is not set
> CONFIG_USB_EHCI_HCD=y
> CONFIG_USB_EHCI_ROOT_HUB_TT=y
> # CONFIG_USB_EHCI_TT_NEWSCHED is not set
> CONFIG_USB_EHCI_FSL=y
> # CONFIG_USB_EHCI_HCD_NPCM7XX is not set
> # CONFIG_USB_EHCI_HCD_OMAP is not set
> # CONFIG_USB_EHCI_HCD_ORION is not set
> CONFIG_USB_EHCI_HCD_SPEAR=y
> # CONFIG_USB_EHCI_HCD_AT91 is not set
> # CONFIG_USB_EHCI_SH is not set
> # CONFIG_USB_EHCI_EXYNOS is not set
> # CONFIG_USB_EHCI_MV is not set
> # CONFIG_USB_CNS3XXX_EHCI is not set
> CONFIG_USB_EHCI_HCD_PLATFORM=y
> CONFIG_USB_OXU210HP_HCD=y
> # CONFIG_USB_ISP116X_HCD is not set
> CONFIG_USB_ISP1362_HCD=y
> # CONFIG_USB_FOTG210_HCD is not set
> CONFIG_USB_OHCI_HCD=y
> CONFIG_USB_OHCI_HCD_SPEAR=y
> # CONFIG_USB_OHCI_HCD_S3C2410 is not set
> CONFIG_USB_OHCI_HCD_LPC32XX=y
> # CONFIG_USB_OHCI_HCD_OMAP3 is not set
> CONFIG_USB_OHCI_HCD_DAVINCI=y
> # CONFIG_USB_OHCI_HCD_SSB is not set
> # CONFIG_USB_OHCI_SH is not set
> CONFIG_USB_OHCI_EXYNOS=y
> # CONFIG_USB_CNS3XXX_OHCI is not set
> CONFIG_USB_OHCI_HCD_PLATFORM=y
> CONFIG_USB_SL811_HCD=y
> # CONFIG_USB_SL811_HCD_ISO is not set
> CONFIG_USB_SL811_CS=y
> CONFIG_USB_R8A66597_HCD=y
> CONFIG_USB_HCD_BCMA=y
> CONFIG_USB_HCD_SSB=y
> # CONFIG_USB_HCD_TEST_MODE is not set
> # CONFIG_USB_RENESAS_USBHS is not set
>
> #
> # USB Device Class drivers
> #
> CONFIG_USB_ACM=y
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
> CONFIG_USB_TMC=y
>
> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
>
> #
> # also be needed; see USB_STORAGE Help for more info
> #
> # CONFIG_USB_STORAGE is not set
>
> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> CONFIG_USB_MICROTEK=y
> CONFIG_USB_CDNS_SUPPORT=y
> CONFIG_USB_CDNS3=y
> # CONFIG_USB_CDNS3_GADGET is not set
> # CONFIG_USB_CDNS3_HOST is not set
> CONFIG_USB_CDNS3_TI=y
> # CONFIG_USB_CDNS3_IMX is not set
> CONFIG_USB_MTU3=y
> # CONFIG_USB_MTU3_HOST is not set
> CONFIG_USB_MTU3_GADGET=y
> # CONFIG_USB_MTU3_DUAL_ROLE is not set
> # CONFIG_USB_MTU3_DEBUG is not set
> CONFIG_USB_MUSB_HDRC=y
> # CONFIG_USB_MUSB_HOST is not set
> CONFIG_USB_MUSB_GADGET=y
> # CONFIG_USB_MUSB_DUAL_ROLE is not set
>
> #
> # Platform Glue Layer
> #
> CONFIG_USB_MUSB_TUSB6010=y
> CONFIG_USB_MUSB_UX500=y
> # CONFIG_USB_MUSB_MEDIATEK is not set
> # CONFIG_USB_MUSB_POLARFIRE_SOC is not set
>
> #
> # MUSB DMA mode
> #
> # CONFIG_MUSB_PIO_ONLY is not set
> # CONFIG_USB_UX500_DMA is not set
> CONFIG_USB_DWC3=y
> # CONFIG_USB_DWC3_ULPI is not set
> # CONFIG_USB_DWC3_HOST is not set
> CONFIG_USB_DWC3_GADGET=y
> # CONFIG_USB_DWC3_DUAL_ROLE is not set
>
> #
> # Platform Glue Driver Support
> #
> # CONFIG_USB_DWC3_KEYSTONE is not set
> CONFIG_USB_DWC3_AM62=y
> # CONFIG_USB_DWC2 is not set
> # CONFIG_USB_CHIPIDEA is not set
> CONFIG_USB_ISP1760=y
> CONFIG_USB_ISP1760_HCD=y
> CONFIG_USB_ISP1760_HOST_ROLE=y
> # CONFIG_USB_ISP1760_GADGET_ROLE is not set
> # CONFIG_USB_ISP1760_DUAL_ROLE is not set
>
> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> # CONFIG_USB_SERIAL is not set
>
> #
> # USB Miscellaneous drivers
> #
> CONFIG_USB_EMI62=y
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> CONFIG_USB_SEVSEG=y
> CONFIG_USB_LEGOTOWER=y
> CONFIG_USB_LCD=y
> CONFIG_USB_CYPRESS_CY7C63=y
> # CONFIG_USB_CYTHERM is not set
> CONFIG_USB_IDMOUSE=y
> # CONFIG_USB_FTDI_ELAN is not set
> CONFIG_USB_APPLEDISPLAY=y
> # CONFIG_USB_QCOM_EUD is not set
> CONFIG_APPLE_MFI_FASTCHARGE=y
> CONFIG_USB_SISUSBVGA=y
> CONFIG_USB_LD=y
> CONFIG_USB_TRANCEVIBRATOR=y
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> CONFIG_USB_EZUSB_FX2=y
> # CONFIG_USB_HUB_USB251XB is not set
> CONFIG_USB_HSIC_USB3503=y
> # CONFIG_USB_HSIC_USB4604 is not set
> CONFIG_USB_LINK_LAYER_TEST=y
> CONFIG_USB_CHAOSKEY=y
> CONFIG_BRCM_USB_PINMAP=y
> # CONFIG_USB_ONBOARD_HUB is not set
>
> #
> # USB Physical Layer drivers
> #
> CONFIG_USB_PHY=y
> CONFIG_KEYSTONE_USB_PHY=y
> CONFIG_NOP_USB_XCEIV=y
> # CONFIG_AM335X_PHY_USB is not set
> # CONFIG_USB_GPIO_VBUS is not set
> CONFIG_USB_ISP1301=y
> CONFIG_USB_TEGRA_PHY=y
> CONFIG_USB_ULPI=y
> CONFIG_USB_ULPI_VIEWPORT=y
> # CONFIG_JZ4770_PHY is not set
> # end of USB Physical Layer drivers
>
> CONFIG_USB_GADGET=y
> CONFIG_USB_GADGET_DEBUG=y
> CONFIG_USB_GADGET_VERBOSE=y
> CONFIG_USB_GADGET_DEBUG_FILES=y
> CONFIG_USB_GADGET_DEBUG_FS=y
> CONFIG_USB_GADGET_VBUS_DRAW=2
> CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
> CONFIG_U_SERIAL_CONSOLE=y
>
> #
> # USB Peripheral Controller
> #
> CONFIG_USB_LPC32XX=y
> CONFIG_USB_FUSB300=y
> # CONFIG_USB_FOTG210_UDC is not set
> CONFIG_USB_GR_UDC=y
> CONFIG_USB_R8A66597=y
> CONFIG_USB_RENESAS_USB3=y
> CONFIG_USB_PXA27X=y
> # CONFIG_USB_MV_UDC is not set
> CONFIG_USB_MV_U3D=y
> # CONFIG_USB_M66592 is not set
> CONFIG_USB_BDC_UDC=y
> CONFIG_USB_NET2272=y
> CONFIG_USB_NET2272_DMA=y
> # CONFIG_USB_GADGET_XILINX is not set
> CONFIG_USB_ASPEED_UDC=y
> CONFIG_USB_ASPEED_VHUB=y
> # CONFIG_USB_DUMMY_HCD is not set
> # end of USB Peripheral Controller
>
> CONFIG_USB_LIBCOMPOSITE=y
> CONFIG_USB_F_ACM=y
> CONFIG_USB_F_SS_LB=y
> CONFIG_USB_U_SERIAL=y
> CONFIG_USB_U_AUDIO=y
> CONFIG_USB_F_SERIAL=y
> CONFIG_USB_F_OBEX=y
> CONFIG_USB_F_MASS_STORAGE=y
> CONFIG_USB_F_FS=y
> CONFIG_USB_F_UAC1=y
> CONFIG_USB_F_UAC1_LEGACY=y
> CONFIG_USB_F_MIDI=y
> CONFIG_USB_F_HID=y
> CONFIG_USB_F_PRINTER=y
> CONFIG_USB_F_TCM=y
> CONFIG_USB_CONFIGFS=y
> CONFIG_USB_CONFIGFS_SERIAL=y
> # CONFIG_USB_CONFIGFS_ACM is not set
> # CONFIG_USB_CONFIGFS_OBEX is not set
> # CONFIG_USB_CONFIGFS_MASS_STORAGE is not set
> # CONFIG_USB_CONFIGFS_F_LB_SS is not set
> # CONFIG_USB_CONFIGFS_F_FS is not set
> CONFIG_USB_CONFIGFS_F_UAC1=y
> CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
> # CONFIG_USB_CONFIGFS_F_UAC2 is not set
> # CONFIG_USB_CONFIGFS_F_MIDI is not set
> CONFIG_USB_CONFIGFS_F_HID=y
> CONFIG_USB_CONFIGFS_F_PRINTER=y
> CONFIG_USB_CONFIGFS_F_TCM=y
>
> #
> # USB Gadget precomposed configurations
> #
> CONFIG_USB_ZERO=y
> # CONFIG_USB_ZERO_HNPTEST is not set
> # CONFIG_USB_AUDIO is not set
> # CONFIG_USB_GADGETFS is not set
> CONFIG_USB_FUNCTIONFS=y
> CONFIG_USB_FUNCTIONFS_GENERIC=y
> # CONFIG_USB_MASS_STORAGE is not set
> CONFIG_USB_GADGET_TARGET=y
> CONFIG_USB_G_SERIAL=y
> CONFIG_USB_MIDI_GADGET=y
> CONFIG_USB_G_PRINTER=y
> CONFIG_USB_G_ACM_MS=y
> # CONFIG_USB_G_HID is not set
> CONFIG_USB_G_DBGP=y
> # CONFIG_USB_G_DBGP_PRINTK is not set
> CONFIG_USB_G_DBGP_SERIAL=y
> # CONFIG_USB_RAW_GADGET is not set
> # end of USB Gadget precomposed configurations
>
> CONFIG_TYPEC=y
> # CONFIG_TYPEC_TCPM is not set
> CONFIG_TYPEC_UCSI=y
> CONFIG_UCSI_CCG=y
> CONFIG_UCSI_STM32G0=y
> CONFIG_TYPEC_TPS6598X=y
> # CONFIG_TYPEC_ANX7411 is not set
> CONFIG_TYPEC_RT1719=y
> CONFIG_TYPEC_HD3SS3220=y
> CONFIG_TYPEC_STUSB160X=y
> CONFIG_TYPEC_QCOM_PMIC=y
> # CONFIG_TYPEC_WUSB3801 is not set
>
> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> # CONFIG_TYPEC_MUX_FSA4480 is not set
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
>
> #
> # USB Type-C Alternate Mode drivers
> #
> # end of USB Type-C Alternate Mode drivers
>
> CONFIG_USB_ROLE_SWITCH=y
> CONFIG_MMC=y
> CONFIG_MMC_BLOCK=y
> CONFIG_MMC_BLOCK_MINORS=8
> # CONFIG_SDIO_UART is not set
> CONFIG_MMC_TEST=y
>
> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=y
> CONFIG_MMC_SDHCI_IO_ACCESSORS=y
> # CONFIG_MMC_SDHCI_PCI is not set
> CONFIG_MMC_SDHCI_PLTFM=y
> CONFIG_MMC_SDHCI_OF_ESDHC=y
> CONFIG_MMC_SDHCI_OF_SPARX5=y
> CONFIG_MMC_SDHCI_CNS3XXX=y
> CONFIG_MMC_SDHCI_DOVE=y
> CONFIG_MMC_SDHCI_TEGRA=y
> CONFIG_MMC_SDHCI_S3C=y
> CONFIG_MMC_SDHCI_PXAV3=y
> # CONFIG_MMC_SDHCI_PXAV2 is not set
> # CONFIG_MMC_SDHCI_S3C_DMA is not set
> # CONFIG_MMC_SDHCI_BCM_KONA is not set
> CONFIG_MMC_MESON_GX=y
> CONFIG_MMC_MOXART=y
> # CONFIG_MMC_SDHCI_ST is not set
> CONFIG_MMC_OMAP_HS=y
> # CONFIG_MMC_SDHCI_MSM is not set
> CONFIG_MMC_TIFM_SD=y
> CONFIG_MMC_DAVINCI=y
> # CONFIG_MMC_S3C is not set
> CONFIG_MMC_SDRICOH_CS=y
> CONFIG_MMC_SDHCI_SPRD=y
> CONFIG_MMC_TMIO_CORE=y
> CONFIG_MMC_TMIO=y
> CONFIG_MMC_SDHI=y
> # CONFIG_MMC_SDHI_SYS_DMAC is not set
> CONFIG_MMC_SDHI_INTERNAL_DMAC=y
> CONFIG_MMC_CB710=y
> # CONFIG_MMC_VIA_SDMMC is not set
> CONFIG_MMC_DW=y
> CONFIG_MMC_DW_PLTFM=y
> CONFIG_MMC_DW_BLUEFIELD=y
> # CONFIG_MMC_DW_EXYNOS is not set
> CONFIG_MMC_DW_HI3798CV200=y
> # CONFIG_MMC_DW_K3 is not set
> CONFIG_MMC_DW_PCI=y
> CONFIG_MMC_SH_MMCIF=y
> # CONFIG_MMC_JZ4740 is not set
> CONFIG_MMC_VUB300=y
> # CONFIG_MMC_USHC is not set
> CONFIG_MMC_USDHI6ROL0=y
> CONFIG_MMC_REALTEK_PCI=y
> CONFIG_MMC_REALTEK_USB=y
> CONFIG_MMC_SUNXI=y
> CONFIG_MMC_CQHCI=y
> CONFIG_MMC_HSQ=y
> CONFIG_MMC_TOSHIBA_PCI=y
> CONFIG_MMC_BCM2835=y
> # CONFIG_MMC_MTK is not set
> # CONFIG_MMC_SDHCI_XENON is not set
> # CONFIG_MMC_OWL is not set
> CONFIG_MMC_LITEX=y
> # CONFIG_SCSI_UFSHCD is not set
> CONFIG_MEMSTICK=y
> CONFIG_MEMSTICK_DEBUG=y
>
> #
> # MemoryStick drivers
> #
> CONFIG_MEMSTICK_UNSAFE_RESUME=y
> # CONFIG_MSPRO_BLOCK is not set
> CONFIG_MS_BLOCK=y
>
> #
> # MemoryStick Host Controller Drivers
> #
> CONFIG_MEMSTICK_TIFM_MS=y
> # CONFIG_MEMSTICK_JMICRON_38X is not set
> CONFIG_MEMSTICK_R592=y
> CONFIG_MEMSTICK_REALTEK_PCI=y
> CONFIG_MEMSTICK_REALTEK_USB=y
> CONFIG_LEDS_GPIO_REGISTER=y
> CONFIG_NEW_LEDS=y
> CONFIG_LEDS_CLASS=y
> CONFIG_LEDS_CLASS_FLASH=y
> CONFIG_LEDS_CLASS_MULTICOLOR=y
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
>
> #
> # LED drivers
> #
> # CONFIG_LEDS_ARIEL is not set
> CONFIG_LEDS_LM3530=y
> CONFIG_LEDS_LM3532=y
> # CONFIG_LEDS_LM3642 is not set
> CONFIG_LEDS_MT6323=y
> # CONFIG_LEDS_S3C24XX is not set
> CONFIG_LEDS_COBALT_QUBE=y
> # CONFIG_LEDS_COBALT_RAQ is not set
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> # CONFIG_LEDS_LP3944 is not set
> CONFIG_LEDS_LP3952=y
> # CONFIG_LEDS_LP50XX is not set
> CONFIG_LEDS_LP8788=y
> CONFIG_LEDS_PCA955X=y
> # CONFIG_LEDS_PCA955X_GPIO is not set
> CONFIG_LEDS_PCA963X=y
> CONFIG_LEDS_WM831X_STATUS=y
> # CONFIG_LEDS_WM8350 is not set
> # CONFIG_LEDS_PWM is not set
> CONFIG_LEDS_REGULATOR=y
> CONFIG_LEDS_BD2802=y
> CONFIG_LEDS_LT3593=y
> # CONFIG_LEDS_ADP5520 is not set
> # CONFIG_LEDS_MC13783 is not set
> CONFIG_LEDS_NS2=y
> # CONFIG_LEDS_TCA6507 is not set
> CONFIG_LEDS_TLC591XX=y
> CONFIG_LEDS_LM355x=y
> # CONFIG_LEDS_OT200 is not set
> # CONFIG_LEDS_IS31FL319X is not set
>
> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
> #
> CONFIG_LEDS_BLINKM=y
> CONFIG_LEDS_PM8058=y
> # CONFIG_LEDS_MLXREG is not set
> CONFIG_LEDS_USER=y
> CONFIG_LEDS_TI_LMU_COMMON=y
> CONFIG_LEDS_LM36274=y
> # CONFIG_LEDS_TPS6105X is not set
> CONFIG_LEDS_IP30=y
> CONFIG_LEDS_ACER_A500=y
>
> #
> # Flash and Torch LED drivers
> #
> CONFIG_LEDS_AS3645A=y
> CONFIG_LEDS_LM3601X=y
> # CONFIG_LEDS_RT8515 is not set
> CONFIG_LEDS_SGM3140=y
>
> #
> # RGB LED drivers
> #
> CONFIG_LEDS_PWM_MULTICOLOR=y
>
> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=y
> CONFIG_LEDS_TRIGGER_TIMER=y
> CONFIG_LEDS_TRIGGER_ONESHOT=y
> # CONFIG_LEDS_TRIGGER_DISK is not set
> CONFIG_LEDS_TRIGGER_MTD=y
> CONFIG_LEDS_TRIGGER_HEARTBEAT=y
> CONFIG_LEDS_TRIGGER_BACKLIGHT=y
> CONFIG_LEDS_TRIGGER_CPU=y
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=y
> # CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set
>
> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=y
> CONFIG_LEDS_TRIGGER_CAMERA=y
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> CONFIG_LEDS_TRIGGER_PATTERN=y
> CONFIG_LEDS_TRIGGER_AUDIO=y
> CONFIG_LEDS_TRIGGER_TTY=y
>
> #
> # Simple LED drivers
> #
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_RTC_LIB=y
> CONFIG_RTC_CLASS=y
> # CONFIG_RTC_HCTOSYS is not set
> CONFIG_RTC_SYSTOHC=y
> CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
> # CONFIG_RTC_DEBUG is not set
> # CONFIG_RTC_NVMEM is not set
>
> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=y
> # CONFIG_RTC_INTF_PROC is not set
> # CONFIG_RTC_INTF_DEV is not set
> CONFIG_RTC_DRV_TEST=y
>
> #
> # I2C RTC drivers
> #
> CONFIG_RTC_DRV_ABB5ZES3=y
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> # CONFIG_RTC_DRV_ABX80X is not set
> CONFIG_RTC_DRV_BRCMSTB=y
> CONFIG_RTC_DRV_DS1307=y
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=y
> CONFIG_RTC_DRV_DS1672=y
> CONFIG_RTC_DRV_LP8788=y
> CONFIG_RTC_DRV_MAX6900=y
> # CONFIG_RTC_DRV_MAX8907 is not set
> CONFIG_RTC_DRV_MAX8925=y
> # CONFIG_RTC_DRV_MAX77686 is not set
> CONFIG_RTC_DRV_RS5C372=y
> CONFIG_RTC_DRV_ISL1208=y
> # CONFIG_RTC_DRV_ISL12022 is not set
> # CONFIG_RTC_DRV_ISL12026 is not set
> CONFIG_RTC_DRV_X1205=y
> CONFIG_RTC_DRV_PCF8523=y
> CONFIG_RTC_DRV_PCF85063=y
> # CONFIG_RTC_DRV_PCF85363 is not set
> # CONFIG_RTC_DRV_PCF8563 is not set
> CONFIG_RTC_DRV_PCF8583=y
> CONFIG_RTC_DRV_M41T80=y
> # CONFIG_RTC_DRV_M41T80_WDT is not set
> # CONFIG_RTC_DRV_BQ32K is not set
> # CONFIG_RTC_DRV_TPS65910 is not set
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=y
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=y
> CONFIG_RTC_DRV_RX8025=y
> CONFIG_RTC_DRV_EM3027=y
> CONFIG_RTC_DRV_RV3028=y
> CONFIG_RTC_DRV_RV3032=y
> CONFIG_RTC_DRV_RV8803=y
> CONFIG_RTC_DRV_S5M=y
> CONFIG_RTC_DRV_SD3078=y
>
> #
> # SPI RTC drivers
> #
> CONFIG_RTC_I2C_AND_SPI=y
>
> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=y
> # CONFIG_RTC_DRV_DS3232_HWMON is not set
> # CONFIG_RTC_DRV_PCF2127 is not set
> CONFIG_RTC_DRV_RV3029C2=y
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> CONFIG_RTC_DRV_RX6110=y
>
> #
> # Platform RTC drivers
> #
> # CONFIG_RTC_DRV_CMOS is not set
> CONFIG_RTC_DRV_DS1286=y
> # CONFIG_RTC_DRV_DS1511 is not set
> CONFIG_RTC_DRV_DS1553=y
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=y
> CONFIG_RTC_DRV_DS2404=y
> CONFIG_RTC_DRV_DA9063=y
> CONFIG_RTC_DRV_STK17TA8=y
> CONFIG_RTC_DRV_M48T86=y
> # CONFIG_RTC_DRV_M48T35 is not set
> CONFIG_RTC_DRV_M48T59=y
> CONFIG_RTC_DRV_MSM6242=y
> CONFIG_RTC_DRV_BQ4802=y
> # CONFIG_RTC_DRV_RP5C01 is not set
> CONFIG_RTC_DRV_V3020=y
> CONFIG_RTC_DRV_GAMECUBE=y
> CONFIG_RTC_DRV_WM831X=y
> CONFIG_RTC_DRV_WM8350=y
> CONFIG_RTC_DRV_SC27XX=y
> CONFIG_RTC_DRV_SPEAR=y
> # CONFIG_RTC_DRV_PCF50633 is not set
>
> #
> # on-CPU RTC drivers
> #
> CONFIG_RTC_DRV_ASM9260=y
> # CONFIG_RTC_DRV_DAVINCI is not set
> CONFIG_RTC_DRV_DIGICOLOR=y
> CONFIG_RTC_DRV_FSL_FTM_ALARM=y
> CONFIG_RTC_DRV_MESON=y
> CONFIG_RTC_DRV_MESON_VRTC=y
> CONFIG_RTC_DRV_S3C=y
> # CONFIG_RTC_DRV_EP93XX is not set
> CONFIG_RTC_DRV_GENERIC=y
> CONFIG_RTC_DRV_VT8500=y
> # CONFIG_RTC_DRV_SUN6I is not set
> CONFIG_RTC_DRV_SUNXI=y
> CONFIG_RTC_DRV_MV=y
> CONFIG_RTC_DRV_FTRTC010=y
> CONFIG_RTC_DRV_STMP=y
> # CONFIG_RTC_DRV_MC13XXX is not set
> CONFIG_RTC_DRV_LPC32XX=y
> CONFIG_RTC_DRV_PM8XXX=y
> CONFIG_RTC_DRV_TEGRA=y
> CONFIG_RTC_DRV_MOXART=y
> # CONFIG_RTC_DRV_MT2712 is not set
> # CONFIG_RTC_DRV_MT6397 is not set
> CONFIG_RTC_DRV_MT7622=y
> # CONFIG_RTC_DRV_XGENE is not set
> CONFIG_RTC_DRV_STM32=y
> CONFIG_RTC_DRV_RTD119X=y
> CONFIG_RTC_DRV_TI_K3=y
>
> #
> # HID Sensor RTC drivers
> #
> CONFIG_RTC_DRV_GOLDFISH=y
> # CONFIG_RTC_DRV_MSC313 is not set
> CONFIG_DMADEVICES=y
> CONFIG_DMADEVICES_DEBUG=y
> # CONFIG_DMADEVICES_VDEBUG is not set
>
> #
> # DMA Devices
> #
> CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
> CONFIG_DMA_ENGINE=y
> CONFIG_DMA_VIRTUAL_CHANNELS=y
> # CONFIG_ALTERA_MSGDMA is not set
> CONFIG_APPLE_ADMAC=y
> # CONFIG_AXI_DMAC is not set
> # CONFIG_DMA_JZ4780 is not set
> # CONFIG_DMA_SA11X0 is not set
> # CONFIG_DMA_SUN6I is not set
> # CONFIG_EP93XX_DMA is not set
> CONFIG_HISI_DMA=y
> CONFIG_IMG_MDC_DMA=y
> CONFIG_INTEL_IDMA64=y
> # CONFIG_INTEL_IOP_ADMA is not set
> # CONFIG_K3_DMA is not set
> # CONFIG_MCF_EDMA is not set
> # CONFIG_MMP_PDMA is not set
> CONFIG_MMP_TDMA=y
> CONFIG_MV_XOR=y
> CONFIG_MXS_DMA=y
> # CONFIG_NBPFAXI_DMA is not set
> # CONFIG_PCH_DMA is not set
> CONFIG_PLX_DMA=y
> # CONFIG_STM32_DMA is not set
> CONFIG_STM32_DMAMUX=y
> # CONFIG_SPRD_DMA is not set
> # CONFIG_S3C24XX_DMAC is not set
> CONFIG_TEGRA20_APB_DMA=y
> # CONFIG_TEGRA210_ADMA is not set
> CONFIG_TIMB_DMA=y
> # CONFIG_XGENE_DMA is not set
> CONFIG_XILINX_ZYNQMP_DMA=y
> CONFIG_MTK_HSDMA=y
> # CONFIG_MTK_CQDMA is not set
> CONFIG_QCOM_ADM=y
> CONFIG_QCOM_HIDMA_MGMT=y
> CONFIG_QCOM_HIDMA=y
> CONFIG_DW_DMAC_CORE=y
> # CONFIG_DW_DMAC is not set
> # CONFIG_DW_DMAC_PCI is not set
> CONFIG_DW_EDMA=y
> CONFIG_DW_EDMA_PCIE=y
> # CONFIG_SF_PDMA is not set
> CONFIG_RENESAS_DMA=y
> CONFIG_SH_DMAE_BASE=y
> CONFIG_SH_DMAE=y
> # CONFIG_RCAR_DMAC is not set
> # CONFIG_RENESAS_USB_DMAC is not set
> # CONFIG_RZ_DMAC is not set
> CONFIG_TI_EDMA=y
> CONFIG_DMA_OMAP=y
> CONFIG_TI_DMA_CROSSBAR=y
> # CONFIG_INTEL_LDMA is not set
>
> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=y
> CONFIG_DMATEST=y
> CONFIG_DMA_ENGINE_RAID=y
>
> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=y
> CONFIG_SW_SYNC=y
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> CONFIG_DMABUF_DEBUG=y
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # CONFIG_DMABUF_SYSFS_STATS is not set
> # end of DMABUF options
>
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> # CONFIG_UIO is not set
> # CONFIG_VFIO is not set
> CONFIG_VIRT_DRIVERS=y
> CONFIG_VIRTIO_ANCHOR=y
> CONFIG_VIRTIO=y
> # CONFIG_VIRTIO_MENU is not set
> # CONFIG_VHOST_MENU is not set
>
> #
> # Microsoft Hyper-V guest support
> #
> # end of Microsoft Hyper-V guest support
>
> CONFIG_GREYBUS=y
> CONFIG_GREYBUS_ES2=y
> CONFIG_COMEDI=y
> # CONFIG_COMEDI_DEBUG is not set
> CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
> CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
> CONFIG_COMEDI_MISC_DRIVERS=y
> CONFIG_COMEDI_BOND=y
> CONFIG_COMEDI_TEST=y
> # CONFIG_COMEDI_PARPORT is not set
> # CONFIG_COMEDI_SSV_DNP is not set
> CONFIG_COMEDI_ISA_DRIVERS=y
> CONFIG_COMEDI_PCL711=y
> CONFIG_COMEDI_PCL724=y
> CONFIG_COMEDI_PCL726=y
> CONFIG_COMEDI_PCL730=y
> CONFIG_COMEDI_PCL812=y
> CONFIG_COMEDI_PCL816=y
> CONFIG_COMEDI_PCL818=y
> CONFIG_COMEDI_PCM3724=y
> CONFIG_COMEDI_AMPLC_DIO200_ISA=y
> # CONFIG_COMEDI_AMPLC_PC236_ISA is not set
> # CONFIG_COMEDI_AMPLC_PC263_ISA is not set
> CONFIG_COMEDI_RTI800=y
> CONFIG_COMEDI_RTI802=y
> CONFIG_COMEDI_DAC02=y
> # CONFIG_COMEDI_DAS16M1 is not set
> CONFIG_COMEDI_DAS08_ISA=y
> CONFIG_COMEDI_DAS16=y
> CONFIG_COMEDI_DAS800=y
> CONFIG_COMEDI_DAS1800=y
> # CONFIG_COMEDI_DAS6402 is not set
> CONFIG_COMEDI_DT2801=y
> # CONFIG_COMEDI_DT2811 is not set
> CONFIG_COMEDI_DT2814=y
> CONFIG_COMEDI_DT2815=y
> CONFIG_COMEDI_DT2817=y
> CONFIG_COMEDI_DT282X=y
> CONFIG_COMEDI_DMM32AT=y
> # CONFIG_COMEDI_FL512 is not set
> CONFIG_COMEDI_AIO_AIO12_8=y
> # CONFIG_COMEDI_AIO_IIRO_16 is not set
> CONFIG_COMEDI_II_PCI20KC=y
> # CONFIG_COMEDI_C6XDIGIO is not set
> CONFIG_COMEDI_MPC624=y
> # CONFIG_COMEDI_ADQ12B is not set
> CONFIG_COMEDI_NI_AT_A2150=y
> CONFIG_COMEDI_NI_AT_AO=y
> CONFIG_COMEDI_NI_ATMIO=y
> CONFIG_COMEDI_NI_ATMIO16D=y
> # CONFIG_COMEDI_NI_LABPC_ISA is not set
> CONFIG_COMEDI_PCMAD=y
> CONFIG_COMEDI_PCMDA12=y
> CONFIG_COMEDI_PCMMIO=y
> CONFIG_COMEDI_PCMUIO=y
> CONFIG_COMEDI_MULTIQ3=y
> # CONFIG_COMEDI_S526 is not set
> # CONFIG_COMEDI_PCI_DRIVERS is not set
> CONFIG_COMEDI_PCMCIA_DRIVERS=y
> CONFIG_COMEDI_CB_DAS16_CS=y
> CONFIG_COMEDI_DAS08_CS=y
> CONFIG_COMEDI_NI_DAQ_700_CS=y
> # CONFIG_COMEDI_NI_DAQ_DIO24_CS is not set
> CONFIG_COMEDI_NI_LABPC_CS=y
> # CONFIG_COMEDI_NI_MIO_CS is not set
> CONFIG_COMEDI_QUATECH_DAQP_CS=y
> CONFIG_COMEDI_USB_DRIVERS=y
> CONFIG_COMEDI_DT9812=y
> CONFIG_COMEDI_NI_USB6501=y
> CONFIG_COMEDI_USBDUX=y
> CONFIG_COMEDI_USBDUXFAST=y
> # CONFIG_COMEDI_USBDUXSIGMA is not set
> CONFIG_COMEDI_VMK80XX=y
> CONFIG_COMEDI_8254=y
> CONFIG_COMEDI_8255=y
> # CONFIG_COMEDI_8255_SA is not set
> CONFIG_COMEDI_KCOMEDILIB=y
> CONFIG_COMEDI_AMPLC_DIO200=y
> CONFIG_COMEDI_DAS08=y
> CONFIG_COMEDI_NI_LABPC=y
> CONFIG_COMEDI_NI_TIO=y
> CONFIG_COMEDI_NI_ROUTING=y
> # CONFIG_COMEDI_TESTS is not set
> # CONFIG_STAGING is not set
> CONFIG_MIPS_PLATFORM_DEVICES=y
> # CONFIG_RS780E_ACPI is not set
> CONFIG_LS2K_RESET=y
> CONFIG_GOLDFISH=y
> # CONFIG_GOLDFISH_PIPE is not set
> CONFIG_CHROME_PLATFORMS=y
> # CONFIG_CROS_EC is not set
> # CONFIG_MELLANOX_PLATFORM is not set
> CONFIG_OLPC_XO175=y
> # CONFIG_SURFACE_PLATFORMS is not set
> CONFIG_HAVE_CLK=y
> CONFIG_HAVE_CLK_PREPARE=y
> CONFIG_COMMON_CLK=y
> CONFIG_COMMON_CLK_WM831X=y
>
> #
> # Clock driver for ARM Reference designs
> #
> # CONFIG_CLK_ICST is not set
> # CONFIG_CLK_SP810 is not set
> # end of Clock driver for ARM Reference designs
>
> # CONFIG_CLK_HSDK is not set
> CONFIG_COMMON_CLK_APPLE_NCO=y
> CONFIG_COMMON_CLK_MAX77686=y
> CONFIG_COMMON_CLK_MAX9485=y
> CONFIG_COMMON_CLK_SCMI=y
> CONFIG_COMMON_CLK_SCPI=y
> # CONFIG_COMMON_CLK_SI5341 is not set
> CONFIG_COMMON_CLK_SI5351=y
> CONFIG_COMMON_CLK_SI544=y
> CONFIG_COMMON_CLK_BM1880=y
> CONFIG_COMMON_CLK_CDCE706=y
> CONFIG_COMMON_CLK_TPS68470=y
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> CONFIG_COMMON_CLK_FSL_FLEXSPI=y
> CONFIG_COMMON_CLK_FSL_SAI=y
> # CONFIG_COMMON_CLK_GEMINI is not set
> CONFIG_COMMON_CLK_ASPEED=y
> CONFIG_COMMON_CLK_S2MPS11=y
> CONFIG_CLK_TWL6040=y
> CONFIG_CLK_LS1028A_PLLDIG=y
> CONFIG_COMMON_CLK_XGENE=y
> # CONFIG_COMMON_CLK_PWM is not set
> CONFIG_COMMON_CLK_OXNAS=y
> # CONFIG_COMMON_CLK_MMP2_AUDIO is not set
> # CONFIG_CLK_ACTIONS is not set
> # CONFIG_CLK_BAIKAL_T1 is not set
> # CONFIG_CLK_BCM2711_DVP is not set
> # CONFIG_CLK_BCM2835 is not set
> # CONFIG_CLK_BCM_63XX is not set
> # CONFIG_CLK_BCM_63XX_GATE is not set
> # CONFIG_CLK_BCM_KONA is not set
> CONFIG_COMMON_CLK_IPROC=y
> CONFIG_CLK_BCM_CYGNUS=y
> CONFIG_CLK_BCM_HR2=y
> # CONFIG_CLK_BCM_NSP is not set
> # CONFIG_CLK_BCM_NS2 is not set
> # CONFIG_CLK_BCM_SR is not set
> # CONFIG_CLK_RASPBERRYPI is not set
> # CONFIG_COMMON_CLK_HI3516CV300 is not set
> CONFIG_COMMON_CLK_HI3519=y
> # CONFIG_COMMON_CLK_HI3559A is not set
> CONFIG_COMMON_CLK_HI3660=y
> CONFIG_COMMON_CLK_HI3670=y
> # CONFIG_COMMON_CLK_HI3798CV200 is not set
> # CONFIG_COMMON_CLK_HI6220 is not set
> CONFIG_RESET_HISI=y
> CONFIG_STUB_CLK_HI3660=y
> # CONFIG_COMMON_CLK_BOSTON is not set
> CONFIG_MXC_CLK=y
> CONFIG_CLK_IMX8MM=y
> # CONFIG_CLK_IMX8MN is not set
> CONFIG_CLK_IMX8MP=y
> # CONFIG_CLK_IMX8MQ is not set
> CONFIG_CLK_IMX8ULP=y
> CONFIG_CLK_IMX93=y
>
> #
> # Ingenic SoCs drivers
> #
> CONFIG_INGENIC_CGU_COMMON=y
> CONFIG_INGENIC_CGU_JZ4740=y
> # CONFIG_INGENIC_CGU_JZ4725B is not set
> # CONFIG_INGENIC_CGU_JZ4760 is not set
> # CONFIG_INGENIC_CGU_JZ4770 is not set
> CONFIG_INGENIC_CGU_JZ4780=y
> # CONFIG_INGENIC_CGU_X1000 is not set
> CONFIG_INGENIC_CGU_X1830=y
> # CONFIG_INGENIC_TCU_CLK is not set
> # end of Ingenic SoCs drivers
>
> CONFIG_TI_SYSCON_CLK=y
>
> #
> # Clock driver for MediaTek SoC
> #
> CONFIG_COMMON_CLK_MEDIATEK=y
> # CONFIG_COMMON_CLK_MT2701 is not set
> CONFIG_COMMON_CLK_MT2712=y
> CONFIG_COMMON_CLK_MT2712_BDPSYS=y
> CONFIG_COMMON_CLK_MT2712_IMGSYS=y
> CONFIG_COMMON_CLK_MT2712_JPGDECSYS=y
> # CONFIG_COMMON_CLK_MT2712_MFGCFG is not set
> CONFIG_COMMON_CLK_MT2712_MMSYS=y
> CONFIG_COMMON_CLK_MT2712_VDECSYS=y
> CONFIG_COMMON_CLK_MT2712_VENCSYS=y
> # CONFIG_COMMON_CLK_MT6765 is not set
> CONFIG_COMMON_CLK_MT6779=y
> CONFIG_COMMON_CLK_MT6779_MMSYS=y
> CONFIG_COMMON_CLK_MT6779_IMGSYS=y
> # CONFIG_COMMON_CLK_MT6779_IPESYS is not set
> CONFIG_COMMON_CLK_MT6779_CAMSYS=y
> # CONFIG_COMMON_CLK_MT6779_VDECSYS is not set
> CONFIG_COMMON_CLK_MT6779_VENCSYS=y
> CONFIG_COMMON_CLK_MT6779_MFGCFG=y
> CONFIG_COMMON_CLK_MT6779_AUDSYS=y
> # CONFIG_COMMON_CLK_MT6795 is not set
> CONFIG_COMMON_CLK_MT6797=y
> # CONFIG_COMMON_CLK_MT6797_MMSYS is not set
> CONFIG_COMMON_CLK_MT6797_IMGSYS=y
> # CONFIG_COMMON_CLK_MT6797_VDECSYS is not set
> CONFIG_COMMON_CLK_MT6797_VENCSYS=y
> CONFIG_COMMON_CLK_MT7622=y
> # CONFIG_COMMON_CLK_MT7622_ETHSYS is not set
> # CONFIG_COMMON_CLK_MT7622_HIFSYS is not set
> CONFIG_COMMON_CLK_MT7622_AUDSYS=y
> # CONFIG_COMMON_CLK_MT7629 is not set
> CONFIG_COMMON_CLK_MT7986=y
> CONFIG_COMMON_CLK_MT7986_ETHSYS=y
> # CONFIG_COMMON_CLK_MT8135 is not set
> # CONFIG_COMMON_CLK_MT8167 is not set
> # CONFIG_COMMON_CLK_MT8173 is not set
> CONFIG_COMMON_CLK_MT8183=y
> # CONFIG_COMMON_CLK_MT8183_AUDIOSYS is not set
> CONFIG_COMMON_CLK_MT8183_CAMSYS=y
> # CONFIG_COMMON_CLK_MT8183_IMGSYS is not set
> CONFIG_COMMON_CLK_MT8183_IPU_CORE0=y
> # CONFIG_COMMON_CLK_MT8183_IPU_CORE1 is not set
> CONFIG_COMMON_CLK_MT8183_IPU_ADL=y
> CONFIG_COMMON_CLK_MT8183_IPU_CONN=y
> CONFIG_COMMON_CLK_MT8183_MFGCFG=y
> CONFIG_COMMON_CLK_MT8183_MMSYS=y
> # CONFIG_COMMON_CLK_MT8183_VDECSYS is not set
> # CONFIG_COMMON_CLK_MT8183_VENCSYS is not set
> # CONFIG_COMMON_CLK_MT8186 is not set
> # CONFIG_COMMON_CLK_MT8192 is not set
> CONFIG_COMMON_CLK_MT8195=y
> CONFIG_COMMON_CLK_MT8365=y
> # CONFIG_COMMON_CLK_MT8365_APU is not set
> # CONFIG_COMMON_CLK_MT8365_CAM is not set
> # CONFIG_COMMON_CLK_MT8365_MFG is not set
> # CONFIG_COMMON_CLK_MT8365_MMSYS is not set
> # CONFIG_COMMON_CLK_MT8365_VDEC is not set
> CONFIG_COMMON_CLK_MT8365_VENC=y
> CONFIG_COMMON_CLK_MT8516=y
> # CONFIG_COMMON_CLK_MT8516_AUDSYS is not set
> # end of Clock driver for MediaTek SoC
>
> #
> # Clock support for Amlogic platforms
> #
> # CONFIG_COMMON_CLK_AXG_AUDIO is not set
> # end of Clock support for Amlogic platforms
>
> # CONFIG_MSTAR_MSC313_MPLL is not set
> # CONFIG_MCHP_CLK_MPFS is not set
> # CONFIG_COMMON_CLK_PISTACHIO is not set
> # CONFIG_CLK_MT7621 is not set
> CONFIG_CLK_RENESAS=y
> # CONFIG_CLK_EMEV2 is not set
> # CONFIG_CLK_RZA1 is not set
> # CONFIG_CLK_R7S9210 is not set
> CONFIG_CLK_R8A73A4=y
> # CONFIG_CLK_R8A7740 is not set
> CONFIG_CLK_R8A7742=y
> # CONFIG_CLK_R8A7743 is not set
> # CONFIG_CLK_R8A7745 is not set
> CONFIG_CLK_R8A77470=y
> # CONFIG_CLK_R8A774A1 is not set
> # CONFIG_CLK_R8A774B1 is not set
> # CONFIG_CLK_R8A774C0 is not set
> # CONFIG_CLK_R8A774E1 is not set
> CONFIG_CLK_R8A7778=y
> CONFIG_CLK_R8A7779=y
> # CONFIG_CLK_R8A7790 is not set
> # CONFIG_CLK_R8A7791 is not set
> CONFIG_CLK_R8A7792=y
> CONFIG_CLK_R8A7794=y
> CONFIG_CLK_R8A7795=y
> # CONFIG_CLK_R8A77960 is not set
> # CONFIG_CLK_R8A77961 is not set
> CONFIG_CLK_R8A77965=y
> CONFIG_CLK_R8A77970=y
> # CONFIG_CLK_R8A77980 is not set
> CONFIG_CLK_R8A77990=y
> # CONFIG_CLK_R8A77995 is not set
> CONFIG_CLK_R8A779A0=y
> CONFIG_CLK_R8A779F0=y
> CONFIG_CLK_R8A779G0=y
> CONFIG_CLK_R9A06G032=y
> CONFIG_CLK_R9A07G043=y
> # CONFIG_CLK_R9A07G044 is not set
> # CONFIG_CLK_R9A07G054 is not set
> CONFIG_CLK_R9A09G011=y
> CONFIG_CLK_SH73A0=y
> CONFIG_CLK_RCAR_CPG_LIB=y
> CONFIG_CLK_RCAR_GEN2_CPG=y
> CONFIG_CLK_RCAR_GEN3_CPG=y
> CONFIG_CLK_RCAR_GEN4_CPG=y
> # CONFIG_CLK_RCAR_USB2_CLOCK_SEL is not set
> CONFIG_CLK_RZG2L=y
> CONFIG_CLK_RENESAS_CPG_MSSR=y
> CONFIG_CLK_RENESAS_CPG_MSTP=y
> CONFIG_CLK_RENESAS_DIV6=y
> CONFIG_COMMON_CLK_SAMSUNG=y
> # CONFIG_S3C64XX_COMMON_CLK is not set
> CONFIG_S5PV210_COMMON_CLK=y
> # CONFIG_EXYNOS_3250_COMMON_CLK is not set
> CONFIG_EXYNOS_4_COMMON_CLK=y
> CONFIG_EXYNOS_5250_COMMON_CLK=y
> CONFIG_EXYNOS_5260_COMMON_CLK=y
> CONFIG_EXYNOS_5410_COMMON_CLK=y
> CONFIG_EXYNOS_5420_COMMON_CLK=y
> # CONFIG_EXYNOS_ARM64_COMMON_CLK is not set
> # CONFIG_EXYNOS_AUDSS_CLK_CON is not set
> CONFIG_EXYNOS_CLKOUT=y
> CONFIG_S3C2410_COMMON_CLK=y
> CONFIG_S3C2412_COMMON_CLK=y
> # CONFIG_S3C2443_COMMON_CLK is not set
> CONFIG_CLK_SIFIVE=y
> # CONFIG_CLK_SIFIVE_PRCI is not set
> CONFIG_CLK_INTEL_SOCFPGA=y
> CONFIG_CLK_INTEL_SOCFPGA32=y
> # CONFIG_CLK_INTEL_SOCFPGA64 is not set
> # CONFIG_SPRD_COMMON_CLK is not set
> CONFIG_CLK_STARFIVE_JH7100=y
> CONFIG_CLK_STARFIVE_JH7100_AUDIO=y
> CONFIG_CLK_SUNXI=y
> CONFIG_CLK_SUNXI_CLOCKS=y
> CONFIG_CLK_SUNXI_PRCM_SUN6I=y
> # CONFIG_CLK_SUNXI_PRCM_SUN8I is not set
> # CONFIG_CLK_SUNXI_PRCM_SUN9I is not set
> CONFIG_SUNXI_CCU=y
> CONFIG_SUNIV_F1C100S_CCU=y
> CONFIG_SUN20I_D1_CCU=y
> CONFIG_SUN20I_D1_R_CCU=y
> CONFIG_SUN50I_A64_CCU=y
> CONFIG_SUN50I_A100_CCU=y
> CONFIG_SUN50I_A100_R_CCU=y
> # CONFIG_SUN50I_H6_CCU is not set
> CONFIG_SUN50I_H616_CCU=y
> CONFIG_SUN50I_H6_R_CCU=y
> CONFIG_SUN4I_A10_CCU=y
> # CONFIG_SUN5I_CCU is not set
> CONFIG_SUN6I_A31_CCU=y
> CONFIG_SUN6I_RTC_CCU=y
> # CONFIG_SUN8I_A23_CCU is not set
> CONFIG_SUN8I_A33_CCU=y
> CONFIG_SUN8I_A83T_CCU=y
> CONFIG_SUN8I_H3_CCU=y
> CONFIG_SUN8I_V3S_CCU=y
> CONFIG_SUN8I_DE2_CCU=y
> # CONFIG_SUN8I_R40_CCU is not set
> # CONFIG_SUN9I_A80_CCU is not set
> # CONFIG_SUN8I_R_CCU is not set
> CONFIG_COMMON_CLK_TI_ADPLL=y
> CONFIG_COMMON_CLK_VISCONTI=y
> # CONFIG_XILINX_VCU is not set
> # CONFIG_COMMON_CLK_ZYNQMP is not set
> CONFIG_HWSPINLOCK=y
> CONFIG_HWSPINLOCK_OMAP=y
> CONFIG_HWSPINLOCK_QCOM=y
> CONFIG_HWSPINLOCK_SPRD=y
> # CONFIG_HWSPINLOCK_STM32 is not set
> CONFIG_HWSPINLOCK_SUN6I=y
> CONFIG_HSEM_U8500=y
>
> #
> # Clock Source drivers
> #
> CONFIG_TIMER_OF=y
> CONFIG_TIMER_PROBE=y
> CONFIG_CLKSRC_MMIO=y
> CONFIG_BCM2835_TIMER=y
> # CONFIG_BCM_KONA_TIMER is not set
> # CONFIG_DAVINCI_TIMER is not set
> # CONFIG_DIGICOLOR_TIMER is not set
> # CONFIG_OMAP_DM_TIMER is not set
> CONFIG_DW_APB_TIMER=y
> # CONFIG_FTTMR010_TIMER is not set
> CONFIG_IXP4XX_TIMER=y
> CONFIG_MESON6_TIMER=y
> CONFIG_OWL_TIMER=y
> # CONFIG_RDA_TIMER is not set
> CONFIG_SUN4I_TIMER=y
> # CONFIG_SUN5I_HSTIMER is not set
> CONFIG_TEGRA_TIMER=y
> # CONFIG_VT8500_TIMER is not set
> # CONFIG_NPCM7XX_TIMER is not set
> # CONFIG_CADENCE_TTC_TIMER is not set
> CONFIG_ASM9260_TIMER=y
> # CONFIG_CLKSRC_DBX500_PRCMU is not set
> CONFIG_CLPS711X_TIMER=y
> CONFIG_MXS_TIMER=y
> CONFIG_NSPIRE_TIMER=y
> # CONFIG_INTEGRATOR_AP_TIMER is not set
> # CONFIG_CLKSRC_PISTACHIO is not set
> CONFIG_CLKSRC_TI_32K=y
> # CONFIG_CLKSRC_STM32_LP is not set
> CONFIG_CLKSRC_MPS2=y
> CONFIG_ARC_TIMERS=y
> CONFIG_ARC_TIMERS_64BIT=y
> CONFIG_ARM_TIMER_SP804=y
> # CONFIG_ARMV7M_SYSTICK is not set
> CONFIG_ATMEL_PIT=y
> CONFIG_ATMEL_ST=y
> # CONFIG_CLKSRC_SAMSUNG_PWM is not set
> # CONFIG_FSL_FTM_TIMER is not set
> # CONFIG_OXNAS_RPS_TIMER is not set
> # CONFIG_MTK_TIMER is not set
> CONFIG_SH_TIMER_CMT=y
> CONFIG_SH_TIMER_MTU2=y
> # CONFIG_RENESAS_OSTM is not set
> CONFIG_SH_TIMER_TMU=y
> CONFIG_EM_TIMER_STI=y
> CONFIG_CLKSRC_VERSATILE=y
> # CONFIG_CLKSRC_PXA is not set
> CONFIG_TIMER_IMX_SYS_CTR=y
> CONFIG_CLKSRC_ST_LPC=y
> CONFIG_GXP_TIMER=y
> # CONFIG_MSC313E_TIMER is not set
> # CONFIG_INGENIC_TIMER is not set
> # CONFIG_INGENIC_SYSOST is not set
> CONFIG_INGENIC_OST=y
> # CONFIG_MICROCHIP_PIT64B is not set
> # CONFIG_GOLDFISH_TIMER is not set
> # end of Clock Source drivers
>
> CONFIG_MAILBOX=y
> CONFIG_IMX_MBOX=y
> CONFIG_ROCKCHIP_MBOX=y
> CONFIG_ALTERA_MBOX=y
> CONFIG_POLARFIRE_SOC_MAILBOX=y
> CONFIG_QCOM_APCS_IPC=y
> # CONFIG_BCM_PDC_MBOX is not set
> CONFIG_STM32_IPCC=y
> CONFIG_MTK_ADSP_MBOX=y
> CONFIG_MTK_CMDQ_MBOX=y
> # CONFIG_SUN6I_MSGBOX is not set
> CONFIG_SPRD_MBOX=y
> CONFIG_QCOM_IPCC=y
> CONFIG_IOMMU_API=y
> CONFIG_IOMMU_SUPPORT=y
>
> #
> # Generic IOMMU Pagetable Support
> #
> CONFIG_IOMMU_IO_PGTABLE=y
> CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
> # CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST is not set
> # end of Generic IOMMU Pagetable Support
>
> CONFIG_IOMMU_DEBUGFS=y
> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> CONFIG_IOMMU_DEFAULT_DMA_LAZY=y
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> # CONFIG_OMAP_IOMMU is not set
> # CONFIG_ROCKCHIP_IOMMU is not set
> # CONFIG_SUN50I_IOMMU is not set
> CONFIG_EXYNOS_IOMMU=y
> # CONFIG_EXYNOS_IOMMU_DEBUG is not set
> CONFIG_S390_CCW_IOMMU=y
> # CONFIG_S390_AP_IOMMU is not set
> # CONFIG_MTK_IOMMU is not set
> CONFIG_SPRD_IOMMU=y
>
> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
>
> #
> # Rpmsg drivers
> #
> CONFIG_RPMSG=y
> CONFIG_RPMSG_CTRL=y
> CONFIG_RPMSG_NS=y
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> CONFIG_RPMSG_VIRTIO=y
> # end of Rpmsg drivers
>
> #
> # SOC (System On Chip) specific Drivers
> #
> # CONFIG_OWL_PM_DOMAINS is not set
>
> #
> # Amlogic SoC drivers
> #
> CONFIG_MESON_CANVAS=y
> CONFIG_MESON_CLK_MEASURE=y
> CONFIG_MESON_GX_SOCINFO=y
> CONFIG_MESON_MX_SOCINFO=y
> # end of Amlogic SoC drivers
>
> #
> # Apple SoC drivers
> #
> # CONFIG_APPLE_PMGR_PWRSTATE is not set
> CONFIG_APPLE_RTKIT=y
> CONFIG_APPLE_SART=y
> # end of Apple SoC drivers
>
> #
> # ASPEED SoC drivers
> #
> # CONFIG_ASPEED_LPC_CTRL is not set
> # CONFIG_ASPEED_LPC_SNOOP is not set
> CONFIG_ASPEED_UART_ROUTING=y
> CONFIG_ASPEED_P2A_CTRL=y
> # CONFIG_ASPEED_SOCINFO is not set
> # end of ASPEED SoC drivers
>
> CONFIG_AT91_SOC_ID=y
> # CONFIG_AT91_SOC_SFR is not set
>
> #
> # Broadcom SoC drivers
> #
> # CONFIG_SOC_BCM63XX is not set
> CONFIG_SOC_BRCMSTB=y
> # end of Broadcom SoC drivers
>
> #
> # NXP/Freescale QorIQ SoC drivers
> #
> CONFIG_FSL_GUTS=y
> # end of NXP/Freescale QorIQ SoC drivers
>
> #
> # fujitsu SoC drivers
> #
> # end of fujitsu SoC drivers
>
> #
> # i.MX SoC drivers
> #
> # CONFIG_SOC_IMX8M is not set
> CONFIG_SOC_IMX9=y
> # end of i.MX SoC drivers
>
> #
> # IXP4xx SoC drivers
> #
> CONFIG_IXP4XX_QMGR=y
> CONFIG_IXP4XX_NPE=y
> # end of IXP4xx SoC drivers
>
> #
> # Enable LiteX SoC Builder specific drivers
> #
> # CONFIG_LITEX_SOC_CONTROLLER is not set
> # end of Enable LiteX SoC Builder specific drivers
>
> #
> # MediaTek SoC drivers
> #
> CONFIG_MTK_CMDQ=y
> CONFIG_MTK_DEVAPC=y
> CONFIG_MTK_INFRACFG=y
> # CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
> CONFIG_MTK_MMSYS=y
> # end of MediaTek SoC drivers
>
> CONFIG_POLARFIRE_SOC_SYS_CTRL=y
>
> #
> # Qualcomm SoC drivers
> #
> CONFIG_QCOM_AOSS_QMP=y
> CONFIG_QCOM_GENI_SE=y
> CONFIG_QCOM_GSBI=y
> CONFIG_QCOM_LLCC=y
> # CONFIG_QCOM_RPMH is not set
> # CONFIG_QCOM_SMEM is not set
> # CONFIG_QCOM_SMD_RPM is not set
> CONFIG_QCOM_SPM=y
> CONFIG_QCOM_WCNSS_CTRL=y
> # CONFIG_QCOM_ICC_BWMON is not set
> # end of Qualcomm SoC drivers
>
> CONFIG_SOC_RENESAS=y
> # CONFIG_RST_RCAR is not set
> CONFIG_SYSC_RCAR=y
> CONFIG_SYSC_RCAR_GEN4=y
> # CONFIG_SYSC_R8A77995 is not set
> # CONFIG_SYSC_R8A7794 is not set
> # CONFIG_SYSC_R8A77990 is not set
> CONFIG_SYSC_R8A7779=y
> # CONFIG_SYSC_R8A7790 is not set
> CONFIG_SYSC_R8A7795=y
> CONFIG_SYSC_R8A7791=y
> CONFIG_SYSC_R8A77965=y
> # CONFIG_SYSC_R8A77960 is not set
> # CONFIG_SYSC_R8A77961 is not set
> CONFIG_SYSC_R8A779F0=y
> CONFIG_SYSC_R8A7792=y
> # CONFIG_SYSC_R8A77980 is not set
> # CONFIG_SYSC_R8A77970 is not set
> CONFIG_SYSC_R8A779A0=y
> # CONFIG_SYSC_R8A779G0 is not set
> CONFIG_SYSC_RMOBILE=y
> # CONFIG_SYSC_R8A77470 is not set
> # CONFIG_SYSC_R8A7745 is not set
> # CONFIG_SYSC_R8A7742 is not set
> CONFIG_SYSC_R8A7743=y
> CONFIG_SYSC_R8A774C0=y
> # CONFIG_SYSC_R8A774E1 is not set
> # CONFIG_SYSC_R8A774A1 is not set
> # CONFIG_SYSC_R8A774B1 is not set
> CONFIG_ROCKCHIP_GRF=y
> # CONFIG_ROCKCHIP_PM_DOMAINS is not set
> CONFIG_SOC_SAMSUNG=y
> CONFIG_EXYNOS_ASV_ARM=y
> CONFIG_EXYNOS_CHIPID=y
> CONFIG_EXYNOS_USI=y
> CONFIG_EXYNOS_PM_DOMAINS=y
> # CONFIG_EXYNOS_REGULATOR_COUPLER is not set
> CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
> # CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
> # CONFIG_SOC_TI is not set
> CONFIG_UX500_SOC_ID=y
>
> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
>
> CONFIG_PM_DEVFREQ=y
>
> #
> # DEVFREQ Governors
> #
> CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
> CONFIG_DEVFREQ_GOV_PERFORMANCE=y
> # CONFIG_DEVFREQ_GOV_POWERSAVE is not set
> CONFIG_DEVFREQ_GOV_USERSPACE=y
> CONFIG_DEVFREQ_GOV_PASSIVE=y
>
> #
> # DEVFREQ Drivers
> #
> CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
> CONFIG_ARM_IMX_BUS_DEVFREQ=y
> CONFIG_ARM_TEGRA_DEVFREQ=y
> # CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
> CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ=y
> CONFIG_PM_DEVFREQ_EVENT=y
> CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
> CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
> CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI=y
> CONFIG_EXTCON=y
>
> #
> # Extcon Device Drivers
> #
> # CONFIG_EXTCON_ADC_JACK is not set
> CONFIG_EXTCON_FSA9480=y
> CONFIG_EXTCON_GPIO=y
> CONFIG_EXTCON_MAX3355=y
> CONFIG_EXTCON_MAX77693=y
> # CONFIG_EXTCON_MAX77843 is not set
> # CONFIG_EXTCON_PTN5150 is not set
> # CONFIG_EXTCON_QCOM_SPMI_MISC is not set
> CONFIG_EXTCON_RT8973A=y
> # CONFIG_EXTCON_SM5502 is not set
> # CONFIG_EXTCON_USB_GPIO is not set
> # CONFIG_EXTCON_USBC_TUSB320 is not set
> CONFIG_MEMORY=y
> CONFIG_DDR=y
> # CONFIG_BRCMSTB_DPFE is not set
> CONFIG_BRCMSTB_MEMC=y
> # CONFIG_BT1_L2_CTL is not set
> CONFIG_TI_EMIF=y
> # CONFIG_FSL_CORENET_CF is not set
> CONFIG_FSL_IFC=y
> CONFIG_MTK_SMI=y
> # CONFIG_DA8XX_DDRCTL is not set
> CONFIG_RENESAS_RPCIF=y
> CONFIG_STM32_FMC2_EBI=y
> # CONFIG_SAMSUNG_MC is not set
> # CONFIG_TEGRA_MC is not set
> CONFIG_IIO=y
> CONFIG_IIO_BUFFER=y
> CONFIG_IIO_BUFFER_CB=y
> CONFIG_IIO_BUFFER_DMA=y
> CONFIG_IIO_BUFFER_DMAENGINE=y
> CONFIG_IIO_BUFFER_HW_CONSUMER=y
> CONFIG_IIO_KFIFO_BUF=y
> CONFIG_IIO_TRIGGERED_BUFFER=y
> CONFIG_IIO_CONFIGFS=y
> CONFIG_IIO_TRIGGER=y
> CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
> CONFIG_IIO_SW_DEVICE=y
> # CONFIG_IIO_SW_TRIGGER is not set
> # CONFIG_IIO_TRIGGERED_EVENT is not set
>
> #
> # Accelerometers
> #
> CONFIG_ADXL313=y
> CONFIG_ADXL313_I2C=y
> CONFIG_ADXL345=y
> CONFIG_ADXL345_I2C=y
> CONFIG_ADXL355=y
> CONFIG_ADXL355_I2C=y
> CONFIG_ADXL367=y
> CONFIG_ADXL367_I2C=y
> CONFIG_ADXL372=y
> CONFIG_ADXL372_I2C=y
> CONFIG_BMA180=y
> CONFIG_BMA400=y
> CONFIG_BMA400_I2C=y
> CONFIG_BMC150_ACCEL=y
> CONFIG_BMC150_ACCEL_I2C=y
> CONFIG_DA280=y
> # CONFIG_DA311 is not set
> CONFIG_DMARD06=y
> CONFIG_DMARD09=y
> CONFIG_DMARD10=y
> # CONFIG_FXLS8962AF_I2C is not set
> CONFIG_KXSD9=y
> # CONFIG_KXSD9_I2C is not set
> CONFIG_KXCJK1013=y
> CONFIG_MC3230=y
> CONFIG_MMA7455=y
> CONFIG_MMA7455_I2C=y
> CONFIG_MMA7660=y
> # CONFIG_MMA8452 is not set
> CONFIG_MMA9551_CORE=y
> CONFIG_MMA9551=y
> # CONFIG_MMA9553 is not set
> # CONFIG_MSA311 is not set
> CONFIG_MXC4005=y
> # CONFIG_MXC6255 is not set
> CONFIG_STK8312=y
> CONFIG_STK8BA50=y
> # end of Accelerometers
>
> #
> # Analog to digital converters
> #
> CONFIG_AD7091R5=y
> # CONFIG_AD7291 is not set
> # CONFIG_AD7606_IFACE_PARALLEL is not set
> # CONFIG_AD799X is not set
> # CONFIG_ASPEED_ADC is not set
> CONFIG_AT91_SAMA5D2_ADC=y
> # CONFIG_BCM_IPROC_ADC is not set
> # CONFIG_BERLIN2_ADC is not set
> CONFIG_CC10001_ADC=y
> # CONFIG_DA9150_GPADC is not set
> # CONFIG_DLN2_ADC is not set
> # CONFIG_ENVELOPE_DETECTOR is not set
> # CONFIG_FSL_MX25_ADC is not set
> CONFIG_HX711=y
> CONFIG_INA2XX_ADC=y
> CONFIG_INGENIC_ADC=y
> # CONFIG_IMX7D_ADC is not set
> CONFIG_IMX8QXP_ADC=y
> CONFIG_LP8788_ADC=y
> CONFIG_LPC18XX_ADC=y
> # CONFIG_LPC32XX_ADC is not set
> CONFIG_LTC2471=y
> # CONFIG_LTC2485 is not set
> CONFIG_LTC2497=y
> # CONFIG_MAX1363 is not set
> CONFIG_MAX9611=y
> # CONFIG_MCP3422 is not set
> CONFIG_MEDIATEK_MT6360_ADC=y
> CONFIG_MEDIATEK_MT6577_AUXADC=y
> CONFIG_MEN_Z188_ADC=y
> CONFIG_MP2629_ADC=y
> CONFIG_NAU7802=y
> CONFIG_NPCM_ADC=y
> CONFIG_QCOM_VADC_COMMON=y
> CONFIG_QCOM_PM8XXX_XOADC=y
> # CONFIG_RCAR_GYRO_ADC is not set
> CONFIG_ROCKCHIP_SARADC=y
> CONFIG_RICHTEK_RTQ6056=y
> CONFIG_RZG2L_ADC=y
> CONFIG_SC27XX_ADC=y
> CONFIG_SPEAR_ADC=y
> CONFIG_SD_ADC_MODULATOR=y
> CONFIG_STM32_DFSDM_CORE=y
> CONFIG_STM32_DFSDM_ADC=y
> # CONFIG_SUN4I_GPADC is not set
> # CONFIG_TI_ADC081C is not set
> CONFIG_TI_ADS1015=y
> # CONFIG_TI_AM335X_ADC is not set
> # CONFIG_VF610_ADC is not set
> CONFIG_VIPERBOARD_ADC=y
> CONFIG_XILINX_XADC=y
> CONFIG_XILINX_AMS=y
> # end of Analog to digital converters
>
> #
> # Analog to digital and digital to analog converters
> #
> # end of Analog to digital and digital to analog converters
>
> #
> # Analog Front Ends
> #
> CONFIG_IIO_RESCALE=y
> # end of Analog Front Ends
>
> #
> # Amplifiers
> #
> # CONFIG_HMC425 is not set
> # end of Amplifiers
>
> #
> # Capacitance to digital converters
> #
> # CONFIG_AD7150 is not set
> CONFIG_AD7746=y
> # end of Capacitance to digital converters
>
> #
> # Chemical Sensors
> #
> CONFIG_ATLAS_PH_SENSOR=y
> CONFIG_ATLAS_EZO_SENSOR=y
> CONFIG_BME680=y
> CONFIG_BME680_I2C=y
> CONFIG_CCS811=y
> # CONFIG_IAQCORE is not set
> # CONFIG_PMS7003 is not set
> CONFIG_SCD30_CORE=y
> # CONFIG_SCD30_I2C is not set
> CONFIG_SCD30_SERIAL=y
> CONFIG_SCD4X=y
> # CONFIG_SENSIRION_SGP30 is not set
> CONFIG_SENSIRION_SGP40=y
> CONFIG_SPS30=y
> # CONFIG_SPS30_I2C is not set
> CONFIG_SPS30_SERIAL=y
> CONFIG_SENSEAIR_SUNRISE_CO2=y
> CONFIG_VZ89X=y
> # end of Chemical Sensors
>
> #
> # Hid Sensor IIO Common
> #
> # end of Hid Sensor IIO Common
>
> CONFIG_IIO_MS_SENSORS_I2C=y
>
> #
> # IIO SCMI Sensors
> #
> # end of IIO SCMI Sensors
>
> #
> # SSP Sensor Common
> #
> # end of SSP Sensor Common
>
> CONFIG_IIO_ST_SENSORS_I2C=y
> CONFIG_IIO_ST_SENSORS_CORE=y
>
> #
> # Digital to analog converters
> #
> CONFIG_AD5064=y
> CONFIG_AD5380=y
> # CONFIG_AD5446 is not set
> # CONFIG_AD5593R is not set
> CONFIG_AD5686=y
> CONFIG_AD5696_I2C=y
> CONFIG_DPOT_DAC=y
> CONFIG_DS4424=y
> CONFIG_LPC18XX_DAC=y
> CONFIG_M62332=y
> CONFIG_MAX517=y
> CONFIG_MAX5821=y
> CONFIG_MCP4725=y
> CONFIG_STM32_DAC=y
> CONFIG_STM32_DAC_CORE=y
> CONFIG_TI_DAC5571=y
> # CONFIG_VF610_DAC is not set
> # end of Digital to analog converters
>
> #
> # IIO dummy driver
> #
> # CONFIG_IIO_SIMPLE_DUMMY is not set
> # end of IIO dummy driver
>
> #
> # Filters
> #
> # end of Filters
>
> #
> # Frequency Synthesizers DDS/PLL
> #
>
> #
> # Clock Generator/Distribution
> #
> # end of Clock Generator/Distribution
>
> #
> # Phase-Locked Loop (PLL) frequency synthesizers
> #
> # end of Phase-Locked Loop (PLL) frequency synthesizers
> # end of Frequency Synthesizers DDS/PLL
>
> #
> # Digital gyroscope sensors
> #
> # CONFIG_BMG160 is not set
> CONFIG_FXAS21002C=y
> CONFIG_FXAS21002C_I2C=y
> CONFIG_MPU3050=y
> CONFIG_MPU3050_I2C=y
> CONFIG_IIO_ST_GYRO_3AXIS=y
> CONFIG_IIO_ST_GYRO_I2C_3AXIS=y
> CONFIG_ITG3200=y
> # end of Digital gyroscope sensors
>
> #
> # Health Sensors
> #
>
> #
> # Heart Rate Monitors
> #
> CONFIG_AFE4404=y
> CONFIG_MAX30100=y
> CONFIG_MAX30102=y
> # end of Heart Rate Monitors
> # end of Health Sensors
>
> #
> # Humidity sensors
> #
> CONFIG_AM2315=y
> # CONFIG_DHT11 is not set
> # CONFIG_HDC100X is not set
> # CONFIG_HDC2010 is not set
> CONFIG_HTS221=y
> CONFIG_HTS221_I2C=y
> CONFIG_HTU21=y
> CONFIG_SI7005=y
> # CONFIG_SI7020 is not set
> # end of Humidity sensors
>
> #
> # Inertial measurement units
> #
> CONFIG_BMI160=y
> CONFIG_BMI160_I2C=y
> CONFIG_BOSCH_BNO055=y
> CONFIG_BOSCH_BNO055_SERIAL=y
> CONFIG_BOSCH_BNO055_I2C=y
> # CONFIG_FXOS8700_I2C is not set
> CONFIG_KMX61=y
> CONFIG_INV_ICM42600=y
> CONFIG_INV_ICM42600_I2C=y
> # CONFIG_INV_MPU6050_I2C is not set
> CONFIG_IIO_ST_LSM6DSX=y
> CONFIG_IIO_ST_LSM6DSX_I2C=y
> CONFIG_IIO_ST_LSM6DSX_I3C=y
> # end of Inertial measurement units
>
> #
> # Light sensors
> #
> # CONFIG_ADJD_S311 is not set
> CONFIG_ADUX1020=y
> CONFIG_AL3010=y
> CONFIG_AL3320A=y
> # CONFIG_APDS9300 is not set
> CONFIG_APDS9960=y
> # CONFIG_AS73211 is not set
> CONFIG_BH1750=y
> # CONFIG_BH1780 is not set
> # CONFIG_CM32181 is not set
> CONFIG_CM3232=y
> # CONFIG_CM3323 is not set
> # CONFIG_CM3605 is not set
> CONFIG_CM36651=y
> CONFIG_GP2AP002=y
> CONFIG_GP2AP020A00F=y
> CONFIG_IQS621_ALS=y
> CONFIG_SENSORS_ISL29018=y
> CONFIG_SENSORS_ISL29028=y
> CONFIG_ISL29125=y
> CONFIG_JSA1212=y
> # CONFIG_RPR0521 is not set
> CONFIG_LTR501=y
> # CONFIG_LTRF216A is not set
> CONFIG_LV0104CS=y
> CONFIG_MAX44000=y
> CONFIG_MAX44009=y
> CONFIG_NOA1305=y
> # CONFIG_OPT3001 is not set
> # CONFIG_PA12203001 is not set
> # CONFIG_SI1133 is not set
> # CONFIG_SI1145 is not set
> # CONFIG_STK3310 is not set
> # CONFIG_ST_UVIS25 is not set
> CONFIG_TCS3414=y
> CONFIG_TCS3472=y
> # CONFIG_SENSORS_TSL2563 is not set
> CONFIG_TSL2583=y
> CONFIG_TSL2591=y
> # CONFIG_TSL2772 is not set
> CONFIG_TSL4531=y
> CONFIG_US5182D=y
> CONFIG_VCNL4000=y
> CONFIG_VCNL4035=y
> # CONFIG_VEML6030 is not set
> # CONFIG_VEML6070 is not set
> CONFIG_VL6180=y
> # CONFIG_ZOPT2201 is not set
> # end of Light sensors
>
> #
> # Magnetometer sensors
> #
> # CONFIG_AK8974 is not set
> CONFIG_AK8975=y
> CONFIG_AK09911=y
> CONFIG_BMC150_MAGN=y
> CONFIG_BMC150_MAGN_I2C=y
> CONFIG_MAG3110=y
> # CONFIG_MMC35240 is not set
> CONFIG_IIO_ST_MAGN_3AXIS=y
> # CONFIG_IIO_ST_MAGN_I2C_3AXIS is not set
> # CONFIG_SENSORS_HMC5843_I2C is not set
> CONFIG_SENSORS_RM3100=y
> CONFIG_SENSORS_RM3100_I2C=y
> CONFIG_YAMAHA_YAS530=y
> # end of Magnetometer sensors
>
> #
> # Multiplexers
> #
> CONFIG_IIO_MUX=y
> # end of Multiplexers
>
> #
> # Inclinometer sensors
> #
> # end of Inclinometer sensors
>
> #
> # Triggers - standalone
> #
> CONFIG_IIO_INTERRUPT_TRIGGER=y
> # CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
> # CONFIG_IIO_STM32_TIMER_TRIGGER is not set
> CONFIG_IIO_SYSFS_TRIGGER=y
> # end of Triggers - standalone
>
> #
> # Linear and angular position sensors
> #
> # CONFIG_IQS624_POS is not set
> # end of Linear and angular position sensors
>
> #
> # Digital potentiometers
> #
> # CONFIG_AD5110 is not set
> CONFIG_AD5272=y
> CONFIG_DS1803=y
> # CONFIG_MAX5432 is not set
> CONFIG_MCP4018=y
> # CONFIG_MCP4531 is not set
> CONFIG_TPL0102=y
> # end of Digital potentiometers
>
> #
> # Digital potentiostats
> #
> CONFIG_LMP91000=y
> # end of Digital potentiostats
>
> #
> # Pressure sensors
> #
> CONFIG_ABP060MG=y
> CONFIG_BMP280=y
> CONFIG_BMP280_I2C=y
> CONFIG_DLHL60D=y
> # CONFIG_DPS310 is not set
> CONFIG_HP03=y
> CONFIG_ICP10100=y
> # CONFIG_MPL115_I2C is not set
> CONFIG_MPL3115=y
> CONFIG_MS5611=y
> # CONFIG_MS5611_I2C is not set
> CONFIG_MS5637=y
> CONFIG_IIO_ST_PRESS=y
> CONFIG_IIO_ST_PRESS_I2C=y
> # CONFIG_T5403 is not set
> # CONFIG_HP206C is not set
> # CONFIG_ZPA2326 is not set
> # end of Pressure sensors
>
> #
> # Lightning sensors
> #
> # end of Lightning sensors
>
> #
> # Proximity and distance sensors
> #
> # CONFIG_ISL29501 is not set
> # CONFIG_LIDAR_LITE_V2 is not set
> CONFIG_MB1232=y
> CONFIG_PING=y
> # CONFIG_RFD77402 is not set
> # CONFIG_SRF04 is not set
> CONFIG_SX_COMMON=y
> CONFIG_SX9310=y
> CONFIG_SX9324=y
> CONFIG_SX9360=y
> # CONFIG_SX9500 is not set
> CONFIG_SRF08=y
> # CONFIG_VCNL3020 is not set
> CONFIG_VL53L0X_I2C=y
> # end of Proximity and distance sensors
>
> #
> # Resolver to digital converters
> #
> # end of Resolver to digital converters
>
> #
> # Temperature sensors
> #
> CONFIG_IQS620AT_TEMP=y
> # CONFIG_MLX90614 is not set
> CONFIG_MLX90632=y
> CONFIG_TMP006=y
> CONFIG_TMP007=y
> CONFIG_TMP117=y
> CONFIG_TSYS01=y
> # CONFIG_TSYS02D is not set
> # end of Temperature sensors
>
> CONFIG_NTB=y
> CONFIG_NTB_MSI=y
> CONFIG_NTB_IDT=y
> CONFIG_NTB_SWITCHTEC=y
> # CONFIG_NTB_PINGPONG is not set
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> CONFIG_NTB_MSI_TEST=y
> # CONFIG_NTB_TRANSPORT is not set
> CONFIG_PWM=y
> CONFIG_PWM_SYSFS=y
> CONFIG_PWM_DEBUG=y
> CONFIG_PWM_BCM_IPROC=y
> CONFIG_PWM_BCM_KONA=y
> # CONFIG_PWM_BCM2835 is not set
> CONFIG_PWM_BERLIN=y
> CONFIG_PWM_BRCMSTB=y
> CONFIG_PWM_CLK=y
> CONFIG_PWM_CLPS711X=y
> CONFIG_PWM_DWC=y
> CONFIG_PWM_EP93XX=y
> CONFIG_PWM_HIBVT=y
> # CONFIG_PWM_IMG is not set
> CONFIG_PWM_IMX1=y
> CONFIG_PWM_IMX27=y
> # CONFIG_PWM_IMX_TPM is not set
> CONFIG_PWM_INTEL_LGM=y
> CONFIG_PWM_IQS620A=y
> # CONFIG_PWM_JZ4740 is not set
> CONFIG_PWM_KEEMBAY=y
> # CONFIG_PWM_LPC18XX_SCT is not set
> # CONFIG_PWM_LPC32XX is not set
> CONFIG_PWM_LPSS=y
> CONFIG_PWM_LPSS_PCI=y
> CONFIG_PWM_LPSS_PLATFORM=y
> CONFIG_PWM_MESON=y
> CONFIG_PWM_MTK_DISP=y
> # CONFIG_PWM_MEDIATEK is not set
> CONFIG_PWM_PCA9685=y
> CONFIG_PWM_PXA=y
> CONFIG_PWM_RASPBERRYPI_POE=y
> CONFIG_PWM_RCAR=y
> CONFIG_PWM_RENESAS_TPU=y
> # CONFIG_PWM_ROCKCHIP is not set
> CONFIG_PWM_SAMSUNG=y
> CONFIG_PWM_SL28CPLD=y
> CONFIG_PWM_SPRD=y
> CONFIG_PWM_STM32=y
> CONFIG_PWM_STM32_LP=y
> # CONFIG_PWM_SUN4I is not set
> CONFIG_PWM_TEGRA=y
> # CONFIG_PWM_TIECAP is not set
> CONFIG_PWM_TIEHRPWM=y
> CONFIG_PWM_VISCONTI=y
> CONFIG_PWM_VT8500=y
>
> #
> # IRQ chip support
> #
> # CONFIG_AL_FIC is not set
> CONFIG_MADERA_IRQ=y
> CONFIG_IRQ_MIPS_CPU=y
> CONFIG_RENESAS_INTC_IRQPIN=y
> CONFIG_RENESAS_IRQC=y
> CONFIG_RENESAS_RZA1_IRQC=y
> CONFIG_RENESAS_RZG2L_IRQC=y
> # CONFIG_SL28CPLD_INTC is not set
> # CONFIG_TS4800_IRQ is not set
> # CONFIG_INGENIC_TCU_IRQ is not set
> CONFIG_IRQ_UNIPHIER_AIDET=y
> # CONFIG_MESON_IRQ_GPIO is not set
> # CONFIG_GOLDFISH_PIC is not set
> CONFIG_IMX_IRQSTEER=y
> # CONFIG_IMX_INTMUX is not set
> # CONFIG_EXYNOS_IRQ_COMBINER is not set
> CONFIG_MST_IRQ=y
> CONFIG_MCHP_EIC=y
> CONFIG_SUNPLUS_SP7021_INTC=y
> # end of IRQ chip support
>
> CONFIG_IPACK_BUS=y
> CONFIG_BOARD_TPCI200=y
> CONFIG_SERIAL_IPOCTAL=y
> CONFIG_RESET_CONTROLLER=y
> # CONFIG_RESET_A10SR is not set
> # CONFIG_RESET_ATH79 is not set
> CONFIG_RESET_AXS10X=y
> CONFIG_RESET_BCM6345=y
> CONFIG_RESET_BERLIN=y
> # CONFIG_RESET_BRCMSTB is not set
> CONFIG_RESET_BRCMSTB_RESCAL=y
> CONFIG_RESET_HSDK=y
> CONFIG_RESET_IMX7=y
> CONFIG_RESET_LANTIQ=y
> CONFIG_RESET_LPC18XX=y
> # CONFIG_RESET_MCHP_SPARX5 is not set
> CONFIG_RESET_MESON=y
> CONFIG_RESET_MESON_AUDIO_ARB=y
> # CONFIG_RESET_NPCM is not set
> CONFIG_RESET_PISTACHIO=y
> # CONFIG_RESET_QCOM_AOSS is not set
> CONFIG_RESET_QCOM_PDC=y
> # CONFIG_RESET_RASPBERRYPI is not set
> # CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
> CONFIG_RESET_SCMI=y
> # CONFIG_RESET_SIMPLE is not set
> # CONFIG_RESET_SOCFPGA is not set
> # CONFIG_RESET_STARFIVE_JH7100 is not set
> # CONFIG_RESET_SUNPLUS is not set
> # CONFIG_RESET_SUNXI is not set
> CONFIG_RESET_TI_SCI=y
> # CONFIG_RESET_TI_SYSCON is not set
> CONFIG_RESET_TI_TPS380X=y
> # CONFIG_RESET_TN48M_CPLD is not set
> # CONFIG_RESET_ZYNQ is not set
> # CONFIG_COMMON_RESET_HI3660 is not set
> # CONFIG_COMMON_RESET_HI6220 is not set
>
> #
> # PHY Subsystem
> #
> CONFIG_GENERIC_PHY=y
> CONFIG_GENERIC_PHY_MIPI_DPHY=y
> # CONFIG_PHY_PISTACHIO_USB is not set
> CONFIG_USB_LGM_PHY=y
> CONFIG_PHY_CAN_TRANSCEIVER=y
> CONFIG_PHY_SUN4I_USB=y
> CONFIG_PHY_SUN6I_MIPI_DPHY=y
> # CONFIG_PHY_SUN9I_USB is not set
>
> #
> # PHY drivers for Broadcom platforms
> #
> CONFIG_PHY_BCM63XX_USBH=y
> CONFIG_BCM_KONA_USB2_PHY=y
> # end of PHY drivers for Broadcom platforms
>
> CONFIG_PHY_HI6220_USB=y
> CONFIG_PHY_HI3660_USB=y
> CONFIG_PHY_HI3670_USB=y
> # CONFIG_PHY_HI3670_PCIE is not set
> CONFIG_PHY_HISTB_COMBPHY=y
> CONFIG_PHY_HISI_INNO_USB2=y
> CONFIG_PHY_INGENIC_USB=y
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_PXA_USB is not set
> # CONFIG_PHY_MMP3_USB is not set
> CONFIG_PHY_MMP3_HSIC=y
> CONFIG_PHY_CPCAP_USB=y
> CONFIG_PHY_QCOM_USB_HS=y
> CONFIG_PHY_QCOM_USB_HSIC=y
> CONFIG_PHY_MT7621_PCI=y
> CONFIG_PHY_RALINK_USB=y
> CONFIG_PHY_RCAR_GEN3_USB3=y
> CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
> CONFIG_PHY_ROCKCHIP_PCIE=y
> CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y
> CONFIG_PHY_EXYNOS_MIPI_VIDEO=y
> CONFIG_PHY_SAMSUNG_USB2=y
> CONFIG_PHY_S5PV210_USB2=y
> CONFIG_PHY_ST_SPEAR1310_MIPHY=y
> # CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
> # CONFIG_PHY_STIH407_USB is not set
> CONFIG_PHY_STM32_USBPHYC=y
> CONFIG_PHY_TEGRA194_P2U=y
> CONFIG_PHY_DA8XX_USB=y
> # CONFIG_PHY_DM816X_USB is not set
> # CONFIG_PHY_AM654_SERDES is not set
> CONFIG_OMAP_CONTROL_PHY=y
> CONFIG_TI_PIPE3=y
> CONFIG_PHY_TUSB1210=y
> CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
> # CONFIG_PHY_INTEL_KEEMBAY_USB is not set
> CONFIG_PHY_INTEL_LGM_EMMC=y
> CONFIG_PHY_XILINX_ZYNQMP=y
> # end of PHY Subsystem
>
> # CONFIG_POWERCAP is not set
> CONFIG_MCB=y
> CONFIG_MCB_PCI=y
> CONFIG_MCB_LPC=y
> CONFIG_RAS=y
> # CONFIG_USB4 is not set
>
> #
> # Android
> #
> CONFIG_ANDROID_BINDER_IPC=y
> CONFIG_ANDROID_BINDERFS=y
> CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
> # CONFIG_ANDROID_BINDER_IPC_SELFTEST is not set
> # end of Android
>
> CONFIG_DAX=y
> # CONFIG_NVMEM is not set
>
> #
> # HW tracing support
> #
> CONFIG_STM=y
> CONFIG_STM_PROTO_BASIC=y
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=y
> # CONFIG_STM_SOURCE_CONSOLE is not set
> # CONFIG_STM_SOURCE_HEARTBEAT is not set
> CONFIG_STM_SOURCE_FTRACE=y
> CONFIG_INTEL_TH=y
> CONFIG_INTEL_TH_PCI=y
> CONFIG_INTEL_TH_GTH=y
> # CONFIG_INTEL_TH_STH is not set
> # CONFIG_INTEL_TH_MSU is not set
> CONFIG_INTEL_TH_PTI=y
> CONFIG_INTEL_TH_DEBUG=y
> # end of HW tracing support
>
> CONFIG_FPGA=y
> CONFIG_FPGA_MGR_SOCFPGA=y
> # CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
> # CONFIG_ALTERA_PR_IP_CORE is not set
> # CONFIG_FPGA_MGR_ALTERA_CVP is not set
> CONFIG_FPGA_MGR_ZYNQ_FPGA=y
> # CONFIG_FPGA_BRIDGE is not set
> # CONFIG_FPGA_DFL is not set
> CONFIG_FPGA_MGR_ZYNQMP_FPGA=y
> # CONFIG_FPGA_MGR_VERSAL_FPGA is not set
> CONFIG_TEE=y
> CONFIG_MULTIPLEXER=y
>
> #
> # Multiplexer drivers
> #
> # CONFIG_MUX_ADG792A is not set
> CONFIG_MUX_GPIO=y
> CONFIG_MUX_MMIO=y
> # end of Multiplexer drivers
>
> CONFIG_PM_OPP=y
> CONFIG_SIOX=y
> # CONFIG_SIOX_BUS_GPIO is not set
> CONFIG_SLIMBUS=y
> CONFIG_SLIM_QCOM_CTRL=y
> # CONFIG_INTERCONNECT is not set
> CONFIG_COUNTER=y
> # CONFIG_104_QUAD_8 is not set
> CONFIG_INTERRUPT_CNT=y
> # CONFIG_STM32_TIMER_CNT is not set
> CONFIG_STM32_LPTIMER_CNT=y
> # CONFIG_TI_EQEP is not set
> CONFIG_INTEL_QEP=y
> CONFIG_TI_ECAP_CAPTURE=y
> CONFIG_MOST=y
> # CONFIG_MOST_USB_HDM is not set
> CONFIG_MOST_CDEV=y
> CONFIG_MOST_SND=y
> CONFIG_PECI=y
> CONFIG_PECI_CPU=y
> CONFIG_HTE=y
> # end of Device Drivers
>
> #
> # File systems
> #
> CONFIG_VALIDATE_FS_PARSER=y
> CONFIG_FS_IOMAP=y
> # CONFIG_EXT2_FS is not set
> CONFIG_EXT3_FS=y
> CONFIG_EXT3_FS_POSIX_ACL=y
> # CONFIG_EXT3_FS_SECURITY is not set
> CONFIG_EXT4_FS=y
> CONFIG_EXT4_USE_FOR_EXT2=y
> CONFIG_EXT4_FS_POSIX_ACL=y
> CONFIG_EXT4_FS_SECURITY=y
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=y
> CONFIG_JBD2_DEBUG=y
> CONFIG_FS_MBCACHE=y
> CONFIG_REISERFS_FS=y
> # CONFIG_REISERFS_CHECK is not set
> # CONFIG_REISERFS_PROC_INFO is not set
> CONFIG_REISERFS_FS_XATTR=y
> CONFIG_REISERFS_FS_POSIX_ACL=y
> # CONFIG_REISERFS_FS_SECURITY is not set
> CONFIG_JFS_FS=y
> # CONFIG_JFS_POSIX_ACL is not set
> CONFIG_JFS_SECURITY=y
> # CONFIG_JFS_DEBUG is not set
> # CONFIG_JFS_STATISTICS is not set
> # CONFIG_XFS_FS is not set
> # CONFIG_GFS2_FS is not set
> # CONFIG_BTRFS_FS is not set
> CONFIG_NILFS2_FS=y
> CONFIG_F2FS_FS=y
> # CONFIG_F2FS_STAT_FS is not set
> CONFIG_F2FS_FS_XATTR=y
> CONFIG_F2FS_FS_POSIX_ACL=y
> # CONFIG_F2FS_FS_SECURITY is not set
> CONFIG_F2FS_CHECK_FS=y
> CONFIG_F2FS_FAULT_INJECTION=y
> # CONFIG_F2FS_FS_COMPRESSION is not set
> CONFIG_F2FS_IOSTAT=y
> # CONFIG_F2FS_UNFAIR_RWSEM is not set
> CONFIG_ZONEFS_FS=y
> CONFIG_FS_POSIX_ACL=y
> CONFIG_EXPORTFS=y
> CONFIG_EXPORTFS_BLOCK_OPS=y
> CONFIG_FILE_LOCKING=y
> CONFIG_FS_ENCRYPTION=y
> CONFIG_FS_ENCRYPTION_ALGS=y
> CONFIG_FS_VERITY=y
> # CONFIG_FS_VERITY_DEBUG is not set
> # CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
> CONFIG_FSNOTIFY=y
> # CONFIG_DNOTIFY is not set
> CONFIG_INOTIFY_USER=y
> # CONFIG_FANOTIFY is not set
> # CONFIG_QUOTA is not set
> # CONFIG_AUTOFS4_FS is not set
> CONFIG_AUTOFS_FS=y
> CONFIG_FUSE_FS=y
> CONFIG_CUSE=y
> CONFIG_VIRTIO_FS=y
> CONFIG_OVERLAY_FS=y
> CONFIG_OVERLAY_FS_REDIRECT_DIR=y
> CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
> CONFIG_OVERLAY_FS_INDEX=y
> CONFIG_OVERLAY_FS_METACOPY=y
>
> #
> # Caches
> #
> # CONFIG_FSCACHE is not set
> # end of Caches
>
> #
> # CD-ROM/DVD Filesystems
> #
> # CONFIG_ISO9660_FS is not set
> CONFIG_UDF_FS=y
> # end of CD-ROM/DVD Filesystems
>
> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> # CONFIG_MSDOS_FS is not set
> # CONFIG_VFAT_FS is not set
> CONFIG_EXFAT_FS=y
> CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
> CONFIG_NTFS_FS=y
> CONFIG_NTFS_DEBUG=y
> # CONFIG_NTFS3_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
>
> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=y
> CONFIG_PROC_KCORE=y
> CONFIG_PROC_VMCORE=y
> CONFIG_PROC_VMCORE_DEVICE_DUMP=y
> CONFIG_PROC_SYSCTL=y
> CONFIG_PROC_PAGE_MONITOR=y
> # CONFIG_PROC_CHILDREN is not set
> CONFIG_KERNFS=y
> CONFIG_SYSFS=y
> # CONFIG_TMPFS is not set
> CONFIG_CONFIGFS_FS=y
> # end of Pseudo filesystems
>
> CONFIG_MISC_FILESYSTEMS=y
> CONFIG_ORANGEFS_FS=y
> CONFIG_ADFS_FS=y
> CONFIG_ADFS_FS_RW=y
> CONFIG_AFFS_FS=y
> CONFIG_ECRYPT_FS=y
> # CONFIG_ECRYPT_FS_MESSAGING is not set
> CONFIG_HFS_FS=y
> CONFIG_HFSPLUS_FS=y
> CONFIG_BEFS_FS=y
> # CONFIG_BEFS_DEBUG is not set
> CONFIG_BFS_FS=y
> # CONFIG_EFS_FS is not set
> CONFIG_JFFS2_FS=y
> CONFIG_JFFS2_FS_DEBUG=0
> # CONFIG_JFFS2_FS_WRITEBUFFER is not set
> CONFIG_JFFS2_SUMMARY=y
> # CONFIG_JFFS2_FS_XATTR is not set
> # CONFIG_JFFS2_COMPRESSION_OPTIONS is not set
> CONFIG_JFFS2_ZLIB=y
> CONFIG_JFFS2_RTIME=y
> # CONFIG_UBIFS_FS is not set
> CONFIG_CRAMFS=y
> CONFIG_CRAMFS_BLOCKDEV=y
> # CONFIG_CRAMFS_MTD is not set
> # CONFIG_SQUASHFS is not set
> CONFIG_VXFS_FS=y
> CONFIG_MINIX_FS=y
> CONFIG_MINIX_FS_NATIVE_ENDIAN=y
> CONFIG_OMFS_FS=y
> CONFIG_HPFS_FS=y
> CONFIG_QNX4FS_FS=y
> # CONFIG_QNX6FS_FS is not set
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=y
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=y
> CONFIG_PSTORE_LZO_COMPRESS=y
> CONFIG_PSTORE_LZ4_COMPRESS=y
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> CONFIG_PSTORE_ZSTD_COMPRESS=y
> CONFIG_PSTORE_COMPRESS=y
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=y
> # CONFIG_PSTORE_LZO_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
> CONFIG_PSTORE_COMPRESS_DEFAULT="deflate"
> # CONFIG_PSTORE_CONSOLE is not set
> CONFIG_PSTORE_PMSG=y
> # CONFIG_PSTORE_RAM is not set
> CONFIG_PSTORE_ZONE=y
> CONFIG_PSTORE_BLK=y
> CONFIG_PSTORE_BLK_BLKDEV=""
> CONFIG_PSTORE_BLK_KMSG_SIZE=64
> CONFIG_PSTORE_BLK_MAX_REASON=2
> CONFIG_PSTORE_BLK_PMSG_SIZE=64
> CONFIG_SYSV_FS=y
> CONFIG_UFS_FS=y
> CONFIG_UFS_FS_WRITE=y
> CONFIG_UFS_DEBUG=y
> CONFIG_EROFS_FS=y
> CONFIG_EROFS_FS_DEBUG=y
> # CONFIG_EROFS_FS_XATTR is not set
> CONFIG_EROFS_FS_ZIP=y
> # CONFIG_EROFS_FS_ZIP_LZMA is not set
> CONFIG_NLS=y
> CONFIG_NLS_DEFAULT="iso8859-1"
> CONFIG_NLS_CODEPAGE_437=y
> CONFIG_NLS_CODEPAGE_737=y
> CONFIG_NLS_CODEPAGE_775=y
> CONFIG_NLS_CODEPAGE_850=y
> # CONFIG_NLS_CODEPAGE_852 is not set
> CONFIG_NLS_CODEPAGE_855=y
> # CONFIG_NLS_CODEPAGE_857 is not set
> CONFIG_NLS_CODEPAGE_860=y
> CONFIG_NLS_CODEPAGE_861=y
> CONFIG_NLS_CODEPAGE_862=y
> CONFIG_NLS_CODEPAGE_863=y
> CONFIG_NLS_CODEPAGE_864=y
> CONFIG_NLS_CODEPAGE_865=y
> CONFIG_NLS_CODEPAGE_866=y
> CONFIG_NLS_CODEPAGE_869=y
> CONFIG_NLS_CODEPAGE_936=y
> CONFIG_NLS_CODEPAGE_950=y
> CONFIG_NLS_CODEPAGE_932=y
> CONFIG_NLS_CODEPAGE_949=y
> CONFIG_NLS_CODEPAGE_874=y
> CONFIG_NLS_ISO8859_8=y
> CONFIG_NLS_CODEPAGE_1250=y
> CONFIG_NLS_CODEPAGE_1251=y
> CONFIG_NLS_ASCII=y
> # CONFIG_NLS_ISO8859_1 is not set
> CONFIG_NLS_ISO8859_2=y
> CONFIG_NLS_ISO8859_3=y
> CONFIG_NLS_ISO8859_4=y
> CONFIG_NLS_ISO8859_5=y
> CONFIG_NLS_ISO8859_6=y
> CONFIG_NLS_ISO8859_7=y
> CONFIG_NLS_ISO8859_9=y
> # CONFIG_NLS_ISO8859_13 is not set
> # CONFIG_NLS_ISO8859_14 is not set
> CONFIG_NLS_ISO8859_15=y
> # CONFIG_NLS_KOI8_R is not set
> # CONFIG_NLS_KOI8_U is not set
> # CONFIG_NLS_MAC_ROMAN is not set
> # CONFIG_NLS_MAC_CELTIC is not set
> CONFIG_NLS_MAC_CENTEURO=y
> CONFIG_NLS_MAC_CROATIAN=y
> CONFIG_NLS_MAC_CYRILLIC=y
> CONFIG_NLS_MAC_GAELIC=y
> CONFIG_NLS_MAC_GREEK=y
> CONFIG_NLS_MAC_ICELAND=y
> CONFIG_NLS_MAC_INUIT=y
> CONFIG_NLS_MAC_ROMANIAN=y
> CONFIG_NLS_MAC_TURKISH=y
> CONFIG_NLS_UTF8=y
> CONFIG_UNICODE=y
> CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
> CONFIG_IO_WQ=y
> # end of File systems
>
> #
> # Security options
> #
> CONFIG_KEYS=y
> CONFIG_KEYS_REQUEST_CACHE=y
> # CONFIG_PERSISTENT_KEYRINGS is not set
> CONFIG_TRUSTED_KEYS=y
> CONFIG_TRUSTED_KEYS_TPM=y
> # CONFIG_TRUSTED_KEYS_TEE is not set
> CONFIG_ENCRYPTED_KEYS=y
> CONFIG_USER_DECRYPTED_DATA=y
> CONFIG_KEY_DH_OPERATIONS=y
> # CONFIG_KEY_NOTIFICATIONS is not set
> CONFIG_SECURITY_DMESG_RESTRICT=y
> CONFIG_SECURITY=y
> CONFIG_SECURITYFS=y
> # CONFIG_SECURITY_NETWORK is not set
> # CONFIG_SECURITY_PATH is not set
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
> # CONFIG_HARDENED_USERCOPY is not set
> # CONFIG_FORTIFY_SOURCE is not set
> CONFIG_STATIC_USERMODEHELPER=y
> CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
> CONFIG_SECURITY_LOADPIN=y
> CONFIG_SECURITY_LOADPIN_ENFORCE=y
> CONFIG_SECURITY_LOADPIN_VERITY=y
> CONFIG_SECURITY_YAMA=y
> # CONFIG_SECURITY_SAFESETID is not set
> CONFIG_SECURITY_LOCKDOWN_LSM=y
> CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
> # CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE is not set
> # CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
> CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY=y
> # CONFIG_SECURITY_LANDLOCK is not set
> # CONFIG_INTEGRITY is not set
> CONFIG_DEFAULT_SECURITY_DAC=y
> CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"
>
> #
> # Kernel hardening options
> #
>
> #
> # Memory initialization
> #
> CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
> CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
> CONFIG_INIT_STACK_NONE=y
> # CONFIG_INIT_STACK_ALL_PATTERN is not set
> # CONFIG_INIT_STACK_ALL_ZERO is not set
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
>
> CONFIG_CC_HAS_RANDSTRUCT=y
> CONFIG_RANDSTRUCT_NONE=y
> # CONFIG_RANDSTRUCT_FULL is not set
> # end of Kernel hardening options
> # end of Security options
>
> CONFIG_CRYPTO=y
>
> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=y
> CONFIG_CRYPTO_ALGAPI2=y
> CONFIG_CRYPTO_AEAD=y
> CONFIG_CRYPTO_AEAD2=y
> CONFIG_CRYPTO_SKCIPHER=y
> CONFIG_CRYPTO_SKCIPHER2=y
> CONFIG_CRYPTO_HASH=y
> CONFIG_CRYPTO_HASH2=y
> CONFIG_CRYPTO_RNG=y
> CONFIG_CRYPTO_RNG2=y
> CONFIG_CRYPTO_RNG_DEFAULT=y
> CONFIG_CRYPTO_AKCIPHER2=y
> CONFIG_CRYPTO_AKCIPHER=y
> CONFIG_CRYPTO_KPP2=y
> CONFIG_CRYPTO_KPP=y
> CONFIG_CRYPTO_ACOMP2=y
> CONFIG_CRYPTO_MANAGER=y
> CONFIG_CRYPTO_MANAGER2=y
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
> CONFIG_CRYPTO_GF128MUL=y
> CONFIG_CRYPTO_NULL=y
> CONFIG_CRYPTO_NULL2=y
> CONFIG_CRYPTO_CRYPTD=y
> CONFIG_CRYPTO_AUTHENC=y
> # end of Crypto core or helper
>
> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=y
> CONFIG_CRYPTO_DH=y
> # CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
> CONFIG_CRYPTO_ECC=y
> CONFIG_CRYPTO_ECDH=y
> # CONFIG_CRYPTO_ECDSA is not set
> CONFIG_CRYPTO_ECRDSA=y
> # CONFIG_CRYPTO_SM2 is not set
> CONFIG_CRYPTO_CURVE25519=y
> # end of Public-key cryptography
>
> #
> # Block ciphers
> #
> CONFIG_CRYPTO_AES=y
> CONFIG_CRYPTO_AES_TI=y
> CONFIG_CRYPTO_ARIA=y
> CONFIG_CRYPTO_BLOWFISH=y
> CONFIG_CRYPTO_BLOWFISH_COMMON=y
> CONFIG_CRYPTO_CAMELLIA=y
> CONFIG_CRYPTO_CAST_COMMON=y
> CONFIG_CRYPTO_CAST5=y
> CONFIG_CRYPTO_CAST6=y
> # CONFIG_CRYPTO_DES is not set
> # CONFIG_CRYPTO_FCRYPT is not set
> CONFIG_CRYPTO_SERPENT=y
> # CONFIG_CRYPTO_SM4_GENERIC is not set
> CONFIG_CRYPTO_TWOFISH=y
> CONFIG_CRYPTO_TWOFISH_COMMON=y
> # end of Block ciphers
>
> #
> # Length-preserving ciphers and modes
> #
> CONFIG_CRYPTO_ADIANTUM=y
> CONFIG_CRYPTO_CHACHA20=y
> CONFIG_CRYPTO_CBC=y
> CONFIG_CRYPTO_CFB=y
> CONFIG_CRYPTO_CTR=y
> CONFIG_CRYPTO_CTS=y
> CONFIG_CRYPTO_ECB=y
> # CONFIG_CRYPTO_HCTR2 is not set
> # CONFIG_CRYPTO_KEYWRAP is not set
> CONFIG_CRYPTO_LRW=y
> CONFIG_CRYPTO_OFB=y
> CONFIG_CRYPTO_PCBC=y
> CONFIG_CRYPTO_XTS=y
> CONFIG_CRYPTO_NHPOLY1305=y
> # end of Length-preserving ciphers and modes
>
> #
> # AEAD (authenticated encryption with associated data) ciphers
> #
> CONFIG_CRYPTO_AEGIS128=y
> CONFIG_CRYPTO_CHACHA20POLY1305=y
> # CONFIG_CRYPTO_CCM is not set
> CONFIG_CRYPTO_GCM=y
> CONFIG_CRYPTO_SEQIV=y
> CONFIG_CRYPTO_ECHAINIV=y
> CONFIG_CRYPTO_ESSIV=y
> # end of AEAD (authenticated encryption with associated data) ciphers
>
> #
> # Hashes, digests, and MACs
> #
> CONFIG_CRYPTO_BLAKE2B=y
> CONFIG_CRYPTO_CMAC=y
> CONFIG_CRYPTO_GHASH=y
> CONFIG_CRYPTO_HMAC=y
> # CONFIG_CRYPTO_MD4 is not set
> CONFIG_CRYPTO_MD5=y
> # CONFIG_CRYPTO_MICHAEL_MIC is not set
> CONFIG_CRYPTO_POLY1305=y
> CONFIG_CRYPTO_RMD160=y
> CONFIG_CRYPTO_SHA1=y
> CONFIG_CRYPTO_SHA256=y
> CONFIG_CRYPTO_SHA512=y
> # CONFIG_CRYPTO_SHA3 is not set
> CONFIG_CRYPTO_SM3=y
> CONFIG_CRYPTO_SM3_GENERIC=y
> CONFIG_CRYPTO_STREEBOG=y
> CONFIG_CRYPTO_VMAC=y
> CONFIG_CRYPTO_WP512=y
> CONFIG_CRYPTO_XCBC=y
> # CONFIG_CRYPTO_XXHASH is not set
> # end of Hashes, digests, and MACs
>
> #
> # CRCs (cyclic redundancy checks)
> #
> CONFIG_CRYPTO_CRC32C=y
> CONFIG_CRYPTO_CRC32=y
> CONFIG_CRYPTO_CRCT10DIF=y
> CONFIG_CRYPTO_CRC64_ROCKSOFT=y
> # end of CRCs (cyclic redundancy checks)
>
> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=y
> CONFIG_CRYPTO_LZO=y
> CONFIG_CRYPTO_842=y
> CONFIG_CRYPTO_LZ4=y
> # CONFIG_CRYPTO_LZ4HC is not set
> CONFIG_CRYPTO_ZSTD=y
> # end of Compression
>
> #
> # Random number generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=y
> CONFIG_CRYPTO_DRBG_MENU=y
> CONFIG_CRYPTO_DRBG_HMAC=y
> # CONFIG_CRYPTO_DRBG_HASH is not set
> CONFIG_CRYPTO_DRBG_CTR=y
> CONFIG_CRYPTO_DRBG=y
> CONFIG_CRYPTO_JITTERENTROPY=y
> CONFIG_CRYPTO_KDF800108_CTR=y
> # end of Random number generation
>
> #
> # Userspace interface
> #
> # end of Userspace interface
>
> CONFIG_CRYPTO_HASH_INFO=y
>
> #
> # Accelerated Cryptographic Algorithms for CPU (mips)
> #
> CONFIG_CRYPTO_POLY1305_MIPS=y
> # end of Accelerated Cryptographic Algorithms for CPU (mips)
>
> # CONFIG_CRYPTO_HW is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=y
> # CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE is not set
>
> #
> # Certificates for signature checking
> #
> CONFIG_SYSTEM_BLACKLIST_KEYRING=y
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
> # end of Certificates for signature checking
>
> CONFIG_BINARY_PRINTF=y
>
> #
> # Library routines
> #
> CONFIG_LINEAR_RANGES=y
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=y
> CONFIG_ARCH_HAS_STRNCPY_FROM_USER=y
> CONFIG_ARCH_HAS_STRNLEN_USER=y
> CONFIG_GENERIC_NET_UTILS=y
> # CONFIG_CORDIC is not set
> CONFIG_PRIME_NUMBERS=y
> CONFIG_RATIONAL=y
> CONFIG_NO_GENERIC_PCI_IOPORT_MAP=y
> CONFIG_GENERIC_PCI_IOMAP=y
> CONFIG_GENERIC_IOMAP=y
> CONFIG_STMP_DEVICE=y
>
> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_UTILS=y
> CONFIG_CRYPTO_LIB_AES=y
> CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
> CONFIG_CRYPTO_LIB_CHACHA=y
> CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
> CONFIG_CRYPTO_LIB_CURVE25519=y
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=2
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=y
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
> CONFIG_CRYPTO_LIB_POLY1305=y
> CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
> CONFIG_CRYPTO_LIB_SHA1=y
> CONFIG_CRYPTO_LIB_SHA256=y
> # end of Crypto library routines
>
> CONFIG_CRC_CCITT=y
> CONFIG_CRC16=y
> CONFIG_CRC_T10DIF=y
> CONFIG_CRC64_ROCKSOFT=y
> CONFIG_CRC_ITU_T=y
> CONFIG_CRC32=y
> # CONFIG_CRC32_SELFTEST is not set
> # CONFIG_CRC32_SLICEBY8 is not set
> # CONFIG_CRC32_SLICEBY4 is not set
> CONFIG_CRC32_SARWATE=y
> # CONFIG_CRC32_BIT is not set
> CONFIG_CRC64=y
> CONFIG_CRC4=y
> CONFIG_CRC7=y
> CONFIG_LIBCRC32C=y
> CONFIG_CRC8=y
> CONFIG_XXHASH=y
> CONFIG_RANDOM32_SELFTEST=y
> CONFIG_842_COMPRESS=y
> CONFIG_842_DECOMPRESS=y
> CONFIG_ZLIB_INFLATE=y
> CONFIG_ZLIB_DEFLATE=y
> CONFIG_LZO_COMPRESS=y
> CONFIG_LZO_DECOMPRESS=y
> CONFIG_LZ4_COMPRESS=y
> CONFIG_LZ4_DECOMPRESS=y
> CONFIG_ZSTD_COMMON=y
> CONFIG_ZSTD_COMPRESS=y
> CONFIG_ZSTD_DECOMPRESS=y
> CONFIG_XZ_DEC=y
> CONFIG_XZ_DEC_X86=y
> CONFIG_XZ_DEC_POWERPC=y
> CONFIG_XZ_DEC_IA64=y
> CONFIG_XZ_DEC_ARM=y
> CONFIG_XZ_DEC_ARMTHUMB=y
> CONFIG_XZ_DEC_SPARC=y
> # CONFIG_XZ_DEC_MICROLZMA is not set
> CONFIG_XZ_DEC_BCJ=y
> CONFIG_XZ_DEC_TEST=y
> CONFIG_GENERIC_ALLOCATOR=y
> CONFIG_REED_SOLOMON=y
> CONFIG_REED_SOLOMON_DEC8=y
> CONFIG_REED_SOLOMON_ENC16=y
> CONFIG_REED_SOLOMON_DEC16=y
> CONFIG_BCH=y
> CONFIG_INTERVAL_TREE=y
> CONFIG_XARRAY_MULTI=y
> CONFIG_ASSOCIATIVE_ARRAY=y
> CONFIG_HAS_IOMEM=y
> CONFIG_HAS_IOPORT_MAP=y
> CONFIG_HAS_DMA=y
> CONFIG_NEED_DMA_MAP_STATE=y
> CONFIG_ARCH_HAS_DMA_WRITE_COMBINE=y
> CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
> CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
> CONFIG_DMA_NONCOHERENT_MMAP=y
> CONFIG_DMA_CMA=y
> CONFIG_DMA_PERNUMA_CMA=y
>
> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=16
> CONFIG_CMA_SIZE_PERCENTAGE=10
> # CONFIG_CMA_SIZE_SEL_MBYTES is not set
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> CONFIG_CMA_SIZE_SEL_MIN=y
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=8
> CONFIG_DMA_API_DEBUG=y
> CONFIG_DMA_API_DEBUG_SG=y
> CONFIG_DMA_MAP_BENCHMARK=y
> CONFIG_SGL_ALLOC=y
> CONFIG_GLOB=y
> CONFIG_GLOB_SELFTEST=y
> CONFIG_GENERIC_ATOMIC64=y
> CONFIG_CLZ_TAB=y
> # CONFIG_IRQ_POLL is not set
> CONFIG_MPILIB=y
> CONFIG_OID_REGISTRY=y
> CONFIG_HAVE_GENERIC_VDSO=y
> CONFIG_GENERIC_GETTIMEOFDAY=y
> CONFIG_FONT_SUPPORT=y
> CONFIG_FONTS=y
> # CONFIG_FONT_8x8 is not set
> CONFIG_FONT_8x16=y
> # CONFIG_FONT_6x11 is not set
> CONFIG_FONT_7x14=y
> CONFIG_FONT_PEARL_8x8=y
> # CONFIG_FONT_ACORN_8x8 is not set
> CONFIG_FONT_MINI_4x6=y
> # CONFIG_FONT_6x10 is not set
> # CONFIG_FONT_10x18 is not set
> # CONFIG_FONT_SUN8x16 is not set
> # CONFIG_FONT_SUN12x22 is not set
> # CONFIG_FONT_TER16x32 is not set
> # CONFIG_FONT_6x8 is not set
> CONFIG_SG_POOL=y
> CONFIG_STACKDEPOT=y
> CONFIG_REF_TRACKER=y
> CONFIG_SBITMAP=y
> # CONFIG_PARMAN is not set
> # CONFIG_OBJAGG is not set
> # end of Library routines
>
> CONFIG_GENERIC_LIB_ASHLDI3=y
> CONFIG_GENERIC_LIB_ASHRDI3=y
> CONFIG_GENERIC_LIB_LSHRDI3=y
> CONFIG_GENERIC_LIB_CMPDI2=y
> CONFIG_GENERIC_LIB_UCMPDI2=y
> CONFIG_ASN1_ENCODER=y
> CONFIG_POLYNOMIAL=y
>
> #
> # Kernel hacking
> #
>
> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=y
> # CONFIG_PRINTK_CALLER is not set
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
> # CONFIG_BOOT_PRINTK_DELAY is not set
> # CONFIG_DYNAMIC_DEBUG is not set
> CONFIG_DYNAMIC_DEBUG_CORE=y
> # CONFIG_SYMBOLIC_ERRNAME is not set
> # end of printk and dmesg options
>
> CONFIG_DEBUG_KERNEL=y
> # CONFIG_DEBUG_MISC is not set
>
> #
> # Compile-time checks and compiler options
> #
> CONFIG_AS_HAS_NON_CONST_LEB128=y
> CONFIG_DEBUG_INFO_NONE=y
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> # CONFIG_DEBUG_INFO_DWARF4 is not set
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_FRAME_WARN=1024
> CONFIG_STRIP_ASM_SYMS=y
> CONFIG_HEADERS_INSTALL=y
> CONFIG_SECTION_MISMATCH_WARN_ONLY=y
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
>
> #
> # Generic Kernel Debugging Instruments
> #
> # CONFIG_MAGIC_SYSRQ is not set
> CONFIG_DEBUG_FS=y
> # CONFIG_DEBUG_FS_ALLOW_ALL is not set
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> CONFIG_DEBUG_FS_ALLOW_NONE=y
> CONFIG_HAVE_ARCH_KGDB=y
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
> # CONFIG_UBSAN is not set
> # end of Generic Kernel Debugging Instruments
>
> #
> # Networking Debugging
> #
> # end of Networking Debugging
>
> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_DEBUG_PAGEALLOC is not set
> CONFIG_SLUB_DEBUG=y
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_PAGE_OWNER is not set
> CONFIG_PAGE_POISONING=y
> CONFIG_DEBUG_PAGE_REF=y
> # CONFIG_DEBUG_OBJECTS is not set
> CONFIG_SHRINKER_DEBUG=y
> CONFIG_HAVE_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK=y
> CONFIG_DEBUG_KMEMLEAK_MEM_POOL_SIZE=16000
> CONFIG_DEBUG_KMEMLEAK_DEFAULT_OFF=y
> # CONFIG_DEBUG_KMEMLEAK_AUTO_SCAN is not set
> CONFIG_DEBUG_STACK_USAGE=y
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_DEBUG_VM_IRQSOFF=y
> CONFIG_DEBUG_VM=y
> CONFIG_DEBUG_VM_MAPLE_TREE=y
> # CONFIG_DEBUG_VM_RB is not set
> CONFIG_DEBUG_VM_PGFLAGS=y
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
> CONFIG_DEBUG_VIRTUAL=y
> CONFIG_DEBUG_MEMORY_INIT=y
> CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
> # CONFIG_DEBUG_STACKOVERFLOW is not set
> CONFIG_CC_HAS_KASAN_GENERIC=y
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
> # end of Memory Debugging
>
> CONFIG_DEBUG_SHIRQ=y
>
> #
> # Debug Oops, Lockups and Hangs
> #
> # CONFIG_PANIC_ON_OOPS is not set
> CONFIG_PANIC_ON_OOPS_VALUE=0
> CONFIG_PANIC_TIMEOUT=0
> CONFIG_LOCKUP_DETECTOR=y
> CONFIG_SOFTLOCKUP_DETECTOR=y
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
> CONFIG_DETECT_HUNG_TASK=y
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
> CONFIG_WQ_WATCHDOG=y
> # end of Debug Oops, Lockups and Hangs
>
> #
> # Scheduler Debugging
> #
> # CONFIG_SCHED_DEBUG is not set
> CONFIG_SCHED_INFO=y
> CONFIG_SCHEDSTATS=y
> # end of Scheduler Debugging
>
> # CONFIG_DEBUG_TIMEKEEPING is not set
>
> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=y
> CONFIG_PROVE_LOCKING=y
> CONFIG_PROVE_RAW_LOCK_NESTING=y
> CONFIG_LOCK_STAT=y
> CONFIG_DEBUG_RT_MUTEXES=y
> CONFIG_DEBUG_SPINLOCK=y
> CONFIG_DEBUG_MUTEXES=y
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
> CONFIG_DEBUG_RWSEMS=y
> CONFIG_DEBUG_LOCK_ALLOC=y
> CONFIG_LOCKDEP=y
> CONFIG_LOCKDEP_BITS=15
> CONFIG_LOCKDEP_CHAINS_BITS=16
> CONFIG_LOCKDEP_STACK_TRACE_BITS=19
> CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
> CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
> # CONFIG_DEBUG_LOCKDEP is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=y
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=y
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
>
> CONFIG_TRACE_IRQFLAGS=y
> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=y
> CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
> # CONFIG_DEBUG_KOBJECT is not set
>
> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=y
> CONFIG_DEBUG_PLIST=y
> CONFIG_DEBUG_SG=y
> # CONFIG_DEBUG_NOTIFIERS is not set
> # CONFIG_BUG_ON_DATA_CORRUPTION is not set
> CONFIG_DEBUG_MAPLE_TREE=y
> # end of Debug kernel data structures
>
> CONFIG_DEBUG_CREDENTIALS=y
>
> #
> # RCU Debugging
> #
> CONFIG_PROVE_RCU=y
> CONFIG_PROVE_RCU_LIST=y
> CONFIG_TORTURE_TEST=y
> # CONFIG_RCU_SCALE_TEST is not set
> CONFIG_RCU_TORTURE_TEST=y
> CONFIG_RCU_REF_SCALE_TEST=y
> CONFIG_RCU_TRACE=y
> CONFIG_RCU_EQS_DEBUG=y
> # end of RCU Debugging
>
> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> CONFIG_LATENCYTOP=y
> CONFIG_NOP_TRACER=y
> CONFIG_HAVE_FUNCTION_TRACER=y
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
> CONFIG_HAVE_DYNAMIC_FTRACE=y
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> CONFIG_HAVE_C_RECORDMCOUNT=y
> CONFIG_TRACE_CLOCK=y
> CONFIG_RING_BUFFER=y
> CONFIG_EVENT_TRACING=y
> CONFIG_CONTEXT_SWITCH_TRACER=y
> CONFIG_PREEMPTIRQ_TRACEPOINTS=y
> CONFIG_TRACING=y
> CONFIG_TRACING_SUPPORT=y
> # CONFIG_FTRACE is not set
> # CONFIG_SAMPLES is not set
>
> #
> # mips Debugging
> #
> CONFIG_EARLY_PRINTK=y
> CONFIG_EARLY_PRINTK_8250=y
> CONFIG_USE_GENERIC_EARLY_PRINTK_8250=y
> # CONFIG_CMDLINE_BOOL is not set
> # CONFIG_DEBUG_ZBOOT is not set
> CONFIG_SPINLOCK_TEST=y
> # CONFIG_SCACHE_DEBUGFS is not set
> # end of mips Debugging
>
> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FAULT_INJECTION=y
> # CONFIG_FAILSLAB is not set
> CONFIG_FAIL_PAGE_ALLOC=y
> CONFIG_FAULT_INJECTION_USERCOPY=y
> CONFIG_FAIL_MAKE_REQUEST=y
> # CONFIG_FAIL_IO_TIMEOUT is not set
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=y
> # CONFIG_FAIL_MMC_REQUEST is not set
> CONFIG_FAULT_INJECTION_STACKTRACE_FILTER=y
> CONFIG_ARCH_HAS_KCOV=y
> CONFIG_CC_HAS_SANCOV_TRACE_PC=y
> CONFIG_KCOV=y
> CONFIG_KCOV_ENABLE_COMPARISONS=y
> # CONFIG_KCOV_INSTRUMENT_ALL is not set
> CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
> CONFIG_RUNTIME_TESTING_MENU=y
> # CONFIG_LKDTM is not set
> CONFIG_TEST_MIN_HEAP=y
> CONFIG_TEST_DIV64=y
> CONFIG_BACKTRACE_SELF_TEST=y
> CONFIG_TEST_REF_TRACKER=y
> CONFIG_RBTREE_TEST=y
> CONFIG_REED_SOLOMON_TEST=y
> CONFIG_INTERVAL_TREE_TEST=y
> CONFIG_ATOMIC64_SELFTEST=y
> CONFIG_TEST_HEXDUMP=y
> CONFIG_STRING_SELFTEST=y
> CONFIG_TEST_STRING_HELPERS=y
> # CONFIG_TEST_STRSCPY is not set
> CONFIG_TEST_KSTRTOX=y
> CONFIG_TEST_PRINTF=y
> CONFIG_TEST_SCANF=y
> # CONFIG_TEST_BITMAP is not set
> CONFIG_TEST_UUID=y
> CONFIG_TEST_XARRAY=y
> CONFIG_TEST_RHASHTABLE=y
> # CONFIG_TEST_SIPHASH is not set
> CONFIG_TEST_IDA=y
> CONFIG_FIND_BIT_BENCHMARK=y
> CONFIG_TEST_FIRMWARE=y
> CONFIG_TEST_SYSCTL=y
> CONFIG_TEST_UDELAY=y
> CONFIG_TEST_DEBUG_VIRTUAL=y
> CONFIG_TEST_MEMCAT_P=y
> # CONFIG_TEST_MEMINIT is not set
> CONFIG_TEST_FREE_PAGES=y
> CONFIG_ARCH_USE_MEMTEST=y
> CONFIG_MEMTEST=y
> # end of Kernel Testing and Coverage
>
> #
> # Rust hacking
> #
> # end of Rust hacking
>
> # CONFIG_WARN_MISSING_DOCUMENTS is not set
> CONFIG_WARN_ABI_ERRORS=y
> # end of Kernel hacking
