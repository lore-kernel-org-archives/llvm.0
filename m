Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685641DE4E0;
	Thu, 22 Jan 2026 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769065002; cv=none; b=WmZkF6m2gNctm2tUnUj3SUMWhrA4hoeeqFvEKxt1u/TJI8ocUysHL1svQzkovSI8U8GiAn/2uAS7WWV6GqAnT602tMECoWo2Eie2JNvcBjrEAFcd6cnDtLnPSb1Hk1SbEqoZha4j2q0ihvnSd+vEWzOfrrebFrgXbDSZ8dya890=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769065002; c=relaxed/simple;
	bh=qRkuzxK9kptM3W7AYWE/CJDBGoVYY4BNW8HQvhxKnNg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i1+YzMxn2+KjDXIvqYjygZpCb1diqv+HQUWrjnPiayCie4hHUB84OdgQwui89dC/Df7hiwCKpewAwUDouM793+N5Mf8g1e6KbrFs+YEINtnYguRHR2MocC9sgC5tZnCl49NnM4ajnF70SCspkuKLb9apFkutG3Lg09cfE8Dm6tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJ/o0Yzw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJ/o0Yzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769064999; x=1800600999;
  h=date:from:to:cc:subject:message-id;
  bh=qRkuzxK9kptM3W7AYWE/CJDBGoVYY4BNW8HQvhxKnNg=;
  b=OJ/o0YzwIa54oh9TNjgRZVUW3CKkjWacLXKygHyjOr1N8F9IQUtk5EY0
   Y3RinMZVK1ozFYY0Pcq0VTqSJaaueI0+xZTNDrcNvpz9J4b8Cvr3Ql/rS
   Sr8/Ujit0PYZgmHjQ6ZSbwe/xgxInNapiRJryMLaiQGqajCgDZuaK3z6M
   LcFn/YwvMMU94rfOGaYYsEY5YfwqgRywTh2k+2iCQvMUg759tT25Wtzj6
   LvumTTJLEvXEeUoSx211JkZllgUxYsmdeUAVAfP1rlJROJM/D+C3k6AnS
   RHSEnA3k88jEo4Px1nSLv5C8LUhPiQ12KzODUnsQRRsTQpQ7KitcYqdYU
   w==;
X-CSE-ConnectionGUID: QT04NDw5Tf6LWLkqturMzg==
X-CSE-MsgGUID: 0smyn5E3QYqn6UdHUEOEYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="87715842"
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="87715842"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 22:56:34 -0800
X-CSE-ConnectionGUID: xP4P0hqPSJmEHSR22aFI+A==
X-CSE-MsgGUID: cfpDChZgRsCCPjQsoywfsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,245,1763452800"; 
   d="scan'208";a="237324607"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Jan 2026 22:56:33 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viocI-000000000Rh-2X6y;
	Thu, 22 Jan 2026 06:56:30 +0000
Date: Thu, 22 Jan 2026 07:56:01 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/tdx_huge_sept 51/79] Warning:
 arch/x86/kvm/mmu/tdp_mmu.c:543 function parameter 'sptep' not described in
 'handle_changed_spte'
Message-ID: <202601220730.PSncZ6G3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   491d01f5d2ac33f4da9d302ff18cdcb57c0d967b
commit: af111245b7f1b0948e7677d96ff459953fdfc7ac [51/79] KVM: x86/mmu: Plumb the SPTE _pointer_ into the TDP MMU's handle_changed_spte()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260122/202601220730.PSncZ6G3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220730.PSncZ6G3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601220730.PSncZ6G3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/x86/kvm/mmu/tdp_mmu.c:543 function parameter 'sptep' not described in 'handle_changed_spte'
>> Warning: arch/x86/kvm/mmu/tdp_mmu.c:543 function parameter 'sptep' not described in 'handle_changed_spte'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
