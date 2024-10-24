Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CD518784C;
	Thu, 24 Oct 2024 21:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729805188; cv=none; b=Gv1pWD8tNL+2qbaglQUlMJ/V+lOI1hn0mWQt1lSikWA1YwctSnCNy7K1qxcxmH8E6xyAaHrALcUf/fMqkJosPNeKmPUUwatjyMomBRPobPhBAc/LOEA7EVV/KMqhS60EJ235hNdhObNZeV3UHNJ8YbbbB6UhDWSa5tZK9dFtDOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729805188; c=relaxed/simple;
	bh=MhOkdN+WsjMLkbKBGQvsy8LS0W2bDQnSdmQKlqpvE7o=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CoBjFUjw1Mho2PJeJxdAHOO8hScbq5vvAB3UyAWhBojaQuRR2aSorid0315dRIpFP00b3/eKTYDH+76XHufP1O1ebBboBgsvP1z1WF1iSfxdZsLbRxag5FbLnEex2x8KQezSBMQZYYo+mYbPt3gTux+1BG4e6w6ukzuPoXnMiQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gTgIN6Wg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gTgIN6Wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729805185; x=1761341185;
  h=date:from:cc:subject:message-id:mime-version;
  bh=MhOkdN+WsjMLkbKBGQvsy8LS0W2bDQnSdmQKlqpvE7o=;
  b=gTgIN6Wg+TrXE7WzCro9UjnLuMnmjBSmF3PiduGt0ds55Uj2D6tBCGUe
   RHV8VkJ+wJkhxUHbX2biZMzEB7Rm7qH2tbvqIYmza38bnxGs5Rjyze2dB
   nRmTdzGYreFUEHq3FkUfzWKm7sQXd7bRHZMA7Dtb09BZjNs4AqDTmrwuh
   eTeXUvWtz+6R1kAkYaI1SV33Epd4Gan6TlEYVAXI4zz0nTPZEHU8wWjYP
   EGhJuVAt3n1EIYN9wv8YLYPXLu4MDEMtV3O5HOqVjrd8GBkbVqY87DUZM
   +ZFutEZc4ugNd3Nz0ZS6KzTZhBFelwvC5W8dHPh1gn16nJu1epKsuPY0/
   g==;
X-CSE-ConnectionGUID: QHNqXxqSRWShOnLQbcYWxQ==
X-CSE-MsgGUID: TULPW/0eS36NYT2C7ZOynw==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32317868"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="32317868"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 14:26:24 -0700
X-CSE-ConnectionGUID: yCZW0h8tRHKW8gXJ3HLiCA==
X-CSE-MsgGUID: eRWqZz0cTPaYYB9Kg00bRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="80894035"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Oct 2024 14:26:24 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t45LZ-000XAe-0c;
	Thu, 24 Oct 2024 21:26:21 +0000
Date: Fri, 25 Oct 2024 05:26:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly
 requires more registers than available
Message-ID: <202410250537.v3GaLBau-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: Herbert Xu <herbert@gondor.apana.org.au>

Hi Jason,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 07b586fe06625b0b610dc3d3a969c51913d143d4 crypto: x86/curve25519 - replace with formally verified implementation
date:   4 years, 8 months ago
config: x86_64-buildonly-randconfig-004-20241025 (https://download.01.org/0day-ci/archive/20241025/202410250537.v3GaLBau-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250537.v3GaLBau-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250537.v3GaLBau-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/crypto/curve25519-x86_64.c:7:
   In file included from include/crypto/curve25519.h:9:
   In file included from include/crypto/algapi.h:13:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:13:
   In file included from include/linux/mm.h:1289:
   include/linux/vmstat.h:412:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     412 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/x86/crypto/curve25519-x86_64.c:951:6: warning: variable 'carry0' set but not used [-Wunused-but-set-variable]
     951 |         u64 carry0;
         |             ^
   arch/x86/crypto/curve25519-x86_64.c:954:6: warning: variable 'carry' set but not used [-Wunused-but-set-variable]
     954 |         u64 carry;
         |             ^
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
     518 |                 "  movq 0(%1), %%rdx;"                                       /* f[0] */
         |                 ^
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
>> arch/x86/crypto/curve25519-x86_64.c:518:3: error: inline assembly requires more registers than available
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.


vim +518 arch/x86/crypto/curve25519-x86_64.c

   509	
   510	/* Computes the square of a field element: out <- f * f
   511	 * Uses the 8-element buffer tmp for intermediate results */
   512	static inline void fsqr(u64 *out, const u64 *f, u64 *tmp)
   513	{
   514		asm volatile(
   515			/* Compute the raw multiplication: tmp <- f * f */
   516	
   517			/* Step 1: Compute all partial products */
 > 518			"  movq 0(%1), %%rdx;"                                       /* f[0] */
   519			"  mulxq 8(%1), %%r8, %%r14;"      "  xor %%r15, %%r15;"     /* f[1]*f[0] */
   520			"  mulxq 16(%1), %%r9, %%r10;"     "  adcx %%r14, %%r9;"     /* f[2]*f[0] */
   521			"  mulxq 24(%1), %%rax, %%rcx;"    "  adcx %%rax, %%r10;"    /* f[3]*f[0] */
   522			"  movq 24(%1), %%rdx;"                                      /* f[3] */
   523			"  mulxq 8(%1), %%r11, %%r12;"     "  adcx %%rcx, %%r11;"    /* f[1]*f[3] */
   524			"  mulxq 16(%1), %%rax, %%r13;"    "  adcx %%rax, %%r12;"    /* f[2]*f[3] */
   525			"  movq 8(%1), %%rdx;"             "  adcx %%r15, %%r13;"    /* f1 */
   526			"  mulxq 16(%1), %%rax, %%rcx;"    "  mov $0, %%r14;"        /* f[2]*f[1] */
   527	
   528			/* Step 2: Compute two parallel carry chains */
   529			"  xor %%r15, %%r15;"
   530			"  adox %%rax, %%r10;"
   531			"  adcx %%r8, %%r8;"
   532			"  adox %%rcx, %%r11;"
   533			"  adcx %%r9, %%r9;"
   534			"  adox %%r15, %%r12;"
   535			"  adcx %%r10, %%r10;"
   536			"  adox %%r15, %%r13;"
   537			"  adcx %%r11, %%r11;"
   538			"  adox %%r15, %%r14;"
   539			"  adcx %%r12, %%r12;"
   540			"  adcx %%r13, %%r13;"
   541			"  adcx %%r14, %%r14;"
   542	
   543			/* Step 3: Compute intermediate squares */
   544			"  movq 0(%1), %%rdx;"     "  mulx %%rdx, %%rax, %%rcx;"    /* f[0]^2 */
   545			                           "  movq %%rax, 0(%0);"
   546			"  add %%rcx, %%r8;"       "  movq %%r8, 8(%0);"
   547			"  movq 8(%1), %%rdx;"     "  mulx %%rdx, %%rax, %%rcx;"    /* f[1]^2 */
   548			"  adcx %%rax, %%r9;"      "  movq %%r9, 16(%0);"
   549			"  adcx %%rcx, %%r10;"     "  movq %%r10, 24(%0);"
   550			"  movq 16(%1), %%rdx;"    "  mulx %%rdx, %%rax, %%rcx;"    /* f[2]^2 */
   551			"  adcx %%rax, %%r11;"     "  movq %%r11, 32(%0);"
   552			"  adcx %%rcx, %%r12;"     "  movq %%r12, 40(%0);"
   553			"  movq 24(%1), %%rdx;"    "  mulx %%rdx, %%rax, %%rcx;"    /* f[3]^2 */
   554			"  adcx %%rax, %%r13;"     "  movq %%r13, 48(%0);"
   555			"  adcx %%rcx, %%r14;"     "  movq %%r14, 56(%0);"
   556	
   557			/* Line up pointers */
   558			"  mov %0, %1;"
   559			"  mov %2, %0;"
   560	
   561			/* Wrap the result back into the field */
   562	
   563			/* Step 1: Compute dst + carry == tmp_hi * 38 + tmp_lo */
   564			"  mov $38, %%rdx;"
   565			"  mulxq 32(%1), %%r8, %%r13;"
   566			"  xor %%rcx, %%rcx;"
   567			"  adoxq 0(%1), %%r8;"
   568			"  mulxq 40(%1), %%r9, %%r12;"
   569			"  adcx %%r13, %%r9;"
   570			"  adoxq 8(%1), %%r9;"
   571			"  mulxq 48(%1), %%r10, %%r13;"
   572			"  adcx %%r12, %%r10;"
   573			"  adoxq 16(%1), %%r10;"
   574			"  mulxq 56(%1), %%r11, %%rax;"
   575			"  adcx %%r13, %%r11;"
   576			"  adoxq 24(%1), %%r11;"
   577			"  adcx %%rcx, %%rax;"
   578			"  adox %%rcx, %%rax;"
   579			"  imul %%rdx, %%rax;"
   580	
   581			/* Step 2: Fold the carry back into dst */
   582			"  add %%rax, %%r8;"
   583			"  adcx %%rcx, %%r9;"
   584			"  movq %%r9, 8(%0);"
   585			"  adcx %%rcx, %%r10;"
   586			"  movq %%r10, 16(%0);"
   587			"  adcx %%rcx, %%r11;"
   588			"  movq %%r11, 24(%0);"
   589	
   590			/* Step 3: Fold the carry bit back in; guaranteed not to carry at this point */
   591			"  mov $0, %%rax;"
   592			"  cmovc %%rdx, %%rax;"
   593			"  add %%rax, %%r8;"
   594			"  movq %%r8, 0(%0);"
   595		: "+&r" (tmp), "+&r" (f), "+&r" (out)
   596		:
   597		: "%rax", "%rcx", "%rdx", "%r8", "%r9", "%r10", "%r11", "%r12", "%r13", "%r14", "%r15", "memory", "cc"
   598		);
   599	}
   600	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
