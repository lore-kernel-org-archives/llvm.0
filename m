Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E951A2C04;
	Thu, 21 Nov 2024 21:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732223575; cv=none; b=FzzxiB2sL8EwtRUcLon9vGOS+awOD0BmVQ6fQ92m0sZSEsCQ7s5Jdod6wlYewvKzJam2LOdK60FeqoYLj7DbeoUmrEx5kavfyRJfdTvWMkB08GwtK0wBpR4Q7pjLVB86+8SG4RvRAThyE2L2EqRh97Nuv1iEzEFy20OYadqm5Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732223575; c=relaxed/simple;
	bh=QCLxfolFsBmQDw94JgmEhMlnZgCR51ibBZn/hZN7lqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uKKUucwJFLsDIQsUt4fKk6DY9DKnU0MLuHf/4bz88he5VofkwMOIuIdX1SHKcz3ShuRmuvitcgVpbwgHfMXylfSPZWSU8v+WgQDMMiP3nrofVw3Qn6iXbEXpEnuITbEKsUvJY77NjajdkaYErWRZFQqsyWF66DU2WQjA5IxoiQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5J6cU0s; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5J6cU0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732223573; x=1763759573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QCLxfolFsBmQDw94JgmEhMlnZgCR51ibBZn/hZN7lqU=;
  b=l5J6cU0sWRNDw66DOHBLQhly9s9zE7Qyp/rrQURr7BKLQAh7Rt1909wp
   Rs7FhX0nv6D4wUCdgjmTn00I7Hme4OvHYlkuoXYHXtjl30v6DSOxjOqPi
   mXFB+xaoACu5spCAuBt8L/O/HkUW1uf0hrJTCu9I54yfkOA5a669QaJ3R
   9JC05IBgVl1iI/A9c0HAcj6zoObTB5/xoEez1ojdjSFRTb60K63eqMc0V
   masTgsxWk7bsw75UejmmzIDywDMit73uqtt9OXCXc/9iSgBycenijQNPv
   drYofZyj3WVWRZZDeEHC63uyUGEsu0B4KWa7dYND+4XnHCOLyq1+vE4Hu
   g==;
X-CSE-ConnectionGUID: JEnfag8FRLGW0MudkhhjIA==
X-CSE-MsgGUID: mDrYucPWS9i0B2wU6NtnxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32420123"
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="32420123"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 13:12:52 -0800
X-CSE-ConnectionGUID: SGTc7guUTz+5z3Iz4oM72A==
X-CSE-MsgGUID: UZLM8tkHR4SzlRlz1yzxgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,173,1728975600"; 
   d="scan'208";a="95320460"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2024 13:12:52 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEETp-0003MF-1C;
	Thu, 21 Nov 2024 21:12:49 +0000
Date: Fri, 22 Nov 2024 05:12:01 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
Message-ID: <202411220754.4LD2Xt3z-lkp@intel.com>
References: <20241118233757.2374041-3-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118233757.2374041-3-matthew.brost@intel.com>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.12 next-20241121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/dma-fence-Add-dma_fence_preempt-base-class/20241121-124856
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241118233757.2374041-3-matthew.brost%40intel.com
patch subject: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
config: hexagon-randconfig-002-20241121 (https://download.01.org/0day-ci/archive/20241122/202411220754.4LD2Xt3z-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220754.4LD2Xt3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220754.4LD2Xt3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma-buf/dma-fence-user-fence.c:6:
   In file included from include/linux/dma-fence-user-fence.h:10:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/dma-buf/dma-fence-user-fence.c:6:
   In file included from include/linux/dma-fence-user-fence.h:10:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/dma-buf/dma-fence-user-fence.c:6:
   In file included from include/linux/dma-fence-user-fence.h:10:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/dma-buf/dma-fence-user-fence.c:15:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
                   writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
                   ^
   6 warnings and 1 error generated.


vim +/writeq +15 drivers/dma-buf/dma-fence-user-fence.c

     8	
     9	static void user_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
    10	{
    11		struct dma_fence_user_fence *user_fence =
    12			container_of(cb, struct dma_fence_user_fence, cb);
    13	
    14		if (user_fence->map.is_iomem)
  > 15			writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
    16		else
    17			*(u64 *)user_fence->map.vaddr = user_fence->seqno;
    18	
    19		dma_fence_user_fence_free(user_fence);
    20	}
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
