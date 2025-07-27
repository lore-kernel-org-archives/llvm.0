Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C14B33E7;
	Sun, 27 Jul 2025 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753628448; cv=none; b=Ef9V/mxummtTDTd8aotdY1Y+G5dVaG9n3qKZGzFw8foCUHiY68TJQ6WoGnA9+VJPtWPwutDqe3k6VRFHOFE4eWHi8Zt2AYkE/NGhw9orVnJnIIJymr8PTAUPlL7p2O+yQlCA5FLqDurZbrH0JUC+M1wWB95hLO4Utv3V+H6pE9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753628448; c=relaxed/simple;
	bh=lCdVGCM3A4g9UKpDhfCJb3xc2Ua2vXh2iJqFW7Srnzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXHbKOAcOmDZtmZ/OtK3qb4X6vLgo+B5BhC5vO1YQw3cHojnv+c4ZwKrImZp1HRXWhml2ii8NEp80rLwnlxWRfuDvekUSMmNZgveu3eqRr0ry7o/LLhc6qNoCpkQUoY9cz20Orok/ZawLskcjaiGqABdnLC8tNbn3FeAAcLVgQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O9T2NC4h; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O9T2NC4h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753628447; x=1785164447;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lCdVGCM3A4g9UKpDhfCJb3xc2Ua2vXh2iJqFW7Srnzs=;
  b=O9T2NC4hqOa21CjUbZ2RBo9T3gJlIH9FbrNi39ty3SWC7nzv80T64o3b
   KYjI6FtTN7flvE+BPoSNDBtA+TMZi+qCQQDdWKc+EjcykbskEyA0AbWM8
   +t0MOOJ+oUVvd++tgkTWqdySQ86GQyaLGoNCXx0DuREsaphkUWwglE/lN
   oCcYls9q4uUcUQ1ZPyqaM+mYctpQNAM7oc3D75q6s/Y5N+/dOrVWQdN0t
   g7pQHOYlQcGhb+05dakvhL5BPwaIPc58Nag2Q9c5rj66IApupPDaKFdK7
   +DxboThFamAaO+SQWxeduv6LVrjE6ZsTPd2v1psu5eZ1zRl05iDWiPByV
   w==;
X-CSE-ConnectionGUID: Vzoo+jJfRKC5MZXM0kYXyQ==
X-CSE-MsgGUID: 1XVH66liSdK4ejwpGJWqDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55857625"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55857625"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 08:00:45 -0700
X-CSE-ConnectionGUID: 8chhQj0pQeSpykHR40O8YA==
X-CSE-MsgGUID: V5rx8A3BRn6c2r1A2842Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162256959"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Jul 2025 08:00:45 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ug2ri-000MfL-1D;
	Sun, 27 Jul 2025 15:00:42 +0000
Date: Sun, 27 Jul 2025 23:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V4 2/4] drivers/hv: Allow vmbus message synic
 interrupt injected from Hyper-V
Message-ID: <202507272216.AfSHsOMV-lkp@intel.com>
References: <20250726134250.4414-3-ltykernel@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250726134250.4414-3-ltykernel@gmail.com>

Hi Tianyu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on tip/master linus/master v6.16-rc7 next-20250725]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianyu-Lan/x86-hyperv-Don-t-use-hv-apic-driver-when-Secure-AVIC-is-available/20250726-214638
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250726134250.4414-3-ltykernel%40gmail.com
patch subject: [RFC PATCH V4 2/4] drivers/hv: Allow vmbus message synic interrupt injected from Hyper-V
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250727/202507272216.AfSHsOMV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507272216.AfSHsOMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507272216.AfSHsOMV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/hyperv/hv_apic.c:58:2: error: call to undeclared function 'apic_update_vector'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      58 |         apic_update_vector(cpu, vector, set);
         |         ^
   arch/x86/hyperv/hv_apic.c:301:22: error: use of undeclared identifier 'CC_ATTR_SNP_SECURE_AVIC'
     301 |         if (cc_platform_has(CC_ATTR_SNP_SECURE_AVIC))
         |                             ^
   2 errors generated.


vim +/apic_update_vector +58 arch/x86/hyperv/hv_apic.c

    55	
    56	void hv_enable_coco_interrupt(unsigned int cpu, unsigned int vector, bool set)
    57	{
  > 58		apic_update_vector(cpu, vector, set);
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
