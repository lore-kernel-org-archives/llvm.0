Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A48A37BE74;
	Fri,  5 Jun 2026 21:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780696350; cv=none; b=A9YOtemAcijRCg/DQi6w+u8uGWhIYM16cKxg1VmJoBlXnYlLu4/mLP5qD1D84NFRGntsRJMcKkzvhoSJ1TRdE+1cWQdK3yzOASbGAld5PsywwQKTGQlIv2+6xi17LqxHPl5i+Y9XJCmdeVijNDyfUAdrg55kLPXVTdEZPjHdX0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780696350; c=relaxed/simple;
	bh=MuG/b2Nzb8xoxBhSn2l0Zzt8kO12bXyA7kD2oUVL67M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L9C3dCM2e9emTCFUkLYPQHmHMmHktMY6LIkdiI44Aob2PVOGk2ITvBOQw51pDPL7+nmWeD55etdXutKPCDOipSnVKLPGjAiEbiq3mbVcrCLpJIRLtFSJwgWOZdTex+q252PlwCjwHYFcXm8MDNvehe0IubZy7YUvkY0+xzXnzXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaj5I3x0; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaj5I3x0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780696349; x=1812232349;
  h=date:from:to:cc:subject:message-id;
  bh=MuG/b2Nzb8xoxBhSn2l0Zzt8kO12bXyA7kD2oUVL67M=;
  b=iaj5I3x0KBRZPlwQeH4bE7GOZKPnNKZxkghYQs9viRveLroYUsAtfjyu
   LS0C4BARVLAsSVPn5UUXX62S4tp2fTR11bgYVpSOqNPx1kdu7O+w3jlxZ
   bxSC0NoAuR4DTSdgtGwhT/2cP/u2C7M32X3/WY1Umu6VDarCOT969RG+V
   t/cQThTkSwNDUjVch7I5n3hI1prBingKDlHXXhAyVA4CUuSx7udSUWZSR
   alCD/3WfTdQc0bi9iEh4EPaJ1gwPQu86hHfQvj1vK6sf+HW7lnntTv8/z
   B3qMpl9T4lamUgCHfRYWnLT1aVRmH4uXpgzfi7Gm4I1wIxJ8L68Cjnlh5
   w==;
X-CSE-ConnectionGUID: wbquUQxVR4SYNKSHEkLR5A==
X-CSE-MsgGUID: Uu51HFBMTPuE1VLXDxCJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81597799"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="81597799"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 14:52:28 -0700
X-CSE-ConnectionGUID: nuCP9Wg1TAyqmyGJtSAq0Q==
X-CSE-MsgGUID: XSPYl6a8S9qR31+X5Ab04A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="283033237"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 05 Jun 2026 14:52:26 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVcSl-000000002fF-1jOw;
	Fri, 05 Jun 2026 21:52:23 +0000
Date: Fri, 05 Jun 2026 23:51:47 +0200
From: kernel test robot <lkp@intel.com>
To: Mykyta Yatsenko <yatsenko@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 6/23] Warning: lib/rhashtable.c:736
 function parameter 'ht' not described in 'rhashtable_next_key'
Message-ID: <202606052300.ZZL5B8q3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   aa22d619ba22177f430693cf5e9495052d996644
commit: 8f4fa9f89b72845fa8ac956bff2e1d2ba5722f2e [6/23] rhashtable: Add rhashtable_next_key() API
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260605/202606052300.ZZL5B8q3-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606052300.ZZL5B8q3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606052300.ZZL5B8q3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: lib/rhashtable.c:736 function parameter 'ht' not described in 'rhashtable_next_key'
>> Warning: lib/rhashtable.c:736 function parameter 'prev_key' not described in 'rhashtable_next_key'
>> Warning: lib/rhashtable.c:736 function parameter 'ht' not described in 'rhashtable_next_key'
>> Warning: lib/rhashtable.c:736 function parameter 'prev_key' not described in 'rhashtable_next_key'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
