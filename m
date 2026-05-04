Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1921031716B;
	Mon,  4 May 2026 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777927128; cv=none; b=Ejuo4axaj59P9SSu94FRSGRxAE5TGW1zmLOdo//mgiN1+GY8e4F6A9OhDN5L/7SMb44zeGBrEKNtKEPbpa0hy6uRNSw317bNcZGuS7KdgsQFlETD72sNipiwPVFZCd4aWp5Bztwjq690M/LEe3GUuy0cJE51VFhMGJhOTro+6mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777927128; c=relaxed/simple;
	bh=bxZ+WF/Ew2tERlhzP4wDS75ZC+a/Qf7KohCKJYD+prw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osG8WUZ7seN7tfBexJID1vkudfXBSm7DwIsBdpoxK0d+MEzt3Oc1bLTAvIiWKnREqXa3Hhf4UVFUwlGSKzILHgndO7tNucf3EYvAIVy+aIlBlfV6zuGuHiIZIRRY3I2+4YBhzF8shknLrBQ5zss9hzdL07YNTWLLiQM2HcbnAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PAAaoHdX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PAAaoHdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777927126; x=1809463126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bxZ+WF/Ew2tERlhzP4wDS75ZC+a/Qf7KohCKJYD+prw=;
  b=PAAaoHdXNbp01WKuAW5Xi34rB28E9/v9o2EM134JTzV+vRMVPSEGkDtB
   NAq7BYhzddBEOVxRpWyPpmJnAqarWu2ddUcj7GfhEIeGLzsYrtJJvrS6y
   NAEQx/qDY8349s3VB3gbKFiQzwgmZTJuq1dzALa86zgClBrJTMrcdn2cC
   5L28QKY4rMiaxIEJlZ9Bh/jSGDQLlvMOA8oMv0QHnvlRFb2UhLSvIJcN0
   6m3Nu8THNlM0ubTbzUbTqw4yZP662cczYcw8+e8g4PIsU+3GTU/HChVUW
   f1/N+D27qBZvctD3JUfFR/0b6A4n6E4KggIQJWNYS4uA3nXHR5xeBYqVM
   Q==;
X-CSE-ConnectionGUID: fbwor9JITYi6hT7X9h/PHg==
X-CSE-MsgGUID: 6564NwsLQOuI+dhcy4keLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89379325"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89379325"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 13:38:46 -0700
X-CSE-ConnectionGUID: vYyPg099Q8yNPsl6X527CQ==
X-CSE-MsgGUID: 4jX7kUsUQyuGSLksbvyejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="237381398"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 May 2026 13:38:44 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK03t-000000005xZ-29fc;
	Mon, 04 May 2026 20:38:41 +0000
Date: Mon, 4 May 2026 22:37:51 +0200
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>, hanguidong02@gmail.com,
	linux-usb@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oliver Neukum <oneukum@suse.com>
Subject: Re: [RFT] usb: class: cdc-wdm: switch to kfifo for buffering
Message-ID: <202605042206.Ybpa1c91-lkp@intel.com>
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
[also build test WARNING on usb/usb-next usb/usb-linus westeri-thunderbolt/next next-20260430]
[cannot apply to peter-chen-usb/for-usb-next linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/usb-class-cdc-wdm-switch-to-kfifo-for-buffering/20260504-164851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260430121859.1018894-1-oneukum%40suse.com
patch subject: [RFT] usb: class: cdc-wdm: switch to kfifo for buffering
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260504/202605042206.Ybpa1c91-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605042206.Ybpa1c91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605042206.Ybpa1c91-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/class/cdc-wdm.c:526:6: warning: variable 'i' set but not used [-Wunused-but-set-variable]
     526 |         int i = 0;
         |             ^
   1 warning generated.


vim +/i +526 drivers/usb/class/cdc-wdm.c

8dd5cd5395b900 Bjørn Mork          2013-12-20  521  
afba937e540c90 Oliver Neukum       2008-05-13  522  static ssize_t wdm_read
afba937e540c90 Oliver Neukum       2008-05-13  523  (struct file *file, char __user *buffer, size_t count, loff_t *ppos)
afba937e540c90 Oliver Neukum       2008-05-13  524  {
055e352971719f Oliver Neukum       2026-04-30  525  	int rv, cntr, done;
afba937e540c90 Oliver Neukum       2008-05-13 @526  	int i = 0;
afba937e540c90 Oliver Neukum       2008-05-13  527  	struct wdm_device *desc = file->private_data;
afba937e540c90 Oliver Neukum       2008-05-13  528  
afba937e540c90 Oliver Neukum       2008-05-13  529  
e8537bd2c4f325 Bjørn Mork          2012-01-16  530  	rv = mutex_lock_interruptible(&desc->rlock); /*concurrent reads */
afba937e540c90 Oliver Neukum       2008-05-13  531  	if (rv < 0)
afba937e540c90 Oliver Neukum       2008-05-13  532  		return -ERESTARTSYS;
afba937e540c90 Oliver Neukum       2008-05-13  533  
055e352971719f Oliver Neukum       2026-04-30  534  	cntr = kfifo_len(&desc->ubuf);
711c68b3c0f7a9 Ben Hutchings       2012-02-12  535  	if (cntr == 0) {
afba937e540c90 Oliver Neukum       2008-05-13  536  		desc->read = 0;
afba937e540c90 Oliver Neukum       2008-05-13  537  retry:
7f1dc313d01f5f Oliver Neukum       2009-09-09  538  		if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
7f1dc313d01f5f Oliver Neukum       2009-09-09  539  			rv = -ENODEV;
7f1dc313d01f5f Oliver Neukum       2009-09-09  540  			goto err;
7f1dc313d01f5f Oliver Neukum       2009-09-09  541  		}
c0f5ecee4e7416 Oliver Neukum       2013-03-12  542  		if (test_bit(WDM_OVERFLOW, &desc->flags)) {
c0f5ecee4e7416 Oliver Neukum       2013-03-12  543  			clear_bit(WDM_OVERFLOW, &desc->flags);
c0f5ecee4e7416 Oliver Neukum       2013-03-12  544  			rv = -ENOBUFS;
c0f5ecee4e7416 Oliver Neukum       2013-03-12  545  			goto err;
c0f5ecee4e7416 Oliver Neukum       2013-03-12  546  		}
afba937e540c90 Oliver Neukum       2008-05-13  547  		i++;
7f1dc313d01f5f Oliver Neukum       2009-09-09  548  		if (file->f_flags & O_NONBLOCK) {
7f1dc313d01f5f Oliver Neukum       2009-09-09  549  			if (!test_bit(WDM_READ, &desc->flags)) {
53b7f7b53d8372 Gustavo A. R. Silva 2017-02-14  550  				rv = -EAGAIN;
7f1dc313d01f5f Oliver Neukum       2009-09-09  551  				goto err;
7f1dc313d01f5f Oliver Neukum       2009-09-09  552  			}
7f1dc313d01f5f Oliver Neukum       2009-09-09  553  			rv = 0;
7f1dc313d01f5f Oliver Neukum       2009-09-09  554  		} else {
afba937e540c90 Oliver Neukum       2008-05-13  555  			rv = wait_event_interruptible(desc->wait,
afba937e540c90 Oliver Neukum       2008-05-13  556  				test_bit(WDM_READ, &desc->flags));
7f1dc313d01f5f Oliver Neukum       2009-09-09  557  		}
afba937e540c90 Oliver Neukum       2008-05-13  558  
7f1dc313d01f5f Oliver Neukum       2009-09-09  559  		/* may have happened while we slept */
17d80d562fd78a Oliver Neukum       2008-06-24  560  		if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
17d80d562fd78a Oliver Neukum       2008-06-24  561  			rv = -ENODEV;
17d80d562fd78a Oliver Neukum       2008-06-24  562  			goto err;
17d80d562fd78a Oliver Neukum       2008-06-24  563  		}
88044202756925 Bjørn Mork          2012-02-10  564  		if (test_bit(WDM_RESETTING, &desc->flags)) {
88044202756925 Bjørn Mork          2012-02-10  565  			rv = -EIO;
88044202756925 Bjørn Mork          2012-02-10  566  			goto err;
88044202756925 Bjørn Mork          2012-02-10  567  		}
055e352971719f Oliver Neukum       2026-04-30  568  		smp_rmb(); /* against wdm_in_callback() */
055e352971719f Oliver Neukum       2026-04-30  569  		if (test_bit(WDM_OVERFLOW, &desc->flags)) {
055e352971719f Oliver Neukum       2026-04-30  570  			clear_bit(WDM_OVERFLOW, &desc->flags);
055e352971719f Oliver Neukum       2026-04-30  571  			rv = -ENOBUFS;
055e352971719f Oliver Neukum       2026-04-30  572  			goto err;
055e352971719f Oliver Neukum       2026-04-30  573  		}
055e352971719f Oliver Neukum       2026-04-30  574  
17d80d562fd78a Oliver Neukum       2008-06-24  575  		usb_mark_last_busy(interface_to_usbdev(desc->intf));
afba937e540c90 Oliver Neukum       2008-05-13  576  		if (rv < 0) {
afba937e540c90 Oliver Neukum       2008-05-13  577  			rv = -ERESTARTSYS;
afba937e540c90 Oliver Neukum       2008-05-13  578  			goto err;
afba937e540c90 Oliver Neukum       2008-05-13  579  		}
afba937e540c90 Oliver Neukum       2008-05-13  580  
afba937e540c90 Oliver Neukum       2008-05-13  581  		spin_lock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  582  
afba937e540c90 Oliver Neukum       2008-05-13  583  		if (desc->rerr) { /* read completed, error happened */
85e8a0b9a3565c Oliver Neukum       2015-03-23  584  			rv = usb_translate_errors(desc->rerr);
afba937e540c90 Oliver Neukum       2008-05-13  585  			desc->rerr = 0;
afba937e540c90 Oliver Neukum       2008-05-13  586  			spin_unlock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  587  			goto err;
afba937e540c90 Oliver Neukum       2008-05-13  588  		}
afba937e540c90 Oliver Neukum       2008-05-13  589  		/*
afba937e540c90 Oliver Neukum       2008-05-13  590  		 * recheck whether we've lost the race
afba937e540c90 Oliver Neukum       2008-05-13  591  		 * against the completion handler
afba937e540c90 Oliver Neukum       2008-05-13  592  		 */
afba937e540c90 Oliver Neukum       2008-05-13  593  		if (!test_bit(WDM_READ, &desc->flags)) { /* lost race */
afba937e540c90 Oliver Neukum       2008-05-13  594  			spin_unlock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  595  			goto retry;
afba937e540c90 Oliver Neukum       2008-05-13  596  		}
c0f5ecee4e7416 Oliver Neukum       2013-03-12  597  
055e352971719f Oliver Neukum       2026-04-30  598  		cntr = kfifo_len(&desc->ubuf);
afba937e540c90 Oliver Neukum       2008-05-13  599  		spin_unlock_irq(&desc->iuspin);
afba937e540c90 Oliver Neukum       2008-05-13  600  	}
afba937e540c90 Oliver Neukum       2008-05-13  601  
711c68b3c0f7a9 Ben Hutchings       2012-02-12  602  	if (cntr > count)
711c68b3c0f7a9 Ben Hutchings       2012-02-12  603  		cntr = count;
055e352971719f Oliver Neukum       2026-04-30  604  	rv = kfifo_to_user(&desc->ubuf, buffer, cntr, &done);
055e352971719f Oliver Neukum       2026-04-30  605  	if (rv < 0) {
afba937e540c90 Oliver Neukum       2008-05-13  606  		rv = -EFAULT;
afba937e540c90 Oliver Neukum       2008-05-13  607  		goto err;
afba937e540c90 Oliver Neukum       2008-05-13  608  	}
afba937e540c90 Oliver Neukum       2008-05-13  609  
711c68b3c0f7a9 Ben Hutchings       2012-02-12  610  	spin_lock_irq(&desc->iuspin);
711c68b3c0f7a9 Ben Hutchings       2012-02-12  611  
87d65e54b6d5ff Oliver Neukum       2008-06-19  612  	/* in case we had outstanding data */
055e352971719f Oliver Neukum       2026-04-30  613  	if (kfifo_is_empty(&desc->ubuf)) {
c1da59dad0ebd3 Robert Foss         2016-08-09  614  		clear_bit(WDM_READ, &desc->flags);
c1da59dad0ebd3 Robert Foss         2016-08-09  615  		service_outstanding_interrupt(desc);
c1da59dad0ebd3 Robert Foss         2016-08-09  616  	}
73e06865ead1be Greg Suarez         2013-10-29  617  	spin_unlock_irq(&desc->iuspin);
055e352971719f Oliver Neukum       2026-04-30  618  	rv = done;
afba937e540c90 Oliver Neukum       2008-05-13  619  
afba937e540c90 Oliver Neukum       2008-05-13  620  err:
e8537bd2c4f325 Bjørn Mork          2012-01-16  621  	mutex_unlock(&desc->rlock);
afba937e540c90 Oliver Neukum       2008-05-13  622  	return rv;
afba937e540c90 Oliver Neukum       2008-05-13  623  }
afba937e540c90 Oliver Neukum       2008-05-13  624  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
