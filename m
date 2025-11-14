Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21C12327A3;
	Fri, 14 Nov 2025 07:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763105470; cv=none; b=DunWVM//S5TxpFOgo0Qj76VfKqWwX5qbh6YpvWI283ZGzO8Cc6keuNS1dOOQiixv6C7gHcAvTUMXdWS7Ok8Hk38jtNTJ9mYkpGR9YJnwP21xDzS0g1mlzYnqSBfRcJCjpCcU9A6R9XzzI6YxeiUhvhkqs7fRLMaQg1i9uPAOY1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763105470; c=relaxed/simple;
	bh=YqUWGkPbN/V/TNvPETtR8gEtdGo82kPHsqkE8jDKi9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmRNl5gSzOZYB/xGRUd17AOSWTLBeNDJa0DcOdftqrzCvNm+8dICwDqCq4PVs2DddNNw9koD//GKIwULaB6zvn/08rapVrRc1HuUAEq8by/JD0LGLTkbMk4f0uHg0PQ4jwDgnvNOhV4OrQlC8F3eYhW74wUqF8tKvHPZMDBHWGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVlzRQu0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVlzRQu0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763105469; x=1794641469;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YqUWGkPbN/V/TNvPETtR8gEtdGo82kPHsqkE8jDKi9Q=;
  b=GVlzRQu09gfCjU9/8fTZFEU3ArZc0NZT9ZKxM3+c3+aF+rFI5dhd3724
   WwVmQP35KnXPAlH+2ePff2THZyd6pzLPJOnqGoQlJVI06ho9za9Bg/HNU
   txloO5EEyQHwKBnX5llPLjAMOngi1XxCWW8rxasAdBRj3ZesieQGiRr7z
   FTzgcLZ4lUcH+9gXnT7LD9ik1F1LY0z74bx4FDcjBAHyiQ55OJ5DYP2JK
   ukLO5/qSU6mdwXxFzG5IhOtFl3eQUcX0zLR3LTtrX2n0bkMqlhLEye4Yf
   IUgGYIQf/H5cnxabtwlqa0AD6KMmWxZpC/1UKoLIZbfHX/yFi4jhANtyu
   Q==;
X-CSE-ConnectionGUID: MbgICGvyRcOoS1tQ+vl4cw==
X-CSE-MsgGUID: HshAQg/9TxWdDwNXOoiuvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64201501"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="64201501"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 23:31:07 -0800
X-CSE-ConnectionGUID: KJKJ9fdmQW63RP8Wa1dZ3w==
X-CSE-MsgGUID: mfThGXB1SpW2ZGEEWO0+1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="220572128"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 13 Nov 2025 23:31:04 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJoGs-0006Ix-17;
	Fri, 14 Nov 2025 07:31:02 +0000
Date: Fri, 14 Nov 2025 15:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
	tursulin@ursulin.net, matthew.brost@intel.com,
	dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 04/18] dma-buf: inline spinlock for fence protection v2
Message-ID: <202511141529.mZKt8xhV-lkp@intel.com>
References: <20251113145332.16805-5-christian.koenig@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113145332.16805-5-christian.koenig@amd.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20251113]
[also build test ERROR on v6.18-rc5]
[cannot apply to drm-xe/drm-xe-next linus/master v6.18-rc5 v6.18-rc4 v6.18-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-K-nig/dma-buf-protected-fence-ops-by-RCU-v3/20251113-235209
base:   next-20251113
patch link:    https://lore.kernel.org/r/20251113145332.16805-5-christian.koenig%40amd.com
patch subject: [PATCH 04/18] dma-buf: inline spinlock for fence protection v2
config: arm-randconfig-004-20251114 (https://download.01.org/0day-ci/archive/20251114/202511141529.mZKt8xhV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251114/202511141529.mZKt8xhV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511141529.mZKt8xhV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma-buf/st-dma-fence.c:454:19: error: no member named 'lock' in 'struct dma_fence'
     454 |         spin_lock_irq(f->lock);
         |                       ~  ^
   drivers/dma-buf/st-dma-fence.c:455:21: error: no member named 'lock' in 'struct dma_fence'
     455 |         spin_unlock_irq(f->lock);
         |                         ~  ^
   2 errors generated.


vim +454 drivers/dma-buf/st-dma-fence.c

2989f6451084ae Chris Wilson 2019-08-19  451  
2989f6451084ae Chris Wilson 2019-08-19  452  static void __wait_for_callbacks(struct dma_fence *f)
2989f6451084ae Chris Wilson 2019-08-19  453  {
2989f6451084ae Chris Wilson 2019-08-19 @454  	spin_lock_irq(f->lock);
2989f6451084ae Chris Wilson 2019-08-19  455  	spin_unlock_irq(f->lock);
2989f6451084ae Chris Wilson 2019-08-19  456  }
2989f6451084ae Chris Wilson 2019-08-19  457  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
