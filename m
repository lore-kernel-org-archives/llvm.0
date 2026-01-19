Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632432F9D98;
	Mon, 19 Jan 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768858583; cv=none; b=kpNZhs7NRBOopsaKn92+a7P8k70OHmQS/kPzzz3Iq0y3z7c9WcsDavj3djcLAUYulAf4amBUujQAYckABbaglGIDyReMt1sgZuTUre2e0B+fbzTnMgKDG3JP1F85OQEBlPOVnDz0PLXeJowbsb/yNTEUJNUeBBkUi/g1qR6jXOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768858583; c=relaxed/simple;
	bh=S69053zsak1P+OIMtzj+DlKHfixButumiqXBgHvfCPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VgZWDpj+K/UYiXby+3fJitKDcKF6Opxqh3m/NGqcL+8w6fMVTKKoaRan91iWBVS3OVQkRoPYQ/UW9paPPaSG5g8QPIyd7t2eGrwV4JYnRd8qY2PZFiVXAI1m474bPWJcQzfKATs15pilg8pZsmFyuTjUkrZLRRADxXyEW6ttyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oux4s4eI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oux4s4eI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768858582; x=1800394582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=S69053zsak1P+OIMtzj+DlKHfixButumiqXBgHvfCPc=;
  b=Oux4s4eI6qZNscBEoPTVQh03CLhRHVFsuALosQNPV2l0u5Tpzxwo3AEE
   w0PN/SzTWRymjfIcn0ttQQx1y3oZEupsu7kMYMJ3pgH/eZlrfEM/mb/Xz
   YZ3dLfKl8yvi7vtv4q3NcEjpND/b2J/8hXbefjmaQhXyEVQ6HKyKHNar4
   S4fbGNqX/fAvRDbc3y+ku1ajt21LB27Zvacu1lRrd2SUa31d5ifXnRrL+
   NTvk1xvf22w8zEpow9/N36rbfC/gL0cFJxKNIVXuxKVSUxFJH2nLQPreY
   a7D3W6SvFNeF3MOjs9jSb6opk4U/mneb5Ysa75lv2OjbYaY/DQGWMimJX
   w==;
X-CSE-ConnectionGUID: jMklXvi+Rqydp7MEUQnAsQ==
X-CSE-MsgGUID: CDsAptEJRiK2O5xZ0gfWwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73925431"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="73925431"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 13:36:21 -0800
X-CSE-ConnectionGUID: VUY++yKKRLK+o5q5BOsoQQ==
X-CSE-MsgGUID: TN9LgT8zTzewUbXVCru1mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="228885257"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jan 2026 13:36:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhwv1-00000000OK5-04mS;
	Mon, 19 Jan 2026 21:36:15 +0000
Date: Tue, 20 Jan 2026 05:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: Salman Nabi <salman.nabi@arm.com>, vvidwans@nvidia.com,
	andre.przywara@arm.com, sudeep.holla@arm.com, mark.rutland@arm.com,
	lpieralisi@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ardb@kernel.org,
	chao.gao@intel.com, linux-arm-kernel@lists.infradead.org,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	sdonthineni@nvidia.com, vsethi@nvidia.com, vwadekar@nvidia.com
Subject: Re: [PATCH 1/1] firmware: smccc: add support for Live Firmware
 Activation (LFA)
Message-ID: <202601200543.EKFOBfnW-lkp@intel.com>
References: <20260119122729.287522-2-salman.nabi@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119122729.287522-2-salman.nabi@arm.com>

Hi Salman,

kernel test robot noticed the following build errors:

[auto build test ERROR on soc/for-next]
[also build test ERROR on linus/master v6.19-rc6 next-20260116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Salman-Nabi/firmware-smccc-add-support-for-Live-Firmware-Activation-LFA/20260119-203221
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260119122729.287522-2-salman.nabi%40arm.com
patch subject: [PATCH 1/1] firmware: smccc: add support for Live Firmware Activation (LFA)
config: arm-defconfig (https://download.01.org/0day-ci/archive/20260120/202601200543.EKFOBfnW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601200543.EKFOBfnW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601200543.EKFOBfnW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/lfa_fw.c:179:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:179:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     179 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
>> drivers/firmware/smccc/lfa_fw.c:184:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     184 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:194:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:194:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     194 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:198:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     198 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:220:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:220:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     220 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:234:3: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     234 |                 arm_smccc_1_2_invoke(&reg, &reg);
         |                 ^
   drivers/firmware/smccc/lfa_fw.c:290:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:290:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     290 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:318:3: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     318 |                 arm_smccc_1_2_invoke(&reg, &reg);
         |                 ^
   drivers/firmware/smccc/lfa_fw.c:360:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:360:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     360 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:368:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     368 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:434:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:434:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     434 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:443:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     443 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   drivers/firmware/smccc/lfa_fw.c:586:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:586:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     586 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:600:3: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     600 |                 arm_smccc_1_2_invoke(&reg, &reg);
         |                 ^
   drivers/firmware/smccc/lfa_fw.c:619:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                                   ^
   drivers/firmware/smccc/lfa_fw.c:619:9: note: forward declaration of 'struct arm_smccc_1_2_regs'
     619 |         struct arm_smccc_1_2_regs reg = { 0 };
         |                ^
   drivers/firmware/smccc/lfa_fw.c:623:2: error: call to undeclared function 'arm_smccc_1_2_invoke'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     623 |         arm_smccc_1_2_invoke(&reg, &reg);
         |         ^
   16 errors generated.


vim +179 drivers/firmware/smccc/lfa_fw.c

   176	
   177	static unsigned long get_nr_lfa_components(void)
   178	{
 > 179		struct arm_smccc_1_2_regs reg = { 0 };
   180	
   181		reg.a0 = LFA_1_0_FN_GET_INFO;
   182		reg.a1 = 0; /* lfa_info_selector = 0 */
   183	
 > 184		arm_smccc_1_2_invoke(&reg, &reg);
   185		if (reg.a0 != LFA_SUCCESS)
   186			return reg.a0;
   187	
   188		return reg.a1;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
