Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AD139A
	for <llvm@lists.linux.dev>; Sun, 10 Apr 2022 22:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649629404; x=1681165404;
  h=date:from:cc:subject:message-id:mime-version;
  bh=g2eGI+BWsgWZSF+FwtwydPHLo4eWrqgKKTioKhhg2TA=;
  b=M4fuORihs4Et3pSKJVXv4S3Zszzlc9buvJjOJPmAL9uAHveZ/uBuBlf9
   ki2koP9v4H+jMvL4aYi79nFEsoVhmx+D/RmGodA+QHUfNCjMKdu06iZj5
   ilnEfyZZXtrwL4FOaeEE4u1pn2OzGebHt+e31CSyaIFnRGlsnTjIHR/eR
   JQftWbA/pqHih9eY2wbiZwZM+V+anzrTyAetuoFjx+szJbp8mQtDf3IMC
   AgnbG+Bf2y9misLk25tUJsBJSf6z+ISOaYYENYE2DtWmKEazdfqpA+Y34
   luEJUPigNi0Ds5mvu6PzA3wU7zNkTI5AMfJoZhVqp20O8otdZ/XhbUo6Z
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="262180153"
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="262180153"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2022 15:23:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,250,1643702400"; 
   d="scan'208";a="550866115"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 10 Apr 2022 15:23:22 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ndfxp-00018l-MY;
	Sun, 10 Apr 2022 22:23:21 +0000
Date: Mon, 11 Apr 2022 06:22:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: __sev_get_ghcb()+0x59: call to memcpy()
 leaves .noinstr.text section
Message-ID: <202204110615.0XEmIj1z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Joerg Roedel <jroedel@suse.de>
CC: Borislav Petkov <bp@suse.de>

Hi Joerg,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4ea3c6425269d33da53c79d539ce9554117cf4d4
commit: d187f217335dba2b49fc9002aab2004e04acddee x86/sev: Make sure IRQs are disabled while GHCB is active
date:   10 months ago
config: x86_64-buildonly-randconfig-r001-20220411 (https://download.01.org/0day-ci/archive/20220411/202204110615.0XEmIj1z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 256c6b0ba14e8a7ab6373b61b7193ea8c0a3651c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d187f217335dba2b49fc9002aab2004e04acddee
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d187f217335dba2b49fc9002aab2004e04acddee
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: sync_regs()+0x23: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: vc_switch_off_ist()+0xe: call to ip_within_syscall_gap() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi()+0x18: call to __kasan_check_read() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_es_nmi_complete()+0x30: call to __memset() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: __sev_get_ghcb()+0x59: call to memcpy() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __sev_put_ghcb()+0x57: call to __memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: debug_locks_off()+0x30: call to __kasan_check_write() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
