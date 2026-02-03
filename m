Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A5C3451D5;
	Tue,  3 Feb 2026 12:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122652; cv=none; b=ufq36LvrMNg8lg06G4JtSBOzpwSdasC74DhRcbM8vRTyE/QrxphBNxPa1WR4eGSNM7TaawwaGNzRCcleLocchJwufNR34uQKUJ07HRgd/uXW01PyD9NCXWa8UferwjKbklR7YqhbcwRkzeHP1NpWBOnUmUPEl8mrlD9w9vlK+HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122652; c=relaxed/simple;
	bh=nv+0yAgc7A7ZnrmTCcsOyGr+oj3RtRlG3oFkE6//31c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4JhT6+xTfo3CAQbw6VbuR03SxIQw7ZsQ9HNPCQHVcRrNf5e0Fp26yH2FbluOftUwhF15944iHyRv08j7oz6GEIEJtd5GIOUZXpir/n2VsMZDs7XSLNzgYPs4fLpAXayCUMAtZosf1sToqbnI5kbFerhTMuLD9RB7RbkL1sQ1ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tko51Hg/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tko51Hg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770122650; x=1801658650;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nv+0yAgc7A7ZnrmTCcsOyGr+oj3RtRlG3oFkE6//31c=;
  b=Tko51Hg/aS0CMGYItqieuLznaxbL1S656nAvkkm7BzBmEolRcF6fszYP
   D8qoZusvgpuBPWc+jPZEBIbA00xbdaPmsJgUg5Eb4s/dAww9TwKssxM82
   KqTjSB1YyxO6qFDP/Cevbri1JIfB7tZGm8MrjTtadBB8D9W7xx4sLid1t
   JqOX+9Bw5y4hrCU4+CkyFTxGxrymDuOcY0vh0Q8boRALp3SXQBVQ/frZG
   +CO2LELYb97EnerlJOpeGpWnLigvECQITT6/fm4/6/iVSVIQxntthmwFc
   n24xRwarHUgydEFb44IuVfWVdn7FefLGo8V6HySsy8KjBc12EG52xrBOJ
   Q==;
X-CSE-ConnectionGUID: gJ0TofnGQbWWcMQYgowyCA==
X-CSE-MsgGUID: FzapRpXnR+2xOu+tdveiDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82664581"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="82664581"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 04:44:10 -0800
X-CSE-ConnectionGUID: fH4M/HNcQaCn8XOaQXzafQ==
X-CSE-MsgGUID: O2xh9mAaSD65EfJvpBCdig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209935124"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Feb 2026 04:44:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnFlG-00000000geW-0cz8;
	Tue, 03 Feb 2026 12:44:06 +0000
Date: Tue, 3 Feb 2026 20:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: gutierrez.asier@huawei-partners.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/4] mm/damon: New module with hot application
 detection
Message-ID: <202602032000.vcEAle6A-lkp@intel.com>
References: <20260202145650.1795854-4-gutierrez.asier@huawei-partners.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202145650.1795854-4-gutierrez.asier@huawei-partners.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/gutierrez-asier-huawei-partners-com/mm-damon-Generic-context-creation-for-modules/20260202-230022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260202145650.1795854-4-gutierrez.asier%40huawei-partners.com
patch subject: [RFC PATCH v1 3/4] mm/damon: New module with hot application detection
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260203/202602032000.vcEAle6A-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032000.vcEAle6A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032000.vcEAle6A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/damon/dynamic_hugepages.c:571:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     571 |         if (enabled)
         |             ^~~~~~~
   mm/damon/dynamic_hugepages.c:574:6: note: uninitialized use occurs here
     574 |         if (err && enabled)
         |             ^~~
   mm/damon/dynamic_hugepages.c:571:2: note: remove the 'if' if its condition is always true
     571 |         if (enabled)
         |         ^~~~~~~~~~~~
     572 |                 err = damon_dynamic_hotpages_turn(true);
   mm/damon/dynamic_hugepages.c:568:9: note: initialize the variable 'err' to silence this warning
     568 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +571 mm/damon/dynamic_hugepages.c

   561	
   562	module_param_cb(enabled, &enabled_param_ops, &enabled, 0600);
   563	MODULE_PARM_DESC(enabled,
   564		"Enable or disable DAMON_DYNAMIC_HUGEPAGES (default: disabled)");
   565	
   566	static int __init damon_dynamic_hotpages_init(void)
   567	{
   568		int err;
   569	
   570		/* 'enabled' has set before this function, probably via command line */
 > 571		if (enabled)
   572			err = damon_dynamic_hotpages_turn(true);
   573	
   574		if (err && enabled)
   575			enabled = false;
   576		return err;
   577	}
   578	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
