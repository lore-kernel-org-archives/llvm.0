Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA527466;
	Sun, 27 Oct 2024 18:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730055146; cv=none; b=WaylB6VAegE0HFH+0aEPasUSOotKp+T+dqrlmmD0oxIMJB0adC+8fpC0rwRlw8SRvf4gw9dpV5WHMZyI04rxHH65ZC5uE8z/YxRD3hlpU6xOLvk/4ExpriYKmMeSorp4E5Dnz6pFO0abXvoAz/Bv1s+Gw0MHWjFiIbPu0OSlHaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730055146; c=relaxed/simple;
	bh=MAzTlAeSbbbrqINzQievmm7lwiQ9VHydEoOGLysHnRY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgc8qtwnYiOv6HleXY8gsikayZ+bWxVecIa940DcbT4+m15I7bwTmXUBw/r+qQQH3y7C4SSJ5QrrSbE2wy4y7d4EI2YxrsFncdcsScTm1H3NXntLKJTKWvzt4F4KKUb17XlxkFRhYxT4Fp1duZJkJ/IlYtQDiDOlcmU3YOtbt0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yo9m3X6f; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yo9m3X6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730055143; x=1761591143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAzTlAeSbbbrqINzQievmm7lwiQ9VHydEoOGLysHnRY=;
  b=Yo9m3X6fgzpD3iK2G5aZdCgaYvF2VUheXarMzm1JZB4NLO/8Xsn63Kct
   L5ObYUKkoq+S6cQjhThHzQbYtfUn65SoI2t49B7xMNUM//6DZ1EMEvY4k
   gdCussEiXOStKl9NWZnLM6597zEWcg8Y/VBHEb2C4QncA3ioCmRO6DVMv
   HbZIXiUU6rgVJ9YRgiKAcrSFMcm629VzwSmq9pgqGbCpCEGZ5x4L/8/Lk
   QTyP0cM/vr9tBJGbUMDi2zQ1sIfZTBSDeyJS0FZsWUtdUJoi9x8Bj5ll6
   RpLVXV9riZTR4qsRO3nno+jtJjReSgKKks0jKw5auI/FlbTTmsOZuGhpq
   w==;
X-CSE-ConnectionGUID: M410K1+tToarPBlQzlcYIA==
X-CSE-MsgGUID: WA9PT8OuTyKOM1Lwpqt1qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40757587"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40757587"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 11:52:22 -0700
X-CSE-ConnectionGUID: Q5XLXHwIQkyiC9w1OiuCng==
X-CSE-MsgGUID: 3QM4EdtATPiH+UCuzy947A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="104736174"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Oct 2024 11:52:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t58N9-000av6-18;
	Sun, 27 Oct 2024 18:52:19 +0000
Date: Mon, 28 Oct 2024 02:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-rsrc 10/12] io_uring/rsrc.c:207:31: warning:
 variable 'i' is uninitialized when used here
Message-ID: <202410280250.jqKtTrSR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-rsrc
head:   6aea948dd2af540e0c9ffd392131e68be59de434
commit: 78bb8a4ca9328c808a7b33955fbaad8e139c2a4a [10/12] io_uring/rsrc: use io_rsrc_node_lookup() consistently
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241028/202410280250.jqKtTrSR-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280250.jqKtTrSR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280250.jqKtTrSR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/rsrc.c:6:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/rsrc.c:207:31: warning: variable 'i' is uninitialized when used here [-Wuninitialized]
     207 |                         ctx->file_table.data.nodes[i] = NULL;
         |                                                    ^
   io_uring/rsrc.c:180:11: note: initialize the variable 'i' to silence this warning
     180 |         int fd, i, err = 0;
         |                  ^
         |                   = 0
   2 warnings generated.


vim +/i +207 io_uring/rsrc.c

73572984481907d Jens Axboe        2022-06-13  173  
73572984481907d Jens Axboe        2022-06-13  174  static int __io_sqe_files_update(struct io_ring_ctx *ctx,
73572984481907d Jens Axboe        2022-06-13  175  				 struct io_uring_rsrc_update2 *up,
73572984481907d Jens Axboe        2022-06-13  176  				 unsigned nr_args)
73572984481907d Jens Axboe        2022-06-13  177  {
73572984481907d Jens Axboe        2022-06-13  178  	u64 __user *tags = u64_to_user_ptr(up->tags);
73572984481907d Jens Axboe        2022-06-13  179  	__s32 __user *fds = u64_to_user_ptr(up->data);
73572984481907d Jens Axboe        2022-06-13  180  	int fd, i, err = 0;
73572984481907d Jens Axboe        2022-06-13  181  	unsigned int done;
73572984481907d Jens Axboe        2022-06-13  182  
195a2148900cc0b Jens Axboe        2024-10-26  183  	if (!ctx->file_table.data.nr)
73572984481907d Jens Axboe        2022-06-13  184  		return -ENXIO;
195a2148900cc0b Jens Axboe        2024-10-26  185  	if (up->offset + nr_args > ctx->file_table.data.nr)
73572984481907d Jens Axboe        2022-06-13  186  		return -EINVAL;
73572984481907d Jens Axboe        2022-06-13  187  
73572984481907d Jens Axboe        2022-06-13  188  	for (done = 0; done < nr_args; done++) {
78bb8a4ca9328c8 Jens Axboe        2024-10-27  189  		struct io_rsrc_node *node;
73572984481907d Jens Axboe        2022-06-13  190  		u64 tag = 0;
73572984481907d Jens Axboe        2022-06-13  191  
73572984481907d Jens Axboe        2022-06-13  192  		if ((tags && copy_from_user(&tag, &tags[done], sizeof(tag))) ||
73572984481907d Jens Axboe        2022-06-13  193  		    copy_from_user(&fd, &fds[done], sizeof(fd))) {
73572984481907d Jens Axboe        2022-06-13  194  			err = -EFAULT;
73572984481907d Jens Axboe        2022-06-13  195  			break;
73572984481907d Jens Axboe        2022-06-13  196  		}
73572984481907d Jens Axboe        2022-06-13  197  		if ((fd == IORING_REGISTER_FILES_SKIP || fd == -1) && tag) {
73572984481907d Jens Axboe        2022-06-13  198  			err = -EINVAL;
73572984481907d Jens Axboe        2022-06-13  199  			break;
73572984481907d Jens Axboe        2022-06-13  200  		}
73572984481907d Jens Axboe        2022-06-13  201  		if (fd == IORING_REGISTER_FILES_SKIP)
73572984481907d Jens Axboe        2022-06-13  202  			continue;
73572984481907d Jens Axboe        2022-06-13  203  
78bb8a4ca9328c8 Jens Axboe        2024-10-27  204  		node = io_rsrc_node_lookup(&ctx->file_table.data, up->offset + done);
78bb8a4ca9328c8 Jens Axboe        2024-10-27  205  		if (node) {
78bb8a4ca9328c8 Jens Axboe        2024-10-27  206  			io_put_rsrc_node(node);
195a2148900cc0b Jens Axboe        2024-10-26 @207  			ctx->file_table.data.nodes[i] = NULL;
73572984481907d Jens Axboe        2022-06-13  208  			io_file_bitmap_clear(&ctx->file_table, i);
73572984481907d Jens Axboe        2022-06-13  209  		}
73572984481907d Jens Axboe        2022-06-13  210  		if (fd != -1) {
4bfb0c9af832a18 Christoph Hellwig 2023-06-20  211  			struct file *file = fget(fd);
fdc1774df944e63 Jens Axboe        2024-10-25  212  			struct io_rsrc_node *node;
4bfb0c9af832a18 Christoph Hellwig 2023-06-20  213  
73572984481907d Jens Axboe        2022-06-13  214  			if (!file) {
73572984481907d Jens Axboe        2022-06-13  215  				err = -EBADF;
73572984481907d Jens Axboe        2022-06-13  216  				break;
73572984481907d Jens Axboe        2022-06-13  217  			}
73572984481907d Jens Axboe        2022-06-13  218  			/*
6e5e6d274956305 Jens Axboe        2023-12-19  219  			 * Don't allow io_uring instances to be registered.
73572984481907d Jens Axboe        2022-06-13  220  			 */
73572984481907d Jens Axboe        2022-06-13  221  			if (io_is_uring_fops(file)) {
73572984481907d Jens Axboe        2022-06-13  222  				fput(file);
73572984481907d Jens Axboe        2022-06-13  223  				err = -EBADF;
73572984481907d Jens Axboe        2022-06-13  224  				break;
73572984481907d Jens Axboe        2022-06-13  225  			}
195a2148900cc0b Jens Axboe        2024-10-26  226  			node = io_rsrc_node_alloc(ctx, &ctx->file_table.data, i,
195a2148900cc0b Jens Axboe        2024-10-26  227  						  IORING_RSRC_FILE);
fdc1774df944e63 Jens Axboe        2024-10-25  228  			if (!node) {
fdc1774df944e63 Jens Axboe        2024-10-25  229  				err = -ENOMEM;
fdc1774df944e63 Jens Axboe        2024-10-25  230  				fput(file);
fdc1774df944e63 Jens Axboe        2024-10-25  231  				break;
fdc1774df944e63 Jens Axboe        2024-10-25  232  			}
195a2148900cc0b Jens Axboe        2024-10-26  233  			ctx->file_table.data.nodes[i] = node;
f329b544bf9dada Jens Axboe        2024-10-26  234  			if (tag)
fdc1774df944e63 Jens Axboe        2024-10-25  235  				node->tag = tag;
fdc1774df944e63 Jens Axboe        2024-10-25  236  			io_fixed_file_set(node, file);
73572984481907d Jens Axboe        2022-06-13  237  			io_file_bitmap_set(&ctx->file_table, i);
73572984481907d Jens Axboe        2022-06-13  238  		}
73572984481907d Jens Axboe        2022-06-13  239  	}
73572984481907d Jens Axboe        2022-06-13  240  	return done ? done : err;
73572984481907d Jens Axboe        2022-06-13  241  }
73572984481907d Jens Axboe        2022-06-13  242  

:::::: The code at line 207 was first introduced by commit
:::::: 195a2148900cc0be03bc1ca8c3c67ad48127cf10 io_uring/rsrc: unify file and buffer resource tables

:::::: TO: Jens Axboe <axboe@kernel.dk>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
