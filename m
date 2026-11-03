Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747985;
	b=UsrwLPb95XcMVl+rd3UkPxxZQZfU2oLIBcmX6EthCfQrcgmDvzVQ2YbpwkDiE6sgQE1B
	 +V9jWpXvtI3x54LuiJ8dJOqxXnmvitnMEBl42UQJmUvUVw9vCM5mBV+PAwjLO6coWrrMY
	 4QJdwMxNI8xeD7OHhZZumUP4CWolQbj65dmbmgmxHL0x2PzqkScZF08IKfhptKrMI1yp0
	 dig9Sz4GQxLFXsVKDiOvSwfaWDwt0rnaoeVR9hvhUmzFhXE/DfdVN4Ngy+dxMODmqyifL
	 FSXXG3RKLzQVLwO4vzEor7YAE9etl3oVEvTr4YfiNGGg6wMUzhk5rEz6xBh/cLHmS4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747985;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ge8nPcGUxBsvSUK/jINOGmSzjSvUlXilvyC+0rJ7oiE=;
	b=U6/pJUjrt+a2V77QY+iniljeS9ZCbYjgLqeam/1q+ldgJDUxfT3E4ovtvgLxQJ4uX37l
	 h474sS+Nu4PChOpSA1AKl/1h6La5YvWo9dilOhzXHZWSwpDEBV8/yYX3T1t1BIs3TTdyb
	 DhDjk+4l0vRSo8SaFlQou2DqSYNsHTmIUkpkvLNUdE6YfI1NsCkCh3fsSUZ4od14IRDbj
	 7ietpLx8TBwmVEGlGdIxNx8vCCPhcjnp/SlKSTQ4bLcfyakeAeSNw1UCs9Jdvpof0EoIs
	 CmXiMgy781+qz8rr+p91cxhocZDgdo8nTWGbaZYBr/WWhSR0NClJP10c3Zm5pI8WcoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IucYV2rN;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C832B606A32D;
	Tue,  3 Nov 2026 23:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C832B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IucYV2rN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793747984; x=1825283984;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yGcM0U/fiCfGKTJxpm31vDx9xIx3ErmFbd839Kd62eI=;
  b=IucYV2rN8HHiqiatsLYF+Zknmb13T4lT7Xf2b8kuOpHEAg8H7yRLvpE7
   qwqfmFjhNYdF7eHsjXuN5cVNpmNBsjJAvG6WUjcQSxTblQwcGNfhYBUqG
   +VgHJoENUad3CV4XJGOsV04Ht4ookexT0O/88j2TnW/ClpcZoPUeYVcAr
   aq6WMznB48KIyDhZqDn2IeY8R+Kz48PDJrDiunAdNS9T8nwdyWoCN9y4T
   nAU8swsDjYQSKd6JPJhMi+7BQkgTr2uwBheP1g6qhSQ5mjFOktaYf3F4e
   kj/BJ8GBIW/hLkNPgiKs5LrAWQOdeZSoxpVaojkRLIQExE4TRQSEHFcrY
   w==;
X-CSE-ConnectionGUID: OG6F3CHRTbyymTsr0UzgQw==
X-CSE-MsgGUID: PftyOAA4T8m8iLwnrjmXeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2489834"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2489834"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 15:19:43 -0800
X-CSE-ConnectionGUID: ztogfQyQSRyK1fZcohZdLg==
X-CSE-MsgGUID: 0eJy8HeXQcywk+AUu8ktRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6570453"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Nov 2026 15:19:39 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xONmx-00000000jRz-3F88;
	Tue, 03 Nov 2026 23:19:35 +0000
Date: Wed, 4 Nov 2026 07:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	Alexander Koskovich <akoskovich@pm.me>,
	Jie Zhang <jie.zhang@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
	Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/15] drm/msm/a8xx: devcoredump state capture support
Message-ID: <202611040652.1Wy2glVj-lkp@intel.com>
References: <20261102220405.30730-12-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261102220405.30730-12-robin.clark@oss.qualcomm.com>

Hi Rob,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-tip/drm-tip linus/master next-20261030]
[cannot apply to drm-misc/drm-misc-next daeinki-drm-exynos/exynos-drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes v7.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Clark/drm-msm-Import-adreno_snapshot-h/20261102-140245
base:   https://gitlab.freedesktop.org/drm/kernel.git drm-next
patch link:    https://lore.kernel.org/r/20261102220405.30730-12-robin.clark%40oss.qualcomm.com
patch subject: [PATCH v5 11/15] drm/msm/a8xx: devcoredump state capture support
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261104/202611040652.1Wy2glVj-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040652.1Wy2glVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040652.1Wy2glVj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:9:
>> drivers/gpu/drm/msm/adreno/adreno_snapshot.h:506:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     506 |         *(p->in++) = FIELD_PREP(GENMASK_U64(63, 44), reg) | BIT(21) | BIT(0);
         |                      ^
   drivers/gpu/drm/msm/adreno/adreno_snapshot.h:513:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     513 |         *(p->in++) = FIELD_PREP(GENMASK_U64(63, 44), reg) | dwords;
         |                      ^
>> drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:920:14: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     920 |         side_data = FIELD_GET(GENMASK(27, 24), reg);
         |                     ^
   drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:1135:14: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1135 |         side_data = FIELD_GET(GENMASK(27, 24), reg);
         |                     ^
>> drivers/gpu/drm/msm/adreno/a8xx_gpu_state.c:1271:4: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1271 |                         FIELD_PREP(GENMASK(7, 4), a6xx_gpu->slice_mask));
         |                         ^
   5 errors generated.


vim +/FIELD_PREP +506 drivers/gpu/drm/msm/adreno/adreno_snapshot.h

   502	
   503	static inline void CD_WRITE(struct cd_script *p, u32 reg, u32 val)
   504	{
   505		*(p->in++) = val;
 > 506		*(p->in++) = FIELD_PREP(GENMASK_U64(63, 44), reg) | BIT(21) | BIT(0);
   507		__cd_check_overflow(p);
   508	}
   509	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
