Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A1C23E35B;
	Sat, 27 Dec 2025 15:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766848046; cv=none; b=m1Fmw4LGW3XLr7YIkvxD7NAfN0KkUYnzE/Rer0BWgpWw+GFkgI+fQsFvwxTS4nNDa5HMTBmq7WYtNbcyH7R9Ij0mjQ9XAB1mOtX3u+m9h0iaM6mWF6Wpk+B/RMEgSklWK+DRthukOQV8PKnh10cjAj9AIzllZPhGR6RmGYYYoG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766848046; c=relaxed/simple;
	bh=xqZOt/9GsTTQwp5RVydfVi0B4bFLf3ivbGjpdJVoesA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Cpiy/6OvFxTIxSNLLKSILhipgDTnTuCSzMP+iM3oHU/JO89/7q90wCtUnyyOMmOQe4sYC65TVenjotNirw9ilPCaXVhAkf2593NumRiAd0d0t2ZbHI0TuzjU/3C5W9KCaFRs3aQiLioQ/F39332fgZNecgLYgmBP1I7rw0+GG9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMebbkXw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMebbkXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766848044; x=1798384044;
  h=date:from:to:cc:subject:message-id;
  bh=xqZOt/9GsTTQwp5RVydfVi0B4bFLf3ivbGjpdJVoesA=;
  b=PMebbkXwxxelpS31Re0ttL8TrJHD8bKZJyGhjB9EAtjvM5OnXMNYHDK2
   qU3XPs5ol2rcTZy86AgQMZqLcff82sZFnVGpNTO2t6ZHMi/G6SfSZTOyZ
   dxtVrym52F0HginesKEwltwe4BTvxPJQoMH+syTmJa1y3u7CRgtnHLSSH
   2H50mUWUNUMZoyFQE7g0XzGZOBAtbEixT4jvlWOKBJL56g28t1S2ylfNn
   v4azrTKcpOdAPhN1k/vSoyogo+zhtK84G/JdobMzW8Ntb2fPlPkXVTo1w
   ZhEcoX/IGBH1YGwqZj/5061dI89DZ4cyJcYXrZkHZDythWk4TjCS8+VOW
   w==;
X-CSE-ConnectionGUID: ja/EsRxNRzmKZapdvqx9oQ==
X-CSE-MsgGUID: oAP58YMRRba3K05pqDUC3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68433057"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68433057"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 07:07:24 -0800
X-CSE-ConnectionGUID: ix6tNHCsSWy1ooUmW68OlQ==
X-CSE-MsgGUID: KRtgs7RxTT+HRkj+aUYEqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200199174"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 27 Dec 2025 07:07:22 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZVsx-000000005th-4A9W;
	Sat, 27 Dec 2025 15:07:16 +0000
Date: Sat, 27 Dec 2025 23:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 28/29]
 drivers/firmware/efi/libstub/x86-stub.c:1059:13: error: call to undeclared
 function 'early_is_sevsnp_guest'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202512272254.zE43KBLL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   b6f238d2e8720acf63467aa0d48d7fc4e31c07c2
commit: 7a69275e4b87b5b7a64423c76234bb7d8da60107 [28/29] x86/boot: Move memory acceptance logic into the EFI stub
config: x86_64-randconfig-006-20251227 (https://download.01.org/0day-ci/archive/20251227/202512272254.zE43KBLL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272254.zE43KBLL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512272254.zE43KBLL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/x86-stub.c:1059:13: error: call to undeclared function 'early_is_sevsnp_guest'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1059 |         } else if (early_is_sevsnp_guest()) {
         |                    ^
   drivers/firmware/efi/libstub/x86-stub.c:1059:13: note: did you mean 'early_is_tdx_guest'?
   drivers/firmware/efi/libstub/x86-stub.c:1034:13: note: 'early_is_tdx_guest' declared here
    1034 | static bool early_is_tdx_guest(void)
         |             ^
   1 error generated.


vim +/early_is_sevsnp_guest +1059 drivers/firmware/efi/libstub/x86-stub.c

  1052	
  1053	void arch_accept_memory(phys_addr_t start, phys_addr_t end)
  1054	{
  1055		/* Platform-specific memory-acceptance call goes here */
  1056		if (early_is_tdx_guest()) {
  1057			if (!tdx_accept_memory(start, end))
  1058				panic("TDX: Failed to accept memory\n");
> 1059		} else if (early_is_sevsnp_guest()) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
