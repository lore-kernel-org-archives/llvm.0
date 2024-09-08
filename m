Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BD116131C;
	Sun,  8 Sep 2024 23:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725838213; cv=none; b=M+r7R7I3VL4We1T6IUbzbGVJ60FtB9suEOI3zFw6Nq2+qxG3401j2M15zAWNC47UrLofAidBB1gW5pEoiqwb75HS+ZlTZbyVXcbl8F3QWRTq0BfpsPL300z5lOVsXVwcfJeLXAFmxLVex9dBxekdDxdQNcHXSiYvCSeW0/hlCq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725838213; c=relaxed/simple;
	bh=lUFLP2HRd2X2JjK7zXcxSdZ1fWTysYB1/qV2dk/l90g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R1xTp/VR7WBjsm5XATadM2bHmNThdY6BN+5go5/2jFpFxapACRQ48KroFcROC5HvUltau/FVM8rdNFZYkimPK9YQ3nWQDY8vM40tLkrjMiYDlP+EefSiVmflKkrDVAXbaYiVJREBoD+eOliqq4Ew2vhAIOqElIswzB0G4fxom7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f5r+7D9M; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f5r+7D9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725838212; x=1757374212;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lUFLP2HRd2X2JjK7zXcxSdZ1fWTysYB1/qV2dk/l90g=;
  b=f5r+7D9MaW2OL/MIg1GsPcC1X6gFpzOwxDRk2CqyaIzkMVfWwhqc7gLM
   CibQzttVNxNueodcE27CFeHAr0oOiLgJxnAqBjBLC2SB+POzn54+c0mAG
   mi+Y7g3SSD+YyL2eedluKNxdrlMQgydJlwkhyJVRGC5zV+21MpMx7fRC5
   bxVh8gd5Bc4WJTJIHD3flFpsfIoJ2fqQYpa5909tLFOsL3glo7KpUv0Ry
   nHNm3Y8hIwqV0kZLkJ2sOvVfW5dOPqhO5hPvlx/zsaH8V04i0sg9xuUa0
   hb21THmPXDmYdcDpUxiq7gkwoIcncqsrsP2Zf+Jx9eMBVsW6wE9DPtv+w
   A==;
X-CSE-ConnectionGUID: 7+jrzuN+SP2FH+qjaMePKA==
X-CSE-MsgGUID: k7rJ6dTRTbqHpOPj933NFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="35865351"
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="35865351"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 16:30:09 -0700
X-CSE-ConnectionGUID: 2X+0piqaSWWuIw4uykCLTg==
X-CSE-MsgGUID: sTse+OX3TmGFDwFevZbZXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,213,1719903600"; 
   d="scan'208";a="66481156"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2024 16:30:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snRM4-000E4e-1A;
	Sun, 08 Sep 2024 23:30:04 +0000
Date: Mon, 9 Sep 2024 07:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Vipin Sharma <vipinsh@google.com>, seanjc@google.com,
	pbonzini@redhat.com, dmatlack@google.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vipin Sharma <vipinsh@google.com>
Subject: Re: [PATCH v3 2/2] KVM: x86/mmu: Recover TDP MMU NX huge pages using
 MMU read lock
Message-ID: <202409090949.xuOxMsJ2-lkp@intel.com>
References: <20240906204515.3276696-3-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906204515.3276696-3-vipinsh@google.com>

Hi Vipin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 332d2c1d713e232e163386c35a3ba0c1b90df83f]

url:    https://github.com/intel-lab-lkp/linux/commits/Vipin-Sharma/KVM-x86-mmu-Track-TDP-MMU-NX-huge-pages-separately/20240907-044800
base:   332d2c1d713e232e163386c35a3ba0c1b90df83f
patch link:    https://lore.kernel.org/r/20240906204515.3276696-3-vipinsh%40google.com
patch subject: [PATCH v3 2/2] KVM: x86/mmu: Recover TDP MMU NX huge pages using MMU read lock
config: i386-randconfig-005-20240908 (https://download.01.org/0day-ci/archive/20240909/202409090949.xuOxMsJ2-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090949.xuOxMsJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409090949.xuOxMsJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kvm_tdp_mmu_zap_possible_nx_huge_page
   >>> referenced by mmu.c:7415 (arch/x86/kvm/mmu/mmu.c:7415)
   >>>               arch/x86/kvm/mmu/mmu.o:(kvm_recover_nx_huge_pages) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
