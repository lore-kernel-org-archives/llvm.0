Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339701D555;
	Sun, 23 Nov 2025 07:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763881566; cv=none; b=FHRW1vwvwoJ7N1dFfidp6akE8uNQlONQIbGZgYjiLDa4J/hWsFb4cUsS/uKo1rd+qAt4v7ZNBEBdKK8Z6DRbX7vaKHxj6PlbsXsWLf5eJs74N8uU+eMFT+Tkv98IImK8lnhjXnWFmf/xXrwEdNWSYZ9Re3RGkP5MtYqSEnnxTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763881566; c=relaxed/simple;
	bh=++NKoMZ3ghENuk90AqvVCpxqT9+DHWkitSncyRfOmB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hKMM21XTQ9Ah6nNSSOxhTRktf9K0AUyVq+zLXQL4G1YIEWbOEn+XqIUC1Ds32CcwYOGh61hON2KdJ4C/giiJWB3nbxC1aVSZfw41mi3y1vG6O5X1ZnVPO6hjQCGw9CIFPPca1VslkiL0lgY1Nyzymj5kUpAJR8dz/0Fspul+0so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKFwCao4; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKFwCao4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763881566; x=1795417566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++NKoMZ3ghENuk90AqvVCpxqT9+DHWkitSncyRfOmB0=;
  b=KKFwCao4fxcFwv4T61H+YGTndNAovgDU/En7gqJtTck5byyJLv0lRL4p
   bOlfQufvDxLOrfwJqcb7LVlFhjuhmhfepexAi5P0wjxN7Xq06iCkd3LF6
   PDfMCNa+fndZWN6OV587cLbXvJi2/zxsRXRU3Mc5VPD1SFiopWDVHG5RU
   DTj6iu1H6yMGbCFamQexsuR+x7nkvYig/uVDz50vBIm+ESB/nrKwhooqk
   MnFGpBvxo1u5UZs/CHFIbHfWVPChdrSBZWJu/e7uKDBLXTG7X0bCY/PHk
   8LC+0H7njfB3TIo8G9Wvk1oZnaBUwC+N5HSyHZBBNMw4iGBKrPQxZMs4P
   g==;
X-CSE-ConnectionGUID: evxEPt+OQKyRVcZuCoRU4g==
X-CSE-MsgGUID: 4ybrluIITH+sDMQZ/GQ69A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77385665"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="77385665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 23:06:04 -0800
X-CSE-ConnectionGUID: rKVwh313SwCB2ZkfJKM2EQ==
X-CSE-MsgGUID: Zwg4YRynQ+yYYr6/GHgKNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="196342904"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Nov 2025 23:06:02 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN4Aa-00087D-0j;
	Sun, 23 Nov 2025 07:06:00 +0000
Date: Sun, 23 Nov 2025 15:05:35 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:pwm/wip-bcm2835-waveform 13/13]
 drivers/pwm/pwm-bcm2835.c:192:25: error: use of undeclared identifier
 'PWM_CONTROL'
Message-ID: <202511231557.I7vNciE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/wip-bcm2835-waveform
head:   c1af4d45a42aabf9685682fda795e92ff33d5c9c
commit: c1af4d45a42aabf9685682fda795e92ff33d5c9c [13/13] WIP: pwm: bcm2835: Convert to waveform API
config: arm-randconfig-001-20251123 (https://download.01.org/0day-ci/archive/20251123/202511231557.I7vNciE5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231557.I7vNciE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231557.I7vNciE5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pwm/pwm-bcm2835.c:192:25: error: use of undeclared identifier 'PWM_CONTROL'
     192 |         writel(ctl, pc->base + PWM_CONTROL);
         |                                ^~~~~~~~~~~
   1 error generated.


vim +/PWM_CONTROL +192 drivers/pwm/pwm-bcm2835.c

   172	
   173	static int bcm2835_pwm_write_waveform(struct pwm_chip *chip, struct pwm_device *pwm,
   174					      const void *_wfhw)
   175	{
   176		const struct bcm2835_pwm_wfhw *wfhw = _wfhw;
   177		struct bcm2835_pwm *pc = to_bcm2835_pwm(chip);
   178		u32 ctl;
   179		u32 ctl_shift = pwm->hwpwm ? 8 : 0;
   180		u32 ctl_mask = BCM2835PWM_CTL_PWEN1 | BCM2835PWM_CTL_MODE1 | BCM2835PWM_CTL_POLA1 |
   181			BCM2835PWM_CTL_USEF1 | BCM2835PWM_CTL_MSEN1;
   182	
   183		ctl = readl(pc->base + BCM2835PWM_CTL);
   184		ctl &= ~(ctl_mask << ctl_shift);
   185		ctl |= (wfhw->ctl & ctl_mask) << ctl_shift;
   186	
   187		dev_dbg(&chip->dev, "pwm#%u: write CTL: %08x, RNG: %08x, DAT: %08x, actual CTL: %08x\n",
   188			pwm->hwpwm, wfhw->ctl, wfhw->rng, wfhw->dat, ctl);
   189	
   190		writel(wfhw->rng, pc->base + (pwm->hwpwm ? BCM2835PWM_RNG2 : BCM2835PWM_RNG1));
   191		writel(wfhw->dat, pc->base + (pwm->hwpwm ? BCM2835PWM_DAT2 : BCM2835PWM_DAT1));
 > 192		writel(ctl, pc->base + PWM_CONTROL);
   193	
   194		return 0;
   195	}
   196	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
