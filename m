Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755051917FB;
	Fri, 11 Oct 2024 04:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728621181; cv=none; b=DMezbhNBDVwb6H1GwXC6IgYDaEExNExGhCXFirMLOwG1XFoEgQUx+Y4Vbz3Sg3twtcj2i4j93KbOVBT5tsccyrA9KCLXum0mV79Vwhof14AKt/mlbFKrZEuDmaCA2DmINT3R8yz+FjzWQTSvfYwfZEzT0MfHLnWdgq3+mQNGZ5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728621181; c=relaxed/simple;
	bh=WPsimNbw3/FLAWkS8kcN9an0/txl+7xFw5VfWVObtaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iuTh2r0Ut0TI3BH3St6WQCwu96qa6ED/U2+OCcLIfyh+NrGd1Zq8kD37Ety5Fvk0cYshwYEER0hUeKlaMqTixrYm7D2xWDtm+88GaNG4qss0CCF43a0psgF58pYOUJxUip6ltMbU03KBcLiQ4B5r3kbmmj60Tu2t5hJp1XlivDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tv1AikhY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tv1AikhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728621179; x=1760157179;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WPsimNbw3/FLAWkS8kcN9an0/txl+7xFw5VfWVObtaw=;
  b=Tv1AikhY8Kox4VOCJL7kxr7ZJaAalqdrO1unoO83Nsx8L4/xg9t+rSgn
   nJHThvh9zKY5xtJPX4nnF2lhLPibD0Ehf1S7wImw7t6cK44gAxuA6HG29
   J49HkrOvwAfAMfDybV5x9+mQwiChFBgNCZkW2njcgNRH+i1acofbcf1nK
   Ony5QnklTPBCuVWBdSp3heUKj9mjOzFczV3SunzSB3ckEknfe+PbvnL7Z
   YxXsobQ8hyQtNXmvNTungHXRQhs6y+j89EhNpbu24iHWsdaZuqP878CgA
   jCCrOo8zsbOyv3d4bpeIEQejimo21uxqvGtAXpupw7kkPGICeIoE/dhVI
   Q==;
X-CSE-ConnectionGUID: 81QeIauiQkKdTRjVix7AmA==
X-CSE-MsgGUID: 6DcJk8tASSaXpZhrN+9Dcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="28101884"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="28101884"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 21:32:59 -0700
X-CSE-ConnectionGUID: xlrxdYeoRVCGPpSXEZMSUQ==
X-CSE-MsgGUID: 18hiwM1BSyycpyc4jLTsYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; 
   d="scan'208";a="81412364"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Oct 2024 21:32:54 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sz7Ke-000BnT-1j;
	Fri, 11 Oct 2024 04:32:52 +0000
Date: Fri, 11 Oct 2024 12:32:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Amoiridis <vassilisamir@gmail.com>, jic23@kernel.org,
	lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, andriy.shevchenko@linux.intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	vassilisamir@gmail.com, ang.iglesiasg@gmail.com,
	linus.walleij@linaro.org, biju.das.jz@bp.renesas.com,
	javier.carrasco.cruz@gmail.com, semen.protsenko@linaro.org,
	579lpy@gmail.com, ak@it-klinger.de, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v8 1/4] iio: pressure: bmp280: Use sleep and forced mode
 for oneshot captures
Message-ID: <202410111221.YIeXHxOv-lkp@intel.com>
References: <20241007194945.66192-2-vassilisamir@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007194945.66192-2-vassilisamir@gmail.com>

Hi Vasileios,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 96be67caa0f0420d4128cb67f07bbd7a6f49e03a]

url:    https://github.com/intel-lab-lkp/linux/commits/Vasileios-Amoiridis/iio-pressure-bmp280-Use-sleep-and-forced-mode-for-oneshot-captures/20241008-035238
base:   96be67caa0f0420d4128cb67f07bbd7a6f49e03a
patch link:    https://lore.kernel.org/r/20241007194945.66192-2-vassilisamir%40gmail.com
patch subject: [PATCH v8 1/4] iio: pressure: bmp280: Use sleep and forced mode for oneshot captures
config: i386-randconfig-006-20241011 (https://download.01.org/0day-ci/archive/20241011/202410111221.YIeXHxOv-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410111221.YIeXHxOv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410111221.YIeXHxOv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/pressure/bmp280-core.c:1051:3: warning: variable 'meas_time_us' is uninitialized when used here [-Wuninitialized]
    1051 |                 meas_time_us += BMP280_PRESS_HUMID_MEAS_OFFSET +
         |                 ^~~~~~~~~~~~
   drivers/iio/pressure/bmp280-core.c:1046:32: note: initialize the variable 'meas_time_us' to silence this warning
    1046 |         unsigned int reg, meas_time_us;
         |                                       ^
         |                                        = 0
   drivers/iio/pressure/bmp280-core.c:2452:2: warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
    2452 |         offset += sizeof(s32);
         |         ^~~~~~
   drivers/iio/pressure/bmp280-core.c:2437:17: note: initialize the variable 'offset' to silence this warning
    2437 |         int ret, offset;
         |                        ^
         |                         = 0
   2 warnings generated.


vim +/meas_time_us +1051 drivers/iio/pressure/bmp280-core.c

  1043	
  1044	static int bmp280_wait_conv(struct bmp280_data *data)
  1045	{
  1046		unsigned int reg, meas_time_us;
  1047		int ret;
  1048	
  1049		/* Check if we are using a BME280 device */
  1050		if (data->oversampling_humid)
> 1051			meas_time_us += BMP280_PRESS_HUMID_MEAS_OFFSET +
  1052					BIT(data->oversampling_humid) * BMP280_MEAS_DUR;
  1053	
  1054		/* Pressure measurement time */
  1055		meas_time_us += BMP280_PRESS_HUMID_MEAS_OFFSET +
  1056				BIT(data->oversampling_press) * BMP280_MEAS_DUR;
  1057	
  1058		/* Temperature measurement time */
  1059		meas_time_us += BIT(data->oversampling_temp) * BMP280_MEAS_DUR;
  1060	
  1061		/* Waiting time according to the BM(P/E)2 Sensor API */
  1062		fsleep(meas_time_us);
  1063	
  1064		ret = regmap_read(data->regmap, BMP280_REG_STATUS, &reg);
  1065		if (ret) {
  1066			dev_err(data->dev, "failed to read status register.\n");
  1067			return ret;
  1068		}
  1069	
  1070		if (reg & BMP280_REG_STATUS_MEAS_BIT) {
  1071			dev_err(data->dev, "Measurement cycle didn't complete.\n");
  1072			return -EBUSY;
  1073		}
  1074	
  1075		return 0;
  1076	}
  1077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
