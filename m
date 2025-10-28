Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CEB358D3D;
	Tue, 28 Oct 2025 22:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761692232; cv=none; b=B+YWFU0Z57GyUKxJX7tsxKcZZEkSouOJUpxEGbWPuFZ2rRYN1s9DNmM3rWXJP7qvKMKEpUZSRtCyYbod/7TAyWQIE+BayLaT/JdTfQvbgudqUt8ZZY+J+S62pciFlg67GWDuNBPcby+IKibGTrSydfK8jboBiBp2Lu+dLsgJfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761692232; c=relaxed/simple;
	bh=CSR3m+Q2NDhnwH8tqDUdqfQf6sR8ihLl6WTLzmRiUTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oMfTOD5zoE5nWeYX1hAj+9AarjqxDITAlvaQVJdYad0uUD+2sEI6go2zm+w3jCeDb58pQeqz6lnFQh8jKX9qCTM4ejThc5XNwbXo41uU8MXWTOHGVngCUzl3lX2Tpjx3CVZpe5SnZnKvnMxqN5VelIsnBtqKATfc07Qzy1F+Dbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CvnNMbRX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CvnNMbRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761692230; x=1793228230;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CSR3m+Q2NDhnwH8tqDUdqfQf6sR8ihLl6WTLzmRiUTw=;
  b=CvnNMbRX2skv8mMSNrELBi+T9hBVUkgwjHyY11ARCrJj/iPN2fUYw+ct
   o+saw6z/D2JI2qBVk7CYhgzC6ejCYxbG2wdvSDzxO8EcGyGhh5Cp5hxDG
   LUxiEDziWngWPfK9CCzmuqgrzX9HAwKu6h2aSXVdQ3ChfqFCioECRp82e
   ewynf3LLSi2x8HVR0Zzmm2a7mnxikq1DgVLhpPHExZKnr1Xgs7QwIzXjA
   BMQZQbygQypyH5tej8hZD0gEwLppthKturA8dc8pDRsQ62VLNa1Hdkyjt
   9R7Kmr9Zt7UbDOq3PaGOmbBOZImCQPVPmjocV5H6WrpeW1Hdqj1LLbAMM
   Q==;
X-CSE-ConnectionGUID: K7CZjYKsSRqTwz11GhuSSQ==
X-CSE-MsgGUID: AwSkWVCQT1iqrpT0bzB7NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63691058"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63691058"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 15:57:09 -0700
X-CSE-ConnectionGUID: fHdEuQcsRFCi00TsuHBxPw==
X-CSE-MsgGUID: EF4H3VJnQ0Km+dlJdAHt4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185821752"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2025 15:57:08 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDscd-000JqT-0R;
	Tue, 28 Oct 2025 22:57:00 +0000
Date: Wed, 29 Oct 2025 06:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <cel@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 03/12] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
Message-ID: <202510290603.8VO4qUQT-lkp@intel.com>
References: <20251027154630.1774-4-cel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027154630.1774-4-cel@kernel.org>

Hi Chuck,

kernel test robot noticed the following build errors:

[auto build test ERROR on v6.18-rc3]
[also build test ERROR on linus/master next-20251028]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Make-FILE_SYNC-WRITEs-comply-with-spec/20251028-000506
base:   v6.18-rc3
patch link:    https://lore.kernel.org/r/20251027154630.1774-4-cel%40kernel.org
patch subject: [PATCH v8 03/12] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251029/202510290603.8VO4qUQT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290603.8VO4qUQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290603.8VO4qUQT-lkp@intel.com/

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

  1374	
  1375	/**
  1376	 * nfsd_vfs_write - write data to an already-open file
  1377	 * @rqstp: RPC execution context
  1378	 * @fhp: File handle of file to write into
  1379	 * @nf: An open file matching @fhp
  1380	 * @offset: Byte offset of start
  1381	 * @payload: xdr_buf containing the write payload
  1382	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
  1383	 * @stable_how: IN: Client's requested stable_how, OUT: Actual stable_how
  1384	 * @verf: NFS WRITE verifier
  1385	 *
  1386	 * Upon return, caller must invoke fh_put on @fhp.
  1387	 *
  1388	 * Return values:
  1389	 *   An nfsstat value in network byte order.
  1390	 */
  1391	__be32
  1392	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
  1393		       struct nfsd_file *nf, loff_t offset,
  1394		       const struct xdr_buf *payload, unsigned long *cnt,
  1395		       u32 *stable_how, __be32 *verf)
  1396	{
  1397		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
  1398		struct file		*file = nf->nf_file;
  1399		struct super_block	*sb = file_inode(file)->i_sb;
  1400		u32			stable = *stable_how;
  1401		struct kiocb		kiocb;
  1402		struct svc_export	*exp;
  1403		errseq_t		since;
  1404		__be32			nfserr;
  1405		int			host_err;
  1406		unsigned long		exp_op_flags = 0;
  1407		unsigned int		pflags = current->flags;
  1408		bool			restore_flags = false;
  1409		unsigned int		nvecs;
  1410	
  1411		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
  1412	
  1413		if (sb->s_export_op)
  1414			exp_op_flags = sb->s_export_op->flags;
  1415	
  1416		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
  1417		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
  1418			/*
  1419			 * We want throttling in balance_dirty_pages()
  1420			 * and shrink_inactive_list() to only consider
  1421			 * the backingdev we are writing to, so that nfs to
  1422			 * localhost doesn't cause nfsd to lock up due to all
  1423			 * the client's dirty pages or its congested queue.
  1424			 */
  1425			current->flags |= PF_LOCAL_THROTTLE;
  1426			restore_flags = true;
  1427		}
  1428	
  1429		exp = fhp->fh_export;
  1430	
  1431		if (!EX_ISSYNC(exp))
  1432			stable = NFS_UNSTABLE;
  1433		init_sync_kiocb(&kiocb, file);
  1434		kiocb.ki_pos = offset;
  1435		if (likely(!fhp->fh_use_wgather)) {
  1436			switch (stable) {
  1437			case NFS_FILE_SYNC:
  1438				/* persist data and timestamps */
  1439				kiocb.ki_flags |= IOCB_DSYNC | IOCB_SYNC;
  1440				break;
  1441			case NFS_DATA_SYNC:
  1442				/* persist data only */
  1443				kiocb.ki_flags |= IOCB_DSYNC;
  1444				break;
  1445			}
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
  1463			fallthrough; /* must call nfsd_buffered_write */
  1464		case NFSD_IO_BUFFERED:
  1465			host_err = nfsd_buffered_write(rqstp, file,
  1466						       nvecs, cnt, &kiocb);
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
