Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241B829ACF6;
	Mon, 10 Nov 2025 19:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762801289; cv=none; b=u0uh28R3/ROeAziRjtYA0hThzMI76MbHM/zylsiIrBbvO8cymZ4BhthbOkCUqVB4TOCpNbHBT5TrvA77D1n8dUrDUQMW71FNf3C5fZSbt8WKeZHsbrrs6j9FJ+7sksm+wOK+uXyYY1mothC9BVBIeUrZU9t+G0Vtr9Iqjn5cIFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762801289; c=relaxed/simple;
	bh=CWaIyEhjf1bFLxztGrkcgSKwrX59HrKcCZEZgUZmeBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVc/o+r3wkmwtzO7VehRPf/jvE/AmJEye+8dLPxYNRDjs+k0OE+ouJVbtETQu6s8rNCtgi4OUTTMgCz65TT8zjbW4RugpI3klRXhQKVXdX4nuq2pY0wYACzgg7afO928DL+Tcg5ZX9sdvIEkld2G/EfNQLwS1vduKcrLLackBLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fmv0clso; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fmv0clso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762801288; x=1794337288;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CWaIyEhjf1bFLxztGrkcgSKwrX59HrKcCZEZgUZmeBo=;
  b=fmv0clso7nAPmQK8B5/PzDbiTsY9sdM8sitg6jb9Bzcei1A2Yu+JPoXR
   rzOU1+QpSAvSu+zr9bgaLKqZof0sq9WAARkme0kqt0nYFD0OVhpeMXLbp
   o4gX70Dt60XapWl9/mF9KxGigBYN8fcupN4ha2+7YPgEkG76dwxhBmpPV
   mE6/ZPZxgMFSkofJavAOA5WCAMk54NpB3NKx5m1APhKT1A7juaJgCcAOV
   NPQm4UJbB6b6g4mqrVha/xf5OeM6PmIGtWGXV5EeizcUCLOZ7b3Q9txjI
   +TbL3c3z8gjAQmjgWB+jPx1BQklz+euRTqsbv66CdvsB7mBOBShJ13Nz+
   A==;
X-CSE-ConnectionGUID: 5/rSn9zGRXmKE821bjwd7Q==
X-CSE-MsgGUID: GgxLfVMwQPWDq80xIeGVbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64947171"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="64947171"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 11:01:28 -0800
X-CSE-ConnectionGUID: 79D6CX28QCSYbvKKz53pfw==
X-CSE-MsgGUID: U7dUwD7HRlGpw0OQdcjglw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188587285"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2025 11:01:26 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIX8m-0000tT-11;
	Mon, 10 Nov 2025 19:01:24 +0000
Date: Tue, 11 Nov 2025 03:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v10 4/5] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
Message-ID: <202511110228.SZ5Smi4w-lkp@intel.com>
References: <20251105192806.77093-5-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105192806.77093-5-cel@kernel.org>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc5 next-20251110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-don-t-start-nfsd-if-sv_permsocks-is-empty/20251106-033348
base:   linus/master
patch link:    https://lore.kernel.org/r/20251105192806.77093-5-cel%40kernel.org
patch subject: [PATCH v10 4/5] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251111/202511110228.SZ5Smi4w-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110228.SZ5Smi4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110228.SZ5Smi4w-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/vfs.c:1407:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
    1407 |         case NFSD_IO_DIRECT:
         |              ^~~~~~~~~~~~~~
   1 error generated.
--
>> fs/nfsd/debugfs.c:109:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
     109 |         case NFSD_IO_DIRECT:
         |              ^~~~~~~~~~~~~~
   1 error generated.


vim +/NFSD_IO_DIRECT +1407 fs/nfsd/vfs.c

  1325	
  1326	/**
  1327	 * nfsd_vfs_write - write data to an already-open file
  1328	 * @rqstp: RPC execution context
  1329	 * @fhp: File handle of file to write into
  1330	 * @nf: An open file matching @fhp
  1331	 * @offset: Byte offset of start
  1332	 * @payload: xdr_buf containing the write payload
  1333	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
  1334	 * @stable_how: IN: Client's requested stable_how, OUT: Actual stable_how
  1335	 * @verf: NFS WRITE verifier
  1336	 *
  1337	 * Upon return, caller must invoke fh_put on @fhp.
  1338	 *
  1339	 * Return values:
  1340	 *   An nfsstat value in network byte order.
  1341	 */
  1342	__be32
  1343	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1344		       struct nfsd_file *nf, loff_t offset,
  1345		       const struct xdr_buf *payload, unsigned long *cnt,
  1346		       u32 *stable_how, __be32 *verf)
  1347	{
  1348		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
  1349		struct file		*file = nf->nf_file;
  1350		struct super_block	*sb = file_inode(file)->i_sb;
  1351		u32			stable = *stable_how;
  1352		struct kiocb		kiocb;
  1353		struct svc_export	*exp;
  1354		struct iov_iter		iter;
  1355		errseq_t		since;
  1356		__be32			nfserr;
  1357		int			host_err;
  1358		unsigned long		exp_op_flags = 0;
  1359		unsigned int		pflags = current->flags;
  1360		bool			restore_flags = false;
  1361		unsigned int		nvecs;
  1362	
  1363		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
  1364	
  1365		if (sb->s_export_op)
  1366			exp_op_flags = sb->s_export_op->flags;
  1367	
  1368		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
  1369		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
  1370			/*
  1371			 * We want throttling in balance_dirty_pages()
  1372			 * and shrink_inactive_list() to only consider
  1373			 * the backingdev we are writing to, so that nfs to
  1374			 * localhost doesn't cause nfsd to lock up due to all
  1375			 * the client's dirty pages or its congested queue.
  1376			 */
  1377			current->flags |= PF_LOCAL_THROTTLE;
  1378			restore_flags = true;
  1379		}
  1380	
  1381		exp = fhp->fh_export;
  1382	
  1383		if (!EX_ISSYNC(exp))
  1384			stable = NFS_UNSTABLE;
  1385		init_sync_kiocb(&kiocb, file);
  1386		kiocb.ki_pos = offset;
  1387		if (likely(!fhp->fh_use_wgather)) {
  1388			switch (stable) {
  1389			case NFS_FILE_SYNC:
  1390				/* persist data and timestamps */
  1391				kiocb.ki_flags |= IOCB_DSYNC | IOCB_SYNC;
  1392				break;
  1393			case NFS_DATA_SYNC:
  1394				/* persist data only */
  1395				kiocb.ki_flags |= IOCB_DSYNC;
  1396				break;
  1397			}
  1398		}
  1399	
  1400		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
  1401	
  1402		since = READ_ONCE(file->f_wb_err);
  1403		if (verf)
  1404			nfsd_copy_write_verifier(verf, nn);
  1405	
  1406		switch (nfsd_io_cache_write) {
> 1407		case NFSD_IO_DIRECT:
  1408			host_err = nfsd_direct_write(rqstp, fhp, nf, nvecs,
  1409						     cnt, &kiocb);
  1410			break;
  1411		case NFSD_IO_DONTCACHE:
  1412			if (file->f_op->fop_flags & FOP_DONTCACHE)
  1413				kiocb.ki_flags |= IOCB_DONTCACHE;
  1414			fallthrough;
  1415		case NFSD_IO_BUFFERED:
  1416			iov_iter_bvec(&iter, ITER_SOURCE, rqstp->rq_bvec, nvecs, *cnt);
  1417			host_err = vfs_iocb_iter_write(file, &kiocb, &iter);
  1418			if (host_err < 0)
  1419				break;
  1420			*cnt = host_err;
  1421			break;
  1422		}
  1423		if (host_err < 0) {
  1424			commit_reset_write_verifier(nn, rqstp, host_err);
  1425			goto out_nfserr;
  1426		}
  1427		nfsd_stats_io_write_add(nn, exp, *cnt);
  1428		fsnotify_modify(file);
  1429		host_err = filemap_check_wb_err(file->f_mapping, since);
  1430		if (host_err < 0)
  1431			goto out_nfserr;
  1432	
  1433		if (stable && fhp->fh_use_wgather) {
  1434			host_err = wait_for_concurrent_writes(file);
  1435			if (host_err < 0)
  1436				commit_reset_write_verifier(nn, rqstp, host_err);
  1437		}
  1438	
  1439	out_nfserr:
  1440		if (host_err >= 0) {
  1441			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
  1442			nfserr = nfs_ok;
  1443		} else {
  1444			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
  1445			nfserr = nfserrno(host_err);
  1446		}
  1447		if (restore_flags)
  1448			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
  1449		return nfserr;
  1450	}
  1451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
