Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0B9375F62;
	Sat, 13 Jun 2026 19:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781379740; cv=none; b=O/Jw6xXo3xeI7Fj9AT+iCVDtRAJwSTOqjVsfcF46CAB+rT2RMcSEZpzRmvj1s9Em+ev0vzdpbpThE1DK2veFJDOggZNE4se0ixVjMblJCh5JSqvRcZbExTUGFNDnWVG8J7MySbZggPncqJr6/iqpNpdkLOZn7nEXRf0Cq5HyZ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781379740; c=relaxed/simple;
	bh=KrXDKI2Z1ZAekyTSIijqlcIvJo1iF4fQszU3QpRyi30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TShp1hqg5PVNGnupRp58V/9vbx2NEV/T4Vzk5wp8K0IEYZu6ypsfi3iOjczpc7h9bGuJH3xqcNOZOu+BMaSUhXD9o1WFTk671b8uD5lKJx+NCBNqPi9sVAPsvFgMQupZtonwL9oa36UWW5/4VzciRa3XPmt3gUeNggIl4A2PVic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESAZ1/Nn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESAZ1/Nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781379738; x=1812915738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KrXDKI2Z1ZAekyTSIijqlcIvJo1iF4fQszU3QpRyi30=;
  b=ESAZ1/NnZ4wz2GpcFLRID6RTRALNSBtI3N/d4GwxDfswuYwNzfjc444S
   BNdDvtO6zONI4tE4I6JSCm+CpIRlk+C1mGYkM7Cmfrd4oCH7KlgMvJ34m
   wufNzsAPgcqHcKLCcivpc+cEEtqMwG8zIf0a3VxOdaLeLVxqwobmrA9nk
   xJ4VPZh4cKgm2pH2Swbe2KzZFb1/fxtWWoM2wQPaYPxN+/JCug8+y0Dlt
   YNdbW5nQSvKvmdzoYjd9hagYIkELy8P0nqWjQc0SlB0Vsggxa2UuLJ2ca
   5EF9qi6GsRS9P3d2iURzGA5nWB/fIeaYhktQ5K7U86YeWnHS1CmKwuTxn
   A==;
X-CSE-ConnectionGUID: MfCB+tebQiOq5C1jo2/6fw==
X-CSE-MsgGUID: Y2LF4W7uRgmCkNATPFRSDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="99598045"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="99598045"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 12:42:18 -0700
X-CSE-ConnectionGUID: 6dMMNkzaT+uppDzt62QZDw==
X-CSE-MsgGUID: Mju455R5QFKXlL75EHQw7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="252041611"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2026 12:42:15 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYUF9-00000000QDu-3V4p;
	Sat, 13 Jun 2026 19:42:11 +0000
Date: Sun, 14 Jun 2026 03:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: abdelnasser hussein <abdelnasserhussein11@gmail.com>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	abdelnasser hussein <abdelnasserhussein11@gmail.com>
Subject: Re: [PATCH] staging: greybus: audio: evaluate sscanf() return value
 directly
Message-ID: <202606140347.gGVWDnbi-lkp@intel.com>
References: <20260613110748.13497-1-abdelnasserhussein11@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260613110748.13497-1-abdelnasserhussein11@gmail.com>

Hi abdelnasser,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/abdelnasser-hussein/staging-greybus-audio-evaluate-sscanf-return-value-directly/20260613-191253
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260613110748.13497-1-abdelnasserhussein11%40gmail.com
patch subject: [PATCH] staging: greybus: audio: evaluate sscanf() return value directly
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260614/202606140347.gGVWDnbi-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606140347.gGVWDnbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140347.gGVWDnbi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/greybus/audio_codec.c:325:13: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     325 |         } else if (w->id == snd_soc_dapm_aif_out) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:334:9: note: uninitialized use occurs here
     334 |         return ret;
         |                ^~~
   drivers/staging/greybus/audio_codec.c:325:9: note: remove the 'if' if its condition is always true
     325 |         } else if (w->id == snd_soc_dapm_aif_out) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_codec.c:302:17: note: initialize the variable 'ret' to silence this warning
     302 |         int dai_id, ret;
         |                        ^
         |                         = 0
   1 warning generated.


vim +325 drivers/staging/greybus/audio_codec.c

6dd67645f22cfe Vaibhav Agarwal     2016-03-29  297  
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  298  int gbaudio_module_update(struct gbaudio_codec_info *codec,
4ffca62a051c3e Vaibhav Agarwal     2016-08-04  299  			  struct snd_soc_dapm_widget *w,
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  300  			  struct gbaudio_module_info *module, int enable)
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  301  {
60e7327d54b270 Vaibhav Agarwal     2016-08-04  302  	int dai_id, ret;
60e7327d54b270 Vaibhav Agarwal     2016-08-04  303  	char intf_name[NAME_SIZE], dir[NAME_SIZE];
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  304  
60e7327d54b270 Vaibhav Agarwal     2016-08-04  305  	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  306  		enable ? "Enable" : "Disable");
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  307  
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04  308  	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
60e7327d54b270 Vaibhav Agarwal     2016-08-04  309  		dev_dbg(codec->dev, "No action required for %s\n", w->name);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  310  		return 0;
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  311  	}
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  312  
60e7327d54b270 Vaibhav Agarwal     2016-08-04  313  	/* parse dai_id from AIF widget's stream_name */
034351c29c6494 abdelnasser hussein 2026-06-13  314  	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
620d28440c10b8 Deepak R Varma      2020-10-22  315  		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
60e7327d54b270 Vaibhav Agarwal     2016-08-04  316  		return -EINVAL;
60e7327d54b270 Vaibhav Agarwal     2016-08-04  317  	}
60e7327d54b270 Vaibhav Agarwal     2016-08-04  318  
aaef32a6cc552d Vaibhav Agarwal     2016-08-04  319  	mutex_lock(&codec->lock);
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04  320  	if (w->id == snd_soc_dapm_aif_in) {
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  321  		if (enable)
60e7327d54b270 Vaibhav Agarwal     2016-08-04  322  			ret = gbaudio_module_enable_tx(codec, module, dai_id);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  323  		else
60e7327d54b270 Vaibhav Agarwal     2016-08-04  324  			ret = gbaudio_module_disable_tx(module, dai_id);
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04 @325  	} else if (w->id == snd_soc_dapm_aif_out) {
094c4302c11889 Vaibhav Agarwal     2016-03-29  326  		if (enable)
60e7327d54b270 Vaibhav Agarwal     2016-08-04  327  			ret = gbaudio_module_enable_rx(codec, module, dai_id);
094c4302c11889 Vaibhav Agarwal     2016-03-29  328  		else
60e7327d54b270 Vaibhav Agarwal     2016-08-04  329  			ret = gbaudio_module_disable_rx(module, dai_id);
094c4302c11889 Vaibhav Agarwal     2016-03-29  330  	}
487dcbd6ba4654 Vaibhav Agarwal     2016-08-04  331  
aaef32a6cc552d Vaibhav Agarwal     2016-08-04  332  	mutex_unlock(&codec->lock);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  333  
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  334  	return ret;
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  335  }
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  336  EXPORT_SYMBOL(gbaudio_module_update);
6dd67645f22cfe Vaibhav Agarwal     2016-03-29  337  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
