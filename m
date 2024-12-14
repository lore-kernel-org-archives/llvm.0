Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9313EA69;
	Sat, 14 Dec 2024 06:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734158063; cv=none; b=i0pY+myGef/DeqtQGJEfhD4Y9NPIHrb9p54uMa7czr6ji33r5Xbg0LgPW5MZUkKupvGHXxMrFtVrty11XqzXMIymrsCmw9eVh/Q5XAbf+PpmcJnT0CvHH9/6BLRWIB35dNHAYOooTM1bJfvJ5owXe4RvYZ/95x6DtUieuDf/nlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734158063; c=relaxed/simple;
	bh=k4DJ8LRuXtVLm08GgGvMm0Y7lS275ENB+9d5Oo0dyvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjhOIKNz55DXajRT3lEq6e5I+EnIyMeC/cLj3ZkttE/E+FcODDttaS3NXdBxp1eTc/rAKIEhJFQPEFV6fLi6GifoOA8oDaJFSR/S5FtG6l+gyFjPBsBPs0/COl9Pb1DXDpGNtG0vmFvzcKXaowB4URnq7v4gKkhKm/skFRtNBN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEAqJJ0Y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEAqJJ0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734158061; x=1765694061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=k4DJ8LRuXtVLm08GgGvMm0Y7lS275ENB+9d5Oo0dyvI=;
  b=HEAqJJ0YpgW5UTOKtCbFEAtCJX5Z8XXVG7y97QJjN5aHg4uOCglXMXha
   tWWuDSMhGMoD44L02T3fv3wd9s2+yO9nLmOzVUf27nYyHO4mb2baFfRqC
   3SNjg4LIlsWIV0DqWrgvTn/rGk2rfrvv9NA5Kh1TSn8/tnVHUftHn/tIn
   T/Tr42d2fPL+Go+Nl4RGbLRUxvGAF7s1TqcEa+JVheZBVi9DAPceWXE+o
   /dYFYTvTHwoaif9canBEleMthe1fJTEFg/wyWYPcS1cKtP0SCrZoA2ecv
   ZnNDbT13KijMtl/hOv96vgP3ZjMBbb87siMaG3PN6xbTtqLG/lkX6pRne
   g==;
X-CSE-ConnectionGUID: Lpcgo7J8S2OnNRZcrKZxZQ==
X-CSE-MsgGUID: FxAzXuzmROy2BX4qEcZ9hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="46007973"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; 
   d="scan'208";a="46007973"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 22:34:21 -0800
X-CSE-ConnectionGUID: OTWoneM7TLavY7bi0Z1F8A==
X-CSE-MsgGUID: +FVkF5+9Ss+od3pWqTymUA==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="97279507"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2024 22:34:18 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMLjE-000Ckt-21;
	Sat, 14 Dec 2024 06:34:16 +0000
Date: Sat, 14 Dec 2024 14:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/4] erofs: reference `struct erofs_device_info` for
 erofs_map_dev
Message-ID: <202412141431.B33KpvxH-lkp@intel.com>
References: <20241212133504.2047178-3-hsiangkao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212133504.2047178-3-hsiangkao@linux.alibaba.com>

Hi Gao,

kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/dev]
[also build test ERROR on linus/master v6.13-rc2 next-20241213]
[cannot apply to xiang-erofs/dev-test xiang-erofs/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gao-Xiang/erofs-use-struct-erofs_device_info-for-the-primary-device/20241213-115709
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev
patch link:    https://lore.kernel.org/r/20241212133504.2047178-3-hsiangkao%40linux.alibaba.com
patch subject: [PATCH 3/4] erofs: reference `struct erofs_device_info` for erofs_map_dev
config: riscv-randconfig-001-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141431.B33KpvxH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 2dc22615fd46ab2566d0f26d5ba234ab12dc4bf8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141431.B33KpvxH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141431.B33KpvxH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:760:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     760 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from fs/erofs/fscache.c:6:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:769:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     769 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/erofs/fscache.c:6:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:778:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/erofs/fscache.c:6:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:787:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     787 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from fs/erofs/fscache.c:6:
   In file included from include/linux/pseudo_fs.h:4:
   In file included from include/linux/fs_context.h:14:
   In file included from include/linux/security.h:35:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1115 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> fs/erofs/fscache.c:201:25: error: no member named 'm_fscache' in 'struct erofs_map_dev'
     201 |         io->io.private = mdev->m_fscache->cookie;
         |                          ~~~~  ^
   fs/erofs/fscache.c:319:41: error: no member named 'm_fscache' in 'struct erofs_map_dev'
     319 |         ret = erofs_fscache_read_io_async(mdev.m_fscache->cookie,
         |                                           ~~~~ ^
   14 warnings and 2 errors generated.


vim +201 fs/erofs/fscache.c

a1bafc3109d713 Jingbo Xu 2024-03-08  194  
a1bafc3109d713 Jingbo Xu 2024-03-08  195  struct bio *erofs_fscache_bio_alloc(struct erofs_map_dev *mdev)
a1bafc3109d713 Jingbo Xu 2024-03-08  196  {
a1bafc3109d713 Jingbo Xu 2024-03-08  197  	struct erofs_fscache_bio *io;
a1bafc3109d713 Jingbo Xu 2024-03-08  198  
a1bafc3109d713 Jingbo Xu 2024-03-08  199  	io = kmalloc(sizeof(*io), GFP_KERNEL | __GFP_NOFAIL);
a1bafc3109d713 Jingbo Xu 2024-03-08  200  	bio_init(&io->bio, NULL, io->bvecs, BIO_MAX_VECS, REQ_OP_READ);
a1bafc3109d713 Jingbo Xu 2024-03-08 @201  	io->io.private = mdev->m_fscache->cookie;
a1bafc3109d713 Jingbo Xu 2024-03-08  202  	io->io.end_io = erofs_fscache_bio_endio;
a1bafc3109d713 Jingbo Xu 2024-03-08  203  	refcount_set(&io->io.ref, 1);
a1bafc3109d713 Jingbo Xu 2024-03-08  204  	return &io->bio;
a1bafc3109d713 Jingbo Xu 2024-03-08  205  }
a1bafc3109d713 Jingbo Xu 2024-03-08  206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
