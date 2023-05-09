Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A3E8486;
	Tue,  9 May 2023 09:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683625674; x=1715161674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IHRsj8LD8ljQsDBW/0J35IWfgbz5sGGcSVl/dnK6wAE=;
  b=NTfzvpU9Nn7xNEAyKu1dOA/4Czi0LNcoUHY5ceErx+yYPI+xclxx/Jp5
   NzRLlByKJqKoQ5vrzmRk7PvuL+IZSPotNHGpuAX4vcDG25pM/Y4c3AIMe
   v8LRiFralVB10DSQtjkoeCbZROHb7EaKnfC0haIF+AqYXWBU4Gy/LuSQ5
   LD1nsomXdRkRvIkheK6gyGmSH/Jq9LkJ2DqoYJEEMia2SXWpVurSsYARJ
   2vM9zJN1wVS6DrzM2s28b2eA/TItqp6RL+eLzuyR9DjGfnawIyMhUwhZC
   iFYX7bIAmKto/nTBi9mCXGZuX8TgYQiQ8ZMo0jjQslpDBF75GyDxJqxJ6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="415445284"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="415445284"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 02:47:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="698835082"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="698835082"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 May 2023 02:47:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwJwl-00021c-1M;
	Tue, 09 May 2023 09:47:51 +0000
Date: Tue, 9 May 2023 17:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 2/4] kernel/sys.c:2391:12: warning: no
 previous prototype for function 'arch_prctl_mem_model_get'
Message-ID: <202305091701.H42t05eE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   38015ad2af19088e66e0c81f7efd5a8b51814026
commit: b5c6de40368b847e8c2968e260fb98ac1b7b10d2 [2/4] prctl: Introduce PR_{SET,GET}_MEM_MODEL
config: i386-randconfig-a001-20230508 (https://download.01.org/0day-ci/archive/20230509/202305091701.H42t05eE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/b5c6de40368b847e8c2968e260fb98ac1b7b10d2
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/220-tso
        git checkout b5c6de40368b847e8c2968e260fb98ac1b7b10d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091701.H42t05eE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sys.c:2391:12: warning: no previous prototype for function 'arch_prctl_mem_model_get' [-Wmissing-prototypes]
   int __weak arch_prctl_mem_model_get(struct task_struct *t)
              ^
   kernel/sys.c:2391:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_prctl_mem_model_get(struct task_struct *t)
   ^
   static 
>> kernel/sys.c:2396:12: warning: no previous prototype for function 'arch_prctl_mem_model_set' [-Wmissing-prototypes]
   int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
              ^
   kernel/sys.c:2396:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
   ^
   static 
   2 warnings generated.


vim +/arch_prctl_mem_model_get +2391 kernel/sys.c

  2390	
> 2391	int __weak arch_prctl_mem_model_get(struct task_struct *t)
  2392	{
  2393		return -EINVAL;
  2394	}
  2395	
> 2396	int __weak arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
  2397	{
  2398		return -EINVAL;
  2399	}
  2400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
