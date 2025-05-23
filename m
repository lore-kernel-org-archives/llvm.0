Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734AE2951A4;
	Fri, 23 May 2025 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748009582; cv=none; b=MhACoIz4P7bUz1RE9LnZ218GaWBSL8VpT4ayeOhhgo+yh4BVXSUQZf1lLUiyWqoBLn/fRG5PIBbydkgGCHhcM1l9DSuQPukAACU96N9ow+VAoHQtXm1Mh/evxZxQYbNCdoBhuMw/jQfo59R2scODbBRMsORsU6sGB0YO0Is69hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748009582; c=relaxed/simple;
	bh=VEw9g+Y6z8SV/AJFtCHVvHT+Tr2s96r6avFoKVwLcMw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DYIveY62G/0T6IiuYz2cbLIfMMxuQG/ojs+CNN1UkJN9sYviN+KNoq56zHb8p8yL9rwfBrYt08ekvY5qI9QP5dXk/IjUi0ebatqJizhwrQTY4iBxTStyTRdPBhAies1I0c9sVlCRPBfavg9SfjOyBUR13HPgrCa0q2mVnsbqJgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTKMvd+A; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTKMvd+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748009581; x=1779545581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VEw9g+Y6z8SV/AJFtCHVvHT+Tr2s96r6avFoKVwLcMw=;
  b=eTKMvd+AdkhDuwibTC84MGqE++ePceW6xmXZnUzqMsub4KcvGXUAWtX/
   cgqyzXXWV19FsrkGzj1QyYxPnEqsU9iD18/PDK2tQqQaHSsDwAFSR5GjI
   KFtZFQSJu8o/6v+/+3YL+73N5+KvBsY8RXHkcH62k5ABGRjubCD0C9mc0
   ElJev2Rnpayn0M4Vegr4rt7s88jQq7Zf6nZoaF9RJsjHYQccTFfpHafIY
   wpqpAXPLaAsPnjTSg5kjdnwk9gjNkAQfxju4NHvVANTTBJEzT5ZImHDMO
   3CrQGpHWBYYApTlVaziHFZzZjGjLn6wNOkxj2IUMPPMrKQvI6TTPZxGfY
   w==;
X-CSE-ConnectionGUID: Lqrx7r0gRjue8lA+uvccNQ==
X-CSE-MsgGUID: mQN6huwYSWqKJtaa1s4S8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60704630"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="60704630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 07:13:00 -0700
X-CSE-ConnectionGUID: dy0QLecFTPCYCD6Ep+MgNw==
X-CSE-MsgGUID: 4JsS9jY6TjiYoinIsMaa9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; 
   d="scan'208";a="145111104"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 May 2025 07:12:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIT8p-000QRP-2T;
	Fri, 23 May 2025 14:12:55 +0000
Date: Fri, 23 May 2025 22:12:23 +0800
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Melody Olvera <melody.olvera@oss.qualcomm.com>
Subject: [krzk-github:n/sm8750-audio-part-3 6/21]
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:10: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202505232228.17gTDAsa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/sm8750-audio-part-3
head:   adac035ce9cf16b4bf5bcad64478178ae722e65e
commit: 053002707bd34cee1887aa5952f4a8e573eb419b [6/21] phy: qcom: Add M31 based eUSB2 PHY driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250523/202505232228.17gTDAsa-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250523/202505232228.17gTDAsa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505232228.17gTDAsa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/phy/qualcomm/phy-qcom-m31-eusb2.c:210:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |                                      FIELD_PREP(FSEL, data->fsel));
         |                                      ^
   1 error generated.


vim +/FIELD_PREP +210 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c

   177	
   178	static int m31eusb2_phy_init(struct phy *uphy)
   179	{
   180		struct m31eusb2_phy *phy = phy_get_drvdata(uphy);
   181		const struct m31_eusb2_priv_data *data = phy->data;
   182		int ret;
   183	
   184		ret = regulator_bulk_enable(M31_EUSB_NUM_VREGS, phy->vregs);
   185		if (ret) {
   186			dev_err(&uphy->dev, "failed to enable regulator, %d\n", ret);
   187			return ret;
   188		}
   189	
   190		ret = phy_init(phy->repeater);
   191		if (ret) {
   192			dev_err(&uphy->dev, "repeater init failed. %d\n", ret);
   193			goto disable_vreg;
   194		}
   195	
   196		ret = clk_prepare_enable(phy->clk);
   197		if (ret) {
   198			dev_err(&uphy->dev, "failed to enable cfg ahb clock, %d\n", ret);
   199			goto disable_repeater;
   200		}
   201	
   202		/* Perform phy reset */
   203		reset_control_assert(phy->reset);
   204		udelay(5);
   205		reset_control_deassert(phy->reset);
   206	
   207		m31eusb2_phy_write_sequence(phy, data->setup_seq, data->setup_seq_nregs);
   208		m31eusb2_phy_write_readback(phy->base,
   209					     USB_PHY_HS_PHY_CTRL_COMMON0, FSEL,
 > 210					     FIELD_PREP(FSEL, data->fsel));
   211		m31eusb2_phy_write_sequence(phy, data->override_seq, data->override_seq_nregs);
   212		m31eusb2_phy_write_sequence(phy, data->reset_seq, data->reset_seq_nregs);
   213	
   214		return 0;
   215	
   216	disable_repeater:
   217		phy_exit(phy->repeater);
   218	disable_vreg:
   219		regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
   220	
   221		return 0;
   222	}
   223	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
