Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BF42A8B;
	Wed, 29 Jan 2025 17:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738170087; cv=none; b=hdAVIFx/YnY/pzmgjDtr4OY23Rjrz7ZpYO/feUFY7854Oij0cniFDtFJrC3Odt/wwv4MbXc69nCcdhPUubFdgLOdw3Chfly8TsmN+qlShGmgI+ZRgxBPV5SMGWoDJFDLdu56YgJma97T00LAp2ZKyLmjhT3TAnzCqMFt6sYCre4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738170087; c=relaxed/simple;
	bh=COwRKJRLOfvN6VczMs+rEupv18oBz7nDINnGzWllMv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YibKjg+J8zwYs40kntIdh410YuIN7DiVtjJykZ0Msupx3cFZOCfvxfHu0T6yLlk+p/oQSRfe2+YFmfgKGj1x6aHbhfQlO/Gs9XHwBCfxViCAQq9FnHel+o0XJ0wwuavGB/D6bkEfno6FImOGmbrTrz/cD2/6rpPgqtdkatsOmzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laL/SZID; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laL/SZID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738170086; x=1769706086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COwRKJRLOfvN6VczMs+rEupv18oBz7nDINnGzWllMv0=;
  b=laL/SZIDY+O5RtIy/ka9dll8EVjR60xtR0ba24w/gYGYMsMCL3RSzszx
   oKSIhgtNf6VVL5m7L1RI4dDFI/nUaDOHFjV8fFVvCmzEDIzWIblxOg46G
   5seOzv0qFtIAs2ZRq9u05Hng1YICW3cPrajEnbPruUacAM2bWi4OTeemZ
   D+VzRbwFSgcDTMtkmH0cnI5mPKsKgkb7NF9wA+pPQD0cl7iR6q5pByWX0
   c3wGZBuMBAJ/BzxsXLif0CfYEikt1iQMut0T9VSoLGzDXQpsXN81dSWFY
   LsoLt5Hhzn14hJpNiorQve2bZvgwq1RyNXBD2bfigwx/y2/R/Sa5Ix0XM
   w==;
X-CSE-ConnectionGUID: XBbnyr2jQgWbPQGRcOq4RA==
X-CSE-MsgGUID: lAd5tZ9sR8mIKq0loxN5HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38796713"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38796713"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2025 09:01:25 -0800
X-CSE-ConnectionGUID: 26Snl3anSe22OGs5u01JPQ==
X-CSE-MsgGUID: t8q38qmDRTKigyrctmDBoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; 
   d="scan'208";a="109063454"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Jan 2025 09:01:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdBRJ-000jAN-0J;
	Wed, 29 Jan 2025 17:01:21 +0000
Date: Thu, 30 Jan 2025 01:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 43/43] include/trace/events/netfs.h:249:25:
 error: redefinition of enumerator 'netfs_sreq_trace_need_retry'
Message-ID: <202501300009.BsbCOQzD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   99bca1b95b54b7a3e7260c2431b587639482a71d
commit: 99bca1b95b54b7a3e7260c2431b587639482a71d [43/43] ceph: Use netfslib
config: s390-randconfig-002-20250129 (https://download.01.org/0day-ci/archive/20250130/202501300009.BsbCOQzD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250130/202501300009.BsbCOQzD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501300009.BsbCOQzD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/ceph/rdwr.c:51:
>> include/trace/events/netfs.h:249:25: error: redefinition of enumerator 'netfs_sreq_trace_need_retry'
     249 | enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
         |                         ^
   include/trace/events/netfs.h:110:5: note: expanded from macro 'netfs_sreq_traces'
     110 |         EM(netfs_sreq_trace_need_retry,         "ND-RT")        \
         |            ^
   include/trace/events/netfs.h:249:25: note: previous definition is here
   include/trace/events/netfs.h:107:5: note: expanded from macro 'netfs_sreq_traces'
     107 |         EM(netfs_sreq_trace_need_retry,         "NRTRY")        \
         |            ^
>> fs/ceph/rdwr.c:644:22: error: use of undeclared identifier 'ceph_invalidate_folio'; did you mean 'netfs_invalidate_folio'?
     644 |         .invalidate_folio = ceph_invalidate_folio,
         |                             ^~~~~~~~~~~~~~~~~~~~~
         |                             netfs_invalidate_folio
   include/linux/netfs.h:475:6: note: 'netfs_invalidate_folio' declared here
     475 | void netfs_invalidate_folio(struct folio *folio, size_t offset, size_t length);
         |      ^
>> fs/ceph/rdwr.c:847:14: error: call to undeclared function 'ceph_direct_read_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     847 |                         written = ceph_direct_read_write(iocb, &data, snapc,
         |                                   ^
   fs/ceph/rdwr.c:847:14: note: did you mean 'ceph_prepare_write'?
   fs/ceph/rdwr.c:211:13: note: 'ceph_prepare_write' declared here
     211 | static void ceph_prepare_write(struct netfs_io_subrequest *subreq)
         |             ^
>> fs/ceph/rdwr.c:850:14: error: call to undeclared function 'ceph_sync_write'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     850 |                         written = ceph_sync_write(iocb, &data, pos, snapc);
         |                                   ^
   fs/ceph/rdwr.c:850:14: note: did you mean 'ceph_issue_write'?
   fs/ceph/rdwr.c:144:13: note: 'ceph_issue_write' declared here
     144 | static void ceph_issue_write(struct netfs_io_subrequest *subreq)
         |             ^
   4 errors generated.
--
   In file included from fs/ceph/addr.c:16:
>> include/trace/events/netfs.h:249:25: error: redefinition of enumerator 'netfs_sreq_trace_need_retry'
     249 | enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
         |                         ^
   include/trace/events/netfs.h:110:5: note: expanded from macro 'netfs_sreq_traces'
     110 |         EM(netfs_sreq_trace_need_retry,         "ND-RT")        \
         |            ^
   include/trace/events/netfs.h:249:25: note: previous definition is here
   include/trace/events/netfs.h:107:5: note: expanded from macro 'netfs_sreq_traces'
     107 |         EM(netfs_sreq_trace_need_retry,         "NRTRY")        \
         |            ^
   1 error generated.
--
   In file included from fs/netfs/main.c:12:
   In file included from fs/netfs/internal.h:15:
>> include/trace/events/netfs.h:249:25: error: redefinition of enumerator 'netfs_sreq_trace_need_retry'
     249 | enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
         |                         ^
   include/trace/events/netfs.h:110:5: note: expanded from macro 'netfs_sreq_traces'
     110 |         EM(netfs_sreq_trace_need_retry,         "ND-RT")        \
         |            ^
   include/trace/events/netfs.h:249:25: note: previous definition is here
   include/trace/events/netfs.h:107:5: note: expanded from macro 'netfs_sreq_traces'
     107 |         EM(netfs_sreq_trace_need_retry,         "NRTRY")        \
         |            ^
   In file included from fs/netfs/main.c:14:
   In file included from include/trace/events/netfs.h:759:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:107:
>> include/trace/events/netfs.h:273:1: error: redefinition of '__TRACE_SYSTEM_netfs_sreq_trace_need_retry'
     273 | netfs_sreq_traces;
         | ^
   include/trace/events/netfs.h:110:2: note: expanded from macro 'netfs_sreq_traces'
     110 |         EM(netfs_sreq_trace_need_retry,         "ND-RT")        \
         |         ^
   include/trace/events/netfs.h:265:18: note: expanded from macro 'EM'
     265 | #define EM(a, b) TRACE_DEFINE_ENUM(a);
         |                  ^
   include/trace/stages/init.h:16:2: note: expanded from macro 'TRACE_DEFINE_ENUM'
      16 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^
   <scratch space>:157:1: note: expanded from here
     157 | __TRACE_SYSTEM_netfs_sreq_trace_need_retry
         | ^
   include/trace/events/netfs.h:273:1: note: previous definition is here
   include/trace/events/netfs.h:107:2: note: expanded from macro 'netfs_sreq_traces'
     107 |         EM(netfs_sreq_trace_need_retry,         "NRTRY")        \
         |         ^
   include/trace/events/netfs.h:265:18: note: expanded from macro 'EM'
     265 | #define EM(a, b) TRACE_DEFINE_ENUM(a);
         |                  ^
   include/trace/stages/init.h:16:2: note: expanded from macro 'TRACE_DEFINE_ENUM'
      16 |         __##TRACE_SYSTEM##_##a =                        \
         |         ^
   <scratch space>:124:1: note: expanded from here
     124 | __TRACE_SYSTEM_netfs_sreq_trace_need_retry
         | ^
   In file included from fs/netfs/main.c:14:
   In file included from include/trace/events/netfs.h:759:
   In file included from include/trace/define_trace.h:113:
   In file included from include/trace/trace_events.h:107:
>> include/trace/events/netfs.h:273:1: error: redefinition of 'TRACE_SYSTEM_netfs_sreq_trace_need_retry'
     273 | netfs_sreq_traces;
         | ^
   include/trace/events/netfs.h:110:2: note: expanded from macro 'netfs_sreq_traces'
     110 |         EM(netfs_sreq_trace_need_retry,         "ND-RT")        \
         |         ^
   include/trace/events/netfs.h:265:18: note: expanded from macro 'EM'
     265 | #define EM(a, b) TRACE_DEFINE_ENUM(a);
         |                  ^
   include/trace/stages/init.h:24:3: note: expanded from macro 'TRACE_DEFINE_ENUM'
      24 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^
   <scratch space>:4:1: note: expanded from here
       4 | TRACE_SYSTEM_netfs_sreq_trace_need_retry
         | ^
   include/trace/events/netfs.h:273:1: note: previous definition is here
   include/trace/events/netfs.h:107:2: note: expanded from macro 'netfs_sreq_traces'
     107 |         EM(netfs_sreq_trace_need_retry,         "NRTRY")        \
         |         ^
   include/trace/events/netfs.h:265:18: note: expanded from macro 'EM'
     265 | #define EM(a, b) TRACE_DEFINE_ENUM(a);
         |                  ^
   include/trace/stages/init.h:24:3: note: expanded from macro 'TRACE_DEFINE_ENUM'
      24 |         *TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
         |          ^
   <scratch space>:128:1: note: expanded from here
     128 | TRACE_SYSTEM_netfs_sreq_trace_need_retry
         | ^
   3 errors generated.


vim +/netfs_sreq_trace_need_retry +249 include/trace/events/netfs.h

5ac417d24c6cc2 David Howells 2022-02-02  245  
5ac417d24c6cc2 David Howells 2022-02-02  246  enum netfs_read_trace { netfs_read_traces } __mode(byte);
0e0f2dfe880fb1 David Howells 2021-06-29  247  enum netfs_write_trace { netfs_write_traces } __mode(byte);
5ac417d24c6cc2 David Howells 2022-02-02  248  enum netfs_rreq_trace { netfs_rreq_traces } __mode(byte);
5ac417d24c6cc2 David Howells 2022-02-02 @249  enum netfs_sreq_trace { netfs_sreq_traces } __mode(byte);
5ac417d24c6cc2 David Howells 2022-02-02  250  enum netfs_failure { netfs_failures } __mode(byte);
de74023befa187 David Howells 2022-02-17  251  enum netfs_rreq_ref_trace { netfs_rreq_ref_traces } __mode(byte);
6cd3d6fd1fe2fe David Howells 2022-02-17  252  enum netfs_sreq_ref_trace { netfs_sreq_ref_traces } __mode(byte);
c38f4e96e605f1 David Howells 2021-06-17  253  enum netfs_folio_trace { netfs_folio_traces } __mode(byte);
288ace2f57c9d0 David Howells 2024-03-18  254  enum netfs_collect_contig_trace { netfs_collect_contig_traces } __mode(byte);
ee4cdf7ba857a8 David Howells 2024-07-02  255  enum netfs_donate_trace { netfs_donate_traces } __mode(byte);
aabcabf2746062 David Howells 2024-12-16  256  enum netfs_folioq_trace { netfs_folioq_traces } __mode(byte);
5ac417d24c6cc2 David Howells 2022-02-02  257  
5ac417d24c6cc2 David Howells 2022-02-02  258  #endif
77b4d2c6316ab0 David Howells 2020-09-18  259  
77b4d2c6316ab0 David Howells 2020-09-18  260  /*
77b4d2c6316ab0 David Howells 2020-09-18  261   * Export enum symbols via userspace.
77b4d2c6316ab0 David Howells 2020-09-18  262   */
77b4d2c6316ab0 David Howells 2020-09-18  263  #undef EM
77b4d2c6316ab0 David Howells 2020-09-18  264  #undef E_
77b4d2c6316ab0 David Howells 2020-09-18  265  #define EM(a, b) TRACE_DEFINE_ENUM(a);
77b4d2c6316ab0 David Howells 2020-09-18  266  #define E_(a, b) TRACE_DEFINE_ENUM(a);
77b4d2c6316ab0 David Howells 2020-09-18  267  
77b4d2c6316ab0 David Howells 2020-09-18  268  netfs_read_traces;
0e0f2dfe880fb1 David Howells 2021-06-29  269  netfs_write_traces;
663dfb65c3b3ea David Howells 2021-08-26  270  netfs_rreq_origins;
77b4d2c6316ab0 David Howells 2020-09-18  271  netfs_rreq_traces;
77b4d2c6316ab0 David Howells 2020-09-18  272  netfs_sreq_sources;
77b4d2c6316ab0 David Howells 2020-09-18 @273  netfs_sreq_traces;
0246f3e5737d0b David Howells 2021-04-06  274  netfs_failures;
de74023befa187 David Howells 2022-02-17  275  netfs_rreq_ref_traces;
6cd3d6fd1fe2fe David Howells 2022-02-17  276  netfs_sreq_ref_traces;
c38f4e96e605f1 David Howells 2021-06-17  277  netfs_folio_traces;
288ace2f57c9d0 David Howells 2024-03-18  278  netfs_collect_contig_traces;
ee4cdf7ba857a8 David Howells 2024-07-02  279  netfs_donate_traces;
aabcabf2746062 David Howells 2024-12-16  280  netfs_folioq_traces;
77b4d2c6316ab0 David Howells 2020-09-18  281  

:::::: The code at line 249 was first introduced by commit
:::::: 5ac417d24c6cc2fa9ac69d8b9f4510a38ec40486 netfs: Generate enums from trace symbol mapping lists

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
