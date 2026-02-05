Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3A2259C84;
	Thu,  5 Feb 2026 02:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770257214; cv=none; b=BgA2pWiyI4iiLdMmNdarroAQrBvwMZTFCfJuxf/PRhmPVrZduS524nkRaQvqCD5E3/kTSAVE9VYEwY4fuWSnT5KD4/ewYofMC3/AAH61EmnPrP01nJf62/6VSMdQKd6uFYsq961nwaBI1PY8hdW2YoBY7TLtmAxf4U0PM9FSfXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770257214; c=relaxed/simple;
	bh=eksKR9TjaFf6eviL98fb+Q1N20SxGoF0YE2fLnyRCgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZUio5aaYvp+Qy78Oo0p2wPnYFQdmphOs0e89Ug5YBjJjZDM3nBbrGFprIPeXg9/YKrzUZARZ5Z3CaZOPMHi0b793XdaGhfaaz3gYbN+0WJJfxOzHes0WZi5W5yeOQcca2M26dwvsiU6MgttdAkWxRepGvIa5n59qICUFtCVlY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oJ3yfFpM; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oJ3yfFpM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770257213; x=1801793213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eksKR9TjaFf6eviL98fb+Q1N20SxGoF0YE2fLnyRCgc=;
  b=oJ3yfFpMOLHRaO59RLjAwxHOhPx0gGcuQMYF4hgfQgG99Km1DZdWOdEs
   VCwurbc3FBWIvPVeerrYYLwpUxEhEYGBFiZYAGB/PFCUldC3XMSdjFQgY
   oOfB+6NYnrrtgVYTj00bvdeQrQ6wn+jaCrYxUDleS4G2bBPypID7jAJGV
   944oSynD5Wyig1Lkowby8V48Zms1N847BbOBfLKcmjild/I5G9aRGFgis
   OLBAcn4yCk5Nz4F+Py9adcCSke+JQaJOa1M3c3lmn3OyKOQWWrRZz37lE
   LpZYVkezAdY02WGbAtuhhcW9RGWYR55YD85eQVLUDg3r6WCQxcjiJeOPQ
   g==;
X-CSE-ConnectionGUID: 1WeQP3lsT0KtRAylz5oZgg==
X-CSE-MsgGUID: daVNl0O8RhW1OzzNxXpXJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70470507"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="70470507"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 18:06:51 -0800
X-CSE-ConnectionGUID: DkH/glvfQmO5S+olBpvkPg==
X-CSE-MsgGUID: V/elJTghR0a3wxjxPjZjVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; 
   d="scan'208";a="209708523"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Feb 2026 18:06:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnolV-00000000jJe-13i2;
	Thu, 05 Feb 2026 02:06:41 +0000
Date: Thu, 5 Feb 2026 10:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>, pasha.tatashin@soleen.com,
	rppt@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	pratyush@kernel.org, linux-kernel@vger.kernel.org,
	surenb@google.com, Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
Message-ID: <202602051021.dhUjHKwO-lkp@intel.com>
References: <20260204182816.2463931-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204182816.2463931-1-sashal@kernel.org>

Hi Sasha,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.19-rc8 next-20260204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Levin/kexec-allow-KEXEC_HANDOVER-to-build-with-COMPILE_TEST/20260205-023202
base:   linus/master
patch link:    https://lore.kernel.org/r/20260204182816.2463931-1-sashal%40kernel.org
patch subject: [PATCH] kexec: allow KEXEC_HANDOVER to build with COMPILE_TEST
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260205/202602051021.dhUjHKwO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602051021.dhUjHKwO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602051021.dhUjHKwO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/memfd_luo.c:316:10: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     315 |                         pr_warn_ratelimited("Unable to restore folio at physical address: %llx\n",
         |                                                                                           ~~~~
         |                                                                                           %x
     316 |                                             phys);
         |                                             ^~~~
   include/linux/printk.h:722:49: note: expanded from macro 'pr_warn_ratelimited'
     722 |         printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:706:17: note: expanded from macro 'printk_ratelimited'
     706 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                        ~~~    ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   mm/memfd_luo.c:372:11: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     371 |                         pr_err("Unable to restore folio at physical address: %llx\n",
         |                                                                              ~~~~
         |                                                                              %x
     372 |                                phys);
         |                                ^~~~
   include/linux/printk.h:555:33: note: expanded from macro 'pr_err'
     555 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:512:60: note: expanded from macro 'printk'
     512 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:484:19: note: expanded from macro 'printk_index_wrap'
     484 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   2 warnings generated.
--
>> kernel/liveupdate/kexec_handover.c:25:10: fatal error: 'asm/early_ioremap.h' file not found
      25 | #include <asm/early_ioremap.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> kernel/liveupdate/kexec_handover_debugfs.c:99:29: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
      99 |                 seq_printf(m, "0x%llx\n", kho_scratch[i].addr);
         |                                  ~~~~     ^~~~~~~~~~~~~~~~~~~
         |                                  %x
   kernel/liveupdate/kexec_handover_debugfs.c:108:29: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
     108 |                 seq_printf(m, "0x%llx\n", kho_scratch[i].size);
         |                                  ~~~~     ^~~~~~~~~~~~~~~~~~~
         |                                  %x
   2 warnings generated.


vim +25 kernel/liveupdate/kexec_handover.c

c609c144b0e8db kernel/kexec_handover.c Alexander Graf 2025-05-09  24  
c609c144b0e8db kernel/kexec_handover.c Alexander Graf 2025-05-09 @25  #include <asm/early_ioremap.h>
c609c144b0e8db kernel/kexec_handover.c Alexander Graf 2025-05-09  26  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
