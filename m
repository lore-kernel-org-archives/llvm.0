Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F51D6195;
	Sun,  2 Feb 2025 23:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738540444; cv=none; b=e4k57p+UvG9XXXKJ7/lBjp+EWeD5Pm6CEF/iyz45QuRo/8Q+kutn96q30nWE0iypu6nv/PraMK2NijgzRHieARALnWjP2sZgZLd4dXa3JRxXTgEp53oUi1t67DaooWvMn72scwsH3mjUrPfD05J/B53DYKTeNIyviUpfo/qyQfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738540444; c=relaxed/simple;
	bh=SUWqDsVHnwfoFPZ72GnF+anp/orwAfrIOZyK0oRQA3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hifMINj5FjaAykX4LktQdbztZ80Jd0EmMTD+IOS6eLEGZGy2yJ3TM1nmrsoSSd62EFf1esWzcN14tH1fCDX/k7Kxtan3adSGgvpVr9UkAYqlZF06bxeubNvBVfLTTy12h7H532CBCs916au6jNZYbzJ5XrTcMbJRGyz+yc3kl4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PvTc7Tec; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PvTc7Tec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738540442; x=1770076442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SUWqDsVHnwfoFPZ72GnF+anp/orwAfrIOZyK0oRQA3k=;
  b=PvTc7TecPOufkAHyDCpeZSrqP8ISL0nscuPT6p2OO0AnnYExxW28D6jH
   5f7vjjUAWGXEgrtybVXFHAN1UcYHMH/+sSY4BqbKhwTNN2WoYNRk/zLcE
   /1XlPlmmbZuT+JHoUVXsoVthcaDJr07uDUfys19zkbWXmFwmopS3F6wf5
   DWYsxiIdgvbc1BD85vxb9WUD9SB8CoZTBgxBVFHe2W1OyWLFbRrzeVMZR
   53cqmo/HC0h9oJfVxDGvxAL+8vwgHOwHhj1k6Fu2YH013I1do2NhEd8rd
   883nGHglNBqUBtOUAsxPYomgjg/uBOSYXuRsn5tKChi7rKuCS5kyk1Px+
   w==;
X-CSE-ConnectionGUID: flGd5YqUQ+eEGx837zSysw==
X-CSE-MsgGUID: 6ajP9vPrRpmbvobrj4PXeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38910844"
X-IronPort-AV: E=Sophos;i="6.13,254,1732608000"; 
   d="scan'208";a="38910844"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 15:53:59 -0800
X-CSE-ConnectionGUID: iUO26MTCSD+9TzDzAw85QA==
X-CSE-MsgGUID: slhW8cwuTuWbrWBMsE/lNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115292449"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Feb 2025 15:53:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tejml-000qGS-1W;
	Sun, 02 Feb 2025 23:53:55 +0000
Date: Mon, 3 Feb 2025 07:53:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jic23-iio:sparse-friendly-direct-mode 111/166]
 drivers/iio/adc/ad7173.c:1184:8: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is true
Message-ID: <202502030711.VjFc2dxK-lkp@intel.com>
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
commit: a0df9059bd2ef36d622cf94311dfb017b6b5de5d [111/166] iio: adc: Simple cases of switch to sparse friendly iio_device_claim/release_direct()
config: hexagon-randconfig-001-20250203 (https://download.01.org/0day-ci/archive/20250203/202502030711.VjFc2dxK-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 355d0b186f178668b103068537e517f3d52ad639)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502030711.VjFc2dxK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502030711.VjFc2dxK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/adc/ad7173.c:1184:8: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1184 |                         if (freq >= st->info->sinc5_data_rates[i])
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7173.c:1198:9: note: uninitialized use occurs here
    1198 |         return ret;
         |                ^~~
   drivers/iio/adc/ad7173.c:1184:4: note: remove the 'if' if its condition is always false
    1184 |                         if (freq >= st->info->sinc5_data_rates[i])
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1185 |                                 break;
         |                                 ~~~~~
>> drivers/iio/adc/ad7173.c:1183:39: warning: variable 'ret' is used uninitialized whenever 'for' loop exits because its condition is false [-Wsometimes-uninitialized]
    1183 |                 for (i = st->info->odr_start_value; i < st->info->num_sinc5_data_rates - 1; i++)
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7173.c:1198:9: note: uninitialized use occurs here
    1198 |         return ret;
         |                ^~~
   drivers/iio/adc/ad7173.c:1183:39: note: remove the condition if it is always true
    1183 |                 for (i = st->info->odr_start_value; i < st->info->num_sinc5_data_rates - 1; i++)
         |                                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/ad7173.c:1160:9: note: initialize the variable 'ret' to silence this warning
    1160 |         int ret;
         |                ^
         |                 = 0
   2 warnings generated.


vim +1184 drivers/iio/adc/ad7173.c

76a1e6a4280211 Dumitru Ceclan   2024-02-28  1152  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1153  static int ad7173_write_raw(struct iio_dev *indio_dev,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1154  			    struct iio_chan_spec const *chan,
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1155  			    int val, int val2, long info)
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1156  {
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1157  	struct ad7173_state *st = iio_priv(indio_dev);
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1158  	struct ad7173_channel_config *cfg;
182bc496dc63ca Dumitru Ceclan   2024-05-30  1159  	unsigned int freq, i;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1160  	int ret;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1161  
a0df9059bd2ef3 Jonathan Cameron 2025-02-02  1162  	if (!iio_device_claim_direct(indio_dev))
a0df9059bd2ef3 Jonathan Cameron 2025-02-02  1163  		return -EBUSY;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1164  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1165  	switch (info) {
f87b076b934f72 Dumitru Ceclan   2024-06-07  1166  	/*
f87b076b934f72 Dumitru Ceclan   2024-06-07  1167  	 * This attribute sets the sampling frequency for each channel individually.
f87b076b934f72 Dumitru Ceclan   2024-06-07  1168  	 * There are no issues for raw or buffered reads of an individual channel.
f87b076b934f72 Dumitru Ceclan   2024-06-07  1169  	 *
f87b076b934f72 Dumitru Ceclan   2024-06-07  1170  	 * When multiple channels are enabled in buffered mode, the effective
f87b076b934f72 Dumitru Ceclan   2024-06-07  1171  	 * sampling rate of a channel is lowered in correlation to the number
f87b076b934f72 Dumitru Ceclan   2024-06-07  1172  	 * of channels enabled and the sampling rate of the other channels.
f87b076b934f72 Dumitru Ceclan   2024-06-07  1173  	 *
f87b076b934f72 Dumitru Ceclan   2024-06-07  1174  	 * Example: 3 channels enabled with rates CH1:6211sps CH2,CH3:10sps
f87b076b934f72 Dumitru Ceclan   2024-06-07  1175  	 * While the reading of CH1 takes only 0.16ms, the reading of CH2 and CH3
f87b076b934f72 Dumitru Ceclan   2024-06-07  1176  	 * will take 100ms each.
f87b076b934f72 Dumitru Ceclan   2024-06-07  1177  	 *
f87b076b934f72 Dumitru Ceclan   2024-06-07  1178  	 * This will cause the reading of CH1 to be actually done once every
f87b076b934f72 Dumitru Ceclan   2024-06-07  1179  	 * 200.16ms, an effective rate of 4.99sps.
f87b076b934f72 Dumitru Ceclan   2024-06-07  1180  	 */
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1181  	case IIO_CHAN_INFO_SAMP_FREQ:
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1182  		freq = val * MILLI + val2 / MILLI;
37ae8381ccda3c Dumitru Ceclan   2024-03-06 @1183  		for (i = st->info->odr_start_value; i < st->info->num_sinc5_data_rates - 1; i++)
76a1e6a4280211 Dumitru Ceclan   2024-02-28 @1184  			if (freq >= st->info->sinc5_data_rates[i])
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1185  				break;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1186  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1187  		cfg = &st->channels[chan->address].cfg;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1188  		cfg->odr = i;
182bc496dc63ca Dumitru Ceclan   2024-05-30  1189  		cfg->live = false;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1190  		break;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1191  
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1192  	default:
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1193  		ret = -EINVAL;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1194  		break;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1195  	}
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1196  
a0df9059bd2ef3 Jonathan Cameron 2025-02-02  1197  	iio_device_release_direct(indio_dev);
76a1e6a4280211 Dumitru Ceclan   2024-02-28 @1198  	return ret;
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1199  }
76a1e6a4280211 Dumitru Ceclan   2024-02-28  1200  

:::::: The code at line 1184 was first introduced by commit
:::::: 76a1e6a4280211b1ceffec4f79f96e492c661229 iio: adc: ad7173: add AD7173 driver

:::::: TO: Dumitru Ceclan <mitrutzceclan@gmail.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
