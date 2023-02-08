Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F033FF;
	Wed,  8 Feb 2023 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675872613; x=1707408613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IqRFmG/tE88LZNICwrizQVUfzUCcslDbxcwFXRlTgBI=;
  b=Zr/0pbKtU37d/ThGqC7nJMptN8q6TWYMN2vYYqEGdaF45bibAWlKc5fC
   l4UM4q0mY0kodWoUUp2xqW2pZ4o+32XO3oyCS+MA0lmNLr3Vygny6TYyo
   dgXNu5hzKwzmYGsLMK6U/R32NG/MoO1+b62e/5mqcjFPthPDyKqACbUBG
   XIExX7vy/TksrED6zGNnvRvpzXRdwxxl+oZoAVPr/PCsDoXKZgfFKKf1g
   D50VWMSBk9vRJ/qZsGUk2kvdUBh85EiGidLD0bxxK+7/3FI3ZroS47z55
   mRrfWqtgn/+NxIEPkP70ky8vgqxFxqkTgZRPXghS8cPLBBunfPVLoLzmp
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="416063532"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="416063532"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 08:09:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="644909391"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="644909391"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Feb 2023 08:09:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPn0N-0004Wd-1q;
	Wed, 08 Feb 2023 16:09:07 +0000
Date: Thu, 9 Feb 2023 00:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 29/31]
 kernel/sys.c:1288:1: warning: stack frame size (1040) exceeds limit (1024)
 in '__se_sys_newuname'
Message-ID: <202302090016.DRnD1KVw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   e6fc25ec2770c9db62486fb1f291b99531f86533
commit: 0facdc348172563db9b913d75c9aab1bf68550f8 [29/31] hack passing kernel_init()
config: arm-randconfig-r046-20230206 (https://download.01.org/0day-ci/archive/20230209/202302090016.DRnD1KVw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=0facdc348172563db9b913d75c9aab1bf68550f8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 0facdc348172563db9b913d75c9aab1bf68550f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/dvb-core/ drivers/tty/vt/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sys.c:1288:1: warning: stack frame size (1040) exceeds limit (1024) in '__se_sys_newuname' [-Wframe-larger-than]
   SYSCALL_DEFINE1(newuname, struct new_utsname __user *, name)
   ^
   include/linux/syscalls.h:217:36: note: expanded from macro 'SYSCALL_DEFINE1'
   #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                      ^
   include/linux/syscalls.h:228:2: note: expanded from macro 'SYSCALL_DEFINEx'
           __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
           ^
   include/linux/syscalls.h:247:18: note: expanded from macro '__SYSCALL_DEFINEx'
           asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))  \
                           ^
   <scratch space>:124:1: note: expanded from here
   __se_sys_newuname
   ^
   40/1040 (3.85%) spills, 1000/1040 (96.15%) variables
   1 warning generated.
--
>> drivers/media/dvb-core/dvb_frontend.c:2424:12: warning: stack frame size (1072) exceeds limit (1024) in 'dvb_frontend_handle_ioctl' [-Wframe-larger-than]
   static int dvb_frontend_handle_ioctl(struct file *file,
              ^
   66/1072 (6.16%) spills, 1006/1072 (93.84%) variables
   1 warning generated.
--
>> drivers/tty/vt/consolemap.c:402:5: warning: stack frame size (1064) exceeds limit (1024) in 'con_get_trans_new' [-Wframe-larger-than]
   int con_get_trans_new(ushort __user * arg)
       ^
   24/1064 (2.26%) spills, 1040/1064 (97.74%) variables
   1 warning generated.


vim +/__se_sys_newuname +1288 kernel/sys.c

be27425dcc516f Andi Kleen        2011-08-19  1287  
e48fbb699f82ef Heiko Carstens    2009-01-14 @1288  SYSCALL_DEFINE1(newuname, struct new_utsname __user *, name)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1289  {
42a0cc3478584d Jann Horn         2018-06-25  1290  	struct new_utsname tmp;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1291  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1292  	down_read(&uts_sem);
42a0cc3478584d Jann Horn         2018-06-25  1293  	memcpy(&tmp, utsname(), sizeof(tmp));
^1da177e4c3f41 Linus Torvalds    2005-04-16  1294  	up_read(&uts_sem);
42a0cc3478584d Jann Horn         2018-06-25  1295  	if (copy_to_user(name, &tmp, sizeof(tmp)))
42a0cc3478584d Jann Horn         2018-06-25  1296  		return -EFAULT;
e28cbf22933d0c Christoph Hellwig 2010-03-10  1297  
42a0cc3478584d Jann Horn         2018-06-25  1298  	if (override_release(name->release, sizeof(name->release)))
42a0cc3478584d Jann Horn         2018-06-25  1299  		return -EFAULT;
42a0cc3478584d Jann Horn         2018-06-25  1300  	if (override_architecture(name))
42a0cc3478584d Jann Horn         2018-06-25  1301  		return -EFAULT;
42a0cc3478584d Jann Horn         2018-06-25  1302  	return 0;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1303  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1304  

:::::: The code at line 1288 was first introduced by commit
:::::: e48fbb699f82ef1e80bd7126046394d2dc9ca7e6 [CVE-2009-0029] System call wrappers part 24

:::::: TO: Heiko Carstens <heiko.carstens@de.ibm.com>
:::::: CC: Heiko Carstens <heiko.carstens@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
