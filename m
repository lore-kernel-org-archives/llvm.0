Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABA63214;
	Sun, 27 Jul 2025 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753603878; cv=none; b=Fietqsax1gzJLWZxtwOuAOJb8IzA+RH7lpsWoCDYuo0gxjzGa4bZTrIfABsV9I69zqCPswvQkJBUWesrNGrR5lPfvsUxtDHs19qIRYuMnSvW31iG0oeGCmAa4jr0t1MmS8Qv7JCb37XNUOejNnpuHQzQNt8rqo+9j0uA+jy02uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753603878; c=relaxed/simple;
	bh=4FedQwpo21O6kkDYFOMU2UHM1W68LbWBJqIkET8nh6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QoAjAAalBdpZPOXVE6GPxlOVheYmoJsBTMZv3/AzdpKpIZmW9ABfLD2WfMJInMmMQivxHBx/rWbsHGyQ3vu5mD/+5/nLHUsrMj69EfJLISfI1KosMU+g/fqFLVBuvqmk0oHVTgc2rhpwB0Z3e5GE4CAW0ZN2fG+aTce3pcbPGb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ue70EYy4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ue70EYy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753603876; x=1785139876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4FedQwpo21O6kkDYFOMU2UHM1W68LbWBJqIkET8nh6A=;
  b=Ue70EYy4yTpBECVK3I2ZYGRUS6FKLGS7M0MWYlMVfS0AHy1HxvbqEj2t
   0Qf8+69J0LTLfczKPyOTPRasUQqaLo4qwsaSqFvOs7WUbZzVmVSGjT7yV
   x8hiSp05HfnKMNffR2npI34Cqq3QbNsYDRPnbKKW8jYXo/KqQXOyQ7dTI
   iiUTAVF8/fnZZJgS47QxkmM24T4IwBqNWhhmZYn2J5g9d4rFRdN48j5FA
   Et2GTUZms1UUJ9EEqA+BWgGfRp0LSVQdxrxsnKcY3QNuFLgZJujJE8Bx1
   AuiO5xoBaQxymvZtciKUI3xkq+0bZDyaxkKaRZBDlJGWs7l+xNPBrg4yc
   w==;
X-CSE-ConnectionGUID: an5+vP1OQVanbZbnGQKPXQ==
X-CSE-MsgGUID: FHqql7nhRMO8susKzQPqIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55816683"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55816683"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 01:11:15 -0700
X-CSE-ConnectionGUID: x3gjD4ByQEyT22ONib4p7A==
X-CSE-MsgGUID: pZgrb0F5TZOYN8HI4ByDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="166185184"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jul 2025 01:11:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufwTQ-000MXr-1F;
	Sun, 27 Jul 2025 08:11:12 +0000
Date: Sun, 27 Jul 2025 16:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V4 1/4] x86/hyperv: Don't use hv apic driver when
 Secure AVIC is available
Message-ID: <202507271542.YD3JVjci-lkp@intel.com>
References: <20250726134250.4414-2-ltykernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250726134250.4414-2-ltykernel@gmail.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-hyperv-Don-t-use-hv-apic-driver-when-Secure-AVIC-is-available/20250726-214638
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250726134250.4414-2-ltykernel%40gmail.com
patch subject: [RFC PATCH V4 1/4] x86/hyperv: Don't use hv apic driver when Secure AVIC is available
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250727/202507271542.YD3JVjci-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271542.YD3JVjci-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271542.YD3JVjci-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/hyperv/hv_apic.c:296:22: error: use of undeclared identifier 'CC_ATTR_SNP_SECURE_AVIC'
     296 |         if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))
         |                             ^
   1 error generated.


vim +/CC_ATTR_SNP_SECURE_AVIC +296 arch/x86/hyperv/hv_apic.c

   293	
   294	void __init hv_apic_init(void)
   295	{
 > 296		if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
