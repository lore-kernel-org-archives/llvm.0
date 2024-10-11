Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43901BCA0A;
	Fri, 11 Oct 2024 23:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728688787; cv=none; b=FG5r5EJsr1s9M+u29pp8M4BQkDRm1oFSsz5tVVecfJE/qSZDxJ0eoe1Mt5bobT46+6wGh3+W6UM8Jizvdq//UcS4+XxSL8ASzytwfykkDdcHdHusJEHLSSH2eNI6lLxOBHkYz7RwCDxG7dXujtbXQujLOhPUKb4pRhnVX56U+S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728688787; c=relaxed/simple;
	bh=8F1CZb3fW3aD8IzOsoYuFxS7Fr/l4FrYrY5MrkJGFPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TMaWWQFbvQfaCFp0qmbKFHQmSQSP3eD1m3Ryf0fHjtDfisiPe8GInucUQWGi1cmH0saZ/Mr5LNsGKK//1Jin2iqAte5FXyLnB0MmmblBFu2Hqq2aYKdxfaaugRLEKoqV7eHDIdiYtlf8sWlE1iASSWGe9eLOIjJSIlgpVb2Hz6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kXJ0Lk59; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kXJ0Lk59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728688785; x=1760224785;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8F1CZb3fW3aD8IzOsoYuFxS7Fr/l4FrYrY5MrkJGFPQ=;
  b=kXJ0Lk59X5XwSon9lx6r39l4fFWWkuWCoF2ue5yEfr1LQHpC99mGrr+X
   kr4daz5nsX6VSU+Mbv4RlCcEdj24dMaT4FcjI0o9KQtwX0Vzs5gCsvX4/
   pf57vJ3WG0a2PUFf1Spk73y9JBsbIgnBfwLOjSrTqwWAtTAh6f0rwmEXL
   E+52dd7ioRlX8MPQ0rYa2ntFeApYyPTcF3NjR+8Vzl6RvLhFTympw+hLm
   yxLXJ+2E8ziDnLJq71yKmrYssjzEKglm/ZeGv6ZmI0L1LNpg/7GumVa4h
   KcQt0IW5HXIoqwoH3S3RD+7uLzpAebFNmSEB6ZXK7P38kklkf7i0JiQMR
   w==;
X-CSE-ConnectionGUID: 4igg7KmaQQSFH8IfCsUmdA==
X-CSE-MsgGUID: 61FiIOOoQtC3aGkR7CujUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39480659"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="39480659"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 16:19:44 -0700
X-CSE-ConnectionGUID: skyCOb1OT5ymRkah/fggIA==
X-CSE-MsgGUID: 1Xc5T7/tQYKe5o2Jp6yCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="77043560"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 Oct 2024 16:19:42 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szOv6-000CqG-2R;
	Fri, 11 Oct 2024 23:19:40 +0000
Date: Sat, 12 Oct 2024 07:19:23 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [linux-next:master 3814/4143] arch/um/kernel/um_arch.c:336:16:
 warning: result of comparison of constant 4294967296 with expression of type
 'typeof (task_size)' (aka 'unsigned long') is always false
Message-ID: <202410120738.fFMnOYWI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 830003c73d190259e45d0a99a0e3d14cb73e0af0 [3814/4143] um: Limit TASK_SIZE to the addressable range
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241012/202410120738.fFMnOYWI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120738.fFMnOYWI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120738.fFMnOYWI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/um/kernel/um_arch.c:19:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> arch/um/kernel/um_arch.c:336:16: warning: result of comparison of constant 4294967296 with expression of type 'typeof (task_size)' (aka 'unsigned long') is always false [-Wtautological-constant-out-of-range-compare]
     336 |         if (task_size > (unsigned long long) PTRS_PER_PGD * PGDIR_SIZE)
         |             ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings generated.


vim +336 arch/um/kernel/um_arch.c

   304	
   305	int __init linux_main(int argc, char **argv)
   306	{
   307		unsigned long avail, diff;
   308		unsigned long virtmem_size, max_physmem;
   309		unsigned long stack;
   310		unsigned int i;
   311		int add;
   312	
   313		for (i = 1; i < argc; i++) {
   314			if ((i == 1) && (argv[i][0] == ' '))
   315				continue;
   316			add = 1;
   317			uml_checksetup(argv[i], &add);
   318			if (add)
   319				add_arg(argv[i]);
   320		}
   321		if (have_root == 0)
   322			add_arg(DEFAULT_COMMAND_LINE_ROOT);
   323	
   324		if (have_console == 0)
   325			add_arg(DEFAULT_COMMAND_LINE_CONSOLE);
   326	
   327		host_task_size = os_get_top_address();
   328		/* reserve a few pages for the stubs */
   329		stub_start = host_task_size - STUB_DATA_PAGES * PAGE_SIZE;
   330		/* another page for the code portion */
   331		stub_start -= PAGE_SIZE;
   332		host_task_size = stub_start;
   333	
   334		/* Limit TASK_SIZE to what is addressable by the page table */
   335		task_size = host_task_size;
 > 336		if (task_size > (unsigned long long) PTRS_PER_PGD * PGDIR_SIZE)
   337			task_size = PTRS_PER_PGD * PGDIR_SIZE;
   338	
   339		/*
   340		 * TASK_SIZE needs to be PGDIR_SIZE aligned or else exit_mmap craps
   341		 * out
   342		 */
   343		task_size = task_size & PGDIR_MASK;
   344	
   345		/* OS sanity checks that need to happen before the kernel runs */
   346		os_early_checks();
   347	
   348		get_host_cpu_features(parse_host_cpu_flags, parse_cache_line);
   349	
   350		brk_start = (unsigned long) sbrk(0);
   351	
   352		/*
   353		 * Increase physical memory size for exec-shield users
   354		 * so they actually get what they asked for. This should
   355		 * add zero for non-exec shield users
   356		 */
   357	
   358		diff = UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
   359		if (diff > 1024 * 1024) {
   360			os_info("Adding %ld bytes to physical memory to account for "
   361				"exec-shield gap\n", diff);
   362			physmem_size += UML_ROUND_UP(brk_start) - UML_ROUND_UP(&_end);
   363		}
   364	
   365		uml_physmem = (unsigned long) __binary_start & PAGE_MASK;
   366	
   367		/* Reserve up to 4M after the current brk */
   368		uml_reserved = ROUND_4M(brk_start) + (1 << 22);
   369	
   370		setup_machinename(init_utsname()->machine);
   371	
   372		physmem_size = (physmem_size + PAGE_SIZE - 1) & PAGE_MASK;
   373		iomem_size = (iomem_size + PAGE_SIZE - 1) & PAGE_MASK;
   374	
   375		max_physmem = TASK_SIZE - uml_physmem - iomem_size - MIN_VMALLOC;
   376	
   377		if (physmem_size + iomem_size > max_physmem) {
   378			physmem_size = max_physmem - iomem_size;
   379			os_info("Physical memory size shrunk to %llu bytes\n",
   380				physmem_size);
   381		}
   382	
   383		high_physmem = uml_physmem + physmem_size;
   384		end_iomem = high_physmem + iomem_size;
   385		high_memory = (void *) end_iomem;
   386	
   387		start_vm = VMALLOC_START;
   388	
   389		virtmem_size = physmem_size;
   390		stack = (unsigned long) argv;
   391		stack &= ~(1024 * 1024 - 1);
   392		avail = stack - start_vm;
   393		if (physmem_size > avail)
   394			virtmem_size = avail;
   395		end_vm = start_vm + virtmem_size;
   396	
   397		if (virtmem_size < physmem_size)
   398			os_info("Kernel virtual memory size shrunk to %lu bytes\n",
   399				virtmem_size);
   400	
   401		os_flush_stdout();
   402	
   403		return start_uml();
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
