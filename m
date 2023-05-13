Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84188161;
	Sat, 13 May 2023 00:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683936962; x=1715472962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrtvZfNtRUz5IWIuMQT2KugyM9OGJEgYw9OJHcROnYo=;
  b=J3o8/AY9bowlRTT6arSpGPCNEprIJQU3jIMgLJ23V52uAZxEpxiqCEOX
   f6UT9ghoWyI3NYCjH3K2PuGVOVKREQKhry0NTIfSVAC3v8UencNOegAfV
   Zei5s4flssAXnrOHvUh4isTWnruJH2Vl+4i2bGTFtrHG17sXD6W18cVYF
   Xdxs1KbF39BhS4q+IUzI1ThPDYqMqPbb7VNpHyiAWj3KeamegXO4tBAL8
   7LxTl8/6n5PJnNVI2IHR/jQks9FfbrQi0NLrFmT8rr+cGoM+6vM0EZpeG
   3MwuVWSfBKRDTxAybAj/tWFB7l3ihhM46/uyz3dnGqFi17lGfVKkrlfgq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="437245077"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="437245077"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 17:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="874565846"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="874565846"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 May 2023 17:16:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxcvX-0005Bo-0g;
	Sat, 13 May 2023 00:15:59 +0000
Date: Sat, 13 May 2023 08:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:efi-remove-mixed-mode 22/30]
 arch/x86/platform/efi/efi.c:883:7: warning: no previous prototype for
 function 'efi_systab_show_arch'
Message-ID: <202305130819.dsSs8CnE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-remove-mixed-mode
head:   cd57f70012e67876ab331fb83fd05670727e44d1
commit: 7273d530e9395955b89a59ed682253dacbce7b7a [22/30] x86: efi: Drop UGA support
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230513/202305130819.dsSs8CnE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=7273d530e9395955b89a59ed682253dacbce7b7a
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-remove-mixed-mode
        git checkout 7273d530e9395955b89a59ed682253dacbce7b7a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/platform/efi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130819.dsSs8CnE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/platform/efi/efi.c:883:7: warning: no previous prototype for function 'efi_systab_show_arch' [-Wmissing-prototypes]
   char *efi_systab_show_arch(char *str)
         ^
   arch/x86/platform/efi/efi.c:883:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char *efi_systab_show_arch(char *str)
   ^
   static 
   arch/x86/platform/efi/efi.c:905:9: warning: no previous prototype for function 'efi_attr_is_visible' [-Wmissing-prototypes]
   umode_t efi_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
           ^
   arch/x86/platform/efi/efi.c:905:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   umode_t efi_attr_is_visible(struct kobject *kobj, struct attribute *attr, int n)
   ^
   static 
   2 warnings generated.


vim +/efi_systab_show_arch +883 arch/x86/platform/efi/efi.c

fd506e0cf9fd43 Ard Biesheuvel 2020-01-19  882  
fd506e0cf9fd43 Ard Biesheuvel 2020-01-19 @883  char *efi_systab_show_arch(char *str)
fd506e0cf9fd43 Ard Biesheuvel 2020-01-19  884  {
fd506e0cf9fd43 Ard Biesheuvel 2020-01-19  885  	return str;
fd506e0cf9fd43 Ard Biesheuvel 2020-01-19  886  }
9cd437ac0ef4f3 Ard Biesheuvel 2020-01-20  887  

:::::: The code at line 883 was first introduced by commit
:::::: fd506e0cf9fd4306aa0eb57cbff5f00514da8179 efi: Move UGA and PROP table handling to x86 code

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
