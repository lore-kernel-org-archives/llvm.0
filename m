Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9875419DF4F;
	Wed, 18 Feb 2026 01:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771379894; cv=none; b=hAQUmDao+k7bXkUKOgaEs9+pNZUQBwSKpv46tRymwbrkgHiENpcmdfZP4pldLw2XUSnIXjK4oifGS8KCUqrzosd8kzNg2RyB/MXGitEuslulRmOWHzhaE0ynK4kaeKspjE+RgSAv0lKnUZ5oM2snbmMZMw6KxWlyyX4pfECAwcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771379894; c=relaxed/simple;
	bh=XtBoVnJtFcFB9AHmWXTBm557G9HMMqIjO3imP1ueX+A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MrPtu2mdJfDAhBhYox5T1XDUt/n60Znt8cdiSVOC6dv12qW+SKW2fcK85zTTHDvnKVshkpUmxBNJJ+f39nltQuIIURRKvWj0DGmnL3omz64HEdO5ybuSA3QyYOZzOFI1ZIz2AxtCqlBsiUaQJRds+qJFzj6beSlCwrQ47RsXi3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AhvALmAS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AhvALmAS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771379894; x=1802915894;
  h=date:from:to:cc:subject:message-id;
  bh=XtBoVnJtFcFB9AHmWXTBm557G9HMMqIjO3imP1ueX+A=;
  b=AhvALmAS1vT4P2oalyFYg1dAfdG5epKJ5Y2TKEk0tk6EvHfqGZctUgj2
   lDtrE+JaMQH8dOV9sr5uk6mvUlCs3qYd2C88X92kzxP/KTOC/vTnQup3T
   p0AjZWj9xJ8J8+LjLg/3tlukfgZX05HJuMzcbTZmNVWBhyOitDskQp6zD
   uqTpTkPmV9U2nInQYmWk/puPLPDQdP8x/wFoaHh2Jyze+RPhE+qAOJnCK
   cVoq8M07iaYHfabxMLuMEbuE9Qw9hpwAvyjQ2cUxLMULJih5fXKliQvoF
   iEWTqDOHsYuFU83oF43ob7EDiYV30Dmc6cHCW0OzuvcBw1/pz72tem5fj
   Q==;
X-CSE-ConnectionGUID: lKQDKXmjQ0204LsfpfcRAw==
X-CSE-MsgGUID: 4yHDdMK3TDC5CdR7rttpxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72504733"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="72504733"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 17:58:13 -0800
X-CSE-ConnectionGUID: oBvrNAwST3KJmRQszdsVnw==
X-CSE-MsgGUID: XTXrvvBQSwaYfYRi5N6mcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="218585094"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Feb 2026 17:58:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsWpN-000000003Pt-2w0G;
	Wed, 18 Feb 2026 01:58:09 +0000
Date: Wed, 18 Feb 2026 02:57:47 +0100
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jlayton:exportd-netlink 8/8] fs/nfsd/export.c:382:19:
 warning: unused variable 'nn'
Message-ID: <202602180217.Qtsix6p4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git exportd-netlink
head:   67896fe53a48a300b8826416c1b4023d407c852d
commit: 67896fe53a48a300b8826416c1b4023d407c852d [8/8] nfsd: send nl_notfiy when a svc_export upcall is queued
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260218/202602180217.Qtsix6p4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180217.Qtsix6p4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180217.Qtsix6p4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfsd/export.c:382:19: warning: unused variable 'nn' [-Wunused-variable]
     382 |         struct nfsd_net *nn = net_generic(net, nfsd_net_id);
         |                          ^~
>> fs/nfsd/export.c:383:8: warning: unused variable 'hdr' [-Wunused-variable]
     383 |         void *hdr;
         |               ^~~
>> fs/nfsd/export.c:384:6: warning: unused variable 'err' [-Wunused-variable]
     384 |         int err;
         |             ^~~
   3 warnings generated.


vim +/nn +382 fs/nfsd/export.c

   378	
   379	int nfsd_nl_svc_export_get_doit(struct sk_buff *skb, struct genl_info *info)
   380	{
   381		struct net *net = genl_info_net(info);
 > 382		struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 > 383		void *hdr;
 > 384		int err;
   385	
   386		return 0;
   387	}
   388	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
