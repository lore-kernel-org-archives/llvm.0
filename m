Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A98144C8D;
	Wed, 20 Mar 2024 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710945499; cv=none; b=Coe4kwQwJ7lCgATdO+kYRxRvQEnhGjI36m4TKkXniii4djlDjhh+hgoi12H/45r4r6xwFej8IvABj0PfsKsDud6ivRMmdNvW+yninZT418KvCByQ+tkyyr0kw95hdqJqVUqTE1AJ06ljm/Ahv8RNHyR4DNRRk9U3qhui6VXaYNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710945499; c=relaxed/simple;
	bh=mwDZh8ZNErQ5B4UuqJJ52yZAR1AKePUqdUmk6h9rU8o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D4203asqgggggbBu1QFhaWcwFwojV59LqcwBUU9Yh0gFxfsRtNx2k0wj8yoQlm8LLsPx0bYl01TUASjYGu+yQ8xVNcGDgdFxHXOgm6BiDj6LMC3xDhQD3kIXqhY9HI7fLLB7IeO2AVj/TiESOLGJ1lVrWsaxtXoReEQjWHBxXlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Btfqb6Qx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Btfqb6Qx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710945497; x=1742481497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mwDZh8ZNErQ5B4UuqJJ52yZAR1AKePUqdUmk6h9rU8o=;
  b=Btfqb6Qxaj1nBOy7wCq7s+NwyKA/WEpZj9yVxMvKEFKnRTeigpHPsPn1
   /sfOB/c0pO+RvDayXAwhJYj3131HkVch+VdhKzMOPswKmrX5mzhq4ettL
   m30NqOBcx+TDucFakPoygZODWF6aihko4kSPupAhamQHPVTfHH8desWty
   yw3I2lhRpCrjZbfZN+EcCGn3UkeqTsmecKBRBwErR+5Pc4p4YtMiUoZpg
   SxBuj7zW/tJ9dtgWDYjB8coBY/h3AmKt2JT9hxt8mixoZttbX7kAvmMjO
   Sb1poe0Dwa9vLkeSlGfHY5ifDbqKEfN1BG2XFE4dgZBmsLqhQYBP1vFT4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11018"; a="5811388"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5811388"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2024 07:38:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="14256314"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Mar 2024 07:38:12 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmx50-000IgL-00;
	Wed, 20 Mar 2024 14:38:10 +0000
Date: Wed, 20 Mar 2024 22:37:37 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 20/20] io_uring/rw.c:1023:25:
 warning: variable 'io' is uninitialized when used here
Message-ID: <202403202239.UNmPHdZX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   3553b34e3e9beae617deb6338eca6ab442b292b1
commit: 43fa1243320724c318c038a97de453a6c746ba61 [20/20] io_uring/rw: always setup io_async_rw for read/write requests
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240320/202403202239.UNmPHdZX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240320/202403202239.UNmPHdZX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403202239.UNmPHdZX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/rw.c:6:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/um/include/asm/cacheflush.h:4:
   In file included from arch/um/include/asm/tlbflush.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/rw.c:6:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from io_uring/rw.c:6:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from io_uring/rw.c:6:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
>> io_uring/rw.c:1023:25: warning: variable 'io' is uninitialized when used here [-Wuninitialized]
    1023 |                         iov_iter_save_state(&io->s.iter, &io->s.iter_state);
         |                                              ^~
   io_uring/rw.c:1013:26: note: initialize the variable 'io' to silence this warning
    1013 |                         struct io_async_rw *io;
         |                                               ^
         |                                                = NULL
   14 warnings generated.


vim +/io +1023 io_uring/rw.c

   944	
   945	int io_write(struct io_kiocb *req, unsigned int issue_flags)
   946	{
   947		bool force_nonblock = issue_flags & IO_URING_F_NONBLOCK;
   948		struct io_rw *rw = io_kiocb_to_cmd(req, struct io_rw);
   949		struct io_async_rw *io = req->async_data;
   950		struct kiocb *kiocb = &rw->kiocb;
   951		ssize_t ret, ret2;
   952		loff_t *ppos;
   953	
   954		ret = io_rw_init_file(req, FMODE_WRITE);
   955		if (unlikely(ret))
   956			return ret;
   957		req->cqe.res = iov_iter_count(&io->s.iter);
   958	
   959		if (force_nonblock) {
   960			/* If the file doesn't support async, just async punt */
   961			if (unlikely(!io_file_supports_nowait(req)))
   962				goto ret_eagain;
   963	
   964			/* File path supports NOWAIT for non-direct_IO only for block devices. */
   965			if (!(kiocb->ki_flags & IOCB_DIRECT) &&
   966				!(kiocb->ki_filp->f_mode & FMODE_BUF_WASYNC) &&
   967				(req->flags & REQ_F_ISREG))
   968				goto ret_eagain;
   969	
   970			kiocb->ki_flags |= IOCB_NOWAIT;
   971		} else {
   972			/* Ensure we clear previously set non-block flag */
   973			kiocb->ki_flags &= ~IOCB_NOWAIT;
   974		}
   975	
   976		ppos = io_kiocb_update_pos(req);
   977	
   978		ret = rw_verify_area(WRITE, req->file, ppos, req->cqe.res);
   979		if (unlikely(ret))
   980			return ret;
   981	
   982		if (req->flags & REQ_F_ISREG)
   983			kiocb_start_write(kiocb);
   984		kiocb->ki_flags |= IOCB_WRITE;
   985	
   986		if (likely(req->file->f_op->write_iter))
   987			ret2 = call_write_iter(req->file, kiocb, &io->s.iter);
   988		else if (req->file->f_op->write)
   989			ret2 = loop_rw_iter(WRITE, rw, &io->s.iter);
   990		else
   991			ret2 = -EINVAL;
   992	
   993		if (req->flags & REQ_F_REISSUE) {
   994			req->flags &= ~REQ_F_REISSUE;
   995			ret2 = -EAGAIN;
   996		}
   997	
   998		/*
   999		 * Raw bdev writes will return -EOPNOTSUPP for IOCB_NOWAIT. Just
  1000		 * retry them without IOCB_NOWAIT.
  1001		 */
  1002		if (ret2 == -EOPNOTSUPP && (kiocb->ki_flags & IOCB_NOWAIT))
  1003			ret2 = -EAGAIN;
  1004		/* no retry on NONBLOCK nor RWF_NOWAIT */
  1005		if (ret2 == -EAGAIN && (req->flags & REQ_F_NOWAIT))
  1006			goto done;
  1007		if (!force_nonblock || ret2 != -EAGAIN) {
  1008			/* IOPOLL retry should happen for io-wq threads */
  1009			if (ret2 == -EAGAIN && (req->ctx->flags & IORING_SETUP_IOPOLL))
  1010				goto ret_eagain;
  1011	
  1012			if (ret2 != req->cqe.res && ret2 >= 0 && need_complete_io(req)) {
  1013				struct io_async_rw *io;
  1014	
  1015				trace_io_uring_short_write(req->ctx, kiocb->ki_pos - ret2,
  1016							req->cqe.res, ret2);
  1017	
  1018				/* This is a partial write. The file pos has already been
  1019				 * updated, setup the async struct to complete the request
  1020				 * in the worker. Also update bytes_done to account for
  1021				 * the bytes already written.
  1022				 */
> 1023				iov_iter_save_state(&io->s.iter, &io->s.iter_state);
  1024				io->bytes_done += ret2;
  1025	
  1026				if (kiocb->ki_flags & IOCB_WRITE)
  1027					io_req_end_write(req);
  1028				return -EAGAIN;
  1029			}
  1030	done:
  1031			ret = kiocb_done(req, ret2, issue_flags);
  1032		} else {
  1033	ret_eagain:
  1034			iov_iter_restore(&io->s.iter, &io->s.iter_state);
  1035			if (kiocb->ki_flags & IOCB_WRITE)
  1036				io_req_end_write(req);
  1037			return -EAGAIN;
  1038		}
  1039		return ret;
  1040	}
  1041	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
