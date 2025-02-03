Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C26410FD;
	Mon,  3 Feb 2025 00:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738541764; cv=none; b=fZU49XV86SpCFoWVUjTZ6yZhruuzSoWGEo3jtFlPBuOR9NudW0adIAdiQy3A1p0yC+WGC4gJdfAtLtoFnLh6geJEMDmrHOrAYQi/taoR6ZMfi20JREQaGqqxuorHAB8PS8hjzW+6MrBl6AwOfKTeeHtnV1C7RIGsVJO0UGJvuos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738541764; c=relaxed/simple;
	bh=j1Rk9EWS0Oh1lL0HeKjaiAa0BjHDB46QfGVxv9gys1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TKlnFB1U9sBcrR/DdEGLDOwJbfZ4BIZJ1zGGcVUM7RByUeO8wCXCiM/cLZ9AritYdPNVMGA7yUQT8A9+tTnfA/ilsOPQaXZKRVXRu1NSG0z+2ZVUmA8Js+llXXK5035jnQZ+jhLANl/pTBES7m7XvWvW3YFLG84Md810M1/t3mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuIM8OAT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuIM8OAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738541761; x=1770077761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j1Rk9EWS0Oh1lL0HeKjaiAa0BjHDB46QfGVxv9gys1k=;
  b=BuIM8OATW0T+4MEPI06THbAD9Q/TXHCcYO3fzi1kUh4v5/iWbnT4u8nu
   5I7sxrBkE7mYy2KpAJG60ufakqhBkrnAi093W+RVtTNpsMSQGf8zZPh1+
   uo9DfCRcTbgoHIS/Jx0hY0kJ42FVBQnWTcERjNgWKIr/KT8nmiawAff3q
   X9NcvGddQjoGZbUi8NuZQr0SH72CHtucwj07XjP2wPPMJXpCre0zYoErx
   tLntu7WLR7fIYFrSmiJpa/MFs4Cvn4EZ65jf3wIh3Coy+52O3tsAfMWtN
   pM0ZYx+FzrPQ94FvYu0kFtJ2coPmfGkpuzLEoLSyxHMuW0xVlj08idsFK
   Q==;
X-CSE-ConnectionGUID: Y0bfARFnS7SkeAtN9T/gJQ==
X-CSE-MsgGUID: ONr6cEKNTWykijilSrNd9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49687345"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="49687345"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 16:16:00 -0800
X-CSE-ConnectionGUID: QG+BmjXJRbCrhEkIugeGxg==
X-CSE-MsgGUID: 3XjpAP6lRbmHYPP8Fshj4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="114771696"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Feb 2025 16:15:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tek85-000qHD-0u;
	Mon, 03 Feb 2025 00:15:57 +0000
Date: Mon, 3 Feb 2025 08:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:sparse-friendly-direct-mode 52/166]
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1850:7: warning: variable 'err'
 is used uninitialized whenever 'if' condition is false
Message-ID: <202502030800.FBFCF1CE-lkp@intel.com>
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
commit: 3e53e337047467484ef3689555b5fe392679790b [52/166] iio: imu: st_lsm6dsx: Switch to sparse friendly claim/release_direct()
config: hexagon-randconfig-002-20250203 (https://download.01.org/0day-ci/archive/20250203/202502030800.FBFCF1CE-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030800.FBFCF1CE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030800.FBFCF1CE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1850:7: warning: variable 'err' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    1850 |                 if (val < 0)
         |                     ^~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1863:9: note: uninitialized use occurs here
    1863 |         return err;
         |                ^~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1850:3: note: remove the 'if' if its condition is always true
    1850 |                 if (val < 0)
         |                 ^~~~~~~~~~~~
    1851 |                         err = val;
         |                                  ~
    1852 |                 else
         |                 ~~~~
    1853 |                         sensor->odr = val;
         |                         ~~~~~~~~~~~~~~~~~
   drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c:1836:9: note: initialize the variable 'err' to silence this warning
    1836 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +1850 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c

290a6ce11d938b Lorenzo Bianconi 2017-01-10  1830  
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1831  static int st_lsm6dsx_write_raw(struct iio_dev *iio_dev,
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1832  				struct iio_chan_spec const *chan,
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1833  				int val, int val2, long mask)
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1834  {
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1835  	struct st_lsm6dsx_sensor *sensor = iio_priv(iio_dev);
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1836  	int err;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1837  
3e53e337047467 Jonathan Cameron 2025-01-05  1838  	if (!iio_device_claim_direct(iio_dev))
3e53e337047467 Jonathan Cameron 2025-01-05  1839  		return -EBUSY;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1840  
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1841  	switch (mask) {
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1842  	case IIO_CHAN_INFO_SCALE:
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1843  		err = st_lsm6dsx_set_full_scale(sensor, val2);
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1844  		break;
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1845  	case IIO_CHAN_INFO_SAMP_FREQ: {
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1846  		u8 data;
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1847  
f8710f0357bc36 Lorenzo Bianconi 2019-11-03  1848  		val = val * 1000 + val2 / 1000;
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27  1849  		val = st_lsm6dsx_check_odr(sensor, val, &data);
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27 @1850  		if (val < 0)
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27  1851  			err = val;
fc3f6ad7f5dc6c Lorenzo Bianconi 2019-10-27  1852  		else
5e3c3e3382e87a Lorenzo Bianconi 2017-09-18  1853  			sensor->odr = val;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1854  		break;
2ccc15036d812e Lorenzo Bianconi 2017-04-02  1855  	}
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1856  	default:
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1857  		err = -EINVAL;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1858  		break;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1859  	}
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1860  
3e53e337047467 Jonathan Cameron 2025-01-05  1861  	iio_device_release_direct(iio_dev);
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1862  
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1863  	return err;
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1864  }
290a6ce11d938b Lorenzo Bianconi 2017-01-10  1865  

:::::: The code at line 1850 was first introduced by commit
:::::: fc3f6ad7f5dc6c899fbda0255865737bac88c2e0 iio: imu: st_lsm6dsx: fix ODR check in st_lsm6dsx_write_raw

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
