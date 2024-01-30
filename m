Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D371B3A;
	Tue, 30 Jan 2024 20:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706646878; cv=none; b=KSR4+jJwCiQ8Peu0iypZjFSrp7mFUpEVNHHskfRLP3f5K1wcPKFAJc8a5Rsdj50vwuugRIdDQqChQy7rXElkb73V1ofJ+LaoJj9UHanjPVetnDF7SUtGP+NqWWUOsjWvRy4drejWIe7OKqXgwzouAxPpfO49xKvZaKxI7Ekcto0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706646878; c=relaxed/simple;
	bh=2FgM1Oh7yRSt0mhRVWHo+HrhiQcikH+bVgK4NpSlRdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ic8ocpKWMLqpfh8/DXXvlA3nynGEObyO+5onIyqFdbP9Rl1MzO6vRCmoFBoskL76+igAhd+xeA5hoOsaupLvfF1V+xPT+KLpbk7kUDGOOIigsLZcnkQtcRaokqM7Acta9csIvDs0NuHtQbbktfXMtcZZBRe8dfen/S8yCWXhNyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCEBhFmZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCEBhFmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706646877; x=1738182877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FgM1Oh7yRSt0mhRVWHo+HrhiQcikH+bVgK4NpSlRdI=;
  b=RCEBhFmZRciLEh30IytickgON3rqbS5HXT78uF65mKjGGiM3DRcftRGR
   bGs41UJQ5+P9Xlmp/zPa5tw2lw9kpOipXau8EGwBcSW4reYX1DttEXcQ8
   mo+WBthW1U9NLuAuxkhSU/ft33wRIZq4LAlehOm8axfBqXZwwRmNn8A7v
   iXW3XMjNerc97WXHMUaHCdudnLAuigtCT2LMKq4n/+Hcy2Tqx0doKfwe/
   o8NpodtHp2AwWe3K3DJ/OOvwSEk00U+WgfmBxuolYiEHFU/ibwSOoWdiC
   rpXo6+Od6GzFyMU8aELtLI/ld5UgKuD6su0KKfuFtZUJtgAa10WJAvfbP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2332293"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="2332293"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 12:34:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; 
   d="scan'208";a="3821862"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2024 12:34:34 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUuoR-0000o0-2C;
	Tue, 30 Jan 2024 20:34:31 +0000
Date: Wed, 31 Jan 2024 04:33:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [kees:devel/overflow/ubsan-only 3/6] lib/test_ubsan.c:61:17:
 warning: variable 'top' set but not used
Message-ID: <202401310423.XpCIk6KO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/ubsan-only
head:   ec27d9baa678ce3b875e5784ba6ebbf759daabd6
commit: f6f0addd75d22b67b88a390c6f900e83f138ba3e [3/6] ubsan: Introduce CONFIG_UBSAN_POINTER_WRAP
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240131/202401310423.XpCIk6KO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240131/202401310423.XpCIk6KO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401310423.XpCIk6KO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_ubsan.c:61:17: warning: variable 'top' set but not used [-Wunused-but-set-variable]
      61 |         volatile void *top = (void *)ULONG_MAX;
         |                        ^
>> lib/test_ubsan.c:69:17: warning: variable 'bottom' set but not used [-Wunused-but-set-variable]
      69 |         volatile void *bottom = (void *)1;
         |                        ^
>> lib/test_ubsan.c:82:28: warning: variable 'half' set but not used [-Wunused-but-set-variable]
      82 |         volatile struct ptr_wrap *half = (void *)(ULONG_MAX - 128);
         |                                   ^
   lib/test_ubsan.c:101:6: warning: variable 'val1' set but not used [-Wunused-but-set-variable]
     101 |         int val1 = 10;
         |             ^
   lib/test_ubsan.c:102:6: warning: variable 'val2' set but not used [-Wunused-but-set-variable]
     102 |         int val2 = INT_MAX;
         |             ^
   lib/test_ubsan.c:136:19: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
     136 |         bool val, val2, *ptr;
         |                          ^
   lib/test_ubsan.c:137:37: warning: variable 'eptr' set but not used [-Wunused-but-set-variable]
     137 |         enum ubsan_test_enum eval, eval2, *eptr;
         |                                            ^
   lib/test_ubsan.c:182:28: warning: unused variable 'skip_ubsan_array' [-Wunused-const-variable]
     182 | static const test_ubsan_fp skip_ubsan_array[] = {
         |                            ^~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/top +61 lib/test_ubsan.c

    58	
    59	static void test_ubsan_pointer_overflow_add(void)
    60	{
  > 61		volatile void *top = (void *)ULONG_MAX;
    62	
    63		UBSAN_TEST(CONFIG_UBSAN_POINTER_WRAP);
    64		top += 2;
    65	}
    66	
    67	static void test_ubsan_pointer_overflow_sub(void)
    68	{
  > 69		volatile void *bottom = (void *)1;
    70	
    71		UBSAN_TEST(CONFIG_UBSAN_POINTER_WRAP);
    72		bottom -= 3;
    73	}
    74	
    75	struct ptr_wrap {
    76		int a;
    77		int b;
    78	};
    79	
    80	static void test_ubsan_pointer_overflow_mul(void)
    81	{
  > 82		volatile struct ptr_wrap *half = (void *)(ULONG_MAX - 128);
    83		volatile int bump = 128;
    84	
    85		UBSAN_TEST(CONFIG_UBSAN_POINTER_WRAP);
    86		half += bump;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
