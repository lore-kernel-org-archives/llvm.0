Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1248D17E8;
	Sat, 29 Apr 2023 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682772245; x=1714308245;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GV4/t10ny8sd+70Wcf+vL8XcPklcbHBITpudLRvW24Y=;
  b=mU0n/ViOKsCFixv/KFojDKHenJrMR6zKXGJgqEfsN+PVkfCORgyDrlTE
   joZH1SH50ONIH2KYE6RkSD9e+SWrUGA06AQHW/piD0u1umVqepw+Kgf2d
   inJnL9LOPmj1Q7/vN04wFUr/a+XoOCqX+eLiH48i/sJ+1nH9p7wFVD/F6
   fK+SqZVt9aSiRc1qyL3EOpRcHgpw7Ixz16Dvv/DhsGuqOqD3EZ0tOh0ow
   gSfCuazQkZYjYrrlm46+69XcT5eKGT2EIwnaa0otGTjNHeoUwBye9Wgqc
   2F9M6iuVESF56JJrWawWjhdcYE+omFm1NAnQJi0OxW+D2jkFidod/aiEO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="434233109"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="434233109"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2023 05:44:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10695"; a="941475466"
X-IronPort-AV: E=Sophos;i="5.99,237,1677571200"; 
   d="scan'208";a="941475466"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 29 Apr 2023 05:44:03 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psjvm-00019B-2c;
	Sat, 29 Apr 2023 12:44:02 +0000
Date: Sat, 29 Apr 2023 20:44:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.4.y 5560/8186] arch/x86/kvm/vmx/vmenter.o: warning:
 objtool: __vmx_vcpu_run()+0xb5: unsupported intra-function call
Message-ID: <202304292039.VXRCydpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: "Peter Zijlstra (Intel)" <peterz@infradead.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
CC: Ben Hutchings <bwh@kernel.org>

Hi Josh,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   ea7862c507eca54ea6caad9dcfc8bba5e749fbde
commit: 5895a9297e609363ba4003c9d5839c967b237389 [5560/8186] KVM: VMX: Flatten __vmx_vcpu_run()
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230429/202304292039.VXRCydpD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=5895a9297e609363ba4003c9d5839c967b237389
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 5895a9297e609363ba4003c9d5839c967b237389
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304292039.VXRCydpD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmenter.o: warning: objtool: __vmx_vcpu_run()+0xb5: unsupported intra-function call
   arch/x86/kvm/vmx/vmenter.o: warning: objtool: If this is a retpoline, please patch it in with alternatives and annotate it with ANNOTATE_NOSPEC_ALTERNATIVE.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
