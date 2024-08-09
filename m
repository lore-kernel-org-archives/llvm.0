Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C212232A;
	Fri,  9 Aug 2024 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723243885; cv=none; b=lMNoKCe/4vtQ9/vYG9ptclzIh/b1AD22qdN0jmC9FzkjAHzhz1GRhmgbkDOGV7ocgGan8+lDPm2L1B5+CGBG8p89fDa7srPUNX0utUISXwFAI9I0e34vcBst++kHkXfXCKTWoj92fdfMug5sJBDff1hRFYPLDnRtsM7GREwuvd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723243885; c=relaxed/simple;
	bh=ff71TyjvUq72CZ4XIBiGTj9t4pjbdgCKYZjYq3pBK9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iHs8B6HWN2T5GsLqU2T0SlebBVH0oHrTi5q6u3jKe/4N5HGHTfn85OI37JrbhlnCrmh48A7H59IuYK4rUJ7RiQ3Is6E39QQPtP21cGoOXJjGmG+D4Xt0Rlk037eNVqMJ9Aeip4S9D+fs2kkZmzurCfOPAB4y8d60yHo0ltwM+bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NETc29xs; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NETc29xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723243884; x=1754779884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ff71TyjvUq72CZ4XIBiGTj9t4pjbdgCKYZjYq3pBK9U=;
  b=NETc29xsdH/BNCOe67MhXJCUxPCsExMyEhsDvP4Y+QDXwSlQpmp2bsp6
   MKK3GpBEnX/Teeav9PqyvVWTF6V49hyLg/IxhpzJkoobCyAHlcCC1ACbL
   Uw5F6mF/7593dTpQmoeIkd1TY62DPQDBrZk6akKBt6iBlgKWTLuoFbYnC
   13s7nfdhnqMHrmk1Jh3m5IIDFdFkdyeeRVQRpSMRV457I7JFJme9jO2Ra
   r/0JAb2c8SA/XuPjs8mE6309JWV8RWMvuLFpKb9xyfAZYLbT/9nDiaLUF
   +3Q4FQDWDnEl1ONS9XNTPADF7yJsB6oatpKFCtuJ2LmvwgU1bZfq5p91l
   Q==;
X-CSE-ConnectionGUID: I4bUXLzbTyuqhf3onp1srQ==
X-CSE-MsgGUID: HDFd12xBRRq0qp+x2LIpPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="46840109"
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="46840109"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2024 15:51:24 -0700
X-CSE-ConnectionGUID: rGXfYhOvQ920MdgB+7amYg==
X-CSE-MsgGUID: dLE4mvakTqmbroOgygKikA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,277,1716274800"; 
   d="scan'208";a="57359075"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 09 Aug 2024 15:51:23 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scYS7-0009K3-1k;
	Fri, 09 Aug 2024 22:51:19 +0000
Date: Sat, 10 Aug 2024 06:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [broonie-ci:filehZ3h8g 26/28] sound/soc/sof/amd/acp.c:407:14: error:
 no member named 'pci_rev' in 'struct acp_dev_data'
Message-ID: <202408100634.3r9TDvav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filehZ3h8g
head:   45576eb691a6ad128c577d4b904380458359e3e5
commit: a8d93b9b3a43cbb342fb6d37c0f0ad5a1a0e503f [26/28] ASoC: SOF: amd: fix for acp error reason registers wrong offset
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240810/202408100634.3r9TDvav-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240810/202408100634.3r9TDvav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408100634.3r9TDvav-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/amd/acp.c:407:14: error: no member named 'pci_rev' in 'struct acp_dev_data'
     407 |                 if (adata->pci_rev >= ACP_RMB_PCI_ID)
         |                     ~~~~~  ^
   1 error generated.


vim +407 sound/soc/sof/amd/acp.c

   377	
   378	static irqreturn_t acp_irq_handler(int irq, void *dev_id)
   379	{
   380		struct amd_sdw_manager *amd_manager;
   381		struct snd_sof_dev *sdev = dev_id;
   382		const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
   383		struct acp_dev_data *adata = sdev->pdata->hw_pdata;
   384		unsigned int base = desc->dsp_intr_base;
   385		unsigned int val;
   386		int irq_flag = 0;
   387	
   388		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET);
   389		if (val & ACP_DSP_TO_HOST_IRQ) {
   390			snd_sof_dsp_write(sdev, ACP_DSP_BAR, base + DSP_SW_INTR_STAT_OFFSET,
   391					  ACP_DSP_TO_HOST_IRQ);
   392			return IRQ_WAKE_THREAD;
   393		}
   394	
   395		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat);
   396		if (val & ACP_SDW0_IRQ_MASK) {
   397			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
   398			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_SDW0_IRQ_MASK);
   399			if (amd_manager)
   400				schedule_work(&amd_manager->amd_sdw_irq_thread);
   401			irq_flag = 1;
   402		}
   403	
   404		if (val & ACP_ERROR_IRQ_MASK) {
   405			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat, ACP_ERROR_IRQ_MASK);
   406			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_sw0_i2s_err_reason, 0);
 > 407			if (adata->pci_rev >= ACP_RMB_PCI_ID)
   408				snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SW1_I2S_ERROR_REASON, 0);
   409			snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_error_stat, 0);
   410			irq_flag = 1;
   411		}
   412	
   413		if (desc->ext_intr_stat1) {
   414			val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, desc->ext_intr_stat1);
   415			if (val & ACP_SDW1_IRQ_MASK) {
   416				amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
   417				snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->ext_intr_stat1,
   418						  ACP_SDW1_IRQ_MASK);
   419				if (amd_manager)
   420					schedule_work(&amd_manager->amd_sdw_irq_thread);
   421				irq_flag = 1;
   422			}
   423		}
   424		if (irq_flag)
   425			return IRQ_HANDLED;
   426		else
   427			return IRQ_NONE;
   428	}
   429	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
