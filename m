Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051203D60;
	Wed, 16 Aug 2023 22:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692223696; x=1723759696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7+xUnXot7equjRl1BWcGk5qefq+B2BW+5vOO+WxRmRQ=;
  b=R3lOk7j3eYR8ziI6NiXjgjr9FLDE8L5c6KKbOoHkD3WbkJamXrHL4jkp
   kKBy8wsCLIrSzmKJTfhFsBxcfzpWOXAJY1lz3hzzoA5hwoUAlHZfdSQc6
   0rPhQSfjafbWxKycLwqgVeGlYMP+REuTAn/ynWB+dkudzg4M+BXB1qnUr
   QXlSveENm6LQHvl3K0H22MgcweZXETnB9sqaeTfqMhE4QkhkYZ5H1a5Pz
   3qop2UHj60lTvmCVexL4nO+S39o64y6fnn3wHGUdLTtq0WpY9rwhcY5zJ
   98JZp7A+a1oBQTOnsf8K3J6SZyvkyaoPCnnx5nDL+svP6fQAT6W5Hl2YE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="439005370"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="439005370"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 15:08:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857968264"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="857968264"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 15:08:13 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWOgW-0000bb-1K;
	Wed, 16 Aug 2023 22:08:12 +0000
Date: Thu, 17 Aug 2023 06:07:15 +0800
From: kernel test robot <lkp@intel.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [stable:linux-5.15.y 55/9999] ld.lld: warning: <unknown>:0:0: stack
 frame size (1036) exceeds limit (1024) in function 'kvm_hv_hypercall'
Message-ID: <202308170601.rhxOQlKs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f
commit: cb188e07105f2216f5efbefac95df4b6ce266906 [55/9999] KVM: x86: hyper-v: HVCALL_SEND_IPI_EX is an XMM fast hypercall
config: i386-buildonly-randconfig-r005-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170601.rhxOQlKs-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170601.rhxOQlKs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170601.rhxOQlKs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: <unknown>:0:0: stack frame size (1036) exceeds limit (1024) in function 'kvm_hv_hypercall'
   40/1036 (3.86%) spills, 996/1036 (96.14%) variables

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
