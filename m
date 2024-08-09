Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF5E79F5;
	Fri,  9 Aug 2024 00:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723162906; cv=none; b=dUpxe1fs8mpiV8mDNnlV2VU74bfKaex2kLAU+1AM5vzgNM3K6isYvHYjzyqnLaM9BQ07YKKnkegXZmot5w1AhvvET2QRd0HtGsQF/y+PBopRpcl3gp5Vq51P03USG7TXNrg8dageR1ygsQeRV9mglpq2C7z6Unez9ui/IFPJoPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723162906; c=relaxed/simple;
	bh=bMznVnDMGvYpVK4JpHzlDbtBreyy9F5i3xs/YZaXzmc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2DFXZMCGm9rLlMsPBsL25euszHw+5aDeh+/4RdQVU+Wrlli9xmWOXam/Oh9vjOEbfjYftdLzwx0faVqO3UaEJDCuI9HmCEFIowWPvQhuEuv/ZlQwgJzpMd52eHBQFNJkHGFovYmSLlzzJ//6NZaSN60CwdTgLcwOeHHcrhjabI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bg8PDjmA; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bg8PDjmA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723162905; x=1754698905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMznVnDMGvYpVK4JpHzlDbtBreyy9F5i3xs/YZaXzmc=;
  b=Bg8PDjmAcExUQpA2r7v2NZOnukkcQ588SoM08mZAVzZrqbEcrGCm7Iaw
   7zYCf7liaVgFXZGCfi9c1H+WRUZb9BisQWKB1XvExfDpxf7t6qGis4c22
   cDPiGwSt0aEFIlfXxqc9qC5N5xD7sXXCG0dCj3U56bFlCPfhfgfhKTiWN
   71TrykJUSuqibBOf19CBQwlvZc4dfy8AS5ontWOUfgjXb0OmVHYg20yJU
   yzwGhQ/BarJBBGoj8tP/soOb27D1iA8lPArQLiFhyAMqRq7/pZ/Ah/Kie
   6fgaViNDJTIWMK4/6Pa6xQtU+/IOnirR3FQ6/8brVjT3akAeU6n+XXK1V
   g==;
X-CSE-ConnectionGUID: T/IUDMW7TB+n5Jk41V3ADw==
X-CSE-MsgGUID: eEMPdJkhSR2ncAly9DsWfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21180457"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21180457"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:21:45 -0700
X-CSE-ConnectionGUID: 712Tz4NlRR+W/+TcQ7JXig==
X-CSE-MsgGUID: 0YZY4I9LQiCuW72BMq9psg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62035655"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 08 Aug 2024 17:21:43 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scDNp-0006fo-2K;
	Fri, 09 Aug 2024 00:21:33 +0000
Date: Fri, 9 Aug 2024 08:20:25 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 69/83] sound/pcmcia/vx/vxpocket.c:273:12:
 error: use of undeclared identifier 'pdev'; did you mean 'p_dev'?
Message-ID: <202408090809.TAYiyrqJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   c46fc83e3f3c89f18962e43890de90b1c304747a
commit: 2acbb5e57230830016e0fb2d61886e7a8c7f59ce [69/83] ALSA: vxpocket: Use standard print API
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240809/202408090809.TAYiyrqJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090809.TAYiyrqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090809.TAYiyrqJ-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD c46fc83e3f3c89f18962e43890de90b1c304747a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   sound/pcmcia/vx/vxpocket.c:207:8: error: no member named 'dev' in 'struct vx_core'
     207 |         chip->dev = &link->dev;
         |         ~~~~  ^
>> sound/pcmcia/vx/vxpocket.c:273:12: error: use of undeclared identifier 'pdev'; did you mean 'p_dev'?
     273 |                 dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
         |                          ^~~~
         |                          p_dev
   include/linux/dev_printk.h:154:44: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                   ^
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                         ^
   sound/pcmcia/vx/vxpocket.c:251:49: note: 'p_dev' declared here
     251 | static int vxpocket_probe(struct pcmcia_device *p_dev)
         |                                                 ^
   2 errors generated.


vim +273 sound/pcmcia/vx/vxpocket.c

   247	
   248	
   249	/*
   250	 */
   251	static int vxpocket_probe(struct pcmcia_device *p_dev)
   252	{
   253		struct snd_card *card;
   254		struct snd_vxpocket *vxp;
   255		int i, err;
   256	
   257		/* find an empty slot from the card list */
   258		for (i = 0; i < SNDRV_CARDS; i++) {
   259			if (!(card_alloc & (1 << i)))
   260				break;
   261		}
   262		if (i >= SNDRV_CARDS) {
   263			dev_err(&p_dev->dev, "vxpocket: too many cards found\n");
   264			return -EINVAL;
   265		}
   266		if (! enable[i])
   267			return -ENODEV; /* disabled explicitly */
   268	
   269		/* ok, create a card instance */
   270		err = snd_card_new(&p_dev->dev, index[i], id[i], THIS_MODULE,
   271				   0, &card);
   272		if (err < 0) {
 > 273			dev_err(&pdev->dev, "vxpocket: cannot create a card instance\n");
   274			return err;
   275		}
   276	
   277		err = snd_vxpocket_new(card, ibl[i], p_dev, &vxp);
   278		if (err < 0) {
   279			snd_card_free(card);
   280			return err;
   281		}
   282		card->private_data = vxp;
   283	
   284		vxp->index = i;
   285		card_alloc |= 1 << i;
   286	
   287		vxp->p_dev = p_dev;
   288	
   289		return vxpocket_config(p_dev);
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
