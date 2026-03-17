Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC153750C7;
	Tue, 17 Mar 2026 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773765032; cv=none; b=YbZgvU5IjlyzV2irxTD2xCuSaZDeXNREJrDQ30PrL0o/xju5Zb9ahA+UYeQ6YZg2Q+U153o7tub0WGksMYALqATMfVeqUsfK0RB3WIJB5QcnJR9GQl8lb0aqeo356AiKfuAHVIG6yvAcRSTwQHfnbjEb/9ppovwQ/PLTQNhi22w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773765032; c=relaxed/simple;
	bh=Qou/yJTuMtB+w2nO+owDGAmULjrywMij+rJMUUrY82o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xy1L2CO51E49SrL8t0Ra8xy9UmBRk9LyCiTzJkcdVd95KUKUulOVwf377Lfx7ugZmhU5c3OvskRvDm67NXbxmC6NiwCniMDz0RnXrh/2bA0x6DusDFrY+bnv48cIDVbBvUSgooFO7WAqzra+5Z3FdYXnVMsi+yg1EytyfpnLKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDOhy/Eh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDOhy/Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773765031; x=1805301031;
  h=date:from:to:cc:subject:message-id;
  bh=Qou/yJTuMtB+w2nO+owDGAmULjrywMij+rJMUUrY82o=;
  b=jDOhy/EhdCMHS8WH+qsHEFqfWi9SQchoWatfx4lAdeESwYPRW/1662L+
   An07g6jQQc/qq4bwdie3LCKWmD5ybT2WbIK5kCmPYLzMn6q0wxNvEyCBB
   uns6dSO4EANZXgER4YKlc/DCFBJ7VFyZEC71DMAIsISadppyeLtrad5VT
   KgqtS+FtfmKu2cecnZsCzebrMZKNbkpTnrvDdwEEqOXcc+9E+zjDFPWj2
   gDS6z0XcIvvXaD1AGnWe/mrhJNRka7PzDWO3mVdnjfrV/q+T8OVZm/o4L
   yBMnyYrcMSlj15K0bdsOR0d5I/ynARTVUYhRDsII9tljDAnZxs12v/Mz5
   A==;
X-CSE-ConnectionGUID: 2lcqxN9+SrClTibuR2QiSw==
X-CSE-MsgGUID: s7Z8qipuR4WKEU4zY7k6RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="92374597"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="92374597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 09:30:26 -0700
X-CSE-ConnectionGUID: F4N8Y7k2Q0iBVVGuFp52wQ==
X-CSE-MsgGUID: dTVa8BlcRQGYD3FPN/8VDg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Mar 2026 09:30:24 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2XJG-000000000nD-0XwY;
	Tue, 17 Mar 2026 16:30:22 +0000
Date: Wed, 18 Mar 2026 00:30:19 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 24/24] fs/ceph/addr.c:363:44: error:
 incompatible pointer types passing 'struct netfs_read_context *' to parameter
 of type 'struct netfs_read_context *'
Message-ID: <202603180051.TxKi8BGp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   d8339d806de3ae4a4f33f8d94db13cc6ca26e463
commit: d8339d806de3ae4a4f33f8d94db13cc6ca26e463 [24/24] netfs: Combine prepare and issue ops and grab the buffers on request
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603180051.TxKi8BGp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180051.TxKi8BGp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180051.TxKi8BGp-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/addr.c:273:18: warning: declaration of 'struct netfs_read_context' will not be visible outside of this function [-Wvisibility]
     273 |                                       struct netfs_read_context *rctx)
         |                                              ^
   fs/ceph/addr.c:297:8: error: call to undeclared function 'netfs_subreq_get_buffer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     297 |         err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
         |               ^
   fs/ceph/addr.c:312:37: error: too many arguments to function call, expected single argument 'subreq', have 2 arguments
     312 |         netfs_mark_read_submission(subreq, rctx);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~
   include/linux/netfs.h:456:6: note: 'netfs_mark_read_submission' declared here
     456 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq);
         |      ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:327:71: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     327 |         err = copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->io_iter);
         |                                                                      ~~~~~~  ^
   fs/ceph/addr.c:344:13: warning: declaration of 'struct netfs_read_context' will not be visible outside of this function [-Wvisibility]
     344 |                                  struct netfs_read_context *rctx)
         |                                         ^
>> fs/ceph/addr.c:363:44: error: incompatible pointer types passing 'struct netfs_read_context *' to parameter of type 'struct netfs_read_context *' [-Wincompatible-pointer-types]
     363 |                 err = ceph_netfs_issue_op_inline(subreq, rctx);
         |                                                          ^~~~
   fs/ceph/addr.c:273:38: note: passing argument to parameter 'rctx' here
     273 |                                       struct netfs_read_context *rctx)
         |                                                                  ^
   fs/ceph/addr.c:401:8: error: call to undeclared function 'netfs_subreq_get_buffer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     401 |         err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
         |               ^
   fs/ceph/addr.c:425:11: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     425 |                 subreq->io_iter.count = len;
         |                 ~~~~~~  ^
   fs/ceph/addr.c:427:44: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     427 |                 err = iov_iter_get_pages_alloc2(&subreq->io_iter, &pages, len, &page_off);
         |                                                  ~~~~~~  ^
   fs/ceph/addr.c:443:47: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     443 |                 osd_req_op_extent_osd_iter(req, 0, &subreq->io_iter);
         |                                                     ~~~~~~  ^
   fs/ceph/addr.c:455:37: error: too many arguments to function call, expected single argument 'subreq', have 2 arguments
     455 |         netfs_mark_read_submission(subreq, rctx);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~         ^~~~
   include/linux/netfs.h:456:6: note: 'netfs_mark_read_submission' declared here
     456 | void netfs_mark_read_submission(struct netfs_io_subrequest *subreq);
         |      ^                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c:517:22: error: no member named 'sreq_max_len' in 'struct netfs_io_stream'
     517 |         rreq->io_streams[0].sreq_max_len = fsc->mount_options->rsize;
         |         ~~~~~~~~~~~~~~~~~~~ ^
   fs/ceph/addr.c:545:17: error: incompatible function pointer types initializing 'int (*)(struct netfs_io_subrequest *)' with an expression of type 'int (struct netfs_io_subrequest *, struct netfs_read_context *)' [-Wincompatible-function-pointer-types]
     545 |         .issue_read             = ceph_netfs_issue_read,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   2 warnings and 14 errors generated.


vim +363 fs/ceph/addr.c

   342	
   343	static int ceph_netfs_issue_read(struct netfs_io_subrequest *subreq,
   344					 struct netfs_read_context *rctx)
   345	{
   346		struct netfs_io_request *rreq = subreq->rreq;
   347		struct inode *inode = rreq->inode;
   348		struct ceph_inode_info *ci = ceph_inode(inode);
   349		struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
   350		struct ceph_client *cl = fsc->client;
   351		struct ceph_osd_request *req = NULL;
   352		struct ceph_vino vino = ceph_vino(inode);
   353		u64 objno, objoff, len, off = subreq->start;
   354		u32 maxlen;
   355		int err;
   356		bool sparse = IS_ENCRYPTED(inode) || ceph_test_mount_opt(fsc, SPARSEREAD);
   357		int extent_cnt;
   358	
   359		if (ceph_inode_is_shutdown(inode))
   360			return -EIO;
   361	
   362		if (ceph_has_inline_data(ci)) {
 > 363			err = ceph_netfs_issue_op_inline(subreq, rctx);
   364			if (err != 1)
   365				return err;
   366		}
   367	
   368		/* Truncate the extent at the end of the current block */
   369		ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len,
   370					      &objno, &objoff, &maxlen);
   371		maxlen = umin(maxlen, fsc->mount_options->rsize);
   372		len = umin(subreq->len, maxlen);
   373		subreq->len = len;
   374	
   375		// TODO: This rounding here is slightly dodgy.  It *should* work, for
   376		// now, as the cache only deals in blocks that are a multiple of
   377		// PAGE_SIZE and fscrypt blocks are at most PAGE_SIZE.  What needs to
   378		// happen is for the fscrypt driving to be moved into netfslib and the
   379		// data in the cache also to be stored encrypted.
   380		ceph_fscrypt_adjust_off_and_len(inode, &off, &len);
   381	
   382		req = ceph_osdc_new_request(&fsc->client->osdc, &ci->i_layout, vino,
   383				off, &len, 0, 1, sparse ? CEPH_OSD_OP_SPARSE_READ : CEPH_OSD_OP_READ,
   384				CEPH_OSD_FLAG_READ, NULL, ci->i_truncate_seq,
   385				ci->i_truncate_size, false);
   386		if (IS_ERR(req))
   387			return PTR_ERR(req);
   388	
   389		if (sparse) {
   390			extent_cnt = __ceph_sparse_read_ext_count(inode, len);
   391			err = ceph_alloc_sparse_ext_map(&req->r_ops[0], extent_cnt);
   392			if (err) {
   393				ceph_osdc_put_request(req);
   394				return err;
   395			}
   396		}
   397	
   398		doutc(cl, "%llx.%llx pos=%llu orig_len=%zu len=%llu\n",
   399		      ceph_vinop(inode), subreq->start, subreq->len, len);
   400	
   401		err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
   402		if (err < 0) {
   403			ceph_osdc_put_request(req);
   404			return err;
   405		}
   406	
   407		/*
   408		 * FIXME: For now, use CEPH_OSD_DATA_TYPE_PAGES instead of _ITER for
   409		 * encrypted inodes. We'd need infrastructure that handles an iov_iter
   410		 * instead of page arrays, and we don't have that as of yet. Once the
   411		 * dust settles on the write helpers and encrypt/decrypt routines for
   412		 * netfs, we should be able to rework this.
   413		 */
   414		if (IS_ENCRYPTED(inode)) {
   415			struct page **pages;
   416			size_t page_off;
   417	
   418			/*
   419			 * FIXME: io_iter.count needs to be corrected to aligned
   420			 * length. Otherwise, iov_iter_get_pages_alloc2() operates
   421			 * with the initial unaligned length value. As a result,
   422			 * ceph_msg_data_cursor_init() triggers BUG_ON() in the case
   423			 * if msg->sparse_read_total > msg->data_length.
   424			 */
   425			subreq->io_iter.count = len;
   426	
   427			err = iov_iter_get_pages_alloc2(&subreq->io_iter, &pages, len, &page_off);
   428			if (err < 0) {
   429				doutc(cl, "%llx.%llx failed to allocate pages, %d\n",
   430				      ceph_vinop(inode), err);
   431				ceph_osdc_put_request(req);
   432				return -EIO;
   433			}
   434	
   435			/* should always give us a page-aligned read */
   436			WARN_ON_ONCE(page_off);
   437			len = err;
   438			err = 0;
   439	
   440			osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false,
   441							 false);
   442		} else {
   443			osd_req_op_extent_osd_iter(req, 0, &subreq->io_iter);
   444		}
   445		if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
   446			ceph_osdc_put_request(req);
   447			return -EIO;
   448		}
   449		req->r_callback = finish_netfs_read;
   450		req->r_priv = subreq;
   451		req->r_inode = inode;
   452		ihold(inode);
   453	
   454		/* After this point, we're not allowed to return an error. */
   455		netfs_mark_read_submission(subreq, rctx);
   456		ceph_osdc_start_request(req->r_osdc, req);
   457		ceph_osdc_put_request(req);
   458		doutc(cl, "%llx.%llx result -EIOCBQUEUED\n", ceph_vinop(inode));
   459		return -EIOCBQUEUED;
   460	}
   461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
