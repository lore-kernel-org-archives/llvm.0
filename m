Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCA4C74;
	Fri, 27 Sep 2024 00:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727398135; cv=none; b=YYKh9i9ErK0HCih7UX/XMnvWzmPlhBzsbBe5wUwTaTanjB4T4185iJwXRT3SJPzXbeIKMPP1k+ujoWDX/ezYrtvWkziEJIfTHoiJBMo8GkpyiSVAmMxy6/Vc4lFQP+8NHQWcYMD9i1wvjvM16DwtZG6Jm1Cm2uesW7BcXsZMEh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727398135; c=relaxed/simple;
	bh=EyicUuYIZRdMaHIhu/afSM4+64kzlse+Si35XCY53gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V5ebjDVfgnOXQaBIRLj+momhozAr21FauLS/sb1gNNLLrlRDP3E3V6SlYkHA15j2ZqOYHQVngyvxd+AWS4orZaxzyx8bX33X7sDDq0IOmFW3Si+as66b/jjn+LcWVCV8L5tQmlVCWhq3TOWxvaegPGXg73Ofab8uRTrWjAcP4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYKt2g6z; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYKt2g6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727398134; x=1758934134;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EyicUuYIZRdMaHIhu/afSM4+64kzlse+Si35XCY53gY=;
  b=UYKt2g6zMVifmsokvers4+Q46AkPjCgESjEyXOjE5O0q8ETSViC+dNX4
   xhJllD+RrodjsI+r6qx5vm6Ar7FfO8OG5wFd6X+QoLdb75OJr4HsGtrL+
   jSVE6DRkzjUmyXLWybiUQ2BZA9STBdTQ9Vg/FJ72dMiBZeDDncx7Yypnt
   9WrTZ8BQE8K0t9b/hMgg2Nhwt59rZuPZtO+uGHUlM+2OKPGZ+37VAsiHd
   iNZjH4Nrcjkq55SquotBvq5miAQ3NTuoOekaj9leMOyEMQM+wPxYyK5me
   NUr2/GdtfAHTwxeta/cJBaFDyJIEb81FtfURAG+fEe2S9GZNx4SrQFNUZ
   Q==;
X-CSE-ConnectionGUID: rLAUMQaaReKB7CB9BxO8MQ==
X-CSE-MsgGUID: DNmdpA3nRySwos+7Jcq4pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37669060"
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="37669060"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 17:48:52 -0700
X-CSE-ConnectionGUID: A9By+uzNTtehxSXb9deCyw==
X-CSE-MsgGUID: W2DrapKUSuu1K10YcGtw2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,157,1725346800"; 
   d="scan'208";a="103135396"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Sep 2024 17:48:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stzA7-000LKr-2V;
	Fri, 27 Sep 2024 00:48:47 +0000
Date: Fri, 27 Sep 2024 08:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] cleanup: make scoped_guard() to be return-friendly
Message-ID: <202409270848.tTpyEAR7-lkp@intel.com>
References: <20240926134347.19371-1-przemyslaw.kitszel@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240926134347.19371-1-przemyslaw.kitszel@intel.com>

Hi Przemek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 151ac45348afc5b56baa584c7cd4876addf461ff]

url:    https://github.com/intel-lab-lkp/linux/commits/Przemek-Kitszel/cleanup-make-scoped_guard-to-be-return-friendly/20240926-214521
base:   151ac45348afc5b56baa584c7cd4876addf461ff
patch link:    https://lore.kernel.org/r/20240926134347.19371-1-przemyslaw.kitszel%40intel.com
patch subject: [RFC PATCH] cleanup: make scoped_guard() to be return-friendly
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240927/202409270848.tTpyEAR7-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409270848.tTpyEAR7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409270848.tTpyEAR7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/magnetometer/af8133j.c:316:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     316 |                 scoped_guard(mutex, &data->mutex)
         |                 ^
   include/linux/cleanup.h:172:2: note: expanded from macro 'scoped_guard'
     172 |         __scoped_guard_labeled(__UNIQUE_ID(label), _name, args)
         |         ^
   include/linux/cleanup.h:177:2: note: expanded from macro '__scoped_guard_labeled'
     177 |         else                                            \
         |         ^
   1 warning generated.


vim +316 drivers/iio/magnetometer/af8133j.c

1d8f4b04621f0f Icenowy Zheng 2024-02-22  294  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  295  static int af8133j_set_scale(struct af8133j_data *data,
1d8f4b04621f0f Icenowy Zheng 2024-02-22  296  			     unsigned int val, unsigned int val2)
1d8f4b04621f0f Icenowy Zheng 2024-02-22  297  {
1d8f4b04621f0f Icenowy Zheng 2024-02-22  298  	struct device *dev = &data->client->dev;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  299  	u8 range;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  300  	int ret = 0;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  301  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  302  	if (af8133j_scales[0][0] == val && af8133j_scales[0][1] == val2)
1d8f4b04621f0f Icenowy Zheng 2024-02-22  303  		range = AF8133J_REG_RANGE_12G;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  304  	else if (af8133j_scales[1][0] == val && af8133j_scales[1][1] == val2)
1d8f4b04621f0f Icenowy Zheng 2024-02-22  305  		range = AF8133J_REG_RANGE_22G;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  306  	else
1d8f4b04621f0f Icenowy Zheng 2024-02-22  307  		return -EINVAL;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  308  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  309  	pm_runtime_disable(dev);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  310  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  311  	/*
1d8f4b04621f0f Icenowy Zheng 2024-02-22  312  	 * When suspended, just store the new range to data->range to be
1d8f4b04621f0f Icenowy Zheng 2024-02-22  313  	 * applied later during power up.
1d8f4b04621f0f Icenowy Zheng 2024-02-22  314  	 */
1d8f4b04621f0f Icenowy Zheng 2024-02-22  315  	if (!pm_runtime_status_suspended(dev))
1d8f4b04621f0f Icenowy Zheng 2024-02-22 @316  		scoped_guard(mutex, &data->mutex)
1d8f4b04621f0f Icenowy Zheng 2024-02-22  317  			ret = regmap_write(data->regmap,
1d8f4b04621f0f Icenowy Zheng 2024-02-22  318  					   AF8133J_REG_RANGE, range);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  319  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  320  	pm_runtime_enable(dev);
1d8f4b04621f0f Icenowy Zheng 2024-02-22  321  
1d8f4b04621f0f Icenowy Zheng 2024-02-22  322  	data->range = range;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  323  	return ret;
1d8f4b04621f0f Icenowy Zheng 2024-02-22  324  }
1d8f4b04621f0f Icenowy Zheng 2024-02-22  325  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
