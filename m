Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E146FC3;
	Thu, 25 Sep 2025 06:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758780237; cv=none; b=r8RxY6nzpONIJYAk3gUVLzgyAwpOj6zsIZpjp7BfNSfNPGxkAqetFjuMZKdEJPsFu2cxWQXbEeTUcnXVutyPY73KuN2pRFGOZ3v8yo7UxJgwHFKlmIbh9NohyRkJsr826oGDgmwti3NCzeeibOtMG6bnFBor0MxkF5IV9UGgCFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758780237; c=relaxed/simple;
	bh=6eqPjgbHpHt7trPigvZyx6AuNxP0y7NzOUE+tDZddn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHbB/SsOf4iYMF9GdvRoqJBdDxHm/4oio40g+uGkFVKl1rGTI+mzqH/0/HZpN7o35ADJEv16+N1QvPY2EnbBKSUoE/c6TI6pH6ntLENbSI8yAh7fV5bt623gb6XTjBrbKLN/vDU0uPgVA3xcKt9UvGA2wv9gdsg55PrlwhwSRdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M1AdT0m9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M1AdT0m9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758780234; x=1790316234;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6eqPjgbHpHt7trPigvZyx6AuNxP0y7NzOUE+tDZddn0=;
  b=M1AdT0m9xb2whDafFDxXJD2MasrLnqdEHE+JP6j6B2pQMzIPJld9v1tF
   szlrojUWHXGFH3/jegVSbyhthd1tt6eUaN4hk9U1xB8/ibB6WeRhHfR0Q
   K9WXJt3cOhpX7WEC/VKmlwCEUMwmsBOj+pHerjzOX4U7gbvkEUv+/ozsW
   wbLcfxp4vJVQtsISOMT0WAenvC65jN65sT+ArCsqVsqTV26eJCqPHCWFS
   ehoZBYTeyFv44d/ih48p8DcTLp82+oLd/jKX94T2jj8jIPK3IBUxy5IB7
   js5WtcnSwvYBLxuNczVXfEd8sU/1+x1MeBFhRrWf1rGtwEfzpBS55kcqt
   Q==;
X-CSE-ConnectionGUID: bQSTqMLSS1ieU49d8dPllw==
X-CSE-MsgGUID: 3xmu4vVSQoSdmuVCi8M/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="63715798"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="63715798"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 23:03:53 -0700
X-CSE-ConnectionGUID: 6oyHcJi5TD2e657Wi9XEag==
X-CSE-MsgGUID: xJWfe8QbR2u6eWTKDBtqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177079069"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Sep 2025 23:03:52 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1f53-0004xX-21;
	Thu, 25 Sep 2025 06:03:49 +0000
Date: Thu, 25 Sep 2025 14:03:47 +0800
From: kernel test robot <lkp@intel.com>
To: Wensheng Wang <wenswang@yeah.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [groeck-staging:hwmon-next 79/87]
 drivers/hwmon/pmbus/mp2925.c:159:11: warning: variable 'ret' is
 uninitialized when used here
Message-ID: <202509251422.Cnmuh8EH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   5f6722c971aa9d5b9736701926c3fdd1928db272
commit: b3a4efc88601cb5fc97b4ae23c478700a60302da [79/87] hwmon: add MP2925 and MP2929 driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250925/202509251422.Cnmuh8EH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251422.Cnmuh8EH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509251422.Cnmuh8EH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/hwmon/pmbus/mp2925.c:159:11: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     159 |                                             (ret & ~GENMASK(11, 0)) |
         |                                              ^~~
   drivers/hwmon/pmbus/mp2925.c:137:9: note: initialize the variable 'ret' to silence this warning
     137 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +159 drivers/hwmon/pmbus/mp2925.c

   133	
   134	static int mp2925_write_word_data(struct i2c_client *client, int page, int reg,
   135					  u16 word)
   136	{
   137		int ret;
   138	
   139		switch (reg) {
   140		case PMBUS_VIN_OV_FAULT_LIMIT:
   141		case PMBUS_VIN_OV_WARN_LIMIT:
   142		case PMBUS_VIN_UV_WARN_LIMIT:
   143		case PMBUS_VIN_UV_FAULT_LIMIT:
   144			/*
   145			 * The PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_OV_WARN_LIMIT,
   146			 * PMBUS_VIN_UV_WARN_LIMIT and PMBUS_VIN_UV_FAULT_LIMIT
   147			 * of MP2925 is linear11 format, and the exponent is a
   148			 * constant value(5'b11100)， so the exponent of word
   149			 * parameter should be converted to 5'b11100(0x1C).
   150			 */
   151			ret = pmbus_write_word_data(client, page, reg,
   152						    mp2925_linear_exp_transfer(word, 0x1C));
   153			if (ret < 0)
   154				return ret;
   155			break;
   156		case PMBUS_VOUT_OV_FAULT_LIMIT:
   157		case PMBUS_VOUT_UV_FAULT_LIMIT:
   158			ret = pmbus_write_word_data(client, page, reg,
 > 159						    (ret & ~GENMASK(11, 0)) |
   160					FIELD_PREP(GENMASK(11, 0),
   161						   DIV_ROUND_CLOSEST(word * MP2925_VOUT_OVUV_DIV,
   162								     MP2925_VOUT_OVUV_UINT)));
   163			break;
   164		case PMBUS_OT_FAULT_LIMIT:
   165		case PMBUS_OT_WARN_LIMIT:
   166			/*
   167			 * The PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT of
   168			 * MP2925 is linear11 format, and the exponent is a
   169			 * constant value(5'b00000), so the exponent of word
   170			 * parameter should be converted to 5'b00000.
   171			 */
   172			ret = pmbus_write_word_data(client, page, reg,
   173						    mp2925_linear_exp_transfer(word, 0x00));
   174			if (ret < 0)
   175				return ret;
   176			break;
   177		case PMBUS_IOUT_OC_FAULT_LIMIT:
   178		case PMBUS_IOUT_OC_WARN_LIMIT:
   179			/*
   180			 * The PMBUS_IOUT_OC_FAULT_LIMIT and PMBUS_IOUT_OC_WARN_LIMIT
   181			 * of MP2925 is linear11 format, and the exponent is a
   182			 * can not be changed.
   183			 */
   184			ret = pmbus_read_word_data(client, page, 0xff, reg);
   185			if (ret < 0)
   186				return ret;
   187	
   188			ret = pmbus_write_word_data(client, page, reg,
   189						    mp2925_linear_exp_transfer(word,
   190									       FIELD_GET(GENMASK(15, 11),
   191											 ret)));
   192			break;
   193		default:
   194			ret = -EINVAL;
   195			break;
   196		}
   197	
   198		return ret;
   199	}
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
