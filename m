Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE00620;
	Mon, 20 Feb 2023 00:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676851672; x=1708387672;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xu87kmBSidvNio1/U2PN9UZaTTlWEnexg92KCHw/S70=;
  b=BN3j5IronZLzWfSEu3zsl2RwdHXE4vW159S476PnqJaOZ6MgWy5Tsi3D
   HaEQL30h7zvVePlZEVwXXawECWVDm2qUzpZxQU0KIZjQFUL8AsHBkIYS1
   55VUyqCzOXXo4rJTeVxciafPT8f7ZD34F34BFrqed6TrfNkkIkZHkYcwg
   OFbD+Pwb12tcYtu7rjiRYIPCmuPTZt/4dvZ0sbI1u/w2ATq921LfVi0E7
   pVp/iVZ9k6Sr5ZvssPS5qOipUZ5gVMvnVvrjIQNmjlHTuRHlqPTaEj9/F
   cS0ei8IYOUw64hovgIxzogj4wCO+1AH7V/7q/AGjFuSCTgjD+Fs3tnrGX
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="312661909"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="312661909"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 16:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="916675005"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="916675005"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 19 Feb 2023 16:07:51 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTtig-000DVV-1o;
	Mon, 20 Feb 2023 00:07:50 +0000
Date: Mon, 20 Feb 2023 08:06:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 444/9999] arch/x86/kernel/head_64.o: warning:
 objtool: .text+0x5: unreachable instruction
Message-ID: <202302200756.iYkQzUJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Juergen Gross <jgross@suse.com>
CC: Miroslav Benes <mbenes@suse.cz>
CC: Sasha Levin <sashal@kernel.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   707c48210a5384a72c82655a37895b7e822755f2
commit: b36ab509e1817e60f73ce297494f0de1b7ed2c08 [444/9999] x86/xen: Mark cpu_bringup_and_idle() as dead_end_function
config: x86_64-randconfig-a014-20230220 (https://download.01.org/0day-ci/archive/20230220/202302200756.iYkQzUJU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b36ab509e1817e60f73ce297494f0de1b7ed2c08
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout b36ab509e1817e60f73ce297494f0de1b7ed2c08
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200756.iYkQzUJU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: .text+0x5: unreachable instruction


objdump-func vmlinux.o .text:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
