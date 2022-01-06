Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFF173
	for <llvm@lists.linux.dev>; Thu,  6 Jan 2022 19:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641496169; x=1673032169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RxCtARnoF9pGAcwDzW2dZcph5+Nqlo2qiujSxvcrfF8=;
  b=l8Nu1U2kNtTJp/t/n71kmbqpGkAILCOylIeNTvczl/sIbigEJWEshxiM
   TiG03t5ewXFE2IBS+cLZ3GWeVH23GyjvIr6Lc9SV83zqUN41h1ksLDZIV
   5djT6URyBcygOO28vuGI381xPj0brGS+heHPQ1sm1V1EXgJLsWdJ9qQhC
   1JaOaJsD7eC5krtRswlG9t4kCMcnKaOMOrwNnfY1sYb+dwCFYKMMNZz9Z
   NEtvsINJtJul3GQhcTTanCwUq0vPLVuD/ZLmb01zOXAv4t3QmVgvKJ7Mm
   zyeNudNfljtZxYhNfG4VQp0TW4ks8hTWYILOhg61QSf5E06X0NlSDB2Km
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="306070632"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="306070632"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2022 11:09:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; 
   d="scan'208";a="513508295"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 06 Jan 2022 11:09:27 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5Y8d-000Hsd-1h; Thu, 06 Jan 2022 19:09:27 +0000
Date: Fri, 7 Jan 2022 03:08:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2] ALSA: intel_hdmi: Check for error num after setting
 mask
Message-ID: <202201070315.qIB3Xdyc-lkp@intel.com>
References: <20220106094402.2738082-1-jiasheng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220106094402.2738082-1-jiasheng@iscas.ac.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jiasheng,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on v5.16-rc8 next-20220106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jiasheng-Jiang/ALSA-intel_hdmi-Check-for-error-num-after-setting-mask/20220106-174545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
config: x86_64-buildonly-randconfig-r001-20220106 (https://download.01.org/0day-ci/archive/20220107/202201070315.qIB3Xdyc-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/fa85305284e764cd69af83325e1b669df5367dc4
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jiasheng-Jiang/ALSA-intel_hdmi-Check-for-error-num-after-setting-mask/20220106-174545
        git checkout fa85305284e764cd69af83325e1b669df5367dc4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash sound/x86/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> sound/x86/intel_hdmi_audio.c:1755:8: error: use of undeclared label 'err'
                   goto err;
                        ^
   1 error generated.


vim +/err +1755 sound/x86/intel_hdmi_audio.c

  1661	
  1662	/*
  1663	 * hdmi_lpe_audio_probe - start bridge with i915
  1664	 *
  1665	 * This function is called when the i915 driver creates the
  1666	 * hdmi-lpe-audio platform device.
  1667	 */
  1668	static int hdmi_lpe_audio_probe(struct platform_device *pdev)
  1669	{
  1670		struct snd_card *card;
  1671		struct snd_intelhad_card *card_ctx;
  1672		struct snd_intelhad *ctx;
  1673		struct snd_pcm *pcm;
  1674		struct intel_hdmi_lpe_audio_pdata *pdata;
  1675		int irq;
  1676		struct resource *res_mmio;
  1677		int port, ret;
  1678	
  1679		pdata = pdev->dev.platform_data;
  1680		if (!pdata) {
  1681			dev_err(&pdev->dev, "%s: quit: pdata not allocated by i915!!\n", __func__);
  1682			return -EINVAL;
  1683		}
  1684	
  1685		/* get resources */
  1686		irq = platform_get_irq(pdev, 0);
  1687		if (irq < 0)
  1688			return irq;
  1689	
  1690		res_mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  1691		if (!res_mmio) {
  1692			dev_err(&pdev->dev, "Could not get IO_MEM resources\n");
  1693			return -ENXIO;
  1694		}
  1695	
  1696		/* create a card instance with ALSA framework */
  1697		ret = snd_devm_card_new(&pdev->dev, hdmi_card_index, hdmi_card_id,
  1698					THIS_MODULE, sizeof(*card_ctx), &card);
  1699		if (ret)
  1700			return ret;
  1701	
  1702		card_ctx = card->private_data;
  1703		card_ctx->dev = &pdev->dev;
  1704		card_ctx->card = card;
  1705		strcpy(card->driver, INTEL_HAD);
  1706		strcpy(card->shortname, "Intel HDMI/DP LPE Audio");
  1707		strcpy(card->longname, "Intel HDMI/DP LPE Audio");
  1708	
  1709		card_ctx->irq = -1;
  1710	
  1711		card->private_free = hdmi_lpe_audio_free;
  1712	
  1713		platform_set_drvdata(pdev, card_ctx);
  1714	
  1715		card_ctx->num_pipes = pdata->num_pipes;
  1716		card_ctx->num_ports = single_port ? 1 : pdata->num_ports;
  1717	
  1718		for_each_port(card_ctx, port) {
  1719			ctx = &card_ctx->pcm_ctx[port];
  1720			ctx->card_ctx = card_ctx;
  1721			ctx->dev = card_ctx->dev;
  1722			ctx->port = single_port ? -1 : port;
  1723			ctx->pipe = -1;
  1724	
  1725			spin_lock_init(&ctx->had_spinlock);
  1726			mutex_init(&ctx->mutex);
  1727			INIT_WORK(&ctx->hdmi_audio_wq, had_audio_wq);
  1728		}
  1729	
  1730		dev_dbg(&pdev->dev, "%s: mmio_start = 0x%x, mmio_end = 0x%x\n",
  1731			__func__, (unsigned int)res_mmio->start,
  1732			(unsigned int)res_mmio->end);
  1733	
  1734		card_ctx->mmio_start =
  1735			devm_ioremap(&pdev->dev, res_mmio->start,
  1736				     (size_t)(resource_size(res_mmio)));
  1737		if (!card_ctx->mmio_start) {
  1738			dev_err(&pdev->dev, "Could not get ioremap\n");
  1739			return -EACCES;
  1740		}
  1741	
  1742		/* setup interrupt handler */
  1743		ret = devm_request_irq(&pdev->dev, irq, display_pipe_interrupt_handler,
  1744				       0, pdev->name, card_ctx);
  1745		if (ret < 0) {
  1746			dev_err(&pdev->dev, "request_irq failed\n");
  1747			return ret;
  1748		}
  1749	
  1750		card_ctx->irq = irq;
  1751	
  1752		/* only 32bit addressable */
  1753		ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
  1754		if (ret)
> 1755			goto err;
  1756	
  1757		init_channel_allocations();
  1758	
  1759		card_ctx->num_pipes = pdata->num_pipes;
  1760		card_ctx->num_ports = single_port ? 1 : pdata->num_ports;
  1761	
  1762		for_each_port(card_ctx, port) {
  1763			int i;
  1764	
  1765			ctx = &card_ctx->pcm_ctx[port];
  1766			ret = snd_pcm_new(card, INTEL_HAD, port, MAX_PB_STREAMS,
  1767					  MAX_CAP_STREAMS, &pcm);
  1768			if (ret)
  1769				return ret;
  1770	
  1771			/* setup private data which can be retrieved when required */
  1772			pcm->private_data = ctx;
  1773			pcm->info_flags = 0;
  1774			strscpy(pcm->name, card->shortname, strlen(card->shortname));
  1775			/* setup the ops for playback */
  1776			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &had_pcm_ops);
  1777	
  1778			/* allocate dma pages;
  1779			 * try to allocate 600k buffer as default which is large enough
  1780			 */
  1781			snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
  1782						       card->dev, HAD_DEFAULT_BUFFER,
  1783						       HAD_MAX_BUFFER);
  1784	
  1785			/* create controls */
  1786			for (i = 0; i < ARRAY_SIZE(had_controls); i++) {
  1787				struct snd_kcontrol *kctl;
  1788	
  1789				kctl = snd_ctl_new1(&had_controls[i], ctx);
  1790				if (!kctl)
  1791					return -ENOMEM;
  1792	
  1793				kctl->id.device = pcm->device;
  1794	
  1795				ret = snd_ctl_add(card, kctl);
  1796				if (ret < 0)
  1797					return ret;
  1798			}
  1799	
  1800			/* Register channel map controls */
  1801			ret = had_register_chmap_ctls(ctx, pcm);
  1802			if (ret < 0)
  1803				return ret;
  1804	
  1805			ret = had_create_jack(ctx, pcm);
  1806			if (ret < 0)
  1807				return ret;
  1808		}
  1809	
  1810		ret = snd_card_register(card);
  1811		if (ret)
  1812			return ret;
  1813	
  1814		spin_lock_irq(&pdata->lpe_audio_slock);
  1815		pdata->notify_audio_lpe = notify_audio_lpe;
  1816		spin_unlock_irq(&pdata->lpe_audio_slock);
  1817	
  1818		pm_runtime_use_autosuspend(&pdev->dev);
  1819		pm_runtime_mark_last_busy(&pdev->dev);
  1820	
  1821		dev_dbg(&pdev->dev, "%s: handle pending notification\n", __func__);
  1822		for_each_port(card_ctx, port) {
  1823			struct snd_intelhad *ctx = &card_ctx->pcm_ctx[port];
  1824	
  1825			schedule_work(&ctx->hdmi_audio_wq);
  1826		}
  1827	
  1828		return 0;
  1829	}
  1830	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
