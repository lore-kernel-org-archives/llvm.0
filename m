Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190AF26B2AD;
	Sun, 19 Apr 2026 02:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776566382; cv=none; b=e4yRZb7fQvyZmyKYSUEPrd+4Bq4rHuxBZg7t531Tzw2hw+jwl7XV9cBvPeHknLB32++iT/SbuNmmHpBYj2IENVe4lBqxt23kaFFyCa+41c1eaEl9K/74hysZeZFJ3raTeKUSyYjC6uLBNxtIhBOfAYSiITsbCOZH9lq9YKgv5yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776566382; c=relaxed/simple;
	bh=iwfNSjZ41u3zXfLkAdF+fGxsMIRgVtNelZIB45HPxQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MSIWviXhxFkhTy4a0d3CWKBgESi2cLxS/HcmSLwCNNVVJ4KtdnZEVHiBK/y35tZvaZe3Bpe3yqXE0lQMXZmi8aGHDxTgqE0QNvEsZip+K3gO02SN9G3iyAEPsDUJBAs2kMoepTZ6IfOfidFfzga9W6z+q3+IRXt3nBtI4ijT3wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMExqp4n; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMExqp4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776566379; x=1808102379;
  h=date:from:to:cc:subject:message-id;
  bh=iwfNSjZ41u3zXfLkAdF+fGxsMIRgVtNelZIB45HPxQo=;
  b=TMExqp4nc8yh6Ak03kmg8pjDH4Xa77EGJr54eWCnjwNbV1loSwPjXLSm
   N0PaUNPacneTbLBbbfdSrytE+e+kAi1Wh699sTAITIv5bPa4b2Qn4ONrE
   ueQSO6M31bP+sQwT5dR836WeYkutppbxbH3zh2bdLMueyxROjpuonnYEJ
   aR8dWRsSTnnJFkNdcU08LTvoaXEzRaCSleShnp7aDKe0JRiysmAwbBzLR
   wwGLo3moO4c83rwK2F6Np4lT1d/3wGlHYZIcCgXk9lq77sVHB9JEDSe9E
   rUjHOb/oCGctNiLa3t/XDgabwgOVcJxKb2utykJ/hzzMCbhKdJCWmOCMP
   A==;
X-CSE-ConnectionGUID: 7LK3Q3mdRJ64V4qIXTQS9A==
X-CSE-MsgGUID: nMD5zenHS8WckzRmWdf+YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76690599"
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="76690599"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 19:39:38 -0700
X-CSE-ConnectionGUID: XZ6+CMOCRiSmx/zOz7E+2A==
X-CSE-MsgGUID: Dfgn1UKuT7uwXxa8alaszA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,187,1770624000"; 
   d="scan'208";a="230391700"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Apr 2026 19:39:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEI4M-000000001pt-0nHi;
	Sun, 19 Apr 2026 02:39:34 +0000
Date: Sun, 19 Apr 2026 04:38:49 +0200
From: kernel test robot <lkp@intel.com>
To: Shyam Prasad N <sprasad@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: fs/smb/client/smb2pdu.c:5582:15: warning: variable
 'total_len' set but not used
Message-ID: <202604190448.41ae7DK8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/nspmangalore-gmail-com/cifs-abort-open_cached_dir-if-we-don-t-request-leases/20260419-062014
head:   c8c2402f7512a3e2640d285c72c83ceb9d4b5008
commit: 852c520554168863f71f0a0b220eed9ab701a1c5 cifs: optimize readdir for larger directories
date:   4 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260419/202604190448.41ae7DK8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260419/202604190448.41ae7DK8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604190448.41ae7DK8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/smb/client/smb2pdu.c:5582:15: warning: variable 'total_len' set but not used [-Wunused-but-set-variable]
    5582 |         unsigned int total_len;
         |                      ^
   1 warning generated.


vim +/total_len +5582 fs/smb/client/smb2pdu.c

  5567	
  5568	/*
  5569	 * QueryDirectory with large buffer and multi-credit support.
  5570	 * Uses async infrastructure but waits for completion synchronously.
  5571	 */
  5572	int
  5573	SMB2_query_directory_large(struct cifs_query_dir_io *qd_io, unsigned int buf_size)
  5574	{
  5575		int rc, flags = 0;
  5576		char *buf;
  5577		struct smb2_hdr *shdr;
  5578		struct smb_rqst rqst = { .rq_iov = &qd_io->iov[0],
  5579					 .rq_nvec = SMB2_QUERY_DIRECTORY_IOV_SIZE };
  5580		struct TCP_Server_Info *server = qd_io->server;
  5581		struct cifs_tcon *tcon = qd_io->tcon;
> 5582		unsigned int total_len;
  5583		int credit_request;
  5584	
  5585		cifs_dbg(FYI, "%s: buf_size=%u\n", __func__, buf_size);
  5586	
  5587		/* Cap buffer size to avoid kmalloc failures for very large allocations.
  5588		 * SMB2_MAX_QD_DATABUF_SIZE is a safe limit that stays well below typical
  5589		 * kmalloc constraints while still allowing large directory listings.
  5590		 */
  5591		if (buf_size > SMB2_MAX_QD_DATABUF_SIZE)
  5592			buf_size = SMB2_MAX_QD_DATABUF_SIZE;
  5593	
  5594		/* Allocate response buffer. Since we'll build a combined header+data buffer,
  5595		 * we need space for both. We'll request a slightly smaller OutputBufferLength
  5596		 * from the server to ensure the total response fits.
  5597		 */
  5598		qd_io->combined_iov.iov_base = kmalloc(buf_size, GFP_KERNEL);
  5599		if (!qd_io->combined_iov.iov_base)
  5600			return -ENOMEM;
  5601		/* Store total capacity in iov_len; updated to actual data length by receive handler */
  5602		qd_io->combined_iov.iov_len = buf_size;
  5603	
  5604		/* Initialize completion */
  5605		init_completion(&qd_io->done);
  5606	
  5607		/* Request less data from server to leave room for the response header.
  5608		 * Use MAX_CIFS_SMALL_BUFFER_SIZE as a safety margin.
  5609		 */
  5610		rc = SMB2_query_directory_init(qd_io->xid, tcon, server,
  5611					       &rqst, qd_io->persistent_fid,
  5612					       qd_io->volatile_fid, qd_io->index,
  5613					       qd_io->srch_inf->info_level,
  5614					       buf_size - MAX_CIFS_SMALL_BUFFER_SIZE);
  5615		if (rc) {
  5616			kfree(qd_io->combined_iov.iov_base);
  5617			qd_io->combined_iov.iov_base = NULL;
  5618			return rc;
  5619		}
  5620	
  5621		if (smb3_encryption_required(tcon))
  5622			flags |= CIFS_TRANSFORM_REQ;
  5623	
  5624		buf = rqst.rq_iov[0].iov_base;
  5625		total_len = rqst.rq_iov[0].iov_len;
  5626	
  5627		shdr = (struct smb2_hdr *)buf;
  5628	
  5629		if (qd_io->replay) {
  5630			/* Back-off before retry */
  5631			if (qd_io->cur_sleep)
  5632				msleep(qd_io->cur_sleep);
  5633			smb2_set_replay(server, &rqst);
  5634		}
  5635	
  5636		/* Set credit charge based on buffer size */
  5637		if (qd_io->credits.value > 0) {
  5638			shdr->CreditCharge = cpu_to_le16(DIV_ROUND_UP(buf_size,
  5639							SMB2_MAX_BUFFER_SIZE));
  5640			credit_request = le16_to_cpu(shdr->CreditCharge) + 8;
  5641			if (server->credits >= server->max_credits)
  5642				shdr->CreditRequest = cpu_to_le16(0);
  5643			else
  5644				shdr->CreditRequest = cpu_to_le16(
  5645					min_t(int, server->max_credits -
  5646							server->credits, credit_request));
  5647	
  5648			flags |= CIFS_HAS_CREDITS;
  5649		}
  5650	
  5651		rc = cifs_call_async(server, &rqst,
  5652				     cifs_query_dir_receive, smb2_query_dir_callback,
  5653				     smb2_query_dir_handle_data, qd_io, flags,
  5654				     &qd_io->credits);
  5655		if (rc) {
  5656			cifs_stats_fail_inc(tcon, SMB2_QUERY_DIRECTORY_HE);
  5657			trace_smb3_query_dir_err(qd_io->xid, qd_io->persistent_fid,
  5658						 tcon->tid, tcon->ses->Suid,
  5659						 qd_io->index, 0, rc);
  5660			kfree(qd_io->combined_iov.iov_base);
  5661			qd_io->combined_iov.iov_base = NULL;
  5662		}
  5663	
  5664		/* Free request buffer immediately after async call */
  5665		cifs_small_buf_release(buf);
  5666	
  5667		if (rc)
  5668			return rc;
  5669	
  5670		/* Wait for the async operation to complete */
  5671		wait_for_completion(&qd_io->done);
  5672		return qd_io->result;
  5673	}
  5674	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
