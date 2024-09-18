Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670EE139D05;
	Wed, 18 Sep 2024 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726676678; cv=none; b=BrRzyY6jOgCt6vmu+ZFJwvyfPhZSvNS5n+k/C7ZUTZL9y5zV8U2buK/3g68AmwXJ1pihRh6/lq4KIDoFu+mMo8Zk9u2ag/z92aO18Dm0Eo7x33eoeuzv/PAxbkgVxN36t/8lQ2wYQiNwSCJFEBSKFDkS13WcqUFqLMD9L4u8bFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726676678; c=relaxed/simple;
	bh=K2NeVQQAWqfyNcmYPxZfrFYz1dycWqfbQFVx4OS+hY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X9jXDiK6Djmz0xzC5nDS8Wq7Ozd9LEiVCqYhnIQM1WuIdEehLG344qi7vg39xiIFhJeVicZEI3NBcl7GjvA82TCRiaw6r+ggbXgvoppwCydnO29zDfJNZIAeuOJwwTyRH/TxPRezzBs64tmecONdFk69mUWJE6NrW/IrYE/FWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+dX4Yai; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+dX4Yai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726676676; x=1758212676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K2NeVQQAWqfyNcmYPxZfrFYz1dycWqfbQFVx4OS+hY8=;
  b=h+dX4Yai3RqPIswrXiuCDzsrcy9p5nWpsa53V+/V3H2yc8SSbVlrjebV
   VPjt/FHrJhH3dXLt9tepFBrAVwXjZTwvkhkDwApyXUqsk1eNT5xxkleMm
   rDQTT0cQgElQNAZb8MxVYSQmnizTH3+8NSqOEoqkw6Qq0ef0cslOqlsVG
   rzGtcq7I/amr7R7DVpxXWwvdcW4OJyuvwX6rTNqbvX3d12JaFAM9q1xW1
   uRM6rl1vRJ6i17GT4d3RuaZgBQN1BeLE0Jc5BxZC9feCMXaYJmeiRwS8X
   nm+6/GtO5hh+nB/p16b3kx9vqmXA2alSIlv2Os8t0LVOrJD2BFhduCgwv
   A==;
X-CSE-ConnectionGUID: SIHdLsZ7T/iwlm+i/jDorw==
X-CSE-MsgGUID: cO6HhhdNTeiibnJ5JzDs+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36731321"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="36731321"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 09:24:32 -0700
X-CSE-ConnectionGUID: oFsw7g4vToKtv8Ri0crq5g==
X-CSE-MsgGUID: OMJwmKdGRDWFrugbgXO1Mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="74429846"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Sep 2024 09:24:29 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqxTe-000CPA-1q;
	Wed, 18 Sep 2024 16:24:26 +0000
Date: Thu, 19 Sep 2024 00:23:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jani.nikula@intel.com
Subject: Re: [PATCH 5/5] drm/i915: switch intel_wakeref_t underlying type to
 struct ref_tracker *
Message-ID: <202409190032.ZCHBxK9e-lkp@intel.com>
References: <067332b1f8679f940f373618fd24b1d03370ba45.1726658138.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <067332b1f8679f940f373618fd24b1d03370ba45.1726658138.git.jani.nikula@intel.com>

Hi Jani,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20240918]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jani-Nikula/drm-i915-gem-fix-bitwise-and-logical-AND-mixup/20240918-191938
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/067332b1f8679f940f373618fd24b1d03370ba45.1726658138.git.jani.nikula%40intel.com
patch subject: [PATCH 5/5] drm/i915: switch intel_wakeref_t underlying type to struct ref_tracker *
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240919/202409190032.ZCHBxK9e-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190032.ZCHBxK9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190032.ZCHBxK9e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_display_power.c:548:10: warning: expression which evaluates to zero treated as a null pointer constant of type 'intel_wakeref_t' (aka 'struct ref_tracker *') [-Wnon-literal-null-conversion]
     548 |                 return false;
         |                        ^~~~~
   1 warning generated.


vim +548 drivers/gpu/drm/i915/display/intel_display_power.c

7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  525  
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  526  /**
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  527   * intel_display_power_get_if_enabled - grab a reference for an enabled display power domain
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  528   * @dev_priv: i915 device instance
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  529   * @domain: power domain to reference
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  530   *
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  531   * This function grabs a power domain reference for @domain and ensures that the
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  532   * power domain and all its parents are powered up. Therefore users should only
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  533   * grab a reference to the innermost power domain they need.
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  534   *
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  535   * Any power domain reference obtained by this function must have a symmetric
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  536   * call to intel_display_power_put() to release the reference again.
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  537   */
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  538  intel_wakeref_t
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  539  intel_display_power_get_if_enabled(struct drm_i915_private *dev_priv,
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  540  				   enum intel_display_power_domain domain)
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  541  {
e3e8148f43fb6d drivers/gpu/drm/i915/display/intel_display_power.c Jani Nikula            2022-08-29  542  	struct i915_power_domains *power_domains = &dev_priv->display.power.domains;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  543  	intel_wakeref_t wakeref;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  544  	bool is_enabled;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  545  
d858d5695f3897 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-06-13  546  	wakeref = intel_runtime_pm_get_if_in_use(&dev_priv->runtime_pm);
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  547  	if (!wakeref)
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31 @548  		return false;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  549  
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  550  	mutex_lock(&power_domains->lock);
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  551  
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  552  	if (__intel_display_power_is_enabled(dev_priv, domain)) {
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  553  		__intel_display_power_get_domain(dev_priv, domain);
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  554  		is_enabled = true;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  555  	} else {
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  556  		is_enabled = false;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  557  	}
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  558  
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  559  	mutex_unlock(&power_domains->lock);
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  560  
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  561  	if (!is_enabled) {
d858d5695f3897 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-06-13  562  		intel_runtime_pm_put(&dev_priv->runtime_pm, wakeref);
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  563  		wakeref = 0;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  564  	}
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  565  
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  566  	return wakeref;
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  567  }
7645b19d9bdd13 drivers/gpu/drm/i915/intel_display_power.c         Daniele Ceraolo Spurio 2019-05-31  568  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
