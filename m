Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E656184;
	Sun, 19 Jan 2025 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737293810; cv=none; b=ZsFaklBEvMCm8sUabvtL9/8S2nXJYZL5Y850pzifzkXaF4FBxLfecV51ZjYsCtLWxbElDjSVsPKXX1o0ZnECIqcTzbioOBKHKcIp2gBMlM1R9e3/35oDdj33yFijuHO9fyYaB+giEURaicyBaiCMgwEu/l6WcMtWHFzirRTtTRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737293810; c=relaxed/simple;
	bh=rp2zxmK7qT7G2nJZhbsisz5AiYOdSAk6sWo+oRoq+uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lMlunRjavTuhS6/jqwr67on7tsnnqt83yJ0MJbKboyqoMf3Pl+e/cZYONDSmRf06NgDyXSRKxvKhNK8a85fyZD763nQidfL54nTkHt2Nhvp1rLHRjaC64QwqkYHfUN6HC3AkYi0tnUOjqUVmnfFdNIoia9AhL+nhSfgAXHuPQ44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYdblQvP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYdblQvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737293807; x=1768829807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rp2zxmK7qT7G2nJZhbsisz5AiYOdSAk6sWo+oRoq+uw=;
  b=eYdblQvPmMNuTYJ37+/x1i2NKqRh/hJEwgbBhf6AL0grkdiHtJHG+/G+
   lU9xqa1bk86XxShRmwuRuljP6BMWCWIcg2o1iKVOd5sp+Srslr7NHGRdN
   7rM8doLlpqVdoFa1f6Bx+teNQA9GXywX/ZQk+AXReFanWi4cwJBdCjV5G
   nG3xdl2dP0xnoEYuVv+eFM5SrwojTGo35gii/LQX3tdFY3i9zsPdBVY62
   0v2liW+aUxBeeYY3fKGo0aVIeKCXq1Oaf6T8po46uhcus7KA4UqRA1Ifd
   H8LQl/pNzRctHX6CzV2w7P+x7lZlKVBynfB6XultCjuxSd4El4n/oEGGK
   w==;
X-CSE-ConnectionGUID: uSw/oo76Tci+YwcyjEqrrg==
X-CSE-MsgGUID: Ll861h9UT9GI3sOsYahFbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="41427871"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="41427871"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 05:36:46 -0800
X-CSE-ConnectionGUID: jflZGsDaQtaT8+8nr/XkGg==
X-CSE-MsgGUID: 8BxCOC04RKWT6jIzw8aPfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106692499"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2025 05:36:45 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZVTm-000VUJ-0L;
	Sun, 19 Jan 2025 13:36:42 +0000
Date: Sun, 19 Jan 2025 21:35:52 +0800
From: kernel test robot <lkp@intel.com>
To: "Geoffrey D. Bennett" <g@b4.vu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 50/52] sound/usb/fcp.c:889:15: error:
 incompatible function pointer types assigning to 'long (*)(struct snd_hwdep
 *, char *, long, loff_t *)' (aka 'long (*)(struct snd_hwdep *, char *, long,
 long long *)') from 'ssize_t (struct snd_hwdep *, char *, ssize_t, loff...
Message-ID: <202501192122.ngosycnT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   dd85bbb7fc482b5cdb78f8b5e8f9ef7a3919d6ef
commit: 46757a3e7d50dac923888e7fbe68377736f13c70 [50/52] ALSA: FCP: Add Focusrite Control Protocol driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250119/202501192122.ngosycnT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project c23f2417dc5f6dc371afb07af5627ec2a9d373a0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501192122.ngosycnT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501192122.ngosycnT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/usb/fcp.c:889:15: error: incompatible function pointer types assigning to 'long (*)(struct snd_hwdep *, char *, long, loff_t *)' (aka 'long (*)(struct snd_hwdep *, char *, long, long long *)') from 'ssize_t (struct snd_hwdep *, char *, ssize_t, loff_t *)' (aka 'int (struct snd_hwdep *, char *, int, long long *)') [-Wincompatible-function-pointer-types]
     889 |         hw->ops.read = fcp_hwdep_read;
         |                      ^ ~~~~~~~~~~~~~~
   1 error generated.


vim +889 sound/usb/fcp.c

   874	
   875	static int fcp_hwdep_init(struct usb_mixer_interface *mixer)
   876	{
   877		struct snd_hwdep *hw;
   878		int err;
   879	
   880		err = snd_hwdep_new(mixer->chip->card, "Focusrite Control", 0, &hw);
   881		if (err < 0)
   882			return err;
   883	
   884		hw->private_data = mixer;
   885		hw->exclusive = 1;
   886		hw->ops.open = fcp_hwdep_open;
   887		hw->ops.ioctl = fcp_hwdep_ioctl;
   888		hw->ops.ioctl_compat = fcp_hwdep_ioctl;
 > 889		hw->ops.read = fcp_hwdep_read;
   890		hw->ops.poll = fcp_hwdep_poll;
   891		hw->ops.release = fcp_hwdep_release;
   892	
   893		return 0;
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
