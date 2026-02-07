Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C451C1D7E5C;
	Sat,  7 Feb 2026 02:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770431104; cv=none; b=C+JkN7vK7hDoi+RDarSa/u1Ju1GhgYA/rw+N1DWaQ1j6lHn87uIzRVd6W99HrvHCuXAsIbMUa0VVaee+26o9pu5GSOS7M5AZbPP/wBY2HvPWDouh9oSe0h+piJF47gg20mzT4PH5umcKuxlmfGm6c9pQauFvb35wHH/wMO9B1rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770431104; c=relaxed/simple;
	bh=w6ufld0GGkdI/GNahznLVw4ndmV5nD/AgC7tAERmc/U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rVhMibYw+9jqw/1nSpKc5u5yOz2edGs2C2dxOKs1weXTgGvG9pphbaVL1V3iRcYi/r/j1nHmCo62qZqDPFHZ4hk3ESPo7KQBDcdv0ZLbtyoMxMIhiBU8n56tKVlvQ/x83Wgfw7QZFUE2em/y7ha6w1+eYRwmLQvDNb/rOJa5oxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILj+obmf; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILj+obmf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770431100; x=1801967100;
  h=date:from:to:cc:subject:message-id;
  bh=w6ufld0GGkdI/GNahznLVw4ndmV5nD/AgC7tAERmc/U=;
  b=ILj+obmfbrj0aNNg1GRB9Ja/nacAaTWOCFdoq/7xPedbF/r6a1hXaPpg
   utFtQeT1q1bsN+V9D4baibyEZL84WboVdGTJONUhhNTi+vQvO/2v0AZv4
   AY0hJ9YTKNwr3AKOv6Zm9BoNkAIKweWhj4/nRRmfGcq8pa6isYvaHCOmK
   0H0NSdF9isR5DfGp7l3ZS/k8tZImRoCPT8/0k0LHY879jqNn6RBJBHiLY
   Z1tDTKJvRY6JfHQyBVpmT6PatN51Obs+gEqRJkPNjuxPxTjbgholulIJq
   j6pHrSOHeS7DMIxgwAEdgkiOZmzYAIt4IPIiy6EZUmXjJjPt+YilD3Mie
   Q==;
X-CSE-ConnectionGUID: fWPMkibFQRSLtr7+oRqSYw==
X-CSE-MsgGUID: o+boqb1pTGiQrhKNdlKE3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="74240326"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="74240326"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 18:24:57 -0800
X-CSE-ConnectionGUID: rWjIPMscSY6vuLXO5+VhQA==
X-CSE-MsgGUID: 9rwaRt2oQ9+32Kupplve9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="248657025"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Feb 2026 18:24:56 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voY0D-000000004nN-0ltp;
	Sat, 07 Feb 2026 02:24:53 +0000
Date: Sat, 07 Feb 2026 03:24:44 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 3/3] fs/nfsd/export.c:381:7: error:
 call to undeclared function 'genl_has_listeners'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202602070301.HBYXAjMT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   aef82be579c01a1995f0e0c98313f23e7e4893a0
commit: aef82be579c01a1995f0e0c98313f23e7e4893a0 [3/3] nfsd: send nl_notfiy when a svc_export upcall is queued
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260207/202602070301.HBYXAjMT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070301.HBYXAjMT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070301.HBYXAjMT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfsd/export.c:381:7: error: call to undeclared function 'genl_has_listeners'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     381 |         if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
         |              ^
   fs/nfsd/export.c:381:7: note: did you mean 'rtnl_has_listeners'?
   include/linux/rtnetlink.h:221:19: note: 'rtnl_has_listeners' declared here
     221 | static inline int rtnl_has_listeners(const struct net *net, u32 group)
         |                   ^
>> fs/nfsd/export.c:381:27: error: use of undeclared identifier 'exportd_nl_family'
     381 |         if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
         |                                  ^
>> fs/nfsd/export.c:381:55: error: use of undeclared identifier 'EXPORTD_NLGRP_EXPORTD'
     381 |         if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
         |                                                              ^
>> fs/nfsd/export.c:384:8: error: call to undeclared function 'genlmsg_new'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     384 |         msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
         |               ^
   fs/nfsd/export.c:384:8: note: did you mean 'nlmsg_new'?
   include/net/netlink.h:1053:31: note: 'nlmsg_new' declared here
    1053 | static inline struct sk_buff *nlmsg_new(size_t payload, gfp_t flags)
         |                               ^
>> fs/nfsd/export.c:384:20: error: use of undeclared identifier 'GENLMSG_DEFAULT_SIZE'
     384 |         msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
         |                           ^
>> fs/nfsd/export.c:384:42: error: use of undeclared identifier 'flags'
     384 |         msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
         |                                                 ^
   6 errors generated.


vim +/genl_has_listeners +381 fs/nfsd/export.c

   376	
   377	static int svc_export_genl_notify(struct cache_detail *cd, struct cache_head *h)
   378	{
   379		struct sk_buff *msg;
   380	
 > 381		if (!genl_has_listeners(&exportd_nl_family, cd->net, EXPORTD_NLGRP_EXPORTD))
   382			return -ESRCH;
   383	
 > 384		msg = genlmsg_new(GENLMSG_DEFAULT_SIZE, flags);
   385		if (!msg)
   386			return -ENOMEM;
   387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
