Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B8635970;
	Thu, 15 May 2025 10:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747305213; cv=none; b=QcSKmdwFqtelVT+DsGnjUYlJZnzK1PLKQvQbT7bnl92ZGGLxp5CKE38q3QEFrrp4cHXF92k1aq7GTKaoeJtn6DhQawbUlrBBvWCbISX9VB/M2bfZWUo8vW5NEb+CCLWUsrCd1I8OJm2SVa5EDMO1qIaW0+XAB0VgLns1CN+iQaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747305213; c=relaxed/simple;
	bh=xCYQ6WOiz9cUOPIBQEVZI/wwHsBuLl5q9YtMNp2XXEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgkHv95XtHJ95ag0Se8LjlU3z0O7kZp5k/RlOgc11XNgvn8La+LiLpmmRC5gnhTCSd7bCNR4dcxS/0gTSmiLy17Lm1rjpz3ScJf29rXGmMudShom6rJJL+e1uCGS1Tpw38i3e9hGZmO0fLHq99sg7q0E6sfBWFdhcRJaHfl4GRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YcHwxIi9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YcHwxIi9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747305211; x=1778841211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xCYQ6WOiz9cUOPIBQEVZI/wwHsBuLl5q9YtMNp2XXEw=;
  b=YcHwxIi9/dJww3sYc3YUHGi7WV/Ii4Nu4Qthvj2PR8X4+rez1zJmlbYR
   6FcwnC8GXrux0AM9fcCsQTcKrStuzMiSWAoU4Nwez4nLrJvOdmRkx416m
   p9MRouPOARzsi+mIe9NHQvDdgwBZm5rAhpB+m2OhvtSM9TTMTWWJ5QoDC
   rvaZ6WKIjBWTP0Yni71BXGaxQ5be3RWVFGnwt8LxDFb7v6fAXo/OpB4Is
   8XZk57mP2I1hyc5KhAO7jU3nwiyHgYaDF2yXsnJiUD5AqqN7dQulPonUD
   zoKaMWi8LInQGLBz1D+0cWpZ5CSnIfvdZjZIXMYOHZyPppohAx1YlPo73
   g==;
X-CSE-ConnectionGUID: zJOmsNz0TH+qDp8aoZwi2w==
X-CSE-MsgGUID: vLHNddixSEKUtv4nC9hNiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="48351615"
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="48351615"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 03:33:30 -0700
X-CSE-ConnectionGUID: isaNyDEPQLy1etpJfSyzrw==
X-CSE-MsgGUID: qKdApXCJTRCaDS+AROvpwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,290,1739865600"; 
   d="scan'208";a="138733577"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2025 03:33:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFVu1-000IHP-13;
	Thu, 15 May 2025 10:33:25 +0000
Date: Thu, 15 May 2025 18:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config
 database
Message-ID: <202505151822.QNn0FQXs-lkp@intel.com>
References: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-ubwc_central-v2-3-09ecbc0a05ce@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on edef457004774e598fc4c1b7d1d4f0bcd9d0bb30]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-Add-UBWC-config-provider/20250514-231354
base:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
patch link:    https://lore.kernel.org/r/20250514-topic-ubwc_central-v2-3-09ecbc0a05ce%40oss.qualcomm.com
patch subject: [PATCH RFT v2 03/15] drm/msm: Use the central UBWC config database
config: arm64-randconfig-002-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151822.QNn0FQXs-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250515/202505151822.QNn0FQXs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151822.QNn0FQXs-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> drivers/soc/qcom/ubwc_config.c:41:40: warning: unused variable 'sar2130p_data' [-Wunused-const-variable]
41 | static const struct qcom_ubwc_cfg_data sar2130p_data = {
|                                        ^~~~~~~~~~~~~
1 warning generated.
--
ERROR: modpost: missing MODULE_LICENSE() in drivers/soc/qcom/ubwc_config.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/qcom/ubwc_config.o
>> ERROR: modpost: "qcom_ubwc_config_get_data" [drivers/gpu/drm/msm/msm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
