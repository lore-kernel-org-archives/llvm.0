Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3072F373C0B;
	Wed, 20 May 2026 06:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779258595; cv=none; b=YOhBk/TuwtiNhE8bZAG3/xcLfZzjSObUPs+XyrdnHND1L5Rub2/+KBVE0apC1MrqewKjM3Tp19aVH4IBAKIrCNjOWr0/lNkS4JjTZsHl2KUSExrbNN5+mQ5O+3r7CbKBjFb2hz5e9CEsD9lNPSavLGY6Sqjb+SyNVTao9zQ/X18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779258595; c=relaxed/simple;
	bh=g09F5oJs0aWic9ZvvyDSgXPbZQt16nZcHHkyxiNYn54=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QIAkybHeagxjAusK+/jVs9q/dnXrPKmkH6dJeG31LHFFiDO0uPQFeMrnhxUY3u5q/G0kXZ14+ONDpFmod2mkUNaVK9n05RumAwNfSpDlTZpM58y/VNxGIEfqcHtl9mBuJCcb5hNzCsfdGeKIK4sdtMJqTSw/Her78p6oq0Xs3GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYpVJ3ss; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYpVJ3ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779258594; x=1810794594;
  h=date:from:to:cc:subject:message-id;
  bh=g09F5oJs0aWic9ZvvyDSgXPbZQt16nZcHHkyxiNYn54=;
  b=nYpVJ3ssZU1MhDYwMJlsdgyV7q5Wagu9gteRoHxYKm2E9CwvRyFGLXRo
   BhFibTG2xastLziHX+Yz6Yz2e5pGcvn3L/7Xeco8sG6SIWkFhYPtIlbkV
   5G8qa4rjq0b42MUgCBUQaSqFwVCL4h2YF8fnOXlZyuPsdZefvV7NfW8us
   PIkh4OAcLh9lGVPQljUh2vu/LrF8XdFIKquVjy5w3A5EM7+VjkPHGrMq1
   W4W1qIujOYNChv1OktL3d8MmS3EWqVCihUzbZavMXVA2WoojryCbvgdFY
   Szo/XtYEQIQzI64J+LV0dii6B1+37ZMOc2IqUkP4Kodr2bZ1eW21f6j1S
   g==;
X-CSE-ConnectionGUID: LYYOZuwvQcuHP0CsoMBNGA==
X-CSE-MsgGUID: pEIMcN73S1K0lPzFbrajfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90727184"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90727184"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 23:29:44 -0700
X-CSE-ConnectionGUID: ofkeCUIHTfONkxbwRows/A==
X-CSE-MsgGUID: ZfWAEZG0Sa6GbxGM9m5mdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="235778985"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 May 2026 23:29:42 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPaQW-000000002dL-28Tj;
	Wed, 20 May 2026 06:29:16 +0000
Date: Wed, 20 May 2026 14:28:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 34/34]
 fs/netfs/direct_write.c:559:22: warning: variable 'ret' is uninitialized when
 used here
Message-ID: <202605201406.TZwd6Bpe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   13cee75c8b683f7c4382573f8c27adfbd49ffc47
commit: 13cee75c8b683f7c4382573f8c27adfbd49ffc47 [34/34] netfs: Support encryption on Unbuffered/DIO write
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260520/202605201406.TZwd6Bpe-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201406.TZwd6Bpe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201406.TZwd6Bpe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/direct_write.c:559:22: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     559 |                 stream->buffered = ret;
         |                                    ^~~
   fs/netfs/direct_write.c:473:13: note: initialize the variable 'ret' to silence this warning
     473 |         ssize_t ret, n;
         |                    ^
         |                     = 0
   1 warning generated.


vim +/ret +559 fs/netfs/direct_write.c

   461	
   462	/*
   463	 * Perform an unbuffered write where we may have to do an RMW operation on an
   464	 * encrypted file.  This can also be used for direct I/O writes.
   465	 */
   466	ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *iter,
   467						   struct netfs_group *netfs_group)
   468	{
   469		struct netfs_io_request *wreq;
   470		struct netfs_io_stream *stream;
   471		unsigned long long start = iocb->ki_pos;
   472		unsigned long long end = start + iov_iter_count(iter);
   473		ssize_t ret, n;
   474		size_t len = iov_iter_count(iter);
   475		bool async = !is_sync_kiocb(iocb);
   476	
   477		_enter("");
   478	
   479		_debug("uw %llx-%llx", start, end);
   480	
   481		wreq = netfs_create_write_req(iocb->ki_filp->f_mapping, iocb->ki_filp, start,
   482					      iocb->ki_flags & IOCB_DIRECT ?
   483					      NETFS_DIO_WRITE : NETFS_UNBUFFERED_WRITE);
   484		if (IS_ERR(wreq))
   485			return PTR_ERR(wreq);
   486	
   487		wreq->len = iov_iter_count(iter);
   488		wreq->submitted = 0;
   489		stream = &wreq->io_streams[0];
   490		stream->avail = true;
   491		trace_netfs_write(wreq, (iocb->ki_flags & IOCB_DIRECT ?
   492					 netfs_write_trace_dio_write :
   493					 netfs_write_trace_unbuffered_write));
   494	
   495		/* If we're going to do encryption or compression, we're going to need
   496		 * a bounce buffer.
   497		 */
   498		if (test_bit(NETFS_RREQ_CONTENT_ENCRYPTION, &wreq->flags)) {
   499			__set_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &wreq->flags);
   500			__set_bit(NETFS_RREQ_CRYPT_IN_PLACE, &wreq->flags);
   501		}
   502	
   503		/* Transcribe the source buffer into a bvecq chain.  We need this for
   504		 * async writes because the source iterator but we also use it for
   505		 * unencrypted sync writes as it gets passed to the filesystem in this
   506		 * form.
   507		 *
   508		 * We extract as much of the buffer as we can manage, but this may
   509		 * shorten the request.
   510		 */
   511		n = netfs_extract_iter(iter, len, INT_MAX, iocb->ki_pos,
   512				       &wreq->load_cursor.bvecq, 0);
   513		if (n < 0) {
   514			ret = n;
   515			goto error_put;
   516		}
   517		wreq->len = n;
   518		_debug("dio-write %zx/%zx %u/%u",
   519		       n, len, wreq->load_cursor.bvecq->nr_slots,
   520		       wreq->load_cursor.bvecq->max_slots);
   521	
   522		/* Set up the bounce buffer if we need it.  Allow for padding the
   523		 * request out to the crypo block size and allocate at least one bvecq
   524		 * into it.
   525		 */
   526		if (test_bit(NETFS_RREQ_USE_BOUNCE_BUFFER, &wreq->flags)) {
   527			size_t bsize = wreq->crypto_bsize;
   528			size_t gap;
   529	
   530			bvecq_pos_set(&wreq->copy_cursor, &wreq->load_cursor);
   531	
   532			wreq->bounce_alloc_to = round_down(wreq->start, bsize);
   533			atomic64_set(&wreq->encrypted_to, wreq->bounce_alloc_to);
   534			gap = wreq->start - wreq->bounce_alloc_to;
   535	
   536			stream->issue_from = wreq->bounce_alloc_to;
   537			stream->buffered = round_up(wreq->len + gap, bsize);
   538	
   539			ret = bvecq_buffer_init(&wreq->bounce_alloc, wreq->debug_id);
   540			if (ret < 0)
   541				goto error_put;
   542	
   543			/*   0--->
   544			 *  ~--+-------+-------+-------+-------+---~
   545			 *     :       |       |       |       |
   546			 *     :spent  |encrypt|copied |alloced|
   547			 *     :       |-ed    |       |       |
   548			 *  ~--+-------+-------+-------+-------+---~
   549			 *                                     ^bounce_alloc
   550			 *                             ^bounce_copy
   551			 *                     ^encrypt_cursor
   552			 *             ^dispatch_cursor
   553			 */
   554			bvecq_pos_set(&wreq->bounce_copy, &wreq->bounce_alloc);
   555			bvecq_pos_set(&wreq->encrypt_cursor, &wreq->bounce_alloc);
   556			bvecq_pos_set(&stream->dispatch_cursor, &wreq->bounce_alloc);
   557	
   558		} else {
 > 559			stream->buffered = ret;
   560			stream->issue_from = wreq->start;
   561			bvecq_pos_set(&stream->dispatch_cursor, &wreq->load_cursor);
   562		}
   563	
   564		/* Dispatch the write. */
   565		__set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
   566	
   567		if (async) {
   568			INIT_WORK(&wreq->work, netfs_unbuffered_write_async);
   569			wreq->iocb = iocb;
   570			queue_work(system_dfl_wq, &wreq->work);
   571			ret = -EIOCBQUEUED;
   572		} else {
   573			ret = netfs_unbuffered_write(wreq);
   574			if (ret < 0) {
   575				_debug("begin = %zd", ret);
   576			} else {
   577				iocb->ki_pos += wreq->transferred;
   578				ret = wreq->transferred ?: wreq->error;
   579			}
   580	
   581			netfs_put_request(wreq, netfs_rreq_trace_put_complete);
   582		}
   583	
   584		netfs_put_request(wreq, netfs_rreq_trace_put_return);
   585		return ret;
   586	
   587	error_put:
   588		netfs_put_failed_request(wreq);
   589		return ret;
   590	}
   591	EXPORT_SYMBOL(netfs_unbuffered_write_iter_locked);
   592	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
