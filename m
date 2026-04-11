Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE7533F587;
	Sat, 11 Apr 2026 11:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775905708; cv=none; b=NwH3UvLG/QmW8DjH4vy8Fsrkh5O0MDlY4BwSVgE2eYUS8cwbEpnPi9m+pRUsKOi9aq1WZDa0+Y0e00UwCG12wCuWw70dO49H490yXIpTGjPliOHsQUu45q/Mhxhzgcug/Vj+o4HfCpNsnzw5YPdhvLZ2hUj5gK3bMWN7Lml9tBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775905708; c=relaxed/simple;
	bh=n4jCbvoXHQzLUfxIsK52UWT/ZiXsVp9w9lmDCQOl8PU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSzh/8fgaryJ1LLC1mfAOYziDjIaqFenmNEHEdc/bhFy/qAEdTSuZWWqbZovWYHxZnDXARZT8Oi6N6bhWUmO5ci82bBv7MfOSw5O2q7CFlTxdgf2wFU7h454GlRd8YqTObCohaOb3GpvQIQDeThMJh+NTH20B0oh77691+EFMeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QnxUJeeR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QnxUJeeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775905706; x=1807441706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n4jCbvoXHQzLUfxIsK52UWT/ZiXsVp9w9lmDCQOl8PU=;
  b=QnxUJeeR6waH1n/Of3dR9LyGueL8EUPIEsbADQ+3EKdP4VyS+07qLpOp
   5Ic7cZBH+f3ItRWWmCRjipM1vynUzCzgyaNxjjXSbyS0DujvGkT3PHWcm
   6SpiALCtfbJO95RBhZH6SDpvM5BTaXn8NWJvqzbcvobsLnqrOPMqhjQ+M
   d2x9IGJcAl/fwPRNYYezh3+Z732ZPYkxffLiwN5nLLCiqnBxsA6qVbsdm
   K58QnPSWpSHg7HQA6628x97MtFSd+uG+rr1hC08RmEFqTWv2kPjPReY/s
   K7nOlQtCskOm3yIUaaZ0WBIV+u60PuDc6Djbwo4JUdoAtSB+HuUDOJ9u1
   w==;
X-CSE-ConnectionGUID: nCHvrrc/TtGLJMj4EdDbkA==
X-CSE-MsgGUID: +7wsH4rzQimpANRoxZYF+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="79497582"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="79497582"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 04:08:25 -0700
X-CSE-ConnectionGUID: mO4RSQk1QveiwXCLDsf7pg==
X-CSE-MsgGUID: ij0+y2IPSXy2yQ9but4jCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="228477001"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Apr 2026 04:08:23 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBWCJ-00000000169-1p3K;
	Sat, 11 Apr 2026 11:08:19 +0000
Date: Sat, 11 Apr 2026 19:07:33 +0800
From: kernel test robot <lkp@intel.com>
To: Cao Ruichuang <create0818@163.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
	Cao Ruichuang <create0818@163.com>
Subject: Re: [PATCH] mm/vmstat: reject invalid stat_interval values
Message-ID: <202604111816.CsqTatIh-lkp@intel.com>
References: <20260410112554.23165-1-create0818@163.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410112554.23165-1-create0818@163.com>

Hi Cao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Cao-Ruichuang/mm-vmstat-reject-invalid-stat_interval-values/20260411-085547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260410112554.23165-1-create0818%40163.com
patch subject: [PATCH] mm/vmstat: reject invalid stat_interval values
config: arm-randconfig-004-20260411 (https://download.01.org/0day-ci/archive/20260411/202604111816.CsqTatIh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project ae825cb8cea7f3ac8e5e4096f22713845cf5e501)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111816.CsqTatIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111816.CsqTatIh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmstat.c:1968:18: warning: unused variable 'sysctl_stat_interval_max' [-Wunused-const-variable]
    1968 | static const int sysctl_stat_interval_max = INT_MAX / HZ;
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/sysctl_stat_interval_max +1968 mm/vmstat.c

  1964	
  1965	#ifdef CONFIG_SMP
  1966	static DEFINE_PER_CPU(struct delayed_work, vmstat_work);
  1967	static int sysctl_stat_interval __read_mostly = HZ;
> 1968	static const int sysctl_stat_interval_max = INT_MAX / HZ;
  1969	static int vmstat_late_init_done;
  1970	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
