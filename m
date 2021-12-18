Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6215F29CA
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 17:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639850276; x=1671386276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eL6atpWvTyM+P3t0NlBStkzHNd9WYBegko0U6zf6mLg=;
  b=jibXzWU9G0oL6wzR6KSof+9aVvboXtxXTuxYOBLQ3Qc4VIvPcLtuR3H2
   YdlWec1lDwQoTdkNACV6P/o0FJWvn02m2sRjkagQkm3a1oxIDxG7b+wIO
   HWKO8G/hTCWduOJ8ZXm4aguBJgVKOspiIksdTXHtcEwAiNADu76xMHq9f
   oPdvHpn0UD2T437R2zUWVqRjy6cTzj3LkhGBAkwgM8xJ7qY8+vx04CQtI
   53fSomSHeAPTJkf/o6UHc6FMoUJN7dJcpfZGd/B9NPigHn8rIjR5F1z+w
   h7XHWXhNE1RoYDmTsyJNxKsZ/O5VfuSBKQfxMxd8IzgaodgwjZvNK2muQ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10202"; a="240162892"
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="240162892"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 09:57:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="465474389"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Dec 2021 09:57:53 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mydxw-0006GI-Nt; Sat, 18 Dec 2021 17:57:52 +0000
Date: Sun, 19 Dec 2021 01:57:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Steven Rostedt (VMware)" <rostedt@goodmis.org>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: samples/ftrace/ftrace-direct-multi-modify.c:7:6: warning: no
 previous prototype for function 'my_direct_func1'
Message-ID: <202112190117.RKPcHQjE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9eaa88c7036eda3f6c215f87ca693594cf90559b
commit: e1067a07cfbc5a36abad3752fafe4c79e06db1bb ftrace/samples: Add module to test multi direct modify interface
date:   9 days ago
config: x86_64-randconfig-a001-20211219 (https://download.01.org/0day-ci/archive/20211219/202112190117.RKPcHQjE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e1067a07cfbc5a36abad3752fafe4c79e06db1bb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1067a07cfbc5a36abad3752fafe4c79e06db1bb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash samples/ftrace/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> samples/ftrace/ftrace-direct-multi-modify.c:7:6: warning: no previous prototype for function 'my_direct_func1' [-Wmissing-prototypes]
   void my_direct_func1(unsigned long ip)
        ^
   samples/ftrace/ftrace-direct-multi-modify.c:7:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void my_direct_func1(unsigned long ip)
   ^
   static 
>> samples/ftrace/ftrace-direct-multi-modify.c:12:6: warning: no previous prototype for function 'my_direct_func2' [-Wmissing-prototypes]
   void my_direct_func2(unsigned long ip)
        ^
   samples/ftrace/ftrace-direct-multi-modify.c:12:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void my_direct_func2(unsigned long ip)
   ^
   static 
   2 warnings generated.


vim +/my_direct_func1 +7 samples/ftrace/ftrace-direct-multi-modify.c

     6	
   > 7	void my_direct_func1(unsigned long ip)
     8	{
     9		trace_printk("my direct func1 ip %lx\n", ip);
    10	}
    11	
  > 12	void my_direct_func2(unsigned long ip)
    13	{
    14		trace_printk("my direct func2 ip %lx\n", ip);
    15	}
    16	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
