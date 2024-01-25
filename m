Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CAF7EC;
	Thu, 25 Jan 2024 22:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706221827; cv=none; b=RNh9VdbxJpwOekQee3phf3JOfPH2mfQGsjqM0xMIX9LnVDCVBazuZQ0hvboAX9UnQcBbemQEmyAso+rRbZsHP93cPcJaY6SielVfjkg2AuQwMNJY15wTz5is2Ezchh5cerT8NoN/6wMh/8M6ehd4oqUJiL+ZWt7fLAmh0XBQKmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706221827; c=relaxed/simple;
	bh=o+K8/I7KsjMILeiYonhcP/n00EIdVaQPmHILADXMNQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzVdlwGD5n0AGkEt2Zh6H/0Ns4riZmrEHyNa7GrJzRQfEqf5PbQyx9y5ouXdf4S1fIaj8FZALty3QzP9buCya5moCwlYGo74mXQV2KucU4xVzJ68YKSlH6Pt9csoYsSE7XjJGH01g90QaNmTJWpKnLI8kJ+IJQTrWOo4jOaZwsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxDXOHQl; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxDXOHQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706221825; x=1737757825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+K8/I7KsjMILeiYonhcP/n00EIdVaQPmHILADXMNQo=;
  b=DxDXOHQl77tLmgYJOyRiXw0szpeGb6+rpNv8x8HhBZDQq3NZSTUZr3zZ
   wbPu17DJcUxEQUGQAmMi9Rcnoo17Wzwyggn08kjPUGtNnIpvWjHNkzynn
   3Y/k4//mgUTu1QQDsyjsr8uL36tscJ9hT7MQYZZzxWkytNN9/GKQUz8ZQ
   +sPG7C2Z2m5uGgOF6oB4IgU6/ch8ItwrXRfZRsr310mFpaY8AvWk2h21N
   VshNkaKlLZdjSCnThGKJjEWGSageWWIvy64tZPMR+JwKYnaKln0EvEjdQ
   LSXFoeGnvt+arQvA4ZAT/BVqY/TD6JDGn0hdNzLEBTAJ2Sd3qvGH22x1w
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="401977592"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="401977592"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 14:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="820941674"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="820941674"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 25 Jan 2024 14:30:21 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT8El-0000Sa-1D;
	Thu, 25 Jan 2024 22:30:19 +0000
Date: Fri, 26 Jan 2024 06:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 7/31] sound/pci/als4000.c:947:2: error:
 call to undeclared function 'snd_sbmixer_suspend'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202401260641.blzmb4QO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/pm-ops
head:   623b2f6110ff118b84628595d53e4947f2883329
commit: 6dae83b64fac25af472e718bf086b43a1f209674 [7/31] ALSA: als4000: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-012-20240125 (https://download.01.org/0day-ci/archive/20240126/202401260641.blzmb4QO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401260641.blzmb4QO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401260641.blzmb4QO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/als4000.c:947:2: error: call to undeclared function 'snd_sbmixer_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     947 |         snd_sbmixer_suspend(chip);
         |         ^
   sound/pci/als4000.c:947:2: note: did you mean 'snd_sbmixer_read'?
   include/sound/sb.h:288:15: note: 'snd_sbmixer_read' declared here
     288 | unsigned char snd_sbmixer_read(struct snd_sb *chip, unsigned char reg);
         |               ^
>> sound/pci/als4000.c:959:2: error: call to undeclared function 'snd_sbmixer_resume'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     959 |         snd_sbmixer_resume(chip);
         |         ^
   sound/pci/als4000.c:959:2: note: did you mean 'snd_sbmixer_read'?
   include/sound/sb.h:288:15: note: 'snd_sbmixer_read' declared here
     288 | unsigned char snd_sbmixer_read(struct snd_sb *chip, unsigned char reg);
         |               ^
   2 errors generated.


vim +/snd_sbmixer_suspend +947 sound/pci/als4000.c

d616a0246da88d Takashi Iwai 2022-04-12  938  
68cb2b55927885 Takashi Iwai 2012-07-02  939  static int snd_als4000_suspend(struct device *dev)
703529140cfb77 Takashi Iwai 2005-11-17  940  {
68cb2b55927885 Takashi Iwai 2012-07-02  941  	struct snd_card *card = dev_get_drvdata(dev);
703529140cfb77 Takashi Iwai 2005-11-17  942  	struct snd_card_als4000 *acard = card->private_data;
703529140cfb77 Takashi Iwai 2005-11-17  943  	struct snd_sb *chip = acard->chip;
703529140cfb77 Takashi Iwai 2005-11-17  944  
703529140cfb77 Takashi Iwai 2005-11-17  945  	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
703529140cfb77 Takashi Iwai 2005-11-17  946  	
703529140cfb77 Takashi Iwai 2005-11-17 @947  	snd_sbmixer_suspend(chip);
703529140cfb77 Takashi Iwai 2005-11-17  948  	return 0;
703529140cfb77 Takashi Iwai 2005-11-17  949  }
703529140cfb77 Takashi Iwai 2005-11-17  950  
68cb2b55927885 Takashi Iwai 2012-07-02  951  static int snd_als4000_resume(struct device *dev)
703529140cfb77 Takashi Iwai 2005-11-17  952  {
68cb2b55927885 Takashi Iwai 2012-07-02  953  	struct snd_card *card = dev_get_drvdata(dev);
703529140cfb77 Takashi Iwai 2005-11-17  954  	struct snd_card_als4000 *acard = card->private_data;
703529140cfb77 Takashi Iwai 2005-11-17  955  	struct snd_sb *chip = acard->chip;
703529140cfb77 Takashi Iwai 2005-11-17  956  
703529140cfb77 Takashi Iwai 2005-11-17  957  	snd_als4000_configure(chip);
703529140cfb77 Takashi Iwai 2005-11-17  958  	snd_sbdsp_reset(chip);
703529140cfb77 Takashi Iwai 2005-11-17 @959  	snd_sbmixer_resume(chip);
703529140cfb77 Takashi Iwai 2005-11-17  960  

:::::: The code at line 947 was first introduced by commit
:::::: 703529140cfb774366b839f38f027f283cb948b4 [ALSA] als4000 - Add PM support

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
