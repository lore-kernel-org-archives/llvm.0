Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5742C80;
	Sun, 23 Mar 2025 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742757284; cv=none; b=PHLBpdMlTuAXIo0RcQM1v6Qi2skOaTvcJkqJfl375SJP/L+d6LGLvogVZKUVM4QmxARvweoOcO38iDrOOCtSkEP4LpRo117yE5aX71Mp+xgwKov7BL3iayl6D2nDG/D7y3iG6I6/KQibL20VewhMiJeO6I74J2tH9r+tErqeEKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742757284; c=relaxed/simple;
	bh=JtKIOsvTUP3rZVv5khuYqMBwf/wtkrXscXYCsiGZkP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ojatELwPjFFpNo9QtOm0oATb4cgt7HspG9bClPPaPD3VMvHAULCkBYmfsmV/5i1GqhHIuBfUrTu1oJEM6GW5t+pNoMzia42XGxrW63V+KsxYCgIRxzxLK+W2A3LfPm+4JxDDUi5vm6JN1jXl+KRNgq2fWxcBXX8rxkA/Gjyc5Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hbzy/Rk9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hbzy/Rk9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742757282; x=1774293282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JtKIOsvTUP3rZVv5khuYqMBwf/wtkrXscXYCsiGZkP0=;
  b=Hbzy/Rk9Pf/yKZL+NxWxadeggri0NzXB5rqcjjaGXPO9kRFDOxnN1H7G
   U1rSMvmL/yFaueUiTR+O3QrnOJFa7UozvzZWa8Qkx9yynM48QsIPmWzYt
   YiEZDn91vm6bDQc40/USUP9qQH5uZqwSI4pozY6k6ttl+zkTO8W05ildi
   RoFBxLWvlxQLoqZkzBAV3ZG6L7G3a/PYBxoS9SK2OqcsFc6DrqqZ4SXSI
   qbGeax140JYAGcQp9jw/othKfyf3jBejlmtM5qGnhCbXkBuo3uvswsuZk
   gTEtq6GgzYJWZooHvOt1pl2CiH19F8EnTCZsarEdwYkjIg/q115feqwIp
   A==;
X-CSE-ConnectionGUID: N8PDLuKiSPiwoZhW/yEPRQ==
X-CSE-MsgGUID: TRN1Fe1SRDaW6oxONqgfaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11382"; a="43885942"
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="43885942"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2025 12:14:42 -0700
X-CSE-ConnectionGUID: /96aq/12SVS1pxQ6OjdENA==
X-CSE-MsgGUID: q9xHRHonTjm9Bj7nArhfaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,270,1736841600"; 
   d="scan'208";a="123655219"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2025 12:14:40 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twQmM-0002v4-1M;
	Sun, 23 Mar 2025 19:14:38 +0000
Date: Mon, 24 Mar 2025 03:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-werror 13/21] vmlinux.o: warning: objtool:
 zone_set_pageset_high_and_batch+0xf1: call without frame pointer save/setup
Message-ID: <202503240313.975vIIG4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-werror
head:   fa33949c27ae0a9ef85355c20c9f0e567fd4f035
commit: 77ebfa6826689650aa4df04c030a283fe87d03ce [13/21] objtool: Fix X86_FEATURE_SMAP alternative handling
config: x86_64-buildonly-randconfig-001-20250324 (https://download.01.org/0day-ci/archive/20250324/202503240313.975vIIG4-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503240313.975vIIG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503240313.975vIIG4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: zone_set_pageset_high_and_batch+0xf1: call without frame pointer save/setup

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
