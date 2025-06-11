Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2C35897;
	Wed, 11 Jun 2025 13:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749648679; cv=none; b=CXdtONgd6HHYoOHCsrMRrrLexLRkY0EsIa5j2N7TZigWEE+bkkrGDzBrscoDS0aL+0c6aWLQhA9ljUyPZOyodgUI4ZgJEekf3L5/ycUSQRT15+IuX4zsXwyhE+y/ROri2t8UmniFNORz2IuDtNxSoM90GX6Oe8lOHt4rQTwE+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749648679; c=relaxed/simple;
	bh=E3ULJSDR7H6jRN4Ghf4x8IwwME+LAT9nuGkMxafPI6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQay8wViWNFTVanYcgASi1rfLtXWaLXQgA3sltgXC74FEpy2/JJcTXnjSMvw4vly4pbqpU041Cmk09ynKyE0OS9+entMk5n/4SwgjJch6wopZiG9ociNra/elv3rkG9UI8NhOZIZlPYOMWjaJSsMIiK7NFjSKSdaDjLkEYtHMJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V27F4PA5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V27F4PA5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749648677; x=1781184677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E3ULJSDR7H6jRN4Ghf4x8IwwME+LAT9nuGkMxafPI6M=;
  b=V27F4PA5vS33b+gR2/7xwpZspgZ0CPtfgWTBpyTrIOFi7xGP+FU9wYRP
   IxTP1EDuf2VSixMlmh0hG7Ol+uQvktJxC5Vnt7QKydYVtTLFQpmQVa78M
   b5U3KSNI5dnNor6jAlBeklWUaOEVHn2tWsPZyjf9xW+WifrNYlnBPhfTj
   3jnm5VGvqO9sjI0qMyKsoBpoxWDjtC2X6dSnorSEkzERp920Kvt4V2+0a
   KKL44F4m+zJ/fJWkWaCWZJsPbLQVdO7UtKlIHe+X2ZfQTAPfNg5egya88
   Zm25XR1h03JAOjXPmK9dXV4Keo6A9mKN/9d/By6ExWfYz4/wfT5oaGEBc
   A==;
X-CSE-ConnectionGUID: bB2JehOERMaflZ9cZTrOcQ==
X-CSE-MsgGUID: u1S3DCbOQn+x4uVqil4MEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="74327379"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="74327379"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 06:30:50 -0700
X-CSE-ConnectionGUID: 2DFXHSiYRxSalsSPjuL4JQ==
X-CSE-MsgGUID: ttXpQ4clSTCPy74cGntdIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="147103761"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jun 2025 06:30:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPLXS-000AVK-1q;
	Wed, 11 Jun 2025 13:30:46 +0000
Date: Wed, 11 Jun 2025 21:30:44 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:libcrypto-pending 15/16] lib/crypto/sha512.c:133:10: fatal
 error: 'sha512.h' file not found
Message-ID: <202506112119.CpYFrurc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-pending
head:   0586083fb1c568bec833e783baaca2af96546965
commit: d0d72dc3d57b125acc032396f4d6b82188b1ace2 [15/16] lib/crypto/sha512: migrate x86-optimized SHA-512 code to library
config: um-randconfig-001-20250611 (https://download.01.org/0day-ci/archive/20250611/202506112119.CpYFrurc-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506112119.CpYFrurc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112119.CpYFrurc-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: no such include directory: 'lib/crypto/um' [-Wmissing-include-dirs]
>> lib/crypto/sha512.c:133:10: fatal error: 'sha512.h' file not found
     133 | #include "sha512.h" /* $(SRCARCH)/sha512.h */
         |          ^~~~~~~~~~
   1 error generated.


vim +133 lib/crypto/sha512.c

6eecba60cf9a91 Eric Biggers 2025-06-10  131  
6eecba60cf9a91 Eric Biggers 2025-06-10  132  #ifdef CONFIG_CRYPTO_LIB_SHA512_ARCH
6eecba60cf9a91 Eric Biggers 2025-06-10 @133  #include "sha512.h" /* $(SRCARCH)/sha512.h */
6eecba60cf9a91 Eric Biggers 2025-06-10  134  #else
6eecba60cf9a91 Eric Biggers 2025-06-10  135  #define sha512_blocks sha512_blocks_generic
6eecba60cf9a91 Eric Biggers 2025-06-10  136  #endif
6eecba60cf9a91 Eric Biggers 2025-06-10  137  

:::::: The code at line 133 was first introduced by commit
:::::: 6eecba60cf9a91a96a3e342357ec1124ae490ddc lib/crypto/sha512: add support for SHA-384 and SHA-512

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Eric Biggers <ebiggers@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
