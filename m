Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C104017543;
	Mon, 22 Jul 2024 05:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721625139; cv=none; b=aTsd8Ij9otsooF6aqQBqYShiVKZuH0OHgpBhhVIfzS36nO2mrEqZ4NfO6nViRLS1XIW9MEJ+smLG78zoxap1OCGhmbnFjDCUJUsCpqIKNJZzsTXLMy720qCYa3L/L74Tw4aoBg27uivGfzQZBTmqzxgIfka1H+FFGxwUnZ2EObs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721625139; c=relaxed/simple;
	bh=WV3yiXzYxKYCv2BabFqEJvl9TEnWYLapdT1gUFSzS10=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JncqHnFHJ7yR3Fz3bEy8MiLXsq76EEG3JcBEncf60xhU//r3F8fHdWI0pbU4O+6ox+VQ60xSD4pHx3RgCAMqs5NqgUB4oZ+vHZK7wji73QiwQyXIjU++TUDGxRCrkBzQ2s1DD2UtjnOzCeueNhtvfYNLbh4RxcXFLL/x8qEgvtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IpR6F0nW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IpR6F0nW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721625138; x=1753161138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WV3yiXzYxKYCv2BabFqEJvl9TEnWYLapdT1gUFSzS10=;
  b=IpR6F0nWxkIn38tK5xLMlKY5R2urzYJkUKUwNCiuVqlJQ8mePrCFa2Nq
   VIoUgLUAULyYrxyxc7NeBtZlqSFJgg0bV02QUOl7usbbX8oe+ZR4fYbPK
   aZRToOuiWNA0PfyAi+JtpjST3FjeefjYetNGfZkDBshuAo4fTCbtTzduW
   AYmZ6x40Nit+g4W48e2zpOwMigRpClpUzGNL91qCj8cY5Rsqu2Wzmyx1j
   1lcS3ITbXaLS8oV4M3WYnlb7icaJdt5x10zu9mI4sKtu3cYKjW+K/baE8
   AEGFsBFOE/idQLZ1PubgkJBoIQiFDk3Z8pJBXDYtuH6L58yEt/mHW/kmt
   w==;
X-CSE-ConnectionGUID: JYmECd74T++5t0DlDrzLvg==
X-CSE-MsgGUID: MjZbf+98QkK9U7aZ3A1R6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="22982511"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="22982511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 22:12:14 -0700
X-CSE-ConnectionGUID: s+F5OVL5QaSqXLW1lDJypQ==
X-CSE-MsgGUID: Wia+IIagRdWnABpwJH90Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="55927459"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jul 2024 22:12:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVlLH-000kt4-1F;
	Mon, 22 Jul 2024 05:12:11 +0000
Date: Mon, 22 Jul 2024 13:12:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-msiof-2024-07-19 16/16] sound/soc/sh/msiof.c:470:3:
 error: use of undeclared identifier 'stop'
Message-ID: <202407221317.aoAlPrsD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-msiof-2024-07-19
head:   a12bc552b3fd774fec2214ece9ee022c4808d676
commit: a12bc552b3fd774fec2214ece9ee022c4808d676 [16/16] msiof
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240722/202407221317.aoAlPrsD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221317.aoAlPrsD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407221317.aoAlPrsD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/sh/msiof.c:470:3: error: use of undeclared identifier 'stop'
     470 |                 stop = 1;
         |                 ^
   sound/soc/sh/msiof.c:477:6: error: use of undeclared identifier 'stop'; did you mean 'stac'?
     477 |         if (stop) {
         |             ^~~~
         |             stac
   arch/x86/include/asm/smap.h:36:29: note: 'stac' declared here
      36 | static __always_inline void stac(void)
         |                             ^
>> sound/soc/sh/msiof.c:482:30: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
     482 |                         dev_warn(dev, "SISTR = %08x\n");
         |                                                ~~~^
   include/linux/dev_printk.h:156:62: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ^~~
   include/linux/dev_printk.h:19:22: note: expanded from macro 'dev_fmt'
      19 | #define dev_fmt(fmt) fmt
         |                      ^~~
   include/linux/dev_printk.h:110:16: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ^~~
   1 warning and 2 errors generated.


vim +/stop +470 sound/soc/sh/msiof.c

   450	
   451	static int msiof_trigger(struct snd_soc_component *component,
   452				 struct snd_pcm_substream *substream, int cmd)
   453	{
   454		struct device *dev = component->dev;
   455		struct msiof_priv *priv = dev_get_drvdata(dev);
   456		unsigned long flags;
   457		int is_play = msiof_is_play(substream);
   458		int ret = -EINVAL;
   459	
   460		spin_lock_irqsave(&priv->lock, flags);
   461	
   462		switch (cmd) {
   463		case SNDRV_PCM_TRIGGER_START:
   464			priv->substream[is_play] = substream;
   465			/* fallthrough */
   466		case SNDRV_PCM_TRIGGER_RESUME:
   467			ret = msiof_hw_start(component, substream, cmd);
   468			break;
   469		case SNDRV_PCM_TRIGGER_STOP:
 > 470			stop = 1;
   471			/* fallthrough */
   472		case SNDRV_PCM_TRIGGER_SUSPEND:
   473			ret = msiof_hw_stop(component, substream, cmd);
   474			break;
   475		}
   476	
 > 477		if (stop) {
   478			u32 sistr = msiof_read(priv, SISTR);
   479	
   480			/* indicate error status if exist */
   481			if (sistr)
 > 482				dev_warn(dev, "SISTR = %08x\n");
   483	
   484			priv->substream[is_play] = NULL;
   485		}
   486	
   487		spin_unlock_irqrestore(&priv->lock, flags);
   488	
   489		return ret;
   490	}
   491	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
