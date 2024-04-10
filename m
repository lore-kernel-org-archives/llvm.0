Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7DDD51A;
	Wed, 10 Apr 2024 05:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712725247; cv=none; b=JAnojkUPEBNcLXGibY0C5obKnP4IzEjl3GQbMx6uxENd6p2zucPnsxNyfFH8tomkrG5unG9js0yaWgj234gPtU3BgpiF8lbQqOEq7wwf9p57g4SD8vdoP70UCMu74jKa+RBAKnxC7A69wd5SPyS5hhX4FkwhYQxwT5vX8LKW5LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712725247; c=relaxed/simple;
	bh=vDu/cpvZXgpJGXu0mCBfjl934vMBoNMbfhDnBYIlEr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yxcj1a91uXhYnLap6z596QYNIxb9JDsaKS38rf8SoMO+5k7OGD4B1W2uHWu0dInnUuAOTiRPtqywARAACRwqPtZ52i77MMitEu9ZK4K0ZrQj1opnZhy2rKiSWyRBBmXDYuVi6bWhZi4naCFN/vqqeAzKgpN+ONe2zhWYp0mC3R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlCekdo1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlCekdo1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712725244; x=1744261244;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vDu/cpvZXgpJGXu0mCBfjl934vMBoNMbfhDnBYIlEr0=;
  b=QlCekdo1ArVMj7NSeUpjWFbcfD3D9bHL5PpxopbNCC0nnK7+KaEvY7j5
   XRjlkJgqNJk+IrwChmH8psR469Jb2yCb+w/nWK4sxpMOTFnwtJGWEVh/Y
   S5rBoX8BO3HG4s/k10XKZSq69i7ojfBT/mZBdJmtaCFkL2TQfnYTuGKbn
   +P5jxj5BHQ04BgAlzP32Vd6zG43jcsoidm8Br5Lvc43HCUGeW/5IbbzG+
   2gep8Vpv7eAWJZM5vz24Bcge3OYt4w8AT271ztLMi3zhZxV2x0Pl+i6+I
   QtDaASUcSXilJV6kFd2ucP2bEQRRWQ6/Pmh8odDqCxmhBXAujUlG1o86e
   w==;
X-CSE-ConnectionGUID: JhGkOaNcQsuu0x7hy4EjyA==
X-CSE-MsgGUID: spGLBjToSsyISr7kJn6rfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19219366"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="19219366"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 22:00:44 -0700
X-CSE-ConnectionGUID: rCwj8ExmRmKFgylFA/1JIg==
X-CSE-MsgGUID: PbCmtZQKS3+mDajyEVHPZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="20872062"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Apr 2024 22:00:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruQ4e-0006tS-1b;
	Wed, 10 Apr 2024 05:00:40 +0000
Date: Wed, 10 Apr 2024 12:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 3/3] btf: Avoid weak external references
Message-ID: <202404101227.noCGQr02-lkp@intel.com>
References: <20240409150132.4097042-8-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409150132.4097042-8-ardb+git@google.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on bpf-next/master bpf/master linus/master v6.9-rc3 next-20240409]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/kallsyms-Avoid-weak-references-for-kallsyms-symbols/20240409-230510
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20240409150132.4097042-8-ardb%2Bgit%40google.com
patch subject: [PATCH v2 3/3] btf: Avoid weak external references
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240410/202404101227.noCGQr02-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404101227.noCGQr02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404101227.noCGQr02-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __start_BTF
   >>> referenced by btf.c
   >>>               kernel/bpf/btf.o:(btf_parse_vmlinux) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: __stop_BTF
   >>> referenced by btf.c
   >>>               kernel/bpf/btf.o:(btf_parse_vmlinux) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
