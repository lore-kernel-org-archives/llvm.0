Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F42302566CE;
	Mon, 10 Feb 2025 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209254; cv=none; b=gQnQkm2218ydYj9Otee+p2d/gB4myw2MgJTx9dmLz/435YJVJna9fglV1bg7dUv+xc3NYjo7uNWQzmZEm293eIVZDP1PgBctExZMEIOo69g0kO8TncyGTW3v7SzxS4LWWdzCPviuCzpd6KVxtE+1m0F8fQms1OUKqy+dnvFy6RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209254; c=relaxed/simple;
	bh=oPUsNSS/9FODBjaeJubUk9aqWY6/p5hQC2msFPSfNeA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jvYGzAztUTk3Sis0d0Gw0Bj02p7f3KHt/nsrEesBfQXbfaH4yh8Uapvw3/8Cdr1R/GkbX009hqIEpSqe5uZa48ntmVSYgSNzD+9WMZ9ksnsAQtuaf3h3DLf4zUAfCAN6k1WnIp6mQdAkBqUygGPW1LnaRGADLeooM6aQVsGNRtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SM8zb14s; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SM8zb14s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739209253; x=1770745253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPUsNSS/9FODBjaeJubUk9aqWY6/p5hQC2msFPSfNeA=;
  b=SM8zb14sDhXsi/RYlWIL9h1nOsaF8KKamW96CByRSkepmlMNdI+05hvA
   1HxofmNsI0IYfAdBdm23OBN6bd9Innu+GQmxZfNZ9mMjLfE+LxyYyCa7e
   KnekFuYtJgHKIKKF1gh+Nzol+BDLns3/Nn+ptaVaGIDIXwsonr3p+9gKo
   VFNnOuIJz1tcDiDTxb/nhd1f7NjCyQkRB+5H3KIyaozBHDRqmL+EWxfoU
   Q576/0zVHS4VEYo4P4wJw1D1bdQGG28Eoj7B7aHaGGWcAkpQvduagP32U
   sYZuwNcYUE4pWF5TZfyNxg2KW1uejGtg3j8RQnWVdnb7W8+uBMbCKzvJx
   w==;
X-CSE-ConnectionGUID: kID6ea5oRhmU9I+B44Jx3Q==
X-CSE-MsgGUID: 8hYbkK9iSOeAYU32HzvMXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="40069194"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="40069194"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 09:40:52 -0800
X-CSE-ConnectionGUID: dRWqP7TnSiW/vS4eEqrTgw==
X-CSE-MsgGUID: ja+zzydtTw29e0sqwEKzqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143145963"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 09:40:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thXm5-00138F-0y;
	Mon, 10 Feb 2025 17:40:49 +0000
Date: Tue, 11 Feb 2025 01:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 87/88]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:699:6: warning: variable 'val'
 set but not used
Message-ID: <202502110104.jEgR81mo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   9c9642e37ccbac048317945fa497012c10aedc07
commit: a7fe47cf1a3d1699f276ae91354900afc05d69bd [87/88] DEBUG: testing ideas from Qcom
config: x86_64-buildonly-randconfig-005-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110104.jEgR81mo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110104.jEgR81mo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110104.jEgR81mo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:699:6: warning: variable 'val' set but not used [-Wunused-but-set-variable]
     699 |         u32 val = 0;
         |             ^
   1 warning generated.


vim +/val +699 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c

e1a950eec25656e Abhinav Kumar       2022-04-26  694  
2c266a634ad2814 Krzysztof Kozlowski 2025-01-13  695  static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
b3652e87c03c70d Krishna Manikandan  2021-04-06  696  					      unsigned long *fetch_active)
b3652e87c03c70d Krishna Manikandan  2021-04-06  697  {
b3652e87c03c70d Krishna Manikandan  2021-04-06  698  	int i;
b3652e87c03c70d Krishna Manikandan  2021-04-06 @699  	u32 val = 0;
b3652e87c03c70d Krishna Manikandan  2021-04-06  700  
b3652e87c03c70d Krishna Manikandan  2021-04-06  701  	if (fetch_active) {
b3652e87c03c70d Krishna Manikandan  2021-04-06  702  		for (i = 0; i < SSPP_MAX; i++) {
b3652e87c03c70d Krishna Manikandan  2021-04-06  703  			if (test_bit(i, fetch_active) &&
b3652e87c03c70d Krishna Manikandan  2021-04-06  704  				fetch_tbl[i] != CTL_INVALID_BIT)
b3652e87c03c70d Krishna Manikandan  2021-04-06  705  				val |= BIT(fetch_tbl[i]);
b3652e87c03c70d Krishna Manikandan  2021-04-06  706  		}
b3652e87c03c70d Krishna Manikandan  2021-04-06  707  	}
b3652e87c03c70d Krishna Manikandan  2021-04-06  708  
a7fe47cf1a3d169 Krzysztof Kozlowski 2025-02-10  709  	// DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
b3652e87c03c70d Krishna Manikandan  2021-04-06  710  }
b3652e87c03c70d Krishna Manikandan  2021-04-06  711  

:::::: The code at line 699 was first introduced by commit
:::::: b3652e87c03c70d8e6e04a17afa475f6855169d1 drm/msm/disp/dpu1: add support to program fetch active in ctl path

:::::: TO: Krishna Manikandan <mkrishn@codeaurora.org>
:::::: CC: Rob Clark <robdclark@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
