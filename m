Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79822F4A;
	Sat, 25 Oct 2025 00:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351085; cv=none; b=JeqLzhZY9wNFiDAoGO+IU/4liA5Gt7k18d1tDfO5y9DuKbVu8/lVvXbwRVjZZNrDMWfJA7Gzay0XnvQANQLmY5HC/zdiUiTk/GctP5jQHjXJPA0KGL0bjs8DuZIuC8GWjkLcqQIqHIcl1SnnOAPyHYepgDSqniTZDCB6hhZKGVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351085; c=relaxed/simple;
	bh=LcgycBOxxGz5Qv6zBzWtyh5Xd3898ClG0NOE2qMl4Qs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTeY+q0hk7SzZ2dc0eqcrUsZMhWJ+HLVHeymsQ6+Pkale+YE4CkILjKqPTUvIwzUQJA0Itl6VWQ/ju6k03Wqhluky+sbHgoe3WlVsvBk+is56EoUowWMNcyRiehI6u1qH4xfmhb30Zno3heGQ4Xi4sHHYZz6XBnMZV5zRbY9stM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PYxFxeI+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PYxFxeI+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761351084; x=1792887084;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LcgycBOxxGz5Qv6zBzWtyh5Xd3898ClG0NOE2qMl4Qs=;
  b=PYxFxeI+dCIX36aQrlL38B8nZ1fHZbP8EAPo9C/nm71dVQiF3+TYOIyk
   viyTLX+9dUsxV+39SEGpK8p+XbQZCZmGol13DnwTxN681aGiqvYU3Yl+U
   GgJLPvbBT5+/BnM4uGNefeMgKpq/CJefHILTYaPpeD1uDhCP5cjeA1aRR
   RyYW60ti5uPZAg+5CsjJ+f4rvsl72i7S8G1PY2H11WNrRYy75B0EKTXe4
   ur/JbiYeod/lrGY9fXy7cgjsGAbg3x5Gq2Lo0feLWBbv9A6X5NoUlJ6Pr
   fX43CImq6KtWND70c1ii8Zvgr0stz3D7IcsPCqW73a0ealDDqv4mOKMCz
   Q==;
X-CSE-ConnectionGUID: mlmI8ELPR0uFm3KVJaempQ==
X-CSE-MsgGUID: sqkYUOn/TOGjFGIcObL6Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67398123"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="67398123"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 17:11:23 -0700
X-CSE-ConnectionGUID: OP98ncRkRxusz+A3bw7rwg==
X-CSE-MsgGUID: nWTWiIaKRXOOi/p0NpIVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="188852622"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Oct 2025 17:11:21 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCRsN-000EzF-21;
	Sat, 25 Oct 2025 00:11:19 +0000
Date: Sat, 25 Oct 2025 08:10:45 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/4] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
Message-ID: <202510250840.m9CSsDgA-lkp@intel.com>
References: <20251020162546.5066-4-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020162546.5066-4-cel@kernel.org>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18-rc2]
[also build test ERROR on linus/master next-20251024]
[cannot apply to trondmy-nfs/linux-next brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Enable-return-of-an-updated-stable_how-to-NFS-clients/20251021-002911
base:   v6.18-rc2
patch link:    https://lore.kernel.org/r/20251020162546.5066-4-cel%40kernel.org
patch subject: [PATCH v5 3/4] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251025/202510250840.m9CSsDgA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250840.m9CSsDgA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510250840.m9CSsDgA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/vfs.c:1448:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
    1448 |         case NFSD_IO_DIRECT:
         |              ^
   1 error generated.
--
>> fs/nfsd/debugfs.c:109:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
     109 |         case NFSD_IO_DIRECT:
         |              ^
   1 error generated.


vim +/NFSD_IO_DIRECT +1448 fs/nfsd/vfs.c

  1377	
  1378	/**
  1379	 * nfsd_vfs_write - write data to an already-open file
  1380	 * @rqstp: RPC execution context
  1381	 * @fhp: File handle of file to write into
  1382	 * @nf: An open file matching @fhp
  1383	 * @offset: Byte offset of start
  1384	 * @payload: xdr_buf containing the write payload
  1385	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
  1386	 * @stable_how: IN: Client's requested stable_how, OUT: Actual stable_how
  1387	 * @verf: NFS WRITE verifier
  1388	 *
  1389	 * Upon return, caller must invoke fh_put on @fhp.
  1390	 *
  1391	 * Return values:
  1392	 *   An nfsstat value in network byte order.
  1393	 */
  1394	__be32
  1395	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1396		       struct nfsd_file *nf, loff_t offset,
  1397		       const struct xdr_buf *payload, unsigned long *cnt,
  1398		       u32 *stable_how, __be32 *verf)
  1399	{
  1400		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
  1401		struct file		*file = nf->nf_file;
  1402		struct super_block	*sb = file_inode(file)->i_sb;
  1403		u32			stable = *stable_how;
  1404		struct kiocb		kiocb;
  1405		struct svc_export	*exp;
  1406		errseq_t		since;
  1407		__be32			nfserr;
  1408		int			host_err;
  1409		unsigned long		exp_op_flags = 0;
  1410		unsigned int		pflags = current->flags;
  1411		bool			restore_flags = false;
  1412		unsigned int		nvecs;
  1413	
  1414		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
  1415	
  1416		if (sb->s_export_op)
  1417			exp_op_flags = sb->s_export_op->flags;
  1418	
  1419		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
  1420		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
  1421			/*
  1422			 * We want throttling in balance_dirty_pages()
  1423			 * and shrink_inactive_list() to only consider
  1424			 * the backingdev we are writing to, so that nfs to
  1425			 * localhost doesn't cause nfsd to lock up due to all
  1426			 * the client's dirty pages or its congested queue.
  1427			 */
  1428			current->flags |= PF_LOCAL_THROTTLE;
  1429			restore_flags = true;
  1430		}
  1431	
  1432		exp = fhp->fh_export;
  1433	
  1434		if (!EX_ISSYNC(exp))
  1435			stable = NFS_UNSTABLE;
  1436		init_sync_kiocb(&kiocb, file);
  1437		kiocb.ki_pos = offset;
  1438		if (stable && !fhp->fh_use_wgather)
  1439			kiocb.ki_flags |= IOCB_DSYNC;
  1440	
  1441		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
  1442	
  1443		since = READ_ONCE(file->f_wb_err);
  1444		if (verf)
  1445			nfsd_copy_write_verifier(verf, nn);
  1446	
  1447		switch (nfsd_io_cache_write) {
> 1448		case NFSD_IO_DIRECT:
  1449			host_err = nfsd_direct_write(rqstp, fhp, nf, stable_how,
  1450						     nvecs, cnt, &kiocb);
  1451			stable = *stable_how;
  1452			break;
  1453		case NFSD_IO_DONTCACHE:
  1454			if (file->f_op->fop_flags & FOP_DONTCACHE)
  1455				kiocb.ki_flags |= IOCB_DONTCACHE;
  1456			fallthrough;
  1457		case NFSD_IO_BUFFERED:
  1458			host_err = nfsd_iocb_write(rqstp, file, nvecs, cnt, &kiocb);
  1459			break;
  1460		}
  1461		if (host_err < 0) {
  1462			commit_reset_write_verifier(nn, rqstp, host_err);
  1463			goto out_nfserr;
  1464		}
  1465		nfsd_stats_io_write_add(nn, exp, *cnt);
  1466		fsnotify_modify(file);
  1467		host_err = filemap_check_wb_err(file->f_mapping, since);
  1468		if (host_err < 0)
  1469			goto out_nfserr;
  1470	
  1471		if (stable && fhp->fh_use_wgather) {
  1472			host_err = wait_for_concurrent_writes(file);
  1473			if (host_err < 0)
  1474				commit_reset_write_verifier(nn, rqstp, host_err);
  1475		}
  1476	
  1477	out_nfserr:
  1478		if (host_err >= 0) {
  1479			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
  1480			nfserr = nfs_ok;
  1481		} else {
  1482			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
  1483			nfserr = nfserrno(host_err);
  1484		}
  1485		if (restore_flags)
  1486			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
  1487		return nfserr;
  1488	}
  1489	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
