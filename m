Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3A21B21BA;
	Wed,  4 Dec 2024 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733311390; cv=none; b=n6uxJS5sP9aclPlsuZvWW9BYIA6qXRZQzeLW9gLW2y9YWDoF0mAYH2CpVpDazNn7H52uhZUnD4xOwjofFXvL5bNgjRDw2p1KL772kv/UUSEAjheJaYaEDoXZY5UKsjAi2TOkxKZL05ChahmljDoUUJwYGQNx/z23QZlpYPdeGKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733311390; c=relaxed/simple;
	bh=1UrW0T5gTeFR5ZqJIagqMlnLwC4w48IaQA0fvyV/TAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h2jrPqT6foQissgxKTonxkFN3l2NKnaiozZTxwOfxU3uJGCcbdD/4Eqa119F5VpyZlb92QVODwFdrEFHK28yR32dGc+zGQTAOL90e0SoFrpM3+VnnIChnGKr/biTVrvb1LEvWNCONBEq/rlnfV2AcHSApIQGhXVvawP8xZN7sQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtVoGyVz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtVoGyVz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733311388; x=1764847388;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1UrW0T5gTeFR5ZqJIagqMlnLwC4w48IaQA0fvyV/TAk=;
  b=BtVoGyVzIpPLC9E6sRz01ZMN75Xx0qmCuXmRkRMydZIxESbC2LxFlzmk
   zazSMJEBSFPqgEVxL7e45KwA7PG2VW7aU1JgqeTx6VMebWfHHpyW1I+Mr
   iJtx9+NePAbgxF/L5BiImfzmV1zwGaQ41KnBHS/VsJ5REstcA5HIEMCcz
   D3G/wPZXhzY5Tt/LAuQJbG9tFCfALeEPPiz79m0yZgsO7yLkIwABf7JCE
   T5bm71G7L+LHzNI0olJ9uYBSZ5JMUVp+75AundFILoSlgq8k0a2l8eEah
   jYJwY6Robk7QyrLYIC5/SZYFCoHzNSNhed59XNQ1iZTO1K48D6eH6+g+N
   A==;
X-CSE-ConnectionGUID: 35Hc3ZYmQk6+6OrJhHDbsQ==
X-CSE-MsgGUID: USyzlA8HRnKzwBbkc8jq7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="51104511"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="51104511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 03:23:06 -0800
X-CSE-ConnectionGUID: Bw0VxzZDTAWBEAGeAPt7Jg==
X-CSE-MsgGUID: u8JqkpE1QnyTeWMV2ZXw7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="98726048"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2024 03:23:03 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tInTA-0002wW-1q;
	Wed, 04 Dec 2024 11:23:00 +0000
Date: Wed, 4 Dec 2024 19:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
Message-ID: <202412041929.8aCqrGnO-lkp@intel.com>
References: <20241203163158.580-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203163158.580-2-ansuelsmth@gmail.com>

Hi Christian,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge robh/for-next linus/master v6.13-rc1 next-20241203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Marangi/cpufreq-airoha-Add-EN7581-CPUFreq-SMCCC-driver/20241204-113105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20241203163158.580-2-ansuelsmth%40gmail.com
patch subject: [PATCH v5 2/2] cpufreq: airoha: Add EN7581 CPUFreq SMCCC driver
config: arm-randconfig-003 (https://download.01.org/0day-ci/archive/20241204/202412041929.8aCqrGnO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041929.8aCqrGnO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041929.8aCqrGnO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cpufreq/airoha-cpufreq.c:41:34: error: variable has incomplete type 'const struct arm_smccc_1_2_regs'
      41 |         const struct arm_smccc_1_2_regs args = {
         |                                         ^
   drivers/cpufreq/airoha-cpufreq.c:41:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
      41 |         const struct arm_smccc_1_2_regs args = {
         |                      ^
>> drivers/cpufreq/airoha-cpufreq.c:45:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
      45 |         struct arm_smccc_1_2_regs res;
         |                                   ^
   drivers/cpufreq/airoha-cpufreq.c:41:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
      41 |         const struct arm_smccc_1_2_regs args = {
         |                      ^
>> drivers/cpufreq/airoha-cpufreq.c:47:2: error: call to undeclared function 'arm_smccc_1_2_smc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      47 |         arm_smccc_1_2_smc(&args, &res);
         |         ^
   drivers/cpufreq/airoha-cpufreq.c:81:34: error: variable has incomplete type 'const struct arm_smccc_1_2_regs'
      81 |         const struct arm_smccc_1_2_regs args = {
         |                                         ^
   drivers/cpufreq/airoha-cpufreq.c:81:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
      81 |         const struct arm_smccc_1_2_regs args = {
         |                      ^
   drivers/cpufreq/airoha-cpufreq.c:86:28: error: variable has incomplete type 'struct arm_smccc_1_2_regs'
      86 |         struct arm_smccc_1_2_regs res;
         |                                   ^
   drivers/cpufreq/airoha-cpufreq.c:81:15: note: forward declaration of 'struct arm_smccc_1_2_regs'
      81 |         const struct arm_smccc_1_2_regs args = {
         |                      ^
   drivers/cpufreq/airoha-cpufreq.c:88:2: error: call to undeclared function 'arm_smccc_1_2_smc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      88 |         arm_smccc_1_2_smc(&args, &res);
         |         ^
   6 errors generated.


vim +41 drivers/cpufreq/airoha-cpufreq.c

    37	
    38	static unsigned long airoha_cpufreq_clk_get(struct clk_hw *hw,
    39						    unsigned long parent_rate)
    40	{
  > 41		const struct arm_smccc_1_2_regs args = {
    42			.a0 = AIROHA_SIP_AVS_HANDLE,
    43			.a1 = AIROHA_AVS_OP_GET_FREQ,
    44		};
  > 45		struct arm_smccc_1_2_regs res;
    46	
  > 47		arm_smccc_1_2_smc(&args, &res);
    48	
    49		/* SMCCC returns freq in MHz */
    50		return (int)(res.a0 * 1000 * 1000);
    51	}
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
