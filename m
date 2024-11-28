Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2847433B1;
	Thu, 28 Nov 2024 03:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732764296; cv=none; b=V31hmalEojpECbzgziTayK/mlzrXqf+gmYED9CD8Z54HHeFXyQHthOsH5uNgv4kQv3Q1XLkiIPL6lyEWKd1kXDS2LHQqu8dgRpCWmB+apKbsqgTRz6J5tJbdXeDE5+fBtkf18QSLAjx/pvbVLdNeA03vCAK7NlVGwRvmqA/l5lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732764296; c=relaxed/simple;
	bh=wAAN8BxNrRJBe1JsQW/bYHN8HtceBvnuQWq8/AjJSNA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AMM524rdbKTPVJxCtv/gBk8vZi7tHstOKvHwXu67MkU2eHBgDjREpI1rvRuNIICdmF/1UOg33TOtkbw42m8Qoaf4CdAcixu3G3suvUy3HAH3I6r1GHArGgnTOD3vZcP+yxMqtolmWJCaJfV8fa3b1n99uKHEQSnrWcE06guZHmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDUCjEC7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDUCjEC7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732764295; x=1764300295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wAAN8BxNrRJBe1JsQW/bYHN8HtceBvnuQWq8/AjJSNA=;
  b=iDUCjEC7zNPcuTXRXLqNkwS1M1M6K9ALj3FB9eErBnI+FvvPoFHcVLv5
   bwgNL0W+Z2P5wUoe/r1VljLMVzufy2+t8qd3rHdsrqEAGloM1aCOje0WF
   51kp1Nf/sZ1AfTMI96gLX9E/ksLRYSG3C9Zozdlf1dmISU5znGWuiw/je
   2fr4V35LW5nnZcNoOic/off76WtolAc3MYseGwN+hhb1P67rpadFaCVGf
   0jfuFrP1bjrl2nZTAv86eQrnIL7OWGrpW4IjpeDuW2mfKnjEyTawvArms
   RE/RnNQox75h/lHq+Y4BaV78oKVNBUj5Ca3KeR5wsz8+iLqpbnqOq+Feq
   g==;
X-CSE-ConnectionGUID: REAIS/pBTLGhqleqvgHPrQ==
X-CSE-MsgGUID: FVELttAzR863j9R9GSd2Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="20578985"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="20578985"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 19:24:54 -0800
X-CSE-ConnectionGUID: WuQzFirpQlCmoxz9JSsBlA==
X-CSE-MsgGUID: tVbqgdCkSdqkJTE+dqPUbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="123075994"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2024 19:24:53 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGV98-0008rI-36;
	Thu, 28 Nov 2024 03:24:51 +0000
Date: Thu, 28 Nov 2024 11:24:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_9 8/12] ld.lld: error: undefined
 symbol: arch_uprobe_optimize
Message-ID: <202411281133.hUQjQURJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_9
head:   b1d916ea335d828e290e0c2bb8bb5bebdf0b633a
commit: 2d5c7f0b55e1e8dd7535e47d2d034a0b2cf7f05a [8/12] uprobes/x86: Add support to optimize uprobes
config: mips-gpr_defconfig (https://download.01.org/0day-ci/archive/20241128/202411281133.hUQjQURJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281133.hUQjQURJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281133.hUQjQURJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: arch_uprobe_optimize
   >>> referenced by uprobes.c
   >>>               kernel/events/uprobes.o:(uprobe_notify_resume) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
