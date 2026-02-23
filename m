Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC5337F8A3;
	Mon, 23 Feb 2026 23:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889701; cv=none; b=lGle222LgPHC8pr0Rz60AEvNp2Gn5FbHPBnHf5rYYfDt74L6xFBsOjHBArs9NHpat0ITBYVp4+PatCfz2/Esh6UctwEL0ZejgENrM9JYgNo4wtpGDk+KjPnO8Yvtfa16Sq2XgE5gceumemXCHKBvbiALChzlGHmUAFCcB/azZqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889701; c=relaxed/simple;
	bh=1BnFiSAQkY1ZpdX3lDwDNQ7WqB4JEZZD4Edx4aPLGd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AklpMqBiazDhNul2Srf6lqCZs+F0j4BJlYWq0sw4HXAGvbv8CYpBtCkQnuk9SFV3xGWcRPKpett593ZR8cd4k14oo1YDalHyyc+qxcgPs9HX/kp8AisuhgbehGjK5O1t5Z6qI9z641KDKh64XIHPW4xEvcyGk555p/bMCsnJFvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdF+lvJF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdF+lvJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771889697; x=1803425697;
  h=date:from:to:cc:subject:message-id;
  bh=1BnFiSAQkY1ZpdX3lDwDNQ7WqB4JEZZD4Edx4aPLGd4=;
  b=BdF+lvJFuGOh4+eV8b06W0O4iXQex8KVMf7LuVuzwzoG1QsFta+gig4L
   j3QROdgKAiHPwvgqaPbAryqtxduguRKa/3RRdp8VlGEc3/x19m+ThjibC
   5RoeXTSjKBWOkwZVEXaMMUjno4TV0w/1tSydB+MtcrAIeRHUwHCwY4ncq
   +4tMwRPZ5mM3GhF/2HD5W+fE+Ey3zpkJpxyauoOuNGlwxWTE+Q6i95Zhv
   CyuPONojvls38V9JZjaZwklchHuafC8J3LgG6AkD4l4nHfSMerS6JHInY
   EdBINC57fe9Dwga+n8uyg1af0kVfh3Xe+WnNGWfEeCc6bN4bNMM5u99uO
   A==;
X-CSE-ConnectionGUID: 61ChtK9KT0KTMn9CVM7aaA==
X-CSE-MsgGUID: CjeVUAmNTAO3cVdDOZLSlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75504747"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75504747"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:34:56 -0800
X-CSE-ConnectionGUID: 9qF0y4HNR8aPckZvTagDDg==
X-CSE-MsgGUID: Q8K3s6mDQRuO66npovyQDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="214015402"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Feb 2026 15:34:54 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vufS0-000000000wJ-2AB7;
	Mon, 23 Feb 2026 23:34:52 +0000
Date: Tue, 24 Feb 2026 07:33:57 +0800
From: kernel test robot <lkp@intel.com>
To: Nikita Kalyazin <kalyazin@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mike Rapoport <rppt@kernel.org>
Subject: [rppt:uffd+guestmemfd/v1 13/15] ERROR: modpost:
 "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!
Message-ID: <202602240745.YsKL50hi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git uffd+guestmemfd/v1
head:   ea5af993d28d129d273453041a5ad6b3a1a9e31a
commit: 884e3e4115845fa2b4fd3dcfff1d5058a0b41968 [13/15] KVM: guest_memfd: implement userfaultfd operations
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260224/202602240745.YsKL50hi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240745.YsKL50hi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240745.YsKL50hi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: "folio_alloc_mpol_noprof" [arch/x86/kvm/kvm.ko] undefined!
>> ERROR: modpost: "filemap_remove_folio" [arch/x86/kvm/kvm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
