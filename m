Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D99219FC;
	Mon, 22 Dec 2025 23:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766447328; cv=none; b=IX488ilA1ZvpJOtg6XRQHf284pdoVy6HgLX1dYD/4sKCzJdiBUQWwUhSLTNr7h5Pj9WLIMUyCjr63654WeGkg1CVQb0oFlVkQJN5jTRBCU4ajWnGgnNdGh8TPsPAkMV2W+VWYyEjgeBz9LkCIqaJawYyhzeaw5giZ8M+h8dxwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766447328; c=relaxed/simple;
	bh=hgSyiFCkU9DJfJ6bL36K8oNJn2T8CKF88/WMh6ggvmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ds7X+Zt7s+zEk53QRGto7ihAebpEICWw4wcRsv4ASYGW80Pb59kKeEjcqk97/xO4sgRHZY1OgZfGJAu/KHmU31myKvVKZf1OpdJy3gDdRul8D+qTIRUdezCJwP6OLlwj7tvJ/C1kXSFu27mqnConCNZ8w2ogVSkhdOV/qK0CfEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hue1qCu/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hue1qCu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766447326; x=1797983326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hgSyiFCkU9DJfJ6bL36K8oNJn2T8CKF88/WMh6ggvmI=;
  b=hue1qCu/wQxB9hc/r/+quWvJxpIZloPtEQzViQxTloX4LLx2/cb2OU1q
   yMIEOh3DlxfY9KJ5eGZM+pOPqRaeKenN++hDyyCeD98ve0MWCsNOlkqZX
   XFv1ruHEdBNYFI/ooBCSYQqOC0rlzCGvc+WwTpqvFKoBUy3TS5HKeUku7
   P0nYAgyu1Dokynlc8CLVLtd38xaza7fECA2qwF8qjbARBHOC1Jviuo1Fi
   skzYoyq2K9vhNeIyEBnGNxhwgTBUgLMX748Jl+liW3c8FwpHYuRWc+Th9
   NkgGIkOGkPp6kIkvgbMlafiud6Avy8TRaTDN3yp9E0gJkXMdr0zUtzGRR
   w==;
X-CSE-ConnectionGUID: +OyRfsX8QzG1rJLTb6y3xw==
X-CSE-MsgGUID: 57F4HlVfQfqJnKg+hFQ22Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68376397"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="68376397"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:48:46 -0800
X-CSE-ConnectionGUID: rA39JLW9R1O57ZaRo/y+0w==
X-CSE-MsgGUID: vSsklKn2SkSxBjIyQbDzdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="223120777"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 15:48:44 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXpdq-000000001EX-1cF6;
	Mon, 22 Dec 2025 23:48:42 +0000
Date: Tue, 23 Dec 2025 07:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] NFSD: Add asynchronous write throttling support
Message-ID: <202512230750.htK4fXlz-lkp@intel.com>
References: <20251219141105.1247093-3-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219141105.1247093-3-cel@kernel.org>

Hi Chuck,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on brauner-vfs/vfs.all]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[cannot apply to hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Add-aggressive-write-throttling-control/20251219-221859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251219141105.1247093-3-cel%40kernel.org
patch subject: [RFC PATCH 2/2] NFSD: Add asynchronous write throttling support
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20251223/202512230750.htK4fXlz-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230750.htK4fXlz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512230750.htK4fXlz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/vfs.c:1490:4: error: 'break' statement not in loop or switch statement
    1490 |                         break;
         |                         ^
   1 error generated.


vim +/break +1490 fs/nfsd/vfs.c

  1389	
  1390	/**
  1391	 * nfsd_vfs_write - write data to an already-open file
  1392	 * @rqstp: RPC execution context
  1393	 * @fhp: File handle of file to write into
  1394	 * @nf: An open file matching @fhp
  1395	 * @offset: Byte offset of start
  1396	 * @payload: xdr_buf containing the write payload
  1397	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
  1398	 * @stable: An NFS stable_how value
  1399	 * @verf: NFS WRITE verifier
  1400	 *
  1401	 * Upon return, caller must invoke fh_put on @fhp.
  1402	 *
  1403	 * Return values:
  1404	 *   An nfsstat value in network byte order.
  1405	 */
  1406	__be32
  1407	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1408		       struct nfsd_file *nf, loff_t offset,
  1409		       const struct xdr_buf *payload, unsigned long *cnt,
  1410		       int stable, __be32 *verf)
  1411	{
  1412		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
  1413		struct file		*file = nf->nf_file;
  1414		struct super_block	*sb = file_inode(file)->i_sb;
  1415		struct kiocb		kiocb;
  1416		struct svc_export	*exp;
  1417		struct iov_iter		iter;
  1418		errseq_t		since;
  1419		__be32			nfserr;
  1420		int			host_err;
  1421		unsigned long		exp_op_flags = 0;
  1422		unsigned int		pflags = current->flags;
  1423		bool			restore_flags = false;
  1424		unsigned int		nvecs;
  1425		int			saved_nr_dirtied_pause = 0;
  1426		bool			throttle_adjusted = false;
  1427	
  1428		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
  1429	
  1430		if (sb->s_export_op)
  1431			exp_op_flags = sb->s_export_op->flags;
  1432	
  1433		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
  1434		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
  1435			/*
  1436			 * We want throttling in balance_dirty_pages()
  1437			 * and shrink_inactive_list() to only consider
  1438			 * the backingdev we are writing to, so that nfs to
  1439			 * localhost doesn't cause nfsd to lock up due to all
  1440			 * the client's dirty pages or its congested queue.
  1441			 */
  1442			current->flags |= PF_LOCAL_THROTTLE;
  1443			restore_flags = true;
  1444		}
  1445	
  1446		exp = fhp->fh_export;
  1447	
  1448		/*
  1449		 * If aggressive write throttling is enabled, reduce the per-task
  1450		 * dirty page limit to throttle NFSD writes more aggressively.
  1451		 * This helps prevent memory exhaustion when fast network clients
  1452		 * overwhelm slow storage.
  1453		 */
  1454		if (nfsd_aggressive_write_throttle) {
  1455			saved_nr_dirtied_pause = current->nr_dirtied_pause;
  1456			current->nr_dirtied_pause = NFSD_AGGRESSIVE_DIRTY_LIMIT;
  1457			throttle_adjusted = true;
  1458		}
  1459	
  1460		if (!EX_ISSYNC(exp))
  1461			stable = NFS_UNSTABLE;
  1462		init_sync_kiocb(&kiocb, file);
  1463		kiocb.ki_pos = offset;
  1464		if (likely(!fhp->fh_use_wgather)) {
  1465			switch (stable) {
  1466			case NFS_FILE_SYNC:
  1467				/* persist data and timestamps */
  1468				kiocb.ki_flags |= IOCB_DSYNC | IOCB_SYNC;
  1469				break;
  1470			case NFS_DATA_SYNC:
  1471				/* persist data only */
  1472				kiocb.ki_flags |= IOCB_DSYNC;
  1473				break;
  1474			}
  1475		}
  1476	
  1477		/*
  1478		 * If async throttling is enabled, check memory pressure
  1479		 * before attempting buffered writes. Return -EAGAIN if
  1480		 * the system is low on memory, allowing NFSD to return
  1481		 * an NFS error code asking the client to retry later.
  1482		 *
  1483		 * Skip this for NFSv2 since it lacks NFSERR_JUKEBOX.
  1484		 */
  1485		if (nfsd_async_write_throttle && rqstp->rq_vers >= 3) {
  1486			host_err =
  1487				balance_dirty_pages_ratelimited_flags(file->f_mapping,
  1488								      BDP_ASYNC);
  1489			if (host_err == -EAGAIN)
> 1490				break;
  1491		}
  1492	
  1493		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
  1494	
  1495		since = READ_ONCE(file->f_wb_err);
  1496		if (verf)
  1497			nfsd_copy_write_verifier(verf, nn);
  1498	
  1499		switch (nfsd_io_cache_write) {
  1500		case NFSD_IO_DIRECT:
  1501			host_err = nfsd_direct_write(rqstp, fhp, nf, nvecs,
  1502						     cnt, &kiocb);
  1503			break;
  1504		case NFSD_IO_DONTCACHE:
  1505			if (file->f_op->fop_flags & FOP_DONTCACHE)
  1506				kiocb.ki_flags |= IOCB_DONTCACHE;
  1507			fallthrough;
  1508		case NFSD_IO_BUFFERED:
  1509			iov_iter_bvec(&iter, ITER_SOURCE, rqstp->rq_bvec, nvecs, *cnt);
  1510			host_err = vfs_iocb_iter_write(file, &kiocb, &iter);
  1511			if (host_err < 0)
  1512				break;
  1513			*cnt = host_err;
  1514			break;
  1515		}
  1516		if (host_err < 0) {
  1517			commit_reset_write_verifier(nn, rqstp, host_err);
  1518			goto out_nfserr;
  1519		}
  1520		nfsd_stats_io_write_add(nn, exp, *cnt);
  1521		fsnotify_modify(file);
  1522		host_err = filemap_check_wb_err(file->f_mapping, since);
  1523		if (host_err < 0)
  1524			goto out_nfserr;
  1525	
  1526		if (stable && fhp->fh_use_wgather) {
  1527			host_err = wait_for_concurrent_writes(file);
  1528			if (host_err < 0)
  1529				commit_reset_write_verifier(nn, rqstp, host_err);
  1530		}
  1531	
  1532	out_nfserr:
  1533		if (host_err >= 0) {
  1534			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
  1535			nfserr = nfs_ok;
  1536		} else {
  1537			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
  1538			nfserr = nfserrno(host_err);
  1539		}
  1540		if (throttle_adjusted)
  1541			current->nr_dirtied_pause = saved_nr_dirtied_pause;
  1542		if (restore_flags)
  1543			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
  1544		return nfserr;
  1545	}
  1546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
