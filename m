Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1D86AA9
	for <llvm@lists.linux.dev>; Tue, 16 Aug 2022 22:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660687704; x=1692223704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rgDFuZeQwMuGSnBvzmdq3JP1KTVaVWKnFt+ZWxja3wk=;
  b=FwrD9Hoz/MQN0uGkhltK0C0A2ZVeWW8OrTkWzxJm+ePK56zno1AJUfae
   oQ91SNUNTX/xHAVGcBlNm+rbGEZ7YwFLW3koC7oQnOYGbCI5W4S4dQQwX
   X9sNl2f/jDefWm90oK3Ha7Z3xJP0kPfjE+r8aE5IEesPqE0CiynjiPSa/
   5oToF6etpWgy16VYpyaHnvu9AjzQKb5Yxs6k++GToIlbEb3KM0mkJ4n+g
   PCp3EVF6GXNaisrGk/nO+HQzgeVIdkGIKsAAEtpvaORr2P1H9ULckY/ns
   iZaoaS8YnvfroZR36WvxeFA7CUqZ6SENOc4BwH2z8NyyWU7Qq3ffljhZ6
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="356339155"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="356339155"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2022 15:08:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; 
   d="scan'208";a="640205516"
Received: from lkp-server02.sh.intel.com (HELO 81d7e1ade3ba) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Aug 2022 15:08:02 -0700
Received: from kbuild by 81d7e1ade3ba with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oO4jC-0000Gi-0d;
	Tue, 16 Aug 2022 22:08:02 +0000
Date: Wed, 17 Aug 2022 06:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 49/308]
 ./usr/include/asm/kvm.h:606:22: warning: field 'cpuid' with variable sized
 type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU
 extension
Message-ID: <202208170516.hBUfXo8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   85c097fdd1667a842a9e75d8f658fc16bd72981a
commit: b20b2fef887cd148f6997b362c235f72ee971052 [49/308] KVM: TDX: initialize VM with TDX specific parameters
config: x86_64-randconfig-a011-20220815 (https://download.01.org/0day-ci/archive/20220817/202208170516.hBUfXo8O-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project aed5e3bea138ce581d682158eb61c27b3cfdd6ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/b20b2fef887cd148f6997b362c235f72ee971052
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b20b2fef887cd148f6997b362c235f72ee971052
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/asm/kvm.h:606:22: warning: field 'cpuid' with variable sized type 'struct kvm_cpuid2' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
                           struct kvm_cpuid2 cpuid;
                                             ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
