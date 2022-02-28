Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AC515AF
	for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 17:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646069838; x=1677605838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EUN0iBxb6qJUpWGGlQLJZRyk0KG5mMjx/0wyD9IfUo0=;
  b=WmqUMsArspPUWqadf9izE4+SllBvegSM958XW2njiALpYilj0GcPIbCn
   DSwq4PYc08JH0JDO41tX2/2fiw1OfF82KT6y1v1TBk5JFvZ2hM0umbMTj
   jKaoGmfjbTBh4FV68jvO7YlBtf8KQpGIJnJjmJqyFKTcKuqY4d7Zn1T5+
   hkv0doYFv7MXey4hjpijDzEiINUT71c86uu9AkiwSxJLFAPqW1GuYkfHM
   2FAA9DmJMS4D9GN+26eye7gxI7WsziEAuqsUKLeOX3FSDKLSCLdE4Qra5
   1oYx4xLbR+qYuZHgQIyRsZKR2QCAZBOwftGzY6XVPFWprEGNkf4kK3pTa
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10272"; a="316154509"
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="316154509"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2022 09:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,144,1643702400"; 
   d="scan'208";a="492791347"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 28 Feb 2022 09:37:15 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOjxS-0007c7-GK; Mon, 28 Feb 2022 17:37:14 +0000
Date: Tue, 1 Mar 2022 01:36:15 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] MIPS: Refactor early_parse_mem() to fix mem=
 parameter
Message-ID: <202202282330.uO0sH1Bk-lkp@intel.com>
References: <1646054617-16799-2-git-send-email-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646054617-16799-2-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tiezhu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on hnaz-mm/master]
[also build test WARNING on linus/master v5.17-rc6 next-20220225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tiezhu-Yang/MIPS-Modify-mem-and-memmap-parameter/20220228-212554
base:   https://github.com/hnaz/linux-mm master
config: mips-randconfig-r025-20220228 (https://download.01.org/0day-ci/archive/20220228/202202282330.uO0sH1Bk-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/8e3bd7f4c0a4003c328ef2d816454dd50810b974
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tiezhu-Yang/MIPS-Modify-mem-and-memmap-parameter/20220228-212554
        git checkout 8e3bd7f4c0a4003c328ef2d816454dd50810b974
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash arch/mips/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/mips/kernel/setup.c:350:42: warning: format specifies type 'long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
           pr_notice("Memory limited to %lldMB\n", memory_limit >> 20);
                                        ~~~~       ^~~~~~~~~~~~~~~~~~
                                        %u
   include/linux/printk.h:509:36: note: expanded from macro 'pr_notice'
           printk(KERN_NOTICE pr_fmt(fmt), ##__VA_ARGS__)
                                     ~~~     ^~~~~~~~~~~
   include/linux/printk.h:446:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:418:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +350 arch/mips/kernel/setup.c

   343	
   344	static int __init early_parse_mem(char *p)
   345	{
   346		if (!p)
   347			return 1;
   348	
   349		memory_limit = memparse(p, &p) & PAGE_MASK;
 > 350		pr_notice("Memory limited to %lldMB\n", memory_limit >> 20);
   351	
   352		return 0;
   353	}
   354	early_param("mem", early_parse_mem);
   355	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
