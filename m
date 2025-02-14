Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BF2149C7D;
	Fri, 14 Feb 2025 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526173; cv=none; b=IX02z09i1CyOx85KP9RkhW5T4qKdajPzZwlQQYzjhzVXogddi4SeFNblVssiATU92JN1wKqfRS/vuVtwrRrUttw2uAMKLRTXyUA5cwNd4OyCHtdl//bMMWoqYW3fJiAiu8UfoS1+AJZbYbhewZPYsychQh1vuOMQHCkZ+B6mhgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526173; c=relaxed/simple;
	bh=IwGdsHLTJTf3sJv01i9+OTJeSQ60FiFX5xb8eyByVGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E1dEyI9tv6T+/Gh5HUeR/6dc4zPxCxpjbjqQOHjR4Z+eEMlMAkQ5yK21PruGYmpUzRTajH4x8S5pRrNpPsAWt0V+YFvPlBzPqTQcceD9DxVLUky2av5UPsmyJ9qaaPe0Nqc0ajjqdG9svj7yvB6sBTjZXOkv3pXh6JC1Uq2CL9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcR6Aqfc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcR6Aqfc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739526170; x=1771062170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IwGdsHLTJTf3sJv01i9+OTJeSQ60FiFX5xb8eyByVGw=;
  b=YcR6Aqfcg6B5jX/cxPitMya2rynt7LT9C3JhVBC0eRdk6P/TO/ln1Q4M
   wQSKJCUngHRsZWsTY52n69AijUUeUOSSVSAqQfbWaDPn15OQ3uHlkANqY
   KqD5MKgs5PDVTsyOFWiMNXskdMMvUz/5Oa6dkPckQ1Xps6OJg8EuMAY4i
   QCI4j+V0LHbshOLiNwvu4a5ulv4UdrDedD5iyREDyhgUeBYDpV38iD9fP
   O1tivM/r4wImbz07xBzabEmQD9Fa8NtU8Wc65dMsX4td4dZKJKzYOKBW7
   zx8LU74I24A9ZOVZUwk8LEfxQ3PxXQ6nBu/TatkO8VEhUWf/DgtkzZRJE
   Q==;
X-CSE-ConnectionGUID: bASKcFa3QzW1BRy9PpVNaA==
X-CSE-MsgGUID: D3szxgQRRjKR76oZEa/FgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="65620614"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="65620614"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 01:42:49 -0800
X-CSE-ConnectionGUID: RmP0bWMpQpWcuthkJTTXSg==
X-CSE-MsgGUID: oiMf7tguQoqIna4uRIoNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113394707"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2025 01:42:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tisDd-0019Kp-2n;
	Fri, 14 Feb 2025 09:42:45 +0000
Date: Fri, 14 Feb 2025 17:42:04 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:s390x-file-thp2 2/3] mm/vmscan.c:1401:4: error:
 call to undeclared function 'try_to_unmap_flush_dirty'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202502141745.NTpcQN3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux s390x-file-thp2
head:   151d01a70e34570508ec9aeb7614bcc540ed8bf9
commit: c6ce243b304f3f2e5c109fe0418c2a82cd1c8edd [2/3] tmp
config: arm-randconfig-001-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141745.NTpcQN3s-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141745.NTpcQN3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141745.NTpcQN3s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/vmscan.c:1401:4: error: call to undeclared function 'try_to_unmap_flush_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           try_to_unmap_flush_dirty();
                           ^
>> mm/vmscan.c:1517:4: error: call to undeclared function 'try_to_unmap_flush'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           try_to_unmap_flush();
                           ^
   mm/vmscan.c:1517:4: note: did you mean 'try_to_unmap'?
   include/linux/rmap.h:814:20: note: 'try_to_unmap' declared here
   static inline void try_to_unmap(struct folio *folio, enum ttu_flags flags)
                      ^
   mm/vmscan.c:1586:2: error: call to undeclared function 'try_to_unmap_flush'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           try_to_unmap_flush();
           ^
   3 errors generated.


vim +/try_to_unmap_flush_dirty +1401 mm/vmscan.c

d791ea676b6648 NeilBrown               2022-05-09  1078  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1079  /*
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1080)  * shrink_folio_list() returns the number of reclaimed pages
^1da177e4c3f41 Linus Torvalds          2005-04-16  1081   */
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1082) static unsigned int shrink_folio_list(struct list_head *folio_list,
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1083) 		struct pglist_data *pgdat, struct scan_control *sc,
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1084) 		struct reclaim_stat *stat, bool ignore_references)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1085  {
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1086) 	struct folio_batch free_folios;
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1087) 	LIST_HEAD(ret_folios);
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1088) 	LIST_HEAD(demote_folios);
a479b078fddb0a Li Zhijian              2025-01-10  1089  	unsigned int nr_reclaimed = 0, nr_demoted = 0;
730ec8c01a2bd6 Maninder Singh          2020-06-03  1090  	unsigned int pgactivate = 0;
26aa2d199d6f2c Dave Hansen             2021-09-02  1091  	bool do_demote_pass;
2282679fb20bf0 NeilBrown               2022-05-09  1092  	struct swap_iocb *plug = NULL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1093  
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1094) 	folio_batch_init(&free_folios);
060f005f074791 Kirill Tkhai            2019-03-05  1095  	memset(stat, 0, sizeof(*stat));
^1da177e4c3f41 Linus Torvalds          2005-04-16  1096  	cond_resched();
26aa2d199d6f2c Dave Hansen             2021-09-02  1097  	do_demote_pass = can_demote(pgdat->node_id, sc);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1098  
26aa2d199d6f2c Dave Hansen             2021-09-02  1099  retry:
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1100) 	while (!list_empty(folio_list)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  1101  		struct address_space *mapping;
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  1102) 		struct folio *folio;
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1103) 		enum folio_references references = FOLIOREF_RECLAIM;
d791ea676b6648 NeilBrown               2022-05-09  1104  		bool dirty, writeback;
98879b3b9edc16 Yang Shi                2019-07-11  1105  		unsigned int nr_pages;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1106  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1107  		cond_resched();
^1da177e4c3f41 Linus Torvalds          2005-04-16  1108  
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1109) 		folio = lru_to_folio(folio_list);
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  1110) 		list_del(&folio->lru);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1111  
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1112) 		if (!folio_trylock(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  1113  			goto keep;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1114  
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1115) 		VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1116  
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1117) 		nr_pages = folio_nr_pages(folio);
98879b3b9edc16 Yang Shi                2019-07-11  1118  
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1119) 		/* Account the number of base pages */
98879b3b9edc16 Yang Shi                2019-07-11  1120  		sc->nr_scanned += nr_pages;
80e4342601abfa Christoph Lameter       2006-02-11  1121  
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1122) 		if (unlikely(!folio_evictable(folio)))
ad6b67041a4549 Minchan Kim             2017-05-03  1123  			goto activate_locked;
894bc310419ac9 Lee Schermerhorn        2008-10-18  1124  
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1125) 		if (!sc->may_unmap && folio_mapped(folio))
80e4342601abfa Christoph Lameter       2006-02-11  1126  			goto keep_locked;
80e4342601abfa Christoph Lameter       2006-02-11  1127  
e2be15f6c3eece Mel Gorman              2013-07-03  1128  		/*
894befec4d70b1 Andrey Ryabinin         2018-04-10  1129  		 * The number of dirty pages determines if a node is marked
8cd7c588decf47 Mel Gorman              2021-11-05  1130  		 * reclaim_congested. kswapd will stall and start writing
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1131) 		 * folios if the tail of the LRU is all dirty unqueued folios.
e2be15f6c3eece Mel Gorman              2013-07-03  1132  		 */
e20c41b1091a24 Matthew Wilcox (Oracle  2022-01-17  1133) 		folio_check_dirty_writeback(folio, &dirty, &writeback);
e2be15f6c3eece Mel Gorman              2013-07-03  1134  		if (dirty || writeback)
c79b7b96db8b12 Matthew Wilcox (Oracle  2022-01-17  1135) 			stat->nr_dirty += nr_pages;
e2be15f6c3eece Mel Gorman              2013-07-03  1136  
e2be15f6c3eece Mel Gorman              2013-07-03  1137  		if (dirty && !writeback)
c79b7b96db8b12 Matthew Wilcox (Oracle  2022-01-17  1138) 			stat->nr_unqueued_dirty += nr_pages;
e2be15f6c3eece Mel Gorman              2013-07-03  1139  
d04e8acd03e5c3 Mel Gorman              2013-07-03  1140  		/*
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1141) 		 * Treat this folio as congested if folios are cycling
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1142) 		 * through the LRU so quickly that the folios marked
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1143) 		 * for immediate reclaim are making it to the end of
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1144) 		 * the LRU a second time.
d04e8acd03e5c3 Mel Gorman              2013-07-03  1145  		 */
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1146) 		if (writeback && folio_test_reclaim(folio))
c79b7b96db8b12 Matthew Wilcox (Oracle  2022-01-17  1147) 			stat->nr_congested += nr_pages;
e2be15f6c3eece Mel Gorman              2013-07-03  1148  
e62e384e9da8d9 Michal Hocko            2012-07-31  1149  		/*
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1150) 		 * If a folio at the tail of the LRU is under writeback, there
283aba9f9e0e48 Mel Gorman              2013-07-03  1151  		 * are three cases to consider.
283aba9f9e0e48 Mel Gorman              2013-07-03  1152  		 *
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1153) 		 * 1) If reclaim is encountering an excessive number
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1154) 		 *    of folios under writeback and this folio has both
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1155) 		 *    the writeback and reclaim flags set, then it
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1156) 		 *    indicates that folios are being queued for I/O but
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1157) 		 *    are being recycled through the LRU before the I/O
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1158) 		 *    can complete. Waiting on the folio itself risks an
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1159) 		 *    indefinite stall if it is impossible to writeback
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1160) 		 *    the folio due to I/O error or disconnected storage
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1161) 		 *    so instead note that the LRU is being scanned too
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1162) 		 *    quickly and the caller can stall after the folio
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1163) 		 *    list has been processed.
283aba9f9e0e48 Mel Gorman              2013-07-03  1164  		 *
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1165) 		 * 2) Global or new memcg reclaim encounters a folio that is
ecf5fc6e9654cd Michal Hocko            2015-08-04  1166  		 *    not marked for immediate reclaim, or the caller does not
ecf5fc6e9654cd Michal Hocko            2015-08-04  1167  		 *    have __GFP_FS (or __GFP_IO if it's simply going to swap,
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1168) 		 *    not to fs). In this case mark the folio for immediate
97c9341f727105 Tejun Heo               2015-05-22  1169  		 *    reclaim and continue scanning.
283aba9f9e0e48 Mel Gorman              2013-07-03  1170  		 *
d791ea676b6648 NeilBrown               2022-05-09  1171  		 *    Require may_enter_fs() because we would wait on fs, which
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1172) 		 *    may not have submitted I/O yet. And the loop driver might
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1173) 		 *    enter reclaim, and deadlock if it waits on a folio for
283aba9f9e0e48 Mel Gorman              2013-07-03  1174  		 *    which it is needed to do the write (loop masks off
283aba9f9e0e48 Mel Gorman              2013-07-03  1175  		 *    __GFP_IO|__GFP_FS for this reason); but more thought
283aba9f9e0e48 Mel Gorman              2013-07-03  1176  		 *    would probably show more reasons.
283aba9f9e0e48 Mel Gorman              2013-07-03  1177  		 *
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1178) 		 * 3) Legacy memcg encounters a folio that already has the
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1179) 		 *    reclaim flag set. memcg does not have any dirty folio
283aba9f9e0e48 Mel Gorman              2013-07-03  1180  		 *    throttling so we could easily OOM just because too many
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1181) 		 *    folios are in writeback and there is nothing else to
283aba9f9e0e48 Mel Gorman              2013-07-03  1182  		 *    reclaim. Wait for the writeback to complete.
c55e8d035b28b2 Johannes Weiner         2017-02-24  1183  		 *
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1184) 		 * In cases 1) and 2) we activate the folios to get them out of
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1185) 		 * the way while we continue scanning for clean folios on the
c55e8d035b28b2 Johannes Weiner         2017-02-24  1186  		 * inactive list and refilling from the active list. The
c55e8d035b28b2 Johannes Weiner         2017-02-24  1187  		 * observation here is that waiting for disk writes is more
c55e8d035b28b2 Johannes Weiner         2017-02-24  1188  		 * expensive than potentially causing reloads down the line.
c55e8d035b28b2 Johannes Weiner         2017-02-24  1189  		 * Since they're marked for immediate reclaim, they won't put
c55e8d035b28b2 Johannes Weiner         2017-02-24  1190  		 * memory pressure on the cache working set any longer than it
c55e8d035b28b2 Johannes Weiner         2017-02-24  1191  		 * takes to write them to disk.
e62e384e9da8d9 Michal Hocko            2012-07-31  1192  		 */
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1193) 		if (folio_test_writeback(folio)) {
283aba9f9e0e48 Mel Gorman              2013-07-03  1194  			/* Case 1 above */
283aba9f9e0e48 Mel Gorman              2013-07-03  1195  			if (current_is_kswapd() &&
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1196) 			    folio_test_reclaim(folio) &&
599d0c954f91d0 Mel Gorman              2016-07-28  1197  			    test_bit(PGDAT_WRITEBACK, &pgdat->flags)) {
c79b7b96db8b12 Matthew Wilcox (Oracle  2022-01-17  1198) 				stat->nr_immediate += nr_pages;
c55e8d035b28b2 Johannes Weiner         2017-02-24  1199  				goto activate_locked;
283aba9f9e0e48 Mel Gorman              2013-07-03  1200  
283aba9f9e0e48 Mel Gorman              2013-07-03  1201  			/* Case 2 above */
b5ead35e7e1d34 Johannes Weiner         2019-11-30  1202  			} else if (writeback_throttling_sane(sc) ||
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1203) 			    !folio_test_reclaim(folio) ||
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1204) 			    !may_enter_fs(folio, sc->gfp_mask)) {
c3b94f44fcb072 Hugh Dickins            2012-07-31  1205  				/*
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1206) 				 * This is slightly racy -
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1207) 				 * folio_end_writeback() might have
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1208) 				 * just cleared the reclaim flag, then
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1209) 				 * setting the reclaim flag here ends up
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1210) 				 * interpreted as the readahead flag - but
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1211) 				 * that does not matter enough to care.
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1212) 				 * What we do want is for this folio to
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1213) 				 * have the reclaim flag set next time
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1214) 				 * memcg reclaim reaches the tests above,
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1215) 				 * so it will then wait for writeback to
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1216) 				 * avoid OOM; and it's also appropriate
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1217) 				 * in global reclaim.
c3b94f44fcb072 Hugh Dickins            2012-07-31  1218  				 */
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1219) 				folio_set_reclaim(folio);
c79b7b96db8b12 Matthew Wilcox (Oracle  2022-01-17  1220) 				stat->nr_writeback += nr_pages;
c55e8d035b28b2 Johannes Weiner         2017-02-24  1221  				goto activate_locked;
283aba9f9e0e48 Mel Gorman              2013-07-03  1222  
283aba9f9e0e48 Mel Gorman              2013-07-03  1223  			/* Case 3 above */
283aba9f9e0e48 Mel Gorman              2013-07-03  1224  			} else {
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1225) 				folio_unlock(folio);
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1226) 				folio_wait_writeback(folio);
d33e4e1412c8b6 Matthew Wilcox (Oracle  2022-05-12  1227) 				/* then go back and try same folio again */
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1228) 				list_add_tail(&folio->lru, folio_list);
7fadc820222497 Hugh Dickins            2015-09-08  1229  				continue;
e62e384e9da8d9 Michal Hocko            2012-07-31  1230  			}
283aba9f9e0e48 Mel Gorman              2013-07-03  1231  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1232  
8940b34a4e082a Minchan Kim             2019-09-25  1233  		if (!ignore_references)
d92013d1e5e47f Matthew Wilcox (Oracle  2022-02-15  1234) 			references = folio_check_references(folio, sc);
02c6de8d757cb3 Minchan Kim             2012-10-08  1235  
dfc8d636cdb95f Johannes Weiner         2010-03-05  1236  		switch (references) {
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1237) 		case FOLIOREF_ACTIVATE:
^1da177e4c3f41 Linus Torvalds          2005-04-16  1238  			goto activate_locked;
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1239) 		case FOLIOREF_KEEP:
98879b3b9edc16 Yang Shi                2019-07-11  1240  			stat->nr_ref_keep += nr_pages;
645747462435d8 Johannes Weiner         2010-03-05  1241  			goto keep_locked;
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1242) 		case FOLIOREF_RECLAIM:
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1243) 		case FOLIOREF_RECLAIM_CLEAN:
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1244) 			; /* try to reclaim the folio below */
dfc8d636cdb95f Johannes Weiner         2010-03-05  1245  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1246  
26aa2d199d6f2c Dave Hansen             2021-09-02  1247  		/*
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1248) 		 * Before reclaiming the folio, try to relocate
26aa2d199d6f2c Dave Hansen             2021-09-02  1249  		 * its contents to another node.
26aa2d199d6f2c Dave Hansen             2021-09-02  1250  		 */
26aa2d199d6f2c Dave Hansen             2021-09-02  1251  		if (do_demote_pass &&
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1252) 		    (thp_migration_supported() || !folio_test_large(folio))) {
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1253) 			list_add(&folio->lru, &demote_folios);
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1254) 			folio_unlock(folio);
26aa2d199d6f2c Dave Hansen             2021-09-02  1255  			continue;
26aa2d199d6f2c Dave Hansen             2021-09-02  1256  		}
26aa2d199d6f2c Dave Hansen             2021-09-02  1257  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1258  		/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  1259  		 * Anonymous process memory has backing store?
^1da177e4c3f41 Linus Torvalds          2005-04-16  1260  		 * Try to allocate it some swap space here.
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1261) 		 * Lazyfree folio could be freed directly
^1da177e4c3f41 Linus Torvalds          2005-04-16  1262  		 */
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1263) 		if (folio_test_anon(folio) && folio_test_swapbacked(folio)) {
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1264) 			if (!folio_test_swapcache(folio)) {
63eb6b93ce725e Hugh Dickins            2008-11-19  1265  				if (!(sc->gfp_mask & __GFP_IO))
63eb6b93ce725e Hugh Dickins            2008-11-19  1266  					goto keep_locked;
d4b4084ac3154c Matthew Wilcox (Oracle  2022-02-04  1267) 				if (folio_maybe_dma_pinned(folio))
feb889fb40fafc Linus Torvalds          2021-01-16  1268  					goto keep_locked;
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1269) 				if (folio_test_large(folio)) {
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1270) 					/* cannot split folio, skip it */
8710f6ed34e7bc David Hildenbrand       2024-08-02  1271  					if (!can_split_folio(folio, 1, NULL))
b8f593cd0896b8 Ying Huang              2017-07-06  1272  						goto activate_locked;
747552b1e71b40 Ying Huang              2017-07-06  1273  					/*
5ed890ce514785 Ryan Roberts            2024-04-08  1274  					 * Split partially mapped folios right away.
5ed890ce514785 Ryan Roberts            2024-04-08  1275  					 * We can free the unmapped pages without IO.
747552b1e71b40 Ying Huang              2017-07-06  1276  					 */
8422acdc97ed58 Usama Arif              2024-08-30  1277  					if (data_race(!list_empty(&folio->_deferred_list) &&
8422acdc97ed58 Usama Arif              2024-08-30  1278  					    folio_test_partially_mapped(folio)) &&
5ed890ce514785 Ryan Roberts            2024-04-08  1279  					    split_folio_to_list(folio, folio_list))
747552b1e71b40 Ying Huang              2017-07-06  1280  						goto activate_locked;
747552b1e71b40 Ying Huang              2017-07-06  1281  				}
09c02e56327bda Matthew Wilcox (Oracle  2022-05-12  1282) 				if (!add_to_swap(folio)) {
d0f048ac39f6a7 Barry Song              2024-04-12  1283  					int __maybe_unused order = folio_order(folio);
d0f048ac39f6a7 Barry Song              2024-04-12  1284  
09c02e56327bda Matthew Wilcox (Oracle  2022-05-12  1285) 					if (!folio_test_large(folio))
98879b3b9edc16 Yang Shi                2019-07-11  1286  						goto activate_locked_split;
bd4c82c22c367e Ying Huang              2017-09-06  1287  					/* Fallback to swap normal pages */
5ed890ce514785 Ryan Roberts            2024-04-08  1288  					if (split_folio_to_list(folio, folio_list))
0f0746589e4be0 Minchan Kim             2017-07-06  1289  						goto activate_locked;
fe490cc0fe9e6e Ying Huang              2017-09-06  1290  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
5ed890ce514785 Ryan Roberts            2024-04-08  1291  					if (nr_pages >= HPAGE_PMD_NR) {
5ed890ce514785 Ryan Roberts            2024-04-08  1292  						count_memcg_folio_events(folio,
5ed890ce514785 Ryan Roberts            2024-04-08  1293  							THP_SWPOUT_FALLBACK, 1);
fe490cc0fe9e6e Ying Huang              2017-09-06  1294  						count_vm_event(THP_SWPOUT_FALLBACK);
5ed890ce514785 Ryan Roberts            2024-04-08  1295  					}
fe490cc0fe9e6e Ying Huang              2017-09-06  1296  #endif
e26060d1fbd31a Kanchana P Sridhar      2024-10-02  1297  					count_mthp_stat(order, MTHP_STAT_SWPOUT_FALLBACK);
09c02e56327bda Matthew Wilcox (Oracle  2022-05-12  1298) 					if (!add_to_swap(folio))
98879b3b9edc16 Yang Shi                2019-07-11  1299  						goto activate_locked_split;
0f0746589e4be0 Minchan Kim             2017-07-06  1300  				}
bd4c82c22c367e Ying Huang              2017-09-06  1301  			}
e2be15f6c3eece Mel Gorman              2013-07-03  1302  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1303  
98879b3b9edc16 Yang Shi                2019-07-11  1304  		/*
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1305) 		 * If the folio was split above, the tail pages will make
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1306) 		 * their own pass through this function and be accounted
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1307) 		 * then.
98879b3b9edc16 Yang Shi                2019-07-11  1308  		 */
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1309) 		if ((nr_pages > 1) && !folio_test_large(folio)) {
98879b3b9edc16 Yang Shi                2019-07-11  1310  			sc->nr_scanned -= (nr_pages - 1);
98879b3b9edc16 Yang Shi                2019-07-11  1311  			nr_pages = 1;
98879b3b9edc16 Yang Shi                2019-07-11  1312  		}
98879b3b9edc16 Yang Shi                2019-07-11  1313  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1314  		/*
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1315) 		 * The folio is mapped into the page tables of one or more
^1da177e4c3f41 Linus Torvalds          2005-04-16  1316  		 * processes. Try to unmap it here.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1317  		 */
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1318) 		if (folio_mapped(folio)) {
013339df116c2e Shakeel Butt            2020-12-14  1319  			enum ttu_flags flags = TTU_BATCH_FLUSH;
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1320) 			bool was_swapbacked = folio_test_swapbacked(folio);
bd4c82c22c367e Ying Huang              2017-09-06  1321  
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1322) 			if (folio_test_pmd_mappable(folio))
bd4c82c22c367e Ying Huang              2017-09-06  1323  				flags |= TTU_SPLIT_HUGE_PMD;
73bc32875ee9b1 Barry Song              2024-03-06  1324  			/*
73bc32875ee9b1 Barry Song              2024-03-06  1325  			 * Without TTU_SYNC, try_to_unmap will only begin to
73bc32875ee9b1 Barry Song              2024-03-06  1326  			 * hold PTL from the first present PTE within a large
73bc32875ee9b1 Barry Song              2024-03-06  1327  			 * folio. Some initial PTEs might be skipped due to
73bc32875ee9b1 Barry Song              2024-03-06  1328  			 * races with parallel PTE writes in which PTEs can be
73bc32875ee9b1 Barry Song              2024-03-06  1329  			 * cleared temporarily before being written new present
73bc32875ee9b1 Barry Song              2024-03-06  1330  			 * values. This will lead to a large folio is still
73bc32875ee9b1 Barry Song              2024-03-06  1331  			 * mapped while some subpages have been partially
73bc32875ee9b1 Barry Song              2024-03-06  1332  			 * unmapped after try_to_unmap; TTU_SYNC helps
73bc32875ee9b1 Barry Song              2024-03-06  1333  			 * try_to_unmap acquire PTL from the first PTE,
73bc32875ee9b1 Barry Song              2024-03-06  1334  			 * eliminating the influence of temporary PTE values.
73bc32875ee9b1 Barry Song              2024-03-06  1335  			 */
e5a119c4a6835a Barry Song              2024-06-30  1336  			if (folio_test_large(folio))
73bc32875ee9b1 Barry Song              2024-03-06  1337  				flags |= TTU_SYNC;
1f318a9b0dc399 Jaewon Kim              2020-06-03  1338  
869f7ee6f64773 Matthew Wilcox (Oracle  2022-02-15  1339) 			try_to_unmap(folio, flags);
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1340) 			if (folio_mapped(folio)) {
98879b3b9edc16 Yang Shi                2019-07-11  1341  				stat->nr_unmap_fail += nr_pages;
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1342) 				if (!was_swapbacked &&
1bee2c1677bcb5 Matthew Wilcox (Oracle  2022-05-12  1343) 				    folio_test_swapbacked(folio))
1f318a9b0dc399 Jaewon Kim              2020-06-03  1344  					stat->nr_lazyfree_fail += nr_pages;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1345  				goto activate_locked;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1346  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1347  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1348  
d824ec2a154677 Jan Kara                2023-04-28  1349  		/*
d824ec2a154677 Jan Kara                2023-04-28  1350  		 * Folio is unmapped now so it cannot be newly pinned anymore.
d824ec2a154677 Jan Kara                2023-04-28  1351  		 * No point in trying to reclaim folio if it is pinned.
d824ec2a154677 Jan Kara                2023-04-28  1352  		 * Furthermore we don't want to reclaim underlying fs metadata
d824ec2a154677 Jan Kara                2023-04-28  1353  		 * if the folio is pinned and thus potentially modified by the
d824ec2a154677 Jan Kara                2023-04-28  1354  		 * pinning process as that may upset the filesystem.
d824ec2a154677 Jan Kara                2023-04-28  1355  		 */
d824ec2a154677 Jan Kara                2023-04-28  1356  		if (folio_maybe_dma_pinned(folio))
d824ec2a154677 Jan Kara                2023-04-28  1357  			goto activate_locked;
d824ec2a154677 Jan Kara                2023-04-28  1358  
5441d4902f9692 Matthew Wilcox (Oracle  2022-05-12  1359) 		mapping = folio_mapping(folio);
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1360) 		if (folio_test_dirty(folio)) {
ee72886d8ed5d9 Mel Gorman              2011-10-31  1361  			/*
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1362) 			 * Only kswapd can writeback filesystem folios
4eda48235011d6 Johannes Weiner         2017-02-24  1363  			 * to avoid risk of stack overflow. But avoid
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1364) 			 * injecting inefficient single-folio I/O into
4eda48235011d6 Johannes Weiner         2017-02-24  1365  			 * flusher writeback as much as possible: only
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1366) 			 * write folios when we've encountered many
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1367) 			 * dirty folios, and when we've already scanned
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1368) 			 * the rest of the LRU for clean folios and see
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1369) 			 * the same dirty folios again (with the reclaim
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1370) 			 * flag set).
ee72886d8ed5d9 Mel Gorman              2011-10-31  1371  			 */
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1372) 			if (folio_is_file_lru(folio) &&
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1373) 			    (!current_is_kswapd() ||
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1374) 			     !folio_test_reclaim(folio) ||
599d0c954f91d0 Mel Gorman              2016-07-28  1375  			     !test_bit(PGDAT_DIRTY, &pgdat->flags))) {
49ea7eb65e7c50 Mel Gorman              2011-10-31  1376  				/*
49ea7eb65e7c50 Mel Gorman              2011-10-31  1377  				 * Immediately reclaim when written back.
5a9e34747c9f73 Vishal Moola (Oracle    2022-12-21  1378) 				 * Similar in principle to folio_deactivate()
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1379) 				 * except we already have the folio isolated
49ea7eb65e7c50 Mel Gorman              2011-10-31  1380  				 * and know it's dirty
49ea7eb65e7c50 Mel Gorman              2011-10-31  1381  				 */
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1382) 				node_stat_mod_folio(folio, NR_VMSCAN_IMMEDIATE,
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1383) 						nr_pages);
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1384) 				folio_set_reclaim(folio);
49ea7eb65e7c50 Mel Gorman              2011-10-31  1385  
c55e8d035b28b2 Johannes Weiner         2017-02-24  1386  				goto activate_locked;
ee72886d8ed5d9 Mel Gorman              2011-10-31  1387  			}
ee72886d8ed5d9 Mel Gorman              2011-10-31  1388  
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1389) 			if (references == FOLIOREF_RECLAIM_CLEAN)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1390  				goto keep_locked;
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1391) 			if (!may_enter_fs(folio, sc->gfp_mask))
^1da177e4c3f41 Linus Torvalds          2005-04-16  1392  				goto keep_locked;
52a8363eae3872 Christoph Lameter       2006-02-01  1393  			if (!sc->may_writepage)
^1da177e4c3f41 Linus Torvalds          2005-04-16  1394  				goto keep_locked;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1395  
d950c9477d51f0 Mel Gorman              2015-09-04  1396  			/*
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1397) 			 * Folio is dirty. Flush the TLB if a writable entry
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1398) 			 * potentially exists to avoid CPU writes after I/O
d950c9477d51f0 Mel Gorman              2015-09-04  1399  			 * starts and then write it out here.
d950c9477d51f0 Mel Gorman              2015-09-04  1400  			 */
d950c9477d51f0 Mel Gorman              2015-09-04 @1401  			try_to_unmap_flush_dirty();
809bc86517cc40 Baolin Wang             2024-08-12  1402  			switch (pageout(folio, mapping, &plug, folio_list)) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  1403  			case PAGE_KEEP:
^1da177e4c3f41 Linus Torvalds          2005-04-16  1404  				goto keep_locked;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1405  			case PAGE_ACTIVATE:
809bc86517cc40 Baolin Wang             2024-08-12  1406  				/*
809bc86517cc40 Baolin Wang             2024-08-12  1407  				 * If shmem folio is split when writeback to swap,
809bc86517cc40 Baolin Wang             2024-08-12  1408  				 * the tail pages will make their own pass through
809bc86517cc40 Baolin Wang             2024-08-12  1409  				 * this function and be accounted then.
809bc86517cc40 Baolin Wang             2024-08-12  1410  				 */
809bc86517cc40 Baolin Wang             2024-08-12  1411  				if (nr_pages > 1 && !folio_test_large(folio)) {
809bc86517cc40 Baolin Wang             2024-08-12  1412  					sc->nr_scanned -= (nr_pages - 1);
809bc86517cc40 Baolin Wang             2024-08-12  1413  					nr_pages = 1;
809bc86517cc40 Baolin Wang             2024-08-12  1414  				}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1415  				goto activate_locked;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1416  			case PAGE_SUCCESS:
809bc86517cc40 Baolin Wang             2024-08-12  1417  				if (nr_pages > 1 && !folio_test_large(folio)) {
809bc86517cc40 Baolin Wang             2024-08-12  1418  					sc->nr_scanned -= (nr_pages - 1);
809bc86517cc40 Baolin Wang             2024-08-12  1419  					nr_pages = 1;
809bc86517cc40 Baolin Wang             2024-08-12  1420  				}
c79b7b96db8b12 Matthew Wilcox (Oracle  2022-01-17  1421) 				stat->nr_pageout += nr_pages;
96f8bf4fb1dd26 Johannes Weiner         2020-06-03  1422  
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1423) 				if (folio_test_writeback(folio))
41ac1999c3e356 Mel Gorman              2012-05-29  1424  					goto keep;
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1425) 				if (folio_test_dirty(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  1426  					goto keep;
7d3579e8e61937 KOSAKI Motohiro         2010-10-26  1427  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1428  				/*
^1da177e4c3f41 Linus Torvalds          2005-04-16  1429  				 * A synchronous write - probably a ramdisk.  Go
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1430) 				 * ahead and try to reclaim the folio.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1431  				 */
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1432) 				if (!folio_trylock(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  1433  					goto keep;
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1434) 				if (folio_test_dirty(folio) ||
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1435) 				    folio_test_writeback(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  1436  					goto keep_locked;
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1437) 				mapping = folio_mapping(folio);
01359eb2013b4b Gustavo A. R. Silva     2020-12-14  1438  				fallthrough;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1439  			case PAGE_CLEAN:
49bd2bf9679f4a Matthew Wilcox (Oracle  2022-05-12  1440) 				; /* try to free the folio below */
^1da177e4c3f41 Linus Torvalds          2005-04-16  1441  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1442  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1443  
^1da177e4c3f41 Linus Torvalds          2005-04-16  1444  		/*
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1445) 		 * If the folio has buffers, try to free the buffer
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1446) 		 * mappings associated with this folio. If we succeed
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1447) 		 * we try to free the folio as well.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1448  		 *
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1449) 		 * We do this even if the folio is dirty.
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1450) 		 * filemap_release_folio() does not perform I/O, but it
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1451) 		 * is possible for a folio to have the dirty flag set,
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1452) 		 * but it is actually clean (all its buffers are clean).
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1453) 		 * This happens if the buffers were written out directly,
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1454) 		 * with submit_bh(). ext3 will do this, as well as
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1455) 		 * the blockdev mapping.  filemap_release_folio() will
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1456) 		 * discover that cleanness and will drop the buffers
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1457) 		 * and mark the folio clean - it can be freed.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1458  		 *
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1459) 		 * Rarely, folios can have buffers and no ->mapping.
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1460) 		 * These are the folios which were not successfully
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1461) 		 * invalidated in truncate_cleanup_folio().  We try to
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1462) 		 * drop those buffers here and if that worked, and the
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1463) 		 * folio is no longer mapped into process address space
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1464) 		 * (refcount == 1) it can be freed.  Otherwise, leave
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1465) 		 * the folio on the LRU so it is swappable.
^1da177e4c3f41 Linus Torvalds          2005-04-16  1466  		 */
0201ebf274a306 David Howells           2023-06-28  1467  		if (folio_needs_release(folio)) {
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1468) 			if (!filemap_release_folio(folio, sc->gfp_mask))
^1da177e4c3f41 Linus Torvalds          2005-04-16  1469  				goto activate_locked;
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1470) 			if (!mapping && folio_ref_count(folio) == 1) {
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1471) 				folio_unlock(folio);
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1472) 				if (folio_put_testzero(folio))
^1da177e4c3f41 Linus Torvalds          2005-04-16  1473  					goto free_it;
e286781d5f2e9c Nicholas Piggin         2008-07-25  1474  				else {
e286781d5f2e9c Nicholas Piggin         2008-07-25  1475  					/*
e286781d5f2e9c Nicholas Piggin         2008-07-25  1476  					 * rare race with speculative reference.
e286781d5f2e9c Nicholas Piggin         2008-07-25  1477  					 * the speculative reference will free
0a36111c8c20b2 Matthew Wilcox (Oracle  2022-05-12  1478) 					 * this folio shortly, so we may
e286781d5f2e9c Nicholas Piggin         2008-07-25  1479  					 * increment nr_reclaimed here (and
e286781d5f2e9c Nicholas Piggin         2008-07-25  1480  					 * leave it off the LRU).
e286781d5f2e9c Nicholas Piggin         2008-07-25  1481  					 */
9aafcffc18785f Miaohe Lin              2022-05-12  1482  					nr_reclaimed += nr_pages;
e286781d5f2e9c Nicholas Piggin         2008-07-25  1483  					continue;
e286781d5f2e9c Nicholas Piggin         2008-07-25  1484  				}
e286781d5f2e9c Nicholas Piggin         2008-07-25  1485  			}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1486  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1487  
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1488) 		if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
802a3a92ad7ac0 Shaohua Li              2017-05-03  1489  			/* follow __remove_mapping for reference */
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1490) 			if (!folio_ref_freeze(folio, 1))
49d2e9cc454436 Christoph Lameter       2006-01-08  1491  				goto keep_locked;
d17be2d9ff6c68 Miaohe Lin              2021-09-02  1492  			/*
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1493) 			 * The folio has only one reference left, which is
d17be2d9ff6c68 Miaohe Lin              2021-09-02  1494  			 * from the isolation. After the caller puts the
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1495) 			 * folio back on the lru and drops the reference, the
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1496) 			 * folio will be freed anyway. It doesn't matter
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1497) 			 * which lru it goes on. So we don't bother checking
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1498) 			 * the dirty flag here.
d17be2d9ff6c68 Miaohe Lin              2021-09-02  1499  			 */
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1500) 			count_vm_events(PGLAZYFREED, nr_pages);
64daa5d818ae34 Matthew Wilcox (Oracle  2022-05-12  1501) 			count_memcg_folio_events(folio, PGLAZYFREED, nr_pages);
be7c07d60e13ac Matthew Wilcox (Oracle  2021-12-23  1502) 		} else if (!mapping || !__remove_mapping(mapping, folio, true,
b910718a948a91 Johannes Weiner         2019-11-30  1503  							 sc->target_mem_cgroup))
802a3a92ad7ac0 Shaohua Li              2017-05-03  1504  			goto keep_locked;
9a1ea439b16b92 Hugh Dickins            2018-12-28  1505  
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1506) 		folio_unlock(folio);
e286781d5f2e9c Nicholas Piggin         2008-07-25  1507  free_it:
98879b3b9edc16 Yang Shi                2019-07-11  1508  		/*
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1509) 		 * Folio may get swapped out as a whole, need to account
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1510) 		 * all pages in it.
98879b3b9edc16 Yang Shi                2019-07-11  1511  		 */
98879b3b9edc16 Yang Shi                2019-07-11  1512  		nr_reclaimed += nr_pages;
abe4c3b50c3f25 Mel Gorman              2010-08-09  1513  
f8f931bba0f920 Hugh Dickins            2024-10-27  1514  		folio_unqueue_deferred_split(folio);
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1515) 		if (folio_batch_add(&free_folios, folio) == 0) {
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1516) 			mem_cgroup_uncharge_folios(&free_folios);
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27 @1517) 			try_to_unmap_flush();
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1518) 			free_unref_folios(&free_folios);
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1519) 		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1520  		continue;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1521  
98879b3b9edc16 Yang Shi                2019-07-11  1522  activate_locked_split:
98879b3b9edc16 Yang Shi                2019-07-11  1523  		/*
98879b3b9edc16 Yang Shi                2019-07-11  1524  		 * The tail pages that are failed to add into swap cache
98879b3b9edc16 Yang Shi                2019-07-11  1525  		 * reach here.  Fixup nr_scanned and nr_pages.
98879b3b9edc16 Yang Shi                2019-07-11  1526  		 */
98879b3b9edc16 Yang Shi                2019-07-11  1527  		if (nr_pages > 1) {
98879b3b9edc16 Yang Shi                2019-07-11  1528  			sc->nr_scanned -= (nr_pages - 1);
98879b3b9edc16 Yang Shi                2019-07-11  1529  			nr_pages = 1;
98879b3b9edc16 Yang Shi                2019-07-11  1530  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1531  activate_locked:
68a22394c286a2 Rik van Riel            2008-10-18  1532  		/* Not a candidate for swapping, so reclaim swap space. */
246b648038096c Matthew Wilcox (Oracle  2022-05-12  1533) 		if (folio_test_swapcache(folio) &&
9202d527b715f6 Matthew Wilcox (Oracle  2022-09-02  1534) 		    (mem_cgroup_swap_full(folio) || folio_test_mlocked(folio)))
bdb0ed54a4768d Matthew Wilcox (Oracle  2022-09-02  1535) 			folio_free_swap(folio);
246b648038096c Matthew Wilcox (Oracle  2022-05-12  1536) 		VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
246b648038096c Matthew Wilcox (Oracle  2022-05-12  1537) 		if (!folio_test_mlocked(folio)) {
246b648038096c Matthew Wilcox (Oracle  2022-05-12  1538) 			int type = folio_is_file_lru(folio);
246b648038096c Matthew Wilcox (Oracle  2022-05-12  1539) 			folio_set_active(folio);
98879b3b9edc16 Yang Shi                2019-07-11  1540  			stat->nr_activate[type] += nr_pages;
246b648038096c Matthew Wilcox (Oracle  2022-05-12  1541) 			count_memcg_folio_events(folio, PGACTIVATE, nr_pages);
ad6b67041a4549 Minchan Kim             2017-05-03  1542  		}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1543  keep_locked:
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1544) 		folio_unlock(folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1545  keep:
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1546) 		list_add(&folio->lru, &ret_folios);
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1547) 		VM_BUG_ON_FOLIO(folio_test_lru(folio) ||
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1548) 				folio_test_unevictable(folio), folio);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1549  	}
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1550) 	/* 'folio_list' is always empty here */
26aa2d199d6f2c Dave Hansen             2021-09-02  1551  
c28a0e9695b724 Matthew Wilcox (Oracle  2022-05-12  1552) 	/* Migrate folios selected for demotion */
a479b078fddb0a Li Zhijian              2025-01-10  1553  	nr_demoted = demote_folio_list(&demote_folios, pgdat);
a479b078fddb0a Li Zhijian              2025-01-10  1554  	nr_reclaimed += nr_demoted;
a479b078fddb0a Li Zhijian              2025-01-10  1555  	stat->nr_demoted += nr_demoted;
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1556) 	/* Folios that could not be demoted are still in @demote_folios */
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1557) 	if (!list_empty(&demote_folios)) {
6b426d071419a4 Mina Almasry            2022-12-01  1558  		/* Folios which weren't demoted go back on @folio_list */
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1559) 		list_splice_init(&demote_folios, folio_list);
6b426d071419a4 Mina Almasry            2022-12-01  1560  
6b426d071419a4 Mina Almasry            2022-12-01  1561  		/*
6b426d071419a4 Mina Almasry            2022-12-01  1562  		 * goto retry to reclaim the undemoted folios in folio_list if
6b426d071419a4 Mina Almasry            2022-12-01  1563  		 * desired.
6b426d071419a4 Mina Almasry            2022-12-01  1564  		 *
6b426d071419a4 Mina Almasry            2022-12-01  1565  		 * Reclaiming directly from top tier nodes is not often desired
6b426d071419a4 Mina Almasry            2022-12-01  1566  		 * due to it breaking the LRU ordering: in general memory
6b426d071419a4 Mina Almasry            2022-12-01  1567  		 * should be reclaimed from lower tier nodes and demoted from
6b426d071419a4 Mina Almasry            2022-12-01  1568  		 * top tier nodes.
6b426d071419a4 Mina Almasry            2022-12-01  1569  		 *
6b426d071419a4 Mina Almasry            2022-12-01  1570  		 * However, disabling reclaim from top tier nodes entirely
6b426d071419a4 Mina Almasry            2022-12-01  1571  		 * would cause ooms in edge scenarios where lower tier memory
6b426d071419a4 Mina Almasry            2022-12-01  1572  		 * is unreclaimable for whatever reason, eg memory being
6b426d071419a4 Mina Almasry            2022-12-01  1573  		 * mlocked or too hot to reclaim. We can disable reclaim
6b426d071419a4 Mina Almasry            2022-12-01  1574  		 * from top tier nodes in proactive reclaim though as that is
6b426d071419a4 Mina Almasry            2022-12-01  1575  		 * not real memory pressure.
6b426d071419a4 Mina Almasry            2022-12-01  1576  		 */
6b426d071419a4 Mina Almasry            2022-12-01  1577  		if (!sc->proactive) {
26aa2d199d6f2c Dave Hansen             2021-09-02  1578  			do_demote_pass = false;
26aa2d199d6f2c Dave Hansen             2021-09-02  1579  			goto retry;
26aa2d199d6f2c Dave Hansen             2021-09-02  1580  		}
6b426d071419a4 Mina Almasry            2022-12-01  1581  	}
abe4c3b50c3f25 Mel Gorman              2010-08-09  1582  
98879b3b9edc16 Yang Shi                2019-07-11  1583  	pgactivate = stat->nr_activate[0] + stat->nr_activate[1];
98879b3b9edc16 Yang Shi                2019-07-11  1584  
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1585) 	mem_cgroup_uncharge_folios(&free_folios);
72b252aed506b8 Mel Gorman              2015-09-04  1586  	try_to_unmap_flush();
bc2ff4cbc3294c Matthew Wilcox (Oracle  2024-02-27  1587) 	free_unref_folios(&free_folios);
abe4c3b50c3f25 Mel Gorman              2010-08-09  1588  
49fd9b6df54e61 Matthew Wilcox (Oracle  2022-09-02  1589) 	list_splice(&ret_folios, folio_list);
886cf1901db962 Kirill Tkhai            2019-05-13  1590  	count_vm_events(PGACTIVATE, pgactivate);
060f005f074791 Kirill Tkhai            2019-03-05  1591  
2282679fb20bf0 NeilBrown               2022-05-09  1592  	if (plug)
2282679fb20bf0 NeilBrown               2022-05-09  1593  		swap_write_unplug(plug);
05ff51376f01fd Andrew Morton           2006-03-22  1594  	return nr_reclaimed;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1595  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1596  

:::::: The code at line 1401 was first introduced by commit
:::::: d950c9477d51f0cefc2ed3cf76e695d46af0d9c1 mm: defer flush of writable TLB entries

:::::: TO: Mel Gorman <mgorman@suse.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
