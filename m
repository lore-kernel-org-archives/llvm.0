Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820B7126BF7;
	Wed, 29 Oct 2025 14:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761747048; cv=none; b=SguFP0pSOI304Xk00NwjBiscLWwA5GO2EcBpD4bv9LIdtRSHCCIcj6cheHCyqOkKvuvCZphZGR1xUj6U3tXqEUk8FvTqFEiDpK3WX7dIXxMysscLie3NP5OvEl+Jegn/LYaKspcBYJyP+mhh93EnaCli7fcGsBVtlKXr+E4XDl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761747048; c=relaxed/simple;
	bh=izFbWpfi4oA+7CsZmHSjcf6NziJSv/swGMHcyYEr8ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWlL8YvxL8fNdtTaNPKNB9dmiOafq9Q/DibcrCmhDswyXgW8T8CbBJ9mgkzElvTyW411ZIH+vl3wD/Wnbz7RS30+B3JylC+y9Bmy3pubOJnYnvk3imRB6kdvOaC2AGot+x7j2GkM/mOZ4RPDsfPbqq62VND9G1XLOehFsFzSfmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UDOwTF/V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UDOwTF/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7C42C4CEF7;
	Wed, 29 Oct 2025 14:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761747048;
	bh=izFbWpfi4oA+7CsZmHSjcf6NziJSv/swGMHcyYEr8ts=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UDOwTF/VV8P4MkwI52F85YqTOGFLm7srWVG/V0hi8H2aNdJbS/Fv6sjZUrSFfxmKQ
	 au6JL7ayUSJHBeD5UBl7NXLyZWOrZRmxCQMQOd23mANJ9TJdRT/vAbkWz/FjnrwRjR
	 Ol5eQ3/Rb73MWZPLwADX/I7Su7d7SPTqXunU9i7n16WTXYv5k6/dIk5lJ2BVk/9G8u
	 FFZSPMHKoZR9a7FcEjd1s9+euZ9o8AsVwPrFu0mSplPS3gz+F2ORPK9XadJAFw5ICO
	 UzcCnz2YX05c8XmxobX3l5pCu5BcNdIUDArSqHAMeKTE5LbpKkgMhCYcn7JA/LE4y8
	 WZnSWsHo+vfIQ==
Message-ID: <d45fdc26-ebdd-4515-a15d-6a9302ca965d@kernel.org>
Date: Wed, 29 Oct 2025 10:10:46 -0400
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/12] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <20251027154630.1774-4-cel@kernel.org>
 <202510290603.8VO4qUQT-lkp@intel.com>
Content-Language: en-US
From: Chuck Lever <cel@kernel.org>
Organization: kernel.org
In-Reply-To: <202510290603.8VO4qUQT-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/28/25 6:56 PM, kernel test robot wrote:
> Hi Chuck,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on v6.18-rc3]
> [also build test ERROR on linus/master next-20251028]
> [cannot apply to brauner-vfs/vfs.all]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Chuck-Lever/NFSD-Make-FILE_SYNC-WRITEs-comply-with-spec/20251028-000506
> base:   v6.18-rc3
> patch link:    https://lore.kernel.org/r/20251027154630.1774-4-cel%40kernel.org
> patch subject: [PATCH v8 03/12] NFSD: Implement NFSD_IO_DIRECT for NFS WRITE
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251029/202510290603.8VO4qUQT-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290603.8VO4qUQT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510290603.8VO4qUQT-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> fs/nfsd/vfs.c:1455:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
>     1455 |         case NFSD_IO_DIRECT:
>          |              ^
>    1 error generated.
> --
>>> fs/nfsd/debugfs.c:109:7: error: use of undeclared identifier 'NFSD_IO_DIRECT'
>      109 |         case NFSD_IO_DIRECT:
>          |              ^
>    1 error generated.
> 
> 
> vim +/NFSD_IO_DIRECT +1455 fs/nfsd/vfs.c

I'm truly at a loss. Why is the robot attempting to apply this patch
to a tree that does not also have 46c42fad83f5 ("NFSD: Implement
NFSD_IO_DIRECT for NFS READ")? These patches are in the same branch.


>   1374	
>   1375	/**
>   1376	 * nfsd_vfs_write - write data to an already-open file
>   1377	 * @rqstp: RPC execution context
>   1378	 * @fhp: File handle of file to write into
>   1379	 * @nf: An open file matching @fhp
>   1380	 * @offset: Byte offset of start
>   1381	 * @payload: xdr_buf containing the write payload
>   1382	 * @cnt: IN: number of bytes to write, OUT: number of bytes actually written
>   1383	 * @stable_how: IN: Client's requested stable_how, OUT: Actual stable_how
>   1384	 * @verf: NFS WRITE verifier
>   1385	 *
>   1386	 * Upon return, caller must invoke fh_put on @fhp.
>   1387	 *
>   1388	 * Return values:
>   1389	 *   An nfsstat value in network byte order.
>   1390	 */
>   1391	__be32
>   1392	nfsd_vfs_write(struct svc_rqst *rqstp, struct svc_fh *fhp,
>   1393		       struct nfsd_file *nf, loff_t offset,
>   1394		       const struct xdr_buf *payload, unsigned long *cnt,
>   1395		       u32 *stable_how, __be32 *verf)
>   1396	{
>   1397		struct nfsd_net		*nn = net_generic(SVC_NET(rqstp), nfsd_net_id);
>   1398		struct file		*file = nf->nf_file;
>   1399		struct super_block	*sb = file_inode(file)->i_sb;
>   1400		u32			stable = *stable_how;
>   1401		struct kiocb		kiocb;
>   1402		struct svc_export	*exp;
>   1403		errseq_t		since;
>   1404		__be32			nfserr;
>   1405		int			host_err;
>   1406		unsigned long		exp_op_flags = 0;
>   1407		unsigned int		pflags = current->flags;
>   1408		bool			restore_flags = false;
>   1409		unsigned int		nvecs;
>   1410	
>   1411		trace_nfsd_write_opened(rqstp, fhp, offset, *cnt);
>   1412	
>   1413		if (sb->s_export_op)
>   1414			exp_op_flags = sb->s_export_op->flags;
>   1415	
>   1416		if (test_bit(RQ_LOCAL, &rqstp->rq_flags) &&
>   1417		    !(exp_op_flags & EXPORT_OP_REMOTE_FS)) {
>   1418			/*
>   1419			 * We want throttling in balance_dirty_pages()
>   1420			 * and shrink_inactive_list() to only consider
>   1421			 * the backingdev we are writing to, so that nfs to
>   1422			 * localhost doesn't cause nfsd to lock up due to all
>   1423			 * the client's dirty pages or its congested queue.
>   1424			 */
>   1425			current->flags |= PF_LOCAL_THROTTLE;
>   1426			restore_flags = true;
>   1427		}
>   1428	
>   1429		exp = fhp->fh_export;
>   1430	
>   1431		if (!EX_ISSYNC(exp))
>   1432			stable = NFS_UNSTABLE;
>   1433		init_sync_kiocb(&kiocb, file);
>   1434		kiocb.ki_pos = offset;
>   1435		if (likely(!fhp->fh_use_wgather)) {
>   1436			switch (stable) {
>   1437			case NFS_FILE_SYNC:
>   1438				/* persist data and timestamps */
>   1439				kiocb.ki_flags |= IOCB_DSYNC | IOCB_SYNC;
>   1440				break;
>   1441			case NFS_DATA_SYNC:
>   1442				/* persist data only */
>   1443				kiocb.ki_flags |= IOCB_DSYNC;
>   1444				break;
>   1445			}
>   1446		}
>   1447	
>   1448		nvecs = xdr_buf_to_bvec(rqstp->rq_bvec, rqstp->rq_maxpages, payload);
>   1449	
>   1450		since = READ_ONCE(file->f_wb_err);
>   1451		if (verf)
>   1452			nfsd_copy_write_verifier(verf, nn);
>   1453	
>   1454		switch (nfsd_io_cache_write) {
>> 1455		case NFSD_IO_DIRECT:
>   1456			host_err = nfsd_direct_write(rqstp, fhp, nf, stable_how,
>   1457						     nvecs, cnt, &kiocb);
>   1458			stable = *stable_how;
>   1459			break;
>   1460		case NFSD_IO_DONTCACHE:
>   1461			if (file->f_op->fop_flags & FOP_DONTCACHE)
>   1462				kiocb.ki_flags |= IOCB_DONTCACHE;
>   1463			fallthrough; /* must call nfsd_buffered_write */
>   1464		case NFSD_IO_BUFFERED:
>   1465			host_err = nfsd_buffered_write(rqstp, file,
>   1466						       nvecs, cnt, &kiocb);
>   1467			break;
>   1468		}
>   1469		if (host_err < 0) {
>   1470			commit_reset_write_verifier(nn, rqstp, host_err);
>   1471			goto out_nfserr;
>   1472		}
>   1473		nfsd_stats_io_write_add(nn, exp, *cnt);
>   1474		fsnotify_modify(file);
>   1475		host_err = filemap_check_wb_err(file->f_mapping, since);
>   1476		if (host_err < 0)
>   1477			goto out_nfserr;
>   1478	
>   1479		if (stable && fhp->fh_use_wgather) {
>   1480			host_err = wait_for_concurrent_writes(file);
>   1481			if (host_err < 0)
>   1482				commit_reset_write_verifier(nn, rqstp, host_err);
>   1483		}
>   1484	
>   1485	out_nfserr:
>   1486		if (host_err >= 0) {
>   1487			trace_nfsd_write_io_done(rqstp, fhp, offset, *cnt);
>   1488			nfserr = nfs_ok;
>   1489		} else {
>   1490			trace_nfsd_write_err(rqstp, fhp, offset, host_err);
>   1491			nfserr = nfserrno(host_err);
>   1492		}
>   1493		if (restore_flags)
>   1494			current_restore_flags(pflags, PF_LOCAL_THROTTLE);
>   1495		return nfserr;
>   1496	}
>   1497	
> 


-- 
Chuck Lever
