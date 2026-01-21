Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF953559C0;
	Wed, 21 Jan 2026 19:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769025550; cv=none; b=ezLmEyJ5H2/yT1C+OFqykXsQm9zMbBQU5sRr42hLfe9f35tUZKZySAialJBWPT2rh8PAcsFuhvo/FPjjyMm9aqK8KsjToBdGi5rXiah6ptWYYjS2DvjtN3vqCXAbQBfPYHBK9IwmD/Ua8ilhz04POVMU1kJ01oXuuudpP0nrKVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769025550; c=relaxed/simple;
	bh=7BcVKTw//RW3J/ByS+YgywA/D0zOU15Z06BFqWWYqvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e+tpT5kRYB7bhCBc2UwaQy5DUcCs0T6PixGAIe17PhFFZ3/bSWbqzKNApLknJ5ln0GNNn05P6do1U+aBW1n0j89hiHYphEkBNrBBf+OW50b+5K9o2iq9Nulze9/YvVcDkgfQ2ugxgLoNS7HGw8HgPBJAnJ49OTZJciek0ato9yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GD+ctjsk; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GD+ctjsk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769025548; x=1800561548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7BcVKTw//RW3J/ByS+YgywA/D0zOU15Z06BFqWWYqvE=;
  b=GD+ctjsk4fV+cY9QURsTQM+tNfRiSIs6WFrHyyol9lMVOB6stCReVhkg
   SeDF2Qzk8y/EVKFGbZ4/XE9G6XLgZXV8C0GV8DosQETcdBbqRExeKWFul
   d+389644bUY1XVqkz9VBDv7HEH2QyKHO6oyEFUoAhY2Cb6gDsSRJnNYqd
   xxwxLX0a/sVr5nwCEZ667nbDWq6bd5uzFwESy2L2QWfiKgP6WM9ziCWkp
   v0/wsZ7uueS4h5W6uaewochLdwIdPQUc8ZNMyMYEr3RQZzLPoASGKuIA4
   Gn5FYpLHwjBQ4kCZ/YYuysaRTzxVWhcswSMuloACjNDy9H7vgYoCDCjOY
   w==;
X-CSE-ConnectionGUID: kTfmQ1uERymPAMPhSLJABw==
X-CSE-MsgGUID: XvONW6H4TtOl1AOuCXJcog==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69277878"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="69277878"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 11:59:07 -0800
X-CSE-ConnectionGUID: 4wKyXuawRY+jTQh+RxGylg==
X-CSE-MsgGUID: Y++KtQPKSVGO9LqXXO/edQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206784696"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jan 2026 11:59:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vieM2-00000000RpJ-2669;
	Wed, 21 Jan 2026 19:59:02 +0000
Date: Thu, 22 Jan 2026 03:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Juergen Gross <jgross@suse.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH 2/4] x86/mtrr: Introduce MTRR work state structure
Message-ID: <202601220306.FavyG0wD-lkp@intel.com>
References: <20260121141106.755458-3-jgross@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121141106.755458-3-jgross@suse.com>

Hi Juergen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/master linus/master v6.19-rc6 next-20260121]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Juergen-Gross/x86-mtrr-Move-cache_enable-and-cache_disable-to-mtrr-generic-c/20260121-230320
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260121141106.755458-3-jgross%40suse.com
patch subject: [PATCH 2/4] x86/mtrr: Introduce MTRR work state structure
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260122/202601220306.FavyG0wD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220306.FavyG0wD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220306.FavyG0wD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kernel/cpu/mtrr/generic.c:920 function parameter 'state' not described in 'set_mtrr_state'
>> Warning: arch/x86/kernel/cpu/mtrr/generic.c:920 function parameter 'state' not described in 'set_mtrr_state'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
