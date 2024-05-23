Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01B412EBDD;
	Thu, 23 May 2024 02:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716431446; cv=none; b=hdZMs4xP2h/PzbD44ZYN22qYj+ABjFfuV7hFlI+ooBPvuuUivf0L51OBYxNdFykPCtO2bde53cOuOxfPXKd096bDYDrjl9auurFUu1kmRxvko6qKO/W386ea8HYGSzCuDZ9d7CwJjcqGAWTlbX3bana7QlXfXVG/VhXjA8xVmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716431446; c=relaxed/simple;
	bh=KMhfPCWS9WOfrmZ3omfh54jv3nLJxbHCXBoxSg/BpeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+AyY5nGYRpJF6ilnnDbOAmg10mR9Jm9Bw+rNWB4uMXkte+7M7QazUSwrX0qvKKUMEHWCPqLTkB8MjynQzGNy7Dnjq1gJLm57mSnrhaHUvDcCTrlLJktZUiK/AAL8vyx5nB8qTldz+DjP1LCYK9VlIMBFSEPQ0tf4Cp+eFa4DN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+SpGmcW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+SpGmcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716431446; x=1747967446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KMhfPCWS9WOfrmZ3omfh54jv3nLJxbHCXBoxSg/BpeQ=;
  b=D+SpGmcW+Gx/hZucsT6vHed7kHiV5mFKsMM8Q1nvxXAPWMJTaxz+is+K
   o7zSE7XzIqedD6jc2lDjjnX4L58mGHmJ/u3NqlmYjdEmV8DoU1Ky0V3le
   qeRwI0WenaWr3J0xwbedCP1YDQcTFHvWUs3I7USNqniazlU3FhVYCDrnN
   K/ldWjG1je2R/rCralxNF0Pr4Do4XLBJbrAJgG27Ojq060mVD9ebfsD60
   WuUL4Qoc1LqVhaH2+dFZM+p7MDwNJLLJ7fBT3zjHzLkFthClE+V35FDCl
   UB6fhNZvA9D5hx09USiwoZgIWKIvGzE2e5FsF+NKguT/hxUDWYKnNeoSk
   A==;
X-CSE-ConnectionGUID: DSYMUFbOQ2mStLPi4iWkNw==
X-CSE-MsgGUID: cYPyQjBBSe6+O6OMgz1kfg==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23290285"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="23290285"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 19:30:42 -0700
X-CSE-ConnectionGUID: Blcx9OcyQDuwcJmrWL212A==
X-CSE-MsgGUID: YWSIMyUCQ9qqd5221Q5zPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="33343599"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 May 2024 19:30:39 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9yE1-0002Lp-2U;
	Thu, 23 May 2024 02:30:37 +0000
Date: Thu, 23 May 2024 10:30:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Chang S. Bae" <chang.seok.bae@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] crypto: x86/aesni - Update aesni_set_key() to return void
Message-ID: <202405231053.XErdDIz3-lkp@intel.com>
References: <20240311213232.128240-1-chang.seok.bae@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311213232.128240-1-chang.seok.bae@intel.com>

Hi Chang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.9]
[cannot apply to herbert-cryptodev-2.6/master herbert-crypto-2.6/master linus/master next-20240523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chang-S-Bae/crypto-x86-aesni-Update-aesni_set_key-to-return-void/20240523-071024
base:   v6.9
patch link:    https://lore.kernel.org/r/20240311213232.128240-1-chang.seok.bae%40intel.com
patch subject: [PATCH] crypto: x86/aesni - Update aesni_set_key() to return void
config: i386-buildonly-randconfig-003-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231053.XErdDIz3-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231053.XErdDIz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231053.XErdDIz3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/aesni-intel_glue.c:240:6: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     240 |         if (!crypto_simd_usable())
         |             ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/crypto/aesni-intel_glue.c:248:9: note: uninitialized use occurs here
     248 |         return err;
         |                ^~~
   arch/x86/crypto/aesni-intel_glue.c:240:2: note: remove the 'if' if its condition is always true
     240 |         if (!crypto_simd_usable())
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
     241 |                 err = aes_expandkey(ctx, in_key, key_len);
         |                                                          ~
     242 |         else {
         |         ~~~~~~
     243 |                 kernel_fpu_begin();
         |                 ~~~~~~~~~~~~~~~~~~~
     244 |                 aesni_set_key(ctx, in_key, key_len);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     245 |                 kernel_fpu_end();
         |                 ~~~~~~~~~~~~~~~~~
     246 |         }
         |         ~
   arch/x86/crypto/aesni-intel_glue.c:234:9: note: initialize the variable 'err' to silence this warning
     234 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +240 arch/x86/crypto/aesni-intel_glue.c

e12a68b3c6ac2c Chang S. Bae   2023-09-28  230  
28b776098379fb Eric Biggers   2023-07-14  231  static int aes_set_key_common(struct crypto_aes_ctx *ctx,
54b6a1bd5364ac Huang Ying     2009-01-18  232  			      const u8 *in_key, unsigned int key_len)
54b6a1bd5364ac Huang Ying     2009-01-18  233  {
54b6a1bd5364ac Huang Ying     2009-01-18  234  	int err;
54b6a1bd5364ac Huang Ying     2009-01-18  235  
54b6a1bd5364ac Huang Ying     2009-01-18  236  	if (key_len != AES_KEYSIZE_128 && key_len != AES_KEYSIZE_192 &&
674f368a952c48 Eric Biggers   2019-12-30  237  	    key_len != AES_KEYSIZE_256)
54b6a1bd5364ac Huang Ying     2009-01-18  238  		return -EINVAL;
54b6a1bd5364ac Huang Ying     2009-01-18  239  
f2abe0d72b2167 Eric Biggers   2019-03-12 @240  	if (!crypto_simd_usable())
2c53fd11f76246 Ard Biesheuvel 2019-07-02  241  		err = aes_expandkey(ctx, in_key, key_len);
54b6a1bd5364ac Huang Ying     2009-01-18  242  	else {
54b6a1bd5364ac Huang Ying     2009-01-18  243  		kernel_fpu_begin();
36ac212f978e58 Chang S. Bae   2024-03-11  244  		aesni_set_key(ctx, in_key, key_len);
54b6a1bd5364ac Huang Ying     2009-01-18  245  		kernel_fpu_end();
54b6a1bd5364ac Huang Ying     2009-01-18  246  	}
54b6a1bd5364ac Huang Ying     2009-01-18  247  
54b6a1bd5364ac Huang Ying     2009-01-18  248  	return err;
54b6a1bd5364ac Huang Ying     2009-01-18  249  }
54b6a1bd5364ac Huang Ying     2009-01-18  250  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
