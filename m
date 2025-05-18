Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171FC158520;
	Sun, 18 May 2025 04:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747543982; cv=none; b=KcPhjFfqL86NX38shkxSUHrWOKW3I1/owMkmVZe623ieW1F6FPH9rdoZ6GTWPbmvoJ852fiyId4GCODHpBxO90EURtwQq6oP7rAuQQmMyndTkQxREbchc384BhZQ05x6WW9hDVqdjF51HP4ghnUMShx8F+p2of9MbBFpUOS1C6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747543982; c=relaxed/simple;
	bh=Tl+/bI4JwREUGkxjpSb0RGZADW8LJu4lETQehDCuUv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aR66CQ+IHH0kILDmCeCfCj1+Kz4zpaTkpp8lelVzOpoYrOLd8K7Ft7YRoigFPJK1rqO4DLV90eCdQj3M85uTVa0Hs/pvd1RySX2nO9fDoYxGzcCt4lvkN5ycZLVDUJOsGnTFqtSlFzd7VhoepRVWEZAapFC5Ksk0rKuWXth4lN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XXOqozKB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XXOqozKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747543981; x=1779079981;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tl+/bI4JwREUGkxjpSb0RGZADW8LJu4lETQehDCuUv4=;
  b=XXOqozKBrxiTbog0/qsxMQr1Wm+G09Yfq3fLkIunFJAr4juafR9xYK4g
   /PwEuYSJFhMqdltmyHUW0y2mTv8xL056Y2eGqaKjJ7y6NkjtEdqZ7dA42
   sxoAtmWH1kDVoKrp6L1w1u46kbFlYdSPiggwn8NxNrq6bXgk9vvB3tAsx
   3pMvKWH62C2XGRC8TDBptlGZeUbwIKnGPhCG2Drf8CxBvNvL6mIX3wdJ1
   Urno08EMRT02UU6ZvuxMRaVY24CtGjcva70+TMrTo8W6Zpr3PxoW+ZRRu
   4BD/6v1YJK7XbxftxgGVW2AN83rR+gkTRltmDsSFqnuhRCq/IR/QrVf9m
   A==;
X-CSE-ConnectionGUID: HqLdAThrQ8izXGB6TlXkdw==
X-CSE-MsgGUID: rf6oZC0ZQSKrpmxcEyallA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="71970903"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="71970903"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 21:52:59 -0700
X-CSE-ConnectionGUID: Ji3GgWruQTawsTWaFD8C7g==
X-CSE-MsgGUID: sWiKOAwCRIq8RtY64V/4nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="140072658"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 May 2025 21:52:55 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGW16-000Kcp-22;
	Sun, 18 May 2025 04:52:52 +0000
Date: Sun, 18 May 2025 12:52:31 +0800
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
Subject: Re: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common
 UBWC config
Message-ID: <202505181204.fkaJyv3U-lkp@intel.com>
References: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517-topic-ubwc_central-v3-4-3c8465565f86@oss.qualcomm.com>

Hi Konrad,

kernel test robot noticed the following build errors:

[auto build test ERROR on edef457004774e598fc4c1b7d1d4f0bcd9d0bb30]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/soc-qcom-Add-UBWC-config-provider/20250518-013605
base:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
patch link:    https://lore.kernel.org/r/20250517-topic-ubwc_central-v3-4-3c8465565f86%40oss.qualcomm.com
patch subject: [PATCH RFT v3 04/14] drm/msm/a6xx: Get a handle to the common UBWC config
config: arm64-randconfig-004-20250518 (https://download.01.org/0day-ci/archive/20250518/202505181204.fkaJyv3U-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181204.fkaJyv3U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505181204.fkaJyv3U-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: qcom_ubwc_config_get_data
   >>> referenced by a6xx_gpu.c
   >>>               drivers/gpu/drm/msm/adreno/a6xx_gpu.o:(a6xx_gpu_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
