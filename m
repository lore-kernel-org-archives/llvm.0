Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59199413D94;
	Fri, 15 May 2026 20:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778877888; cv=none; b=Ns0DrbowWEe1jGJnTidINd+9Y7HNcIxCPPiNGLmapWsZzV+mY+KFtiJmwsRuNtQh4mK9Lnh6OCFQ7HlfuwRScnO1LYKEgTq/yDvJ+h//mWVyBjqYNhQlbQ76HhJCCCCQez8XW0K3+r3M8A9uH12bM51GP0UctAh7B1oSRE8S8Qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778877888; c=relaxed/simple;
	bh=c9D75mDsRZE8URzUvIVTHDuWnWp7qVpNXvYhqCLOzqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoFYceveMmcNcRFXKK0cYocQ6EFN+crFqITmPtFyXhJfKsqo5JNIJOsXM1Q6txM6lpqr+pvUdf/pjyk8J6Ug0Jz3nM+B4sLRxfkgaTdYcfUlrs65iVxj6NNJDWVR8fbGnWZnAjPdpICN7u/OHNLTEiwbgwHHu0VqxbChGSApLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D70TD6r8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D70TD6r8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778877886; x=1810413886;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c9D75mDsRZE8URzUvIVTHDuWnWp7qVpNXvYhqCLOzqo=;
  b=D70TD6r8uwbgZpxBHCKUUAIrZWbdGc0ia/m57q+yGn1NbOJm/AVpCv7t
   noo2s877BBZx4t14DcAJt0vseQRzIC9Uds1OxnfHcOxQnybo4OtrnvUOZ
   7O/fi2RDd54YMmXGG9q8L65E8ZPhrP8iKeGyNrjYcrpWSjcVuQacvfiTe
   /HE5xSFNtED9ULYMYnE50x2x3mB+y/IHV8L5vFg3Evv+PTV7dXvtXXfWc
   BVpjJ47XkE6KaBejtGDcOXtt0nPZpALVLwzwCkclWE/mEE5EJ3fnut16W
   YxgbGJP6UsRgTnXyd34Q2QNlOIcsYpEjXziR8mvZCIOoro2xTsWkOSS7E
   g==;
X-CSE-ConnectionGUID: MnRSUa0jTbuusrskvFhGZQ==
X-CSE-MsgGUID: nT4RRK4ERWOgrulfkFIjnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79960371"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79960371"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 13:44:46 -0700
X-CSE-ConnectionGUID: IrIUv9jJSKG9KDhlIHnSLQ==
X-CSE-MsgGUID: GbIFp31ITZmZfOGwdVUhwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="240619779"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2026 13:44:18 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNzOI-000000002iX-3W3r;
	Fri, 15 May 2026 20:44:14 +0000
Date: Sat, 16 May 2026 04:43:51 +0800
From: kernel test robot <lkp@intel.com>
To: jack.yu@realtek.com, broonie@kernel.org, lgirdwood@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, lars@metafoo.de, flove@realtek.com,
	oder_chiou@realtek.com, shumingf@realtek.com,
	derek.fang@realtek.com, Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: rt722-sdca: Add a control to support CAE firmware
 update
Message-ID: <202605160417.WSjswKEf-lkp@intel.com>
References: <20260515091643.3038701-1-jack.yu@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515091643.3038701-1-jack.yu@realtek.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v7.1-rc3 next-20260508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/jack-yu-realtek-com/ASoC-rt722-sdca-Add-a-control-to-support-CAE-firmware-update/20260515-191729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20260515091643.3038701-1-jack.yu%40realtek.com
patch subject: [PATCH] ASoC: rt722-sdca: Add a control to support CAE firmware update
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260516/202605160417.WSjswKEf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160417.WSjswKEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160417.WSjswKEf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/rt722-sdca.c:571:7: error: call to undeclared function 'snd_soc_component_get_bias_level'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     571 |                 if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
         |                     ^
   sound/soc/codecs/rt722-sdca.c:571:7: note: did you mean 'snd_soc_component_set_bias_level'?
   include/sound/soc-component.h:326:5: note: 'snd_soc_component_set_bias_level' declared here
     326 | int snd_soc_component_set_bias_level(struct snd_soc_component *component,
         |     ^
   1 error generated.


vim +/snd_soc_component_get_bias_level +571 sound/soc/codecs/rt722-sdca.c

   555	
   556	static int rt722_cae_update_put(struct snd_kcontrol *kcontrol,
   557					 struct snd_ctl_elem_value *ucontrol)
   558	{
   559		struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
   560		struct rt722_sdca_priv *rt722 = snd_soc_component_get_drvdata(component);
   561		int ret, changed = 0;
   562	
   563		if (!rt722->hw_init)
   564			return 0;
   565	
   566		ret = pm_runtime_resume_and_get(component->dev);
   567		if (ret < 0 && ret != -EACCES)
   568			return ret;
   569	
   570		if (ucontrol->value.integer.value[0]) {
 > 571			if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
   572				ret = rt722_cae_load(rt722);
   573				if (ret)
   574					dev_err(component->dev, "CAE load failed: %d\n", ret);
   575				else
   576					changed = 1;
   577			}
   578		} else {
   579			if (rt722->cae_update_done) {
   580				rt722->cae_update_done = 0;
   581				changed = 1;
   582			}
   583		}
   584	
   585		pm_runtime_mark_last_busy(component->dev);
   586		pm_runtime_put_autosuspend(component->dev);
   587	
   588		return changed;
   589	}
   590	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
