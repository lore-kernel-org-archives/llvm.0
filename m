Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6282E40E;
	Mon, 20 Oct 2025 03:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760931020; cv=none; b=ZuRiH/YxRfxE5giqhC/vn/Mkm9JQD9fOkFXPX/2zkBmoGWwh2lHHpFswh1Mb7sEjWe5jzHpQmjZ0hgF5PnOnRTPOURR/i7Fd9T2Qcux0qkM91HsPuEud4gtWc6wlBIfTPJXKdPYb3LjpZfZ7pzR8oEaGJ1gywoBbX5Xdc0ew/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760931020; c=relaxed/simple;
	bh=V+FRGoMiN1MCwZCSWOtz2tWGmAj7seyi2taSQOonM+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDl+/zQXMUj++KOXan9gp3wnvbE6rPFM4P2fA4E09PkMJdSBgvUODE6LDAnw9Vi88uL+R58W7Kr4TwtDklrr+6x3rplFD6shgb1E3+Ekj7vOKNjw3Ra2/ou54VfxF2zVcJRN0DBIpxDReSoiCMSlV7vNpHMsISkOV2dDfZbatKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6/4wCCP; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6/4wCCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760931017; x=1792467017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V+FRGoMiN1MCwZCSWOtz2tWGmAj7seyi2taSQOonM+k=;
  b=D6/4wCCPlfzqwzZwIrrKX/vV1zm/plBldqUZ0r+df7bWt0ai1UacmNzi
   cUT4yjDuufmKy2oXaOoH2i2Uvd7aV8+aANBZmA5JEWnYTRFHT3W6M0+O+
   i2ArfQJojYRXmXVYnMFJn/3dao9i45jlEs8yqKvdgFpMs1X2Ma9AMb4g8
   W2HLl/wvK2n+hhC60jGX7NAHi0DDp9SUdgyJH/vw06LxYGm3EZhAVAyFs
   SWlJcf5uArPZEeUiHKgw2pMPMMoD7F7TCiuGaAbDWLEY4OqGlJRnRnXaX
   U3QR3Ll5+aah0zK2bt2KsU4UhL5vG1QDRLM9A2tYxjDQU5QPBWrJev15z
   Q==;
X-CSE-ConnectionGUID: MGVCza5qSja7S6Fe0DLj0A==
X-CSE-MsgGUID: hr8tzZ8dR2qGiPQ06INugg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62967190"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62967190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 20:30:17 -0700
X-CSE-ConnectionGUID: HtalkC0URWq1a8nM4TjSFw==
X-CSE-MsgGUID: PtddhK7GRaOL3WdK0nanWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="187648530"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2025 20:30:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAgb5-0009Sj-2G;
	Mon, 20 Oct 2025 03:30:11 +0000
Date: Mon, 20 Oct 2025 11:29:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Brophy <professorjonny98@gmail.com>,
	lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Message-ID: <202510201144.TwTDnjSJ-lkp@intel.com>
References: <20251019092331.49531-5-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251019092331.49531-5-professorjonny98@gmail.com>

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.18-rc2 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-Add-virtualcolor-class-dt-bindings-documentation/20251019-172647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251019092331.49531-5-professorjonny98%40gmail.com
patch subject: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
config: i386-randconfig-001-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201144.TwTDnjSJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510201144.TwTDnjSJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510201144.TwTDnjSJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/leds/rgb/leds-group-virtualcolor.c:463:38: warning: cast from 'void (*)(struct mutex *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
     463 |         ret = devm_add_action_or_reset(dev, (void (*)(void *))mutex_destroy,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device/devres.h:166:34: note: expanded from macro 'devm_add_action_or_reset'
     166 |         __devm_add_action_or_reset(dev, action, data, #action)
         |                                         ^~~~~~
   1 warning generated.


vim +463 drivers/leds/rgb/leds-group-virtualcolor.c

   449	
   450	static int leds_virtualcolor_probe(struct platform_device *pdev)
   451	{
   452		struct leds_virtualcolor *vc_data;
   453		struct device *dev = &pdev->dev;
   454		int count = 0;
   455		int ret;
   456	
   457		vc_data = devm_kzalloc(dev, sizeof(*vc_data), GFP_KERNEL);
   458		if (!vc_data)
   459			return -ENOMEM;
   460	
   461		mutex_init(&vc_data->lock);
   462	
 > 463		ret = devm_add_action_or_reset(dev, (void (*)(void *))mutex_destroy,
   464					       &vc_data->lock);
   465		if (ret)
   466			return ret;
   467	
   468		INIT_LIST_HEAD(&vc_data->active_leds);
   469	
   470		vc_data->num_vleds = of_get_child_count(dev->of_node);
   471		if (vc_data->num_vleds == 0) {
   472			dev_err(dev, "No virtual LEDs defined\n");
   473			return -EINVAL;
   474		}
   475	
   476		vc_data->vleds = devm_kcalloc(dev, vc_data->num_vleds, sizeof(*vc_data->vleds), GFP_KERNEL);
   477		if (!vc_data->vleds)
   478			return -ENOMEM;
   479	
   480		for_each_available_child_of_node_scoped(dev->of_node, child) {
   481			struct virtual_led *vled = &vc_data->vleds[count];
   482	
   483			ret = leds_virtualcolor_init_vled(dev, child, vled, vc_data);
   484			if (ret)
   485				return ret;
   486	
   487			count++;
   488		}
   489	
   490		platform_set_drvdata(pdev, vc_data);
   491	
   492		return 0;
   493	}
   494	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
