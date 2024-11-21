Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE2F70810;
	Fri, 22 Nov 2024 00:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732233615; cv=none; b=QhjK+ZfmNi5zkty9q0CzRbULocgfY1KT6eKt9JBHvVahGMxHxym0VZ1Gfhv7eS6AySxKHGcDPyK3RUCFt9kJ7gXscSasWMea3bVZ1kaKdY4gWbH5Dz3tuCZQSSQSXV3S1eK1vk0+beVTYO6Ii2PdMBe0FM1fM+DpbYy7yl7jnQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732233615; c=relaxed/simple;
	bh=7Xjal6NI5079leEbHRBy9/xNEGH+nHfiNr7nc29IhlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZ3iotQohp/WOCzwHw5rOpdGmeir4Zxcszuk8uErMIufiwUYswufQkGBgqDrcTbISQjhf6CmuBU9hQxWAVXJbzZdFlZIvrLW2v0RwBukF9MDJfzQSLfIrooua7UCy+NnVEgpBWdzPOmdhwJ1R2RJsDbJ/fA33hWqhpxiOMN6ZRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFPOQQf6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFPOQQf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732233614; x=1763769614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Xjal6NI5079leEbHRBy9/xNEGH+nHfiNr7nc29IhlA=;
  b=bFPOQQf6SxNcNlpcXUha0uK3z5OzVyTQfqCMKoXfMprwWn1HuemaUqzw
   /7/2mNtElvQN69UmfUPGZ2gbxE5ekJojoEfRgNTe1i0ITLhpIETIpzutb
   NTFsZjzmRc37zok94P1Ks3ZnKrb9kOwsBdGWglQxY+1YE3MuZguxrrJff
   Npwt04K58s8YW5zW+5lojPdg/yA1QEO4joNtLxBgfOZm+tIwic/3olFmC
   cvKNV4pMo0DK5M4are74wLrFnR6SytTG1ZB7pFAN1YKiy4TsZFL/XjPE3
   nKTEiMfYNyGvKzhRlyWYL2kIJI6GiBgrJ5kX09B5XdGB26CDQMuR80E7d
   w==;
X-CSE-ConnectionGUID: 1ZAOgnhTQfSha9Ob3W7/Ag==
X-CSE-MsgGUID: L9epP/0HRNmgpbciardFmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32517969"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="32517969"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 16:00:13 -0800
X-CSE-ConnectionGUID: MFRnJ24STUC5zODyLEYe3g==
X-CSE-MsgGUID: Ho0VXV4GRMuIlwiicxpkxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="113693873"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Nov 2024 16:00:11 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEH5l-0003UF-1B;
	Fri, 22 Nov 2024 00:00:09 +0000
Date: Fri, 22 Nov 2024 07:59:58 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/29] dma-fence: Add dma_fence_user_fence
Message-ID: <202411220719.Zhxq1Vjq-lkp@intel.com>
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
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241122/202411220719.Zhxq1Vjq-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411220719.Zhxq1Vjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411220719.Zhxq1Vjq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/dma-buf/dma-fence-user-fence.c:6:
   In file included from include/linux/dma-fence-user-fence.h:10:
   In file included from include/linux/iosys-map.h:10:
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
   In file included from drivers/dma-buf/dma-fence-user-fence.c:6:
   In file included from include/linux/dma-fence-user-fence.h:10:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/dma-buf/dma-fence-user-fence.c:6:
   In file included from include/linux/dma-fence-user-fence.h:10:
   In file included from include/linux/iosys-map.h:10:
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
>> drivers/dma-buf/dma-fence-user-fence.c:15:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      15 |                 writeq(user_fence->seqno, user_fence->map.vaddr_iomem);
         |                 ^
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
