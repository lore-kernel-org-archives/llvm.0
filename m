Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A475405C29;
	Wed, 10 Jun 2026 11:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092536; cv=none; b=IfPWtdLZslSrNjlgXKHD6QTvAOkWxKTOX9TSdllN7EZmvy8NghaeOX2czhLFqTMQ++LxRllLdCcFM3EY6SDcThTXEIGIvRWESRPclJj7OvKKv1+ToXtAf43nqj1XWjW4mk1xq7tfLovUZ/5QDRTGqpw6mf9wzLKLLw/vwL02hMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092536; c=relaxed/simple;
	bh=xtzT7v0gcjlT2gyF9Un/TSiZ6wHv9JsFgunszaCrd/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VbU24DBcnYp1GBPIC0zhKbeZ60cadFAaesJSODYMKHR1y/w5t1JO+HDHsLTJQOaEZXNbnGqhc160I8HTG8sIPBap10E/gQDDJcvZJ2QJ3/st16yVVZxfHPAyp8FJ3n90dwRdekQI9+E8yk76uxEySiVl+maqRpHh5slONOYcIZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bjakv7+i; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bjakv7+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781092535; x=1812628535;
  h=date:from:to:cc:subject:message-id;
  bh=xtzT7v0gcjlT2gyF9Un/TSiZ6wHv9JsFgunszaCrd/w=;
  b=Bjakv7+i5TMgZuhkL42gewmqfKjOH1bP9fDG/RgFeFLqOlQjDyhkkZN/
   bbi/1XUqmDtoykKukPFqKGu1dQSM26eM1lqhumiMU4gCyoJ/eDIAQuiGw
   hrXjMISQqErKH/yrJu/o83FxSWC5oFhXjSG3kbzwRmiZ1xQIkAOMbtx3g
   7fH4d367C83b8e3sJNrAfTDeHPJRKOyUCY3VDZ4t9wKT5bpIkzdbPq/On
   F/c2KuzJt9snW1TGMKlw4I8OW+T0djyjkJR75NzXMKalTwUG0umoq77Bk
   nJf9b16aKy5xR99ihUDicKtiouYDoccuyDSW2AmphjS4FxdT6ojD4foZe
   Q==;
X-CSE-ConnectionGUID: pVVbvPeyQDCbgtzVAHJrzw==
X-CSE-MsgGUID: g8Tw2nm4TP6941fERnCgmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99459745"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="99459745"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:55:35 -0700
X-CSE-ConnectionGUID: RsOqyqxZROS6Kd2+vvpb4Q==
X-CSE-MsgGUID: fzCi++dpT1SP+GjQ/UYoWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269829431"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jun 2026 04:55:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXHWt-000000003ft-0pXU;
	Wed, 10 Jun 2026 11:55:31 +0000
Date: Wed, 10 Jun 2026 13:55:05 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/kvmclock_vs_tsc 10/51]
 arch/x86/coco/tdx/tdx.c:1210:61: error: expected ';' after return statement
Message-ID: <202606101300.8YBNIMhl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/kvmclock_vs_tsc
head:   03e00f8b41e58b5dd5ceef21940a62e5d8e08766
commit: 744956b9c18116e3ae2e098633a6a5ee1e144591 [10/51] x86/tdx: Force TSC frequency with CPUID-based info provided by the TDX-Module
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260610/202606101300.8YBNIMhl-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260610/202606101300.8YBNIMhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606101300.8YBNIMhl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/coco/tdx/tdx.c:1210:61: error: expected ';' after return statement
    1210 |         return info.crystal_khz * info.numerator / info.denominator
         |                                                                    ^
         |                                                                    ;
   1 error generated.


vim +1210 arch/x86/coco/tdx/tdx.c

  1196	
  1197	unsigned int __init tdx_tsc_init(void)
  1198	{
  1199		struct cpuid_tsc_info info;
  1200	
  1201		if (WARN_ON_ONCE(cpuid_get_tsc_info(&info) || !info.crystal_khz))
  1202			return 0;
  1203	
  1204		apic_set_timer_period_khz(info.crystal_khz, "TDX-Module via CPUID");
  1205	
  1206		/* TSC is the only reliable clock in TDX guest */
  1207		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
  1208		setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
  1209	
> 1210		return info.crystal_khz * info.numerator / info.denominator

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
