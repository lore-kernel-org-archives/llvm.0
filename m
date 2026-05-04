Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15643DFC85;
	Mon,  4 May 2026 15:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910138; cv=none; b=Qiccyudt/L2wHpvqJ0oxNmPrCcLZreXvxUnuGdgp/TdaFAaf+Mu8FuWhWVaYjbRnFGFIq/weLZTBwRUgEhL+RcyRRA5nkA6L6SSNVlm8j5Rz1pqC2BqZqDgGxZjMGdMuFrxNB2v+7xXTILzG6SnVFWWCU4zBPDgyg7e747iCd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910138; c=relaxed/simple;
	bh=AxBe0Pli9xlS8xkxnpJ1QukNFc97/w4zdD7V42Zjc0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQ/4Mh349EOItMYDbUhVbWIX6B62YSihnnBaGqa23522DwtizRa0KfuxIy5iRPG/zZ/JHfEgfT/Cvmf6p5D9S1XAKUaftntCFiLzTWoOzhTO3DjytrajLlmjPjMey0knuF2Ml80MtLf+/hE7n5rbYmS0MO0xg+gHuELisCbJSv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMIzvL8k; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMIzvL8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777910136; x=1809446136;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AxBe0Pli9xlS8xkxnpJ1QukNFc97/w4zdD7V42Zjc0o=;
  b=mMIzvL8klJJDl+Qp21eA06sv/Gp97lH3xbhp7cHF82ScVaFTtZ6seOq9
   6FskiDSi6EXWZ+aYbEbumDt+PEz+TSlHzlDydsKMmaUP7q1JYLGCgfovi
   vig1ZdpO5wZJTkn6G4hjBWrBbVvh98E+GYpZ9e7issKtb1mI1EWlbmlaU
   zvz/Bksa5FgDrmcWhY+Dzrs754uXu5B3q6Qr0KAqOgQ/zkTvIVDhHxgXt
   +gAi7Ab9TSYKMJhvYXbG0we4ChWUomLsE14UPuIyzwF80wxyANopi2W3O
   e5zpmQyPHXO8qQRaJWzPvYoRpNzICn9/pMqxTmnjxJslioP7INqUqIZey
   A==;
X-CSE-ConnectionGUID: 3m0Xw7+KS1eB1LsA1jHVGw==
X-CSE-MsgGUID: DFFwpRRMSw2QBgVmfviFow==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78960688"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="78960688"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 08:55:35 -0700
X-CSE-ConnectionGUID: RGqtXx4aSty212Yr8xdNzw==
X-CSE-MsgGUID: SRXLLebGTrCOXuylfZslEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="273660379"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 May 2026 08:55:33 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJvdg-000000003or-2yJs;
	Mon, 04 May 2026 15:55:23 +0000
Date: Mon, 4 May 2026 23:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, hanguidong02@gmail.com,
	linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [RFT] usb: class: cdc-wdm: switch to kfifo for buffering
Message-ID: <202605042331.sI8rgflD-lkp@intel.com>
References: <20260430121859.1018894-1-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430121859.1018894-1-oneukum@suse.com>

Hi Oliver,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.1-rc2 next-20260430]
[cannot apply to peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/usb-class-cdc-wdm-switch-to-kfifo-for-buffering/20260504-164851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260430121859.1018894-1-oneukum%40suse.com
patch subject: [RFT] usb: class: cdc-wdm: switch to kfifo for buffering
config: arm-randconfig-004-20260504 (https://download.01.org/0day-ci/archive/20260504/202605042331.sI8rgflD-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042331.sI8rgflD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605042331.sI8rgflD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/class/cdc-wdm.c:526:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     526 |         int i = 0;
         |             ^
   1 warning generated.


vim +/i +526 drivers/usb/class/cdc-wdm.c

8dd5cd5395b9007 Bjørn Mork          2013-12-20  521  
afba937e540c902 Oliver Neukum       2008-05-13  522  static ssize_t wdm_read
afba937e540c902 Oliver Neukum       2008-05-13  523  (struct file *file, char __user *buffer, size_t count, loff_t *ppos)
afba937e540c902 Oliver Neukum       2008-05-13  524  {
055e352971719f8 Oliver Neukum       2026-04-30  525  	int rv, cntr, done;
afba937e540c902 Oliver Neukum       2008-05-13 @526  	int i = 0;
afba937e540c902 Oliver Neukum       2008-05-13  527  	struct wdm_device *desc = file->private_data;
afba937e540c902 Oliver Neukum       2008-05-13  528  
afba937e540c902 Oliver Neukum       2008-05-13  529  
e8537bd2c4f325a Bjørn Mork          2012-01-16  530  	rv = mutex_lock_interruptible(&desc->rlock); /*concurrent reads */
afba937e540c902 Oliver Neukum       2008-05-13  531  	if (rv < 0)
afba937e540c902 Oliver Neukum       2008-05-13  532  		return -ERESTARTSYS;
afba937e540c902 Oliver Neukum       2008-05-13  533  
055e352971719f8 Oliver Neukum       2026-04-30  534  	cntr = kfifo_len(&desc->ubuf);
711c68b3c0f7a92 Ben Hutchings       2012-02-12  535  	if (cntr == 0) {
afba937e540c902 Oliver Neukum       2008-05-13  536  		desc->read = 0;
afba937e540c902 Oliver Neukum       2008-05-13  537  retry:
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  538  		if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  539  			rv = -ENODEV;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  540  			goto err;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  541  		}
c0f5ecee4e74166 Oliver Neukum       2013-03-12  542  		if (test_bit(WDM_OVERFLOW, &desc->flags)) {
c0f5ecee4e74166 Oliver Neukum       2013-03-12  543  			clear_bit(WDM_OVERFLOW, &desc->flags);
c0f5ecee4e74166 Oliver Neukum       2013-03-12  544  			rv = -ENOBUFS;
c0f5ecee4e74166 Oliver Neukum       2013-03-12  545  			goto err;
c0f5ecee4e74166 Oliver Neukum       2013-03-12  546  		}
afba937e540c902 Oliver Neukum       2008-05-13  547  		i++;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  548  		if (file->f_flags & O_NONBLOCK) {
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  549  			if (!test_bit(WDM_READ, &desc->flags)) {
53b7f7b53d83727 Gustavo A. R. Silva 2017-02-14  550  				rv = -EAGAIN;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  551  				goto err;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  552  			}
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  553  			rv = 0;
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  554  		} else {
afba937e540c902 Oliver Neukum       2008-05-13  555  			rv = wait_event_interruptible(desc->wait,
afba937e540c902 Oliver Neukum       2008-05-13  556  				test_bit(WDM_READ, &desc->flags));
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  557  		}
afba937e540c902 Oliver Neukum       2008-05-13  558  
7f1dc313d01f5f0 Oliver Neukum       2009-09-09  559  		/* may have happened while we slept */
17d80d562fd78a0 Oliver Neukum       2008-06-24  560  		if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
17d80d562fd78a0 Oliver Neukum       2008-06-24  561  			rv = -ENODEV;
17d80d562fd78a0 Oliver Neukum       2008-06-24  562  			goto err;
17d80d562fd78a0 Oliver Neukum       2008-06-24  563  		}
88044202756925a Bjørn Mork          2012-02-10  564  		if (test_bit(WDM_RESETTING, &desc->flags)) {
88044202756925a Bjørn Mork          2012-02-10  565  			rv = -EIO;
88044202756925a Bjørn Mork          2012-02-10  566  			goto err;
88044202756925a Bjørn Mork          2012-02-10  567  		}
055e352971719f8 Oliver Neukum       2026-04-30  568  		smp_rmb(); /* against wdm_in_callback() */
055e352971719f8 Oliver Neukum       2026-04-30  569  		if (test_bit(WDM_OVERFLOW, &desc->flags)) {
055e352971719f8 Oliver Neukum       2026-04-30  570  			clear_bit(WDM_OVERFLOW, &desc->flags);
055e352971719f8 Oliver Neukum       2026-04-30  571  			rv = -ENOBUFS;
055e352971719f8 Oliver Neukum       2026-04-30  572  			goto err;
055e352971719f8 Oliver Neukum       2026-04-30  573  		}
055e352971719f8 Oliver Neukum       2026-04-30  574  
17d80d562fd78a0 Oliver Neukum       2008-06-24  575  		usb_mark_last_busy(interface_to_usbdev(desc->intf));
afba937e540c902 Oliver Neukum       2008-05-13  576  		if (rv < 0) {
afba937e540c902 Oliver Neukum       2008-05-13  577  			rv = -ERESTARTSYS;
afba937e540c902 Oliver Neukum       2008-05-13  578  			goto err;
afba937e540c902 Oliver Neukum       2008-05-13  579  		}
afba937e540c902 Oliver Neukum       2008-05-13  580  
afba937e540c902 Oliver Neukum       2008-05-13  581  		spin_lock_irq(&desc->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  582  
afba937e540c902 Oliver Neukum       2008-05-13  583  		if (desc->rerr) { /* read completed, error happened */
85e8a0b9a3565c8 Oliver Neukum       2015-03-23  584  			rv = usb_translate_errors(desc->rerr);
afba937e540c902 Oliver Neukum       2008-05-13  585  			desc->rerr = 0;
afba937e540c902 Oliver Neukum       2008-05-13  586  			spin_unlock_irq(&desc->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  587  			goto err;
afba937e540c902 Oliver Neukum       2008-05-13  588  		}
afba937e540c902 Oliver Neukum       2008-05-13  589  		/*
afba937e540c902 Oliver Neukum       2008-05-13  590  		 * recheck whether we've lost the race
afba937e540c902 Oliver Neukum       2008-05-13  591  		 * against the completion handler
afba937e540c902 Oliver Neukum       2008-05-13  592  		 */
afba937e540c902 Oliver Neukum       2008-05-13  593  		if (!test_bit(WDM_READ, &desc->flags)) { /* lost race */
afba937e540c902 Oliver Neukum       2008-05-13  594  			spin_unlock_irq(&desc->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  595  			goto retry;
afba937e540c902 Oliver Neukum       2008-05-13  596  		}
c0f5ecee4e74166 Oliver Neukum       2013-03-12  597  
055e352971719f8 Oliver Neukum       2026-04-30  598  		cntr = kfifo_len(&desc->ubuf);
afba937e540c902 Oliver Neukum       2008-05-13  599  		spin_unlock_irq(&desc->iuspin);
afba937e540c902 Oliver Neukum       2008-05-13  600  	}
afba937e540c902 Oliver Neukum       2008-05-13  601  
711c68b3c0f7a92 Ben Hutchings       2012-02-12  602  	if (cntr > count)
711c68b3c0f7a92 Ben Hutchings       2012-02-12  603  		cntr = count;
055e352971719f8 Oliver Neukum       2026-04-30  604  	rv = kfifo_to_user(&desc->ubuf, buffer, cntr, &done);
055e352971719f8 Oliver Neukum       2026-04-30  605  	if (rv < 0) {
afba937e540c902 Oliver Neukum       2008-05-13  606  		rv = -EFAULT;
afba937e540c902 Oliver Neukum       2008-05-13  607  		goto err;
afba937e540c902 Oliver Neukum       2008-05-13  608  	}
afba937e540c902 Oliver Neukum       2008-05-13  609  
711c68b3c0f7a92 Ben Hutchings       2012-02-12  610  	spin_lock_irq(&desc->iuspin);
711c68b3c0f7a92 Ben Hutchings       2012-02-12  611  
87d65e54b6d5ff6 Oliver Neukum       2008-06-19  612  	/* in case we had outstanding data */
055e352971719f8 Oliver Neukum       2026-04-30  613  	if (kfifo_is_empty(&desc->ubuf)) {
c1da59dad0ebd3f Robert Foss         2016-08-09  614  		clear_bit(WDM_READ, &desc->flags);
c1da59dad0ebd3f Robert Foss         2016-08-09  615  		service_outstanding_interrupt(desc);
c1da59dad0ebd3f Robert Foss         2016-08-09  616  	}
73e06865ead1bec Greg Suarez         2013-10-29  617  	spin_unlock_irq(&desc->iuspin);
055e352971719f8 Oliver Neukum       2026-04-30  618  	rv = done;
afba937e540c902 Oliver Neukum       2008-05-13  619  
afba937e540c902 Oliver Neukum       2008-05-13  620  err:
e8537bd2c4f325a Bjørn Mork          2012-01-16  621  	mutex_unlock(&desc->rlock);
afba937e540c902 Oliver Neukum       2008-05-13  622  	return rv;
afba937e540c902 Oliver Neukum       2008-05-13  623  }
afba937e540c902 Oliver Neukum       2008-05-13  624  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
