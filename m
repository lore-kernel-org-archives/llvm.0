Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE7FC08;
	Sat, 17 Aug 2024 05:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723873292; cv=none; b=hZSlbdT9lBUVWP1BYoqXhHNo0DW92gai2kBz/28ORIkZ/HeT1EYIc7i7sehSVdmMdSeff3hrTGRhzUw7nPAXuB7HxdWUhnt859u9c5AWh8XUshxBxkgsZnuQCQ5P8CXTf/7pJpGHCtxTKbru4DcbiUAqnGclMtsnnEMzL6rvyqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723873292; c=relaxed/simple;
	bh=x9oGuqhva9dzW/9++swpfRTcyqbJ71pBRT9x2da+Eig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZDSnRfzDZB8m4k4uIZUgVYwFUWK61cfI183RIFlEcfd3VtysUDsSsRneCg+UZy1Nw75no7/qBAJBNVL3lIqpS3fKTdNQq3uEUqM3vrx5E/Mn7Q7wnKQ5yeBQbuodDzvs7Ei0AYFHKq1Kuhq84FaY8hODxwC/AtNlXM2UBN0jDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nkGBcQmg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nkGBcQmg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723873290; x=1755409290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x9oGuqhva9dzW/9++swpfRTcyqbJ71pBRT9x2da+Eig=;
  b=nkGBcQmgAmxWWjf2jjSnuvrx4MxhLy78aMBafXX+xHCzr3BqwsdxF9Ln
   12VPSksyHjXhosWrCS6NlMXRUvt02i3wNBiLX0daHNhrEMfFxd0Q4MOEj
   gUW10jo9PonNriG09lVchEwgENYOpJ6ic1QplGhJEHU4dU3lEtVvgfRxG
   n83XEND3rTfIqa7ymb25OqHyN3/b1MX37Ud07cStax0FGNUY7Zz1yjXIL
   RmS3+cvaz4pttRV9vaenLfTR+w/MDw17U9Zi5xEWZORkuEWpAl7Fq9Exm
   rflldTe10KwisVtUDOa3O0qTPKh659qxzdKXH+LgdMgNVCI3i9bkfdr4R
   w==;
X-CSE-ConnectionGUID: GTLiw0DtS8KkWzTWMBw3uQ==
X-CSE-MsgGUID: i4Ue+PqXQteKccCfirK76A==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21803832"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="21803832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 22:41:29 -0700
X-CSE-ConnectionGUID: 30HaAKbrTSaDFE8ITWRyXg==
X-CSE-MsgGUID: r50VEBKQSC+rir6cPHPvEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="59901832"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2024 22:41:28 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfCBp-0007DI-20;
	Sat, 17 Aug 2024 05:41:25 +0000
Date: Sat, 17 Aug 2024 13:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Maciek Machnikowski <maciek@machnikowski.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 1/3] ptp: Implement timex esterror support
Message-ID: <202408171333.n2ohRgye-lkp@intel.com>
References: <20240813125602.155827-2-maciek@machnikowski.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813125602.155827-2-maciek@machnikowski.net>

Hi Maciek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes net/main net-next/main linus/master horms-ipvs/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciek-Machnikowski/ptp-Implement-timex-esterror-support/20240814-233156
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240813125602.155827-2-maciek%40machnikowski.net
patch subject: [RFC 1/3] ptp: Implement timex esterror support
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240817/202408171333.n2ohRgye-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171333.n2ohRgye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171333.n2ohRgye-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:181:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/ptp/ptp_clock.c:21:
   In file included from drivers/ptp/ptp_private.h:16:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/ptp/ptp_clock.c:21:
   In file included from drivers/ptp/ptp_private.h:16:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/ptp/ptp_clock.c:21:
   In file included from drivers/ptp/ptp_private.h:16:
   In file included from include/linux/ptp_clock_kernel.h:15:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
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
>> drivers/ptp/ptp_clock.c:171:4: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     171 |                         else
         |                         ^
   18 warnings generated.


vim +171 drivers/ptp/ptp_clock.c

   117	
   118	static int ptp_clock_adjtime(struct posix_clock *pc, struct __kernel_timex *tx)
   119	{
   120		struct ptp_clock *ptp = container_of(pc, struct ptp_clock, clock);
   121		struct ptp_clock_info *ops;
   122		int err = -EOPNOTSUPP;
   123	
   124		if (ptp_clock_freerun(ptp)) {
   125			pr_err("ptp: physical clock is free running\n");
   126			return -EBUSY;
   127		}
   128	
   129		ops = ptp->info;
   130	
   131		if (tx->modes & ADJ_SETOFFSET) {
   132			struct timespec64 ts;
   133			ktime_t kt;
   134			s64 delta;
   135	
   136			ts.tv_sec  = tx->time.tv_sec;
   137			ts.tv_nsec = tx->time.tv_usec;
   138	
   139			if (!(tx->modes & ADJ_NANO))
   140				ts.tv_nsec *= 1000;
   141	
   142			if ((unsigned long) ts.tv_nsec >= NSEC_PER_SEC)
   143				return -EINVAL;
   144	
   145			kt = timespec64_to_ktime(ts);
   146			delta = ktime_to_ns(kt);
   147			err = ops->adjtime(ops, delta);
   148		} else if (tx->modes & ADJ_FREQUENCY) {
   149			long ppb = scaled_ppm_to_ppb(tx->freq);
   150			if (ppb > ops->max_adj || ppb < -ops->max_adj)
   151				return -ERANGE;
   152			err = ops->adjfine(ops, tx->freq);
   153			ptp->dialed_frequency = tx->freq;
   154		} else if (tx->modes & ADJ_OFFSET) {
   155			if (ops->adjphase) {
   156				s32 max_phase_adj = ops->getmaxphase(ops);
   157				s32 offset = tx->offset;
   158	
   159				if (!(tx->modes & ADJ_NANO))
   160					offset *= NSEC_PER_USEC;
   161	
   162				if (offset > max_phase_adj || offset < -max_phase_adj)
   163					return -ERANGE;
   164	
   165				err = ops->adjphase(ops, offset);
   166			}
   167		} else if (tx->modes & ADJ_ESTERROR) {
   168			if (ops->setesterror)
   169				if (tx->modes & ADJ_NANO)
   170					err = ops->setesterror(ops, tx->esterror * 1000);
 > 171				else
   172					err = ops->setesterror(ops, tx->esterror);
   173		} else if (tx->modes == 0) {
   174			long esterror;
   175	
   176			tx->freq = ptp->dialed_frequency;
   177			if (ops->getesterror) {
   178				err = ops->getesterror(ops, &esterror, NULL, NULL);
   179				if (err)
   180					return err;
   181				tx->modes &= ADJ_NANO;
   182				tx->esterror = esterror;
   183			} else {
   184				err = 0;
   185			}
   186		}
   187	
   188		return err;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
