Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2688D2101B0;
	Fri,  4 Oct 2024 13:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048718; cv=none; b=kLrFTaTxw1kVJSR6v7vAfBWay5N5MNkYnx7OAhLxsvshj6wcXtV64kqH+zL4a3jf3tmr90ZTSBwd4YOPuEhk0moy5SLP2obi/WK7OHCbW0HqSMoboQ4anWaXMQoQu++m9vNWAI1A0NhsNViqOOeBXxrFE4I4Izqc/h4XmjZELx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048718; c=relaxed/simple;
	bh=LipIKJHXywUFaT6Rr6fuW2hVVH4tKy/aeS0F5KcrTXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ogh2V3adfQu3C7CDNb/9BCXZqPadB+QW91Fwewyp9DEqXpqSkgDqv8sBZ62fLpSQPuA0wRCE6XJhmuJYpbog4CpFv/d5WzSBqidwHtZF8eNuEQGjEj1aX/rJZwLqvVVle9tzivwp4FctE2GZ33rKaPoOFqBrA6dK8LXzXY1sPcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cv+AueeE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cv+AueeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728048716; x=1759584716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LipIKJHXywUFaT6Rr6fuW2hVVH4tKy/aeS0F5KcrTXg=;
  b=Cv+AueeEuKnFZh5G8sJybzceq+BljgOtbtPX66dQRIbwnxEo1ezZBDah
   WXA/Iz+FUsZMh8FtwoC+MAq/+9nmGC+bCKvP+zo9DTmjVl9ta+dGYqcbz
   G4KC9tGxYK1vdDCH4ExDM/fvoYureCs4Hq5hCbAxZcDF/+t/PSFg5cGor
   TkY0c8RteZ8ntsWbdOea9e36m9GEHJZfX+j9QObQ59W1s/iPCrYwCIWcJ
   EGafFnvrK4SR6wqQgiwTILA/nORejkDSmDZ9tzMQu+dkZsfSxAVn6+UhF
   sjnfrUiRaRD/NIDKieP2hL5Xj+lOdd1o12X2kQcgRw87ofjvb/CTuNqGh
   g==;
X-CSE-ConnectionGUID: 9IUIXp0hS8q4vJTnKBKzkA==
X-CSE-MsgGUID: dPqYiX90T+Wse3/KD+Q6GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="27150469"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="27150469"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 06:30:21 -0700
X-CSE-ConnectionGUID: IcluhS3fSAu9RiPnoDcCzg==
X-CSE-MsgGUID: Ij+kEMolRPubbR9Jtmn+6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74697089"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Oct 2024 06:30:20 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swiNt-0001fo-1R;
	Fri, 04 Oct 2024 13:30:17 +0000
Date: Fri, 4 Oct 2024 21:30:05 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v3 10/12] drm/xe: Make xe_ggtt_pt_ops private
Message-ID: <202410042102.EdHRO7JI-lkp@intel.com>
References: <20241003154421.33805-11-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003154421.33805-11-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on linus/master v6.12-rc1]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-xe-display-Handle-stolen-bar-readout-in-the-same-way-as-lmem/20241004-000534
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241003154421.33805-11-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH v3 10/12] drm/xe: Make xe_ggtt_pt_ops private
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241004/202410042102.EdHRO7JI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410042102.EdHRO7JI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410042102.EdHRO7JI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_ggtt.c:906: warning: expecting prototype for xe_ggtt_write_pte(). Prototype was for xe_ggtt_get_encode_pte_bo_fn() instead


vim +906 drivers/gpu/drm/xe/xe_ggtt.c

   897	
   898	/**
   899	 * xe_ggtt_write_pte - Write a PTE to the GGTT
   900	 * @ggtt: &xe_ggtt
   901	 * @offset: the offset for which the mapping should be written.
   902	 *
   903	 * Used by display for DPT and GGTT paths to enccode BO's.
   904	 */
   905	xe_ggtt_pte_encode_bo_fn xe_ggtt_get_encode_pte_bo_fn(struct xe_ggtt *ggtt)
 > 906	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
