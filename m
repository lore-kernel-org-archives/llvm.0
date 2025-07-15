Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED04924678C;
	Tue, 15 Jul 2025 05:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752557659; cv=none; b=kORuulc2sqwbMq83mm2eolm01HCBehX5wWSeaBmmgN65cSEZoY+fh3ROh9qPOR7/VrO4tr0AXuET7h3f0lHLXKmW5MNO2XbmiVP5MeUk/02s6HLanCh8IjONIIYXNt+rfJwcucOKtLhdx7AzidJgpM0BQJO7Z1ZvCE5Fkn7HyfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752557659; c=relaxed/simple;
	bh=aqGFfl1twW0Qc1W6K4xwwVazkug9mWZPNSjbozdTJnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=am44SMmX5ZT2gk8GavdPGjOAFUwHy5uu3fSfIKExWZEPQ2Ej3GojLX0kkaDAPkgTn8wZBQxu2/JMXbvsb6vcMR0UhnSFO3mz27WJuy3xnF3ET8fV3dt4b2hdT7wApXIjb7CitLiNsnBnYe5NAvBAzI74J1PvVCcM3eHfJOek5yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PX/ce8ke; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PX/ce8ke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752557658; x=1784093658;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aqGFfl1twW0Qc1W6K4xwwVazkug9mWZPNSjbozdTJnk=;
  b=PX/ce8ke0pXuR9kWnp5tc/cBOdPyVIZdJjnAvIrByRaOkKzk3OmUYlo/
   yP+7hScGvtGYoxkLDu4AkXvCzBIGKIWY0GuDWmTYaoveZDgoKgZQ/67+j
   O8mgELJGf6B+F6l4gqkdHk7gwsksPOoZUiy9Kl3vnowwVP0RA9s96SN2S
   VRgFDp1qeDMVmqmE67DijpsosLdSx3bgusIkUsWDCV/NWvnuoimtdI4my
   0doWZ2B3OM95dTWy1eWVlwMJl5H7glqVKGZUksIur29yYLnOlTAFnGZC6
   iv2gQFtKs5MFWYuq+FB5GoC4qiV4xS3Spv2MraEs6jn/eNIwIoLcxRZjL
   g==;
X-CSE-ConnectionGUID: d7S0Rfa9QOumxWpVzd6IBA==
X-CSE-MsgGUID: TzD2QqTBQ1u27yGGeRfueg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53985018"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="53985018"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 22:34:16 -0700
X-CSE-ConnectionGUID: u5tl5zjHRs2oXNJrKAwVpQ==
X-CSE-MsgGUID: jLB3xuV4Q/yKpj0Iozv55A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157483592"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jul 2025 22:34:13 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubYIt-0009gZ-1L;
	Tue, 15 Jul 2025 05:34:11 +0000
Date: Tue, 15 Jul 2025 13:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: John Ousterhout <ouster@cs.stanford.edu>, netdev@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, pabeni@redhat.com,
	edumazet@google.com, horms@kernel.org, kuba@kernel.org,
	John Ousterhout <ouster@cs.stanford.edu>
Subject: Re: [PATCH net-next v11 15/15] net: homa: create Makefile and Kconfig
Message-ID: <202507151339.DEc1Vydw-lkp@intel.com>
References: <20250714044448.254-16-ouster@cs.stanford.edu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714044448.254-16-ouster@cs.stanford.edu>

Hi John,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Ousterhout/net-homa-define-user-visible-API-for-Homa/20250714-130009
base:   net-next/main
patch link:    https://lore.kernel.org/r/20250714044448.254-16-ouster%40cs.stanford.edu
patch subject: [PATCH net-next v11 15/15] net: homa: create Makefile and Kconfig
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250715/202507151339.DEc1Vydw-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250715/202507151339.DEc1Vydw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507151339.DEc1Vydw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/homa/homa_incoming.c:5:
   In file included from net/homa/homa_impl.h:13:
   In file included from include/linux/icmp.h:16:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from net/homa/homa_incoming.c:5:
>> net/homa/homa_impl.h:529:9: error: use of undeclared identifier 'cpu_khz'
     529 |         return cpu_khz;
         |                ^
   net/homa/homa_impl.h:546:13: error: use of undeclared identifier 'cpu_khz'
     546 |         tmp = ns * cpu_khz;
         |                    ^
   net/homa/homa_impl.h:565:16: error: use of undeclared identifier 'cpu_khz'
     565 |         tmp = usecs * cpu_khz;
         |                       ^
   1 warning and 3 errors generated.


vim +/cpu_khz +529 net/homa/homa_impl.h

9ce7b7d7321e0e John Ousterhout 2025-07-13  520  
9ce7b7d7321e0e John Ousterhout 2025-07-13  521  /**
9ce7b7d7321e0e John Ousterhout 2025-07-13  522   * homa_clock_khz() - Return the frequency of the values returned by
9ce7b7d7321e0e John Ousterhout 2025-07-13  523   * homa_clock, in units of KHz.
9ce7b7d7321e0e John Ousterhout 2025-07-13  524   * Return: see above.
9ce7b7d7321e0e John Ousterhout 2025-07-13  525   */
9ce7b7d7321e0e John Ousterhout 2025-07-13  526  static inline u64 homa_clock_khz(void)
9ce7b7d7321e0e John Ousterhout 2025-07-13  527  {
9ce7b7d7321e0e John Ousterhout 2025-07-13  528  #ifdef CONFIG_X86_TSC
9ce7b7d7321e0e John Ousterhout 2025-07-13 @529  	return cpu_khz;
9ce7b7d7321e0e John Ousterhout 2025-07-13  530  #else
9ce7b7d7321e0e John Ousterhout 2025-07-13  531  	return 1000000;
9ce7b7d7321e0e John Ousterhout 2025-07-13  532  #endif /* CONFIG_X86_TSC */
9ce7b7d7321e0e John Ousterhout 2025-07-13  533  }
9ce7b7d7321e0e John Ousterhout 2025-07-13  534  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
