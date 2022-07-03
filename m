Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F482CA5
	for <llvm@lists.linux.dev>; Sun,  3 Jul 2022 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656882379; x=1688418379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=anBN9wP3IvPVe/5N7vobhi0h3/vT8haEYFNKMAOdZtY=;
  b=NM3+BwlNBjsEAZlogS7PEdMLfI7gdLskBJv45ZGH8SJbD0Z5BYJsgmqE
   ii2a1FfR3USSPd73FbuNr44ZoD7QjA4w5tO3K6x65XynDN285WverWSWv
   TO4wHpD9IaMCvEoM7CpX/mXYUp7NvBkmugh4YLiB/2L3vtcvHNLOAdxX4
   BrSrVaUXJ1HJcMSsGdSl4IqmzUWlzklRApiFRTzEOFjo2QxvI+8BxjI1W
   kGMdrUvjeZpm6JnVaG5KPwS+OyBOzh9K7DB/pLd6TyUWb3gR9Ur4jb1JE
   fqamtaQd/HA3EIPI5dQ4FYNvxBIJTnAoEMDNc1tXysqboO7AXdtEvVTAV
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10397"; a="262777497"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="262777497"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2022 14:06:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; 
   d="scan'208";a="919098760"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2022 14:06:17 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o86nI-000Gxn-JM;
	Sun, 03 Jul 2022 21:06:16 +0000
Date: Mon, 4 Jul 2022 05:05:48 +0800
From: kernel test robot <lkp@intel.com>
To: Aaron Lewis <aaronlewis@google.com>, kvm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, pbonzini@redhat.com,
	jmattson@google.com, seanjc@google.com,
	Aaron Lewis <aaronlewis@google.com>
Subject: Re: [PATCH 3/3] KVM: x86: Don't deflect MSRs to userspace that can't
 be filtered
Message-ID: <202207040448.69LBG38o-lkp@intel.com>
References: <20220703191636.2159067-4-aaronlewis@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220703191636.2159067-4-aaronlewis@google.com>

Hi Aaron,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvm/queue]
[also build test WARNING on next-20220701]
[cannot apply to mst-vhost/linux-next linus/master v5.19-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Aaron-Lewis/MSR-Filtering-updates/20220704-031727
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220704/202207040448.69LBG38o-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5d787689b14574fe58ba9798563f4a6df6059fbf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0c12a0d47fb511592df45bf2030cc200b5bab5ef
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aaron-Lewis/MSR-Filtering-updates/20220704-031727
        git checkout 0c12a0d47fb511592df45bf2030cc200b5bab5ef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:1715:6: warning: no previous prototype for function 'kvm_msr_filtering_disallowed' [-Wmissing-prototypes]
   bool kvm_msr_filtering_disallowed(u32 index)
        ^
   arch/x86/kvm/x86.c:1715:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool kvm_msr_filtering_disallowed(u32 index)
   ^
   static 
   1 warning generated.


vim +/kvm_msr_filtering_disallowed +1715 arch/x86/kvm/x86.c

  1714	
> 1715	bool kvm_msr_filtering_disallowed(u32 index)
  1716	{
  1717		/* x2APIC MSRs do not support filtering. */
  1718		if (index >= 0x800 && index <= 0x8ff)
  1719			return true;
  1720	
  1721		return false;
  1722	}
  1723	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
