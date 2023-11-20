Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0600213FF0;
	Mon, 20 Nov 2023 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZpi3e/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700480790; x=1732016790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mSSL4GaWMe0EdPcsuBjX9JQuHPMGV9Ad6Vh9LbMpVxs=;
  b=IZpi3e/sVhzCgXlp4qDltoKujajEk6vxmsxI8ofZdaezTrGFlGcW9PvY
   0Xc0E44lq84GLeHX3CnOsbmCF4xBUhErLCO8BRJ8RLqwp1VpPWUGYVNSS
   76kldCFe266Vqlj931udCpDg/Ua8/S0Die/l6dc8TXWf4rzU/443rlpzG
   6wixazMQo1O6EhMREkcDQDOW6bh7r28yII7YyIZbKQpDzk6etfgqR8P5K
   OtYcrW0d7aRZ/oZ9BU55TkCjJgSCALTBC+M6raM6nWjnuApp/mNOOZvX9
   SJQ/+uhytVch809ZtGUJCeu9UsCtGtx8yTTcWzjPR9DmGmch44uR2v6D2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376637180"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="376637180"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 03:46:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="856967558"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="856967558"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2023 03:46:17 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r52jH-0006Pd-1s;
	Mon, 20 Nov 2023 11:46:15 +0000
Date: Mon, 20 Nov 2023 19:45:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-next 48/273] arch/x86/kvm/vmx/tdx.c:62:31:
 warning: operator '?:' has lower precedence than '|'; '|' will be evaluated
 first
Message-ID: <202311201906.rJwYHtwX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   90fec84219b5d2bf13e61f02777f6a44ab755bc4
commit: 363d0103dd41d764bc8e4673457923a438c27cf8 [48/273] KVM: TDX: x86: Add ioctl to get TDX systemwide parameters
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231120/202311201906.rJwYHtwX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201906.rJwYHtwX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201906.rJwYHtwX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx.c:62:31: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
                    cpu_has_vmx_ept_5levels()) ? TDX_CAP_GPAW_52 : 0,
                    ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/vmx/tdx.c:62:31: note: place parentheses around the '|' expression to silence this warning
                    cpu_has_vmx_ept_5levels()) ? TDX_CAP_GPAW_52 : 0,
                    ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/vmx/tdx.c:62:31: note: place parentheses around the '?:' expression to evaluate it first
                    cpu_has_vmx_ept_5levels()) ? TDX_CAP_GPAW_52 : 0,
                                               ^
                                                                    )
   1 warning generated.


vim +62 arch/x86/kvm/vmx/tdx.c

    27	
    28	static int tdx_get_capabilities(struct kvm_tdx_cmd *cmd)
    29	{
    30		struct kvm_tdx_capabilities __user *user_caps;
    31		struct kvm_tdx_capabilities *caps = NULL;
    32		int ret = 0;
    33	
    34		BUILD_BUG_ON(sizeof(struct kvm_tdx_cpuid_config) !=
    35			     sizeof(struct tdx_cpuid_config));
    36	
    37		if (cmd->flags)
    38			return -EINVAL;
    39	
    40		caps = kmalloc(sizeof(*caps), GFP_KERNEL);
    41		if (!caps)
    42			return -ENOMEM;
    43	
    44		user_caps = (void __user *)cmd->data;
    45		if (copy_from_user(caps, user_caps, sizeof(*caps))) {
    46			ret = -EFAULT;
    47			goto out;
    48		}
    49	
    50		if (caps->nr_cpuid_configs < tdx_info->num_cpuid_config) {
    51			ret = -E2BIG;
    52			goto out;
    53		}
    54	
    55		*caps = (struct kvm_tdx_capabilities) {
    56			.attrs_fixed0 = tdx_info->attributes_fixed0,
    57			.attrs_fixed1 = tdx_info->attributes_fixed1,
    58			.xfam_fixed0 = tdx_info->xfam_fixed0,
    59			.xfam_fixed1 = tdx_info->xfam_fixed1,
    60			.supported_gpaw = TDX_CAP_GPAW_48 |
    61			(kvm_get_shadow_phys_bits() >= 52 &&
  > 62			 cpu_has_vmx_ept_5levels()) ? TDX_CAP_GPAW_52 : 0,
    63			.nr_cpuid_configs = tdx_info->num_cpuid_config,
    64			.padding = 0,
    65		};
    66	
    67		if (copy_to_user(user_caps, caps, sizeof(*caps))) {
    68			ret = -EFAULT;
    69			goto out;
    70		}
    71		if (copy_to_user(user_caps->cpuid_configs, &tdx_info->cpuid_configs,
    72				 tdx_info->num_cpuid_config *
    73				 sizeof(struct tdx_cpuid_config))) {
    74			ret = -EFAULT;
    75		}
    76	
    77	out:
    78		/* kfree() accepts NULL. */
    79		kfree(caps);
    80		return ret;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
