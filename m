Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC6E31771A;
	Mon, 18 Aug 2025 00:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755476376; cv=none; b=LSEKEXypRvKCbx7ZCssWcBjL53B9DsQuIOCEb/Kj4kH4hkLy9WZA1HeNXw9LYnRusC2nAGq2RRpH2OeSK8sbCLL/29/yPG6VNtxOJlfeSwgX9ieIw3BQTZeo5ZW6VRYXFPEgJXx+7FrDoHDy6vBeeOLbMt8nMM3tnyTx39oYeNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755476376; c=relaxed/simple;
	bh=83rJbmkWHlltFQobxj1m2TPks+8LTgXOs4+Zmgc5ufg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AynhwNrGy8rSynw4lVCGHAG91KYt5bLx2aUm8S4BVQ/bWpyL7G737PitLiz85zaeQRa5GHtE3plAVSHcRq56uG6c4lklLTcIcWa8TZWh4puk/5gOM5J8nkWu1VQL978KkJTEqq7R84BHh6BUudgbYIH7RtVWQQJn42slGdUjpwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NEwTV8JJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NEwTV8JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755476375; x=1787012375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83rJbmkWHlltFQobxj1m2TPks+8LTgXOs4+Zmgc5ufg=;
  b=NEwTV8JJJc68vuMX5OYYKXjwKJt7RQoCShc8RNs1KNGGF5gsOiSVit3z
   AthQRaicX0Qh6vdKxvaDV2KjSWeu23DJLisxnJFB21+ccoqh4euOPv1lz
   cxSl8G1rl2LM69OrRvavO+IXIw/QZW524VSx2GN1kjuBEUeiWwEHCQfYJ
   C4iqdA42H1ZgewsreK0zN2+STCeKeLZ/bbJew8R+Z/EBi3kaxJnejqo1A
   h3Xzv606QapBCfx2xKK/zEls39I6HGkQBPqqIJSoSyfO9oh/7lSSrQWTo
   OjlzjZBK9eHTfSl+3k7YPEP3pZ81vy3F/+0H2/YloD48GQ2km3IKnnNVy
   w==;
X-CSE-ConnectionGUID: jCSC8igHS3qo/2FmmmlskQ==
X-CSE-MsgGUID: P/Z6xsk3TVyFPapQ6lat+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="69066839"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="69066839"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 17:19:34 -0700
X-CSE-ConnectionGUID: oM/SA+qVRlC6yJvk2xOtVQ==
X-CSE-MsgGUID: t+yXS2G7Q3OgZCh2tEIL6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="198297622"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 17 Aug 2025 17:19:33 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unnb1-0000zr-0I;
	Mon, 18 Aug 2025 00:19:31 +0000
Date: Mon, 18 Aug 2025 02:19:25 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:rseq/wip 22/22] kernel/rseq.c:209:2: error: call to
 undeclared function 'trace_rseq_exit_to_user'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202508180201.8e33QEIl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/wip
head:   302da1e6bb83bae8c47388b029ed29811455ddec
commit: 302da1e6bb83bae8c47388b029ed29811455ddec [22/22] rewrite
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250818/202508180201.8e33QEIl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180201.8e33QEIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180201.8e33QEIl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rseq.c:209:2: error: call to undeclared function 'trace_rseq_exit_to_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     209 |         trace_rseq_exit_to_user(current);
         |         ^
   kernel/rseq.c:209:2: note: did you mean 'trace_seq_to_user'?
   include/linux/trace_seq.h:94:12: note: 'trace_seq_to_user' declared here
      94 | extern int trace_seq_to_user(struct trace_seq *s, char __user *ubuf,
         |            ^
   1 error generated.


vim +/trace_rseq_exit_to_user +209 kernel/rseq.c

   204	
   205	void __rseq_handle_slowpath(struct pt_regs *regs)
   206	{
   207		rseq_stat_inc(rseq_stats.slowp);
   208	
 > 209		trace_rseq_exit_to_user(current);
   210	
   211		// FIXME: Do something sensible here
   212		if (WARN_ON_ONCE(!regs))
   213			return;
   214	
   215		/*
   216		 * If fatal is true, then the fastpath found invalid data. No point
   217		 * in trying again and wasting cycles to get to the same
   218		 * conclusion.
   219		 */
   220		if (!current->rseq_event.fatal)
   221			rseq_slowpath_update_usr(regs, 0);
   222		else
   223			force_sig(SIGSEGV);
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
