Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1C613A86A;
	Wed,  3 Jul 2024 08:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719993611; cv=none; b=rN6kq+l7xE6El/tRnFVl0ZUq66uYtAXwHOzCzUH7pnOR63QuaXl+RNxsRqS/Y0W3EzBa465a1Fl758zH/ejfNhoFeI+Ynop+GmNOAWaLsKzR1UPZASfBubVIV6oBPvCNQyfxdc5v8uMXJy2JrlwfFxLjC/0jN28gLWoAmOYz4w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719993611; c=relaxed/simple;
	bh=NYOBwTEmdPgykvH6vEPAL1W67m1ZrkjTAtdjA4cd6cc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWWdxzCtERprX3xgbtKIFPj6kTF31Kv8AQ2KWll0Vsr/cr/2kpdzoPD+ljEEQm3lyvMR53wXIOL6cr9/5up5hUiTeFFrLB6iAXevqc1OinDfGx6QXLPDEanjFJRoahKyV+5uEzec6hNLYQFSUYJFtLm33xmGua0DLqxEpUqj190=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibqkKlaV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibqkKlaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719993609; x=1751529609;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NYOBwTEmdPgykvH6vEPAL1W67m1ZrkjTAtdjA4cd6cc=;
  b=ibqkKlaV0IIJgcwEzAHjtSQK7BCVbMi7+q1R6ThMHRX3DNB3h0CNCKWX
   /jMaakcicOMZzQmWi1aRbWTQ6guvGx4JZdwNMh+/MVbisJrXS81KYnSPU
   T3sNnf6r8GG5PwFY8Narb/v85/5LFQGj952HDUlXg/aXudRvvOryX5+tG
   qbS+L/nP2u8OoimSRYg/rQoZw5qf53LZQk8UWAB/c9rAgzgSLfFBpLlr9
   cRKBPIvyvoZYoe8wQ1U1aaK7SA5iCVmCcKWKVm6txEugAfm2VlHlo4bfX
   1r0xAuBeWq+UxFJfkerpGtcwLc4cVBIl2HGfFrj1cBlrUZVaE/wMySRcK
   A==;
X-CSE-ConnectionGUID: 2l0K69WYTy2/sVfHjckmvA==
X-CSE-MsgGUID: NpHXd45nSOaduTtUEidInQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17342365"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17342365"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 01:00:06 -0700
X-CSE-ConnectionGUID: NFr0iqkHTQWyVOUDJW1Qpg==
X-CSE-MsgGUID: chDm7pBSQxOKS2aZ70pGyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="46313799"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2024 01:00:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOuuI-000PWi-2N;
	Wed, 03 Jul 2024 08:00:02 +0000
Date: Wed, 3 Jul 2024 15:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Huan Yang <link@vivo.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] mm: memcg: pmc: support oom release
Message-ID: <202407031748.Jhbfna4Y-lkp@intel.com>
References: <20240702084423.1717904-5-link@vivo.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240702084423.1717904-5-link@vivo.com>

Hi Huan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 727900b675b749c40ba1f6669c7ae5eb7eb8e837]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/mm-memcg-pmc-framework/20240702-165351
base:   727900b675b749c40ba1f6669c7ae5eb7eb8e837
patch link:    https://lore.kernel.org/r/20240702084423.1717904-5-link%40vivo.com
patch subject: [RFC PATCH 4/4] mm: memcg: pmc: support oom release
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240703/202407031748.Jhbfna4Y-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031748.Jhbfna4Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031748.Jhbfna4Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
>> include/linux/mmzone.h:626:24: error: field has incomplete type 'struct notifier_block'
     626 |         struct notifier_block oom_nb;
         |                               ^
   include/linux/random.h:12:8: note: forward declaration of 'struct notifier_block'
      12 | struct notifier_block;
         |        ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2239:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:591:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:160:
   include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
         |                             ^        ~
   arch/s390/include/asm/signal.h:22:9: note: array 'sig' declared here
      22 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/s390/kernel/asm-offsets.c:11:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:591:
   In file included from arch/s390/include/asm/hw_irq.h:6:
   In file included from include/linux/pci.h:37:


vim +626 include/linux/mmzone.h

   614	
   615	struct mem_cgroup_per_node_cache {
   616		/* per zone cache */
   617		struct mem_cgroup_zone_cache zone_cachep[MAX_NR_ZONES];
   618		struct mem_cgroup *memcg;
   619	
   620		/* cycle cache reclaim time unit, us, default 5s, 0 means disable reaper */
   621	#define DEFAULT_PMC_REAPER_TIME ((5 * 1000 * 1000))
   622		unsigned int reaper_wait;
   623		struct delayed_work reaper_work;
   624	
   625		/* listen oom event, release hold cache */
 > 626		struct notifier_block oom_nb;
   627	
   628		/* max number to hold page, unit page, default 100MB */
   629	#define DEFAULT_PMC_HOLD_LIMIX ((100 << 20) >> PAGE_SHIFT)
   630		unsigned int hold_limit;
   631	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
