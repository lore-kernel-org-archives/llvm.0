Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDEB1E522;
	Sat, 23 Mar 2024 16:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711209726; cv=none; b=DiWWtLiix2uaEyRPGGQF8nNl1w1eELOiFUC7iOfyO6LDBi+41U0lpR6VhYsCOZwCaBSrfHX4jyBLdBekKoP6eIFTRzRQlPeBqBtH87uLpYLR05leOqh8togA/dVURKVogAJZQkVpKdXbF6Sp0i7wXc1xC7apb4X3BwYTPQ1BpPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711209726; c=relaxed/simple;
	bh=iQcR/mhUY+V+ZFJXtvSOd7ReOc7NZrDpvtrRu1CoRyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UUSismV6Mx0DH/geDUpDp8OWHXAJDEOJGLNmnwSucLvfIxz6TCrfcwbf2f4KoBLl5V0JzGSK+3/4WR4jDQ2LGLSYShJLR00ib4dypYmdPFcPwShDfWXSomjv2mHEX5NcZJOFMHYBuVg72+qMmJvxtkktaWpe7mCzJpxDHF9SWG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5Nkf5Cu; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5Nkf5Cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711209725; x=1742745725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iQcR/mhUY+V+ZFJXtvSOd7ReOc7NZrDpvtrRu1CoRyc=;
  b=Y5Nkf5Cusxjk69rR6s3dI25XScvkwqRBq8l0DLmS+/PBcapLyRbYERKW
   AbFA3lbNvy/CsOP3DvhFX5te7ZgwreVQRFlwainiucrWdOi83D0b/eFh1
   yL662ppiCzKc8ITJ+5ek5Ce17YBwMixFtdgi02f7yLVF0uMnYiBsBVib0
   uSvgAmkdcyT9dW5924UTOlt1UpXERcgXs7nC50FytF/9Vuzi8h8nsNRze
   2U2svDEK40OFp9GwKhdB/uH69pjrcGl9hw5zaniiVYI7XfOf5DOophmQA
   aad/al9nPm5Kuzd2242Ao9JbyIf9C7DEs3LJO9ODFcqc1goQCup4P2PA4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11022"; a="6364990"
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="6364990"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2024 09:02:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,149,1708416000"; 
   d="scan'208";a="46190937"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2024 09:02:03 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ro3om-000LH7-2Z;
	Sat, 23 Mar 2024 16:02:00 +0000
Date: Sun, 24 Mar 2024 00:01:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, zx2c4@kernel.org
Subject: [crng-random:master 1/2] arch/x86/include/asm/archrandom.h:25:2:
 error: call to undeclared function 'WARN_ON'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202403232301.ypsXWiIy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master
head:   6fba9af4a847c5ee67715bc6f7959e9ab6394275
commit: c53d3006e1eda1e4fc2a0de9481331a23dbef5ef [1/2] x86/archrandom: WARN if RDRAND fails and don't retry
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240323/202403232301.ypsXWiIy-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240323/202403232301.ypsXWiIy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403232301.ypsXWiIy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/rdrand.c:12:
>> arch/x86/include/asm/archrandom.h:25:2: error: call to undeclared function 'WARN_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      25 |         WARN_ON(!ok);
         |         ^
   1 error generated.


vim +/WARN_ON +25 arch/x86/include/asm/archrandom.h

    17	
    18	static inline bool __must_check rdrand_long(unsigned long *v)
    19	{
    20		bool ok;
    21		asm volatile("rdrand %[out]"
    22			     CC_SET(c)
    23			     : CC_OUT(c) (ok), [out] "=r" (*v));
    24	#ifndef KASLR_COMPRESSED_BOOT
  > 25		WARN_ON(!ok);
    26	#endif
    27		return ok;
    28	}
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
