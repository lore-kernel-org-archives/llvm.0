Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B16737D100;
	Fri,  7 Aug 2026 19:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786131907; cv=none; b=jKlPS1uDmAHpvvc46ytzrI34c2eVVuIfb2RY15rAZvgNOaI3/fjpk8qoJdZG22kSa9zUw3C7KBGHN9fFoP9PRzqhp4GAcTfWTPU/q/odjx5uIl/8+7QRFlXfBtvUpFZAcRYwR08UG4Ba5tGJwj/yXV0j93myMDeuQZKgvWyh2oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786131907; c=relaxed/simple;
	bh=+w0PGlKmPEFGqlIuidQ1lzrH3L8TG2Zmd2apHS/JsGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnOMgJWQryZv6UOisztfYyxTNybU64RIw13KUU3ftBDhVFqUPp8fK9lyXOKUuQHwbThvx4rH9OQ5I3GOL+Dx4cmO/ceU8mxRY5ZtSaAZb/fDEPzUYadYGsHaPM/45Hnl07HEZEkDBXzXASJ6CGE3DNPK3RdRbtami9ROLemOR44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b5+INBax; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b5+INBax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786131905; x=1817667905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+w0PGlKmPEFGqlIuidQ1lzrH3L8TG2Zmd2apHS/JsGU=;
  b=b5+INBaxFn8NxJKjsf13i9DEQQvJFKVVlKRN44y41tiWAwDu5Twp2Yu7
   P88ZUK2bkq8IDM8JbtYNaVSa3P1y426cV3sLFSekvZCyTBQw2AqdkNqrl
   5Z2AqlcjobTho7yUr/Xo6Uj/VSWfLMNdmhq/gkJ99NtlK5oDJzIDIaanN
   eYNVetrryG9Ir28rst/mBf89GuMYFvSbF0Uhd8KD3zSOoM7HcMnFzYq4X
   RCr2nT6NHQye1hcMLfBHK5DLW+0I1yPUIw871i0Npt7hMreDfuEZLQ5si
   IQfTxNAAexhQr0oJx0q3MGYL5Mgf91QV/BhQgGgAmI3+6wQvEYp4wSmAz
   w==;
X-CSE-ConnectionGUID: o50OkYdBT96DYua4ypv8rg==
X-CSE-MsgGUID: mpQtn66JRIKVcQrrVckppw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="90626940"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="90626940"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 12:45:05 -0700
X-CSE-ConnectionGUID: UtqLO1MXSF+yKYI1YUiWUw==
X-CSE-MsgGUID: tNN/1NNcRt+7n7Hn0VoAuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="258619825"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 12:45:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsQV1-00000000J45-1cVi;
	Fri, 07 Aug 2026 19:44:59 +0000
Date: Sat, 8 Aug 2026 03:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, linux-sunxi@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mailbox: sun6i: modernize probe and convert to fully
 managed
Message-ID: <202608080303.ryiYJhRA-lkp@intel.com>
References: <20260727194208.10082-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727194208.10082-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on sunxi/sunxi/for-next]
[also build test ERROR on linus/master v7.2-rc6 next-20260806]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/mailbox-sun6i-modernize-probe-and-convert-to-fully-managed/20260807-054041
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20260727194208.10082-1-rosenp%40gmail.com
patch subject: [PATCH] mailbox: sun6i: modernize probe and convert to fully managed
config: arm64-randconfig-001-20260807 (https://download.01.org/0day-ci/archive/20260808/202608080303.ryiYJhRA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608080303.ryiYJhRA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608080303.ryiYJhRA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/sun6i-msgbox.c:271:56: error: too few arguments to function call, expected 2, have 1
     271 |         return devm_mbox_controller_register(&mbox->controller);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/mailbox_controller.h:149:5: note: 'devm_mbox_controller_register' declared here
     149 | int devm_mbox_controller_register(struct device *dev,
         |     ^                             ~~~~~~~~~~~~~~~~~~~
     150 |                                   struct mbox_controller *mbox);
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +271 drivers/mailbox/sun6i-msgbox.c

   194	
   195	static int sun6i_msgbox_probe(struct platform_device *pdev)
   196	{
   197		struct device *dev = &pdev->dev;
   198		struct mbox_chan *chans;
   199		struct reset_control *reset;
   200		struct sun6i_msgbox *mbox;
   201		void __iomem *regs;
   202		int i, ret;
   203		int irq;
   204	
   205		irq = platform_get_irq(pdev, 0);
   206		if (irq < 0)
   207			return irq;
   208	
   209		regs = devm_platform_ioremap_resource(pdev, 0);
   210		if (IS_ERR(regs))
   211			return PTR_ERR(regs);
   212	
   213		mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
   214		if (!mbox)
   215			return -ENOMEM;
   216	
   217		chans = devm_kcalloc(dev, NUM_CHANS, sizeof(*chans), GFP_KERNEL);
   218		if (!chans)
   219			return -ENOMEM;
   220	
   221		for (i = 0; i < NUM_CHANS; ++i)
   222			chans[i].con_priv = mbox;
   223	
   224		mbox->clk = devm_clk_get_enabled(dev, NULL);
   225		if (IS_ERR(mbox->clk)) {
   226			ret = PTR_ERR(mbox->clk);
   227			dev_err(dev, "Failed to get clock: %d\n", ret);
   228			return ret;
   229		}
   230	
   231		reset = devm_reset_control_get_exclusive(dev, NULL);
   232		if (IS_ERR(reset)) {
   233			ret = PTR_ERR(reset);
   234			dev_err(dev, "Failed to get reset control: %d\n", ret);
   235			return ret;
   236		}
   237	
   238		/*
   239		 * NOTE: We rely on platform firmware to preconfigure the channel
   240		 * directions, and we share this hardware block with other firmware
   241		 * that runs concurrently with Linux (e.g. a trusted monitor).
   242		 *
   243		 * Therefore, we do *not* assert the reset line if probing fails or
   244		 * when removing the device.
   245		 */
   246		ret = reset_control_deassert(reset);
   247		if (ret) {
   248			dev_err(dev, "Failed to deassert reset: %d\n", ret);
   249			return ret;
   250		}
   251	
   252		mbox->regs = regs;
   253	
   254		/* Disable all IRQs for this end of the msgbox. */
   255		writel(0, mbox->regs + LOCAL_IRQ_EN_REG);
   256	
   257		ret = devm_request_irq(dev, irq, sun6i_msgbox_irq, 0, dev_name(dev), mbox);
   258		if (ret)
   259			return ret;
   260	
   261		mbox->controller.dev           = dev;
   262		mbox->controller.ops           = &sun6i_msgbox_chan_ops;
   263		mbox->controller.chans         = chans;
   264		mbox->controller.num_chans     = NUM_CHANS;
   265		mbox->controller.txdone_irq    = false;
   266		mbox->controller.txdone_poll   = true;
   267		mbox->controller.txpoll_period = 5;
   268	
   269		spin_lock_init(&mbox->lock);
   270	
 > 271		return devm_mbox_controller_register(&mbox->controller);
   272	}
   273	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
