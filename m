Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420F14685;
	Tue, 10 Jun 2025 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539743; cv=none; b=hUcuC0OVidx/vIevyGaKAOh3Ie70T0T2UpflosA/qQ+UZSONepE+E9gkmuggKRn7FF23UUkSy8X0vpNnCQd8+fK31/K8MAtwdTT7q/M9rqE7rc4UTW9iqWHp2pUqpd/PJNwAdczwVXtlUPuaZkMHG5Ytq24CoXsMvSOwt3Ag08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539743; c=relaxed/simple;
	bh=rCqGwz7zedTJ2RQSCyeJ2YeiiQ4CI6xrq7Q5IEgEQlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XqJIqGyqnc5s7JGMoTg93yZQdCTiQrEPWA9004YQb8IRwPHtvsCY+Hj2SMgNZsk35xP19caNwxEfotBp5sV9ndZhrJPvGqju0TjHTtqpcHzsgJ0Skg2+jrHj2BFLOhkQQskH0qX6muUSfxQvxq3JUZNwXOWoSBelxyxYDl9M7a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGwNJdvl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGwNJdvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749539741; x=1781075741;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rCqGwz7zedTJ2RQSCyeJ2YeiiQ4CI6xrq7Q5IEgEQlU=;
  b=GGwNJdvlR6Ku/C3b0hOmujNNuTJmsn/CFdYYHRafAuqs8wxdVH+8It7C
   naS821kNDHqFNWZw73keHczbUVIVNl+5uMv83AA1oYIyMLZ+I3S0+lypq
   Ea4AUK/STrl+9emQlPRsCx1ooLEpey24QIseRjxvMpycNcae2QsWzxDAy
   DT4rOl4J+UjCOpzu5Zn4dWdJVMXIL9NMxuPvbUMhmv/QrkTt+UC+svIYz
   Wg4rZ0G8DVqW1J7RvGjRezAHtSgT7S7EaAjG3IF07MduDjNBLe6oRSMvU
   8gpnZoDtg/bzUUAj0zecywLj9rGnEsQLbkKVPFNyRyUrswDpBftCUiuk0
   Q==;
X-CSE-ConnectionGUID: nV/r+zriT42p1vljtezVAA==
X-CSE-MsgGUID: RJCEFChNSxCca7qhQQKyXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="39256289"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="39256289"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:15:40 -0700
X-CSE-ConnectionGUID: cc7AaFCcRWe7MlgjHLhM7w==
X-CSE-MsgGUID: 0PDIT9JMQ5av4f3D8PsPpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="146657771"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Jun 2025 00:15:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOtCp-0007uv-2O;
	Tue, 10 Jun 2025 07:15:35 +0000
Date: Tue, 10 Jun 2025 15:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Subject: Re: [PATCH v3 2/7] drm/syncobj: Do not allocate an array to store
 zeros when waiting
Message-ID: <202506101443.xwvcZ2hC-lkp@intel.com>
References: <20250609113313.75395-3-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609113313.75395-3-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master drm/drm-next drm-misc/drm-misc-next v6.16-rc1 next-20250606]
[cannot apply to v3.1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-syncobj-Remove-unhelpful-helper/20250609-194350
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250609113313.75395-3-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v3 2/7] drm/syncobj: Do not allocate an array to store zeros when waiting
config: arm-davinci_all_defconfig (https://download.01.org/0day-ci/archive/20250610/202506101443.xwvcZ2hC-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101443.xwvcZ2hC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101443.xwvcZ2hC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__get_user_bad" [drivers/gpu/drm/drm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
