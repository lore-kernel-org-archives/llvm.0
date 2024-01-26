Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D12D2FF;
	Fri, 26 Jan 2024 06:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706251839; cv=none; b=ln0sZO9F3hQs4lOWxxCq0vOgyE7g49OmJypmad//siviCa/po29mYOdvT0sJknLlUpKSBld6nGjc/ZAp4piMbJvUjDWekRYfdViRrfSpmaCOkqmMMuSf+Zows3fse21k5kEVckpYOCZ5XJ1mJUE+9pQsk5LMworEkfslwfUymKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706251839; c=relaxed/simple;
	bh=PdqxiRDyZVap8F6lMugV2lhDbAfQ2juSj92Mwx3od9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ti0ULnlUumJXKnLrLy+5LlT/YlfpL0VLftUZ8rcbGIfsrkXqk0m6iIhYNZb1uzcsU1Fk7JxMdRB9RZ/+qDTn/Jluq6R8k1srgVukHhQrzdqILjb2L4K3bwlMICKyIvEpIYf2LKpJItiYsoNJ7FI4il99FIqUQeMnMAgO4a6es3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CB6psU6u; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CB6psU6u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706251838; x=1737787838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PdqxiRDyZVap8F6lMugV2lhDbAfQ2juSj92Mwx3od9U=;
  b=CB6psU6uJwH2BC6O9+mV/FFwY69KQrPDmZfX/hhLkFCzVdL6ylDehKZh
   d2AEeAM5MEfq7RyAGU6j2Rin6+eiryzeJFyaK8ENzWGVPwHGbFDI60S0m
   kr8hI/RIMNisSO6wMwHypEVmLcZZ6EamK5KvE3Lz54i4UD7e+s/mZtodO
   dkwUHCkAz19QShemmGckgb+m4+L8v4/TlME+XwakZxeWoWLt1EA/wfkJB
   vKkbHr5WBo+vDwHTf3HF67iu20YQGoL9VT+0Rc2pOdCJP15YAfeJM9xI5
   7nC7OS2LFIoKaymZtvIAYV5P0DdwshecR+lW1nSfqYrwsuRas7eJAwn9h
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9084732"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9084732"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 22:50:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1118182993"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1118182993"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jan 2024 22:50:35 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTG2r-0000me-2N;
	Fri, 26 Jan 2024 06:50:33 +0000
Date: Fri, 26 Jan 2024 14:50:06 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 9/31] sound/pci/ens1370.c:1988:2: error:
 call to undeclared function 'snd_ak4531_suspend'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202401261439.SV1NYR8a-lkp@intel.com>
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
commit: e2a78f52bd0f02f34a84d1f4437dadf3cefdca79 [9/31] ALSA: ens137x: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: i386-randconfig-012-20240125 (https://download.01.org/0day-ci/archive/20240126/202401261439.SV1NYR8a-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240126/202401261439.SV1NYR8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401261439.SV1NYR8a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/pci/ens1370.c:1988:2: error: call to undeclared function 'snd_ak4531_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1988 |         snd_ak4531_suspend(ensoniq->u.es1370.ak4531);
         |         ^
   sound/pci/ens1370.c:1988:2: note: did you mean 'snd_ak4531_mixer'?
   include/sound/ak4531_codec.h:62:5: note: 'snd_ak4531_mixer' declared here
      62 | int snd_ak4531_mixer(struct snd_card *card, struct snd_ak4531 *_ak4531,
         |     ^
>> sound/pci/ens1370.c:2003:2: error: call to undeclared function 'snd_ak4531_resume'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2003 |         snd_ak4531_resume(ensoniq->u.es1370.ak4531);
         |         ^
   2 errors generated.


vim +/snd_ak4531_suspend +1988 sound/pci/ens1370.c

f31a31b9024f21 Kurt J. Bosch 2005-11-16  1970  
68cb2b55927885 Takashi Iwai  2012-07-02  1971  static int snd_ensoniq_suspend(struct device *dev)
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1972  {
68cb2b55927885 Takashi Iwai  2012-07-02  1973  	struct snd_card *card = dev_get_drvdata(dev);
fe8be10786c040 Takashi Iwai  2005-11-17  1974  	struct ensoniq *ensoniq = card->private_data;
fe8be10786c040 Takashi Iwai  2005-11-17  1975  	
fe8be10786c040 Takashi Iwai  2005-11-17  1976  	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1977  
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1978  #ifdef CHIP1371	
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1979  	snd_ac97_suspend(ensoniq->u.es1371.ac97);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1980  #else
15f500a6994e55 Takashi Iwai  2006-01-12  1981  	/* try to reset AK4531 */
15f500a6994e55 Takashi Iwai  2006-01-12  1982  	outw(ES_1370_CODEC_WRITE(AK4531_RESET, 0x02), ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1983  	inw(ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1984  	udelay(100);
15f500a6994e55 Takashi Iwai  2006-01-12  1985  	outw(ES_1370_CODEC_WRITE(AK4531_RESET, 0x03), ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1986  	inw(ES_REG(ensoniq, 1370_CODEC));
15f500a6994e55 Takashi Iwai  2006-01-12  1987  	udelay(100);
fe8be10786c040 Takashi Iwai  2005-11-17 @1988  	snd_ak4531_suspend(ensoniq->u.es1370.ak4531);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1989  #endif	
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1990  	return 0;
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1991  }
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1992  
68cb2b55927885 Takashi Iwai  2012-07-02  1993  static int snd_ensoniq_resume(struct device *dev)
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1994  {
68cb2b55927885 Takashi Iwai  2012-07-02  1995  	struct snd_card *card = dev_get_drvdata(dev);
fe8be10786c040 Takashi Iwai  2005-11-17  1996  	struct ensoniq *ensoniq = card->private_data;
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1997  
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1998  	snd_ensoniq_chip_init(ensoniq);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  1999  
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2000  #ifdef CHIP1371	
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2001  	snd_ac97_resume(ensoniq->u.es1371.ac97);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2002  #else
fe8be10786c040 Takashi Iwai  2005-11-17 @2003  	snd_ak4531_resume(ensoniq->u.es1370.ak4531);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2004  #endif	
fe8be10786c040 Takashi Iwai  2005-11-17  2005  	snd_power_change_state(card, SNDRV_CTL_POWER_D0);
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2006  	return 0;
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2007  }
f31a31b9024f21 Kurt J. Bosch 2005-11-16  2008  

:::::: The code at line 1988 was first introduced by commit
:::::: fe8be10786c040bce53c18048d75b1b23aec64ae [ALSA] ens137x - Fix and ADD PM support

:::::: TO: Takashi Iwai <tiwai@suse.de>
:::::: CC: Jaroslav Kysela <perex@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
