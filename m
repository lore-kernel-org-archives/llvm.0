Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2DA38B;
	Sat, 20 Apr 2024 00:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713573380; cv=none; b=CLRDhO+jCjkbKpPKG7UrhTBJYpmIlo+GO2KoMKs+kWA9QxMZ9+5nBc6+uMJa8s/dJRSNhkbJv7zo5Fe8CY/HWvJDXPAbKDBZ8Glfth0NBvDTzpzU32+DUkD4J9mJJ2l0SU3uLqpcqyKUmPrm3cnuzBpz8Ffn+0ZRkftI8cEVa44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713573380; c=relaxed/simple;
	bh=adroiXsVs79FpRa83a3I9kMT/edKYfdAupWkdkWbHbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZApJITCxWe5c1+1omSm+hfoY4a4EsxGmf7w4nt0wgOfnb4EhcAF0VHkw9IDDA4wAXxDoiEtfL4+ptLcY09QQEGodSEZLVUieZxG4vRh8aIwQ4jnANzVxPBX+4z16dTjPh9ZWvLqcDYDXQ20J4G9rE3SB2GeRCfZYQSjYRBUK7jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwIK7d7F; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwIK7d7F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713573379; x=1745109379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=adroiXsVs79FpRa83a3I9kMT/edKYfdAupWkdkWbHbI=;
  b=YwIK7d7FHAURKnF6WCdbIKmkzC2vKqfDsL7fe1ZwFrxVeoI7zXjbuzuv
   BeJ8fPfT8Re4oyTgfyLD6pEVTZtOty+4JLopWXmXdvoTbwJX1aXldfBfi
   CIym1x8AJHteVuEV5ccDaM3QN9TaK4hcmYtxtjACBJQa9Ba7fazMtINei
   V68TGabVdeq4q/iRZSoyCRVhQJnUmlVi/7dxgkSS4R/0xrcyE0xLr4xjV
   w0IAd5Tk7A496+QwSYT2TjYJW3GJsRFcjPZt7Va8eHoclJv3zKISOtlD/
   OZPhgy6HKvpsGvDHa4qLhh5wJ+gVZx9ojD1SnuSiXmuqf7J6k1pogANgH
   w==;
X-CSE-ConnectionGUID: VSQwgsftSSGWbdtiRwaNLw==
X-CSE-MsgGUID: yXq2ydRwROmhrmiIpMW0uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9114251"
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="9114251"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 17:36:18 -0700
X-CSE-ConnectionGUID: B9zqgS3SSeuvqwAywk9lag==
X-CSE-MsgGUID: H/C8eYBvQ3OPqPOd6QmliA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,215,1708416000"; 
   d="scan'208";a="23546753"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Apr 2024 17:36:16 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxyiD-000AbM-0u;
	Sat, 20 Apr 2024 00:36:13 +0000
Date: Sat, 20 Apr 2024 08:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: srinivas.kandagatla@linaro.org, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, perex@perex.cz,
	tiwai@suse.com, lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, steev@kali.org,
	jenneron@postmarketos.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH 2/4] ASoC: qcom: common: add Display port Jack function
Message-ID: <202404200809.tfVSiQo5-lkp@intel.com>
References: <20240419150140.92527-3-srinivas.kandagatla@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240419150140.92527-3-srinivas.kandagatla@linaro.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.9-rc4 next-20240419]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/srinivas-kandagatla-linaro-org/ASoC-qcom-q6dsp-parse-Display-port-tokens/20240419-230514
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240419150140.92527-3-srinivas.kandagatla%40linaro.org
patch subject: [PATCH 2/4] ASoC: qcom: common: add Display port Jack function
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240420/202404200809.tfVSiQo5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200809.tfVSiQo5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200809.tfVSiQo5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/common.c:250:22: warning: unused variable 'cpu_dai' [-Wunused-variable]
           struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
                               ^
   1 warning generated.


vim +/cpu_dai +250 sound/soc/qcom/common.c

   246	
   247	int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
   248				   struct snd_soc_jack *hdmi_jack, int hdmi_pcm_id)
   249	{
 > 250		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
