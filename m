Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794136127;
	b=BbHX9deZbUT3btpghOLtpJuaqi1tIXT1sPr6fodr8EIx8lEaM2T7Kb81IS9/ue7QzB3e
	 H9V/dcFoNNHiqecE4M1c1ZH4gjpl7bvW4xrkNXe3gV4pLYQl5h9Tm4S3Z+pFKOKknLx9H
	 2YyPEPJTqUiG1qNKb1XvxN5jshlZXCXr+nNPC69BWHpMiyxQnZpWmAu/U1kfAGxvpYYxt
	 DnL9HTdNCxGaHUGssen/5cLYoAhSwRLBPcJW2LZlRAIqniBUjJmzG+yOmOCrZSHpPQs+2
	 GeryJ2y+w+AUdKnFhYx4MZKrzxYoXFZpfg35mDaHifg6HsmfaM358YjYogMGpVui+1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794136127;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=V7Ody8JeXMkzLZHv8olvL0aHefA5IpIC1Vs5enrss/o=;
	b=Jt2/HjFt9JPlVr4tTqY3QAZWgZqU+RVK8WJ73X24ZVgFRS3syFiaIdDFay7D3aBpzzQG
	 hPiEaqz+3gp+V8RZdZAdqGo++MDw1ZglxRjjVS07psVGbmCCJ1J7EPhbJXf5VFoC5kwMP
	 5j1G/lIFN1V5ch7bGIQfPqWcJGU9n54lra+SgA7jgmKww82KgMDBCQFR76uc/ao0TU4G9
	 IgyIeeNoTVicF06R1RhTJ2d7uU30p+pSZw3ZHRMmAfpSZHktPJ/UjyO0Au8y4QIDdmPNp
	 VyOBLELUuRjPKz+fw/LadferwKQT6z83Gn7e9OeivgL422SPJW4xtEpsmtScXDXNEzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jdLyfXwi;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B383606A321;
	Sun,  8 Nov 2026 11:08:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B383606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jdLyfXwi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794136125; x=1825672125;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zUrwpjHmgX2sQEIOLj74SCTZplyzWE0AapO1fDycG+I=;
  b=jdLyfXwii19UvnLeA9lyKB5vepgK01dCXzCBTZ4w9MNQVRHAUSibaIqp
   62RbfMiZktjIKsRnEQTMafNPMW0A2ChyQuWAeOz4XJG33vVhMH5S2yqJ4
   4cDltidvSa5zHwbGh0HYKK0/GmfTB8QEFXJ7vlNkIowbAuw+ZZZDLqaye
   +akmkeYuLP/gXV5SVngHlPcG+PkxD+ouO+WJCszCO1kUCLzUJVRpixIuK
   fALAFGRVW/yc0quLKZzxA4qq5BQNIeqtCZlAufeFGrw1nayLTQV9jGbRL
   wrBC8e7xgwqCMzOyLuBX8ngjVQWxRzLLNhR0KfLkjmIfjfbycjJJwuxin
   Q==;
X-CSE-ConnectionGUID: 1bASM2QrSWmtfkaYYxPQog==
X-CSE-MsgGUID: 4zez614CTRGPElgEgabPzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2766792"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2766792"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 03:08:45 -0800
X-CSE-ConnectionGUID: 6fFzp7XqRk67eSIeTVIQLQ==
X-CSE-MsgGUID: D6Sz5yH7Q3CFYCsZnSwV/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7540748"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Nov 2026 03:08:41 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ0lK-00000000sqN-0FOf;
	Sun, 08 Nov 2026 11:08:38 +0000
Date: Sun, 8 Nov 2026 19:08:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, vkoul@kernel.org,
	alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, yung-chuan.liao@linux.intel.com,
	Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
	venkataprasad.potturu@amd.com, Syed.SabaKareem@amd.com,
	Mario.Limonciello@amd.com, Richard.Gong@amd.com, Poojitha.N@amd.com,
	lee@kernel.org, Vijendar.Mukunda@amd.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: Re: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with
 interrupt_enabled flag
Message-ID: <202611081921.O3dE9COW-lkp@intel.com>
References: <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107175339.3547918-4-Vijendar.Mukunda@amd.com>

Hi Vijendar,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on vkoul-dmaengine/next linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vijendar-Mukunda/ASoC-amd-ps-guard-adata-sdw-dereferences-with-NULL-check-in-IRQ-handler/20261107-232226
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261107175339.3547918-4-Vijendar.Mukunda%40amd.com
patch subject: [PATCH 3/4] ASoC: SOF: amd: guard SDW IRQ work scheduling with interrupt_enabled flag
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261108/202611081921.O3dE9COW-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081921.O3dE9COW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081921.O3dE9COW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/amd/acp.c:589:36: error: no member named 'interrupt_enabled' in 'struct amd_sdw_manager'
     589 |                         if (amd_manager && amd_manager->interrupt_enabled)
         |                                            ~~~~~~~~~~~  ^
   sound/soc/sof/amd/acp.c:621:37: error: no member named 'interrupt_enabled' in 'struct amd_sdw_manager'
     621 |                                 if (amd_manager && amd_manager->interrupt_enabled)
         |                                                    ~~~~~~~~~~~  ^
   2 errors generated.


vim +589 sound/soc/sof/amd/acp.c

   566	
   567	static irqreturn_t acp_irq_handler(int irq, void *dev_id)
   568	{
   569		struct amd_sdw_manager *amd_manager;
   570		struct snd_sof_dev *sdev = dev_id;
   571		const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
   572		struct acp_dev_data *adata = sdev->pdata->hw_pdata;
   573		unsigned int base = desc->dsp_intr_base;
   574		unsigned int val;
   575		int irq_flag = 0, wake_irq_flag = 0;
   576	
   577		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
   578		if (val & ACP_DSP_TO_HOST_IRQ) {
   579			snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET,
   580					  ACP_DSP_TO_HOST_IRQ);
   581			return IRQ_WAKE_THREAD;
   582		}
   583	
   584		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
   585		if (val & ACP_SDW0_IRQ_MASK) {
   586			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
   587			if (adata->sdw) {
   588				amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
 > 589				if (amd_manager && amd_manager->interrupt_enabled)
   590					schedule_work(&amd_manager->amd_sdw_irq_thread);
   591			}
   592			irq_flag = 1;
   593		}
   594	
   595		if (val & ACP_ERROR_IRQ_MASK) {
   596			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
   597			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
   598			/* ACP_SW1_I2S_ERROR_REASON is newly added register from rmb platform onwards */
   599			switch (adata->pci_rev) {
   600			case ACP_RMB_PCI_ID:
   601			case ACP63_PCI_ID:
   602			case ACP70_PCI_ID:
   603			case ACP71_PCI_ID:
   604			case ACP72_PCI_ID:
   605				snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
   606				break;
   607			default:
   608				break;
   609			}
   610			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
   611			irq_flag = 1;
   612		}
   613	
   614		if (desc->ext_intr_stat1) {
   615			val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
   616			if (val & ACP_SDW1_IRQ_MASK) {
   617				snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
   618						  ACP_SDW1_IRQ_MASK);
   619				if (adata->sdw) {
   620					amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
   621					if (amd_manager && amd_manager->interrupt_enabled)
   622						schedule_work(&amd_manager->amd_sdw_irq_thread);
   623				}
   624				irq_flag = 1;
   625			}
   626			switch (adata->pci_rev) {
   627			case ACP70_PCI_ID:
   628			case ACP71_PCI_ID:
   629			case ACP72_PCI_ID:
   630				wake_irq_flag = amd_sof_check_and_handle_acp70_sdw_wake_irq(sdev);
   631				break;
   632			}
   633		}
   634		if (irq_flag || wake_irq_flag)
   635			return IRQ_HANDLED;
   636		else
   637			return IRQ_NONE;
   638	}
   639	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
