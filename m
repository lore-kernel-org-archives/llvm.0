Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8251C12B93;
	Sat,  9 Aug 2025 04:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754712511; cv=none; b=Z4NzPZAeOHahMZ7vlCu4lfY8OnVGB77MzYQ0teVEJdYsGZ/iXpcVxk3mNm4nZlXnyhctCdM6tE+Jt2URk+xorFquHU0xxTbNLbCtbsj6KjYkDW5YmTq+SgrKfAN96j5J9eiTAskZs44+drLVzye2ujdBiS63dJ8DGa9+wjl0Wy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754712511; c=relaxed/simple;
	bh=nLTH66A7etc3VgPR6sxDdDU5RW3WL7uD7qW4F3WgYcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTFyAwHmUWOIoohfXz4X6o8yMnf0BRk6OdeaO790k/pvGTiRhq/9T+9AOmuedIf6KdPcNYX/xj88soN/wbGMm69NzFNCQb8emUMXedG0WL7xOXMZp3kK3pROTJ4ag5NsbxxGJAfLuENdeMIvHZMzTNTcgwe1Y6hsKJRbPjYa95M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYPVmRXS; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYPVmRXS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754712510; x=1786248510;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nLTH66A7etc3VgPR6sxDdDU5RW3WL7uD7qW4F3WgYcw=;
  b=WYPVmRXSd0g2Hv/JpgjA0RFyEndMB+AcE6FrCPpeL3TcbahpTy+RsLix
   x7EMZT6qiTffjwjtAGnmdbwo5sWDJwXQife0AP3y+RAVYugWRd4R+xIFO
   ZxfDJgpRv0Bl9NMVpYcrfCuDWq3YdNcXIYGRRUfexaXIDihvlVWqptp28
   1XfygBS97e6pisdseRTQ2orsbUIzBCHxkfvUHL4YalGrbuQWU2FNfqU51
   MXleJ1GXQqKktUsT5M73Gcw3S2Ge60C+lFbdNIFcRU4yz71+BmVSzisVR
   UI8O5IMs8YYYGmgasAgJW5X3nqIOFpzmuTus6PfNHL0Ql5SueGf48hUYI
   Q==;
X-CSE-ConnectionGUID: RlAQajC8TrGip4LXJJ8iYA==
X-CSE-MsgGUID: SxSyC0cST4uQURRJh4KRXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="59667019"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="59667019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 21:08:29 -0700
X-CSE-ConnectionGUID: uQt3nQFORbap7DXQpkIIpQ==
X-CSE-MsgGUID: qzaLRsITRb+s0C9xrv6OxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="164699862"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2025 21:08:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukarv-0004Uy-0o;
	Sat, 09 Aug 2025 04:07:57 +0000
Date: Sat, 9 Aug 2025 12:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, airlied@gmail.com,
	thomas.hellstrom@linux.intel.com, matthew.brost@intel.com
Subject: Re: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
Message-ID: <202508091134.xJZroqY6-lkp@intel.com>
References: <20250806132838.1831-1-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806132838.1831-1-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-exynos/exynos-drm-next]
[also build test ERROR on linus/master v6.16 next-20250808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/drm-ttm-WIP-limit-the-TTM-pool-to-32bit-CPUs/20250806-212941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250806132838.1831-1-christian.koenig%40amd.com
patch subject: [PATCH] drm/ttm: WIP limit the TTM pool to 32bit CPUs
config: um-randconfig-001-20250809 (https://download.01.org/0day-ci/archive/20250809/202508091134.xJZroqY6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508091134.xJZroqY6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508091134.xJZroqY6-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "set_pages_array_wc" [drivers/gpu/drm/ttm/ttm.ko] undefined!
>> ERROR: modpost: "set_pages_array_uc" [drivers/gpu/drm/ttm/ttm.ko] undefined!
>> ERROR: modpost: "set_pages_wb" [drivers/gpu/drm/ttm/ttm.ko] undefined!
>> ERROR: modpost: "set_pages_array_wb" [drivers/gpu/drm/ttm/ttm.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
