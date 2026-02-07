Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7223C1D9346;
	Sat,  7 Feb 2026 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770438752; cv=none; b=W18Pbt7kbpnhSjP3K8CGwVwDkWymQVo/oxx6jiszVL9l3NuXlxU9YEWy83oWPLOShKS+xfC8h+h6KZE9dHr2OB7dgDue09cAQHH50DyJCc5BiF0YjZsDscQkN8FiGn+7fuZS+evjl0oHP8slG/kkcThDjzaDhCrYOClOF5PasOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770438752; c=relaxed/simple;
	bh=WzvFHaCt1Wj/GeSky29lWGv58MTPlHPdAspcG1y90Ak=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hlaGdl+CWukHf+tpg7Lmi9liv/jXczo6wzZqfgUMSa0jL9qoTNIWXFTVXeWEJXywWqWOolza82adIezYPE+xF4IvuDNH1+MFAqr83v93xSb6jYlhuIWB8/Y9JnpNgmESRMPK3w5ml1JgmGo8bV8aDzzaGQCRtUj92veUh9oG+rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4iaYafm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4iaYafm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770438751; x=1801974751;
  h=date:from:to:cc:subject:message-id;
  bh=WzvFHaCt1Wj/GeSky29lWGv58MTPlHPdAspcG1y90Ak=;
  b=d4iaYafmEh15FG2FZGPQVGJdzEvgD1ybrff080mp1cJhVAay/LLSsqhW
   Nj3MtXvMDxhwdmsWc9apKfvFq1Vqb2Md3SZsceEuCBbaXUSSQRW/CpK5/
   uW+b3XQn//sEhEXja3KU54HJY/EQIJOlhjGwjegHS+m33RG+i0PF1Cr7Q
   w9CBINtCJv6wKUPZ/Y0FInmxppFQPZC0IvJq+xWglBE0erwHLFMTGu9qM
   MwpfhPa7ugY23GYtecRqFau42mrPP248dEAU74OdRoRk7f4K2elKOkPgs
   H1CuZVnKB1CgF7eWyrRWdxzxW/buwK9xyso8cHzfC+SCzQ1hHlw8NnIGW
   A==;
X-CSE-ConnectionGUID: 79bLKOV2RxOeppOyr6psKg==
X-CSE-MsgGUID: 7KhMYwXZTOu3XDvrIYSBZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="83086526"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="83086526"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 20:32:30 -0800
X-CSE-ConnectionGUID: NVJ/3wPxTGK9yUc6Zbiv5A==
X-CSE-MsgGUID: FKMSYFl0RZCmh8ZDxZHKow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="211079313"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Feb 2026 20:32:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voZze-00000000lO0-3ZoF;
	Sat, 07 Feb 2026 04:32:26 +0000
Date: Sat, 07 Feb 2026 12:31:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 3/3] fs/nfsd/export.c:381:7: error:
 call to undeclared function 'genl_has_listeners'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202602071212.A5drOLFI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   aef82be579c01a1995f0e0c98313f23e7e4893a0
commit: aef82be579c01a1995f0e0c98313f23e7e4893a0 [3/3] nfsd: send nl_notfiy when a svc_export upcall is queued
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260207/202602071212.A5drOLFI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071212.A5drOLFI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071212.A5drOLFI-lkp@intel.com/

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
