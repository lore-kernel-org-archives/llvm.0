Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24151DCB31;
	Thu, 17 Oct 2024 12:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729167027; cv=none; b=P7tEAZ7J0Z7n2wQvRVpo9DQyk45gkDsLWyea8HGDLHO3xeWS/9bqaqKJk6l0ASMxmEtrXoP+f23Z5NDrErxKsZ0/TN+l6Q9LsmO7oqVg5iM+mm+IeE2RhKjEKTkWX0p9LeiIYdgDmBq+G12EqjujjiaaUJqKiCMjBWsQtvjAhKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729167027; c=relaxed/simple;
	bh=NT44ZZre6TjCWX76H+BZberz4iyki6ow/DPBlAmwnz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iP64+qo/82LqV7dHJQGoDcmUULYUREvKXqE2kxIHSlAnCwdW2Ay2DZDvYyFEHOpNhdPXGJxT9w8PvE3YFcRgtD0M0Jt0h20zwovzJMIwuFsjV7aCGGDbdOo4N0/SrvlCaLLPwdad53hWVgANt9wWISQEgOXs8y3aMj+wFb7omig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYyElavr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYyElavr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729167023; x=1760703023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NT44ZZre6TjCWX76H+BZberz4iyki6ow/DPBlAmwnz0=;
  b=TYyElavrahzRmsvYAPIhhPhGOMbAmMin/hNXAOB4NXRs/CcqRSw8vasw
   0eCPJEBurtJKJxP07gU0ZGbTRxmsGeOb5s3KS/SIHHLtp1vmBkIMuJ8fg
   yU2mIsCCBST9rOCPIDHuZ6HLkPEfs5tRq7Q0KKMyxQ0lNTu14GTBs9+/u
   qbzWMT4GciUcNvxvjB3KOXA3SLBJV5JJyXwRjVufbQAgGApZ+VqjnffZY
   Qh5A1w5wNo0+Xm5TOzBeEePNn0k+KlwvILjyYixUVT4/GLqbKilRjHBKE
   BIUOgPgJgduJNBzr8IrtVQCExPVcX28o6QFLMYkg2tuSBWmB3za64Nw8U
   A==;
X-CSE-ConnectionGUID: uDSNP3UgTYWhGzWtMB2T0Q==
X-CSE-MsgGUID: HgO3nV2jRuWmErYV0uWzoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28601372"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28601372"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 05:10:23 -0700
X-CSE-ConnectionGUID: FeKCE//vSLuAYKD+etOkIw==
X-CSE-MsgGUID: S4LRezwoQMCINsXZL+p4bA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78553510"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Oct 2024 05:10:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1PKd-000MHf-0G;
	Thu, 17 Oct 2024 12:10:19 +0000
Date: Thu, 17 Oct 2024 20:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] um: Fix passing '-n' to linker for stub_exe
Message-ID: <202410171923.EbeKa7tA-lkp@intel.com>
References: <20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78@kernel.org>

Hi Nathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 41ab5fe7471ff38d2909d1c93b88197a89c6a00f]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/um-Fix-passing-n-to-linker-for-stub_exe/20241017-051439
base:   41ab5fe7471ff38d2909d1c93b88197a89c6a00f
patch link:    https://lore.kernel.org/r/20241016-uml-fix-stub_exe-clang-v1-1-3d6381dc5a78%40kernel.org
patch subject: [PATCH 1/2] um: Fix passing '-n' to linker for stub_exe
config: um-defconfig (https://download.01.org/0day-ci/archive/20241017/202410171923.EbeKa7tA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171923.EbeKa7tA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171923.EbeKa7tA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang: warning: argument unused during compilation: '-mno-3dnow' [-Wunused-command-line-argument]
   /usr/bin/ld: arch/um/kernel/skas/stub_exe.o: in function `_start':
   arch/um/kernel/skas/stub_exe.c:83: undefined reference to `memset'
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
