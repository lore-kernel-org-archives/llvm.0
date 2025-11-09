Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C19B3207;
	Sun,  9 Nov 2025 03:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762659036; cv=none; b=uaSShGslkM3gvcerCm1IU7SPQ00WBcw1rgCAAn2GEqGcw0BnPtnyiMiR9P/jQeAzza5ArwIytCbEVwoXcQd5fPLqm9HZwo2y6uY3cSyA3XT27GgrHnRDLEOg95FpBmn1wHq96q7XCX6r5uyKzoYUGO02HnRliWsm8qy5EJgMXxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762659036; c=relaxed/simple;
	bh=yZEAGwURIMOpNzUf3sxYiyZAyBr02IHF5nAGfKtPkWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngvG7rR27zagKg0qCtVjQye7Yx0YAXUTtttJuDEMLz/FTv2z8IB1fg8WrE/J6L5VsxDg3Rrw/vN73kg8ZfQ/L6Zporrxc/B6QUqSyFTvC1FWBA8FUbXLbNuxtX2tHMPjAtZWK1CxE292Cv/ai9NQCymSwevDnhBk4ID3d0ief8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aB6CrVDv; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aB6CrVDv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762659035; x=1794195035;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yZEAGwURIMOpNzUf3sxYiyZAyBr02IHF5nAGfKtPkWQ=;
  b=aB6CrVDvuxnwwl9it4fAOuE70jDS9Yf3Gobmu/albaq1yofJ79zIZ+jb
   /nXwGMbQWXpHFh1M74ccFL+1wn6KHQL9oaKIwlPME76GD0R1tcY8qAF/b
   wy34E3VllVuXwqLZ4xwwMhvvroiTSVcJP4cg/s3WyGXa903PnaN0DYExm
   SJ2z6ZEysY/OSDlayByc2X8yZMMKdFlhmNxHYoI1MaG6p20jimOtvALLb
   eXXtGAyNuiuZC2bnUMzTqj2vlUnkd/EvJnrcbJvF6KcFS/nt+hc2qcyG+
   T5kYHb3xr7XRh6T8ZcBwp3eIzr/WaF3a36qC6F62aFLxIrAhOEgJCTcB8
   A==;
X-CSE-ConnectionGUID: InZ8kJ8OSR2UjBt/6KPtRA==
X-CSE-MsgGUID: fP470gUXTdiy3p8gh7ikKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="76204008"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="76204008"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 19:30:34 -0800
X-CSE-ConnectionGUID: rwuu/ZJ7QQWX2vhcHh3YPQ==
X-CSE-MsgGUID: 3SOf6dZuR7e+sb/YSRa2mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="192766924"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Nov 2025 19:30:32 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHw8L-0001jj-1S;
	Sun, 09 Nov 2025 03:30:29 +0000
Date: Sun, 9 Nov 2025 11:30:07 +0800
From: kernel test robot <lkp@intel.com>
To: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, kernel test robot <lkp@intel.com>,
	Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/5] media: iris: Add support for AV1 format in iris
 decoder
Message-ID: <202511091157.56GOf0kL-lkp@intel.com>
References: <20251107-av1d_stateful_v3-v5-3-351652ba49cd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-av1d_stateful_v3-v5-3-351652ba49cd@oss.qualcomm.com>

Hi Deepa,

kernel test robot noticed the following build errors:

[auto build test ERROR on 163917839c0eea3bdfe3620f27f617a55fd76302]

url:    https://github.com/intel-lab-lkp/linux/commits/Deepa-Guthyappa-Madivalara/media-uapi-videodev2-Add-support-for-AV1-stateful-decoder/20251108-122511
base:   163917839c0eea3bdfe3620f27f617a55fd76302
patch link:    https://lore.kernel.org/r/20251107-av1d_stateful_v3-v5-3-351652ba49cd%40oss.qualcomm.com
patch subject: [PATCH v5 3/5] media: iris: Add support for AV1 format in iris decoder
config: powerpc-randconfig-002-20251109 (https://download.01.org/0day-ci/archive/20251109/202511091157.56GOf0kL-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b9ea93cd5c37fb6d606502fd01208dd48330549d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091157.56GOf0kL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091157.56GOf0kL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:20:48: error: array has incomplete element type 'struct iris_fmt'
      20 | static struct iris_fmt platform_fmts_sm8250_dec[] = {
         |                                                ^
   drivers/media/platform/qcom/iris/iris_platform_common.h:217:9: note: forward declaration of 'struct iris_fmt'
     217 |         struct iris_fmt *inst_iris_fmts;
         |                ^
>> drivers/media/platform/qcom/iris/iris_platform_sm8250.c:21:3: error: use of undeclared identifier 'IRIS_FMT_H264'
      21 |         [IRIS_FMT_H264] = {
         |          ^~~~~~~~~~~~~
   2 errors generated.


vim +20 drivers/media/platform/qcom/iris/iris_platform_sm8250.c

    19	
  > 20	static struct iris_fmt platform_fmts_sm8250_dec[] = {
  > 21		[IRIS_FMT_H264] = {
    22			.pixfmt = V4L2_PIX_FMT_H264,
    23			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    24		},
    25		[IRIS_FMT_HEVC] = {
    26			.pixfmt = V4L2_PIX_FMT_HEVC,
    27			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    28		},
    29		[IRIS_FMT_VP9] = {
    30			.pixfmt = V4L2_PIX_FMT_VP9,
    31			.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
    32		},
    33	};
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
