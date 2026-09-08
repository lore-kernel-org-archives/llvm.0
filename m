Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC67748F038;
	Tue,  8 Sep 2026 22:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905576; cv=none; b=bnDYsI2QYgSIcVnRSDfgze+woZmhRi9jsCMeywm0opUmP1fWfqwBWCqTGvOn6pTDrLUI5xLd3CHaMOXUDFvITuCF8QsvJm2t/L19/Uq6B2VIDX2qWTm2h0gB27z7+mcMkdg8H7IfdNQD4ea0rCNbVKSxjsi5ZNGOVqBHxuMHFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905576; c=relaxed/simple;
	bh=DQDQWf+0PMJTYb19qDJ4t6StKQrcra+sNmxHw+c85pM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CkfVhm0Rk2A8ev4yBO5OhXzqoM1u53NYUhgn4VbpkZqOy0Xw2I9GSpg3TvjxJK8RyMQEPuGpuWdkv3jAK4CvbOBxBDQF6zNuAgquTIxGee7rYaH7Qqcdzk0I3weeoYf+D3VelXE+6xoAoAS4voH7hdrQ/yj32fmOPwPpGuKjLqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcZ/5tpJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcZ/5tpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788905570; x=1820441570;
  h=date:from:to:cc:subject:message-id;
  bh=DQDQWf+0PMJTYb19qDJ4t6StKQrcra+sNmxHw+c85pM=;
  b=gcZ/5tpJZFi7absyLD09E8i8DP/a4gMaxGDdWYkyLrrN8tdAYEScUaTI
   EwfLl3h3X4kiZAqRbn3Eh7YPA+QbQszQEzTyHjLErMMnbZ/kVFBOxDWIw
   i8X7mCOCHg23zJmoicocYk6iBvnw1bkxVGwLazoWh09D5ViARDfQGykBr
   nhsKI+hiKaD2AobOM+6+tUEBWwh0s64xm5XfCT1HocXZushuo1gRqkbxZ
   9co2PmFyIgSaRVcItjBa7CgQK2rpjpn8zouFcThKaLUXcRugvGe6/Ct9n
   kDhydNoBnMhpQjb7lflczHMiJAfj2TH1ywlI6NDrsxrD41ex4kICl9dz4
   w==;
X-CSE-ConnectionGUID: 5s0z+bQgQ6iB47eMyj6Dgg==
X-CSE-MsgGUID: owJBtCYiRieUnk/4r3N9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89526630"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89526630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 15:12:49 -0700
X-CSE-ConnectionGUID: o4QQOF7/SQ6DTNyYnutpLA==
X-CSE-MsgGUID: RKsOoelmTRiHVApflctXEQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Sep 2026 15:12:48 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x443a-000000000sY-06G0;
	Tue, 08 Sep 2026 22:12:46 +0000
Date: Wed, 09 Sep 2026 00:11:49 +0200
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>
Subject: [dhowells-fs:netfs-next-1 6/8]
 fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier
 'NETFS_RREQ_USE_PGPRIV2'
Message-ID: <202609090040.XYKriffI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-next-1
head:   bf6f26c5281fa05cf8c97025dcb2f7f87143138a
commit: 9266aba94da4bdfc7ff858c8191ef647e3067c15 [6/8] netfs: Make deprecated PG_private_2 support opt-in
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260909/202609090040.XYKriffI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609090040.XYKriffI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609090040.XYKriffI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     245 |                         if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     245 |                         if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
>> fs/netfs/buffered_read.c:245:26: error: use of undeclared identifier 'NETFS_RREQ_USE_PGPRIV2'
     245 |                         if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
         |                                               ^~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/NETFS_RREQ_USE_PGPRIV2 +245 fs/netfs/buffered_read.c

e2d46f2ec33253 David Howells 2024-12-16  213  
533203c4183123 David Howells 2026-08-27  214  /*
533203c4183123 David Howells 2026-08-27  215   * Mark folios that we want to copy to the cache.  For filesystems that use
533203c4183123 David Howells 2026-08-27  216   * netfslib fully, we set folio->private to NETFS_FOLIO_COPY_TO_CACHE;
533203c4183123 David Howells 2026-08-27  217   * otherwise we set the deprecated PG_private_2.
533203c4183123 David Howells 2026-08-27  218   */
533203c4183123 David Howells 2026-08-27  219  static void netfs_mark_copy_to_cache(struct netfs_io_request *rreq,
533203c4183123 David Howells 2026-08-27  220  				     struct folio_queue **fq,
533203c4183123 David Howells 2026-08-27  221  				     unsigned int *offset,
533203c4183123 David Howells 2026-08-27  222  				     int *slot,
533203c4183123 David Howells 2026-08-27  223  				     size_t len,
533203c4183123 David Howells 2026-08-27  224  				     bool copy)
533203c4183123 David Howells 2026-08-27  225  {
533203c4183123 David Howells 2026-08-27  226  	while (len > 0) {
533203c4183123 David Howells 2026-08-27  227  		struct folio *folio;
533203c4183123 David Howells 2026-08-27  228  		size_t fsize, overlap;
533203c4183123 David Howells 2026-08-27  229  
533203c4183123 David Howells 2026-08-27  230  		if (!*fq)
533203c4183123 David Howells 2026-08-27  231  			break;
533203c4183123 David Howells 2026-08-27  232  		if (*slot >= folioq_count(*fq)) {
533203c4183123 David Howells 2026-08-27  233  			*fq = (*fq)->next;
533203c4183123 David Howells 2026-08-27  234  			*slot = 0;
533203c4183123 David Howells 2026-08-27  235  			*offset = 0;
533203c4183123 David Howells 2026-08-27  236  			continue;
533203c4183123 David Howells 2026-08-27  237  		}
533203c4183123 David Howells 2026-08-27  238  
533203c4183123 David Howells 2026-08-27  239  		/* Determine how much the subreq overlaps the folio, if at all. */
533203c4183123 David Howells 2026-08-27  240  		fsize = folioq_folio_size(*fq, *slot);
533203c4183123 David Howells 2026-08-27  241  		overlap = min(len, fsize - *offset);
533203c4183123 David Howells 2026-08-27  242  
533203c4183123 David Howells 2026-08-27  243  		if (overlap > 0 && copy) {
533203c4183123 David Howells 2026-08-27  244  			folio = folioq_folio(*fq, *slot);
533203c4183123 David Howells 2026-08-27 @245  			if (unlikely(test_bit(NETFS_RREQ_USE_PGPRIV2, &rreq->flags))) {
533203c4183123 David Howells 2026-08-27  246  				if (!folio_test_private_2(folio))
533203c4183123 David Howells 2026-08-27  247  					folio_start_private_2(folio);
533203c4183123 David Howells 2026-08-27  248  			} else {
533203c4183123 David Howells 2026-08-27  249  				if (!folio_get_private(folio))
533203c4183123 David Howells 2026-08-27  250  					folio_attach_private(folio, NETFS_FOLIO_COPY_TO_CACHE);
533203c4183123 David Howells 2026-08-27  251  			}
533203c4183123 David Howells 2026-08-27  252  			trace_netfs_folio(folio, netfs_folio_trace_mark_copy);
533203c4183123 David Howells 2026-08-27  253  		}
533203c4183123 David Howells 2026-08-27  254  
533203c4183123 David Howells 2026-08-27  255  		len -= overlap;
533203c4183123 David Howells 2026-08-27  256  		*offset += overlap;
533203c4183123 David Howells 2026-08-27  257  		if (*offset >= fsize) {
533203c4183123 David Howells 2026-08-27  258  			*slot += 1;
533203c4183123 David Howells 2026-08-27  259  			*offset = 0;
533203c4183123 David Howells 2026-08-27  260  		}
533203c4183123 David Howells 2026-08-27  261  	}
533203c4183123 David Howells 2026-08-27  262  }
533203c4183123 David Howells 2026-08-27  263  

:::::: The code at line 245 was first introduced by commit
:::::: 533203c4183123dad8ffecd694e7573a0ccd0da0 netfs: Mark folios with COPY_TO_CACHE whilst issuing subreqs

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
