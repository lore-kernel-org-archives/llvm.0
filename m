Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCF5155C8E;
	Thu,  8 Aug 2024 22:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155470; cv=none; b=WikIh+c7DS4QDkIeTPDJm5aRZh0EgUflHeHnjq967qrV07mgm2j5LCOZgNSD5Tohk5JEhywDWX35WqfVfrIjry9VmhlunqnGTg/oKIuUS0Vau9VL1t9b0D+CkzQxtgPMKjtakXmShktG4GPs+xQnTl2BMoEl7hZl+iQv52OSxdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155470; c=relaxed/simple;
	bh=IMOYnJQGDlZxOfjjWcL78ah825a4ZixqHX1gxvBkpog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOt0iDgy4GKT8Ur9JXU0r7lnHcWA2ejwHD1NyRrFzqlsbKzg5NOplngjx+AuPXC620ze2Bk8wcHlURgih7dMnu5Ri2cyl8i5o9Do9ztB88xOYYSs7zaNqdwgZOa09J7JvsQXgiDUnW9fuih6LlvVzQxN+T4iHYS15wym0bCgs8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HH0N/Sb2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HH0N/Sb2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723155469; x=1754691469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IMOYnJQGDlZxOfjjWcL78ah825a4ZixqHX1gxvBkpog=;
  b=HH0N/Sb2pp4UCkJIzOgpcLXefFyXSKgj5l7gVvvHjKxZRAT8HHm0+NyW
   FrodOfEJs7VjTWiRagnVAsMXhDAIEvtfvcAmnpRG/puRKyfAiEluiEa4g
   GgsarNWu13iHRCQCCQehyssk+d4hmp9vZ8wXW5AWMUb1vT3p7KeIQET3+
   xWsU739kSmVvANBkQW4e8pzI6UPuhZNoisLrG9d2RzQO3wW5nW1xmqPzs
   agfjRgtNruZttBvqTCQ3WibqSWyI2P+KLyZpK40ZOXdjt5d07sgllPCdx
   K6UdHX4FN/FMoMHL692agangCKzNx1P39E44PDuVuV+lcKyCAGFEbIXeX
   A==;
X-CSE-ConnectionGUID: V4nxsJZSTE6FzkTCXNwy1g==
X-CSE-MsgGUID: wUbwDjTVTxO8Hm5y2+YSCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="43827899"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="43827899"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 15:17:47 -0700
X-CSE-ConnectionGUID: Flx4yJtPQIGIrgg21KSXow==
X-CSE-MsgGUID: 7kCWkeLuTNS4db+3d489ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="57604308"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 08 Aug 2024 15:17:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scBS2-0006Z2-23;
	Thu, 08 Aug 2024 22:17:42 +0000
Date: Fri, 9 Aug 2024 06:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>
Subject: [tiwai-sound:for-next 32/83] sound/pcmcia/vx/vxpocket.c:208:8:
 error: no member named 'dev' in 'struct vx_core'
Message-ID: <202408090607.58bm8VK5-lkp@intel.com>
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
commit: b426b3ba9f6fe17990893c5324727dd217d420b6 [32/83] ALSA: vx_core: Drop unused dev field
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240809/202408090607.58bm8VK5-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090607.58bm8VK5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408090607.58bm8VK5-lkp@intel.com/

Note: the tiwai-sound/for-next HEAD c46fc83e3f3c89f18962e43890de90b1c304747a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> sound/pcmcia/vx/vxpocket.c:208:8: error: no member named 'dev' in 'struct vx_core'
     208 |         chip->dev = &link->dev;
         |         ~~~~  ^
   1 error generated.


vim +208 sound/pcmcia/vx/vxpocket.c

6d00a3127972e7 Takashi Iwai      2005-06-30  170  
6d00a3127972e7 Takashi Iwai      2005-06-30  171  
6d00a3127972e7 Takashi Iwai      2005-06-30  172  /*
6d00a3127972e7 Takashi Iwai      2005-06-30  173   * configuration callback
6d00a3127972e7 Takashi Iwai      2005-06-30  174   */
6d00a3127972e7 Takashi Iwai      2005-06-30  175  
15b99ac1729503 Dominik Brodowski 2006-03-31  176  static int vxpocket_config(struct pcmcia_device *link)
6d00a3127972e7 Takashi Iwai      2005-06-30  177  {
af26367f69a474 Takashi Iwai      2005-11-17  178  	struct vx_core *chip = link->priv;
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  179  	int ret;
6d00a3127972e7 Takashi Iwai      2005-06-30  180  
6d00a3127972e7 Takashi Iwai      2005-06-30  181  	snd_printdd(KERN_DEBUG "vxpocket_config called\n");
6d00a3127972e7 Takashi Iwai      2005-06-30  182  
6d00a3127972e7 Takashi Iwai      2005-06-30  183  	/* redefine hardware record according to the VERSION1 string */
af2b3b503ad1b0 Dominik Brodowski 2006-10-25  184  	if (!strcmp(link->prod_id[1], "VX-POCKET")) {
6d00a3127972e7 Takashi Iwai      2005-06-30  185  		snd_printdd("VX-pocket is detected\n");
6d00a3127972e7 Takashi Iwai      2005-06-30  186  	} else {
6d00a3127972e7 Takashi Iwai      2005-06-30  187  		snd_printdd("VX-pocket 440 is detected\n");
6d00a3127972e7 Takashi Iwai      2005-06-30  188  		/* overwrite the hardware information */
6d00a3127972e7 Takashi Iwai      2005-06-30  189  		chip->hw = &vxp440_hw;
6d00a3127972e7 Takashi Iwai      2005-06-30  190  		chip->type = vxp440_hw.type;
6d00a3127972e7 Takashi Iwai      2005-06-30  191  		strcpy(chip->card->driver, vxp440_hw.name);
6d00a3127972e7 Takashi Iwai      2005-06-30  192  	}
6d00a3127972e7 Takashi Iwai      2005-06-30  193  
90abdc3b973229 Dominik Brodowski 2010-07-24  194  	ret = pcmcia_request_io(link);
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  195  	if (ret)
db0a5214b8d6cc Takashi Iwai      2014-09-09  196  		goto failed_preirq;
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  197  
db0a5214b8d6cc Takashi Iwai      2014-09-09  198  	ret = request_threaded_irq(link->irq, snd_vx_irq_handler,
db0a5214b8d6cc Takashi Iwai      2014-09-09  199  				   snd_vx_threaded_irq_handler,
db0a5214b8d6cc Takashi Iwai      2014-09-09  200  				   IRQF_SHARED, link->devname, link->priv);
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  201  	if (ret)
db0a5214b8d6cc Takashi Iwai      2014-09-09  202  		goto failed_preirq;
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  203  
1ac71e5a35eebe Dominik Brodowski 2010-07-29  204  	ret = pcmcia_enable_device(link);
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  205  	if (ret)
7c5af6ffd69bb2 Dominik Brodowski 2009-10-24  206  		goto failed;
6d00a3127972e7 Takashi Iwai      2005-06-30  207  
dd2e5a156525f1 Dominik Brodowski 2009-11-03 @208  	chip->dev = &link->dev;
6d00a3127972e7 Takashi Iwai      2005-06-30  209  
9a017a910346af Dominik Brodowski 2010-07-24  210  	if (snd_vxpocket_assign_resources(chip, link->resource[0]->start,
9a017a910346af Dominik Brodowski 2010-07-24  211  						link->irq) < 0)
6d00a3127972e7 Takashi Iwai      2005-06-30  212  		goto failed;
6d00a3127972e7 Takashi Iwai      2005-06-30  213  
79ca4f3f625e14 Takashi Iwai      2006-04-12  214  	return 0;
6d00a3127972e7 Takashi Iwai      2005-06-30  215  
6d00a3127972e7 Takashi Iwai      2005-06-30  216   failed:
db0a5214b8d6cc Takashi Iwai      2014-09-09  217  	free_irq(link->irq, link->priv);
db0a5214b8d6cc Takashi Iwai      2014-09-09  218  failed_preirq:
fba395eee7d3f3 Dominik Brodowski 2006-03-31  219  	pcmcia_disable_device(link);
15b99ac1729503 Dominik Brodowski 2006-03-31  220  	return -ENODEV;
6d00a3127972e7 Takashi Iwai      2005-06-30  221  }
6d00a3127972e7 Takashi Iwai      2005-06-30  222  

:::::: The code at line 208 was first introduced by commit
:::::: dd2e5a156525f11754d9b1e0583f6bb49c253d62 pcmcia: remove deprecated handle_to_dev() macro

:::::: TO: Dominik Brodowski <linux@dominikbrodowski.net>
:::::: CC: Dominik Brodowski <linux@dominikbrodowski.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
