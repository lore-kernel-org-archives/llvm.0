Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01423ED5B;
	Fri, 10 Oct 2025 07:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760082555; cv=none; b=kloqmCxj7/lsbRq9Y2KhkUqofrb8uaeexmOzj8eTH7u7ls5X4A/BfVnCo5xg7TJKQ4D6H8l+xvMztHp70+fvWm7+QWtb8Z8k4ETtAFCG/moa9zawZhe1Llx03X6kgba/U8LboNGfmlRKWF78gcaLa7vZsoQP9BeuvMZqHxbH3iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760082555; c=relaxed/simple;
	bh=WITPA9UX0mo7jnNcZhH/peun2UL7jtO3QDe+jYYMhxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKB5qz2viPedgsS4QrOYSsfosgVSoytahLgflSOcLs80XQxhU/WFsDD/HWjGFS9RzB04bezuBF1hu1oD7C7WqeUzgjM0b/dMsRtmQeWMefA9ghUrNwa4fEh/3iPXpRGYPxdY35jqAhOnLyxBAP4j6V0ZmD5/sSMofS0qj3dbUH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nti1l7lc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nti1l7lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760082554; x=1791618554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WITPA9UX0mo7jnNcZhH/peun2UL7jtO3QDe+jYYMhxE=;
  b=nti1l7lcrtLm1p0eHIn5WRfeM+C16pNu6oR4F9zVaE9a2MXcVZJFfiiJ
   xxLvwseYjSIz6HzNEBu0NyNRgxj3sYaC2uEZOX3AjtEzXkRjuJ5YwkKZv
   ym9MtL543kpTl5idwmNrvM6h5R3oz7XaeTqXDla66z9JRUxmRseH4mb5U
   3+9Ln/qW/Doy8FLpfZXYsY1VBRLUmP9P1XG5CfCZwDeBgJ5tcirzpggSG
   93sBfaXtbZ2yto4LXK6N63mJTBq2+E0Zz15TbWbt2lV/AY4QijRzr+Ix+
   15Gqc/GP7uP6Am911k9yjVqOn8OZbqnwZRlsNxboHRGeqzYOZZtY6JWsK
   A==;
X-CSE-ConnectionGUID: kQFh7RmVRGqRDjn4PjD1LQ==
X-CSE-MsgGUID: ZzwwCWVRS8SHjcqbjPLUNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="64921807"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="64921807"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 00:49:12 -0700
X-CSE-ConnectionGUID: mXA4EAEiTXqigEW2vYLEcw==
X-CSE-MsgGUID: PgyogO0/TP2+AFnJYA+RAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="185304299"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Oct 2025 00:49:05 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v77s6-0002Ql-34;
	Fri, 10 Oct 2025 07:49:02 +0000
Date: Fri, 10 Oct 2025 15:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>, Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Nitin Gote <nitin.r.gote@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Christopher Healy <healych@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 02/10] drm/gem: Introduce drm_gem_get_unmapped_area()
 fop
Message-ID: <202510101507.UiRzhiAP-lkp@intel.com>
References: <20251004093054.21388-3-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251004093054.21388-3-loic.molinari@collabora.com>

Hi Loïc,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.17 next-20251009]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Add-huge-page-fault-handler/20251004-173347
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20251004093054.21388-3-loic.molinari%40collabora.com
patch subject: [PATCH v3 02/10] drm/gem: Introduce drm_gem_get_unmapped_area() fop
config: riscv-randconfig-001-20251010 (https://download.01.org/0day-ci/archive/20251010/202510101507.UiRzhiAP-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510101507.UiRzhiAP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510101507.UiRzhiAP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/drm_gem.c:28:
   In file included from include/linux/dma-buf.h:16:
   In file included from include/linux/iosys-map.h:10:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/drm_gem.c:1271:10: error: call to undeclared function 'mm_get_unmapped_area'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1271 |                 return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
         |                        ^
   drivers/gpu/drm/drm_gem.c:1271:10: note: did you mean '__get_unmapped_area'?
   include/linux/mm.h:3337:1: note: '__get_unmapped_area' declared here
    3337 | __get_unmapped_area(struct file *file, unsigned long addr, unsigned long len,
         | ^
   7 warnings and 1 error generated.


vim +/mm_get_unmapped_area +1271 drivers/gpu/drm/drm_gem.c

  1239	
  1240	/**
  1241	 * drm_gem_get_unmapped_area - get memory mapping region routine for GEM objects
  1242	 * @filp: DRM file pointer
  1243	 * @uaddr: User address hint
  1244	 * @len: Mapping length
  1245	 * @pgoff: Offset (in pages)
  1246	 * @flags: Mapping flags
  1247	 *
  1248	 * If a driver supports GEM object mapping, before ending up in drm_gem_mmap(),
  1249	 * mmap calls on the DRM file descriptor will first try to find a free linear
  1250	 * address space large enough for a mapping. Since GEM objects are backed by
  1251	 * shmem buffers, this should preferably be handled by the shmem virtual memory
  1252	 * filesystem which can appropriately align addresses to huge page sizes when
  1253	 * needed.
  1254	 *
  1255	 * Look up the GEM object based on the offset passed in (vma->vm_pgoff will
  1256	 * contain the fake offset we created) and call shmem_get_unmapped_area() with
  1257	 * the right file pointer.
  1258	 *
  1259	 * If a GEM object is not available at the given offset or if the caller is not
  1260	 * granted access to it, fall back to mm_get_unmapped_area().
  1261	 */
  1262	unsigned long drm_gem_get_unmapped_area(struct file *filp, unsigned long uaddr,
  1263						unsigned long len, unsigned long pgoff,
  1264						unsigned long flags)
  1265	{
  1266		struct drm_gem_object *obj;
  1267		unsigned long ret;
  1268	
  1269		obj = drm_gem_object_lookup_from_offset(filp, pgoff, len >> PAGE_SHIFT);
  1270		if (IS_ERR(obj))
> 1271			return mm_get_unmapped_area(current->mm, filp, uaddr, len, 0,
  1272						    flags);
  1273	
  1274		ret = shmem_get_unmapped_area(obj->filp, uaddr, len, 0, flags);
  1275	
  1276		drm_gem_object_put(obj);
  1277	
  1278		return ret;
  1279	}
  1280	EXPORT_SYMBOL(drm_gem_get_unmapped_area);
  1281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
