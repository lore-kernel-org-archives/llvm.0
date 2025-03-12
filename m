Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620FA23E227;
	Wed, 12 Mar 2025 10:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741774339; cv=none; b=JFO72b2dzVQmXfomHWQ/nXAyH6jJpgy8g1GDynneSLAd/FjZK4cUKKff0JDjN/VdaghNFGN6I1gtU9FuNw0rgI/TpUnPnOsoV9dXDyKiSu7Ww1a/IX3XPu6Gl4AgHGx/dCKzUjRzWK/LGCqVG76ZyC+7cLgsbG7gZF8br5ug2Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741774339; c=relaxed/simple;
	bh=ifmuMhHZRMvI+dC4FmIIk9jFk7l0tg8JJjIF3q/bOow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhjoxN6s0UkXXfCuMSB1CFx3nKPaJ3kGlaA5dSA0zN8hS5dh38JsCPA3ZNKCvchCql263pYnb4OcFkbGlR3qTLATJnJ076CtKaGsrbZiq8UwFjO23hSE2R6mmgVPmJzkewqlxzVYqdvGghsgzzkkDqMhPMPvQewB+5S0VX/FMgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW2MyNTm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW2MyNTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741774337; x=1773310337;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ifmuMhHZRMvI+dC4FmIIk9jFk7l0tg8JJjIF3q/bOow=;
  b=fW2MyNTmRDXU13Do3ukZLit909joB++hRi0bKJ6P2CSaHcbNRoPaOsWG
   9jbhsr6LZHmK19edO6dccyg+9xTxVYzZCYkJBJLVQ1QttzbqvXH7nG27o
   8mHCA9Wv8TeZXqiLOHpsWPqxOlw9sFPDRZQXI/hi3v5GI3agYuf2SJyqt
   WgOYo57gtSJNR4By9MYC3luyEOlLPZSfkvnuEJEccJG+/ZWvCh8matNCv
   Xd/hcL3vF4ejrtqDzUmB+URw+EwFGyrBfWNMfU0mXPXv7VCAZScPtJy5k
   6JFyoWAuQVKWlsaV/xkaRas+ADTy6vb2JXRnXkzTrWrpdTpM2vskBwGxn
   w==;
X-CSE-ConnectionGUID: VLzG/G4iSq+HBrxwhA/D/Q==
X-CSE-MsgGUID: tDl7zFNFRICaIbCTRNFJtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42702407"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42702407"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 03:12:15 -0700
X-CSE-ConnectionGUID: XWmf43coRaKV1HajMrGgPw==
X-CSE-MsgGUID: NJ/1tGXhTrm6L6MlkUB/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="124758645"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 12 Mar 2025 03:12:14 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsJ4I-0008NY-1X;
	Wed, 12 Mar 2025 10:12:12 +0000
Date: Wed, 12 Mar 2025 18:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] io_uring: cmd: introduce
 io_uring_cmd_import_fixed_vec
Message-ID: <202503121758.aWUV652p-lkp@intel.com>
References: <20250311114053.216359-2-sidong.yang@furiosa.ai>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311114053.216359-2-sidong.yang@furiosa.ai>

Hi Sidong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250307]
[also build test WARNING on v6.14-rc6]
[cannot apply to kdave/for-next linus/master v6.14-rc6 v6.14-rc5 v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sidong-Yang/io_uring-cmd-introduce-io_uring_cmd_import_fixed_vec/20250311-194620
base:   next-20250307
patch link:    https://lore.kernel.org/r/20250311114053.216359-2-sidong.yang%40furiosa.ai
patch subject: [RFC PATCH 1/2] io_uring: cmd: introduce io_uring_cmd_import_fixed_vec
config: i386-buildonly-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121758.aWUV652p-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121758.aWUV652p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121758.aWUV652p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/ioctl.c:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2306:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from block/ioctl.c:15:
>> include/linux/io_uring/cmd.h:51:14: warning: declaration of 'struct iou_vec' will not be visible outside of this function [-Wvisibility]
      51 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^
   2 warnings generated.
--
   In file included from io_uring/uring_cmd.c:5:
   In file included from include/linux/io_uring/cmd.h:6:
   In file included from include/linux/io_uring_types.h:4:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2306:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/uring_cmd.c:5:
>> include/linux/io_uring/cmd.h:51:14: warning: declaration of 'struct iou_vec' will not be visible outside of this function [-Wvisibility]
      51 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^
>> io_uring/uring_cmd.c:262:14: warning: declaration of 'struct iou_vec' will not be visible outside of this function [-Wvisibility]
     262 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^
   io_uring/uring_cmd.c:258:5: error: conflicting types for 'io_uring_cmd_import_fixed_vec'
     258 | int io_uring_cmd_import_fixed_vec(const struct iovec __user *uiovec,
         |     ^
   include/linux/io_uring/cmd.h:47:5: note: previous declaration is here
      47 | int io_uring_cmd_import_fixed_vec(const struct iovec __user *uiovec,
         |     ^
   io_uring/uring_cmd.c:273:8: error: call to undeclared function 'io_vec_realloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     273 |         ret = io_vec_realloc(iou_vec, nr_segs);
         |               ^
   io_uring/uring_cmd.c:278:16: error: incomplete definition of type 'struct iou_vec'
     278 |         memcpy(iou_vec->iovec, iov, sizeof(*iov) * nr_segs);
         |                ~~~~~~~^
   arch/x86/include/asm/string_32.h:150:42: note: expanded from macro 'memcpy'
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                          ^
   io_uring/uring_cmd.c:262:14: note: forward declaration of 'struct iou_vec'
     262 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^
   io_uring/uring_cmd.c:281:8: error: call to undeclared function 'io_import_reg_vec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         ret = io_import_reg_vec(rw, iter, req, iou_vec, iou_vec->nr, 0,
         |               ^
   io_uring/uring_cmd.c:281:8: note: did you mean 'io_import_reg_buf'?
   io_uring/rsrc.h:61:5: note: 'io_import_reg_buf' declared here
      61 | int io_import_reg_buf(struct io_kiocb *req, struct iov_iter *iter,
         |     ^
   io_uring/uring_cmd.c:281:57: error: incomplete definition of type 'struct iou_vec'
     281 |         ret = io_import_reg_vec(rw, iter, req, iou_vec, iou_vec->nr, 0,
         |                                                         ~~~~~~~^
   io_uring/uring_cmd.c:262:14: note: forward declaration of 'struct iou_vec'
     262 |                                   struct iou_vec *iou_vec, bool compat,
         |                                          ^
   3 warnings and 5 errors generated.


vim +51 include/linux/io_uring/cmd.h

    40	
    41	#if defined(CONFIG_IO_URING)
    42	int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
    43				      struct iov_iter *iter,
    44				      struct io_uring_cmd *ioucmd,
    45				      unsigned int issue_flags);
    46	
    47	int io_uring_cmd_import_fixed_vec(const struct iovec __user *uiovec,
    48					  unsigned long nr_segs, int rw,
    49					  struct iov_iter *iter,
    50					  struct io_uring_cmd *ioucmd,
  > 51					  struct iou_vec *iou_vec, bool compat,
    52					  unsigned int issue_flags);
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
