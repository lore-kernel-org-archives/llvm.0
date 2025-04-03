Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F9F24C069;
	Thu,  3 Apr 2025 11:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743681425; cv=none; b=ONUsWSkOtAWfBIS6lwIi6nvd5B4NsxLPsHx73YnJcXtsm5KIkSSKTKEW5ltfx0xNC2ba/LjUY+dkJITlscpBdvfr+XOlTRKCNoxDXVI/h/cfHb2kxs+SXEMBxyg0+Rk8UlbxP03zt0VhIpZo1Vy0g4k1bjvOl0QJI4WCC9J1jtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743681425; c=relaxed/simple;
	bh=3xAbHHEtXwaAcKDDn8UKzE7pzlhaQnsG6WV7c/CiHw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UXeI8tqnRJ/HcuZyxVQJsRw4ArJMx5O3BRx934xNIjnH4pW8kEjc+QtnXBOoM6zFLg2ahLaWJNBcL03zfTHPD42q3r6KbSoqVsgTkXZ37eWgarYEu99DnUfRKevis4L8CA4y/CO22R8Wtae321l0mbMa9rbVghxLnVu3WESwsv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gV2/WkNT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gV2/WkNT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743681424; x=1775217424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3xAbHHEtXwaAcKDDn8UKzE7pzlhaQnsG6WV7c/CiHw8=;
  b=gV2/WkNTic6F5VYbq8dujlReTsWxBC6ZETsG50cXWVf+xhde0o40y8YY
   Ny5X3quqE+/ENxZl570lC5amZ61hyBM+qqH/ANVOlnJaap9I5+5XGwIRf
   KKehIKoc430ddajYkzhK5Sd80+badD87C+tmqiww0uLtRpWbNHAbxZWES
   0UgfKIuqhNHwH/jhkxKeTnMkPsoNAw1GFPMATvFtDNPl6Kp6/zxzp438b
   Ge2j14xJaqYvI5AsKJolqdXOBYi9n01ruDKojfrx++s5Wgm4BxdD1sUGK
   wUspaM+Hxq+7LWWC24UwWtzs5NVVamyS7Mo/GvvQGNhy/+1aevFJGq1xD
   A==;
X-CSE-ConnectionGUID: BijTIMZgRpSo0skEWwkayQ==
X-CSE-MsgGUID: HmvSfdj8QzWBIIvqA0dDtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="48949346"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="48949346"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 04:57:03 -0700
X-CSE-ConnectionGUID: yXyHgw9JQ2u19SiD2ddG/A==
X-CSE-MsgGUID: p1FTsHZkTDqfCRIUu9qZrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127837337"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2025 04:57:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0JBr-0000Nb-1x;
	Thu, 03 Apr 2025 11:56:59 +0000
Date: Thu, 3 Apr 2025 19:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 14246/14442] drivers/pwm/pwm-rcar.c:114:12:
 error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202504032210.lrHoeR64-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f0a16f5363325cc8d9382471cdc7b654c53254c9
commit: edd549f4956be84ebd6a3900975544adeb0f3b50 [14246/14442] pwm: rcar: Improve register calculation
config: powerpc64-randconfig-003-20250403 (https://download.01.org/0day-ci/archive/20250403/202504032210.lrHoeR64-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504032210.lrHoeR64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504032210.lrHoeR64-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pwm/pwm-rcar.c:114:12: error: call to undeclared function 'FIELD_MAX'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     114 |         if (tmp > FIELD_MAX(RCAR_PWMCNT_CYC0_MASK))
         |                   ^
>> drivers/pwm/pwm-rcar.c:117:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     117 |         cyc = FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, tmp);
         |               ^
   2 errors generated.


vim +/FIELD_MAX +114 drivers/pwm/pwm-rcar.c

   104	
   105	static int rcar_pwm_set_counter(struct rcar_pwm_chip *rp, int div, u64 duty_ns,
   106					u64 period_ns)
   107	{
   108		unsigned long long tmp;
   109		unsigned long clk_rate = clk_get_rate(rp->clk);
   110		u32 cyc, ph;
   111	
   112		/* div <= 24 == RCAR_PWM_MAX_DIVISION, so the shift doesn't overflow. */
   113		tmp = mul_u64_u64_div_u64(period_ns, clk_rate, (u64)NSEC_PER_SEC << div);
 > 114		if (tmp > FIELD_MAX(RCAR_PWMCNT_CYC0_MASK))
   115			tmp = FIELD_MAX(RCAR_PWMCNT_CYC0_MASK);
   116	
 > 117		cyc = FIELD_PREP(RCAR_PWMCNT_CYC0_MASK, tmp);
   118	
   119		tmp = mul_u64_u64_div_u64(duty_ns, clk_rate, (u64)NSEC_PER_SEC << div);
   120		if (tmp > FIELD_MAX(RCAR_PWMCNT_PH0_MASK))
   121			tmp = FIELD_MAX(RCAR_PWMCNT_PH0_MASK);
   122		ph = FIELD_PREP(RCAR_PWMCNT_PH0_MASK, tmp);
   123	
   124		/* Avoid prohibited setting */
   125		if (cyc == 0 || ph == 0)
   126			return -EINVAL;
   127	
   128		rcar_pwm_write(rp, cyc | ph, RCAR_PWMCNT);
   129	
   130		return 0;
   131	}
   132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
