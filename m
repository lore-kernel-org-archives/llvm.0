Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76971096F;
	Sat, 26 Jul 2025 11:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753528898; cv=none; b=oL6+wod0kwg84IvM/L7XqxUE7hEQ84Lp2rfSSLl0Cz10aS35RLetSyJx3s85SOfknx/P43BzXdjY/MMqDdWjVZqT93nq3W84BuH4Rl84Wj5KFI4DM8/zNZuGza1b3US43y2BxAMVdu1Gn8xt6vK7UsqPumTk2x1ydiukQrNZp0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753528898; c=relaxed/simple;
	bh=LUZE3bBwLHBN+StURfn0O/MoSYAuV5/vlhxfqbWfR9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iAPn0PktKNYLdiW4duAGejdKZgYJFiarGLZFkj7voppVztbzPfknNJpRG4zrttErk8LVVDxgMTJ5s0OuIm1VS4IRd0egLr5N9dm67S7Vdkw7aXu5oLsKS23Vw4HlSFjMOBvTrIVnex76pANq9qVc7NJLFrqkL+3EHCN2TMjv5v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tb/NR2qk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tb/NR2qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753528897; x=1785064897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LUZE3bBwLHBN+StURfn0O/MoSYAuV5/vlhxfqbWfR9k=;
  b=Tb/NR2qkfpLhYpuANB53wuqV2tlHfOcxkK57i+l3fSPqLfEizfbF9hhR
   9TqX6TUTTOu8ckhtIExUvLhb7kQXun9tQpflr4gQAtkm2kTC451fWT8YB
   V+RML26b78djkC6yPzouWXCYuDDMJx7o2JAcNCmmqQy6HUbXnDdRu5eDC
   HKx0B8+Zyk7LwqmXRkq+rECRwnUtCat8yZMpB3N9xOV/pG47stOC9VsrO
   GQtSFrugtjwf1vhK0G8KN1aQ/69yZ4oS6crKu5AacGiXXWUyD2h5iRaVy
   p8rBso8lFMAXoPVLclIySuCs2k+yK51vH5SdYzPmHsZB2VLrhPf9nvXZU
   g==;
X-CSE-ConnectionGUID: TTsmhldFQ9eveybLPhyWcg==
X-CSE-MsgGUID: 7iT8Drl1Rgew8ZcE29CA+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55997842"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55997842"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 04:21:34 -0700
X-CSE-ConnectionGUID: Kr+G0yAFSdmC09F+O6NTDw==
X-CSE-MsgGUID: XP1aSgD7SaC1xNtFJbmcNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192449999"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 26 Jul 2025 04:21:33 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufcy2-000Lvb-0O;
	Sat, 26 Jul 2025 11:21:30 +0000
Date: Sat, 26 Jul 2025 19:20:40 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ankit.k.nautiyal@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 2/3] drm/i915/bios: Add function to check if edp data
 override is needed
Message-ID: <202507261913.LoCL2yuM-lkp@intel.com>
References: <20250725061548.2704697-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725061548.2704697-3-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-vbt-Add-eDP-Data-Overrride-field-in-VBT/20250725-141824
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20250725061548.2704697-3-suraj.kandpal%40intel.com
patch subject: [PATCH 2/3] drm/i915/bios: Add function to check if edp data override is needed
config: i386-buildonly-randconfig-006-20250725 (https://download.01.org/0day-ci/archive/20250726/202507261913.LoCL2yuM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507261913.LoCL2yuM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507261913.LoCL2yuM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_bios.c:2524:2: warning: variable 'val' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
    2524 |         default:
         |         ^~~~~~~
   drivers/gpu/drm/i915/display/intel_bios.c:2528:34: note: uninitialized use occurs here
    2528 |         return edp_data_override_mask & val;
         |                                         ^~~
   drivers/gpu/drm/i915/display/intel_bios.c:2485:9: note: initialize the variable 'val' to silence this warning
    2485 |         u32 val;
         |                ^
         |                 = 0
   1 warning generated.


vim +/val +2524 drivers/gpu/drm/i915/display/intel_bios.c

  2482	
  2483	static bool parse_bdb_263_edp_data_override(const u32 edp_data_override_mask, int rate)
  2484	{
  2485		u32 val;
  2486	
  2487		switch (rate) {
  2488		case 2000000:
  2489			val = BDB_263_VBT_EDP_LINK_RATE_20;
  2490			break;
  2491		case 1350000:
  2492			val = BDB_263_VBT_EDP_LINK_RATE_13_5;
  2493			break;
  2494		case 1000000:
  2495			val = BDB_263_VBT_EDP_LINK_RATE_10;
  2496			break;
  2497		case 810000:
  2498			val = BDB_263_VBT_EDP_LINK_RATE_8_1;
  2499			break;
  2500		case 675000:
  2501			val = BDB_263_VBT_EDP_LINK_RATE_6_75;
  2502			break;
  2503		case 540000:
  2504			val = BDB_263_VBT_EDP_LINK_RATE_5_4;
  2505			break;
  2506		case 432000:
  2507			val = BDB_263_VBT_EDP_LINK_RATE_4_32;
  2508			break;
  2509		case 324000:
  2510			val = BDB_263_VBT_EDP_LINK_RATE_3_24;
  2511			break;
  2512		case 270000:
  2513			val = BDB_263_VBT_EDP_LINK_RATE_2_7;
  2514			break;
  2515		case 243000:
  2516			val = BDB_263_VBT_EDP_LINK_RATE_2_43;
  2517			break;
  2518		case 216000:
  2519			val = BDB_263_VBT_EDP_LINK_RATE_2_16;
  2520			break;
  2521		case 162000:
  2522			val = BDB_263_VBT_EDP_LINK_RATE_1_62;
  2523			break;
> 2524		default:
  2525			break;
  2526		}
  2527	
  2528		return edp_data_override_mask & val;
  2529	}
  2530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
