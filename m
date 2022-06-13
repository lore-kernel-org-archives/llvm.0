Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A961396
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 14:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655131792; x=1686667792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KtPUKYDbJWerz/NmuDvWPFgzxMHwxXup5EBi0GMyYVU=;
  b=XSwq9E29jb5oHk/C12uBN703i+CxIwmy0WR+HmLp1ojOpHd2o6WRb7cR
   MC+uxwqhHAYkWun8rFvudL75MFeXk0RV3+9Xrndmq96n8mEs7cLexwiVa
   XaLFcY0OT1gwdgZEpkXklpMXo11Do4LIL6yaFsAIQ1LygLQ3/PjThqNgY
   y5me05FMbVubdqBDdBz6zROVDWDckoNSF3EqM/KnFknIl7f+1VZZZddk4
   okDtbx+99GyDp1BoDOP4DBCl6lkfLk2RCHf4fclRvhJWhdACwTai0WhwR
   +P75ZzePQqkgXj7MqOip5oxpiBn7j1M/YXKbRjX8iatLGxv3ymzE6kDVN
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="279351640"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="279351640"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 07:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="535129917"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Jun 2022 07:49:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0lO1-000Kst-3h;
	Mon, 13 Jun 2022 14:49:49 +0000
Date: Mon, 13 Jun 2022 22:49:20 +0800
From: kernel test robot <lkp@intel.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [kvm:queue 5/184] arch/x86/kvm/svm/avic.c:913:6: warning: shift
 count >= width of type
Message-ID: <202206132237.17DFkdFl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
head:   8baacf67c76c560fed954ac972b63e6e59a6fba0
commit: 3743c2f0251743b8ae968329708bbbeefff244cf [5/184] KVM: x86: inhibit APICv/AVIC on changes to APIC ID or APIC base
config: i386-buildonly-randconfig-r002-20220613 (https://download.01.org/0day-ci/archive/20220613/202206132237.17DFkdFl-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/virt/kvm/kvm.git/commit/?id=3743c2f0251743b8ae968329708bbbeefff244cf
        git remote add kvm https://git.kernel.org/pub/scm/virt/kvm/kvm.git
        git fetch --no-tags kvm queue
        git checkout 3743c2f0251743b8ae968329708bbbeefff244cf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kvm/ drivers/gpu/drm/amd/display/amdgpu_dm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/avic.c:913:6: warning: shift count >= width of type [-Wshift-count-overflow]
                             BIT(APICV_INHIBIT_REASON_SEV      |
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/vdso/bits.h:7:26: note: expanded from macro 'BIT'
   #define BIT(nr)                 (UL(1) << (nr))
                                          ^  ~~~~
   1 warning generated.


vim +913 arch/x86/kvm/svm/avic.c

   902	
   903	bool avic_check_apicv_inhibit_reasons(enum kvm_apicv_inhibit reason)
   904	{
   905		ulong supported = BIT(APICV_INHIBIT_REASON_DISABLE) |
   906				  BIT(APICV_INHIBIT_REASON_ABSENT) |
   907				  BIT(APICV_INHIBIT_REASON_HYPERV) |
   908				  BIT(APICV_INHIBIT_REASON_NESTED) |
   909				  BIT(APICV_INHIBIT_REASON_IRQWIN) |
   910				  BIT(APICV_INHIBIT_REASON_PIT_REINJ) |
   911				  BIT(APICV_INHIBIT_REASON_X2APIC) |
   912				  BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |
 > 913				  BIT(APICV_INHIBIT_REASON_SEV      |
   914				  BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED) |
   915				  BIT(APICV_INHIBIT_REASON_APIC_BASE_MODIFIED));
   916	
   917		return supported & BIT(reason);
   918	}
   919	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
