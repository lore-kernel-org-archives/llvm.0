Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C77401A3D;
	Wed, 25 Mar 2026 17:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774458573; cv=none; b=hzV5+plbUz6rykRGikty98VfbJJE6XG/mlW/a1qalJuX+0D7Y+0CzbG0GHHq44l+7x0yT+xklPyIz1RorXkyKGh8vQC5u54bnNBe5gCzKKQp289RCWHsA1H21oaj8SW+YXDWgp7TQMtoYOOes+ty5g9PyKg/mJb8Cj82j8c4v8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774458573; c=relaxed/simple;
	bh=JXbk4O60vqvAc9C4+gJ015xvUjF2FznvzP7lf7G3S1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kcamqjyDiLTTfz2SQAmxinJieTTU9iwP6A+NfVjf+hpkDWKcGR3BRuwR3QRq2bb51cKzltWNdDSFhuq3LbnHW+q7OHUdRXrfK+dgLOhoVWbpsaygIlbOy4OZPhmYdVD2u3INiVxuUMDcyQEauZOYq7bGv/Ultf0d3KIwTGMo/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcNnfrJc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcNnfrJc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774458564; x=1805994564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JXbk4O60vqvAc9C4+gJ015xvUjF2FznvzP7lf7G3S1s=;
  b=FcNnfrJcsUZK1tMk8LResHdi4LUzswZ+aH8SoeOoX1R97s5fN2Jbvd9+
   CBFeu87YtDfHyj60cveuzB3VzXFK6UCPL1LR2v1OvK/M4PlhGeUKCA1l2
   XGDy7ouj7apoZFZS1bh+pqsngeCfwz8YcJhfgyHOwzPo/6wEWlJMwEG5j
   4P+/VXjZUsSHiuHra2OJFs8RKWl9EXYzFiHqVtzS4GPAZNwJqHinfc8xf
   gsOll704BAp+TWCoOV5IYHuVJWhqWBBp+ECuQk7D+M15Z3GfuRECwVH3P
   aT8/hDmcmPS09HsdVyrKF2uRo7JhHr7LiOv+M1GJjRMtivq3iTRPGS6u4
   g==;
X-CSE-ConnectionGUID: 0RSOiChETdyhZbt6VfpUuw==
X-CSE-MsgGUID: eV4LlgKJS2yHVHfE9S583A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75219347"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75219347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 10:09:14 -0700
X-CSE-ConnectionGUID: qOXBes7WQ4ynEGWbwzUlCA==
X-CSE-MsgGUID: So7UcWvoTgiq8KbKIywb3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="228811652"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Mar 2026 10:09:13 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5RjC-000000007Kr-1ges;
	Wed, 25 Mar 2026 17:09:10 +0000
Date: Thu, 26 Mar 2026 01:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing
 Engine driver
Message-ID: <202603260121.sODrcixU-lkp@intel.com>
References: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323125824.211615-3-loic.poulain@oss.qualcomm.com>

Hi Loic,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.0-rc5 next-20260324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Loic-Poulain/dt-bindings-media-qcom-Add-CAMSS-Offline-Processing-Engine-OPE/20260323-220343
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260323125824.211615-3-loic.poulain%40oss.qualcomm.com
patch subject: [RFC PATCH 2/3] media: qcom: camss: Add CAMSS Offline Processing Engine driver
config: loongarch-randconfig-001-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260121.sODrcixU-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260121.sODrcixU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603260121.sODrcixU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss-ope.c:1478:35: warning: unused variable 'ope_ctrl_ops' [-Wunused-const-variable]
    1478 | static const struct v4l2_ctrl_ops ope_ctrl_ops = {
         |                                   ^~~~~~~~~~~~
   1 warning generated.


vim +/ope_ctrl_ops +1478 drivers/media/platform/qcom/camss/camss-ope.c

  1477	
> 1478	static const struct v4l2_ctrl_ops ope_ctrl_ops = {
  1479		.s_ctrl = ope_s_ctrl,
  1480	};
  1481	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
