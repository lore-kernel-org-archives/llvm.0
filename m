Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B57429CA
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 19:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639423017; x=1670959017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VHnDozIc4v7QpR3IRCWWh2AZ3tIbWgh1pH62gbq7Lbg=;
  b=b6fsgYDFEMhq6XZr2x0FwJjLF8qAdI+WxyV2PvJP/8E1F7w2MSms3Nmm
   XIvnMR05sxgUyM2GwrbQdGzzx0gwBozveRzifH8lc3usds+c+D2pMl4WA
   pCJkEcU1DWHrL9pDK66qbH60v3P0AQRETi55iD1E7GDuaFkbEaLcJjcVV
   MxHoUKXKLa88MFVubacaD/v0/uhs8QlschY8ihfPsxXBgHpJNFzQdilOg
   pE+piNRH1/O7x06q4vDVu7HjXJ3sce7ZgGHPTAITvUT/yAx1C06K2br40
   XUszbVSS5fTInH2627RjyV5vhUinWASwu3p8QeyyyLeJEuugICIvtILSW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="239032350"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="239032350"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 11:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="544890170"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Dec 2021 11:16:54 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwqof-0006yP-BL; Mon, 13 Dec 2021 19:16:53 +0000
Date: Tue, 14 Dec 2021 03:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: lianzhi chang <changlianzhi@uniontech.com>,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	dmitry.torokhov@gmail.com, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
	282827961@qq.com, lianzhi chang <changlianzhi@uniontech.com>
Subject: Re: [PATCH v21] tty: Fix the keyboard led light display problem
Message-ID: <202112140304.qPpjdgPQ-lkp@intel.com>
References: <20211213124122.25605-1-changlianzhi@uniontech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211213124122.25605-1-changlianzhi@uniontech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi lianzhi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tty/tty-testing]
[also build test WARNING on linux/master linus/master v5.16-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/lianzhi-chang/tty-Fix-the-keyboard-led-light-display-problem/20211213-204404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
config: mips-randconfig-r022-20211213 (https://download.01.org/0day-ci/archive/20211214/202112140304.qPpjdgPQ-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://github.com/0day-ci/linux/commit/8cc658e5dd82e5d70fa3ac9dace8fe62eaed325f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review lianzhi-chang/tty-Fix-the-keyboard-led-light-display-problem/20211213-204404
        git checkout 8cc658e5dd82e5d70fa3ac9dace8fe62eaed325f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/tty/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/tty/sysrq.c:31:
   include/linux/kbd_kern.h:35:27: error: character <U+FF1B> not allowed in an identifier
           unsigned char kbdledctl:1； /* Whether to allow to control the led of the keyboard */
                                    ^~
   include/linux/kbd_kern.h:35:27: error: invalid suffix '；' on integer constant
   In file included from drivers/tty/sysrq.c:51:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
>> include/linux/poll.h:142:27: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                           ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   include/linux/poll.h:142:39: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                                       ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   2 warnings and 2 errors generated.


vim +142 include/linux/poll.h

7a163b2195cda0 Al Viro 2018-02-01  137  
7a163b2195cda0 Al Viro 2018-02-01  138  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0 Al Viro 2018-02-01  139  {
7a163b2195cda0 Al Viro 2018-02-01  140  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0 Al Viro 2018-02-01  141  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0 Al Viro 2018-02-01 @142  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0 Al Viro 2018-02-01  143  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0 Al Viro 2018-02-01  144  #undef M
7a163b2195cda0 Al Viro 2018-02-01  145  }
7a163b2195cda0 Al Viro 2018-02-01  146  #undef __MAP
7a163b2195cda0 Al Viro 2018-02-01  147  
7a163b2195cda0 Al Viro 2018-02-01  148  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
