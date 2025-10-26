Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE0249659;
	Sun, 26 Oct 2025 01:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761441418; cv=none; b=X/LR8toanLTnUmJnC5LAsrCYkyP3+yLh+2kMQN9bpD/nxtQKE2gPLYLaE7ODqonD014euHA2JQQ8ANmpWDq0hWfYHeDt76G/0+6qOwpoMF1yQHh3EvxIXBuar0DBoCA4vMVbvGG5kzaGz0h5iMHejYl+GCxpHquKySTfBVxLDKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761441418; c=relaxed/simple;
	bh=MLYlLWyr6dO+miN2J53bF3I67phuG7akpaw2lXgD/ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pU7LcOCnpYLO25WVLFA3Pio8btLipDnKSoDyyYFvdWcnNyf52+D02INGdRpZ4vMA6pzlcCffMDnkh3PAzUkwMeo59QI9Aay30gziwhfq9OHhcAtuHuZofq0y9M9rAC14JhP5LfWyn+MrvO2zOyiFhMPv/gYKhj8441Kq3Qfbd4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3PXW2X8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3PXW2X8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761441417; x=1792977417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MLYlLWyr6dO+miN2J53bF3I67phuG7akpaw2lXgD/ao=;
  b=V3PXW2X8YEvsAi9R3P37QYtV58nxqHB3R/5kOdt+Oq9O2wqqWpvY7MPc
   519ssHKwzGlVttw7wqnxhvG38FAou8hL1jGVHlGP11zY4gLqrUjAXAX2y
   xy2vNolZuYW+7/q293T+QnW1YBoSInFvCV/vNjxY3Kr3ZhOixczDYeaFN
   zz9QsPkVLdZu4Nh2W9eLl0whc4CRXncnn+Ry6O4421JunrZ45YkIIynym
   AoPMIHiCUkLpqFil4f1v3tVceHa7Xn9nTWBuB8XIqhdQ0WgFlYDv5iRqa
   cNdL674FIkNU+n74pxieWwsUt4rMHtstFl8nndKgSGf8rB+OtaqQlCfR4
   A==;
X-CSE-ConnectionGUID: Ivykeu1TTpmRuJSVYbrNmg==
X-CSE-MsgGUID: xrnbJ4F5QQWHgasAOABO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63605947"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63605947"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 18:16:56 -0700
X-CSE-ConnectionGUID: GsrWzCXzR5yj1gyER6wjcw==
X-CSE-MsgGUID: YF2Mk4O/SYe67WkSxR6Quw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185093899"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 25 Oct 2025 18:16:55 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCpNN-000Flt-0f;
	Sun, 26 Oct 2025 01:16:53 +0000
Date: Sun, 26 Oct 2025 09:16:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 04/14] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
Message-ID: <202510260920.HUFBtu3X-lkp@intel.com>
References: <20251024144306.35652-5-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024144306.35652-5-cel@kernel.org>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18-rc2]
[also build test ERROR on linus/master next-20251024]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Make-FILE_SYNC-WRITEs-comply-with-spec/20251024-224529
base:   v6.18-rc2
patch link:    https://lore.kernel.org/r/20251024144306.35652-5-cel%40kernel.org
patch subject: [PATCH v7 04/14] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251026/202510260920.HUFBtu3X-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260920.HUFBtu3X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260920.HUFBtu3X-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/vfs.c:1455:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
    1455 |         case NFSD_IO_DIRECT:
         |              ^
   1 error generated.
--
>> fs/nfsd/debugfs.c:109:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
     109 |         case NFSD_IO_DIRECT:
         |              ^
   1 error generated.


vim +/NFSD_IO_DIRECT +1455 fs/nfsd/vfs.c

  1378	
  1379	/**
  1380	 * nfsd_vfs_write - write data to an already-open file
  1381	 * @rqstp: RPC execution context
  1382	 * @fhp: File handle of file to write into
  1383	 * @nf: An open file matching @fhp
  1384	 * @offset: Byte offset of start
  1385	 * @payload: xdr_buf containing the write payload
  1386	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
  1387	 * @stable_how: IN: Client's requested stable_how, OUT: Actual stable_how
  1388	 * @verf: NFS WRITE verifier
  1389	 *
  1390	 * Upon return, caller must invoke fh_put on @fhp.
  1391	 *
  1392	 * Return values:
  1393	 *   An nfsstat value in network byte order.
  1394	 */
  1395	__be32
  1396	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1397		       struct nfsd_file *nf, loff_t offset,
  1398		       const struct xdr_buf *payload, unsigned long *cnt,
  1399		       u32 *stable_how, __be32 *verf)
  1400	{
  1401		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
  1402		struct file		*file = nf->nf_file;
  1403		struct super_block	*sb = file_inode(file)->i_sb;
  1404		u32			stable = *stable_how;
  1405		struct kiocb		kiocb;
  1406		struct svc_export	*exp;
  1407		errseq_t		since;
  1408		__be32			nfserr;
  1409		int			host_err;
  1410		unsigned long		exp_op_flags = 0;
  1411		unsigned int		pflags = current->flags;
  1412		bool			restore_flags = false;
  1413		unsigned int		nvecs;
  1414	
  1415		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
  1416	
  1417		if (sb->s_export_op)
  1418			exp_op_flags = sb->s_export_op->flags;
  1419	
  1420		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
  1421		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
  1422			/*
  1423			 * We want throttling in balance_dirty_pages()
  1424			 * and shrink_inactive_list() to only consider
  1425			 * the backingdev we are writing to, so that nfs to
  1426			 * localhost doesn't cause nfsd to lock up due to all
  1427			 * the client's dirty pages or its congested queue.
  1428			 */
  1429			current->flags |= PF_LOCAL_THROTTLE;
  1430			restore_flags = true;
  1431		}
  1432	
  1433		exp = fhp->fh_export;
  1434	
  1435		if (!EX_ISSYNC(exp))
  1436			stable = NFS_UNSTABLE;
  1437		init_sync_kiocb(&kiocb, file);
  1438		kiocb.ki_pos = offset;
  1439		if (stable && !fhp->fh_use_wgather) {
  1440			if (stable == NFS_FILE_SYNC)
  1441				/* persist data and timestamps */
  1442				kiocb.ki_flags |= IOCB_DSYNC | IOCB_SYNC;
  1443			else
  1444				/* persist data only */
  1445				kiocb.ki_flags |= IOCB_DSYNC;
  1446		}
  1447	
  1448		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
  1449	
  1450		since = READ_ONCE(file->f_wb_err);
  1451		if (verf)
  1452			nfsd_copy_write_verifier(verf, nn);
  1453	
  1454		switch (nfsd_io_cache_write) {
> 1455		case NFSD_IO_DIRECT:
  1456			host_err = nfsd_direct_write(rqstp, fhp, nf, stable_how,
  1457						     nvecs, cnt, &kiocb);
  1458			stable = *stable_how;
  1459			break;
  1460		case NFSD_IO_DONTCACHE:
  1461			if (file->f_op->fop_flags & FOP_DONTCACHE)
  1462				kiocb.ki_flags |= IOCB_DONTCACHE;
  1463			fallthrough;
  1464		case NFSD_IO_BUFFERED:
  1465			host_err = nfsd_iocb_write(file, rqstp->rq_bvec, nvecs, cnt,
  1466						   &kiocb);
  1467			break;
  1468		}
  1469		if (host_err < 0) {
  1470			commit_reset_write_verifier(nn, rqstp, host_err);
  1471			goto out_nfserr;
  1472		}
  1473		nfsd_stats_io_write_add(nn, exp, *cnt);
  1474		fsnotify_modify(file);
  1475		host_err = filemap_check_wb_err(file->f_mapping, since);
  1476		if (host_err < 0)
  1477			goto out_nfserr;
  1478	
  1479		if (stable && fhp->fh_use_wgather) {
  1480			host_err = wait_for_concurrent_writes(file);
  1481			if (host_err < 0)
  1482				commit_reset_write_verifier(nn, rqstp, host_err);
  1483		}
  1484	
  1485	out_nfserr:
  1486		if (host_err >= 0) {
  1487			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
  1488			nfserr = nfs_ok;
  1489		} else {
  1490			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
  1491			nfserr = nfserrno(host_err);
  1492		}
  1493		if (restore_flags)
  1494			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
  1495		return nfserr;
  1496	}
  1497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
