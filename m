Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB78D373BF4;
	Tue,  3 Mar 2026 06:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772518611; cv=none; b=pZD6Rzvw3TfPT7J/HaiNOdvMMiBxJd8b58ElhJRCTTywEXjTIbUJET/GhbRSjPHU8GnZ9WBCb1fdcxYFSBCQYGelh7Eg1/WX1bhc3TFSVfoFZrLj4NQ+DPWm4qKTsz6k2zbAe9k5mX1RtUCraCypTlLbzQ3gRvHJLnEIXDFj8m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772518611; c=relaxed/simple;
	bh=qJ+PLK7BdwneDiS8sFPseo/erRuxAvoNiPp5CXXLlx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XCHn+w9QTrjkOHdoqVXiOQMgyc/MPZmL3uMBfFi3C/T8JEewOANn5WkJ1WvVdSyTDuxrju8uytliP7UqP2aAFsSoGU5cH881m5bgZcSJ7+oi3OInhgQo2vzvdoTYsu7xlZMQcQokEUedQrvBmWu0BYldxu0WEjFWqTHJ0QlTf8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e0CUIRBH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e0CUIRBH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772518609; x=1804054609;
  h=date:from:to:cc:subject:message-id;
  bh=qJ+PLK7BdwneDiS8sFPseo/erRuxAvoNiPp5CXXLlx4=;
  b=e0CUIRBHgVE+56tgPyoMLXFV+l29QoNCyYTntVNj79PGbdt9JMCcInaV
   pQ80bQiGaMRbvyrNUN0vMdpHddeWsISiU+GEx3T5HL9/J3oHRPsqV9A0r
   UDTQurNMceB6Zhbra/lvgVtYJndzg+QSLXsP42+2BnHNNQ9qAp7HmY5MA
   YqTLBY0SIUMrpNUBkQhNn2+Cfr3d0kKD4oXDrqz6r5SuOQopfmR4+Jt80
   GS46K9e3Xx+E2U5IrjLWopMy362cVGmFMwTRun6zdL5YwR3mSCE09icit
   b660Y/gwroQb1xlfF5LKIb5csGujZYwlXYhXw7v1wsDt1d8GqCDRc/Ohi
   w==;
X-CSE-ConnectionGUID: 6Qv+qmh5SsGsgW6OaAbgKA==
X-CSE-MsgGUID: Sm3WcHCAQ9OVlnD4YpCqjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73608126"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="73608126"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 22:16:49 -0800
X-CSE-ConnectionGUID: Am4G33rWRvSx/jidqSC0xw==
X-CSE-MsgGUID: eL+TqUP7QDm6HGGmzKcaNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="220920229"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 02 Mar 2026 22:16:47 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxJ3l-000000001mr-10F1;
	Tue, 03 Mar 2026 06:16:45 +0000
Date: Tue, 03 Mar 2026 14:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 17/17] fs/ceph/addr.c:297:8: error:
 call to undeclared function 'netfs_subreq_get_buffer'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202603031429.hAHIfXFH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   955516269df2e8601e8736e89e91820dc3d053c2
commit: 955516269df2e8601e8736e89e91820dc3d053c2 [17/17] netfs: Combine prepare and issue ops and grab the buffers on request
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260303/202603031429.hAHIfXFH-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031429.hAHIfXFH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031429.hAHIfXFH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/ceph/addr.c:297:8: error: call to undeclared function 'netfs_subreq_get_buffer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     297 |         err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
         |               ^
>> fs/ceph/addr.c:327:71: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
     327 |         err = copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->io_iter);
         |                                                                      ~~~~~~  ^
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
>> fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     472 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^
>> fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
>> fs/ceph/addr.c:472:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
>> fs/ceph/addr.c:517:22: error: no member named 'sreq_max_len' in 'struct netfs_io_stream'
     517 |         rreq->io_streams[0].sreq_max_len = fsc->mount_options->rsize;
         |         ~~~~~~~~~~~~~~~~~~~ ^
   10 errors generated.
--
>> fs/netfs/write_issue.c:218:7: warning: logical not is only applied to the left hand side of this comparison [-Wlogical-not-parentheses]
     218 |                 if (!stream->collected_to == 0)
         |                     ^                     ~~
   fs/netfs/write_issue.c:218:7: note: add parentheses after the '!' to evaluate the comparison first
     218 |                 if (!stream->collected_to == 0)
         |                     ^                         
         |                      (                        )
   fs/netfs/write_issue.c:218:7: note: add parentheses around left hand side expression to silence this warning
     218 |                 if (!stream->collected_to == 0)
         |                     ^
         |                     (                    )
>> fs/netfs/write_issue.c:555:25: error: no member named 'dispatch_cursor' in 'struct netfs_io_request'
     555 |                 bvecq_pos_move(&wreq->dispatch_cursor, queue);
         |                                 ~~~~  ^
   fs/netfs/write_issue.c:556:9: error: no member named 'dispatch_cursor' in 'struct netfs_io_request'
     556 |                 wreq->dispatch_cursor.slot = 0;
         |                 ~~~~  ^
>> fs/netfs/write_issue.c:920:20: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     920 |         _enter("%lx,%lx", iov_iter_count(iter), len);
         |                 ~~~       ^~~~~~~~~~~~~~~~~~~~
         |                 %zx
   fs/netfs/internal.h:598:17: note: expanded from macro '_enter'
     598 |                 kenter(FMT, ##__VA_ARGS__);     \
         |                        ~~~    ^~~~~~~~~~~
   fs/netfs/internal.h:585:65: note: expanded from macro 'kenter'
     585 | #define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                             ~~~                 ^~~~~~~~~~~
   fs/netfs/internal.h:583:46: note: expanded from macro 'dbgprintk'
     583 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                           ~~~                       ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/netfs/write_issue.c:920:42: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     920 |         _enter("%lx,%lx", iov_iter_count(iter), len);
         |                     ~~~                         ^~~
         |                     %zx
   fs/netfs/internal.h:598:17: note: expanded from macro '_enter'
     598 |                 kenter(FMT, ##__VA_ARGS__);     \
         |                        ~~~    ^~~~~~~~~~~
   fs/netfs/internal.h:585:65: note: expanded from macro 'kenter'
     585 | #define kenter(FMT, ...) dbgprintk("==> %s("FMT")", __func__, ##__VA_ARGS__)
         |                                             ~~~                 ^~~~~~~~~~~
   fs/netfs/internal.h:583:46: note: expanded from macro 'dbgprintk'
     583 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                           ~~~                       ^~~~~~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   3 warnings and 2 errors generated.
--
>> fs/nfs/fscache.c:275:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     275 |         __set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
         |                   ^
>> fs/nfs/fscache.c:275:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
>> fs/nfs/fscache.c:275:12: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
>> fs/nfs/fscache.c:276:22: error: no member named 'sreq_max_len' in 'struct netfs_io_stream'
     276 |         rreq->io_streams[0].sreq_max_len = NFS_SB(rreq->inode->i_sb)->rsize;
         |         ~~~~~~~~~~~~~~~~~~~ ^
   4 errors generated.
--
>> fs/smb/client/cifssmb.c:1470:31: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
    1470 |                                  .rq_iter = rdata->subreq.io_iter };
         |                                             ~~~~~~~~~~~~~ ^
   fs/smb/client/cifssmb.c:2005:31: error: no member named 'io_iter' in 'struct netfs_io_subrequest'
    2005 |         rqst.rq_iter = wdata->subreq.io_iter;
         |                        ~~~~~~~~~~~~~ ^
   2 errors generated.


vim +/netfs_subreq_get_buffer +297 fs/ceph/addr.c

   271	
   272	static int ceph_netfs_issue_op_inline(struct netfs_io_subrequest *subreq,
   273					      struct netfs_read_context *rctx)
   274	{
   275		struct netfs_io_request *rreq = subreq->rreq;
   276		struct inode *inode = rreq->inode;
   277		struct ceph_mds_reply_info_parsed *rinfo;
   278		struct ceph_mds_reply_info_in *iinfo;
   279		struct ceph_mds_request *req;
   280		struct ceph_mds_client *mdsc = ceph_sb_to_mdsc(inode->i_sb);
   281		struct ceph_inode_info *ci = ceph_inode(inode);
   282		ssize_t err;
   283		size_t len;
   284		int mode;
   285	
   286		if (rreq->origin != NETFS_UNBUFFERED_READ &&
   287		    rreq->origin != NETFS_DIO_READ)
   288			__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
   289		__clear_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags);
   290	
   291		if (subreq->start >= inode->i_size) {
   292			__set_bit(NETFS_SREQ_HIT_EOF, &subreq->flags);
   293			err = 0;
   294			goto out;
   295		}
   296	
 > 297		err = netfs_subreq_get_buffer(subreq, rctx, UINT_MAX);
   298		if (err < 0)
   299			return err;
   300	
   301		/* We need to fetch the inline data. */
   302		mode = ceph_try_to_choose_auth_mds(inode, CEPH_STAT_CAP_INLINE_DATA);
   303		req = ceph_mdsc_create_request(mdsc, CEPH_MDS_OP_GETATTR, mode);
   304		if (IS_ERR(req))
   305			return PTR_ERR(req);
   306	
   307		req->r_ino1 = ci->i_vino;
   308		req->r_args.getattr.mask = cpu_to_le32(CEPH_STAT_CAP_INLINE_DATA);
   309		req->r_num_caps = 2;
   310	
   311		/* After this point, we're not allowed to return an error. */
   312		netfs_mark_read_submission(subreq, rctx);
   313	
   314		err = ceph_mdsc_do_request(mdsc, NULL, req);
   315		if (err < 0)
   316			goto out;
   317	
   318		rinfo = &req->r_reply_info;
   319		iinfo = &rinfo->targeti;
   320		if (iinfo->inline_version == CEPH_INLINE_NONE) {
   321			/* The data got uninlined */
   322			ceph_mdsc_put_request(req);
   323			return 1;
   324		}
   325	
   326		len = min_t(size_t, iinfo->inline_len - subreq->start, subreq->len);
 > 327		err = copy_to_iter(iinfo->inline_data + subreq->start, len, &subreq->io_iter);
   328		if (err == 0) {
   329			err = -EFAULT;
   330		} else {
   331			subreq->transferred += err;
   332			err = 0;
   333		}
   334	
   335		ceph_mdsc_put_request(req);
   336	out:
   337		subreq->error = err;
   338		trace_netfs_sreq(subreq, netfs_sreq_trace_io_progress);
   339		netfs_read_subreq_terminated(subreq);
   340		return -EIOCBQUEUED;
   341	}
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
   363			err = ceph_netfs_issue_op_inline(subreq, rctx);
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
 > 425			subreq->io_iter.count = len;
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
 > 443			osd_req_op_extent_osd_iter(req, 0, &subreq->io_iter);
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
   462	static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
   463	{
   464		struct inode *inode = rreq->inode;
   465		struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
   466		struct ceph_client *cl = ceph_inode_to_client(inode);
   467		int got = 0, want = CEPH_CAP_FILE_CACHE;
   468		struct ceph_netfs_request_data *priv;
   469		int ret = 0;
   470	
   471		/* [DEPRECATED] Use PG_private_2 to mark folio being written to the cache. */
 > 472		__set_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags);
   473	
   474		if (rreq->origin != NETFS_READAHEAD)
   475			return 0;
   476	
   477		priv = kzalloc_obj(*priv, GFP_NOFS);
   478		if (!priv)
   479			return -ENOMEM;
   480	
   481		if (file) {
   482			struct ceph_rw_context *rw_ctx;
   483			struct ceph_file_info *fi = file->private_data;
   484	
   485			priv->file_ra_pages = file->f_ra.ra_pages;
   486			priv->file_ra_disabled = file->f_mode & FMODE_RANDOM;
   487	
   488			rw_ctx = ceph_find_rw_context(fi);
   489			if (rw_ctx) {
   490				rreq->netfs_priv = priv;
   491				return 0;
   492			}
   493		}
   494	
   495		/*
   496		 * readahead callers do not necessarily hold Fcb caps
   497		 * (e.g. fadvise, madvise).
   498		 */
   499		ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
   500		if (ret < 0) {
   501			doutc(cl, "%llx.%llx, error getting cap\n", ceph_vinop(inode));
   502			goto out;
   503		}
   504	
   505		if (!(got & want)) {
   506			doutc(cl, "%llx.%llx, no cache cap\n", ceph_vinop(inode));
   507			ret = -EACCES;
   508			goto out;
   509		}
   510		if (ret == 0) {
   511			ret = -EACCES;
   512			goto out;
   513		}
   514	
   515		priv->caps = got;
   516		rreq->netfs_priv = priv;
   517		rreq->io_streams[0].sreq_max_len = fsc->mount_options->rsize;
   518	
   519	out:
   520		if (ret < 0) {
   521			if (got)
   522				ceph_put_cap_refs(ceph_inode(inode), got);
   523			kfree(priv);
   524		}
   525	
   526		return ret;
   527	}
   528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
