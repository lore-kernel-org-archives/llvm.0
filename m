Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557C32571C;
	Tue, 20 Jan 2026 03:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768879656; cv=none; b=pw8yWvLGNevyf7/Tn60AfDmHY7vVWTkUzmmhFiwtBzuj+xkWaEIZRyDDdVsJlZc72kw0zTlIM+fdnj7kIIkVHrkD8RvVrz8mVIW++Th5df75XEGHDvejWdNFnBrnS+z0mVrmYZCIr+iWeZbDb0u5tdoV+xw0RvGlqNehFLPN6n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768879656; c=relaxed/simple;
	bh=Y68AbIYdWJarcuG359VvZSXbHXjxsUwTiwFAd76xnZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZAFlH2BQZyf5guaPjexF5Up28+h/Q9bCBVVOgyW2yjJaudsMz5nx+3WwRkxVUnW1r7GRjPL682gqUTSCqrkgpzmp/Eosgn9wxhwFlmCTdBeK39qYw/TN0D8PUvogc7v30hfYZOCG9TNqAJ/XJxWLrjOvQ/uQfXmHGwLhPTcMSU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gmLSjzTe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmLSjzTe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768879654; x=1800415654;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y68AbIYdWJarcuG359VvZSXbHXjxsUwTiwFAd76xnZg=;
  b=gmLSjzTeCMxa7ZBe8o6P+3gpjGaJAw6CxV8x3JwuiDZCm2+6ymucVhmw
   M6WmYjkBiwPTd0LIoiEG3FicZLxmx0ZKuuedHrVCMtt3+lSGaWlk2zJ74
   CHHn7e7CMGTxezYrWWcWsEnetk+3dZIeCTZNAph0cuOHVlaSIgwlpt+zP
   hseSQK2MdcNSx1Qirbjr8GAellXb/C98CCt7psTwRSD6GA05ZiO967KSj
   iwvPK98P5zYrqz6kqMLp/7BFk3VXe4i+wnYpU0SEsCVrjmOWjws5ChBE+
   3Zpe2T98PiaC4QOOl5C0H8UVc0L+21fT+ztg9iUpXWTLBoJwjbQVXjJZ7
   Q==;
X-CSE-ConnectionGUID: T7+Fhw39S1umy5nU1LnCYg==
X-CSE-MsgGUID: y2eULWTkSDOpvIJCJ3H65g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="81191365"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="81191365"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 19:27:33 -0800
X-CSE-ConnectionGUID: Ei9BOxVbQTC+XtYwNqw09A==
X-CSE-MsgGUID: yrmO3weeQuus3eqO2P1P2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="210506954"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 19 Jan 2026 19:27:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi2Ov-00000000OWT-2fnq;
	Tue, 20 Jan 2026 03:27:29 +0000
Date: Tue, 20 Jan 2026 11:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] x86/cpu: Add missing #include
Message-ID: <202601201108.9LSE7tG6-lkp@intel.com>
References: <20260119195051.4235E147@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119195051.4235E147@davehans-spike.ostc.intel.com>

Hi Dave,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on linus/master v6.19-rc6 next-20260119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Hansen/x86-cpu-Break-Vendor-Family-Model-macros-into-separate-header/20260120-035537
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20260119195051.4235E147%40davehans-spike.ostc.intel.com
patch subject: [PATCH 2/6] x86/cpu: Add missing #include
config: hexagon-randconfig-002-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201108.9LSE7tG6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201108.9LSE7tG6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201108.9LSE7tG6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/peci/device.c:6:
   In file included from include/linux/peci-cpu.h:33:
>> include/linux/../../arch/x86/include/asm/intel-family.h:5:10: fatal error: 'asm/vfm.h' file not found
       5 | #include <asm/vfm.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +5 include/linux/../../arch/x86/include/asm/intel-family.h

     4	
   > 5	#include <asm/vfm.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
