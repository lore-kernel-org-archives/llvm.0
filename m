Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559A74C9A;
	Wed, 27 Nov 2024 01:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732669613; cv=none; b=iAd0ompg561rlyfxy/FThxsK8xguB6x2Bp3IlkAE1bSBP/G80nF/4Z+QGdhGGsVVPCpsMoODFNRU8IZGgwrDOl12GtHKDclDxjnTlt1hE+ApIIokFJpXFyvV2Kbf1aYR09fA9X+AQwBtuD5eUrGm8rxkkqBRZQcyQh42+rTI3eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732669613; c=relaxed/simple;
	bh=7N7yf/fg8iYkdzSEbucdd+qD2ELO2Q1xaUJN145mAts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tZd6ZfpdUvI6cjhqmQq8F2VkIwIc5k8IwP1SeWQ8NORJqn6tXGkW61sWU7vDZ0Jj/XXSLhICst5qYLzwqWMAa+Yr4arelBJ0gvrqqvQ2BSBxGjNN13Y4zKY2whC3GsoP3SnST4FrFDjC7a0qP/iw2oWlPA8TCsuE6GLvcnP1iDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvBanp/D; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvBanp/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732669611; x=1764205611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7N7yf/fg8iYkdzSEbucdd+qD2ELO2Q1xaUJN145mAts=;
  b=VvBanp/DdnxaZPo31rZLRWCfqe3tv/ZyF2ff0vsTiRfb/UC5O0FkOS2v
   7pA5yUapvCokSdvSJX6bUDGj6JirGwQ+BIlt42hcbkIeVA572UxdRnuZZ
   mjR/V5mYcNAQQKvc7nilauhEpOKHkulBl8sC6JIk2iIpB/2LKz7K+Gcw4
   QmE5rytlIcalYGRT+4KKPVtygSiGyYQZY1NgOfbOOwR5q+THeT/NNrPIN
   oSlobNNXjdfVEZOz8EVvpvhekEBazbE1nmL9F9kCHn+OTtyqwoTuI1DnU
   McT/PrZlI1htjvEWfuPmGXmW+ZSefXEDOrkq/CsCo/nD7UJf7lqFveMjE
   Q==;
X-CSE-ConnectionGUID: 15We8cCdQ2ahFxggM1o+sA==
X-CSE-MsgGUID: lZfOIGAxQfyb+RCcS508AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43518807"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="43518807"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 17:06:50 -0800
X-CSE-ConnectionGUID: c4ybj6CSQ+WsZDyiHke9Lw==
X-CSE-MsgGUID: k96cbmXMR56AxoW/peP+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="91675485"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2024 17:06:49 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG6Vz-0007dT-10;
	Wed, 27 Nov 2024 01:06:47 +0000
Date: Wed, 27 Nov 2024 09:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:uaccess-hardening-2 5/5] <instantiation>:12:5: error:
 invalid instruction mnemonic 'warn_once'
Message-ID: <202411270944.3Ouv8MnU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git uaccess-hardening-2
head:   abb6abd4769adf11db312fb23360ccd7bf128763
commit: abb6abd4769adf11db312fb23360ccd7bf128763 [5/5] x86/uaccess: Avoid barrier_nospec() in 64-bit __get_user()
config: x86_64-buildonly-randconfig-001-20241126 (https://download.01.org/0day-ci/archive/20241127/202411270944.3Ouv8MnU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270944.3Ouv8MnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270944.3Ouv8MnU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:12:5: error: invalid instruction mnemonic 'warn_once'
   10: WARN_ONCE
       ^~~~~~~~~
   arch/x86/lib/getuser.S:146:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^
>> <instantiation>:12:5: error: invalid instruction mnemonic 'warn_once'
   10: WARN_ONCE
       ^~~~~~~~~
   arch/x86/lib/getuser.S:156:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^
>> <instantiation>:12:5: error: invalid instruction mnemonic 'warn_once'
   10: WARN_ONCE
       ^~~~~~~~~
   arch/x86/lib/getuser.S:166:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^
>> <instantiation>:12:5: error: invalid instruction mnemonic 'warn_once'
   10: WARN_ONCE
       ^~~~~~~~~
   arch/x86/lib/getuser.S:176:2: note: while in macro instantiation
    __get_user_nocheck_nospec
    ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
