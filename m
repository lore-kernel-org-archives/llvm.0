Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34D23C17;
	Thu, 21 Aug 2025 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755752541; cv=none; b=ZBiQ1gNzAn8lUvNcKZVjtbtRtnJXO6xHbkSfBVTCgYBmkJJWLm/MGuCUW3e554gzSrZsMvq8hP5ToKCI6lg7iu9WyJdoQQy860Cwo0wGMqNd4/x94B9jm60dYucE4bB9kEXZUsuaj83i30ftzUkYj22nJHqF9dtH0RaLlYCIf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755752541; c=relaxed/simple;
	bh=XEJG0+45BaDu79H9dxTNbj4u+VG844zPwUQqhku+wQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iK5/U/KlZ+erYLFE/N+FKBVFsT4PHGDV2CX/MHNj2nUSYIf+Q4Xgy4/beLbOyeO84NkoPVWWYeRcfjgmJ5rQwYAmBsVvIcFUTMZ8o0KF/a/NMBfUeS+neKvWKAFGb1iiic6AQZzCYVZCiLmD1l9ZGDHZul3m9FRd7H2B37oofDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hZCJDaTX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hZCJDaTX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755752540; x=1787288540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XEJG0+45BaDu79H9dxTNbj4u+VG844zPwUQqhku+wQo=;
  b=hZCJDaTX/U1oCxD7gAJIXPqp0hT+fGUmydYskSLut/08v98hbaR2u8lm
   LHWXl+0+hzk8/zICj4Q50YQHjvVyzjsosPC/vBQ50LRBHaiIwkUwnZDlX
   lM8BZrPKt0qI/H1Gl8okBbQZGe2LzSTWnaHN/koe4RF4rZpIj4GJWZfme
   N/AoRb3q/M8c0rlnRQ8kMLRcu9//kNmv2lMAiPzPVd3M96Byy2cWb8wBm
   J+ysCF/uH5puhT8aaFFuMxqxreNZ5Ubd4XWMSqzwwMP8i/t6nxwi+TTA/
   Sq8sY237nF25Ax7t8tfY+HVLXiVieZy8V5E+zqDEQ/YrD/EvOGKUlOmXO
   Q==;
X-CSE-ConnectionGUID: 4/abRzHaQxS4u9H+WC/RvQ==
X-CSE-MsgGUID: uUsl2zYrR8iMEku5o5+B4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="61858940"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="61858940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2025 22:02:18 -0700
X-CSE-ConnectionGUID: 6mHlzczSQ1SK59BDM3ZX5Q==
X-CSE-MsgGUID: 39Sw/yNSQfqIscJy6W9wDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="167927918"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2025 22:02:17 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoxRG-000Jwx-2Q;
	Thu, 21 Aug 2025 05:02:14 +0000
Date: Thu, 21 Aug 2025 13:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/11] mm: khugepaged: generalize collapse_file for
 mTHP support
Message-ID: <202508211210.SeYYBgRw-lkp@intel.com>
References: <6a2f28b4541bbbc56ea9e07f24b67cef87899a50.1755677674.git.baolin.wang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a2f28b4541bbbc56ea9e07f24b67cef87899a50.1755677674.git.baolin.wang@linux.alibaba.com>

Hi Baolin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[cannot apply to linus/master v6.17-rc2 next-20250820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/mm-khugepaged-add-khugepaged_max_ptes_none-check-in-collapse_file/20250820-171124
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/6a2f28b4541bbbc56ea9e07f24b67cef87899a50.1755677674.git.baolin.wang%40linux.alibaba.com
patch subject: [RFC PATCH 02/11] mm: khugepaged: generalize collapse_file for mTHP support
config: x86_64-buildonly-randconfig-002-20250821 (https://download.01.org/0day-ci/archive/20250821/202508211210.SeYYBgRw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211210.SeYYBgRw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211210.SeYYBgRw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/khugepaged.c:2068 function parameter 'order' not described in 'collapse_file'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
