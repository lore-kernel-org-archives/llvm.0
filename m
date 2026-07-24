Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB112EEE8C;
	Fri, 24 Jul 2026 20:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784926456; cv=none; b=WKv2eKq/VYvQ8z3TMuJdSbWD35Zcc3W4hhYs125sG3RksgBbdaiz0fHIEKIPGne/97aFwuOFCzu45ZcTgabhHiLAWkpxqLrwO0rbfX04Xz4N4klMcL7mia+/FNtk8wI29NoYgP3BzsKUlWuVTkhpk8Z8UrpTuYkFHrYrzluFcEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784926456; c=relaxed/simple;
	bh=SgXE2FedyJCaD2X0uxkuiXeWdxQ0wjPCZxVzLS3jUps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EYaRbsR9uDJ05u+WZjJ57kVQf/g6/WNGINezGFVZwPnqmJ6SONrecMvdhb/S/xlDF2OulhCnxHq8JIWHl7uZxjmilltU6304adv0vStRyc7folGXQVd5RMmf3LpMmI9ltIb0RYYCRoeZUXwa9SToFpxQposBg8L7pEy66RuilNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZX57UAQQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZX57UAQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784926454; x=1816462454;
  h=date:from:to:cc:subject:message-id;
  bh=SgXE2FedyJCaD2X0uxkuiXeWdxQ0wjPCZxVzLS3jUps=;
  b=ZX57UAQQ5KSBpNYxTQFcgL3dDBHw1QFdPpOgm2aC1+JNGFIlEYkn7miX
   rDsZHe2LArq9YCFg5D1h4Jhf4JI+d64Umc1j76+oyU8FtHvZOt4KNxdtM
   J1SR2HZbVjvd1ymnc3HOx7xGJKjv5NJbR7hNljboSi50heMDv026bzBBB
   cuHuyEJIKgfHx2ocU2+aGXuPV6hqRV6FDwcAd1V9b6FJi+PbGn6NIZ7w2
   5teCfaIZV3bNrdFLHWUNRF5ACtWlUosxjher0g2+xoKENrRB2QGYy9r/a
   EMHEjEfyAlDzVhOqQTvWpH8mNVKmKHKO0OltrYGhT9xQyyGl77AQJjw6d
   g==;
X-CSE-ConnectionGUID: d7xw8d/eQmOi9gg7Us8itw==
X-CSE-MsgGUID: R3ENqbayTeOY5gkvWMWreQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11855"; a="85643910"
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="85643910"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 13:54:13 -0700
X-CSE-ConnectionGUID: Ro4EltdMRQOn6tS2XWbPnQ==
X-CSE-MsgGUID: 45GqVu51RiCrKhFo4RTlEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,183,1779174000"; 
   d="scan'208";a="252481797"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Jul 2026 13:54:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnMuH-00000000bDr-1yps;
	Fri, 24 Jul 2026 20:54:09 +0000
Date: Sat, 25 Jul 2026 04:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-next 29/29] fs/netfs/write_issue.c:786:2:
 warning: label at end of compound statement is a C23 extension
Message-ID: <202607250444.gLdBSyxg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next
head:   ddfc7002233eb9ca7143c363820b7480d5f705de
commit: ddfc7002233eb9ca7143c363820b7480d5f705de [29/29] netfs: Combine prepare and issue ops and grab the buffers on request
config: riscv-randconfig-001-20260724 (https://download.01.org/0day-ci/archive/20260725/202607250444.gLdBSyxg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260725/202607250444.gLdBSyxg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607250444.gLdBSyxg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/write_issue.c:786:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     786 |         } while ((folio = writeback_iter(mapping, wbc, folio, &error)));
         |         ^
   1 warning generated.


vim +786 fs/netfs/write_issue.c

1ca4169c391c37 David Howells 2024-10-02  717  
288ace2f57c9d0 David Howells 2024-03-18  718  /*
288ace2f57c9d0 David Howells 2024-03-18  719   * Write some of the pending data back to the server
288ace2f57c9d0 David Howells 2024-03-18  720   */
2df86547b23dab David Howells 2024-03-08  721  int netfs_writepages(struct address_space *mapping,
288ace2f57c9d0 David Howells 2024-03-18  722  		     struct writeback_control *wbc)
288ace2f57c9d0 David Howells 2024-03-18  723  {
288ace2f57c9d0 David Howells 2024-03-18  724  	struct netfs_inode *ictx = netfs_inode(mapping->host);
288ace2f57c9d0 David Howells 2024-03-18  725  	struct netfs_io_request *wreq = NULL;
ddfc7002233eb9 David Howells 2026-04-09  726  	struct netfs_wb_params params = {};
288ace2f57c9d0 David Howells 2024-03-18  727  	struct folio *folio;
288ace2f57c9d0 David Howells 2024-03-18  728  	int error = 0;
288ace2f57c9d0 David Howells 2024-03-18  729  
41376400c4717f David Howells 2026-06-25  730  	if (!netfs_wb_begin(ictx, wbc->sync_mode == WB_SYNC_NONE))
288ace2f57c9d0 David Howells 2024-03-18  731  		return 0;
288ace2f57c9d0 David Howells 2024-03-18  732  
288ace2f57c9d0 David Howells 2024-03-18  733  	/* Need the first folio to be able to set up the op. */
288ace2f57c9d0 David Howells 2024-03-18  734  	folio = writeback_iter(mapping, wbc, NULL, &error);
288ace2f57c9d0 David Howells 2024-03-18  735  	if (!folio)
288ace2f57c9d0 David Howells 2024-03-18  736  		goto out;
288ace2f57c9d0 David Howells 2024-03-18  737  
288ace2f57c9d0 David Howells 2024-03-18  738  	wreq = netfs_create_write_req(mapping, NULL, folio_pos(folio), NETFS_WRITEBACK);
288ace2f57c9d0 David Howells 2024-03-18  739  	if (IS_ERR(wreq)) {
288ace2f57c9d0 David Howells 2024-03-18  740  		error = PTR_ERR(wreq);
288ace2f57c9d0 David Howells 2024-03-18  741  		goto couldnt_start;
288ace2f57c9d0 David Howells 2024-03-18  742  	}
288ace2f57c9d0 David Howells 2024-03-18  743  
9920a8c10ad11f David Howells 2026-04-09  744  	if (bvecq_buffer_init(&wreq->load_cursor, GFP_NOFS) < 0)
9920a8c10ad11f David Howells 2026-04-09  745  		goto nomem;
ddfc7002233eb9 David Howells 2026-04-09  746  	bvecq_pos_set(&params.dispatch_cursor, &wreq->load_cursor);
ddfc7002233eb9 David Howells 2026-04-09  747  	bvecq_pos_set(&wreq->collect_cursor, &wreq->load_cursor);
9920a8c10ad11f David Howells 2026-04-09  748  
2b1424cd131cfa David Howells 2025-05-19  749  	__set_bit(NETFS_RREQ_OFFLOAD_COLLECTION, &wreq->flags);
288ace2f57c9d0 David Howells 2024-03-18  750  	trace_netfs_write(wreq, netfs_write_trace_writeback);
4824e5917f907c David Howells 2024-03-26  751  	netfs_stat(&netfs_n_wh_writepages);
288ace2f57c9d0 David Howells 2024-03-18  752  
ddfc7002233eb9 David Howells 2026-04-09  753  	if (wreq->io_streams[1].avail)
ddfc7002233eb9 David Howells 2026-04-09  754  		params.notes |= NOTE_CACHE_AVAIL;
ddfc7002233eb9 David Howells 2026-04-09  755  
288ace2f57c9d0 David Howells 2024-03-18  756  	do {
ddfc7002233eb9 David Howells 2026-04-09  757  		_debug("wbiter %lx", folio->index);
288ace2f57c9d0 David Howells 2024-03-18  758  
ddfc7002233eb9 David Howells 2026-04-09  759  		if (!wreq->spare) {
ddfc7002233eb9 David Howells 2026-04-09  760  			wreq->spare = bvecq_alloc_one(BVECQ_STD_SLOTS, GFP_NOFS);
ddfc7002233eb9 David Howells 2026-04-09  761  			if (!wreq->spare) {
ddfc7002233eb9 David Howells 2026-04-09  762  				folio_redirty_for_writepage(wbc, folio);
ddfc7002233eb9 David Howells 2026-04-09  763  				folio_unlock(folio);
ddfc7002233eb9 David Howells 2026-04-09  764  				error = -ENOMEM;
ddfc7002233eb9 David Howells 2026-04-09  765  				goto end_loop;
ddfc7002233eb9 David Howells 2026-04-09  766  			}
ddfc7002233eb9 David Howells 2026-04-09  767  		}
288ace2f57c9d0 David Howells 2024-03-18  768  
288ace2f57c9d0 David Howells 2024-03-18  769  		if (netfs_folio_group(folio) != NETFS_FOLIO_COPY_TO_CACHE &&
288ace2f57c9d0 David Howells 2024-03-18  770  		    unlikely(!test_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags))) {
288ace2f57c9d0 David Howells 2024-03-18  771  			set_bit(NETFS_RREQ_UPLOAD_TO_SERVER, &wreq->flags);
288ace2f57c9d0 David Howells 2024-03-18  772  			wreq->netfs_ops->begin_writeback(wreq);
ddfc7002233eb9 David Howells 2026-04-09  773  			if (wreq->io_streams[0].avail) {
ddfc7002233eb9 David Howells 2026-04-09  774  				params.notes |= NOTE_UPLOAD_AVAIL;
ddfc7002233eb9 David Howells 2026-04-09  775  				/* Order setting the active flag after other fields. */
ddfc7002233eb9 David Howells 2026-04-09  776  				smp_store_release(&wreq->io_streams[0].active, true);
288ace2f57c9d0 David Howells 2024-03-18  777  			}
b6a713fd34b949 David Howells 2026-06-25  778  		}
ddfc7002233eb9 David Howells 2026-04-09  779  
ddfc7002233eb9 David Howells 2026-04-09  780  		params.notes &= NOTES__KEEP_MASK;
ddfc7002233eb9 David Howells 2026-04-09  781  		netfs_queue_wb_folio(wreq, wbc, folio, &params);
ddfc7002233eb9 David Howells 2026-04-09  782  		error = netfs_issue_streams(wreq, &params);
ddfc7002233eb9 David Howells 2026-04-09  783  		if (!error)
ddfc7002233eb9 David Howells 2026-04-09  784  			bvecq_pos_step(&params.dispatch_cursor);
ddfc7002233eb9 David Howells 2026-04-09  785  end_loop:
288ace2f57c9d0 David Howells 2024-03-18 @786  	} while ((folio = writeback_iter(mapping, wbc, folio, &error)));
288ace2f57c9d0 David Howells 2024-03-18  787  
ddfc7002233eb9 David Howells 2026-04-09  788  	netfs_end_issue_write(wreq, &params);
ddfc7002233eb9 David Howells 2026-04-09  789  
9920a8c10ad11f David Howells 2026-04-09  790  	bvecq_pos_unset(&wreq->load_cursor);
ddfc7002233eb9 David Howells 2026-04-09  791  	bvecq_pos_unset(&params.dispatch_cursor);
ddfc7002233eb9 David Howells 2026-04-09  792  	for (int i = 0; i < NR_IO_STREAMS; i++)
ddfc7002233eb9 David Howells 2026-04-09  793  		bvecq_pos_unset(&wreq->io_streams[i].dispatch_cursor);
2b1424cd131cfa David Howells 2025-05-19  794  	netfs_wake_collector(wreq);
288ace2f57c9d0 David Howells 2024-03-18  795  
20d72b00ca814d David Howells 2025-05-19  796  	netfs_put_request(wreq, netfs_rreq_trace_put_return);
a9d47a50cf257f David Howells 2024-07-18  797  	_leave(" = %d", error);
288ace2f57c9d0 David Howells 2024-03-18  798  	return error;
288ace2f57c9d0 David Howells 2024-03-18  799  
9920a8c10ad11f David Howells 2026-04-09  800  nomem:
9920a8c10ad11f David Howells 2026-04-09  801  	error = -ENOMEM;
9920a8c10ad11f David Howells 2026-04-09  802  	netfs_put_failed_request(wreq);
288ace2f57c9d0 David Howells 2024-03-18  803  couldnt_start:
ac5f95ac5d6d0f David Howells 2026-06-25  804  	if (error == -ENOMEM) {
ac5f95ac5d6d0f David Howells 2026-06-25  805  		folio_redirty_for_writepage(wbc, folio);
ac5f95ac5d6d0f David Howells 2026-06-25  806  		folio_unlock(folio);
ac5f95ac5d6d0f David Howells 2026-06-25  807  		folio = writeback_iter(mapping, wbc, folio, &error);
ac5f95ac5d6d0f David Howells 2026-06-25  808  		WARN_ON_ONCE(folio != NULL);
ac5f95ac5d6d0f David Howells 2026-06-25  809  	} else {
288ace2f57c9d0 David Howells 2024-03-18  810  		netfs_kill_dirty_pages(mapping, wbc, folio);
ac5f95ac5d6d0f David Howells 2026-06-25  811  	}
288ace2f57c9d0 David Howells 2024-03-18  812  out:
41376400c4717f David Howells 2026-06-25  813  	netfs_wb_end(ictx);
a9d47a50cf257f David Howells 2024-07-18  814  	_leave(" = %d", error);
288ace2f57c9d0 David Howells 2024-03-18  815  	return error;
288ace2f57c9d0 David Howells 2024-03-18  816  }
2df86547b23dab David Howells 2024-03-08  817  EXPORT_SYMBOL(netfs_writepages);
288ace2f57c9d0 David Howells 2024-03-18  818  

:::::: The code at line 786 was first introduced by commit
:::::: 288ace2f57c9d06dd2e42bd80d03747d879a4068 netfs: New writeback implementation

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
