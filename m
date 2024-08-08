Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE117FD;
	Thu,  8 Aug 2024 04:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723092109; cv=none; b=hYVKaeZeUF2nAUVdtmCga4YSV0cTjAuK8wFjIUbq+RmZXjG6uAn4QSjoMTleeKdVxzPocwWGNpm5tXKLAKezSAw5x5WTQpCZAeOpwe5RuLZ0WL2fhjKUOKPLRy2TUleTjIySdGQdhKpeVjSKkQDx1A7NmDZtKqNSLmGsNN3zv2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723092109; c=relaxed/simple;
	bh=OVE7uz7cq7zfnOGalTS92CeRq1M5R6Pcf4cUkinFUbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MhYC0rrYBIrh46Stb+o/KJBx1OrtYcoaBD5yZ/jfjlPyPwfk9fUvp4xWUR8OMQ0kmAbXnwVFgF85X64MXZ0ILtmjFKxAU+ygM+PUcSJ8+tRP23F8OyBbNjyIVtcOQteJeLOV5t0LaPTHdPM84kEZQ76VLRYDKSTEMMVTr5glvfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FvDG5FAJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FvDG5FAJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723092108; x=1754628108;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OVE7uz7cq7zfnOGalTS92CeRq1M5R6Pcf4cUkinFUbY=;
  b=FvDG5FAJzuDDM6nD8j/A/zVY7MH3rM0Xc4Ud2tBzIL2LaKGGzzzlhQox
   /OFaprosZAJexJ1OqVQEWNFCiQYDUXGYO0Y9jeGDjGrL+8ScA7d7ngq8K
   jJJwWN8hT58M9FRyfvAZWPVcVJwQEZQs2BVZ/q0ZLt+zjA61oJqeAn+DR
   yNlwpD9oTixsY8i74XNU3hWi/g36+f8g5cd4Aa2dZcz5hi+jr8IhYV80n
   g7hPqfUE49XSPHxKtMmjkwcb8TWG3Z5vJUgKJ8QlNtqou1Yvnf0b7cPsc
   OTHBihavaeIO5O+VNzen74EuqkKTWEOFNRfdBsS+cW75ee6xhO7WMLPye
   g==;
X-CSE-ConnectionGUID: lb9mMHgYTpaJQxhCAlOzIQ==
X-CSE-MsgGUID: dCgTAcsKQymVOvBhJvulVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43716518"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="43716518"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 21:41:47 -0700
X-CSE-ConnectionGUID: fQDD5s82RqOlBw9LUPHOkg==
X-CSE-MsgGUID: p1K3VJNcRx+Y9DNWkYf1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="87747994"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2024 21:41:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbuy7-0005wT-2f;
	Thu, 08 Aug 2024 04:41:43 +0000
Date: Thu, 8 Aug 2024 12:37:19 +0800
From: kernel test robot <lkp@intel.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] kvm: Convert to use mm/guest_memfd
Message-ID: <202408081247.dXQ05sDr-lkp@intel.com>
References: <20240805-guest-memfd-lib-v1-2-e5a29a4ff5d7@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240805-guest-memfd-lib-v1-2-e5a29a4ff5d7@quicinc.com>

Hi Elliot,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Elliot-Berman/mm-Introduce-guest_memfd/20240806-024238
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240805-guest-memfd-lib-v1-2-e5a29a4ff5d7%40quicinc.com
patch subject: [PATCH RFC 2/4] kvm: Convert to use mm/guest_memfd
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240808/202408081247.dXQ05sDr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081247.dXQ05sDr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408081247.dXQ05sDr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:182:3: error: field designator 'free_folio' does not refer to any field in type 'const struct guest_memfd_operations'
     182 |         .free_folio = kvm_gmem_free_folio,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +182 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

a90764f0e4ed53 Michael Roth        2023-12-30  174  
33963ff1dd038b Elliot Berman       2024-08-05  175  static const struct guest_memfd_operations kvm_gmem_ops = {
33963ff1dd038b Elliot Berman       2024-08-05  176  	.invalidate_begin = kvm_gmem_invalidate_begin,
33963ff1dd038b Elliot Berman       2024-08-05  177  	.invalidate_end = kvm_gmem_invalidate_end,
33963ff1dd038b Elliot Berman       2024-08-05  178  #ifdef CONFIG_HAVE_KVM_GMEM_PREAPRE
33963ff1dd038b Elliot Berman       2024-08-05  179  	.prepare = kvm_gmem_prepare_folio,
33963ff1dd038b Elliot Berman       2024-08-05  180  #endif
a90764f0e4ed53 Michael Roth        2023-12-30  181  #ifdef CONFIG_HAVE_KVM_GMEM_INVALIDATE
a90764f0e4ed53 Michael Roth        2023-12-30 @182  	.free_folio = kvm_gmem_free_folio,
a90764f0e4ed53 Michael Roth        2023-12-30  183  #endif
33963ff1dd038b Elliot Berman       2024-08-05  184  	.release = kvm_gmem_release,
a7800aa80ea4d5 Sean Christopherson 2023-11-13  185  };
a7800aa80ea4d5 Sean Christopherson 2023-11-13  186  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
