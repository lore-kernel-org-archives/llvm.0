Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A89A935;
	Sat, 29 Mar 2025 11:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743247887; cv=none; b=BZ7CcVBBjY5Oi4renAh5LMke6Jr6Ue5s2OyA7BFOMWqRuAdE44aI9o14lljd3WW5IkBeaoNdG8plN+NuT7LqQtndZwxd5SsI7E4HOffbAxqpec7PflSu0u2BMR9QjSqpbsLU5caOBgLnbcF5jjejYHrIv49IDQROOKUH7plpuWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743247887; c=relaxed/simple;
	bh=2Bsuku3h3mm/hh7WELjuYpk57CAP/XLlE3Pa7BOe418=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=grdGXmNdZB9HiVf/ynBBNXMtB/UjWlut2GtXWU3j7+RgREyrKnoCz4fvOOAjyV7yz8v++uOmKMt1MfNYBBLODT/bD50y1ip3Cy4saFI4fmhnGhFWKIM7Eiside+7pLAWVGgBoajeDMW3i4HXOPSn7mMB8vBFCLjiBEXgyUepbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjiGuwDY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjiGuwDY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743247885; x=1774783885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Bsuku3h3mm/hh7WELjuYpk57CAP/XLlE3Pa7BOe418=;
  b=UjiGuwDYrKQR1H5B+2zYpRYIdtbVgrx1zutk6rbUAIZje1rHxV4DCUh4
   UrJ/kwB9H5WodqjqNjMClfNMDpErT5bpBmJB46w+Kg3i6WaD4HZ8/bfx1
   2pFwFTZ8aFNQlxBb9/BfqDOrI/cX0oFonNLrblLly9axpOoa6ansfPk5P
   TUjQSqG3ANYPvxwBpZLnpw40epOh83tGEciyFgt6ZkVJ2N600LohlH1D9
   XTa7v1SXW4psKhcZgLwhXX/SjxS9YGfnDXYEw3oDnZu8iRj66CTENYmUC
   EAoTH6liIxT5q+qFQq8MMfdqD6rc7NDf2LiXCmFDLPHRTJv+O8SdWKJko
   w==;
X-CSE-ConnectionGUID: cRzo7DPwQp+sa8doDxsy7g==
X-CSE-MsgGUID: Ybm+4G70T2iEonYV67Jj8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="47325992"
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="47325992"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 04:31:24 -0700
X-CSE-ConnectionGUID: vGArT0A1TqKM1JmR1QEviw==
X-CSE-MsgGUID: /5jlCsR7QmKapQbyJ5nFGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,285,1736841600"; 
   d="scan'208";a="130887307"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 29 Mar 2025 04:31:23 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyUPI-00084Q-39;
	Sat, 29 Mar 2025 11:31:20 +0000
Date: Sat, 29 Mar 2025 19:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 6/6] super: add filesystem freezing helpers for
 suspend and hibernate
Message-ID: <202503291904.PAJxnbuR-lkp@intel.com>
References: <20250329-work-freeze-v2-6-a47af37ecc3d@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329-work-freeze-v2-6-a47af37ecc3d@kernel.org>

Hi Christian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on acb4f33713b9f6cadb6143f211714c343465411c]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/super-remove-pointless-s_root-checks/20250329-164716
base:   acb4f33713b9f6cadb6143f211714c343465411c
patch link:    https://lore.kernel.org/r/20250329-work-freeze-v2-6-a47af37ecc3d%40kernel.org
patch subject: [PATCH v2 6/6] super: add filesystem freezing helpers for suspend and hibernate
config: hexagon-randconfig-002-20250329 (https://download.01.org/0day-ci/archive/20250329/202503291904.PAJxnbuR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503291904.PAJxnbuR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503291904.PAJxnbuR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/super.c:1183:6: warning: variable 'active' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1183 |         if (super_lock_excl(sb)) {
         |             ^~~~~~~~~~~~~~~~~~~
   fs/super.c:1187:9: note: uninitialized use occurs here
    1187 |         return active;
         |                ^~~~~~
   fs/super.c:1183:2: note: remove the 'if' if its condition is always true
    1183 |         if (super_lock_excl(sb)) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/super.c:1181:13: note: initialize the variable 'active' to silence this warning
    1181 |         bool active;
         |                    ^
         |                     = 0
   1 warning generated.


vim +1183 fs/super.c

  1178	
  1179	static inline bool get_active_super(struct super_block *sb)
  1180	{
  1181		bool active;
  1182	
> 1183		if (super_lock_excl(sb)) {
  1184			active = atomic_inc_not_zero(&sb->s_active);
  1185			super_unlock_excl(sb);
  1186		}
  1187		return active;
  1188	}
  1189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
