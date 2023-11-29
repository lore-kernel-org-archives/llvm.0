Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF6363D6;
	Wed, 29 Nov 2023 04:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1X60VxB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701231287; x=1732767287;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fl/5cn9hNngOc4n73NbZ2cM/kbvfGFgm6/ehls/rwts=;
  b=a1X60VxB8xpTQ9WFWW4uFXObfjOFYzorT3I/qV4qAI55AwNSCiInwG1/
   TJmvof2JlscW+nXgcgfhplDn/pXL5wJsfgdV0ZxrAQlNNrqIoiaMn/gGe
   7YDwlLVTBcsco3u4JQ12kOjuxiYqtPcE5pQukgK6mFDY6EY5aICO0LglI
   NZIPItsbvtJYfgXwh1gknT9FzYNdJKcleFa4zC/a00JmWb3pFeHJ6vhSE
   o9Dl5sGLSSbSNUfgubquQUoV7DB59JFSSWJ20D5cDdoTqiMysTkDD7f4B
   oXeZWt4fqrWHuD0hfRSAdA+uqaIbIekSDpCPpf0l2bwmp9ETqXFuuelZ/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="383483249"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="383483249"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 20:14:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="892314392"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="892314392"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Nov 2023 20:14:42 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8ByC-0008Xq-2L;
	Wed, 29 Nov 2023 04:14:40 +0000
Date: Wed, 29 Nov 2023 12:08:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nikunj A Dadhania <nikunj@amd.com>, linux-kernel@vger.kernel.org,
	thomas.lendacky@amd.com, x86@kernel.org, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, bp@alien8.de,
	mingo@redhat.com, tglx@linutronix.de, dave.hansen@linux.intel.com,
	dionnaglaze@google.com, pgonda@google.com, seanjc@google.com,
	pbonzini@redhat.com, nikunj@amd.com
Subject: Re: [PATCH v6 10/16] x86/sev: Add Secure TSC support for SNP guests
Message-ID: <202311291150.VUYNaQGy-lkp@intel.com>
References: <20231128125959.1810039-11-nikunj@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128125959.1810039-11-nikunj@amd.com>

Hi Nikunj,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/mm]
[also build test WARNING on linus/master v6.7-rc3 next-20231128]
[cannot apply to tip/x86/core kvm/queue kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nikunj-A-Dadhania/virt-sev-guest-Move-mutex-to-SNP-guest-device-structure/20231128-220026
base:   tip/x86/mm
patch link:    https://lore.kernel.org/r/20231128125959.1810039-11-nikunj%40amd.com
patch subject: [PATCH v6 10/16] x86/sev: Add Secure TSC support for SNP guests
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231129/202311291150.VUYNaQGy-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311291150.VUYNaQGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311291150.VUYNaQGy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/mm/mem_encrypt_amd.c:216:13: warning: no previous prototype for function 'amd_enc_init' [-Wmissing-prototypes]
   void __init amd_enc_init(void)
               ^
   arch/x86/mm/mem_encrypt_amd.c:216:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init amd_enc_init(void)
   ^
   static 
   1 warning generated.


vim +/amd_enc_init +216 arch/x86/mm/mem_encrypt_amd.c

   215	
 > 216	void __init amd_enc_init(void)
   217	{
   218		snp_secure_tsc_prepare();
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
