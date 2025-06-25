Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB881EF0B9;
	Wed, 25 Jun 2025 06:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750832948; cv=none; b=WFJrWg7S0uzb25L9k4GazD/F8aacxX2ReBFTa8UHpkq3O6eKepUek+wSU4H3G5jwxMpjOOMSeQZK8C8QpKAJbWfC0reJgsAA2SDwOMaYFEjBlcSUqH+v8GfgmGOxbWU1KaEBPX/YAGZOt+nXBSDWUl+YTvMD8Ng1J209X/b6E0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750832948; c=relaxed/simple;
	bh=DNNM9U7fRK37I0J9YAYr9hjb20ReSmw0RtBuRXiGOG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VX1cQUMLiRNnlFYqcTHLP45mpHJy7F1qon5b+JgD92z19lIG7HYbPPVAozRHAcsedxaDTkz6fArJRMw9BbuqMmCpDW2eHm6I42esOaSg/rvtl5dL8UDuw2FFaaqSeqAW58XdFEJqlIW8kSFMIVBkf4sst/5VHecXcRd4CPYCSgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ro5pzVDo; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ro5pzVDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750832946; x=1782368946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DNNM9U7fRK37I0J9YAYr9hjb20ReSmw0RtBuRXiGOG8=;
  b=Ro5pzVDowWWihllAJuFrXmLnXo1Z/z5KbZOJtA3dHQEl3qGOapljnv9N
   p1chBxW77NaXj6qkVvUpdBdAsDiE5QY161Di1cWa6n2AXRhNw/NyGKFrH
   pwtd8WdpU/HyiFp0rJ3j1Chmq71b/KUjMJuskSecw6xBIOzwWCsog9F4M
   pyN6hsMF/ampkFyDgvoDnubGy89W5cP42L7ocsa9J2YCEJh8fKmqiWFVj
   COh16p4mBW9UDmkxTt6HcITd2Dw9ej09MSSz/Sz6HS5ixAvLamAHL9GhR
   hHXpbDqJoEoNxEmRv1zw8H0L7Zg5mUyJb/MN+Ilftdhomnu+iwMB3WjAU
   g==;
X-CSE-ConnectionGUID: mQZs0LYHRvGm+z7nuC1v9g==
X-CSE-MsgGUID: EPQHa7cqTe66/uPka534fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52809066"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52809066"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 23:29:05 -0700
X-CSE-ConnectionGUID: PW0LCxVqRiq5tOJF/BAXzg==
X-CSE-MsgGUID: jx8BLcRvRt659tI9CLsbWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151541828"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Jun 2025 23:29:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUJcx-000SoU-2a;
	Wed, 25 Jun 2025 06:28:59 +0000
Date: Wed, 25 Jun 2025 14:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Vitaly Wool <vitaly.wool@konsulko.se>
Subject: Re: [PATCH v2 2/2] rust: support large align and NUMA ids in allocs
Message-ID: <202506251416.O5iI9bmq-lkp@intel.com>
References: <20250624123922.3258215-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624123922.3258215-1-vitaly.wool@konsulko.se>

Hi Vitaly,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on rust/alloc-next rust/rust-next linus/master v6.16-rc3 next-20250624]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vitaly-Wool/mm-vmalloc-allow-to-set-node-and-align-in-vrealloc/20250624-204140
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250624123922.3258215-1-vitaly.wool%40konsulko.se
patch subject: [PATCH v2 2/2] rust: support large align and NUMA ids in allocs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250625/202506251416.O5iI9bmq-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506251416.O5iI9bmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506251416.O5iI9bmq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `crate::pr_warn`
   --> rust/kernel/alloc/allocator.rs:18:5
   |
   18 | use crate::pr_warn;
   |     ^^^^^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
