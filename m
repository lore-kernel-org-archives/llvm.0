Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F993D8909;
	Thu,  6 Aug 2026 07:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786002062; cv=none; b=mO2QMGSs2mp8534W1cG771NGCQPOD2MfA9nvY12CYcNE58nGB+I7tfuEANRLuR9zzkfPdKOxMEnUu96Xe5LZUFyTbNiNziA9xpbPlZG3A+THvxAc3g2rFFlciVnx3HFTyCTWGxTIH8hKuok29fEiZRt6s5aTT9pc7xUSwjik7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786002062; c=relaxed/simple;
	bh=26sRbijV9paDzDIV8YKj7kZLRFLTzodiCZrBbgGLG0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rV7eKNeorCfFGFt7MtNq9LlIaDm0R5SWjYnmjC2m/4pOI4f/42zgMYpGuCRCpZcJgTIgJ2vvMYOiUcvIyCeXFV/XDPkk2eYycRE2wTwJimu9QB+OAZ/iHlWmhazudJmfce/Vn+h1K5kCXCw3F90YZxOhMcrR26dQjss4xzAHIoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nM1OufNX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nM1OufNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786002061; x=1817538061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26sRbijV9paDzDIV8YKj7kZLRFLTzodiCZrBbgGLG0M=;
  b=nM1OufNX3hGKQD1Kb51VF16PVTYnnNslTKz73prP2o2SK5IPBJTDvl2T
   nmnZv21M2xgyMuI0pcXUvYm72RVlLbrfya+vHOHNH2qO1Q7gYUET/TrlS
   pqMEUZGs+j7Td+EQbGaVJ8jZRwrRrQBJ/4zeTHYys8rFpmh6MY5WamBAZ
   FYPf5TjHSveZdyzVpgKRdmZJZ6G4PN+Hxx4bdBYFykZhjt4nBM/WzJUjA
   NzySuvx+aQu/QxpmvGFTrbTSheJpLQpobGlSgv/TqUe7KQEXew9Nk06Nw
   xsvg2UfTK4gcIhgwrk+hGvshzq+BgsZ33oO9U8n32TnK0QuZhx8ZkClsb
   A==;
X-CSE-ConnectionGUID: SFAq+lgnT5q3fpyQgjUWGw==
X-CSE-MsgGUID: DzaLIshZT/eqwVlmxxcDTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86703137"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86703137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:40:59 -0700
X-CSE-ConnectionGUID: a2KZJx+1Sxe6hYC2y3y2kA==
X-CSE-MsgGUID: myCP7HSGQ6eMPmotnXREMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="260265075"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 Aug 2026 00:40:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrsik-00000000EWj-1D9B;
	Thu, 06 Aug 2026 07:40:54 +0000
Date: Thu, 6 Aug 2026 15:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Willi <martin@strongswan.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: x86/chacha: Add a 16-block AVX-512 variant
Message-ID: <202608061529.D3FMYdiE-lkp@intel.com>
References: <20260722153247.630519-1-martin@strongswan.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722153247.630519-1-martin@strongswan.org>

Hi Martin,

kernel test robot noticed the following build errors:

[auto build test ERROR on linux-review/Eric-Biggers/x86-fpu-Check-for-missing-AVX-and-AVX-512-xstate-bits/20260626-124221]

url:    https://github.com/intel-lab-lkp/linux/commits/Martin-Willi/lib-crypto-x86-chacha-Add-a-16-block-AVX-512-variant/20260805-221950
base:   https://github.com/intel-lab-lkp/linux Eric-Biggers/x86-fpu-Check-for-missing-AVX-and-AVX-512-xstate-bits/20260626-124221
patch link:    https://lore.kernel.org/r/20260722153247.630519-1-martin%40strongswan.org
patch subject: [PATCH] lib/crypto: x86/chacha: Add a 16-block AVX-512 variant
config: x86_64-randconfig-075-20260806 (https://download.01.org/0day-ci/archive/20260806/202608061529.D3FMYdiE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061529.D3FMYdiE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608061529.D3FMYdiE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/crypto/chacha.c:35:
>> lib/crypto/x86/chacha.h:199:8: error: call to undeclared function 'cpu_has_xfeatures'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     199 |                             cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL))
         |                             ^
   1 error generated.


vim +/cpu_has_xfeatures +199 lib/crypto/x86/chacha.h

   180	
   181	#define chacha_mod_init_arch chacha_mod_init_arch
   182	static void chacha_mod_init_arch(void)
   183	{
   184		if (!boot_cpu_has(X86_FEATURE_SSSE3))
   185			return;
   186	
   187		static_branch_enable(&chacha_use_simd);
   188	
   189		if (boot_cpu_has(X86_FEATURE_AVX) &&
   190		    boot_cpu_has(X86_FEATURE_AVX2)) {
   191			static_branch_enable(&chacha_use_avx2);
   192	
   193			if (boot_cpu_has(X86_FEATURE_AVX512VL) &&
   194			    boot_cpu_has(X86_FEATURE_AVX512BW)) { /* kmovq */
   195				static_branch_enable(&chacha_use_avx512vl);
   196	
   197				if (boot_cpu_has(X86_FEATURE_AVX512F) &&
   198				    !boot_cpu_has(X86_FEATURE_PREFER_YMM) &&
 > 199				    cpu_has_xfeatures(XFEATURE_MASK_AVX512, NULL))

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
