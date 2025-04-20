Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3DB29D0E;
	Sun, 20 Apr 2025 13:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745154768; cv=none; b=fwQXXRz3Sj//ZzT/zodxDOqhj2boBt7Z5vLpKappY0ltSNnQuJ4sA32AM2kxEgqT72e33XFMxY6CZ+SeAMtHWK+9qpz7P1ofwyDKyhtWJ7c7jbb2ndUPSmTL72h7OsPYm9qnsNvnICo6R0ZgIcvwrZBvnS+Y2dBZBOoCA6mDR00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745154768; c=relaxed/simple;
	bh=G6pQpwnI/eYeqmJ5FQQDRAqA0ueV0xwN1jnW78gamQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AP1oi+4PP5pupvGpVfw1nDhhEj0xyHLdgfcRAv73Cq9HCNkPtuGFWi7h9uJKB3YLY5MZvwH1n8lEV/09kaYVo54KLdjQXZK93ajxfKGPAkKS85mS2dZMfn1BdlndSSkP2JW24eov9u41MUkAPJUqJzEvRI5dm6sbZr4HTARLvA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ay1odalw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ay1odalw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745154766; x=1776690766;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G6pQpwnI/eYeqmJ5FQQDRAqA0ueV0xwN1jnW78gamQU=;
  b=ay1odalwgyy7DqbR7ZcDKwinDejU8/lervjwwVVz7ya4vs3opNLkBOLQ
   ta9jwDKQ785ubKcINFGjU58MkCMVOTguzST7YNc+AmKjgjKohpUw6YNpL
   Wau3FyBi7D5/3Gw4cQXt0SRFZZjjL/l5OWzYKV3T+4vr7faZ7GukVTwQW
   gXjMY1YsjfUe81oodWfkgQYfg3aadzucPSRYu7+JRxIrnqKe0lEoHsYN+
   NAu6cVN/XunWyyaSq+nzO2hwB/XZ2Ld/2klyqsyiJcghtkc7UOyS9rr93
   jY74S+dTpSmNc1OqIKLh2zHElibq7cRnQaxn8l0rxINYe0NBaM1DqlVdl
   Q==;
X-CSE-ConnectionGUID: apoxqCxETM+xLWvsiA+8tA==
X-CSE-MsgGUID: joSJ/qZLRrq4zceRxpkQAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="49373724"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="49373724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 06:12:45 -0700
X-CSE-ConnectionGUID: bsl6xqr0TJSaTna/3USf1A==
X-CSE-MsgGUID: Etvv+ilTRxaX5407nn7NRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="136603687"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Apr 2025 06:12:44 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6UTS-0004eb-0T;
	Sun, 20 Apr 2025 13:12:42 +0000
Date: Sun, 20 Apr 2025 21:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Raj Sahu <rjsu26@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next 4/4] bpf: Runtime part of fast-path termination
 approach
Message-ID: <202504202052.82sne6fn-lkp@intel.com>
References: <20250420105524.2115690-5-rjsu26@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420105524.2115690-5-rjsu26@gmail.com>

Hi Raj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Raj-Sahu/bpf-Introduce-new-structs-and-struct-fields/20250420-185825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250420105524.2115690-5-rjsu26%40gmail.com
patch subject: [RFC bpf-next 4/4] bpf: Runtime part of fast-path termination approach
config: x86_64-buildonly-randconfig-001-20250420 (https://download.01.org/0day-ci/archive/20250420/202504202052.82sne6fn-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504202052.82sne6fn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504202052.82sne6fn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/xen/smp.c:256:38: error: too few arguments to function call, single argument 'regs' was not specified
     256 |         generic_smp_call_function_interrupt();
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/smp.h:176:6: note: 'generic_smp_call_function_single_interrupt' declared here
     176 | void generic_smp_call_function_single_interrupt(struct pt_regs *regs);
         |      ^                                          ~~~~~~~~~~~~~~~~~~~~
   arch/x86/xen/smp.c:264:45: error: too few arguments to function call, single argument 'regs' was not specified
     264 |         generic_smp_call_function_single_interrupt();
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   include/linux/smp.h:176:6: note: 'generic_smp_call_function_single_interrupt' declared here
     176 | void generic_smp_call_function_single_interrupt(struct pt_regs *regs);
         |      ^                                          ~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/regs +256 arch/x86/xen/smp.c

f447d56d36af18 arch/x86/xen/smp.c  Ben Guthro          2012-04-21  253  
3b16cf87486143 arch/x86/xen/smp.c  Jens Axboe          2008-06-26  254  static irqreturn_t xen_call_function_interrupt(int irq, void *dev_id)
3b16cf87486143 arch/x86/xen/smp.c  Jens Axboe          2008-06-26  255  {
3b16cf87486143 arch/x86/xen/smp.c  Jens Axboe          2008-06-26 @256  	generic_smp_call_function_interrupt();
1b437c8c73a36d arch/x86/xen/smp.c  Brian Gerst         2009-01-19  257  	inc_irq_stat(irq_call_count);
f87e4cac4f4e94 arch/i386/xen/smp.c Jeremy Fitzhardinge 2007-07-17  258  
3b16cf87486143 arch/x86/xen/smp.c  Jens Axboe          2008-06-26  259  	return IRQ_HANDLED;
3b16cf87486143 arch/x86/xen/smp.c  Jens Axboe          2008-06-26  260  }
f87e4cac4f4e94 arch/i386/xen/smp.c Jeremy Fitzhardinge 2007-07-17  261  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
