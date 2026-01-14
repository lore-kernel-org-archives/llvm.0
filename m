Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CAE555;
	Wed, 14 Jan 2026 02:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356246; cv=none; b=UjyglPjjk3tgUT+zop+hdMDbN2/2h4V+Zay6ndh5mJ2QahwehFV/KUQD2uxJ+e7HJQBH0jmvSd6aQeEIOexwtxu+vxGYCic22dfSvyCFeO9g2nH7HbmZM3xfCUuX0cGoapNmWIZX+WPxxffJyn5MHeoPIkqxfxOASDWtbwpQJp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356246; c=relaxed/simple;
	bh=bx1odVcIsFTuNbU+nOZRxpPhkHzBMU0U7zpCDJpaVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aE4R8AKLp7GsAp8R8uotfYT2FdzUxL4nK7Gd/OrGZvFKFpE/5KaHtOvcfZzX10D5U9642jvdYv9XJirj9fBdT1jrlZR0ndDuaOOLFJunKWN8MjbVE9YMH7T+Bb9Vn9Ef2hO4ltssV51mg4iOfrw6q2aVy1Mv+1zPYoH2wwGY4HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T+R45A6w; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+R45A6w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768356245; x=1799892245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bx1odVcIsFTuNbU+nOZRxpPhkHzBMU0U7zpCDJpaVXo=;
  b=T+R45A6wGXdbqa2ablbvyG1zSW1cFHa09KQq+hUwku9akmTeFakBJ6tF
   cST16j5eGGhh84Q3gZMpuLNDNAxbPdy5H2CkB9Z9JT8q26BYyeDppcgPT
   iNqQSjqdJThh0phkQh6iBilqn/FRLzLxe1BpMsXx4iY8RNJvcwdzBT0R7
   gQpCIiL2WPXcw++IysL8PlsMNUwNOlcvCHSxXREdbClStg+xrkPWosbQq
   PSVkOkNjXqAe7EFOJQaNY722e8sU0G05o0UgSzJ4qPrTBKLmfzktGWXow
   pvsgviUO+wm5c4pieuj4ZBjvs/mXTVxi4MPD/f+HHvX6RAXxyy0crsNQi
   w==;
X-CSE-ConnectionGUID: 38X0jZyvTeqvFsWoNiyEWQ==
X-CSE-MsgGUID: oofafcDbSz6V1Ho2nKQq1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="57206901"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="57206901"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:04:05 -0800
X-CSE-ConnectionGUID: YYGdVVPzRZyibvUSb2jL2w==
X-CSE-MsgGUID: CodrH4jVSyeJjtLQfMFHJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="242077760"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2026 18:04:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfqEo-00000000Fee-3WLC;
	Wed, 14 Jan 2026 02:03:58 +0000
Date: Wed, 14 Jan 2026 10:03:41 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Crivellari <marco.crivellari@suse.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v2 3/3] mm: add WQ_PERCPU to alloc_workqueue users
Message-ID: <202601140922.x7qD91JV-lkp@intel.com>
References: <20260113114630.152942-4-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113114630.152942-4-marco.crivellari@suse.com>

Hi Marco,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.19-rc5 next-20260113]
[cannot apply to vbabka-slab/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Crivellari/mm-Replace-use-of-system_unbound_wq-with-system_dfl_wq/20260113-195017
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260113114630.152942-4-marco.crivellari%40suse.com
patch subject: [PATCH v2 3/3] mm: add WQ_PERCPU to alloc_workqueue users
config: arm-randconfig-002-20260114 (https://download.01.org/0day-ci/archive/20260114/202601140922.x7qD91JV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140922.x7qD91JV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140922.x7qD91JV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/slub.c:8545:2: error: unterminated conditional directive
    8545 | #ifndef CONFIG_SLUB_TINY
         |  ^
   1 error generated.


vim +8545 mm/slub.c

  8542	
  8543	void __init kmem_cache_init_late(void)
  8544	{
> 8545	#ifndef CONFIG_SLUB_TINY
  8546		flushwq = alloc_workqueue("slub_flushwq", WQ_MEM_RECLAIM | WQ_PERCPU,
  8547					  0);
  8548		WARN_ON(!flushwq);
  8549	}
  8550	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
