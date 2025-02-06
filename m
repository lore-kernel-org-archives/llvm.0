Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C1B226162;
	Thu,  6 Feb 2025 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738835821; cv=none; b=XZ0Iz7qWykrR1rUaM16q745KVk2373/bY/7bl/oiXwgYZcgB4lbywjWFXFM1RLkfpim+eWI6eBbUbM4SxqP7gbdkwzwo9nKR7bs/HxiRE0WRVjngl6fAvN56FcxFMU89rLeazSsajcAyds/dB0uPKeOJXtsn9y8vFxj0nLOocG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738835821; c=relaxed/simple;
	bh=XwOkItQD8+H4xhxNRgEEDZdKUpuOucd+GFhmnEwWa6o=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPF4EvE9z4rzkqpAws3uvnr8u4Xp8XcW2Yp0Ohtq3A5M54xy4xJkR1k7aCYMsgkCJABdhsq2AU8rqNcueh93v/V9yzi1rKhtXTT9l5uTnOHhSTWNpdAv/EOuwBM6q15NwWzIsrQ4vw1oXZY2PnfJi9rS5KEKBgW6kDKW3MLBHWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1CLGoHN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1CLGoHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738835820; x=1770371820;
  h=date:from:cc:subject:message-id:mime-version;
  bh=XwOkItQD8+H4xhxNRgEEDZdKUpuOucd+GFhmnEwWa6o=;
  b=h1CLGoHNXA3pvhHiMmX2K2mMmSYvwD3GUw9dpvmRDMoq125aoJYtskbV
   mVKM2od43GnLnA8hqunEaQ+8FGuGsWZt1ezQJX6S/rRHun2U+fyVVKns8
   a+2k7oKFKjdNUCNw896IDjDYdMjdeMb9OMPBvHf9wRk2TGWltoGy+voky
   qeGHm+qmDVTVtQtuwky7abUqa+2yHmcDdyQZf4ff/nw9+SmWwRKxSTd/w
   ob88bRb+whpe5nRTfWyP9RwfZ28HF/JZeH1WjPeQhdvLm188I430EEasO
   rVTLn+IIbjSt6Os4z8BLFpDs2UHxbVCS23voKX5hIrlwVzNnDQUlBveBu
   Q==;
X-CSE-ConnectionGUID: grCRjvqXTHmE15dX21owzw==
X-CSE-MsgGUID: e30W6rX8Raes1z2QKgBc+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39456525"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39456525"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 01:56:59 -0800
X-CSE-ConnectionGUID: jdxkOVBKS2SV1vgSGKh5vA==
X-CSE-MsgGUID: GpLC+ZsaQIqT1zxwPg4bSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="116146874"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Feb 2025 01:56:57 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfycx-000wiV-0w;
	Thu, 06 Feb 2025 09:56:55 +0000
Date: Thu, 6 Feb 2025 17:55:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 1489/1780] sound/core/pcm_drm_eld.c:318:42:
 warning: arithmetic between different enumeration types ('enum
 cea_audio_coding_types' and 'enum cea_audio_coding_xtypes')
Message-ID: <202502061718.xOBwKElT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   808eb958781e4ebb6e9c0962af2e856767e20f45
commit: 1b0e9d7f76c9bb6bd1a345ef033ae7fe5e77649c [1489/1780] ALSA: hda/hdmi: extract common interface for ELD handling
config: i386-buildonly-randconfig-004-20250206 (https://download.01.org/0day-ci/archive/20250206/202502061718.xOBwKElT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061718.xOBwKElT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502061718.xOBwKElT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/pcm_drm_eld.c:318:42: warning: arithmetic between different enumeration types ('enum cea_audio_coding_types' and 'enum cea_audio_coding_xtypes') [-Wenum-enum-conversion]
     318 |                         a->format += AUDIO_CODING_TYPE_HE_AAC -
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~ ^
     319 |                                      AUDIO_CODING_XTYPE_HE_AAC;
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +318 sound/core/pcm_drm_eld.c

   246	
   247	static void hdmi_update_short_audio_desc(struct device *dev,
   248						 struct snd_cea_sad *a,
   249						 const unsigned char *buf)
   250	{
   251		int i;
   252		int val;
   253	
   254		val = GRAB_BITS(buf, 1, 0, 7);
   255		a->rates = 0;
   256		for (i = 0; i < 7; i++)
   257			if (val & (1 << i))
   258				a->rates |= cea_sampling_frequencies[i + 1];
   259	
   260		a->channels = GRAB_BITS(buf, 0, 0, 3);
   261		a->channels++;
   262	
   263		a->sample_bits = 0;
   264		a->max_bitrate = 0;
   265	
   266		a->format = GRAB_BITS(buf, 0, 3, 4);
   267		switch (a->format) {
   268		case AUDIO_CODING_TYPE_REF_STREAM_HEADER:
   269			dev_info(dev, "HDMI: audio coding type 0 not expected\n");
   270			break;
   271	
   272		case AUDIO_CODING_TYPE_LPCM:
   273			val = GRAB_BITS(buf, 2, 0, 3);
   274			for (i = 0; i < 3; i++)
   275				if (val & (1 << i))
   276					a->sample_bits |= cea_sample_sizes[i + 1];
   277			break;
   278	
   279		case AUDIO_CODING_TYPE_AC3:
   280		case AUDIO_CODING_TYPE_MPEG1:
   281		case AUDIO_CODING_TYPE_MP3:
   282		case AUDIO_CODING_TYPE_MPEG2:
   283		case AUDIO_CODING_TYPE_AACLC:
   284		case AUDIO_CODING_TYPE_DTS:
   285		case AUDIO_CODING_TYPE_ATRAC:
   286			a->max_bitrate = GRAB_BITS(buf, 2, 0, 8);
   287			a->max_bitrate *= 8000;
   288			break;
   289	
   290		case AUDIO_CODING_TYPE_SACD:
   291			break;
   292	
   293		case AUDIO_CODING_TYPE_EAC3:
   294			break;
   295	
   296		case AUDIO_CODING_TYPE_DTS_HD:
   297			break;
   298	
   299		case AUDIO_CODING_TYPE_MLP:
   300			break;
   301	
   302		case AUDIO_CODING_TYPE_DST:
   303			break;
   304	
   305		case AUDIO_CODING_TYPE_WMAPRO:
   306			a->profile = GRAB_BITS(buf, 2, 0, 3);
   307			break;
   308	
   309		case AUDIO_CODING_TYPE_REF_CXT:
   310			a->format = GRAB_BITS(buf, 2, 3, 5);
   311			if (a->format == AUDIO_CODING_XTYPE_HE_REF_CT ||
   312			    a->format >= AUDIO_CODING_XTYPE_FIRST_RESERVED) {
   313				dev_info(dev,
   314					   "HDMI: audio coding xtype %d not expected\n",
   315					   a->format);
   316				a->format = 0;
   317			} else
 > 318				a->format += AUDIO_CODING_TYPE_HE_AAC -
   319					     AUDIO_CODING_XTYPE_HE_AAC;
   320			break;
   321		}
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
