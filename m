Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D802FDC37;
	Tue, 27 Jan 2026 03:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769483553; cv=none; b=nJV7qZSucIqqKT+O4QPaWIjGXZ33H2jzTcFGNl0DbS2p3ZLm2flzowin6xrpSz3oTFT/81Adcd9YCMp+5QFbVkBz80AP4EZPfnOyoAqX+fKu2i8NcWAGSg8g5SnGoMsv87vRcjjJFb5nOtmSGYMxfVquz43p3ASqa3rNTP+MGy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769483553; c=relaxed/simple;
	bh=F0xwNB4dWriN1a5K1PHUdXnOCCnIalH6lNe30Gb5pO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph7eZ4kUUNL6Cuv6Q9mF0PwKqLyjLznbpn8e6QJjmQJ5/fdxgbPktrvFSpVHPoaYKcQhltXIa4jahP4iFI2mRpebB6/KinboLTVe39XequDZ7OneYniw7mVSjWkVJGoLdkqWdL6wR6KU5CA9C54T8i2C32KgQlN3asBnmxInLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WByZFiGd; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WByZFiGd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769483552; x=1801019552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F0xwNB4dWriN1a5K1PHUdXnOCCnIalH6lNe30Gb5pO0=;
  b=WByZFiGdSxOHCSFjSSk7lxlYhXoeNAXiXP3BARMDsiocK2wnTK2ucxL8
   Fp4J2PLDcLIAI/Lu6Y3lH3aWfdbRe/C6oYfMArMO6lWVW1dIPJ0fzDuYQ
   497k3EFF9ucBWmwtSz0Sxh9Owi0yH969x/nYFbjxRFQ/8guZyF8Abhupc
   gxkWk6L/I7cG0oXrPa7c5nRgGR2XTslxECeevR+NZaa7ie3F7GOFWoNjV
   hVULzt8D9wfYN6jWWpnmm32h9yeQLZ21ZUvaVloaEW1tYFl9gF6TFbwvF
   1P0XGlU/kNXN1YuknqLJLbgwjdd3Ik9RmKZzqISqKtjYsUOv1UdrXAjie
   w==;
X-CSE-ConnectionGUID: iv3hHmrKQ9Kj8AuZDuHsiw==
X-CSE-MsgGUID: 0sKw2t8iSxWLELsW74ErsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="81388196"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="81388196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 19:12:30 -0800
X-CSE-ConnectionGUID: bnCpPfnHQe+RN4RApbYWBA==
X-CSE-MsgGUID: 0uhEqLevR4q49t/ynCSgNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207910339"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 26 Jan 2026 19:12:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkZVA-00000000XwE-3Y2d;
	Tue, 27 Jan 2026 03:12:24 +0000
Date: Tue, 27 Jan 2026 11:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: Guillaume GONNET <ggonnet.linux@gmail.com>, daniel@iogearbox.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ast@kernel.org,
	bpf@vger.kernel.org, ggonnet.linux@gmail.com,
	john.fastabend@gmail.com, martin.lau@linux.dev
Subject: Re: [PATCH] bpf: fix TCX/netkit detach permissions when prog FD
 isn't given
Message-ID: <202601271136.K6L9UhO2-lkp@intel.com>
References: <20260126173431.19825-1-ggonnet.linux@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126173431.19825-1-ggonnet.linux@gmail.com>

Hi Guillaume,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/net]
[also build test ERROR on bpf/master linus/master v6.19-rc7 next-20260126]
[cannot apply to bpf-next/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guillaume-GONNET/bpf-fix-TCX-netkit-detach-permissions-when-prog-FD-isn-t-given/20260127-013722
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git net
patch link:    https://lore.kernel.org/r/20260126173431.19825-1-ggonnet.linux%40gmail.com
patch subject: [PATCH] bpf: fix TCX/netkit detach permissions when prog FD isn't given
config: powerpc-pcm030_defconfig (https://download.01.org/0day-ci/archive/20260127/202601271136.K6L9UhO2-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601271136.K6L9UhO2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601271136.K6L9UhO2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/dev.c:114:
   In file included from include/net/tcx.h:7:
>> include/linux/bpf_mprog.h:348:10: error: call to undeclared function 'bpf_net_capable'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     348 |                 return bpf_net_capable();
         |                        ^
   include/linux/bpf_mprog.h:348:10: note: did you mean 'sk_net_capable'?
   include/net/sock.h:3024:6: note: 'sk_net_capable' declared here
    3024 | bool sk_net_capable(const struct sock *sk, int cap);
         |      ^
   1 error generated.


vim +/bpf_net_capable +348 include/linux/bpf_mprog.h

   343	
   344	static inline bool bpf_mprog_detach_empty(enum bpf_prog_type type)
   345	{
   346		switch (type) {
   347		case BPF_PROG_TYPE_SCHED_CLS:
 > 348			return bpf_net_capable();

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
