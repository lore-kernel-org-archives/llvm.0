Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9813D2673BA;
	Tue,  4 Mar 2025 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741107929; cv=none; b=AB4kqQ1YwDqhHtNzX2LelsecdreeuPS7Ttob4OxnCof/eZkR90l5uMx3wJS09Y2YJOAxGh/RYTbxzEmRgIV0wnMfNOQXD/SyCiDur1G51q7uPOk0iPbcDizUSXv+KDO2+0qKgBWg5kdhwnIHUwq+vVKUL10TnlPdxUWGhGXJG7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741107929; c=relaxed/simple;
	bh=RDpyLABRZvGWXNZLdr9VJTcE+G5tG2Zqtza2puZ8MEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBgdJbhyB6J6OWrFmg3LW5uPROcgXwtaAjb+CjdbYjHOdVbCXlMRn9EaQUfVZwHyPEA6SX3AQT+f7M+bTztj6M79skRlzyw7kluV2OP7VHe6MN0IvR5neDKJzhzNVyvQ9Sw3qxe6V1mK0ueN4cTMFhEhZ15QLRCeCgocOYw16b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n6Q2+jzn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6Q2+jzn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741107927; x=1772643927;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RDpyLABRZvGWXNZLdr9VJTcE+G5tG2Zqtza2puZ8MEI=;
  b=n6Q2+jznJI7XhSwNzkf2habzEB96mYpZZHGI+Greuma+a34JhaUqB6S5
   ZTwK4SNp0e0QGik8p7aHMJ5421PmKdI4J0V6p4db6wTpigROLjEQgqM3X
   GwpIS3fK2/xWfYwfB7gsXNkk57W/U+QHRc60PdWz+PBVjKzVm7n1Cemm1
   LblklQEj5Vvarmeb9TmDnDnpANxoW/bmCKOx4L1QHeeiBgIy3fweqjhUh
   ylIOe7OOJZVQ9jgrPGbARlNcnNNRTQsnaXjPj6w9rHRYSktoPeCKq982w
   IFWovR5Eq9kEK62bhxTIsafPw7JuQWzWm/a/5a3qjT7+MVJAuWWNTWcpT
   A==;
X-CSE-ConnectionGUID: FTa1T6IzQKCvT6zc+CVTWA==
X-CSE-MsgGUID: 9XmXnGwyT0ugkk6JfXLfFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="45965043"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="45965043"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 09:05:07 -0800
X-CSE-ConnectionGUID: jyAZbCC/Sly/1kVYr8jNGA==
X-CSE-MsgGUID: kcxpvr4dQkCfZJE34vMP/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118427663"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2025 09:05:06 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpVhY-000K30-0G;
	Tue, 04 Mar 2025 17:05:04 +0000
Date: Wed, 5 Mar 2025 01:04:47 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH -tip 3/5] x86/irq/32: Add ASM_CALL_CONSTRAINT to inline
 asm using CALL_NOSPEC
Message-ID: <202503050046.Lv9cC1m9-lkp@intel.com>
References: <20250303155446.112769-3-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303155446.112769-3-ubizjak@gmail.com>

Hi Uros,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/auto-latest linus/master v6.14-rc5 next-20250304]
[cannot apply to tip/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uros-Bizjak/x86-irq-32-Add-missing-clobber-to-inline-asm/20250303-235755
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250303155446.112769-3-ubizjak%40gmail.com
patch subject: [PATCH -tip 3/5] x86/irq/32: Add ASM_CALL_CONSTRAINT to inline asm using CALL_NOSPEC
config: i386-buildonly-randconfig-001-20250304 (https://download.01.org/0day-ci/archive/20250305/202503050046.Lv9cC1m9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503050046.Lv9cC1m9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503050046.Lv9cC1m9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/irq_32.c:62:10: error: expected ')'
      62 |                        COMMA(ASM_CALL_CONSTRAINT)
         |                        ^
   arch/x86/kernel/irq_32.c:102:10: error: expected ')'
     102 |                        COMMA(ASM_CALL_CONSTRAINT)
         |                        ^
   2 errors generated.


vim +62 arch/x86/kernel/irq_32.c

    54	
    55	static void call_on_stack(void *func, void *stack)
    56	{
    57		asm volatile("xchgl %[sp], %%esp\n"
    58			     CALL_NOSPEC
    59			     "movl %[sp], %%esp"
    60			     : [sp] "+b" (stack)
    61			     : [thunk_target] "D" (func)
  > 62			       COMMA(ASM_CALL_CONSTRAINT)
    63			     : "memory", "cc", "edx", "ecx", "eax");
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
