Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6C3203719;
	Thu, 13 Feb 2025 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469491; cv=none; b=MWSAwY4+MAm8OgJ5YmKRYkcrWtl70WvhIeaAlCN1rZvJBO8/uUBV9IeckD6eXxGoKPt12hWMCInS5P/jYZq61rrfKQsp2MKeOfTc3h7+cZD5X+zLdlsUu32xQGpoT93ODgUzLn0SUCv8ALLgafza86fgP5AArgLJVb1TK7vk2a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469491; c=relaxed/simple;
	bh=pTjnXaCkQBe1kTuxOtbflijiIwkKRuna0EHZiG09u8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=io36BBOe+xfHn9gqnaaUogSbyccD7XD/GVkHjIQCrKFziipQMUEFlYWMKYLtTyvepGGeVYfoYeFyX7Vies1qXT3BomUZ/5FnpVO4MB0YV3qL9/QIffuCVKm32fahj5ggT0uP2f/CIFBcI2ubFx9do0YE7Hc4y5tisE6DSnvkLPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KWJafUJA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KWJafUJA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739469490; x=1771005490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pTjnXaCkQBe1kTuxOtbflijiIwkKRuna0EHZiG09u8U=;
  b=KWJafUJATlFw6x3we5mN1eCb63j/9Z3mXaNoiymMgwuYVPtDgvO1VvpA
   namwn5uI/4pInCMhRkN+DUH5zEbQYqhBuFdDW+eZ34v/U0B3WZzwmL3lu
   14C/JlH8I8pDIvhOHwaDNMPeS0qFdN4JjtY9oibX3EvqhWJI+v/YCfD/Q
   Yr+pabVodakQsJQiB0Ig/GBJk5VKrP3SCdkqllD8eIwsLjJ5VhFCW6m9X
   515xZWtD/crMGxSmXRXdgyPMQitNOkaPng3GTvGFDUdbNvu9TkAOXAbNA
   xrHVUDyGvZV6HSMAZyRD3AD8aBD6/Zkx+vWm6c40yF+oKf9oOwH/oxVA9
   Q==;
X-CSE-ConnectionGUID: 9Zr3OWl5RVu6y81d/uKlJw==
X-CSE-MsgGUID: 2PvjQybaSCCIyGjzgvxkkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="50403715"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="50403715"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 09:58:10 -0800
X-CSE-ConnectionGUID: 4qEqk1NFRhmOic3KQJeF1A==
X-CSE-MsgGUID: ucHdIhxJT5ai2XhG0mjBOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118417026"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Feb 2025 09:58:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tidTS-0018XF-0S;
	Thu, 13 Feb 2025 17:58:06 +0000
Date: Fri, 14 Feb 2025 01:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/str-enable-disable 35/36]
 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:188:35: warning: unused
 variable 'wlfw_mem_seg_s_v01_ei'
Message-ID: <202502140139.1APWnYEK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/str-enable-disable
head:   6c9652f6b59a48e3ffc567fb41acbe262a9b0357
commit: 021178bf9ed9bf280ce069f32ccd284d4a497e6a [35/36] wifi
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250214/202502140139.1APWnYEK-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502140139.1APWnYEK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502140139.1APWnYEK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:188:35: warning: unused variable 'wlfw_mem_seg_s_v01_ei' [-Wunused-const-variable]
     188 | static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c:229:35: warning: unused variable 'wlfw_mem_seg_resp_s_v01_ei' [-Wunused-const-variable]
     229 | static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/wlfw_mem_seg_s_v01_ei +188 drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.c

bc17d4b90cdd3e Govind Singh 2018-10-11  187  
11e1fcf2b494da Jeff Johnson 2022-09-14 @188  static const struct qmi_elem_info wlfw_mem_seg_s_v01_ei[] = {
bc17d4b90cdd3e Govind Singh 2018-10-11  189  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  190  		.data_type      = QMI_UNSIGNED_4_BYTE,
bc17d4b90cdd3e Govind Singh 2018-10-11  191  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  192  		.elem_size      = sizeof(u32),
bc17d4b90cdd3e Govind Singh 2018-10-11  193  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  194  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  195  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  196  					   size),
bc17d4b90cdd3e Govind Singh 2018-10-11  197  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  198  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  199  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
bc17d4b90cdd3e Govind Singh 2018-10-11  200  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  201  		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
bc17d4b90cdd3e Govind Singh 2018-10-11  202  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  203  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  204  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  205  					   type),
bc17d4b90cdd3e Govind Singh 2018-10-11  206  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  207  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  208  		.data_type      = QMI_DATA_LEN,
bc17d4b90cdd3e Govind Singh 2018-10-11  209  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  210  		.elem_size      = sizeof(u8),
bc17d4b90cdd3e Govind Singh 2018-10-11  211  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  212  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  213  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  214  					   mem_cfg_len),
bc17d4b90cdd3e Govind Singh 2018-10-11  215  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  216  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  217  		.data_type      = QMI_STRUCT,
bc17d4b90cdd3e Govind Singh 2018-10-11  218  		.elem_len       = QMI_WLFW_MAX_NUM_MEM_CFG_V01,
bc17d4b90cdd3e Govind Singh 2018-10-11  219  		.elem_size      = sizeof(struct wlfw_mem_cfg_s_v01),
bc17d4b90cdd3e Govind Singh 2018-10-11  220  		.array_type       = VAR_LEN_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  221  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  222  		.offset         = offsetof(struct wlfw_mem_seg_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  223  					   mem_cfg),
bc17d4b90cdd3e Govind Singh 2018-10-11  224  		.ei_array      = wlfw_mem_cfg_s_v01_ei,
bc17d4b90cdd3e Govind Singh 2018-10-11  225  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  226  	{}
bc17d4b90cdd3e Govind Singh 2018-10-11  227  };
bc17d4b90cdd3e Govind Singh 2018-10-11  228  
11e1fcf2b494da Jeff Johnson 2022-09-14 @229  static const struct qmi_elem_info wlfw_mem_seg_resp_s_v01_ei[] = {
bc17d4b90cdd3e Govind Singh 2018-10-11  230  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  231  		.data_type      = QMI_UNSIGNED_8_BYTE,
bc17d4b90cdd3e Govind Singh 2018-10-11  232  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  233  		.elem_size      = sizeof(u64),
bc17d4b90cdd3e Govind Singh 2018-10-11  234  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  235  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  236  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  237  					   addr),
bc17d4b90cdd3e Govind Singh 2018-10-11  238  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  239  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  240  		.data_type      = QMI_UNSIGNED_4_BYTE,
bc17d4b90cdd3e Govind Singh 2018-10-11  241  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  242  		.elem_size      = sizeof(u32),
bc17d4b90cdd3e Govind Singh 2018-10-11  243  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  244  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  245  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  246  					   size),
bc17d4b90cdd3e Govind Singh 2018-10-11  247  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  248  	{
bc17d4b90cdd3e Govind Singh 2018-10-11  249  		.data_type      = QMI_SIGNED_4_BYTE_ENUM,
bc17d4b90cdd3e Govind Singh 2018-10-11  250  		.elem_len       = 1,
bc17d4b90cdd3e Govind Singh 2018-10-11  251  		.elem_size      = sizeof(enum wlfw_mem_type_enum_v01),
bc17d4b90cdd3e Govind Singh 2018-10-11  252  		.array_type     = NO_ARRAY,
bc17d4b90cdd3e Govind Singh 2018-10-11  253  		.tlv_type       = 0,
bc17d4b90cdd3e Govind Singh 2018-10-11  254  		.offset         = offsetof(struct wlfw_mem_seg_resp_s_v01,
bc17d4b90cdd3e Govind Singh 2018-10-11  255  					   type),
bc17d4b90cdd3e Govind Singh 2018-10-11  256  	},
bc17d4b90cdd3e Govind Singh 2018-10-11  257  	{}
bc17d4b90cdd3e Govind Singh 2018-10-11  258  };
bc17d4b90cdd3e Govind Singh 2018-10-11  259  

:::::: The code at line 188 was first introduced by commit
:::::: 11e1fcf2b494da810d551553c46f739e36501adc wifi: ath10k: Make QMI message rules const

:::::: TO: Jeff Johnson <quic_jjohnson@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
