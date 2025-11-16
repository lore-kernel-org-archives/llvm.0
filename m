Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1288830B502;
	Sun, 16 Nov 2025 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763301500; cv=none; b=Y4sf6fxivLH+e8hznTQv1lQ7bAL9t2UcO6ZTAW9UG2fTvpNXzLEP5Qt0ONC28R/dg97CXAxgrK1bINke8ZhSI0IdwbBZMrmn7dgcNF7Rc2Mgid2XP+FAp1gK/gY5P0RVGfOY7QK/mqhvf2EvMR/mQtwjyjCT/JKoAraHAa6q7uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763301500; c=relaxed/simple;
	bh=fNJ0yXPSSR5QrWUXhf3XrjJfWHWf/HcB6IYPIsm6uno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJE9J4u5jFyJsyBQAnJHvRd/C0gqWUqhk/nskhrujek6FkNaUsaIh4LwqkKQ3WhbrjVopDRsmWSOf4mBJW859V4/jFVqMGfxpL1iMDu8Y7siednBo4pExLhWyG7Qe+QyP6DnuGqy06SLgbxwLUZKi/w6kt/P3lo5wHvMWjmbb6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDJASota; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDJASota"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763301495; x=1794837495;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fNJ0yXPSSR5QrWUXhf3XrjJfWHWf/HcB6IYPIsm6uno=;
  b=SDJASotaLy2voiQHb1ldemU/yS5gHwu10Jx6pWPgSBmFp3ZhA47mOrL4
   UnLVvsGYL1hCH3g2UX7hAa+9KwBVlF3lO2DgLjgo9caZN5F7oMlgaaTcK
   xbLz2FkVvxfyTZHFseyVydoWP6c+P0TzZlFPRy5k0/QcJlC15m+q6MZ/3
   3B2NovdMO+7w28o/QR+gv+amkKY2bwP2VpvJWJn7IPGrA4KelbrvXtL80
   1De5a6LZylfwvrgtfhx7Vw6Qe9v8ZYzpjosaD+iYtVKqtKC9dR8PF+3Z2
   6EKYpbR1P8OvHB2hAcbCrJ1IQFRuv23cA6h6qjwk7nptx7RjHSnYAyVpt
   g==;
X-CSE-ConnectionGUID: FRxMZNs8TMq/XSDt+PqbMQ==
X-CSE-MsgGUID: YlZRhxDOQNidMymYK8YlQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82947595"
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="82947595"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 05:58:04 -0800
X-CSE-ConnectionGUID: BYJGnEQ6RraUId9gtEkZEA==
X-CSE-MsgGUID: sn7Z5i27Ru+3tfvVlBimLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,309,1754982000"; 
   d="scan'208";a="189885655"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2025 05:58:02 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKdGR-0008o7-33;
	Sun, 16 Nov 2025 13:57:59 +0000
Date: Sun, 16 Nov 2025 21:57:43 +0800
From: kernel test robot <lkp@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org,
	tzungbi@kernel.org
Subject: Re: [PATCH] lockdep: Add header and footer to surround warning
 reports
Message-ID: <202511162152.utadPKg3-lkp@intel.com>
References: <20251114062730.1828416-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114062730.1828416-1-tzungbi@kernel.org>

Hi Tzung-Bi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v6.18-rc5 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tzung-Bi-Shih/lockdep-Add-header-and-footer-to-surround-warning-reports/20251114-143903
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20251114062730.1828416-1-tzungbi%40kernel.org
patch subject: [PATCH] lockdep: Add header and footer to surround warning reports
config: hexagon-randconfig-001-20251115 (https://download.01.org/0day-ci/archive/20251116/202511162152.utadPKg3-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511162152.utadPKg3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511162152.utadPKg3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/locking/lockdep.c:62:10: fatal error: 'asm/bugs.h' file not found
   #include <asm/bugs.h>
            ^~~~~~~~~~~~
   1 error generated.


vim +62 kernel/locking/lockdep.c

    61	
  > 62	#include <asm/bugs.h>
    63	#include <asm/sections.h>
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
