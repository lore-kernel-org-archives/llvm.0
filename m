Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8E158DAC;
	Wed, 24 Sep 2025 06:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758695042; cv=none; b=lIJf+J1GOvw1+CYSIo/8BdCNZ4KrCj2/AK9eF6n+BWhaLWGfoMXLmVxGgc/cQHlJVg0CxeKxzJjaSpst+fnqAyuC48CrjQXlx7HGcQN2hp3mrISaXgb26pIWvXEB7FPLJFx4pOggP4tUS2D9voZE77zE+DOlbE+6XA99Ewvd5ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758695042; c=relaxed/simple;
	bh=I8HZOQSfMokSwjPSe8/m4cjs8hXw4JsvLpSWTtiD+48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjD/2+q8WNCblQb08zC4x/gYnLJnCE6YBad4jUbY2CuxMIPdvLki/99ud3HqC9M7//UwaEjpSUXb4kIGdXkTwC7BzLPr+CeN2bgqx0Xcz77K/8aRX7KwRhxL9W/NMCZ+xw06nsRlKVbW4ie5kUFfHog67Lx6cxkVd80iL9sxnrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Urzj0iPJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Urzj0iPJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758695040; x=1790231040;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=I8HZOQSfMokSwjPSe8/m4cjs8hXw4JsvLpSWTtiD+48=;
  b=Urzj0iPJ4ZiVQI9DzxPPC/on5X+IaBChp4IzwNRD431eVtXpmewJoih7
   QFYDzpKxkEjHTlZD2FFQfLM6CjGRmu+Jx3hl/4GqAsIRtuZMfJfT8na7R
   pwKg4cTxwG+zEcW8aOok5BydjJQFaE5KhBiMWc6T6okl8IMgoHfCm11gU
   9vwLzjPjafkjoW8PgYqrCyarzsNV4kwD47cP2FxBVrXQPPnyXTkXWTNwE
   DFpB9L4xlMOo6F57IF+xMup5Kkpxq9neBdoL8JkzhXU0XyrYNpQ7IG7K1
   EpPNzG6knTvIswsl2OoMeHBZ1HnLRsZ3CwH79wbz7fW7n/xQa2pbYwbvI
   g==;
X-CSE-ConnectionGUID: LyH2xOglSV+VCMiKMvr8zw==
X-CSE-MsgGUID: hQLQGO5YQEqO92mqJdLGaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60908763"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="60908763"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 23:24:00 -0700
X-CSE-ConnectionGUID: A6RkHmk2TX6oO+2f83ep4Q==
X-CSE-MsgGUID: yqUs/8LFSpCGR9c5V8ZrXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="177394726"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 23 Sep 2025 23:23:57 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1Iuw-0003rB-29;
	Wed, 24 Sep 2025 06:23:54 +0000
Date: Wed, 24 Sep 2025 14:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>,
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel@collabora.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	=?iso-8859-1?Q?Lo=EFc?= Molinari <loic.molinari@collabora.com>
Subject: Re: [PATCH] drm/shmem-helper: Add huge page fault handler
Message-ID: <202509241315.8jjCyL7U-lkp@intel.com>
References: <20250923095634.50051-1-loic.molinari@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923095634.50051-1-loic.molinari@collabora.com>

Hi Loïc,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm/drm-next drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.17-rc7 next-20250923]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lo-c-Molinari/drm-shmem-helper-Add-huge-page-fault-handler/20250923-175753
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20250923095634.50051-1-loic.molinari%40collabora.com
patch subject: [PATCH] drm/shmem-helper: Add huge page fault handler
config: i386-buildonly-randconfig-002-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241315.8jjCyL7U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241315.8jjCyL7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241315.8jjCyL7U-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/drm_gem_shmem_helper.c:595:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     595 |         }
         |         ^
   drivers/gpu/drm/drm_gem_shmem_helper.c:548:21: warning: unused variable 'paddr' [-Wunused-variable]
     548 |         unsigned long pfn, paddr;
         |                            ^~~~~
>> drivers/gpu/drm/drm_gem_shmem_helper.c:594:2: warning: variable 'ret' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     594 |         default:
         |         ^~~~~~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:600:9: note: uninitialized use occurs here
     600 |         return ret;
         |                ^~~
   drivers/gpu/drm/drm_gem_shmem_helper.c:545:16: note: initialize the variable 'ret' to silence this warning
     545 |         vm_fault_t ret;
         |                       ^
         |                        = 0
   3 warnings generated.


vim +595 drivers/gpu/drm/drm_gem_shmem_helper.c

2194a63a818db71 Noralf Trønnes  2019-03-12  593  
16bf6748ef6aaf1 Loïc Molinari   2025-09-23 @594  	default:
d611b4a0907cece Neil Roberts    2021-02-23 @595  	}
d611b4a0907cece Neil Roberts    2021-02-23  596  
16bf6748ef6aaf1 Loïc Molinari   2025-09-23  597   out:
21aa27ddc582693 Dmitry Osipenko 2023-05-30  598  	dma_resv_unlock(shmem->base.resv);
d611b4a0907cece Neil Roberts    2021-02-23  599  
d611b4a0907cece Neil Roberts    2021-02-23  600  	return ret;
2194a63a818db71 Noralf Trønnes  2019-03-12  601  }
2194a63a818db71 Noralf Trønnes  2019-03-12  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
