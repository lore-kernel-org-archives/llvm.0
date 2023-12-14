Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894362837F;
	Thu, 14 Dec 2023 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZPkvAXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702550318; x=1734086318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Va4GHUGqWZ2cSa36JPgJtYpu9aRwCRnrtEnt12jWKCQ=;
  b=HZPkvAXqzn6TuQcHp3scgMFqbX5QPj6AhlOKGm7+FyGVXIuK7nFVBntc
   GVb8gtzlBh8lhYKLPkmpvDwDMXRZY4HvRn2tPHNdbDtTb7wDWaOAl+Lsc
   byACSIP/+Cg3NhH3DV13Fpk31L5oQylIKnHstY+0XAahFb2jthmduz4ek
   S1Y16YtMQIkMsI2inrlvxFXsMBjCVWppT/4RBunfP3b8kkcC+dBW2N70q
   r2K8bS3UsL8xpM+hT847ZUgL5jDRMOhVlzJNSkL13vExCvHi5ZVNSy9um
   jIEA9OgBhrb3unpoyf/tByto8sp5qCSluqrPzXJZB3IJK8rSnP5+KBETK
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="481297477"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="481297477"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 02:38:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="897703340"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="897703340"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2023 02:38:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDj6v-000LvP-30;
	Thu, 14 Dec 2023 10:38:33 +0000
Date: Thu, 14 Dec 2023 18:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 69/80] fs/netfs/direct_read.c:190:42:
 warning: variable 'min_bsize' is uninitialized when used here
Message-ID: <202312141831.yEpMZoTp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   0e2ac5291cc1c3c45e5ee784357b3f51b611195f
commit: 9afdab285a8996a3f87b696670fe80fb531c8ad5 [69/80] netfs: Implement support for unbuffered/DIO read
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231214/202312141831.yEpMZoTp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312141831.yEpMZoTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312141831.yEpMZoTp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/direct_read.c:190:42: warning: variable 'min_bsize' is uninitialized when used here [-Wuninitialized]
                               round_up(rreq->start + rreq->len, min_bsize),
                                                                 ^~~~~~~~~
   include/linux/math.h:25:52: note: expanded from macro 'round_up'
   #define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
                                                      ^
   include/linux/math.h:15:46: note: expanded from macro '__round_mask'
   #define __round_mask(x, y) ((__typeof__(x))((y)-1))
                                                ^
   include/linux/minmax.h:161:53: note: expanded from macro 'min_t'
   #define min_t(type, x, y)       __careful_cmp(min, (type)(x), (type)(y))
                                                             ^
   include/linux/minmax.h:58:18: note: expanded from macro '__careful_cmp'
                   __cmp_once(op, x, y, __UNIQUE_ID(__x), __UNIQUE_ID(__y)))
                                  ^
   include/linux/minmax.h:49:24: note: expanded from macro '__cmp_once'
           typeof(x) unique_x = (x);                       \
                                 ^
   fs/netfs/direct_read.c:134:24: note: initialize the variable 'min_bsize' to silence this warning
           unsigned int min_bsize;
                                 ^
                                  = 0
   1 warning generated.


vim +/min_bsize +190 fs/netfs/direct_read.c

   118	
   119	/**
   120	 * netfs_unbuffered_read_iter_locked - Perform an unbuffered or direct I/O read
   121	 * @iocb: The I/O control descriptor describing the read
   122	 * @iter: The output buffer (also specifies read length)
   123	 *
   124	 * Perform an unbuffered I/O or direct I/O from the file in @iocb to the
   125	 * output buffer.  No use is made of the pagecache.
   126	 *
   127	 * The caller must hold any appropriate locks.
   128	 */
   129	static ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_iter *iter)
   130	{
   131		struct netfs_io_request *rreq;
   132		struct netfs_inode *ctx;
   133		unsigned long long start, end;
   134		unsigned int min_bsize;
   135		pgoff_t first, last;
   136		ssize_t ret;
   137		size_t orig_count = iov_iter_count(iter);
   138		bool async = !is_sync_kiocb(iocb);
   139	
   140		_enter("");
   141	
   142		if (!orig_count)
   143			return 0; /* Don't update atime */
   144	
   145		ret = kiocb_write_and_wait(iocb, orig_count);
   146		if (ret < 0)
   147			return ret;
   148		file_accessed(iocb->ki_filp);
   149	
   150		rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
   151					   iocb->ki_pos, orig_count,
   152					   NETFS_DIO_READ);
   153		if (IS_ERR(rreq))
   154			return PTR_ERR(rreq);
   155	
   156		ctx = netfs_inode(rreq->inode);
   157		netfs_stat(&netfs_n_rh_dio_read);
   158		trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
   159	
   160		/* If this is an async op, we have to keep track of the destination
   161		 * buffer for ourselves as the caller's iterator will be trashed when
   162		 * we return.
   163		 *
   164		 * In such a case, extract an iterator to represent as much of the the
   165		 * output buffer as we can manage.  Note that the extraction might not
   166		 * be able to allocate a sufficiently large bvec array and may shorten
   167		 * the request.
   168		 */
   169		if (user_backed_iter(iter)) {
   170			ret = netfs_extract_user_iter(iter, rreq->len, &rreq->iter, 0);
   171			if (ret < 0)
   172				goto out;
   173			rreq->direct_bv = (struct bio_vec *)rreq->iter.bvec;
   174			rreq->direct_bv_count = ret;
   175			rreq->direct_bv_unpin = iov_iter_extract_will_pin(iter);
   176			rreq->len = iov_iter_count(&rreq->iter);
   177		} else {
   178			rreq->iter = *iter;
   179			rreq->len = orig_count;
   180			rreq->direct_bv_unpin = false;
   181			iov_iter_advance(iter, orig_count);
   182		}
   183	
   184		/* If we're going to use a bounce buffer, we need to set it up.  We
   185		 * will then need to pad the request out to the minimum block size.
   186		 */
   187		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
   188			start = rreq->start;
   189			end = min_t(unsigned long long,
 > 190				    round_up(rreq->start + rreq->len, min_bsize),
   191				    ctx->remote_i_size);
   192	
   193			rreq->start = start;
   194			rreq->len   = end - start;
   195			first = start / PAGE_SIZE;
   196			last  = (end - 1) / PAGE_SIZE;
   197			_debug("bounce %llx-%llx %lx-%lx",
   198			       rreq->start, end, first, last);
   199	
   200			ret = netfs_add_folios_to_buffer(&rreq->bounce, rreq->mapping,
   201							 first, last, GFP_KERNEL);
   202			if (ret < 0)
   203				goto out;
   204		}
   205	
   206		if (async)
   207			rreq->iocb = iocb;
   208	
   209		ret = netfs_begin_read(rreq, is_sync_kiocb(iocb));
   210		if (ret < 0)
   211			goto out; /* May be -EIOCBQUEUED */
   212		if (!async) {
   213			ret = netfs_dio_copy_bounce_to_dest(rreq);
   214			if (ret == 0) {
   215				iocb->ki_pos += rreq->transferred;
   216				ret = rreq->transferred;
   217			}
   218		}
   219	
   220	out:
   221		netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
   222		if (ret > 0)
   223			orig_count -= ret;
   224		if (ret != -EIOCBQUEUED)
   225			iov_iter_revert(iter, orig_count - iov_iter_count(iter));
   226		return ret;
   227	}
   228	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
