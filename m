Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F81C17;
	Wed, 22 Feb 2023 05:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677044098; x=1708580098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ksor3r93xhjwp5/cuOsuLJnI2uNgMuWd5tmL0XoJilc=;
  b=aoDkMCOuSnFBY1j6jFKYVhgmBvyxi9U1oMerVe+FQcQ4NMjKG5bw1kJA
   Ern86FYObtpGbVnQPCcYEhoOne1aMobYgAIvNM3pvlKX4YlQTK9qOASYO
   Y4di6MmgakfVZfsW9vRGsgX9Xk5exWgl/4sHMGNsHYlswlldbLLec2Frm
   /MkxlPx67JXvqh7BewIwhB7f9Fyx5Jm6ToN1Mov53+RbSWIu88nDnQ5DL
   plkOjArRs+dhS3V6YejD0yISg+sjzkULQQuxCOagqPwLf8jaWw9cSrGom
   KnlZX3YOqOv5G00DJq7+8yauaXEjgswwowgTS0VhN4FAaPJXXv+cZvY8c
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="330565366"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="330565366"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 21:34:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="814792612"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="814792612"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 21:34:56 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUhmJ-00001Z-2g;
	Wed, 22 Feb 2023 05:34:55 +0000
Date: Wed, 22 Feb 2023 13:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:class_cleanup 90/91] fs/ksmbd/server.c:519:3: error:
 field designator 'owner' does not refer to any field in type 'struct class'
Message-ID: <202302221325.3TxD9pgW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git class_cleanup
head:   512466823088e17b8bedd9a5edcc8a7a35e7e635
commit: 7f46532636eefe2f7beb5c52ddb25db664c3fad1 [90/91] driver core: class: remove struct module owner out of struct class
config: riscv-randconfig-r004-20230221 (https://download.01.org/0day-ci/archive/20230222/202302221325.3TxD9pgW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=7f46532636eefe2f7beb5c52ddb25db664c3fad1
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core class_cleanup
        git checkout 7f46532636eefe2f7beb5c52ddb25db664c3fad1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302221325.3TxD9pgW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ksmbd/server.c:519:3: error: field designator 'owner' does not refer to any field in type 'struct class'
           .owner          = THIS_MODULE,
            ^
   1 error generated.


vim +519 fs/ksmbd/server.c

0626e6641f6b46 fs/cifsd/server.c Namjae Jeon 2021-03-16  516  
0626e6641f6b46 fs/cifsd/server.c Namjae Jeon 2021-03-16  517  static struct class ksmbd_control_class = {
0626e6641f6b46 fs/cifsd/server.c Namjae Jeon 2021-03-16  518  	.name		= "ksmbd-control",
0626e6641f6b46 fs/cifsd/server.c Namjae Jeon 2021-03-16 @519  	.owner		= THIS_MODULE,
0626e6641f6b46 fs/cifsd/server.c Namjae Jeon 2021-03-16  520  	.class_groups	= ksmbd_control_class_groups,
0626e6641f6b46 fs/cifsd/server.c Namjae Jeon 2021-03-16  521  };
0626e6641f6b46 fs/cifsd/server.c Namjae Jeon 2021-03-16  522  

:::::: The code at line 519 was first introduced by commit
:::::: 0626e6641f6b467447c81dd7678a69c66f7746cf cifsd: add server handler for central processing and tranport layers

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
