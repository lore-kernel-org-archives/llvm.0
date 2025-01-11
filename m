Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D18C81E;
	Sat, 11 Jan 2025 05:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736573865; cv=none; b=iRW2god0doWFy06OkFI+y3A1nBeM/Hs5g7928w+ROsAQQ2wVgCYOVE0wZvMVobhiIrluJ1iJXOdMIdzIuYgjABU933nqz/540k/ojUfDJ22b2V4f9Tkq68DQAzmiYU+CxN/nciVVX5T0g+4hkTvRZW0X3ZRoyd6nYnR+iq2u6yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736573865; c=relaxed/simple;
	bh=EC5ZtdDf919YwZHLSAdTGFFADZkWpmIfAf/WH2mSvDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8uzQ8QCgno6hTWK9kItOyTHss1MB02IGsH8wtjJDO7XfzchUCRIrxz4zVGUPo92lQLji51MzQxelHzRsr7tSQgdGQtMZQDsB+NIsEKYrW0Dx/GbR3rUyYkBPPXs+oYpSOcLOoUp3B1A9aF5nrP4ii3AssQDilsVyVsZ1+OooR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OHu376Q0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OHu376Q0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736573863; x=1768109863;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EC5ZtdDf919YwZHLSAdTGFFADZkWpmIfAf/WH2mSvDs=;
  b=OHu376Q0SKEVM/uPIDj7u3OYrCFKnK+/LhdatU1JAdjpxx4KA6GsYRGP
   N+0NcsRrLWyjGxwaGLxaq9WyAS8j3JkQ5iBfxzc/QSgquZ5FFlpM1CB1w
   Vi09KCcuFyvKmXukCrL7SkI7H6r3bk56oexgHM9CI16PZbRd7mzftRoPT
   +tOj2m7wMM74nVbgGJqXkCrLfa43nYGeEPngBBYx0vrXP1dLPcFl+h0Kh
   AaaZ7PbzZV1qLR0En6QAq4gP6ujknysEMaBl591O+E4vZ6YICeYtSdkoD
   tQ1yf28ymvK4z8NsGhR0m+qLTqvqznMOzahXg12oi9K5kmzDPIQyHSHTI
   g==;
X-CSE-ConnectionGUID: I3xX9R1KTsuG/HbSxQNscA==
X-CSE-MsgGUID: ceKsfyfATr2V4TusMaU5sA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="40812603"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="40812603"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 21:37:42 -0800
X-CSE-ConnectionGUID: PD9T2rrDQEyQHjLBMmYLQw==
X-CSE-MsgGUID: YLW8Q7gBSXqqDbIjCNtrHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134824901"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 21:37:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWUBm-000KEp-0N;
	Sat, 11 Jan 2025 05:37:38 +0000
Date: Sat, 11 Jan 2025 13:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, lyude@redhat.com,
	harry.wentland@amd.com, imre.deak@intel.com,
	ville.syrjala@linux.intel.com, Wayne Lin <Wayne.Lin@amd.com>,
	Harry Wentland <hwentlan@amd.com>
Subject: Re: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at
 specific LCT from RAD
Message-ID: <202501111348.e6ctjYKj-lkp@intel.com>
References: <20250110023618.66401-3-Wayne.Lin@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110023618.66401-3-Wayne.Lin@amd.com>

Hi Wayne,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next linus/master v6.13-rc6 next-20250110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wayne-Lin/drm-dp_mst-Fix-drm-RAD-print/20250110-103837
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250110023618.66401-3-Wayne.Lin%40amd.com
patch subject: [Patch v3 2/2] drm/dp_mst: Add helper to get port number at specific LCT from RAD
config: hexagon-randconfig-001-20250111 (https://download.01.org/0day-ci/archive/20250111/202501111348.e6ctjYKj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111348.e6ctjYKj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111348.e6ctjYKj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/display/drm_dp_mst_topology.c:26:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/display/drm_dp_mst_topology.c:26:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/display/drm_dp_mst_topology.c:26:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/display/drm_dp_mst_topology.c:26:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/display/drm_dp_mst_topology.c:201:67: error: passing 'const u8 *' (aka 'const unsigned char *') to parameter of type 'u8 *' (aka 'unsigned char *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     201 |                 unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
         |                                                                                 ^~~
   drivers/gpu/drm/display/drm_dp_mst_topology.c:179:52: note: passing argument to parameter 'rad' here
     179 | drm_dp_mst_get_ufp_num_at_lct_from_rad(u8 lct, u8 *rad)
         |                                                    ^
   7 warnings and 1 error generated.


vim +201 drivers/gpu/drm/display/drm_dp_mst_topology.c

   193	
   194	static int
   195	drm_dp_mst_rad_to_str(const u8 rad[8], u8 lct, char *out, size_t len)
   196	{
   197		int i;
   198		u8 unpacked_rad[16] = {};
   199	
   200		for (i = 0; i < lct; i++)
 > 201			unpacked_rad[i] = drm_dp_mst_get_ufp_num_at_lct_from_rad(i + 1, rad);
   202	
   203		/* TODO: Eventually add something to printk so we can format the rad
   204		 * like this: 1.2.3
   205		 */
   206		return snprintf(out, len, "%*phC", lct, unpacked_rad);
   207	}
   208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
