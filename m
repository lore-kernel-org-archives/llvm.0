Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99AB34A3C9;
	Fri, 27 Mar 2026 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774652201; cv=none; b=tuDYyCSTVbOH3KgvQ9Ue8hmXeRVCeCDFbZTNuaN2ucj7r6WmXflwS0HgmG71Nm8fNRsic00WXOIHZx3FQ5hblVa3DVWZ3ysB3CZoiD9L45Zu2Ac25wsqnBjBcDhj8acBn24LFFv96YWHJETsNlDsfnJ2L/PjVR8MY/MeIgK72AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774652201; c=relaxed/simple;
	bh=ZaQOAEuN2r0GkGspUPYftxmawi56Uusc3VofKr202GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DzWuEkUHWulgoNMIRC43BaNy4Ms5p2PNtiexp5jKYS/86IPhs1UrYmDprnjFcNfnUyrwVOOCILHV1XriHir7oFAM6DhfMhhVDpO8AtauGIU608Lk3sor04cD1lwel9tR9mDV3vM2T/jcrEWaKEIQ2/4K1Kss7afJ1kn6Vs1uiD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CplebEvM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CplebEvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774652199; x=1806188199;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZaQOAEuN2r0GkGspUPYftxmawi56Uusc3VofKr202GQ=;
  b=CplebEvMT11/2Gi18zrGWOtd58B0okX2qOUssjgcuBNZjXUitFxYwlCb
   di5JZ0kuC0iVYzHtyx5k1yhlaTbZZY387dN3jCRMA211jAIMwSKLXvjy/
   Kb7zo+7l1bwSqP+fM9UxvvosmpEnxzPX1D504+zN5J+e8ujTzdciV3OdM
   XAtJqa4Kdv9Tj4HXP/gpsn6SlihjaRk4Eo5FJK0uozOGlNeZBK5H5Fu6o
   P4gj7bQVhWFiHhTTWYyiBtCkPZ240OqKmVbQlyYDCRX/8H1I4qb7RCg/V
   m6ecIeD4e4utieoOMTuV+cW1Kd00rf20yU6pE6HGoSNscPHAkVkGgwHZA
   w==;
X-CSE-ConnectionGUID: bbMyi+ACTl64EVSXM4u/gw==
X-CSE-MsgGUID: 8Aun5EhwRGuEs/zLNvkA0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86809862"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="86809862"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 15:56:39 -0700
X-CSE-ConnectionGUID: psdjxWYzTbi3zjh9KqRHvw==
X-CSE-MsgGUID: P+OGvBlxTuGMSDHSi/W13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="221049216"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 27 Mar 2026 15:56:34 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6G6R-00000000ArF-1qre;
	Fri, 27 Mar 2026 22:56:31 +0000
Date: Sat, 28 Mar 2026 06:56:02 +0800
From: kernel test robot <lkp@intel.com>
To: "Ahmed S. Darwish" <darwi@linutronix.de>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Christian Ludloff <ludloff@gmail.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: Re: [PATCH v6 86/90] x86/cpu/transmeta: Remove x86_capability[]
 CPUID initialization
Message-ID: <202603280640.96anZ0BA-lkp@intel.com>
References: <20260327021645.555257-87-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327021645.555257-87-darwi@linutronix.de>

Hi Ahmed,

kernel test robot noticed the following build errors:

[auto build test ERROR on c369299895a591d96745d6492d4888259b004a9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Ahmed-S-Darwish/ASoC-Intel-avs-Check-maximum-valid-CPUID-leaf/20260327-215933
base:   c369299895a591d96745d6492d4888259b004a9e
patch link:    https://lore.kernel.org/r/20260327021645.555257-87-darwi%40linutronix.de
patch subject: [PATCH v6 86/90] x86/cpu/transmeta: Remove x86_capability[] CPUID initialization
config: i386-buildonly-randconfig-001-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280640.96anZ0BA-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280640.96anZ0BA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280640.96anZ0BA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/cpu/transmeta.c:70:2: error: call to undeclared function 'early_init_transmeta'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      70 |         early_init_transmeta(c);
         |         ^
   arch/x86/kernel/cpu/transmeta.c:70:2: note: did you mean 'init_transmeta'?
   arch/x86/kernel/cpu/transmeta.c:66:13: note: 'init_transmeta' declared here
      66 | static void init_transmeta(struct cpuinfo_x86 *c)
         |             ^
      67 | {
      68 |         unsigned int cap_mask, uk;
      69 | 
      70 |         early_init_transmeta(c);
         |         ~~~~~~~~~~~~~~~~~~~~
         |         init_transmeta
   1 error generated.


vim +/early_init_transmeta +70 arch/x86/kernel/cpu/transmeta.c

fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  65  
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  66  static void init_transmeta(struct cpuinfo_x86 *c)
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  67  {
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  68  	unsigned int cap_mask, uk;
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  69  
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27 @70  	early_init_transmeta(c);
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  71  	cpu_detect_cache_sizes(c);
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  72  
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  73  	print_cpu_revision(c);
fe8a36b887f719b arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  74  	print_cpu_info_string(c);
^1da177e4c3f415 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  75  
^1da177e4c3f415 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  76  	/* Unhide possibly hidden capability flags */
^1da177e4c3f415 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  77  	rdmsr(0x80860004, cap_mask, uk);
^1da177e4c3f415 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  78  	wrmsr(0x80860004, ~0, uk);
3ad602b4fa9f922 arch/x86/kernel/cpu/transmeta.c  Ahmed S. Darwish 2026-03-27  79  	cpuid_refresh_leaf(c, 0x1);
^1da177e4c3f415 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  80  	wrmsr(0x80860004, cap_mask, uk);
^1da177e4c3f415 arch/i386/kernel/cpu/transmeta.c Linus Torvalds   2005-04-16  81  
30b82ea08c3365a arch/i386/kernel/cpu/transmeta.c H. Peter Anvin   2007-02-13  82  	/* All Transmeta CPUs have a constant TSC */
10cd5a1e5403d79 arch/x86/kernel/cpu/transmeta.c  Ingo Molnar      2008-02-26  83  	set_cpu_cap(c, X86_FEATURE_CONSTANT_TSC);
30b82ea08c3365a arch/i386/kernel/cpu/transmeta.c H. Peter Anvin   2007-02-13  84  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
