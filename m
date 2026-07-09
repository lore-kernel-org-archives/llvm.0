Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB5395AF2;
	Thu,  9 Jul 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783594399; cv=none; b=FNPuj8G41EyyLCnnOM/94nirL+elTkHINpW+WyAw51t60SBukl+pWa8n9WrJrXxFfTN2429aeu45tdwMSyZGkmYWbd2v/v1naN1g7VpI8iNalshPgtb4kIy1tAkvCoopapSz5jMl+y8ckQRhDVYR+WY6+K2nnXDXnowzGMyPGe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783594399; c=relaxed/simple;
	bh=QRWbRrvdOkA2fUjJ7rDVU9KEQybWoqDrykDN2YxjDWI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oD6l2E4nNSSSfQMtIyR2Cb+a+gbCzzPHbz/+Cd3Ho8z+5pZRlUjVr+bV7AEhkxv3NdT1568EZfd83bHzTFZ26q1R+IJawvCXQxcNHzqqYEla2S/z4QaiXpIiGMeaTB+o6T7dOINqq/M+B2TwIsF3rESaquI1gu0P3EiYE1bOats=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUPGaQgc; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUPGaQgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783594397; x=1815130397;
  h=date:from:to:cc:subject:message-id;
  bh=QRWbRrvdOkA2fUjJ7rDVU9KEQybWoqDrykDN2YxjDWI=;
  b=bUPGaQgchKvMXoKQ3lVN+L5HnpVfGk4idANup29gxa0PusLG+Tu5pXUy
   6wpb0myaQIklQeS1ZuO60189hagxV6qHxCRqSgOGgBoAZfeynDvjIZVBa
   Kqq5qSX+BL8hHVYIhQkSTkCV6yO3dB1epYUwKNKdxxDXEG5p6yfXSloSO
   1mXixHjXp9F1U3J3k4M8Ch2IP7W8tbMJZVma2DO4y/qazPzsbIaFVcwUb
   FzOs0t1HN0M5F9Tx2W7Ne6GB0am3yGhRvsqcrxmDfIfmadeDpWpTouytw
   SjwCEsmLriA2pOjsFX7csy02rqCNLBlDzTYo5N8Rh6lMxGL32rXK8/7If
   g==;
X-CSE-ConnectionGUID: pbgwJ/YtSACnuTPwLAOM7w==
X-CSE-MsgGUID: 0OYc2/1hR9K6i5oLVKTdTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88098589"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88098589"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 03:53:10 -0700
X-CSE-ConnectionGUID: KV8HvlrDSseQNRJA6BMZ4Q==
X-CSE-MsgGUID: I54uSt6ZQSayvdL8o3K3+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292742150"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 03:53:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whmNM-00000000Ha3-41H3;
	Thu, 09 Jul 2026 10:53:04 +0000
Date: Thu, 09 Jul 2026 18:53:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [qcom:drivers-for-7.3 22/23]
 drivers/soc/qcom/ubwc_config.c:148:3: error: expected expression
Message-ID: <202607091818.AlP3a58a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-7.3
head:   05b03f88af1fe82d23b5f88b286b1ac2987b3177
commit: a45af9d6e6175473c8744c0f1cf2348f641e3029 [22/23] soc: qcom: ubwc: Add Shikra UBWC config
config: arm64-randconfig-003-20260709 (https://download.01.org/0day-ci/archive/20260709/202607091818.AlP3a58a-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091818.AlP3a58a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091818.AlP3a58a-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/soc/qcom/ubwc_config.c:148:3: error: expected expression
     148 | +       { .compatible = "qcom,shikra", .data = &ubwc_0_0_hbb15, },
         |         ^
   1 error generated.


vim +148 drivers/soc/qcom/ubwc_config.c

   106	
   107	static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
   108		{ .compatible = "qcom,apq8016", .data = &no_ubwc_data },
   109		{ .compatible = "qcom,apq8026", .data = &no_ubwc_data },
   110		{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
   111		{ .compatible = "qcom,apq8096", .data = &ubwc_1_0_hbb15 },
   112		{ .compatible = "qcom,eliza", .data = &ubwc_5_0_hbb15 },
   113		{ .compatible = "qcom,glymur", .data = &glymur_data},
   114		{ .compatible = "qcom,kaanapali", .data = &ubwc_6_0_hbb16 },
   115		{ .compatible = "qcom,mahua", .data = &glymur_data },
   116		{ .compatible = "qcom,milos", .data = &milos_data },
   117		{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
   118		{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
   119		{ .compatible = "qcom,msm8917", .data = &no_ubwc_data },
   120		{ .compatible = "qcom,msm8937", .data = &ubwc_1_0_hbb14 },
   121		{ .compatible = "qcom,msm8929", .data = &no_ubwc_data },
   122		{ .compatible = "qcom,msm8939", .data = &no_ubwc_data },
   123		{ .compatible = "qcom,msm8953", .data = &ubwc_1_0_hbb14 },
   124		{ .compatible = "qcom,msm8956", .data = &no_ubwc_data },
   125		{ .compatible = "qcom,msm8974", .data = &no_ubwc_data },
   126		{ .compatible = "qcom,msm8976", .data = &no_ubwc_data },
   127		{ .compatible = "qcom,msm8996", .data = &ubwc_1_0_hbb15 },
   128		{ .compatible = "qcom,msm8998", .data = &ubwc_1_0_hbb15 },
   129		{ .compatible = "qcom,qcm2290", .data = &ubwc_0_0_hbb15, },
   130		{ .compatible = "qcom,qcm6490", .data = &ubwc_3_1_hbb14, },
   131		{ .compatible = "qcom,qcs8300", .data = &ubwc_4_0_hbb16, },
   132		{ .compatible = "qcom,sa8155p", .data = &ubwc_3_0_hbb15, },
   133		{ .compatible = "qcom,sa8540p", .data = &ubwc_4_0_hbb16, },
   134		{ .compatible = "qcom,sa8775p", .data = &sa8775p_data, },
   135		{ .compatible = "qcom,sar2130p", .data = &ubwc_3_1_hbb13 },
   136		{ .compatible = "qcom,sc7180", .data = &ubwc_2_0_hbb14, },
   137		{ .compatible = "qcom,sc7280", .data = &ubwc_3_1_hbb14, },
   138		{ .compatible = "qcom,sc8180x", .data = &ubwc_3_1_hbb16, },
   139		{ .compatible = "qcom,sc8280xp", .data = &ubwc_4_0_hbb16, },
   140		{ .compatible = "qcom,sda660", .data = &ubwc_1_0_hbb14 },
   141		{ .compatible = "qcom,sdm450", .data = &ubwc_1_0_hbb14 },
   142		{ .compatible = "qcom,sdm630", .data = &ubwc_1_0_hbb14 },
   143		{ .compatible = "qcom,sdm632", .data = &ubwc_1_0_hbb14 },
   144		{ .compatible = "qcom,sdm636", .data = &ubwc_1_0_hbb14 },
   145		{ .compatible = "qcom,sdm660", .data = &ubwc_1_0_hbb14 },
   146		{ .compatible = "qcom,sdm670", .data = &ubwc_2_0_hbb14, },
   147		{ .compatible = "qcom,sdm845", .data = &ubwc_2_0_hbb15, },
 > 148	+	{ .compatible = "qcom,shikra", .data = &ubwc_0_0_hbb15, },
   149		{ .compatible = "qcom,sm4250", .data = &ubwc_1_0_hbb14, },
   150		{ .compatible = "qcom,sm6115", .data = &ubwc_1_0_hbb14, },
   151		{ .compatible = "qcom,sm6125", .data = &ubwc_1_0_hbb14, },
   152		{ .compatible = "qcom,sm6150", .data = &ubwc_2_0_hbb14, },
   153		{ .compatible = "qcom,sm6350", .data = &ubwc_2_0_hbb14, },
   154		{ .compatible = "qcom,sm6375", .data = &ubwc_2_0_hbb14, },
   155		{ .compatible = "qcom,sm7125", .data = &ubwc_2_0_hbb14, },
   156		{ .compatible = "qcom,sm7150", .data = &ubwc_2_0_hbb14, },
   157		{ .compatible = "qcom,sm7225", .data = &ubwc_2_0_hbb14, },
   158		{ .compatible = "qcom,sm7325", .data = &ubwc_3_1_hbb14, },
   159		{ .compatible = "qcom,sm8150", .data = &ubwc_3_0_hbb15, },
   160		{ .compatible = "qcom,sm8250", .data = &ubwc_4_0_hbb16, },
   161		{ .compatible = "qcom,sm8350", .data = &ubwc_4_0_hbb16, },
   162		{ .compatible = "qcom,sm8450", .data = &ubwc_4_0_hbb16, },
   163		{ .compatible = "qcom,sm8550", .data = &ubwc_4_0_hbb16, },
   164		{ .compatible = "qcom,sm8650", .data = &ubwc_4_0_hbb16, },
   165		{ .compatible = "qcom,sm8750", .data = &ubwc_5_0_hbb16, },
   166		{ .compatible = "qcom,x1e80100", .data = &ubwc_4_0_hbb16, },
   167		{ .compatible = "qcom,x1p42100", .data = &ubwc_4_0_hbb16, },
   168		{ }
   169	};
   170	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
