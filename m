Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76A66FBF;
	Sat, 18 Oct 2025 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760756453; cv=none; b=o/O8XX4EDRSP0I1pJGknS7cLezUz97TEkDuZlMxxFE/WIVTemBTMRVe/HIFX24ZBUW72pcewLFvU9LP6Hfxgl/mSMlgdz7apEt35JpPTl7AelxgLH5JHLF/V3jkIIKO2hsJAs6wN4Dwom19X0Z5ZcJCoT6SS9LGECr4YLPrGGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760756453; c=relaxed/simple;
	bh=8tlgm7mpNKkm6Twri/qRQ3J3jM/rabJxb5EwJ6nhYwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owz0tL7QCf9xhpHA0Ropqf5ZaDbWHIfR0nZtjTZMQciyvHWkQTs23kYLwgkBxHQZbX2gEa6T9XAGRfxqMbecleEay/VohJReKX8BS+n+MIfYU0iDsTXT0CUE2eggMiXYK0Fy5ze0Hukszmvzp4oGxpLNBrBNs6W01MrC9Qa7IDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6GJ2eXl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6GJ2eXl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760756452; x=1792292452;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8tlgm7mpNKkm6Twri/qRQ3J3jM/rabJxb5EwJ6nhYwY=;
  b=D6GJ2eXlq/rMQuiV5hlkUHSyGTYpuEovALSqnrf7SOLqw43UfcIT7zni
   rWgq99pqQVed53EtuS/rChvnhPxocQor2heLJi7nlK6lxzlU8HIFvgWtg
   RQXqtFOFCj/Y8WgOcQ8zlkIjS7XA6/yhesW6le18BVLzhPxKBkBIQFs4S
   7Ms1tCc+zBx/RZwevwb669C5G8l3rl41Mv85euSWImEliOOj8e3nNArOu
   JV9dU6HPx0zdV+QOIkWVoDUijr01zGR7tVXcCpgANtfBz1UmTddVKK30w
   HkgEUoyynptzpAFYmg1Th5kQlbwgcrPejuHpZUcPu/vpnwIXlmgDYxw0N
   g==;
X-CSE-ConnectionGUID: R74MU+S9S6Wxglxqfh3/Ng==
X-CSE-MsgGUID: b+PW6xdvSmiWmzeAywc7qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="74412435"
X-IronPort-AV: E=Sophos;i="6.19,238,1754982000"; 
   d="scan'208";a="74412435"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 20:00:51 -0700
X-CSE-ConnectionGUID: ADOMSsp+RnanSXRgi5+9ow==
X-CSE-MsgGUID: 5Eszuh4cTJOo7CFlljaCmg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Oct 2025 11:41:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9pOd-0007fD-2S;
	Fri, 17 Oct 2025 18:41:47 +0000
Date: Sat, 18 Oct 2025 02:40:59 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 3/4] KVM: VMX: Disable L1TF L1 data cache flush if
 CONFIG_CPU_MITIGATIONS=n
Message-ID: <202510180204.NTht8SEU-lkp@intel.com>
References: <20251016200417.97003-4-seanjc@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016200417.97003-4-seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on f222788458c8a7753d43befef2769cd282dc008e]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-VMX-Flush-CPU-buffers-as-needed-if-L1D-cache-flush-is-skipped/20251017-040642
base:   f222788458c8a7753d43befef2769cd282dc008e
patch link:    https://lore.kernel.org/r/20251016200417.97003-4-seanjc%40google.com
patch subject: [PATCH v3 3/4] KVM: VMX: Disable L1TF L1 data cache flush if CONFIG_CPU_MITIGATIONS=n
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251018/202510180204.NTht8SEU-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251018/202510180204.NTht8SEU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510180204.NTht8SEU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:313:29: error: too many arguments to function call, expected 0, have 1
     313 |         return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
         |                ~~~~~~~~~~~~~~~~~~~ ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:306:12: note: 'vmx_setup_l1d_flush' declared here
     306 | static int vmx_setup_l1d_flush(void)
         |            ^
   1 error generated.


vim +313 arch/x86/kvm/vmx/vmx.c

   305	
   306	static int vmx_setup_l1d_flush(void)
   307	{
   308		/*
   309		 * Hand the parameter mitigation value in which was stored in the pre
   310		 * module init parser. If no parameter was given, it will contain
   311		 * 'auto' which will be turned into the default 'cond' mitigation mode.
   312		 */
 > 313		return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
