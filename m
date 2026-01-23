Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1658834;
	Fri, 23 Jan 2026 12:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769171878; cv=none; b=swCxw/d62iOtLMgrIcL8tIDsMteGLRVkIO04sKGweKHDM9Z4VeQ66b1gK/t1J9tWd4UpmxkrnqUV4D/daODA0LRt5NH/CbJp2uSw+knStHVJy2Ndp7/nT8MY29psLXa5yO/tyWV53UFCCNtcntSfj2fBb+ZzMPVM2NR/yow6RhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769171878; c=relaxed/simple;
	bh=NoBzX1XiBRNmAVWSMgEmztaPAENWfQRHfpsHKP8t8yI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEqljmfBw0ql8cXBbzfYfeg22LY7Dgh7nELJ1Wo2A7K7RfLMH3cu+pCcjb99z77rNsj38jZVuHooezn+4nhAzXiSqz7+C16coxRxBOHcjvI0h0NeQSZkwhnfbAUaVpaQtzjUlqHPWEfpG2RTwkfnQ2/UpItuezUdf1p1Gxok7uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1bRwyq8; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1bRwyq8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769171877; x=1800707877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NoBzX1XiBRNmAVWSMgEmztaPAENWfQRHfpsHKP8t8yI=;
  b=c1bRwyq8tAsCZKncc+fRLbnBlPYQnpowDAJPAb5P5ui8uFTN0PxEv/6T
   EaItpGZC16OTGutcsSEaM87XtbrjDyAbw68UOl4qFygfp7XIYL67dKzLO
   dFQPF6TQm5RAji162JUScvWjZjZeB06iOd3Z7U4qglxPNoeF6tUQ5NDLn
   62IZWFfx1BqLARClRhpxJ7YFgSucG4GJ9n/EC7ixG9sPH52gacn14BN5D
   oetOUASG/eYihcbifjzMeujn9rZrGwlyYG57Gv4/lDHeaGaBZM8FkG/Sq
   GkgV0KfzmxIlO8IBfxWVrPCfaB28VtO1dCESZrc0/x1tCAivuOewEFezr
   w==;
X-CSE-ConnectionGUID: OSXfuudIRt2AoC5HCZlnCQ==
X-CSE-MsgGUID: W6WdCnKMTyCZy21Y5CLdig==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="57995640"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="57995640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 04:37:56 -0800
X-CSE-ConnectionGUID: 2ua8BplaQoSsNl4cbtHxxw==
X-CSE-MsgGUID: q78pW8EhRtCA1h7PIVERVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="229974111"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jan 2026 04:37:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjGQD-00000000Tx8-0siN;
	Fri, 23 Jan 2026 12:37:53 +0000
Date: Fri, 23 Jan 2026 20:37:52 +0800
From: kernel test robot <lkp@intel.com>
To: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 2/4] decoder: Add V4L2 stateless H.264 decoder
 driver
Message-ID: <202601232028.IzZvzH1B-lkp@intel.com>
References: <20260121-b4-s4-vdec-upstream-v3-2-4496aec3d79e@amlogic.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-b4-s4-vdec-upstream-v3-2-4496aec3d79e@amlogic.com>

Hi Zhentao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhentao-Guo-via-B4-Relay/media-dt-bindings-Add-Amlogic-V4L2-video-decoder/20260121-185011
base:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
patch link:    https://lore.kernel.org/r/20260121-b4-s4-vdec-upstream-v3-2-4496aec3d79e%40amlogic.com
patch subject: [PATCH RFC v3 2/4] decoder: Add V4L2 stateless H.264 decoder driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260123/202601232028.IzZvzH1B-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601232028.IzZvzH1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601232028.IzZvzH1B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:332:11: warning: variable 'gate_node' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     332 |         else if (id == VDEC_HEVC)
         |                  ^~~~~~~~~~~~~~~
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:335:6: note: uninitialized use occurs here
     335 |         if (gate_node) {
         |             ^~~~~~~~~
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:332:7: note: remove the 'if' if its condition is always true
     332 |         else if (id == VDEC_HEVC)
         |              ^~~~~~~~~~~~~~~~~~~~
     333 |                 gate_node = vdec_get_clk_by_name(hw, "clk_hevcf_mux");
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:328:33: note: initialize the variable 'gate_node' to silence this warning
     328 |         struct clk_bulk_data *gate_node;
         |                                        ^
         |                                         = NULL
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:372:11: warning: variable 'gate_node' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     372 |         else if (id == VDEC_HEVC)
         |                  ^~~~~~~~~~~~~~~
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:375:6: note: uninitialized use occurs here
     375 |         if (gate_node) {
         |             ^~~~~~~~~
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:372:7: note: remove the 'if' if its condition is always true
     372 |         else if (id == VDEC_HEVC)
         |              ^~~~~~~~~~~~~~~~~~~~
     373 |                 gate_node = vdec_get_clk_by_name(hw, "clk_hevcf_mux");
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:360:33: note: initialize the variable 'gate_node' to silence this warning
     360 |         struct clk_bulk_data *gate_node;
         |                                        ^
         |                                         = NULL
>> drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:463:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     463 |         if (hw->hw_ops.irq_handler)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:466:9: note: uninitialized use occurs here
     466 |         return ret;
         |                ^~~
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:463:2: note: remove the 'if' if its condition is always true
     463 |         if (hw->hw_ops.irq_handler)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
     464 |                 ret = hw->hw_ops.irq_handler(irq, priv);
   drivers/media/platform/amlogic/vdec/aml_vdec_hw.c:461:2: note: variable 'ret' is declared here
     461 |         irqreturn_t ret;
         |         ^
   3 warnings generated.
--
>> drivers/media/platform/amlogic/vdec/h264.c:1449:4: warning: variable 'h264_buffer_info_data_write_count' is uninitialized when used here [-Wuninitialized]
    1449 |                         h264_buffer_info_data_write_count++;
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/amlogic/vdec/h264.c:1364:39: note: initialize the variable 'h264_buffer_info_data_write_count' to silence this warning
    1364 |         int h264_buffer_info_data_write_count;
         |                                              ^
         |                                               = 0
   1 warning generated.


vim +332 drivers/media/platform/amlogic/vdec/aml_vdec_hw.c

   323	
   324	static void pm_vdec_power_domain_power_on(struct aml_vdec_hw *hw, int id)
   325	{
   326		const struct power_manager_s *pm = hw->pm;
   327		struct device *dev = pm->pd_data[id].dev;
   328		struct clk_bulk_data *gate_node;
   329	
   330		if (id == VDEC_1)
   331			gate_node = vdec_get_clk_by_name(hw, "clk_vdec_mux");
 > 332		else if (id == VDEC_HEVC)
   333			gate_node = vdec_get_clk_by_name(hw, "clk_hevcf_mux");
   334	
   335		if (gate_node) {
   336			clk_prepare_enable(gate_node->clk);
   337			if (id == VDEC_1) {
   338				clk_set_rate(gate_node->clk, 499999992);
   339				dev_dbg(hw->dev, "after set, vdec mux clock is %lu Hz\n",
   340					clk_get_rate(gate_node->clk));
   341			}
   342			dev_dbg(hw->dev, "the %-15s clock on\n", gate_node->id);
   343		} else {
   344			dev_info(hw->dev, "clk %d, unreachable\n", id);
   345		}
   346	
   347		if (dev) {
   348			pm_runtime_get_sync(dev);
   349			dev_dbg(dev, "dev: %p link %p the %-15s power on\n",
   350				dev, pm->pd_data[id].link, pm->pd_data[id].name);
   351		}
   352	
   353		dos_local_config(hw, 1, id);
   354	}
   355	
   356	static void pm_vdec_power_domain_power_off(struct aml_vdec_hw *hw, int id)
   357	{
   358		const struct power_manager_s *pm = hw->pm;
   359		struct device *dev = pm->pd_data[id].dev;
   360		struct clk_bulk_data *gate_node;
   361	
   362		dos_local_config(hw, 0, id);
   363	
   364		if (dev) {
   365			pm_runtime_put_sync(dev);
   366			dev_dbg(dev, "dev: %p link %p the %-15s power off\n",
   367				dev, pm->pd_data[id].link, pm->pd_data[id].name);
   368		}
   369	
   370		if (id == VDEC_1)
   371			gate_node = vdec_get_clk_by_name(hw, "clk_vdec_mux");
   372		else if (id == VDEC_HEVC)
   373			gate_node = vdec_get_clk_by_name(hw, "clk_hevcf_mux");
   374	
   375		if (gate_node) {
   376			clk_disable_unprepare(gate_node->clk);
   377			dev_dbg(hw->dev, "the %-15s clock off\n", gate_node->id);
   378		} else {
   379			dev_info(hw->dev, "clk %d, unreachable\n", id);
   380		}
   381	}
   382	
   383	static bool pm_vdec_power_domain_power_state(struct aml_vdec_hw *hw, int id)
   384	{
   385		if (hw->pm->pd_data[id].dev)
   386			return pm_runtime_active(hw->pm->pd_data[id].dev);
   387		else
   388			return false;
   389	}
   390	
   391	static void vdec_poweron(struct aml_vdec_hw *hw, enum vdec_type_e core)
   392	{
   393		if (core >= VDEC_MAX)
   394			return;
   395	
   396		mutex_lock(&hw->pm_mutex);
   397		if (!hw->pm->pd_data[core].dev)
   398			goto out;
   399	
   400		hw->pm->pd_data[core].ref_count++;
   401		if (hw->pm->pd_data[core].ref_count > 1)
   402			goto out;
   403	
   404		if (hw->pm->power_state(hw, core))
   405			goto out;
   406	
   407		hw->pm->power_on(hw, core);
   408	
   409	out:
   410		mutex_unlock(&hw->pm_mutex);
   411	}
   412	
   413	static void vdec_poweroff(struct aml_vdec_hw *hw, enum vdec_type_e core)
   414	{
   415		if (core >= VDEC_MAX)
   416			return;
   417	
   418		mutex_lock(&hw->pm_mutex);
   419		if (hw->pm->pd_data[core].ref_count == 0)
   420			goto out;
   421	
   422		hw->pm->pd_data[core].ref_count--;
   423		if (hw->pm->pd_data[core].ref_count > 0)
   424			goto out;
   425	
   426		hw->pm->power_off(hw, core);
   427	
   428	out:
   429		mutex_unlock(&hw->pm_mutex);
   430	}
   431	
   432	int vdec_enable(struct aml_vdec_hw *hw)
   433	{
   434		vdec_poweron(hw, VDEC_1);
   435	
   436		return 0;
   437	}
   438	
   439	int vdec_disable(struct aml_vdec_hw *hw)
   440	{
   441		vdec_poweroff(hw, VDEC_1);
   442	
   443		return 0;
   444	}
   445	
   446	static const struct power_manager_s pm[] = {
   447		[AML_PM_PD] = {
   448			.pd_data    = vdec_domain_data,
   449			.init        = pm_vdec_power_domain_init,
   450			.release    = pm_vdec_power_domain_release,
   451			.power_on    = pm_vdec_power_domain_power_on,
   452			.power_off    = pm_vdec_power_domain_power_off,
   453			.power_state = pm_vdec_power_domain_power_state,
   454		},
   455	};
   456	
   457	static irqreturn_t vdec_irq_handler(int irq, void *priv)
   458	{
   459		struct aml_vdec_dev *dev = (struct aml_vdec_dev *)priv;
   460		struct aml_vdec_hw *hw = dev->dec_hw;
   461		irqreturn_t ret;
   462	
 > 463		if (hw->hw_ops.irq_handler)
   464			ret = hw->hw_ops.irq_handler(irq, priv);
   465	
   466		return ret;
   467	}
   468	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
