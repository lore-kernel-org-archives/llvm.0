Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8FC824BB;
	Sat, 12 Oct 2024 18:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728757877; cv=none; b=V4/Gp9O+NEcaTYtyfYCJafHiCFjeP0BfMhwT+Nac7FxfCzK+svcD/mZ+ioSJOlvG+tjXT0LOoj5zGdkZUFchbFEOmZU3Hh3oI6nt9phMteUIOOK5WhdK1J5/KAMxc2XZDBSn8Ki10Nib6MY4Jq/U8JqXQXqjCYQhPHJBJSIGxDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728757877; c=relaxed/simple;
	bh=xcB1JL/LxpjhQVmDKC3WFi4+bs7OfibWrbsrEUJo7tQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYhfLKYr/+Fn95X9e+20FKqU1716ENsLuth5RjLnd0S8CiYm3X3VxfOlAAOD0nDNFZzSovKEXKT+guhN/1eLvaraU4QXmVwS+AYcxI+Ol7dKKyMJrGlPbLKTDz+S6/UY4LuAhv/AvixigZ+vsrwzgiZeAakAAPu3iW7XhaOLxOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeHnyBa7; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeHnyBa7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728757875; x=1760293875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xcB1JL/LxpjhQVmDKC3WFi4+bs7OfibWrbsrEUJo7tQ=;
  b=UeHnyBa7DBYVppeRTBaPrCb9PiV6S5tbcB69jVND82Hrkt+a0p4XT3Jm
   K8ZLrlRmgvqj2nCOCvXrywHvUZDWUjW8Fi8NiRdtvjdNlsJZr9FFal0W8
   s0dY6tsKJogFtr6GGwSTdHJweCbVn+qFKhWBnDtKGrjS4+bmKjLcLtci6
   HUykuSRN1A0l0cf+X6A2heHtICKlUYJEv6wh1OLjjZS9uFbFqsVg1o5g5
   xT8oxwZbbIRjv3TD4UrEWaMFSRADpUHplJJWVxbPzH3mWBV5ODZKbm3op
   KtNg3pR49dsgXxL5zPuj3jC8cdVQrfvkqDekuQOwwzPcKjevg9dGJpD0P
   Q==;
X-CSE-ConnectionGUID: FYirrTB9QfyY4J3g5rv2fA==
X-CSE-MsgGUID: Jwssv9PQQ6avqaJwUG/5PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27631962"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="27631962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 11:31:14 -0700
X-CSE-ConnectionGUID: 0HvEc+vzRFqH3GPsXi+3NQ==
X-CSE-MsgGUID: JAoDYNHeTeikiVvKR/5JJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="81979187"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Oct 2024 11:31:13 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szgtS-000Dbf-22;
	Sat, 12 Oct 2024 18:31:10 +0000
Date: Sun, 13 Oct 2024 02:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/3] tracing: Record task flag NEED_RESCHED_LAZY.
Message-ID: <202410130231.L7iGIO8b-lkp@intel.com>
References: <20241009105709.887510-3-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009105709.887510-3-bigeasy@linutronix.de>

Hi Sebastian,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on rostedt-trace/for-next v6.12-rc2 next-20241011]
[cannot apply to rostedt-trace/for-next-urgent]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sebastian-Andrzej-Siewior/tracing-Replace-TRACE_FLAG_IRQS_NOSUPPORT-with-its-config-option/20241011-002703
base:   linus/master
patch link:    https://lore.kernel.org/r/20241009105709.887510-3-bigeasy%40linutronix.de
patch subject: [PATCH 2/3] tracing: Record task flag NEED_RESCHED_LAZY.
config: arm64-randconfig-002-20241012 (https://download.01.org/0day-ci/archive/20241013/202410130231.L7iGIO8b-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410130231.L7iGIO8b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130231.L7iGIO8b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace.c:2547:6: error: call to undeclared function 'tif_test_bit'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           if (tif_test_bit(TIF_NEED_RESCHED_LAZY))
               ^
   kernel/trace/trace.c:2547:19: error: use of undeclared identifier 'TIF_NEED_RESCHED_LAZY'
           if (tif_test_bit(TIF_NEED_RESCHED_LAZY))
                            ^
   2 errors generated.


vim +/tif_test_bit +2547 kernel/trace/trace.c

  2526	
  2527	unsigned int tracing_gen_ctx_irq_test(unsigned int irqs_status)
  2528	{
  2529		unsigned int trace_flags = irqs_status;
  2530		unsigned int pc;
  2531	
  2532		pc = preempt_count();
  2533	
  2534		if (pc & NMI_MASK)
  2535			trace_flags |= TRACE_FLAG_NMI;
  2536		if (pc & HARDIRQ_MASK)
  2537			trace_flags |= TRACE_FLAG_HARDIRQ;
  2538		if (in_serving_softirq())
  2539			trace_flags |= TRACE_FLAG_SOFTIRQ;
  2540		if (softirq_count() >> (SOFTIRQ_SHIFT + 1))
  2541			trace_flags |= TRACE_FLAG_BH_OFF;
  2542	
  2543		if (tif_need_resched())
  2544			trace_flags |= TRACE_FLAG_NEED_RESCHED;
  2545		if (test_preempt_need_resched())
  2546			trace_flags |= TRACE_FLAG_PREEMPT_RESCHED;
> 2547		if (tif_test_bit(TIF_NEED_RESCHED_LAZY))
  2548			trace_flags |= TRACE_FLAG_NEED_RESCHED_LAZY;
  2549		return (trace_flags << 16) | (min_t(unsigned int, pc & 0xff, 0xf)) |
  2550			(min_t(unsigned int, migration_disable_value(), 0xf)) << 4;
  2551	}
  2552	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
