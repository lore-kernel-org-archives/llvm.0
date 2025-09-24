Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3630F328578;
	Wed, 24 Sep 2025 20:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758745469; cv=none; b=WatRO2V5GnnVYemJ4UYKQyxNRX2BWBYlKoF/bwpUUgQoqGAD6PFNJPhxqtI2MwZm6V9Q3abAN+9OAOn7NQJNPhuw4eU3hvZggXZ1iTVXgCVR6aDOzz4bugKJ/09at+my1odt1uMAjXhuuAo0CJo9SiDXERKZBGDFopR4VqOL994=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758745469; c=relaxed/simple;
	bh=flBUgqrKNOGEwefIdPvBIvMyWglR7WH2qJmCa8QRdw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKIBjXs5FstBuOJhA33rfhqlZiniYGtwIqpT3b6t7CbgMjMG+xtR258fNzDo9UkjQ5BIf1jElHCQDdLso8nJtfWwQwjFy96JmuYPXI73/XTGTavYTbG3oxqgw7hQfXnjI1AafuQVwVyV2GQee9AO+ISrzk3pqpzbcOQwZ1+troQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FmSSsEaF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FmSSsEaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758745467; x=1790281467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=flBUgqrKNOGEwefIdPvBIvMyWglR7WH2qJmCa8QRdw8=;
  b=FmSSsEaF+sv3CEcp73tXPWocBp1JdMuUAhD+k5SBPVH2lRjlClhQA6wG
   +duk5Y7Tl9RNoYK8T8NfzgvlHnjPIz3Kb8uDKVN2ZS+VkWcuRkXowc3bL
   /QJb06iycOyt4eIuQ1Gnp6B834vKMi6C8QBQnax+awrmrcBpVpvU3UIHA
   cIJ4pKXiXVAjudJ7dq+gKeXnCCst57cHpy1NHXSQFWjeaZzuDeeDh8SrX
   yhpO6ERsigXx1NflEMNZ4ke7j7LtfofClyZLFUAcYy3Ob4V/1HOXelAOL
   uzAFbWmvUcLm4MYlLbBlXm9wDFaTm3QwdBS8HDSfiO8vLzD5okX9pW77v
   A==;
X-CSE-ConnectionGUID: mc2mVWdDRVOGMG75pr6GDw==
X-CSE-MsgGUID: c6Z756AXQDi8y6CZ6v+psA==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="61106234"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="61106234"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 13:24:26 -0700
X-CSE-ConnectionGUID: DYPbMESTS2ykDgHn600lmg==
X-CSE-MsgGUID: YWobIhYnSjGNsATY751hdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="181403805"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 24 Sep 2025 13:24:21 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1W2E-0004Xd-2J;
	Wed, 24 Sep 2025 20:24:18 +0000
Date: Thu, 25 Sep 2025 04:23:31 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, jic23@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marcelo.schmitt1@gmail.com,
	Sergiu Cuciurean <sergiu.cuciurean@analog.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Axel Haslam <ahaslam@baylibre.com>
Subject: Re: [PATCH v2 6/8] iio: adc: ad4030: Add SPI offload support
Message-ID: <202509250425.p1Sm9XA1-lkp@intel.com>
References: <da55c0ed6fe895dc84e79c8b64e5923a4851e58f.1758214628.git.marcelo.schmitt@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da55c0ed6fe895dc84e79c8b64e5923a4851e58f.1758214628.git.marcelo.schmitt@analog.com>

Hi Marcelo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 561285d048053fec8a3d6d1e3ddc60df11c393a0]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/iio-adc-ad4030-Fix-_scale-value-for-common-mode-channels/20250919-014323
base:   561285d048053fec8a3d6d1e3ddc60df11c393a0
patch link:    https://lore.kernel.org/r/da55c0ed6fe895dc84e79c8b64e5923a4851e58f.1758214628.git.marcelo.schmitt%40analog.com
patch subject: [PATCH v2 6/8] iio: adc: ad4030: Add SPI offload support
config: x86_64-randconfig-077-20250922 (https://download.01.org/0day-ci/archive/20250925/202509250425.p1Sm9XA1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509250425.p1Sm9XA1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509250425.p1Sm9XA1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/adc/ad4030.c:561:20: error: no member named 'offset_ns' in 'struct spi_offload_trigger_periodic'
     561 |                 config->periodic.offset_ns = offload_offset_ns;
         |                 ~~~~~~~~~~~~~~~~ ^
   drivers/iio/adc/ad4030.c:566:28: error: no member named 'offset_ns' in 'struct spi_offload_trigger_periodic'
     566 |         } while (config->periodic.offset_ns < AD4030_TQUIET_CNV_DELAY_NS);
         |                  ~~~~~~~~~~~~~~~~ ^
   2 errors generated.


vim +561 drivers/iio/adc/ad4030.c

   502	
   503	static int __ad4030_set_sampling_freq(struct ad4030_state *st,
   504					      unsigned int freq, unsigned int avg_log2)
   505	{
   506		struct spi_offload_trigger_config *config = &st->offload_trigger_config;
   507		struct pwm_waveform cnv_wf = { };
   508		u64 target = AD4030_TCNVH_NS;
   509		u64 offload_period_ns;
   510		u64 offload_offset_ns;
   511		int ret;
   512	
   513		/*
   514		 * When averaging/oversampling over N samples, we fire the offload
   515		 * trigger once at every N pulses of the CNV signal. Conversely, the CNV
   516		 * signal needs to be N times faster than the offload trigger. Take that
   517		 * into account to correctly re-evaluate both the PWM waveform connected
   518		 * to CNV and the SPI offload trigger.
   519		 */
   520		if (st->mode == AD4030_OUT_DATA_MD_30_AVERAGED_DIFF)
   521			freq <<= avg_log2;
   522	
   523		cnv_wf.period_length_ns = DIV_ROUND_CLOSEST(NSEC_PER_SEC, freq);
   524		/*
   525		 * The datasheet lists a minimum time of 9.8 ns, but no maximum. If the
   526		 * rounded PWM's value is less than 10, increase the target value by 10
   527		 * and attempt to round the waveform again, until the value is at least
   528		 * 10 ns. Use a separate variable to represent the target in case the
   529		 * rounding is severe enough to keep putting the first few results under
   530		 * the minimum 10ns condition checked by the while loop.
   531		 */
   532		do {
   533			cnv_wf.duty_length_ns = target;
   534			ret = pwm_round_waveform_might_sleep(st->cnv_trigger, &cnv_wf);
   535			if (ret)
   536				return ret;
   537			target += AD4030_TCNVH_NS;
   538		} while (cnv_wf.duty_length_ns < AD4030_TCNVH_NS);
   539	
   540		if (!in_range(cnv_wf.period_length_ns, AD4030_TCYC_NS, INT_MAX))
   541			return -EINVAL;
   542	
   543		offload_period_ns = cnv_wf.period_length_ns;
   544		if (st->mode == AD4030_OUT_DATA_MD_30_AVERAGED_DIFF)
   545			offload_period_ns <<= avg_log2;
   546	
   547		config->periodic.frequency_hz =  DIV_ROUND_UP_ULL(NSEC_PER_SEC,
   548								  offload_period_ns);
   549	
   550		/*
   551		 * The hardware does the capture on zone 2 (when SPI trigger PWM
   552		 * is used). This means that the SPI trigger signal should happen at
   553		 * tsync + tquiet_con_delay being tsync the conversion signal period
   554		 * and tquiet_con_delay 9.8ns. Hence set the PWM phase accordingly.
   555		 *
   556		 * The PWM waveform API only supports nanosecond resolution right now,
   557		 * so round this setting to the closest available value.
   558		 */
   559		offload_offset_ns = AD4030_TQUIET_CNV_DELAY_NS;
   560		do {
 > 561			config->periodic.offset_ns = offload_offset_ns;
   562			ret = spi_offload_trigger_validate(st->offload_trigger, config);
   563			if (ret)
   564				return ret;
   565			offload_offset_ns += AD4030_TQUIET_CNV_DELAY_NS;
   566		} while (config->periodic.offset_ns < AD4030_TQUIET_CNV_DELAY_NS);
   567	
   568		st->cnv_wf = cnv_wf;
   569	
   570		return 0;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
