Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875AB175A89;
	Thu, 16 Jul 2026 00:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784162991; cv=none; b=P0dRyzeuZX2hbZKigdtZ0CDtgoXNx+verIM4olN4SYn+y0gjs5dC5gq1HcjjVh2dNly1O/ke7FKU2X4NsJnrdrxohV8hweD/dbAOC7cp/I+gBhZWgPL81Rocj58Empg+D4dHBqE1Fo/lvPL6t+GKEIXAqR7NVe0BIQHykSZy+fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784162991; c=relaxed/simple;
	bh=taO0jBfNaw6Hu0IMAouQXhQGkOBYtbHIqsf4+9VGeVI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VOnrURXM2o7Qr2QB2pQKYp0ok9cE4PmMUpqoC/zwJxqMeYcDEH3n6irZBerUssmH5fHRQAJrxaufNjH4jH+UUpG+3uXTr4qxGbl2mvP3eNIkZqF87n8X00IuxsJspSV0i/Zq6fK0YCFzsBGeW2O40vMNsIB4pWlmi0yaetGJcTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqa0kLsC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqa0kLsC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784162989; x=1815698989;
  h=date:from:to:cc:subject:message-id;
  bh=taO0jBfNaw6Hu0IMAouQXhQGkOBYtbHIqsf4+9VGeVI=;
  b=eqa0kLsC8YLpxIcENXBD9ZaQPNNzi9ghCtoTac3sMwC4x3ATqLC54XOF
   I4RjTX7T34GKOO9o5Cx4hSOZygm/NlC1VGR6cCCTNfFt6pX5M/9W0xR0H
   54qr61BJ+pGC0VNboAlAzgYMtOPeh1mOu9LMCEhlUOtqmcV+n17IJb5gA
   jfzW6XnCaNNu1y66uEO6+zjoGQsyvnvLKlhnGo+Tycpx5lszEPzCZjHso
   U2mammM5Xp8Ko0DzLxLbnSCV7Z2YuqS1rLEjJqoURsFR1Y7sIMHQTuSyC
   lZ6lC6ht3VGZ6ymNrblJuVuIyvsjgrqJsUd6ZJe8ZLoDiYT473onq/Ic8
   g==;
X-CSE-ConnectionGUID: zz3MCkCWQryt2pOYA1LFpQ==
X-CSE-MsgGUID: tkGC+mAUTzii4nV2Zld6qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="88641146"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="88641146"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 17:49:48 -0700
X-CSE-ConnectionGUID: d69u0syQTNWV39z0yaDFfQ==
X-CSE-MsgGUID: +O3OSACUScK5jJyEaxmacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; 
   d="scan'208";a="279610887"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Jul 2026 17:49:46 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkAIK-000000004QJ-26ds;
	Thu, 16 Jul 2026 00:49:44 +0000
Date: Thu, 16 Jul 2026 02:49:32 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 23/23] fs/netfs/write_issue.c:783:2:
 warning: label at end of compound statement is a C23 extension
Message-ID: <202607160245.uuxr7hPE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   796ea75f9f613fed6508719a8a1a71e3b1aededc
commit: 796ea75f9f613fed6508719a8a1a71e3b1aededc [23/23] netfs: Combine prepare and issue ops and grab the buffers on request
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260716/202607160245.uuxr7hPE-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260716/202607160245.uuxr7hPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607160245.uuxr7hPE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/write_issue.c:783:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     783 |         } while ((folio = writeback_iter(mapping, wbc, folio, &error)));
         |         ^
   1 warning generated.


vim +783 fs/netfs/write_issue.c

1ca4169c391c37 David Howells 2024-10-02  714  
288ace2f57c9d0 David Howells 2024-03-18  715  /*
288ace2f57c9d0 David Howells 2024-03-18  716   * Write some of the pending data back to the server
288ace2f57c9d0 David Howells 2024-03-18  717   */
2df86547b23dab David Howells 2024-03-08  718  int netfs_writepages(struct address_space *mapping,
288ace2f57c9d0 David Howells 2024-03-18  719  		     struct writeback_control *wbc)
288ace2f57c9d0 David Howells 2024-03-18  720  {
288ace2f57c9d0 David Howells 2024-03-18  721  	struct netfs_inode *ictx = netfs_inode(mapping->host);
288ace2f57c9d0 David Howells 2024-03-18  722  	struct netfs_io_request *wreq = NULL;
796ea75f9f613f David Howells 2026-04-09  723  	struct netfs_wb_params params = {};
288ace2f57c9d0 David Howells 2024-03-18  724  	struct folio *folio;
288ace2f57c9d0 David Howells 2024-03-18  725  	int error = 0;
288ace2f57c9d0 David Howells 2024-03-18  726  
41376400c4717f David Howells 2026-06-25  727  	if (!netfs_wb_begin(ictx, wbc->sync_mode == WB_SYNC_NONE))
288ace2f57c9d0 David Howells 2024-03-18  728  		return 0;
288ace2f57c9d0 David Howells 2024-03-18  729  
288ace2f57c9d0 David Howells 2024-03-18  730  	/* Need the first folio to be able to set up the op. */
288ace2f57c9d0 David Howells 2024-03-18  731  	folio = writeback_iter(mapping, wbc, NULL, &error);
288ace2f57c9d0 David Howells 2024-03-18  732  	if (!folio)
288ace2f57c9d0 David Howells 2024-03-18  733  		goto out;
288ace2f57c9d0 David Howells 2024-03-18  734  
288ace2f57c9d0 David Howells 2024-03-18  735  	wreq = netfs_create_write_req(mapping, NULL, folio_pos(folio), NETFS_WRITEBACK);
288ace2f57c9d0 David Howells 2024-03-18  736  	if (IS_ERR(wreq)) {
288ace2f57c9d0 David Howells 2024-03-18  737  		error = PTR_ERR(wreq);
288ace2f57c9d0 David Howells 2024-03-18  738  		goto couldnt_start;
288ace2f57c9d0 David Howells 2024-03-18  739  	}
288ace2f57c9d0 David Howells 2024-03-18  740  
2e24b86f3a5edd David Howells 2026-04-09  741  	if (bvecq_buffer_init(&wreq->load_cursor, GFP_NOFS) < 0)
2e24b86f3a5edd David Howells 2026-04-09  742  		goto nomem;
796ea75f9f613f David Howells 2026-04-09  743  	bvecq_pos_set(&params.dispatch_cursor, &wreq->load_cursor);
796ea75f9f613f David Howells 2026-04-09  744  	bvecq_pos_set(&wreq->collect_cursor, &wreq->load_cursor);
2e24b86f3a5edd David Howells 2026-04-09  745  
2b1424cd131cfa David Howells 2025-05-19  746  	__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &wreq->flags);
288ace2f57c9d0 David Howells 2024-03-18  747  	trace_netfs_write(wreq, netfs_write_trace_writeback);
4824e5917f907c David Howells 2024-03-26  748  	netfs_stat(&netfs_n_wh_writepages);
288ace2f57c9d0 David Howells 2024-03-18  749  
796ea75f9f613f David Howells 2026-04-09  750  	if (wreq->io_streams[1].avail)
796ea75f9f613f David Howells 2026-04-09  751  		params.notes |= NOTE_CACHE_AVAIL;
796ea75f9f613f David Howells 2026-04-09  752  
288ace2f57c9d0 David Howells 2024-03-18  753  	do {
796ea75f9f613f David Howells 2026-04-09  754  		_debug("wbiter %lx", folio->index);
288ace2f57c9d0 David Howells 2024-03-18  755  
796ea75f9f613f David Howells 2026-04-09  756  		if (!wreq->spare) {
796ea75f9f613f David Howells 2026-04-09  757  			wreq->spare = bvecq_alloc_one(BVECQ_STD_SLOTS, GFP_NOFS);
796ea75f9f613f David Howells 2026-04-09  758  			if (!wreq->spare) {
796ea75f9f613f David Howells 2026-04-09  759  				folio_redirty_for_writepage(wbc, folio);
796ea75f9f613f David Howells 2026-04-09  760  				folio_unlock(folio);
796ea75f9f613f David Howells 2026-04-09  761  				error = -ENOMEM;
796ea75f9f613f David Howells 2026-04-09  762  				goto end_loop;
796ea75f9f613f David Howells 2026-04-09  763  			}
796ea75f9f613f David Howells 2026-04-09  764  		}
288ace2f57c9d0 David Howells 2024-03-18  765  
288ace2f57c9d0 David Howells 2024-03-18  766  		if (netfs_folio_group(folio) != NETFS_FOLIO_COPY_TO_CACHE &&
288ace2f57c9d0 David Howells 2024-03-18  767  		    unlikely(!test_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))) {
288ace2f57c9d0 David Howells 2024-03-18  768  			set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
288ace2f57c9d0 David Howells 2024-03-18  769  			wreq->netfs_ops->begin_writeback(wreq);
796ea75f9f613f David Howells 2026-04-09  770  			if (wreq->io_streams[0].avail) {
796ea75f9f613f David Howells 2026-04-09  771  				params.notes |= NOTE_UPLOAD_AVAIL;
796ea75f9f613f David Howells 2026-04-09  772  				/* Order setting the active flag after other fields. */
796ea75f9f613f David Howells 2026-04-09  773  				smp_store_release(&wreq->io_streams[0].active, true);
288ace2f57c9d0 David Howells 2024-03-18  774  			}
b6a713fd34b949 David Howells 2026-06-25  775  		}
796ea75f9f613f David Howells 2026-04-09  776  
796ea75f9f613f David Howells 2026-04-09  777  		params.notes &= NOTES__KEEP_MASK;
796ea75f9f613f David Howells 2026-04-09  778  		netfs_queue_wb_folio(wreq, wbc, folio, &params);
796ea75f9f613f David Howells 2026-04-09  779  		error = netfs_issue_streams(wreq, &params);
796ea75f9f613f David Howells 2026-04-09  780  		if (!error)
796ea75f9f613f David Howells 2026-04-09  781  			bvecq_pos_step(&params.dispatch_cursor);
796ea75f9f613f David Howells 2026-04-09  782  end_loop:
288ace2f57c9d0 David Howells 2024-03-18 @783  	} while ((folio = writeback_iter(mapping, wbc, folio, &error)));
288ace2f57c9d0 David Howells 2024-03-18  784  
796ea75f9f613f David Howells 2026-04-09  785  	netfs_end_issue_write(wreq, &params);
796ea75f9f613f David Howells 2026-04-09  786  
2e24b86f3a5edd David Howells 2026-04-09  787  	bvecq_pos_unset(&wreq->load_cursor);
796ea75f9f613f David Howells 2026-04-09  788  	bvecq_pos_unset(&params.dispatch_cursor);
796ea75f9f613f David Howells 2026-04-09  789  	for (int i = 0; i < NR_IO_STREAMS; i++)
796ea75f9f613f David Howells 2026-04-09  790  		bvecq_pos_unset(&wreq->io_streams[i].dispatch_cursor);
2b1424cd131cfa David Howells 2025-05-19  791  	netfs_wake_collector(wreq);
288ace2f57c9d0 David Howells 2024-03-18  792  
20d72b00ca814d David Howells 2025-05-19  793  	netfs_put_request(wreq, netfs_rreq_trace_put_return);
a9d47a50cf257f David Howells 2024-07-18  794  	_leave(" = %d", error);
288ace2f57c9d0 David Howells 2024-03-18  795  	return error;
288ace2f57c9d0 David Howells 2024-03-18  796  
2e24b86f3a5edd David Howells 2026-04-09  797  nomem:
2e24b86f3a5edd David Howells 2026-04-09  798  	error = -ENOMEM;
2e24b86f3a5edd David Howells 2026-04-09  799  	netfs_put_failed_request(wreq);
288ace2f57c9d0 David Howells 2024-03-18  800  couldnt_start:
ac5f95ac5d6d0f David Howells 2026-06-25  801  	if (error == -ENOMEM) {
ac5f95ac5d6d0f David Howells 2026-06-25  802  		folio_redirty_for_writepage(wbc, folio);
ac5f95ac5d6d0f David Howells 2026-06-25  803  		folio_unlock(folio);
ac5f95ac5d6d0f David Howells 2026-06-25  804  		folio = writeback_iter(mapping, wbc, folio, &error);
ac5f95ac5d6d0f David Howells 2026-06-25  805  		WARN_ON_ONCE(folio != NULL);
ac5f95ac5d6d0f David Howells 2026-06-25  806  	} else {
288ace2f57c9d0 David Howells 2024-03-18  807  		netfs_kill_dirty_pages(mapping, wbc, folio);
ac5f95ac5d6d0f David Howells 2026-06-25  808  	}
288ace2f57c9d0 David Howells 2024-03-18  809  out:
41376400c4717f David Howells 2026-06-25  810  	netfs_wb_end(ictx);
a9d47a50cf257f David Howells 2024-07-18  811  	_leave(" = %d", error);
288ace2f57c9d0 David Howells 2024-03-18  812  	return error;
288ace2f57c9d0 David Howells 2024-03-18  813  }
2df86547b23dab David Howells 2024-03-08  814  EXPORT_SYMBOL(netfs_writepages);
288ace2f57c9d0 David Howells 2024-03-18  815  

:::::: The code at line 783 was first introduced by commit
:::::: 288ace2f57c9d06dd2e42bd80d03747d879a4068 netfs: New writeback implementation

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
