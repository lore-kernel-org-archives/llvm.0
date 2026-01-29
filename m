Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386D2581;
	Thu, 29 Jan 2026 00:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769645877; cv=none; b=q6BVvFTUtl6vxcI+eDxsZfdJz/ApHoszOKatFDsWwEpWFgStwtcQsHQF6tQuImhf9cpyfCHL8TrVYE1khM+oGgPZ0ZplhWJ2iJ1CtYV+Y9bn/OAbMYuXPMxZds8a4dLY2+0vUakohYec4nJ9+ovGid6KSREphoM1+6lyc5LDTJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769645877; c=relaxed/simple;
	bh=u6ZFlDnr5QffliZJ4+NcgSsnxfCxlXumwZX7ISG0CuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXNjQcUGMSZGIyMp3/lD5W7p8vjXGlzlfr0Fi9Uk54EIKpOMAH+Lm7JPQYQOc7PG9myYFE8/apiUi6qM7dmLAtOWdcIQKTdBPo3RJLk2u21K6HUiLXY/2XRqWd4H8cKMua3XGHhEGvz0Ksy7BQCD+OKTZz59qSJTgCed4cnr8gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PML5weVX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PML5weVX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769645875; x=1801181875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=u6ZFlDnr5QffliZJ4+NcgSsnxfCxlXumwZX7ISG0CuI=;
  b=PML5weVXT5tzNTJpz3WIbQ0P6I7mToHvjUyQsZZTOJ0R0CfiiMYCao1F
   NP7wRVPzlLCOBoXVPOEZNeGc6HAK4Nxp3J0kwuY4PBCeN1v69txBqO8R3
   GCIOHb0A3MJ3coqMxeQDNcB8R2Bc+Gk+a7mGldVK+bn6/+asXQme0Kg3b
   xDVL1RAbr3g0C5LTWFD3mIpqOcpCflAsDYVF3tnWSgudV7FmOLeCaRCqG
   t+1OkAK7nXj9eY4YRNObtZesuWAnJ4n6t0+ykYPGlg/AS4Tn3KmIhjAoA
   G9onRkQpTuQF7jEFCGP/05OJjkH+wOeAVu2Kswdt+SHSc9A7gCXO4ZP2Z
   A==;
X-CSE-ConnectionGUID: Zcz3XTQWRVOw3ReRpBm/ug==
X-CSE-MsgGUID: AlepzTGpQQSD589qjY+hFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74734803"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74734803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 16:17:55 -0800
X-CSE-ConnectionGUID: 75EeafUkSVip99HGl/nUrQ==
X-CSE-MsgGUID: 1J7tqHpIQxeYBSfmZ8K85A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="208649241"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 28 Jan 2026 16:17:52 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlFjJ-00000000avY-3l9E;
	Thu, 29 Jan 2026 00:17:49 +0000
Date: Thu, 29 Jan 2026 08:17:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Yang <gary.yang@cixtech.com>, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com, Gary Yang <gary.yang@cixtech.com>
Subject: Re: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
Message-ID: <202601290838.4jtWi90B-lkp@intel.com>
References: <20260128093611.1932770-3-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128093611.1932770-3-gary.yang@cixtech.com>

Hi Gary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-leds/for-leds-next linus/master v6.19-rc7 next-20260128]
[cannot apply to pza/reset/next pza/imx-drm/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Yang/dt-bindings-reset-add-sky1-reset-controller/20260128-174335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260128093611.1932770-3-gary.yang%40cixtech.com
patch subject: [PATCH v4 2/3] reset: cix: add support for cix sky1 resets
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260129/202601290838.4jtWi90B-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601290838.4jtWi90B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601290838.4jtWi90B-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/reset/reset-sky1.c:322:35: warning: unused variable 'sky1_src_config' [-Wunused-const-variable]
     322 | static const struct regmap_config sky1_src_config[] = {
         |                                   ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/sky1_src_config +322 drivers/reset/reset-sky1.c

   321	
 > 322	static const struct regmap_config sky1_src_config[] = {
   323		{
   324			.reg_bits = 32,
   325			.val_bits = 32,
   326			.reg_stride = 4,
   327			.name = "src",
   328		},
   329	};
   330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
