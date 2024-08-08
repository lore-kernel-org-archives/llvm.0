Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DC92BAF1;
	Thu,  8 Aug 2024 03:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723086407; cv=none; b=nl9dTDxpcT5HCbtA6LFEcQfnhLZDU8oUnzE1H/86Xt9kB6SzLQRhzNBdi5zMRGyydNSXqRKn8c8l5r/AGn0/2+nzP/f8o9Af3iAjh4DhPX4mi3Sq5tgpK8ehkW4NDaJv1kS+bdw24Rlfzh3YWfB5AaiNq63bvalFObxcTlr/VbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723086407; c=relaxed/simple;
	bh=OAguPm1vv0JYTUgrnLdM51rnSHkaSw/KFayihsFbzyI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dKGZ+FidFFSxkMERWlkqlv9LvoXBUITFsinlrzHNrrxzLwMHy9Zaz6/Uj0V+rlGcbiK3UHHCW68VOMGSsOLuop6hThBsyjfB4cZqnj1L1J4zS5jPczthi7prHJJehyHmVs3V5ttaMnsqV4AbnPur0S9A7AeLZmEj98fbe+KiDR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGu2n58a; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGu2n58a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723086406; x=1754622406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OAguPm1vv0JYTUgrnLdM51rnSHkaSw/KFayihsFbzyI=;
  b=MGu2n58aLwWBSJkaOxgR97uXQU/RI31u7eEhU/u5aJi7n4f2nqoguRa7
   JJpQ6lHTu+Aws6rhGSLu+e0tCJWqPBHuGgLEEfn6Yg9csqXjqS+EC1ELS
   wHno+xJJ0u6+DPn0DEqgzg6AhQnupHnvM/DOOWNxUvwgj3EJNfn6mx7UB
   eVkKKXKFTdB0/zXSjqEMOluWfHO5BvfiGoRyNTwssPPNYjesmXEItze6w
   evhNV52pnMqc7/UbvF29vpbrMdvQYLXZELiVeTcbojN8HDziiiJ9okcOe
   WMWu1SzqN+Nf5r8g/00Kq6ci/5HwMrxZ8rlFUlUYZyRoN+V1BJwVxKlVJ
   w==;
X-CSE-ConnectionGUID: QMGxzE9MTjG/9Z9vXfP28w==
X-CSE-MsgGUID: eryR1vIYRy2MAoLq1f7LuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="38696781"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="38696781"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 20:06:46 -0700
X-CSE-ConnectionGUID: XQ+rr9Q7TtKFK0svU5gpgQ==
X-CSE-MsgGUID: 5d7fk9u+S1ifC4StuOtEGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="61724613"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 07 Aug 2024 20:06:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbtUA-0005sw-1V;
	Thu, 08 Aug 2024 03:06:42 +0000
Date: Thu, 8 Aug 2024 11:05:45 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 2/2] fs/netfs/buffered_read.c:25:9:
 warning: variable 'account' set but not used
Message-ID: <202408081159.LolG3pVE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   b8a80b5ec3422a4c5ff5ca20f8eef24816fad840
commit: b8a80b5ec3422a4c5ff5ca20f8eef24816fad840 [2/2] netfs: Fix handling of USE_PGPRIV2 and WRITE_TO_CACHE flags
config: i386-buildonly-randconfig-003-20240808 (https://download.01.org/0day-ci/archive/20240808/202408081159.LolG3pVE-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081159.LolG3pVE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408081159.LolG3pVE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:25:9: warning: variable 'account' set but not used [-Wunused-but-set-variable]
      25 |         size_t account = 0;
         |                ^
   1 warning generated.


vim +/account +25 fs/netfs/buffered_read.c

    11	
    12	/*
    13	 * [DEPRECATED] Unlock the folios in a read operation for when the filesystem
    14	 * is using PG_private_2 and direct writing to the cache from here rather than
    15	 * marking the page for writeback.
    16	 *
    17	 * Note that we don't touch folio->private in this code.
    18	 */
    19	static void netfs_rreq_unlock_folios_pgpriv2(struct netfs_io_request *rreq)
    20	{
    21		struct netfs_io_subrequest *subreq;
    22		struct folio *folio;
    23		pgoff_t start_page = rreq->start / PAGE_SIZE;
    24		pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
  > 25		size_t account = 0;
    26		bool subreq_failed = false;
    27	
    28		XA_STATE(xas, &rreq->mapping->i_pages, start_page);
    29	
    30		/* Walk through the pagecache and the I/O request lists simultaneously.
    31		 * We may have a mixture of cached and uncached sections and we only
    32		 * really want to write out the uncached sections.  This is slightly
    33		 * complicated by the possibility that we might have huge pages with a
    34		 * mixture inside.
    35		 */
    36		subreq = list_first_entry(&rreq->subrequests,
    37					  struct netfs_io_subrequest, rreq_link);
    38		subreq_failed = (subreq->error < 0);
    39	
    40		trace_netfs_rreq(rreq, netfs_rreq_trace_unlock_pgpriv2);
    41	
    42		rcu_read_lock();
    43		xas_for_each(&xas, folio, last_page) {
    44			loff_t pg_end;
    45			bool pg_failed = false;
    46			bool folio_started = false;
    47	
    48			if (xas_retry(&xas, folio))
    49				continue;
    50	
    51			pg_end = folio_pos(folio) + folio_size(folio) - 1;
    52	
    53			for (;;) {
    54				loff_t sreq_end;
    55	
    56				if (!subreq) {
    57					pg_failed = true;
    58					break;
    59				}
    60	
    61				if (!folio_started &&
    62				    test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags) &&
    63				    fscache_operation_valid(&rreq->cache_resources)) {
    64					trace_netfs_folio(folio, netfs_folio_trace_copy_to_cache);
    65					folio_start_private_2(folio);
    66					folio_started = true;
    67				}
    68	
    69				pg_failed |= subreq_failed;
    70				sreq_end = subreq->start + subreq->len - 1;
    71				if (pg_end < sreq_end)
    72					break;
    73	
    74				account += subreq->transferred;
    75				if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
    76					subreq = list_next_entry(subreq, rreq_link);
    77					subreq_failed = (subreq->error < 0);
    78				} else {
    79					subreq = NULL;
    80					subreq_failed = false;
    81				}
    82	
    83				if (pg_end == sreq_end)
    84					break;
    85			}
    86	
    87			if (!pg_failed) {
    88				flush_dcache_folio(folio);
    89				folio_mark_uptodate(folio);
    90			}
    91	
    92			if (!test_bit(NETFS_RREQ_DONT_UNLOCK_FOLIOS, &rreq->flags)) {
    93				if (folio->index == rreq->no_unlock_folio &&
    94				    test_bit(NETFS_RREQ_NO_UNLOCK_FOLIO, &rreq->flags))
    95					_debug("no unlock");
    96				else
    97					folio_unlock(folio);
    98			}
    99		}
   100		rcu_read_unlock();
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
