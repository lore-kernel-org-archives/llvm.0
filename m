Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC7111A8;
	Mon,  3 Feb 2025 01:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738547293; cv=none; b=kSY/FRpCcAGwNKpZlksYOB2059pU8aag9wWD3vxBdV0xT03xxr96feRLK5gdTOOI0V5oV1bTKafHKCHg+uXKTNpfZVF5wxqe/fmRWpF1wkApYbjwTAUkiYYknHXYKYLC8XIEwiv0sYILpQGEynU9c8OgGKvOUvQ6yFQaNEhfmJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738547293; c=relaxed/simple;
	bh=/3aTSpnLZCRi688N7utgtXitU7GFAb4s/tr/BsTiLkk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fLLHKwZ5226JCVlFMpAQWC3znaG/ksgqPCHxX4iihjBrEibbGMNvjWV3cumTRpQvtXRFdQuqM5VQ1GRwntPmuXwuQRymQZhK+UO45IqkZ8slNkSr3JKr3UzedJqOV2G+EfEs2u3Uzmyvek3sPWnFlgfJuAljj8Uqyl2rFf25RPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e9y82ZhG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9y82ZhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738547292; x=1770083292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/3aTSpnLZCRi688N7utgtXitU7GFAb4s/tr/BsTiLkk=;
  b=e9y82ZhGwdY2ipL5hNr2K8mwbMU7/oR3gh++1zrJR1nPTdlULSWaXwIW
   aBq8ZoNDdBV5HuNssQHhqSOfqVa0fpeLmxvcWNZaJVzxXGNqz79M0/nrl
   gM4I/4j6GnfQIEJI18W1Od9iVVfLooGsYnqwtiA8mVfKSs3Z1r/nxOuLn
   iCNoLpdUZLx+JVQuhaobOYXVGieCEw+z5MzajzupARo2sGQg82hQU1mcK
   fCL8hYOjstSJTn5NATfN85CrDiXf9Fre9Ac83y+QZtWQAhefSuVvrLL5w
   IKtZzOaWhCWibJib0WaJvGITeCYXW13Ek+KqK6kWGd3+UyKPkA+mNoJ5K
   A==;
X-CSE-ConnectionGUID: NLv0p+S9SNmiuplYhK6gzg==
X-CSE-MsgGUID: t4ATB3b0So2R5StRYSKx9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="50025440"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="50025440"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 17:48:11 -0800
X-CSE-ConnectionGUID: grK7dXQqRjaCx17Lqy5a9g==
X-CSE-MsgGUID: +Zap6iyHRK6Q3RNzOS7dyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="109922797"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 Feb 2025 17:48:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1telZH-000qMB-1B;
	Mon, 03 Feb 2025 01:48:07 +0000
Date: Mon, 3 Feb 2025 09:47:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:sparse-friendly-direct-mode 103/166]
 drivers/iio/adc/at91-sama5d2_adc.c:1879:6: warning: variable 'vtemp' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202502030940.8HsH3Cft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git sparse-friendly-direct-mode
head:   bada9cd0235b288b74ee2bd65fd4223d71f62b02
commit: 3f20f57fed31f1e13f80158afd57f926a9efcdb0 [103/166] iio: adc: at91-sama5d2: Move claim of direct mode up a level and use guard()
config: x86_64-buildonly-randconfig-004-20250203 (https://download.01.org/0day-ci/archive/20250203/202502030940.8HsH3Cft-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030940.8HsH3Cft-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030940.8HsH3Cft-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/at91-sama5d2_adc.c:1879:6: warning: variable 'vtemp' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1879 |         if (ret < 0)
         |             ^~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1897:37: note: uninitialized use occurs here
    1897 |         div1 = DIV_ROUND_CLOSEST_ULL(((u64)vtemp * clb->p6), vbg);
         |                                            ^~~~~
   include/linux/math.h:104:29: note: expanded from macro 'DIV_ROUND_CLOSEST_ULL'
     104 |         unsigned long long _tmp = (x) + (__d) / 2;      \
         |                                    ^
   drivers/iio/adc/at91-sama5d2_adc.c:1879:2: note: remove the 'if' if its condition is always false
    1879 |         if (ret < 0)
         |         ^~~~~~~~~~~~
    1880 |                 goto restore_config;
         |                 ~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/at91-sama5d2_adc.c:1864:21: note: initialize the variable 'vtemp' to silence this warning
    1864 |         int ret, vbg, vtemp;
         |                            ^
         |                             = 0
   1 warning generated.


vim +1879 drivers/iio/adc/at91-sama5d2_adc.c

5ab38b81895c86 Claudiu Beznea   2022-08-03  1856  
5ab38b81895c86 Claudiu Beznea   2022-08-03  1857  static int at91_adc_read_temp(struct iio_dev *indio_dev,
5ab38b81895c86 Claudiu Beznea   2022-08-03  1858  			      struct iio_chan_spec const *chan, int *val)
5ab38b81895c86 Claudiu Beznea   2022-08-03  1859  {
5ab38b81895c86 Claudiu Beznea   2022-08-03  1860  	struct at91_adc_state *st = iio_priv(indio_dev);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1861  	struct at91_adc_temp_sensor_clb *clb = &st->soc_info.temp_sensor_clb;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1862  	u64 div1, div2;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1863  	u32 tmp;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1864  	int ret, vbg, vtemp;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1865  
3f20f57fed31f1 Jonathan Cameron 2025-02-02  1866  	guard(mutex)(&st->lock);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1867  
75d7556ac0e4bf Claudiu Beznea   2022-08-03  1868  	ret = pm_runtime_resume_and_get(st->dev);
75d7556ac0e4bf Claudiu Beznea   2022-08-03  1869  	if (ret < 0)
3f20f57fed31f1 Jonathan Cameron 2025-02-02  1870  		return ret;
75d7556ac0e4bf Claudiu Beznea   2022-08-03  1871  
5ab38b81895c86 Claudiu Beznea   2022-08-03  1872  	at91_adc_temp_sensor_configure(st, true);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1873  
5ab38b81895c86 Claudiu Beznea   2022-08-03  1874  	/* Read VBG. */
5ab38b81895c86 Claudiu Beznea   2022-08-03  1875  	tmp = at91_adc_readl(st, ACR);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1876  	tmp |= AT91_SAMA5D2_ACR_SRCLCH;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1877  	at91_adc_writel(st, ACR, tmp);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1878  	ret = at91_adc_read_info_raw(indio_dev, chan, &vbg);
5ab38b81895c86 Claudiu Beznea   2022-08-03 @1879  	if (ret < 0)
5ab38b81895c86 Claudiu Beznea   2022-08-03  1880  		goto restore_config;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1881  
5ab38b81895c86 Claudiu Beznea   2022-08-03  1882  	/* Read VTEMP. */
5ab38b81895c86 Claudiu Beznea   2022-08-03  1883  	tmp &= ~AT91_SAMA5D2_ACR_SRCLCH;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1884  	at91_adc_writel(st, ACR, tmp);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1885  	ret = at91_adc_read_info_raw(indio_dev, chan, &vtemp);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1886  
5ab38b81895c86 Claudiu Beznea   2022-08-03  1887  restore_config:
5ab38b81895c86 Claudiu Beznea   2022-08-03  1888  	/* Revert previous settings. */
5ab38b81895c86 Claudiu Beznea   2022-08-03  1889  	at91_adc_temp_sensor_configure(st, false);
75d7556ac0e4bf Claudiu Beznea   2022-08-03  1890  	pm_runtime_mark_last_busy(st->dev);
75d7556ac0e4bf Claudiu Beznea   2022-08-03  1891  	pm_runtime_put_autosuspend(st->dev);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1892  
5ab38b81895c86 Claudiu Beznea   2022-08-03  1893  	/*
5ab38b81895c86 Claudiu Beznea   2022-08-03  1894  	 * Temp[milli] = p1[milli] + (vtemp * clb->p6 - clb->p4 * vbg)/
5ab38b81895c86 Claudiu Beznea   2022-08-03  1895  	 *			     (vbg * AT91_ADC_TS_VTEMP_DT)
5ab38b81895c86 Claudiu Beznea   2022-08-03  1896  	 */
5ab38b81895c86 Claudiu Beznea   2022-08-03  1897  	div1 = DIV_ROUND_CLOSEST_ULL(((u64)vtemp * clb->p6), vbg);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1898  	div1 = DIV_ROUND_CLOSEST_ULL((div1 * 1000), AT91_ADC_TS_VTEMP_DT);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1899  	div2 = DIV_ROUND_CLOSEST_ULL((u64)clb->p4, AT91_ADC_TS_VTEMP_DT);
5ab38b81895c86 Claudiu Beznea   2022-08-03  1900  	div2 *= 1000;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1901  	*val = clb->p1 + (int)div1 - (int)div2;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1902  
5ab38b81895c86 Claudiu Beznea   2022-08-03  1903  	return ret;
5ab38b81895c86 Claudiu Beznea   2022-08-03  1904  }
5ab38b81895c86 Claudiu Beznea   2022-08-03  1905  

:::::: The code at line 1879 was first introduced by commit
:::::: 5ab38b81895c869fb72eab5b528d5ef13a741c66 iio: adc: at91-sama5d2_adc: add support for temperature sensor

:::::: TO: Claudiu Beznea <claudiu.beznea@microchip.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
