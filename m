Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0273C242925;
	Tue, 23 Jun 2026 05:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782191729; cv=none; b=GEVW0mkf/oD76l8bLX40/5oSlQJn5z5FOb34+B57u5r2hAQk2GD1HHKL/hdoYW5ylGiYumsPho46YSzXrAQGTh6Fy8desVAISlHxR5n5F8kBmRmSL9Isgj4iDOAw33GyfWrBC+WWoI3mmrpSLg8941nhHRaCFCLpw5X6EZN8z3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782191729; c=relaxed/simple;
	bh=DBVY4rtdgFt9pbUbu9crhWXyKHYAvYMZ9q8ViUqCCis=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mJKfjOrIXbiMduvx8xv2XhVJnnsT+NJfTGPTeWHPIdoPde+jFjSlU65pvSgt3BqPLms8YWxATDcrxbQ/Jyn7qHgA8EG5Cog0+HoSSLJH+Beoos6TVjNEJjGUBaUXqoLW/vmWLtdfvPdffDDWkgJHRPocxWM0bKxZJCfuukLcYBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXLRf4fz; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXLRf4fz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782191728; x=1813727728;
  h=date:from:to:cc:subject:message-id;
  bh=DBVY4rtdgFt9pbUbu9crhWXyKHYAvYMZ9q8ViUqCCis=;
  b=GXLRf4fzMeLegodumT66t436C46zFDiN8UatIjxh1u1oDnTn9hyj3cK9
   YVCqfBfcZuXV2TG1F7kg6krCvllAXzBdtGHqDD3hFIEgg27c8kwyQeZtb
   XQ00mi2lIteX8AliVagCtIExpuA1e/cf97WiwzmhDEfZV7ce8CD7ygBco
   umAYoiNcueSpmbucBHoTbnWmgbRrtr1RZl+NY5fxBdKFAqlhujLLn7qha
   Fmfzkvt8dGpUT3qOmZo3Rtuh0Kv+JIJ3Na5htUJOetNk9PIBXNyTZlj1N
   JPrgzvGbV6mIDOJH8RmqZ3vsbaJytMJgNM9fa6c1TYxm+zp4LmFUKy6tK
   g==;
X-CSE-ConnectionGUID: NL8NA1C6SgiKSu6ejthBpA==
X-CSE-MsgGUID: bDugBqMGRK6UUkQhALFJpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="94423174"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="94423174"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 22:15:27 -0700
X-CSE-ConnectionGUID: uBipYW56R9uvpX3yxLwV0g==
X-CSE-MsgGUID: vxoKY/JJSViuTvdBxKshLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="254503796"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2026 22:15:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbtTm-000000002Gd-455R;
	Tue, 23 Jun 2026 05:15:23 +0000
Date: Tue, 23 Jun 2026 13:14:45 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/arm-generic-irq-entry-v7.1 2/2] ld.lld:
 error: undefined symbol: irqentry_enter
Message-ID: <202606231306.22gK8shO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm-generic-irq-entry-v7.1
head:   0bd2187d3034fc3ac85a5aec7924ad05c308ef41
commit: 0bd2187d3034fc3ac85a5aec7924ad05c308ef41 [2/2] ARM: entry: Convert IRQ handling to generic IRQ entry
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260623/202606231306.22gK8shO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231306.22gK8shO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231306.22gK8shO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: irqentry_enter
   >>> referenced by entry.c
   >>>               arch/arm/kernel/entry.o:(arm_irq_handler) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: irqentry_exit
   >>> referenced by entry.c
   >>>               arch/arm/kernel/entry.o:(arm_irq_handler) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: irqentry_nmi_enter
   >>> referenced by entry.c
   >>>               arch/arm/kernel/entry.o:(arm_fiq_handler) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: irqentry_nmi_exit
   >>> referenced by entry.c
   >>>               arch/arm/kernel/entry.o:(arm_fiq_handler) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
