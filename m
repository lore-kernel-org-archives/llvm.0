Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81F1353A95;
	Mon, 19 Oct 2026 01:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792374910; cv=none; b=hWS89XONQ1MZwo8tAX8OFucQtELuFM2YG+PWJpkYSSm7yshNrvSmDMH56saAErrToaqdp1u5qbEZyMBQEqzA90i1oJapNA7l8I8WwZnl1MBPhWHvvsP3Z/kkYM5cwlam5gw60QRYy7knk+HMgfLFP9TNBWBFKc4hdnGd8gMnkAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792374910; c=relaxed/simple;
	bh=sMxWcf0L19h9N8L078L++PD02bpRNY9qwEwMzR7Hf2U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OXyBwXbQEwpUaU0Pcyc9xDg7uj+TctTHUSbODSzE3QeYGRTrPs0/YxiGjjelltMjFlA0sKl1461Yxt13o2YOHO5nfIVFXZzfwM1MfI+bun1f07oShZFlajstTq8NLt4jmkqJ/XCbvQIZsosWwTVHQNezP/bEf7Xy9HFz/bOHipU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IL07RDWW; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IL07RDWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792374905; x=1823910905;
  h=date:from:to:cc:subject:message-id;
  bh=sMxWcf0L19h9N8L078L++PD02bpRNY9qwEwMzR7Hf2U=;
  b=IL07RDWWLB9eR9PZfWOdQnX72XokGZczCk5hNA6j6VhdSdUpvlfgCUgo
   tTMXvGF0wt+PzMisxMI1FY+NOEdQZ0FO2zpwoFNlYIHOMwwrkIZFG561H
   EyHDcC1pL7EsaW5/KlTGWBl5MFU0w7qTUaHMAetY5kknQdXmqUw2yjlGS
   CoIm8Ns8a+WCI5fYLfNk7amHYC7LswqhIDpQJ+EP/5ZpOZhPyEA/0CUtp
   Ozhfx0fWPqVWVfqPMqZnXSEyJXDkKOLJCkyDO03n7/Jfl5Bfinv7NRNmg
   o79EeGsWkywcyJgmUmzYWH+A9VimL0lYEmUoFMKsQuWlVsKR9wZH4Buma
   g==;
X-CSE-ConnectionGUID: 5QKDkBxASbOaCs0hQx5q3g==
X-CSE-MsgGUID: wfAuXuc5T0ylr74kuT3VUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="951059"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="951059"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 18:55:04 -0700
X-CSE-ConnectionGUID: EPgMRfzzRjyJdpT6iWQexQ==
X-CSE-MsgGUID: 5cdDR7joQAWXIdSEOus1PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="4164066"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Oct 2026 18:55:02 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIcaX-00000000L5G-39Qt;
	Mon, 19 Oct 2026 01:54:57 +0000
Date: Mon, 19 Oct 2026 09:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:core/hotplug 45/49]
 kernel/irq_work.c:184:44: warning: omitting the parameter name in a function
 definition is a C2x extension
Message-ID: <202610190938.5WOoEaLk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git core/hotplug
head:   6cbb08c40db1f93e15aaef964883729494f3a478
commit: 8b3cdb229529280585c5ac39daa446e735bce900 [45/49] irq_work: Introduce irq_work_kick_cpu()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20261019/202610190938.5WOoEaLk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261019/202610190938.5WOoEaLk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610190938.5WOoEaLk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq_work.c:184:44: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
     184 | static void irq_work_kick(struct irq_work *)
         |                                            ^
   1 warning generated.


vim +184 kernel/irq_work.c

   183	
 > 184	static void irq_work_kick(struct irq_work *)
   185	{
   186		/*
   187		 * Kick the CPU, typically so that it takes action:
   188		 * * On IRQ exit (nohz_full dependency changed and tick must be restarted)
   189		 * * On the idle path so that the next tick is re-evaluated.
   190		 */
   191	}
   192	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
