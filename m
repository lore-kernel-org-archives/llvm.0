Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A172C182;
	Thu, 15 Aug 2024 04:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723695600; cv=none; b=H6jlTuxSvc0vuOrXtY39JRmUixe8/vhIo+ooEbgiadWikMizn6n6Li+oWPcCsC238X/a80hAarKOB16LDhupP6TwPq2cdxMf45btqCnm0+NmmjZC2YNUe8MLEWT7MfJqNH7VbOgCRTD0yU8qqqB3uKMFQQ7y3hreC1lOX43dREU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723695600; c=relaxed/simple;
	bh=6Isv9TeElQrkCl2wLZdIZV0/D+zvkAUMoUvGVsAW1eM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBhD+lJsEKePV0nDT0hEq2Ks5k4lz21oNf2s9Sc83rUo5wV5ixdEIwvrnf8olQLvSawOc1CypZ0H9CGuo7u5nHqR5vJEFRd8PwFw5qiuVsCTG70Tzb4WRrv0X9fpWnJfLSbibplAZdUUHbnWvWc4jx5LSUzkc4pYrbF1gH9LKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dTCMdSrL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dTCMdSrL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723695598; x=1755231598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6Isv9TeElQrkCl2wLZdIZV0/D+zvkAUMoUvGVsAW1eM=;
  b=dTCMdSrLxuDmLsq1yi2N0pI8eV4Kai+qdM5Zk10RH4J8zpIhNIGMvPCc
   UaIuyLKP9Sc5kscNtdwXdHO76Yc+UsNsXPuGML5xpwVSvg4b8LabfHpCH
   QCTTf4UbwlgO0Ln5exxVwFCF/toLEPjRYHIJ8PegKxxeiQwhJnGf5Gpbq
   BBOXiJYXDDEYS8Ex0ctlXqmI9T12Tw0ViqOU6Q73A3UdqivV63o5ixocA
   3OmTj/U5/3n5Ij6qq2X8dCWOwkEBy1ObHPQlZidkNF3hBF2LcqCNZDft3
   JDpA1TkZVWxm97Qiiy/JO9zI61pPZV7VtW5zayqo2VT2iK1GERbAvhRFI
   w==;
X-CSE-ConnectionGUID: djmr4LQJRamXd40r3zvV3g==
X-CSE-MsgGUID: q/aV4TUdT/StE6vQXmEryQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21814121"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="21814121"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 21:19:57 -0700
X-CSE-ConnectionGUID: Q+IpTbFESY+dOtxrcH/MtQ==
X-CSE-MsgGUID: AVh7NCqrThOB/s8BN1RxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="59255426"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2024 21:19:54 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seRxo-0003BK-1s;
	Thu, 15 Aug 2024 04:19:52 +0000
Date: Thu, 15 Aug 2024 12:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
Message-ID: <202408151223.etnjDl4b-lkp@intel.com>
References: <20240813052609.56527-2-kiseok.jo@irondevice.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813052609.56527-2-kiseok.jo@irondevice.com>

Hi Kiseok,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.11-rc3 next-20240814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kiseok-Jo/ASoC-sma1307-Add-driver-for-Iron-Device-SMA1307/20240815-001157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240813052609.56527-2-kiseok.jo%40irondevice.com
patch subject: [PATCH 1/2] ASoC: sma1307: Add driver for Iron Device SMA1307
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240815/202408151223.etnjDl4b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408151223.etnjDl4b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408151223.etnjDl4b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/sma1307.c:2191:2: warning: switch condition has boolean value [-Wswitch-bool]
    2191 |         switch (sma1307->amp_set) {
         |         ^       ~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2191 sound/soc/codecs/sma1307.c

  2159	
  2160	static void sma1307_reset(struct snd_soc_component *component)
  2161	{
  2162		struct sma1307_priv *sma1307 = snd_soc_component_get_drvdata(component);
  2163		int ret = 0;
  2164		unsigned int status = 0;
  2165	
  2166		dev_dbg(sma1307->dev, "%s: Reset start\n", __func__);
  2167		ret = sma1307_regmap_read(sma1307, SMA1307_FF_DEVICE_INDEX, &status);
  2168	
  2169		if (ret != 0)
  2170			dev_err(sma1307->dev,
  2171				"%s: failed to read SMA1307_FF_DEVICE_INDEX : %d\n",
  2172				__func__, ret);
  2173		else {
  2174			sma1307->rev_num = status & SMA1307_REV_NUM_STATUS;
  2175			dev_dbg(component->dev,
  2176				 "%s: SMA1307 Revision %d\n",
  2177				 __func__, sma1307->rev_num);
  2178		}
  2179	
  2180		sma1307_regmap_read(sma1307, SMA1307_99_OTP_TRM2, &sma1307->otp_trm2);
  2181		sma1307_regmap_read(sma1307, SMA1307_9A_OTP_TRM3, &sma1307->otp_trm3);
  2182	
  2183		if ((sma1307->otp_trm2 & SMA1307_OTP_STAT_MASK) == SMA1307_OTP_STAT_1)
  2184			dev_dbg(component->dev, "%s: SMA1307 OTP Status Successful\n",
  2185				 __func__);
  2186		else
  2187			dev_dbg(component->dev, "%s: SMA1307 OTP Status Fail\n",
  2188				 __func__);
  2189	
  2190		/* Register Initial Value Setting */
> 2191		switch (sma1307->amp_set) {
  2192		case SMA1307_DEFAULT_SET:
  2193			sma1307_set_default(component);
  2194			break;
  2195		case SMA1307_BINARY_FILE_SET:
  2196			sma1307_setting_loaded(sma1307, setting_file);
  2197			if (sma1307->set.status) {
  2198				sma1307_set_binary(component);
  2199			} else {
  2200				sma1307->force_mute_status = true;
  2201				sma1307_set_default(component);
  2202			}
  2203			break;
  2204		}
  2205		sma1307_regmap_update_bits(sma1307,
  2206					   SMA1307_93_INT_CTRL,
  2207					   SMA1307_DIS_INT_MASK, SMA1307_HIGH_Z_INT);
  2208		sma1307_regmap_write(sma1307, SMA1307_0A_SPK_VOL, sma1307->init_vol);
  2209	}
  2210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
