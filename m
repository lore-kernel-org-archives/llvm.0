Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AEB194
	for <llvm@lists.linux.dev>; Thu, 15 Sep 2022 01:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663205828; x=1694741828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jDTKpg/KkK9NVMBYwr6o57TIu3tKmvIJDE8YQ2YynRU=;
  b=DRIbRi3kQRMkogwSuqVH4NjyPPz6z997SwI8Y1PPvQAOVr9RzDEs4ozY
   RW0TUQglmkfx9ycfesq4RqTHpslYXUOotB4u/9tG1oBiHOBdrZapkwMYh
   bWILLvMU2I98/TAE/SIOuYlwaVLb32SriXVmBy/3F67BK46SZI7tFaMq+
   Ccz4kLePUB0ks1My3nJxHWL3opOgWEzgmQ3cKsFOi92unzu+Extkms9rK
   rsJRaYPpi4jqoqs5CC99kSPbA418mXQFGC+MCnWNAPBPz6lojC9Bd/Ebu
   HQWgWzbSXhjo1PgjwkhpchBE4C5SXCxWv2CoNkBVK3xofC7pIQIA4R7VY
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="278314058"
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="278314058"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2022 18:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,316,1654585200"; 
   d="scan'208";a="650288545"
Received: from lkp-server01.sh.intel.com (HELO d6e6b7c4e5a2) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 14 Sep 2022 18:37:06 -0700
Received: from kbuild by d6e6b7c4e5a2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oYdoP-0000lq-2V;
	Thu, 15 Sep 2022 01:37:05 +0000
Date: Thu, 15 Sep 2022 09:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 6296/7172] ERROR: modpost: "kvm_spurious_fault"
 [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <202209150959.hEWCNjXH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f117c01187301a087412bd6697fcf5463cb427d8
commit: 6676e2cdd7c339dc40331faccbaac1112d2c1d78 [6296/7172] kbuild: use obj-y instead extra-y for objects placed at the head
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20220915/202209150959.hEWCNjXH-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6676e2cdd7c339dc40331faccbaac1112d2c1d78
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6676e2cdd7c339dc40331faccbaac1112d2c1d78
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kvm_spurious_fault" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "___ratelimit" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "__warn_printk" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "kvm_find_user_return_msr" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "__ubsan_handle_out_of_bounds" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "smp_call_function_single" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "cpu_number" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "__per_cpu_offset" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "__phys_addr" [arch/x86/kvm/kvm-intel.ko] undefined!
WARNING: modpost: suppressed 34935 unresolved symbol warnings because there were too many)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
