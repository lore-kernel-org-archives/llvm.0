Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675CD2F28EB;
	Sat, 27 Dec 2025 12:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766837514; cv=none; b=YlFU+sfun4wXVO1ZdSrig4UB2xckt9JGYqheWwOehRONAoGG2xGT+9GLY1mqiuX+5Jyx7Z0pK4+NdMylg/IaoMTHfuK8ag9ENvhuo6zGKb6kZZSNAVIfXFZLaUS80zTIoLQO+E0uQxr79yTRYId2RugQ4oHpecqfJps50Xspbpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766837514; c=relaxed/simple;
	bh=5rlzGCg2dCtgcZ3ltO61gAui7Ts+OfSSOjrtg9tCM7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsb78/PvJCx5Fr87tvMHcTra71Y+clCnMCMo7WZuh6ELkmbb5Xkc4+JvtX6yk7e45kiZrxYVAi8XB2wAN3ME4tx+3i9HSEmuX/f8aLO3qBQ7fE/dwso3MH6/v0Nwh3qk6MIQb2Xb6VJq6NYhSkr9djhJn9I6E34hYQeCvIoPGTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nbC9q+iS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nbC9q+iS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766837512; x=1798373512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5rlzGCg2dCtgcZ3ltO61gAui7Ts+OfSSOjrtg9tCM7c=;
  b=nbC9q+iSRr3dQ9JOn+wlnChfw0+Z96F9V+ADFT4fzuRjNfMjxHW2b0LC
   SL6tvpvVK0fVtN5UbdkSvFTku3/ANeDLbJVCriMgZB/nf5Kd/Iy3wAQ6T
   KT6VBLDNXb690i3FD28di0G4EzfchdgJYkFP88erE9PKNBeAh9/hcz2D9
   XLCMgGJKfk41GThf0nlXxoBLtC4X1IY6SuI9lHBhxjL9is4cchorCxzRd
   ExqO1MwGzOjkxTq/ykxgs9L5dle1uiC5IgpmKsgInJPxAsKYl1aIZxGrF
   EzzNk18sfAFBgD9bvp2nAgSEwXrFeLRMeeZQajdtbeh5JSbC7NmMePpNp
   w==;
X-CSE-ConnectionGUID: Z3T6mko+SaSvdEdvGij67Q==
X-CSE-MsgGUID: mnIkhoTqR9upYq1nRX83yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68432687"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68432687"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 04:11:52 -0800
X-CSE-ConnectionGUID: DKd9dMYsRK+R6UugFpJynA==
X-CSE-MsgGUID: 7KDCho3+R86Lv2bUmNPLBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200182349"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Dec 2025 04:11:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZT9A-000000005oj-11Cq;
	Sat, 27 Dec 2025 12:11:48 +0000
Date: Sat, 27 Dec 2025 20:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>, dmaengine@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: pl08x: add COMPILE_TEST support
Message-ID: <202512271929.xdAStz0T-lkp@intel.com>
References: <20251223204500.12786-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223204500.12786-1-rosenp@gmail.com>

Hi Rosen,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rosen-Penev/dmaengine-pl08x-add-COMPILE_TEST-support/20251224-045157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20251223204500.12786-1-rosenp%40gmail.com
patch subject: [PATCH] dmaengine: pl08x: add COMPILE_TEST support
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251227/202512271929.xdAStz0T-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271929.xdAStz0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271929.xdAStz0T-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: amba_request_regions
   >>> referenced by amba-pl08x.c:2702 (drivers/dma/amba-pl08x.c:2702)
   >>>               vmlinux.o:(pl08x_probe)
--
>> ld.lld: error: undefined symbol: amba_release_regions
   >>> referenced by amba-pl08x.c:2977 (drivers/dma/amba-pl08x.c:2977)
   >>>               vmlinux.o:(pl08x_probe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
