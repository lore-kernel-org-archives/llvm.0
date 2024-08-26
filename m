Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F60811E2;
	Mon, 26 Aug 2024 22:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724710115; cv=none; b=jgB+ZouOg+p6lPb69gdmGYXkfz0GNYRUQ6VP67n8s8MSFs4TUYmNdRz0oRZhtq7x4c9oLXfGmIA+EmJxbMtchfuJFGHPMvpKbWVdhHAggUkopVBR32Hsx1CWEC1ygpkjDTJoqQ/AIS+jkNAMcxziFRqn9MnDKMYjrn/AdHSuSKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724710115; c=relaxed/simple;
	bh=nBMJSivStADqdTYKhLP6xKINuqRiM9TJ4LxVMkZthDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGuucup2ldhc0tre1n+OFr4G+hJ1NtN7SOsDl0O9wAWxWdFmOrotouI/WE6N3OXmPSj+XfwIXorX+mQApGXtzzEtbtNs3qNg6PvdT9yD8bb/K0PlqFNG5QlA7IGM1P6jJ6DxmAE2HqAq/AA55yvByHzHmBW9tnPnp07/6E6C4qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nfc27SLy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nfc27SLy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724710113; x=1756246113;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nBMJSivStADqdTYKhLP6xKINuqRiM9TJ4LxVMkZthDE=;
  b=Nfc27SLyXhw3tE7iSTW047nZvAIVnmcT3e1aB3xfUsc3Lokh2ugYYM5C
   a8ARgDkAHZN08Jj4WqDN9fnel/s8UaznAGqJRawxM2Xwj+ENaD0uOh/MU
   K19lfgbxwFyGSlcoyIXbB1NzwIz50EZvOkg068IUcahZllVyESrWeK7Z/
   yLPZrocDdGSLkjm+iDARAYFpzuGH1vPdVQnVi7G6OFMb3ViuVsGP93inm
   eRtbgbZctQssQN0EFFNKmxoqbUs9GQMHaaM2XlFn5J4E5/i5jWleN9Ihw
   wzKIs9VcNq73yTeFzfspXP2x4KKMcpD9IfWzdBLPwYnXtlYXylNAydsjU
   Q==;
X-CSE-ConnectionGUID: 2JzSpWmvRNOADmaSEeM49g==
X-CSE-MsgGUID: 9fSqRZiZREePH1uNYx5D9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="26059334"
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="26059334"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 15:08:33 -0700
X-CSE-ConnectionGUID: P8KS2xSYRGCaQd11qHGJOA==
X-CSE-MsgGUID: mvb4qNPqQJuv4BMkktAhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,178,1719903600"; 
   d="scan'208";a="62700377"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 26 Aug 2024 15:08:31 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sihsz-000Hdo-0h;
	Mon, 26 Aug 2024 22:08:29 +0000
Date: Tue, 27 Aug 2024 06:07:35 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	dri-devel <dri-devel@lists.freedesktop.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Chris Wilson <chris.p.wilson@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v3 14/15] drm/i915/gt: Implement creation and removal
 routines for CCS engines
Message-ID: <202408270545.o4dlO6La-lkp@intel.com>
References: <20240823130855.72436-15-andi.shyti@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823130855.72436-15-andi.shyti@linux.intel.com>

Hi Andi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.11-rc5 next-20240826]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Shyti/drm-i915-gt-Avoid-using-masked-workaround-for-CCS_MODE-setting/20240826-165045
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240823130855.72436-15-andi.shyti%40linux.intel.com
patch subject: [PATCH v3 14/15] drm/i915/gt: Implement creation and removal routines for CCS engines
config: i386-buildonly-randconfig-002-20240827 (https://download.01.org/0day-ci/archive/20240827/202408270545.o4dlO6La-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240827/202408270545.o4dlO6La-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408270545.o4dlO6La-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c:164:12: warning: function 'rb_engine_cmp' is not needed and will not be emitted [-Wunneeded-internal-declaration]
     164 | static int rb_engine_cmp(struct rb_node *rb_new, const struct rb_node *rb_old)
         |            ^~~~~~~~~~~~~
   1 warning generated.


vim +/rb_engine_cmp +164 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c

   163	
 > 164	static int rb_engine_cmp(struct rb_node *rb_new, const struct rb_node *rb_old)
   165	{
   166		struct intel_engine_cs *new = rb_to_uabi_engine(rb_new);
   167		struct intel_engine_cs *old = rb_to_uabi_engine(rb_old);
   168	
   169		if (new->uabi_class - old->uabi_class == 0)
   170			return new->uabi_instance - old->uabi_instance;
   171	
   172		return new->uabi_class - old->uabi_class;
   173	}
   174	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
