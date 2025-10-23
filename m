Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E3533C517;
	Thu, 23 Oct 2025 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761238782; cv=none; b=Jiyf0KMiZP5Nzu/ZAM8jv/PfvcJ57KVgG5haBdckbZNJdx21gVxS8TCb1uDvEqQpKGOXEsdPzl8NDGcjmQvt4le5P9fnPG0u3Z9qsVjpPyTUfvq/qUqJJye3UvNAUVMgxFFyY8HDAn6lIZNPv/vNrJdorIyXAu1P7/Ar7rOIVh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761238782; c=relaxed/simple;
	bh=JpitAggjPqEj9SsuNnTD5zAVFudZlevCcIYTARw3ONE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwUI3k3DTRY7w1vkRse3YV+S9qz44xOg47wWeeXUpUWXTLPwH4c5d8lrJpwk87KRgZRvMoWO57u07myvETcTgBl45UATuvWZTKvL1pOYpK4JYNp4wEevmByXPX3BD/UgmD4m6p3c2+DrG8+MguPvtMHfo6IJTBLHV0f5WXO4P3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgfGfkHj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgfGfkHj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761238781; x=1792774781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JpitAggjPqEj9SsuNnTD5zAVFudZlevCcIYTARw3ONE=;
  b=MgfGfkHjyuUYtJMJAGpPkIN6EsKdHhuW2CAjW7d0haEoTfRoonIiAHOX
   ajp/EMS0LPqfTHnaKy7Vsmy6TjjRIt8rgj5A4arlNmtABf1uwGgYR+ulK
   HAnyafCjk06Jn09o/qr/ZMl/UtgvwkNfuQfKHLhRvxIsPXAtvr438poM3
   FUsPWa9ZwqjOWyNPNlM4ApxLpxst+xTC6vf00jMct2pXpmDGzvxWya6hl
   R608dNU2w6xChm9BDOxqz5tnr2gcZJ8EFVB4YUgYBWX60NT1Q3GjqUPzU
   EAj0SV+5YZbX7p8NIJc/Ek45+ZKM0maVsPCB9olcXxmSClBeKPupoA8FE
   A==;
X-CSE-ConnectionGUID: phyf3jnfSDKvxxe0Ybk4fw==
X-CSE-MsgGUID: +4iZXfFpRaOY7CKKqMia1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63510710"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="63510710"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 09:59:40 -0700
X-CSE-ConnectionGUID: j/ED2zgbTBm0OKhNt/DOqA==
X-CSE-MsgGUID: ajT7RLHEQz+9DMubz7qv4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="215128555"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2025 09:59:38 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vByez-000Dhx-0T;
	Thu, 23 Oct 2025 16:59:34 +0000
Date: Fri, 24 Oct 2025 00:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6 4/5] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
Message-ID: <202510240000.N3pmuJua-lkp@intel.com>
References: <20251022192208.1682-5-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022192208.1682-5-cel@kernel.org>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18-rc2]
[also build test ERROR on linus/master next-20251023]
[cannot apply to trondmy-nfs/linux-next brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Make-FILE_SYNC-WRITEs-comply-with-spec/20251023-032319
base:   v6.18-rc2
patch link:    https://lore.kernel.org/r/20251022192208.1682-5-cel%40kernel.org
patch subject: [PATCH v6 4/5] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251024/202510240000.N3pmuJua-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240000.N3pmuJua-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240000.N3pmuJua-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/vfs.c:1434:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
    1434 |         case NFSD_IO_DIRECT:
         |              ^
   1 error generated.
--
>> fs/nfsd/debugfs.c:109:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
     109 |         case NFSD_IO_DIRECT:
         |              ^
   1 error generated.


vim +/NFSD_IO_DIRECT +1434 fs/nfsd/vfs.c

  1359	
  1360	/**
  1361	 * nfsd_vfs_write - write data to an already-open file
  1362	 * @rqstp: RPC execution context
  1363	 * @fhp: File handle of file to write into
  1364	 * @nf: An open file matching @fhp
  1365	 * @offset: Byte offset of start
  1366	 * @payload: xdr_buf containing the write payload
  1367	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
  1368	 * @stable_how: IN: Client's requested stable_how, OUT: Actual stable_how
  1369	 * @verf: NFS WRITE verifier
  1370	 *
  1371	 * Upon return, caller must invoke fh_put on @fhp.
  1372	 *
  1373	 * Return values:
  1374	 *   An nfsstat value in network byte order.
  1375	 */
  1376	__be32
  1377	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1378		       struct nfsd_file *nf, loff_t offset,
  1379		       const struct xdr_buf *payload, unsigned long *cnt,
  1380		       u32 *stable_how, __be32 *verf)
  1381	{
  1382		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
  1383		struct file		*file = nf->nf_file;
  1384		struct super_block	*sb = file_inode(file)->i_sb;
  1385		u32			stable = *stable_how;
  1386		struct kiocb		kiocb;
  1387		struct svc_export	*exp;
  1388		errseq_t		since;
  1389		__be32			nfserr;
  1390		int			host_err;
  1391		unsigned long		exp_op_flags = 0;
  1392		unsigned int		pflags = current->flags;
  1393		bool			restore_flags = false;
  1394		unsigned int		nvecs;
  1395	
  1396		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
  1397	
  1398		if (sb->s_export_op)
  1399			exp_op_flags = sb->s_export_op->flags;
  1400	
  1401		/* cel: UNSTABLE buffered WRITEs might want some form of throttling
  1402		 *	as well to prevent clients from pushing writes to us faster
  1403		 *	than they can be flushed onto durable storage */
  1404		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
  1405		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
  1406			/*
  1407			 * We want throttling in balance_dirty_pages()
  1408			 * and shrink_inactive_list() to only consider
  1409			 * the backingdev we are writing to, so that nfs to
  1410			 * localhost doesn't cause nfsd to lock up due to all
  1411			 * the client's dirty pages or its congested queue.
  1412			 */
  1413			current->flags |= PF_LOCAL_THROTTLE;
  1414			restore_flags = true;
  1415		}
  1416	
  1417		exp = fhp->fh_export;
  1418	
  1419		if (!EX_ISSYNC(exp))
  1420			stable = NFS_UNSTABLE;
  1421		init_sync_kiocb(&kiocb, file);
  1422		kiocb.ki_pos = offset;
  1423		if (stable && !fhp->fh_use_wgather)
  1424			kiocb.ki_flags |=
  1425				(stable == NFS_FILE_SYNC ? IOCB_SYNC : IOCB_DSYNC);
  1426	
  1427		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
  1428	
  1429		since = READ_ONCE(file->f_wb_err);
  1430		if (verf)
  1431			nfsd_copy_write_verifier(verf, nn);
  1432	
  1433		switch (nfsd_io_cache_write) {
> 1434		case NFSD_IO_DIRECT:
  1435			host_err = nfsd_direct_write(rqstp, fhp, nf, nvecs, cnt,
  1436						     &kiocb);
  1437			stable = *stable_how = NFS_FILE_SYNC;
  1438			break;
  1439		case NFSD_IO_DONTCACHE:
  1440			if (file->f_op->fop_flags & FOP_DONTCACHE)
  1441				kiocb.ki_flags |= IOCB_DONTCACHE;
  1442			fallthrough;
  1443		case NFSD_IO_BUFFERED:
  1444			host_err = nfsd_iocb_write(rqstp, file, nvecs, cnt, &kiocb);
  1445			break;
  1446		}
  1447		if (host_err < 0) {
  1448			commit_reset_write_verifier(nn, rqstp, host_err);
  1449			goto out_nfserr;
  1450		}
  1451		nfsd_stats_io_write_add(nn, exp, *cnt);
  1452		fsnotify_modify(file);
  1453		host_err = filemap_check_wb_err(file->f_mapping, since);
  1454		if (host_err < 0)
  1455			goto out_nfserr;
  1456	
  1457		if (stable && fhp->fh_use_wgather) {
  1458			host_err = wait_for_concurrent_writes(file);
  1459			if (host_err < 0)
  1460				commit_reset_write_verifier(nn, rqstp, host_err);
  1461		}
  1462	
  1463	out_nfserr:
  1464		if (host_err >= 0) {
  1465			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
  1466			nfserr = nfs_ok;
  1467		} else {
  1468			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
  1469			nfserr = nfserrno(host_err);
  1470		}
  1471		if (restore_flags)
  1472			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
  1473		return nfserr;
  1474	}
  1475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
