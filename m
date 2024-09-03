Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0D26AFC;
	Tue,  3 Sep 2024 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379702; cv=none; b=h5kJwYfX4XUlNOipLfyqWFILzBdFh6Dg4UprOQxhGcl0gpDcpfQEtpiwsHecYbTgLLycUHzTcUii+JfJmSgi6nrDdVEk4djoyUmieDp5FGnrbWGF5LyQoFQzTs4gYn3AD/IaIjHcfYWyYfyJ7Sb3v0brAC4ljTjE8sWivc0gL0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379702; c=relaxed/simple;
	bh=fXQ0anoNadjel+xyRscGl3ntRRtw4UDVrrlb7NfuQLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2ko6UfLDFgf2t0fxPck28GCd1N+PdiKPNNvmzfHi0w7dmh2WMSiz1KpmD4t6Y/iQxf7et538ks9oGx9gVBjMVJ9GlXPh7ruGAGrCxwL0NIC1UoS4dwZOzV+tCys7hdIGPjinSwtC3IK2cn4jkgs1FsYdxBEmQtu7LkyRer9tC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bHDvoawB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHDvoawB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725379700; x=1756915700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fXQ0anoNadjel+xyRscGl3ntRRtw4UDVrrlb7NfuQLg=;
  b=bHDvoawBo332HdXJkCeM79i8svbzXxDCx++wUFImh0+019Kc1Hs5uiUo
   WaFwYKHepch5aenh1HfjGHLE1sWrfskC9Remb+6LO5CKImGBpqfMP5tP5
   2C55w/72t4qmwuTh9yzlYr4BSA1h4HE0q055diBfReHMVNo02ZBOLmnZb
   hxCmWC6NLvQQcpMZNa2XvkaBqYmuGOWZ5zQFg7teJuSpFzGcgViIssg+v
   Ni3PgyTXs/95U6JqH9yV1K7KrcqzNtqbFk59JI4jMRuJC6OUqzX0TMmGR
   UDhRxgCLEkngUlVkZrViK2BitXdGLGGlcJJymQOZBiKN2upRxUU+CF316
   w==;
X-CSE-ConnectionGUID: 03lrVaOGTxuQQRaLV27gZQ==
X-CSE-MsgGUID: zk4rfQnySIuKwgmBvLGCEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41461912"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="41461912"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:08:19 -0700
X-CSE-ConnectionGUID: we3NXwoHSz2IODzz7edDPg==
X-CSE-MsgGUID: P4DbNXxpSPu3/TFyqy233Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="65181849"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 03 Sep 2024 09:08:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slW4l-0006sE-0n;
	Tue, 03 Sep 2024 16:08:15 +0000
Date: Wed, 4 Sep 2024 00:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 36/37] fs/netfs/direct_read.c:291:25:
 warning: variable 'start' is uninitialized when used here
Message-ID: <202409040018.dK9qOlqV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   3962f4beba4e7ffa6cfab018df8a612902a1d2c8
commit: 504a8d4b08293dbaa09e7057f3b4ea045ba52d29 [36/37] netfs: Implement bounce-buffering for unbuffered/DIO read
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240904/202409040018.dK9qOlqV-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409040018.dK9qOlqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409040018.dK9qOlqV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/direct_read.c:291:25: warning: variable 'start' is uninitialized when used here [-Wuninitialized]
     291 |                 _debug("bounce %llx", start);
         |                                       ^~~~~
   fs/netfs/internal.h:445:17: note: expanded from macro '_debug'
     445 |                 kdebug(FMT, ##__VA_ARGS__);     \
         |                               ^~~~~~~~~~~
   fs/netfs/internal.h:422:43: note: expanded from macro 'kdebug'
     422 | #define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
         |                                           ^~~~~~~~~~~
   fs/netfs/internal.h:418:46: note: expanded from macro 'dbgprintk'
     418 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                                                     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/netfs/direct_read.c:235:26: note: initialize the variable 'start' to silence this warning
     235 |         unsigned long long start;
         |                                 ^
         |                                  = 0
   1 warning generated.


vim +/start +291 fs/netfs/direct_read.c

   220	
   221	/**
   222	 * netfs_unbuffered_read_iter_locked - Perform an unbuffered or direct I/O read
   223	 * @iocb: The I/O control descriptor describing the read
   224	 * @iter: The output buffer (also specifies read length)
   225	 *
   226	 * Perform an unbuffered I/O or direct I/O from the file in @iocb to the
   227	 * output buffer.  No use is made of the pagecache.
   228	 *
   229	 * The caller must hold any appropriate locks.
   230	 */
   231	ssize_t netfs_unbuffered_read_iter_locked(struct kiocb *iocb, struct iov_iter *iter)
   232	{
   233		struct netfs_io_request *rreq;
   234		struct netfs_inode *ictx;
   235		unsigned long long start;
   236		ssize_t ret;
   237		size_t orig_count = iov_iter_count(iter);
   238		bool sync = is_sync_kiocb(iocb);
   239	
   240		_enter("");
   241	
   242		if (!orig_count)
   243			return 0; /* Don't update atime */
   244	
   245		ret = kiocb_write_and_wait(iocb, orig_count);
   246		if (ret < 0)
   247			return ret;
   248		file_accessed(iocb->ki_filp);
   249	
   250		rreq = netfs_alloc_request(iocb->ki_filp->f_mapping, iocb->ki_filp,
   251					   iocb->ki_pos, orig_count,
   252					   NETFS_DIO_READ);
   253		if (IS_ERR(rreq))
   254			return PTR_ERR(rreq);
   255	
   256		ictx = netfs_inode(rreq->inode);
   257		netfs_stat(&netfs_n_rh_dio_read);
   258		trace_netfs_read(rreq, rreq->start, rreq->len, netfs_read_trace_dio_read);
   259	
   260		/* If this is an async op, we have to keep track of the destination
   261		 * buffer for ourselves as the caller's iterator will be trashed when
   262		 * we return.
   263		 *
   264		 * In such a case, extract an iterator to represent as much of the the
   265		 * output buffer as we can manage.  Note that the extraction might not
   266		 * be able to allocate a sufficiently large bvec array and may shorten
   267		 * the request.
   268		 */
   269		if (user_backed_iter(iter)) {
   270			ret = netfs_extract_user_iter(iter, rreq->len, &rreq->buffer.iter, 0);
   271			if (ret < 0)
   272				goto out;
   273			rreq->direct_bv = (struct bio_vec *)rreq->buffer.iter.bvec;
   274			rreq->direct_bv_count = ret;
   275			rreq->direct_bv_unpin = iov_iter_extract_will_pin(iter);
   276			rreq->len = iov_iter_count(&rreq->buffer.iter);
   277		} else {
   278			rreq->buffer.iter = *iter;
   279			rreq->len = orig_count;
   280			rreq->direct_bv_unpin = false;
   281			iov_iter_advance(iter, orig_count);
   282		}
   283	
   284		/* If we're going to use a bounce buffer, we need to set it up.  We
   285		 * will then need to pad the request out to the minimum block size.
   286		 */
   287		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &rreq->flags)) {
   288			size_t min_bsize = 1UL << ictx->crypto_bshift;
   289	
   290			rreq->bounce_alloc_to = round_down(rreq->start, min_bsize);
 > 291			_debug("bounce %llx", start);
   292	
   293			ret = netfs_alloc_bounce(rreq, rreq->bounce_alloc_to + min_bsize, GFP_KERNEL);
   294			if (ret < 0)
   295				goto out;
   296		}
   297	
   298		if (!sync)
   299			rreq->iocb = iocb;
   300	
   301		ret = netfs_unbuffered_read(rreq, sync);
   302		if (ret < 0)
   303			goto out; /* May be -EIOCBQUEUED */
   304		if (sync) {
   305			ret = netfs_dio_copy_bounce_to_dest(rreq, iocb);
   306			if (ret == 0) {
   307				iocb->ki_pos += rreq->transferred;
   308				ret = rreq->transferred;
   309			}
   310		}
   311	
   312	out:
   313		netfs_put_request(rreq, false, netfs_rreq_trace_put_return);
   314		if (ret > 0)
   315			orig_count -= ret;
   316		return ret;
   317	}
   318	EXPORT_SYMBOL(netfs_unbuffered_read_iter_locked);
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
