Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D581EA65;
	Fri, 29 Nov 2024 02:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732849021; cv=none; b=CCVxcTK3JuCNKvYKQexmxXZfuY0lDcJhWVM36xP0XMRtbcKKjVEHMJ1Wt6d0sfYzdQPyMphfc9kcYFSGf7mJxvIZHPeeWB3YC8L1FNVybReGP+NlrxKMXkNdp1e6CmC51zi4rOEHGWjkneNvUN014ttHDVBrPfyBDUpAiEe7nqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732849021; c=relaxed/simple;
	bh=XXfMl4Mqi1ULYgTjLVeeMqVxSdIsAxB6w3EmIDy0vas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gy8qHxhSkMD8RR9CEDzptYceN13cyX5DRzyNVPWxgwh9s8VhFJSd/KNPO9Ti/P2FXIyxzsJ9fL23oKVcyjXJjTkU38VLhiajdQ/TyV8nR2T6EqmvsRWr6H0eQy7abekznGWuxtqH1Hm4IVwWO5g5BJZEpR1UodptLNQosiCFo5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MtBSs4ss; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MtBSs4ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732849020; x=1764385020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XXfMl4Mqi1ULYgTjLVeeMqVxSdIsAxB6w3EmIDy0vas=;
  b=MtBSs4sst0yaTg1fjXF0defxmQxVynqMot82iSTdbKLJpW3Ts8vgDy1j
   fsdsAv/MaHAE8DTHj+/diNm0GGPur/AmuQoyyAN0K+0Bwm0IjfKDQhNdL
   Je+gYu6zGLC8kcHZlgs069DatDN22t7WUYIkVOhkge0o+B24c+rKizPzz
   QeJme/3LHEsaUswGijY7rGzi4KsaMeMn0fvHX1zN8VJlA9JSiIP7orjW5
   SWQRu85dXjr8ulA9IHVaXNxIpbRjgD65gvwkhu8exVWlp1ntXj8pZg3kA
   ZLrJja7P+SIYQpfUyV8PUK5HFLIgxBYcw83VgeyoIfNNHlVSwZ5fQd9aD
   Q==;
X-CSE-ConnectionGUID: pFIXYmbYRhmu2b7P54q5KA==
X-CSE-MsgGUID: qvUczrh8QAKzBPQY5IGS4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="20676728"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="20676728"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 18:56:59 -0800
X-CSE-ConnectionGUID: SzScHw5zRKq4Y+oeUvziDQ==
X-CSE-MsgGUID: Ac8W96CDTW+6E1aupezo/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; 
   d="scan'208";a="123240048"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2024 18:56:58 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGrBf-000AGb-1q;
	Fri, 29 Nov 2024 02:56:55 +0000
Date: Fri, 29 Nov 2024 10:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 4/4] optee: support restricted memory allocation
Message-ID: <202411291002.HBDIJYKl-lkp@intel.com>
References: <20241128150927.1377981-5-jens.wiklander@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128150927.1377981-5-jens.wiklander@linaro.org>

Hi Jens,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.12 next-20241128]
[cannot apply to sailus-media-tree/streams sailus-media-tree/master drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Wiklander/tee-add-restricted-memory-allocation/20241128-231155
base:   linus/master
patch link:    https://lore.kernel.org/r/20241128150927.1377981-5-jens.wiklander%40linaro.org
patch subject: [PATCH v3 4/4] optee: support restricted memory allocation
config: arm-randconfig-001-20241129 (https://download.01.org/0day-ci/archive/20241129/202411291002.HBDIJYKl-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411291002.HBDIJYKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411291002.HBDIJYKl-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/xen/xenbus/xenbus_probe_frontend.o
WARNING: modpost: module tee uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
WARNING: modpost: module tee uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
WARNING: modpost: module tee uses symbol dma_buf_export from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: "cma_alloc" [drivers/tee/optee/optee.ko] undefined!
>> ERROR: modpost: "cma_release" [drivers/tee/optee/optee.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
