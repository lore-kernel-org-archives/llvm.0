Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F005346AC2;
	Mon, 12 Jan 2026 09:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768208412; cv=none; b=izAsEov8/Gv4UNT1ofmBLeWsLuuPRCW0UUifu3JW/wUnNSTAEgdn9OU6XpPV496jkH0R/AP7GHHE4foLt29FxXrvw/nsjdRWwktmaA0WrhxLFWfR8IVxsTK+rEDENJpXVGzCSHlLFUN+LWtG/uA1IPkuF+qXFT2EGJXatITEkj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768208412; c=relaxed/simple;
	bh=aDa/0TXnneYAO0ragQpLpLZ66QllwouPCG6c1Bx4DBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pTEM63LccjWfnEY27oGhg4DZEUoFWdJNUF7s6vNeArFqgowqWABgfHVdMWB/r8AhtnTsMqrB5wWXMM+750ErRzwBLPZIz9s/3d9trqAH4SyfpWD2fK6xdWUUYOVJIiRu8CPNnWoKsbLWU84DpXzXjM2emPk2tre2kzJQQLkjU00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/zU9FC7; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/zU9FC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768208410; x=1799744410;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aDa/0TXnneYAO0ragQpLpLZ66QllwouPCG6c1Bx4DBM=;
  b=W/zU9FC7fMx9vX1buwA0Lk7LaSGo1ggZ1mcEmtvH9+ql2966LtsGJZMx
   WSx4V7fOBnzHUgRCc3H0VBpnl1fiPlZyx7ssZoi8RR5QnofX/Af6bEyMk
   //pdqisvln5meuw2guikWaOJdvOSSNYOckBPdw3hMth8wnR2bjYAJAfrZ
   KcYzCxt5kluo3WfS3r6cK142s+HuO3EKNLx+2ee4g6Dr5n81zT7tSkjzg
   mp8GP8qKQTAwrOiqFC5XCzVlYtOl9IVqmSAptU/9ME3BAZ3kXMX5PWHxB
   Pgbc9Fd2I+Ny7r5fs9SlrkTYjxRf9uVLNFdLR6qD05L3J1T459upPxQI2
   A==;
X-CSE-ConnectionGUID: 9g+mS1iWT1CtXhwex0sQmQ==
X-CSE-MsgGUID: f123PVNlQKWQoiTzKtDKNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="72055816"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="72055816"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 01:00:09 -0800
X-CSE-ConnectionGUID: FIMgLId8SNiBi3+4Mhpi8w==
X-CSE-MsgGUID: XsM2w3XqQWOpn/kxd0yDdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="208872417"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jan 2026 01:00:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfDmP-00000000DBE-3Omd;
	Mon, 12 Jan 2026 09:00:05 +0000
Date: Mon, 12 Jan 2026 16:59:57 +0800
From: kernel test robot <lkp@intel.com>
To: Luigi Rizzo <lrizzo@google.com>, tglx@linutronix.de, maz@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	edumazet@google.com, linux-kernel@vger.kernel.org,
	Luigi Rizzo <lrizzo@google.com>
Subject: Re: [PATCH] genirq: move clear of kstat_irqs to free_desc()
Message-ID: <202601121654.B4jBkJbI-lkp@intel.com>
References: <20260111191710.1993867-1-lrizzo@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111191710.1993867-1-lrizzo@google.com>

Hi Luigi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/irq/core]
[also build test ERROR on linus/master v6.19-rc5 next-20260109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luigi-Rizzo/genirq-move-clear-of-kstat_irqs-to-free_desc/20260112-031857
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260111191710.1993867-1-lrizzo%40google.com
patch subject: [PATCH] genirq: move clear of kstat_irqs to free_desc()
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260112/202601121654.B4jBkJbI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121654.B4jBkJbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121654.B4jBkJbI-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/irq/irqdesc.c:118:6: warning: unused variable 'cpu' [-Wunused-variable]
     118 |         int cpu;
         |             ^~~
   kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
     625 |                 for_each_possible_cpu(cpu)
         |                                       ^
   kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
   kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
   kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
   kernel/irq/irqdesc.c:625:25: error: use of undeclared identifier 'cpu'
   kernel/irq/irqdesc.c:626:35: error: use of undeclared identifier 'cpu'
     626 |                         *per_cpu_ptr(desc->kstat_irqs, cpu) = (struct irqstat) { };
         |                                                        ^
>> kernel/irq/irqdesc.c:626:4: error: indirection requires pointer operand ('unsigned long' invalid)
     626 |                         *per_cpu_ptr(desc->kstat_irqs, cpu) = (struct irqstat) { };
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 7 errors generated.


vim +626 kernel/irq/irqdesc.c

   618	
   619	static void free_desc(unsigned int irq)
   620	{
   621		struct irq_desc *desc = irq_to_desc(irq);
   622	
   623		scoped_guard(raw_spinlock_irqsave, &desc->lock) {
   624			desc_set_defaults(irq, desc, irq_desc_get_node(desc), NULL, NULL);
 > 625			for_each_possible_cpu(cpu)
 > 626				*per_cpu_ptr(desc->kstat_irqs, cpu) = (struct irqstat) { };
   627		}
   628		delete_irq_desc(irq);
   629	}
   630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
