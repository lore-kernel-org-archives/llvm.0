Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6712A1C32;
	Thu, 13 Mar 2025 22:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741903677; cv=none; b=d/YZGriGijqru/e2+Ma4ivZCsjB1w6cYJPY2dXVK78XMxAVvAtRuZNHDv6X5SBgVEBvWfXw/FXlNgIixzKw1Lu3iNUryXtgm3o3X9Nw1VL6h6fFsJLatDZpChTB5/AnHUH6ZhEYPnVRz6OCtLWGToNe58zlL4Hla4hVdDCezRig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741903677; c=relaxed/simple;
	bh=CfouBSMwhzbd7hfsjozPKx2WqbBf4z5lKo/G5CWjgsk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awVohrbr+hGe4iA+tk0DQ3MfC4qfJ2YffbSTWDMyXmaeBYibMZZ9bvSZtVSU8FT5Lh0a1vCIZToWjdBd8/vUm6Df2MC1sqNICmjYM1sOJiZVVQHo+5XaWh5O/G1mzM3Qy9jqPpZ8kUyfWNxaicjmXXTPxH4P827Td5sDILqTEBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PzLb79+s; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PzLb79+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741903677; x=1773439677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CfouBSMwhzbd7hfsjozPKx2WqbBf4z5lKo/G5CWjgsk=;
  b=PzLb79+sYXT9WKxZDtSbNkT2XojznnSnlNjM8qNsiZNOXiTu+66i1HZ2
   FKW7CA2qQzLJRNUqgqvN8EcopwbaGH5I3y59xeBwn5yrI+S2RopAgQBDm
   qoPO8HlWHHcPzv+XGqdoc4M2FqyNkmcPXtuMbowe6+46wsfx1tupb145O
   yHF381BFvZujnB4+HRi+4Npeop+zLfs1VssdW1l/sFEtK2TxMObLsh2vM
   VkIegQHiN3hcf0i2PPRQPXEXrni9jN2XXzJZ+H8H2KKsRXQHPx3sdQRu8
   i0SKn6A3criKLJPApSEJxA9GiObo1ylKk7i3s9onRbWzpfQH5/wKwds7y
   w==;
X-CSE-ConnectionGUID: J/WtS9J9RdG2+j3/v+ux4g==
X-CSE-MsgGUID: 5M9OxjyxSAe7biecSn8nQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53697286"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="53697286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 15:07:56 -0700
X-CSE-ConnectionGUID: odHedbxCRsW5iqG0WOgLYw==
X-CSE-MsgGUID: hBsxIYH2TgiDqh0lyuDYvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="120870031"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2025 15:07:55 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsqiW-0009xC-23;
	Thu, 13 Mar 2025 22:07:52 +0000
Date: Fri, 14 Mar 2025 06:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 156/157] random.c:undefined
 reference to `__umoddi3'
Message-ID: <202503140640.fV7TfwcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a888eae7549b5515b25ca0846d4b39f1195a3020
commit: 8511d47d2b5a1d421bf69931c84c60f5c4c6e982 [156/157] random: get_random_u64_below()
config: i386-buildonly-randconfig-004-20250314 (https://download.01.org/0day-ci/archive/20250314/202503140640.fV7TfwcD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250314/202503140640.fV7TfwcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503140640.fV7TfwcD-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/char/random.o: in function `__get_random_u64_below':
>> random.c:(.text+0x1dcc): undefined reference to `__umoddi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
