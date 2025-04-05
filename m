Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A581C07DA;
	Sat,  5 Apr 2025 19:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743882779; cv=none; b=PLxpLyTxZApqCnOBHfvlDtGrChsIUz2GZOWvLohQ01MTQnwRTgtEEGK5PfYyNPPhM8JFYr4aaKh4r64+KY7Oj8jUw4YkLP/YT0M73zrMmXGpAq/IQyAMihGTx6igP5HLPVdwnncSdjDbS5JhE+qUL7A2lamds+g2BFpQFkMZA8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743882779; c=relaxed/simple;
	bh=jn/p89ha/vy1d7n/p4tRQPO7YsnGC14s2bcrEYgJhMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2Fi9PaKKjHsCkT+FbrDr3lvSVHv6wzjEiG5XzWVTf3mGViHmuS1VT+SHwJl5pmk6/lTnIePE1seMXRcfLo8F9sOocDoXTrdmq6GlIZozLFrJmxRjoeAKrTySZepThmvyuiyVEohmxOPb7+Sc8i7YGd/cfZWsET5FMN7P3yv/Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aMg2ih6O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aMg2ih6O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743882777; x=1775418777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jn/p89ha/vy1d7n/p4tRQPO7YsnGC14s2bcrEYgJhMU=;
  b=aMg2ih6OuQtyO8bckvsHuF8Wp1v/r6pNyXtvI68Pt3jtNTnWFBxkfCt1
   DIjX77Ud+W3iMTrcF2N3+HCrzuG8t5/QF9OvIplGbuVJYKzCH9eqe4tXd
   UKnsB80ijlT0Qat+Jeb4cjxwAUYlybR3t6hJuuxrK+C+FfDrBjJvn7y37
   mj0zUMYILQCjG/anE/viy4LcjDppKV4R37mMC4AYxF12BdbhyzagvbMGY
   BSoDqjCKjgZj6lXjFXnxBRh1VW64hEl9RlZLjWCRw7tovmbkRXKkfi480
   stQO27nHacJpwRBrvQzcqQelRprbUYBIoxJHvTrvxBVgJyNstDcwnUrqT
   Q==;
X-CSE-ConnectionGUID: f9SEdwRCSwC3MPBCC7+4eg==
X-CSE-MsgGUID: IiQ3FvyxTsGg5j1COj8nuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="44446131"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="44446131"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 12:52:55 -0700
X-CSE-ConnectionGUID: eaO0fSw8TtKF5UD9usjfOg==
X-CSE-MsgGUID: q2JICPZjQEKdis34xrADSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="132304280"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Apr 2025 12:52:54 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u19ZT-0002F1-0i;
	Sat, 05 Apr 2025 19:52:51 +0000
Date: Sun, 6 Apr 2025 03:52:36 +0800
From: kernel test robot <lkp@intel.com>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 06/10] ASoC: tas2764: Crop SDOUT zero-out mask based
 on BCLK ratio
Message-ID: <202504060330.IuaPg3uQ-lkp@intel.com>
References: <20250405-apple-codec-changes-v4-6-d007e46ce4a2@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405-apple-codec-changes-v4-6-d007e46ce4a2@gmail.com>

Hi James,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3a0f0a4355df0240485ed62b6bd6afa5b3e689c5]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Calligeros/ASoC-tas2770-Power-cycle-amp-on-ISENSE-VSENSE-change/20250405-081800
base:   3a0f0a4355df0240485ed62b6bd6afa5b3e689c5
patch link:    https://lore.kernel.org/r/20250405-apple-codec-changes-v4-6-d007e46ce4a2%40gmail.com
patch subject: [PATCH v4 06/10] ASoC: tas2764: Crop SDOUT zero-out mask based on BCLK ratio
config: arm-randconfig-001-20250406 (https://download.01.org/0day-ci/archive/20250406/202504060330.IuaPg3uQ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250406/202504060330.IuaPg3uQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504060330.IuaPg3uQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/tas2764.c:377:16: error: no member named 'sdout_zero_mask' in 'struct tas2764_priv'
     377 |         if (!tas2764->sdout_zero_mask)
         |              ~~~~~~~  ^
   sound/soc/codecs/tas2764.c:380:26: error: no member named 'sdout_zero_mask' in 'struct tas2764_priv'
     380 |         cropped_mask = tas2764->sdout_zero_mask & GENMASK(nsense_slots - 1, 0);
         |                        ~~~~~~~  ^
>> sound/soc/codecs/tas2764.c:383:44: error: use of undeclared identifier 'TAS2764_SDOUT_HIZ_1'
     383 |                 ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
         |                                                          ^
>> sound/soc/codecs/tas2764.c:390:49: error: use of undeclared identifier 'TAS2764_SDOUT_HIZ_9'
     390 |         ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
         |                                                        ^
>> sound/soc/codecs/tas2764.c:391:10: error: use of undeclared identifier 'TAS2764_SDOUT_HIZ_9_FORCE_0_EN'
     391 |                                             TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
         |                                             ^
   sound/soc/codecs/tas2764.c:392:10: error: use of undeclared identifier 'TAS2764_SDOUT_HIZ_9_FORCE_0_EN'
     392 |                                             TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
         |                                             ^
   6 errors generated.


vim +377 sound/soc/codecs/tas2764.c

   369	
   370	static int tas2764_write_sdout_zero_mask(struct tas2764_priv *tas2764, int bclk_ratio)
   371	{
   372		struct snd_soc_component *component = tas2764->component;
   373		int nsense_slots = bclk_ratio / 8;
   374		u32 cropped_mask;
   375		int i, ret;
   376	
 > 377		if (!tas2764->sdout_zero_mask)
   378			return 0;
   379	
 > 380		cropped_mask = tas2764->sdout_zero_mask & GENMASK(nsense_slots - 1, 0);
   381	
   382		for (i = 0; i < 4; i++) {
 > 383			ret = snd_soc_component_write(component, TAS2764_SDOUT_HIZ_1 + i,
   384						      (cropped_mask >> (i * 8)) & 0xff);
   385	
   386			if (ret < 0)
   387				return ret;
   388		}
   389	
 > 390		ret = snd_soc_component_update_bits(component, TAS2764_SDOUT_HIZ_9,
 > 391						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN,
   392						    TAS2764_SDOUT_HIZ_9_FORCE_0_EN);
   393	
   394		if (ret < 0)
   395			return ret;
   396	
   397		return 0;
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
