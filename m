Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F9F46450;
	Sat, 19 Oct 2024 00:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729299498; cv=none; b=hwBsGSf3W69nenpS8Z+g/iLy8BZgwnaWL9DeId9vPCgl4qt1qCTMWe4x9PRHCeMopw53hEo5FBpdXs1MkIRxvqikxUwqu0gaa48xa3qSSh3aF62J/VrglmEjHnMS8mK8NxZSyPN+ZI1tHBezKT0OSEe6yY+thly4+Tcyd1E7npw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729299498; c=relaxed/simple;
	bh=a86+QvWB2/TZqwb0nqGjm+Y8QEQcMsm9NfpM2wXkCgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4/Jr2WFrOjAeYPhlWvaYAhPhgGn0C1vGYoV9lK7jWIzKVY217wNpajibJXG6uvxPrqjVznJEWvHB9bcrf1S3GOOZ1OsPFa9mhQkLc38THlnjDRfN3WdbmSb05YYOxAKd8lWczcXsBHxXOFf00zBwwCpvqBJbMVft/fREA3MAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J8EAF6gj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J8EAF6gj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729299496; x=1760835496;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a86+QvWB2/TZqwb0nqGjm+Y8QEQcMsm9NfpM2wXkCgE=;
  b=J8EAF6gj1AdkT5cAnwxbyVmPSiAykZc3scWtMNIy5Pmie3QQZXF+KChf
   TxCQu3C22o8htrCYOPrQqqrAWdHFLh1W++Ebr1P/YYLvj1CDzhs7Xr0fS
   CQC7DVFnkjl27QChCMbU1h8324ANNe0kGFIl1UgwdZzjRxC9oP2REV5Ds
   le0BWT0s6NsCogEi87QH3kZ3uVhZqiII/1/8Wa83gsckxtQEdcFcC+Jjk
   fgTgY0ePh6ZUrkEDOMbfs5LwcdvDiNbOWgfpYwgCI6fzoYLXNV+b3PvCm
   88qSTMUW5RRFyf3XyHwo9Me+d0X1dnp94Eq+DrvPtF/zLCjoGl7rxYTgv
   g==;
X-CSE-ConnectionGUID: 4onSudqhRuuzGRZ8rp+wJA==
X-CSE-MsgGUID: UMAJ//UvSj+Wc1O2gm3LRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51392239"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51392239"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 17:58:15 -0700
X-CSE-ConnectionGUID: WU3fYWV1T9m/TU7gzG7+Zg==
X-CSE-MsgGUID: RCuox/90RbeF0odWHnZgtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79357023"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2024 17:58:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1xnH-000OV7-2K;
	Sat, 19 Oct 2024 00:58:11 +0000
Date: Sat, 19 Oct 2024 08:57:17 +0800
From: kernel test robot <lkp@intel.com>
To: Bernd Schubert <bschubert@ddn.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v4 05/15] fuse: {uring} Handle SQEs - register
 commands
Message-ID: <202410190841.n8rx2ZE2-lkp@intel.com>
References: <20241016-fuse-uring-for-6-10-rfc4-v4-5-9739c753666e@ddn.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016-fuse-uring-for-6-10-rfc4-v4-5-9739c753666e@ddn.com>

Hi Bernd,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 0c3836482481200ead7b416ca80c68a29cfdaabd]

url:    https://github.com/intel-lab-lkp/linux/commits/Bernd-Schubert/fuse-rename-to-fuse_dev_end_requests-and-make-non-static/20241016-084030
base:   0c3836482481200ead7b416ca80c68a29cfdaabd
patch link:    https://lore.kernel.org/r/20241016-fuse-uring-for-6-10-rfc4-v4-5-9739c753666e%40ddn.com
patch subject: [PATCH RFC v4 05/15] fuse: {uring} Handle SQEs - register commands
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241019/202410190841.n8rx2ZE2-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190841.n8rx2ZE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190841.n8rx2ZE2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fuse/dev_uring.c:245: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Entry function from io_uring to handle the given passthrough command


vim +245 fs/fuse/dev_uring.c

   243	
   244	/**
 > 245	 * Entry function from io_uring to handle the given passthrough command

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
