Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C633655E8;
	Fri, 17 Jul 2026 22:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784325847; cv=none; b=uKm17cqb+27Bg7RLvmpLrrMAVxAljWjt+P3ColnCKrrgCaPKZnSojHBi2TxMEpMCeWMZ7s6PuJ4rVjT6Jg9xt+8gFYARX4qMcXODejnrFNUTux2uCSTBqkhNuMVQBtvDb/nMy97OSQBrLdqQ1ntv3R33TgVseFH9niSjLqnlyhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784325847; c=relaxed/simple;
	bh=bgtFZZwyVVeVM3s2gQBrdXHJYd5XB37T3985IXmFeeg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bIiydSXic+eWnjBhsQaybsk+/LyfJozcsusM7RN2ph1XARbdKBOkCwmyQWpDEUdnUmeK/zgAlzzv9IJ+Gfy9WcQmNgZqd5kSu967QE8q3NqL0gzY0rPNxkXWK35G2meJ/O7CWMKEIcpZl30uO1lC5YoBfQV6JMwwl3JFN3JUdoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKW+1b2t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKW+1b2t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784325845; x=1815861845;
  h=date:from:to:cc:subject:message-id;
  bh=bgtFZZwyVVeVM3s2gQBrdXHJYd5XB37T3985IXmFeeg=;
  b=RKW+1b2trtU+Wg+aLPEm37QNVSiurb8FQSu+FVlmWLSyEUnlX9qoptz6
   rgcpUWS3ALWZAHQSavwpPIwLg0tjw5DdsqQQnDHdAbFu5f//V8Kd9O+3P
   M6f8D7/trErfqIflvVrtu+uSZ9k+aGGHcskSEK0Z08+WucEujJfjaThu+
   M7jdV6rv4tfdmD2UdAeVlR2o+qwrWeSMtspdbjSI77iok1/sKQRUom33v
   D/+2Xnq+4jDGiFl/2GpKX86oY/dHuLplxyy2dVaEvMOS5+8XcdeT+2ULz
   NX2ty0PLnWCsfsdAoiQWegZK3IXSliTE5rj3b83nflVXzizu156SsvTcb
   Q==;
X-CSE-ConnectionGUID: 8/CxZtKCRGqn2OYb9HAQzA==
X-CSE-MsgGUID: DSti4TM8S1OeE98oEQ9H8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102552988"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="102552988"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 15:04:04 -0700
X-CSE-ConnectionGUID: cNKEmxTsREGEo66tTVWLSA==
X-CSE-MsgGUID: YDvEJihwT/GpEbPgbSjBHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261166920"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 17 Jul 2026 15:04:03 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkqf2-000000005eH-2gVd;
	Fri, 17 Jul 2026 22:04:00 +0000
Date: Sat, 18 Jul 2026 00:03:00 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 24/24]
 fs/netfs/write_collect.c:155:7: warning: variable 'fpos' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202607172354.5AwTxoqH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   4b31f42776fcd3c9eaf2c27084026e98aeed5ddc
commit: 4b31f42776fcd3c9eaf2c27084026e98aeed5ddc [24/24] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260717/202607172354.5AwTxoqH-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172354.5AwTxoqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172354.5AwTxoqH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/write_collect.c:155:7: warning: variable 'fpos' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     155 |                 if (!bvecq->bv[slot].bv_page) {
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/write_collect.c:187:7: note: uninitialized use occurs here
     187 |                 if (fpos + fsize >= collected_to)
         |                     ^~~~
   fs/netfs/write_collect.c:155:3: note: remove the 'if' if its condition is always false
     155 |                 if (!bvecq->bv[slot].bv_page) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     156 |                         WARN_ONCE(1, "R=%08x slot already cleared?\n", wreq->debug_id);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     157 |                         fsize = bvecq->bv[slot].bv_len;
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     158 |                         goto skip;
         |                         ~~~~~~~~~~
     159 |                 }
         |                 ~
   fs/netfs/write_collect.c:137:26: note: initialize the variable 'fpos' to silence this warning
     137 |                 unsigned long long fpos, fend;
         |                                        ^
         |                                         = 0
   1 warning generated.


vim +155 fs/netfs/write_collect.c

   111	
   112	/*
   113	 * Unlock any folios we've finished with.
   114	 */
   115	static void netfs_writeback_unlock_folios(struct netfs_io_request *wreq,
   116						  unsigned int *notes)
   117	{
   118		struct bvecq *bvecq = wreq->collect_cursor.bvecq;
   119		unsigned long long collected_to = wreq->collected_to;
   120		unsigned int slot = wreq->collect_cursor.slot;
   121	
   122		if (WARN_ON_ONCE(!bvecq)) {
   123			pr_err("[!] Writeback unlock found empty buffer!\n");
   124			netfs_dump_request(wreq);
   125			return;
   126		}
   127	
   128		if (wreq->origin == NETFS_PGPRIV2_COPY_TO_CACHE) {
   129			if (netfs_pgpriv2_unlock_copied_folios(wreq))
   130				*notes |= MADE_PROGRESS;
   131			return;
   132		}
   133	
   134		for (;;) {
   135			struct folio *folio;
   136			struct netfs_folio *finfo;
   137			unsigned long long fpos, fend;
   138			size_t fsize, flen;
   139	
   140			/* Try to clean up the head of the queue if it appears to be
   141			 * used up, but we need to be very careful - the cleanup can
   142			 * catch the dispatcher, which could lead to us having nothing
   143			 * left in the queue, causing the front and back pointers to
   144			 * end up on different tracks.  To avoid this, we must always
   145			 * keep at least one segment in the queue.
   146			 */
   147			if (!bvecq_acquire_slot(bvecq, slot)) {
   148				wreq->collect_cursor.slot = slot;
   149				if (!bvecq_delete_spent(&wreq->collect_cursor))
   150					return;
   151				bvecq = wreq->collect_cursor.bvecq;
   152				slot  = wreq->collect_cursor.slot;
   153			}
   154	
 > 155			if (!bvecq->bv[slot].bv_page) {
   156				WARN_ONCE(1, "R=%08x slot already cleared?\n", wreq->debug_id);
   157				fsize = bvecq->bv[slot].bv_len;
   158				goto skip;
   159			}
   160	
   161			folio = page_folio(bvecq->bv[slot].bv_page);
   162			if (WARN_ONCE(!folio_test_writeback(folio),
   163				      "R=%08x: folio %lx is not under writeback\n",
   164				      wreq->debug_id, folio->index))
   165				trace_netfs_folio(folio, netfs_folio_trace_not_under_wback);
   166	
   167			fpos = folio_pos(folio);
   168			fsize = folio_size(folio);
   169			finfo = netfs_folio_info(folio);
   170			flen = finfo ? finfo->dirty_offset + finfo->dirty_len : fsize;
   171	
   172			fend = min_t(unsigned long long, fpos + flen, wreq->i_size);
   173	
   174			trace_netfs_collect_folio(wreq, folio, fend, collected_to);
   175	
   176			/* Unlock any folio we've transferred all of. */
   177			if (collected_to < fend)
   178				break;
   179	
   180			wreq->nr_group_rel += netfs_folio_written_back(folio);
   181			wreq->cleaned_to = fpos + fsize;
   182			*notes |= MADE_PROGRESS;
   183	
   184			bvecq->bv[slot].bv_page = NULL;
   185		skip:
   186			slot++;
   187			if (fpos + fsize >= collected_to)
   188				break;
   189		}
   190	
   191		wreq->collect_cursor.slot = slot;
   192	}
   193	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
