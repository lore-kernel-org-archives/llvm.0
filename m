Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0901DFD1;
	Sun, 20 Oct 2024 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729448407; cv=none; b=RK/e13phFtxsKM1tttckYJZhXbMhR/OnclkZ5PMSrp/YNzQaVRgOYw0IjfVW2+imx/dEPkPKoFj9EuOXUbvqW8VkboCWQJV/p3VBrEP/kd799xmHoBZZ1ItRcWLzWQvMnnLdVbaLomGOwPzOX7rWtWdoBlFxKpTJi5su5t6/+8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729448407; c=relaxed/simple;
	bh=h+Ml3d5Z1SxuYvLSuS8sd/5xY1I2v/d65NwHVQ9MIkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l7ZP/G3grnFWx4RkRFqPtFeocROAfMkqCpbT7fpvoQGYa/0DwjaqT9jwjsvJbaNUDeZfTZlYzeLDWphhowKT0Vq2un5eu+eE14vYdpcP6oq+F24gb4IFTqLCluYI5g6WmwdEj5P9IUxYhGFaQeIs+ctMM2aP8kZcQgMq2d34+LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2cl2CYp; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2cl2CYp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729448405; x=1760984405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h+Ml3d5Z1SxuYvLSuS8sd/5xY1I2v/d65NwHVQ9MIkQ=;
  b=J2cl2CYph5oRUzSQFzn6NZOLQEdpDtMiRtr+FmGtck/RIXvVp36lMQj3
   xL9p2w90wmWvcEcHs0m1OMOVKfD7635LYN0Rm1WAFggP36hnc/xYjI9By
   Xr4BJAhDTqLGTGq6vX+3KBTMMo/u5+XgKLp/f929rz4xD6jXlejaoyl6H
   xJEMOd6nt+39DWNom0pYivPKDp+WtV8dLwswcQ5RF5eawlwzMcm9oKuc1
   ZpZBPITFa2zbfs9S9Y7NWibuVwhXZDSvOdOZs2/6lkN3QH+VALy0W8s5L
   qya1ekMc+IVdPHPfepDeSodm3we0YLk0nP9aOMcGFmgfxbSqetSG5ZkaB
   w==;
X-CSE-ConnectionGUID: YXCdWy/SQmCXmwwRxMXSZQ==
X-CSE-MsgGUID: xPah+P4rSJSpwNDZm8Iwfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28878350"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28878350"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 11:20:04 -0700
X-CSE-ConnectionGUID: DXSYPJf4S7edHpWLGilHzw==
X-CSE-MsgGUID: WobDz6ekS7eqNCgnvBa9cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="110088214"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2024 11:20:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2aX1-000Qg6-2b;
	Sun, 20 Oct 2024 18:19:59 +0000
Date: Mon, 21 Oct 2024 02:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-sendzc-provided 8/9] io_uring/kbuf.c:312:2:
 error: call to '__compiletime_assert_308' declared with 'error' attribute:
 BUILD_BUG_ON failed: sizeof(struct iovec) != sizeof(struct bio_vec)
Message-ID: <202410210246.JPWRvAHU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-sendzc-provided
head:   5867ef85190744b26e0a5f7b1ee19c4744a92f29
commit: f5b285713cba03be9c941661157659aa29facca9 [8/9] io_uring/kbuf: add support for mapping type KBUF_MODE_BVEC
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20241021/202410210246.JPWRvAHU-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241021/202410210246.JPWRvAHU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410210246.JPWRvAHU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/kbuf.c:6:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> io_uring/kbuf.c:312:2: error: call to '__compiletime_assert_308' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(struct iovec) != sizeof(struct bio_vec)
     312 |         BUILD_BUG_ON(sizeof(struct iovec) != sizeof(struct bio_vec));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:517:2: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:505:2: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:498:4: note: expanded from macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:109:1: note: expanded from here
     109 | __compiletime_assert_308
         | ^
>> io_uring/kbuf.c:312:2: error: call to '__compiletime_assert_308' declared with 'error' attribute: BUILD_BUG_ON failed: sizeof(struct iovec) != sizeof(struct bio_vec)
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:517:2: note: expanded from macro 'compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:505:2: note: expanded from macro '_compiletime_assert'
     505 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:498:4: note: expanded from macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:109:1: note: expanded from here
     109 | __compiletime_assert_308
         | ^
   1 warning and 2 errors generated.


vim +312 io_uring/kbuf.c

   301	
   302	static int io_ring_buffers_peek(struct io_kiocb *req, struct buf_sel_arg *arg,
   303					struct io_buffer_list *bl, int *nbufs)
   304	{
   305		struct io_uring_buf_ring *br = bl->buf_ring;
   306		struct iovec *iov = arg->iovs;
   307		int nr_iovs = arg->nr_vecs;
   308		__u16 nr_avail, tail, head;
   309		struct io_uring_buf *buf;
   310		int vec_off;
   311	
 > 312		BUILD_BUG_ON(sizeof(struct iovec) != sizeof(struct bio_vec));
   313	
   314		tail = smp_load_acquire(&br->tail);
   315		head = bl->head;
   316		nr_avail = min_t(__u16, tail - head, UIO_MAXIOV);
   317		if (unlikely(!nr_avail))
   318			return -ENOBUFS;
   319	
   320		buf = io_ring_head_to_buf(br, head, bl->mask);
   321		if (arg->max_len) {
   322			u32 len = READ_ONCE(buf->len);
   323	
   324			if (unlikely(!len))
   325				return -ENOBUFS;
   326			/*
   327			 * Limit incremental buffers to 1 segment. No point trying
   328			 * to peek ahead and map more than we need, when the buffers
   329			 * themselves should be large when setup with
   330			 * IOU_PBUF_RING_INC.
   331			 */
   332			if (bl->flags & IOBL_INC) {
   333				nr_avail = 1;
   334			} else {
   335				size_t needed;
   336	
   337				needed = (arg->max_len + len - 1) / len;
   338				needed = min_not_zero(needed, (size_t) PEEK_MAX_IMPORT);
   339				if (nr_avail > needed)
   340					nr_avail = needed;
   341			}
   342		}
   343	
   344		/*
   345		 * only alloc a bigger array if we know we have data to map, eg not
   346		 * a speculative peek operation. Note that struct bio_vec and
   347		 * struct iovec are the same size, so we can use them interchangably
   348		 * here as it's just for sizing purposes.
   349		 */
   350		if (arg->mode & KBUF_MODE_EXPAND && nr_avail > nr_iovs && arg->max_len) {
   351			iov = kmalloc_array(nr_avail, sizeof(struct iovec), GFP_KERNEL);
   352			if (unlikely(!iov))
   353				return -ENOMEM;
   354			if (arg->mode & KBUF_MODE_FREE)
   355				kfree(arg->iovs);
   356			arg->iovs = iov;
   357			nr_iovs = nr_avail;
   358			arg->mode |= KBUF_MODE_FREE;
   359		} else if (nr_avail < nr_iovs) {
   360			nr_iovs = nr_avail;
   361		}
   362	
   363		/* set it to max, if not set, so we can use it unconditionally */
   364		if (!arg->max_len)
   365			arg->max_len = INT_MAX;
   366	
   367		vec_off = 0;
   368		req->buf_index = buf->bid;
   369		do {
   370			u32 len = buf->len;
   371	
   372			/* truncate end piece, if needed, for non partial buffers */
   373			if (len > arg->max_len) {
   374				len = arg->max_len;
   375				if (!(bl->flags & IOBL_INC))
   376					buf->len = len;
   377			}
   378	
   379			if (arg->mode & KBUF_MODE_BVEC) {
   380				int ret;
   381	
   382				ret = io_fill_bvecs(req->ctx, buf->addr, arg, len, &vec_off);
   383				if (unlikely(ret < 0))
   384					return ret;
   385				len = ret;
   386			} else {
   387				iov->iov_base = u64_to_user_ptr(buf->addr);
   388				iov->iov_len = len;
   389				iov++;
   390				vec_off++;
   391			}
   392	
   393			arg->out_len += len;
   394			arg->max_len -= len;
   395			(*nbufs)++;
   396			if (!arg->max_len)
   397				break;
   398			buf = io_ring_head_to_buf(br, ++head, bl->mask);
   399		} while (--nr_iovs);
   400	
   401		if (head == tail)
   402			req->flags |= REQ_F_BL_EMPTY;
   403	
   404		req->flags |= REQ_F_BUFFER_RING;
   405		req->buf_list = bl;
   406		return vec_off;
   407	}
   408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
