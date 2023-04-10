Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE24423A8;
	Mon, 10 Apr 2023 05:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681104074; x=1712640074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZzNCGssA1wu98mRXpa9+cWNwnehjRVT4+2e5+tdmHU=;
  b=I7Yfrvzu/ZDZUsIjfRxNbvthsF/45OfmNYdUhyA1E4mEVwuJuCi/Kv7r
   vVwj3WSdjkRQ+FMDBeLulIRiSjNgVX76P/n2In1cxCX5jGDxtUGIw0czY
   RR1QiKR2hzyUiMweD+eGsQYQDqJaJFCWDh0jIe6pQKCXsD0zBWB32Qy5d
   6TJkcKeqsPnbkGMgpr/N/S5ShLXxyfNK5/3HxLGaEaDuy4Dud2MAg+e5O
   9zx4uJfxzo3aeJRLt2AkyaghleH/YjPKalYhEURmpr8lpSMy5Pstr6CsN
   J/CrKMGJxyhObLmYBfF1e+NCoVQ0XlPvzi6c3ASaw3NygTl0iGT0JLBEM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="322922022"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="322922022"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 22:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10675"; a="862382912"
X-IronPort-AV: E=Sophos;i="5.98,332,1673942400"; 
   d="scan'208";a="862382912"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Apr 2023 22:21:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pljxn-000V6b-2H;
	Mon, 10 Apr 2023 05:21:11 +0000
Date: Mon, 10 Apr 2023 13:20:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-event-ext 5/5] drivers/greybus/hd.c:15:1:
 error: use of undeclared identifier '__probestub_gb_hd_create'; did you mean
 '__traceiter_gb_hd_create'?
Message-ID: <202304101349.UUe8ZXGN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-event-ext
head:   dba0fb8da5621907bcbc624b94b6b3350e824317
commit: dba0fb8da5621907bcbc624b94b6b3350e824317 [5/5] tracing: Add tracepoint support on fprobe_event
config: x86_64-randconfig-a003-20230410 (https://download.01.org/0day-ci/archive/20230410/202304101349.UUe8ZXGN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git/commit/?id=dba0fb8da5621907bcbc624b94b6b3350e824317
        git remote add mhiramat https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git
        git fetch --no-tags mhiramat topic/fprobe-event-ext
        git checkout dba0fb8da5621907bcbc624b94b6b3350e824317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304101349.UUe8ZXGN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/greybus/hd.c:15:1: error: use of undeclared identifier '__probestub_gb_hd_create'; did you mean '__traceiter_gb_hd_create'?
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_create);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:64:1: note: expanded from here
   __probestub_gb_hd_create
   ^
   drivers/greybus/hd.c:15:1: note: '__traceiter_gb_hd_create' declared here
   include/linux/tracepoint.h:344:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
                             ^
   <scratch space>:49:1: note: expanded from here
   __traceiter_gb_hd_create
   ^
>> drivers/greybus/hd.c:16:1: error: use of undeclared identifier '__probestub_gb_hd_release'; did you mean '__probestub_gb_hd_create'?
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_release);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:7:1: note: expanded from here
   __probestub_gb_hd_release
   ^
   drivers/greybus/hd.c:15:1: note: '__probestub_gb_hd_create' declared here
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_create);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:64:1: note: expanded from here
   __probestub_gb_hd_create
   ^
>> drivers/greybus/hd.c:17:1: error: use of undeclared identifier '__probestub_gb_hd_add'; did you mean '__probestub_gb_hd_create'?
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_add);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:83:1: note: expanded from here
   __probestub_gb_hd_add
   ^
   drivers/greybus/hd.c:15:1: note: '__probestub_gb_hd_create' declared here
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_create);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:64:1: note: expanded from here
   __probestub_gb_hd_create
   ^
>> drivers/greybus/hd.c:18:1: error: use of undeclared identifier '__probestub_gb_hd_del'; did you mean '__probestub_gb_hd_add'?
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_del);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:32:1: note: expanded from here
   __probestub_gb_hd_del
   ^
   drivers/greybus/hd.c:17:1: note: '__probestub_gb_hd_add' declared here
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_add);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:83:1: note: expanded from here
   __probestub_gb_hd_add
   ^
>> drivers/greybus/hd.c:19:1: error: use of undeclared identifier '__probestub_gb_hd_in'
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_in);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:108:1: note: expanded from here
   __probestub_gb_hd_in
   ^
>> drivers/greybus/hd.c:20:1: error: use of undeclared identifier '__probestub_gb_message_submit'; did you mean '__traceiter_gb_message_submit'?
   EXPORT_TRACEPOINT_SYMBOL_GPL(gb_message_submit);
   ^
   include/linux/tracepoint.h:345:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__probestub_##name);                          \
                             ^
   <scratch space>:47:1: note: expanded from here
   __probestub_gb_message_submit
   ^
   drivers/greybus/hd.c:20:1: note: '__traceiter_gb_message_submit' declared here
   include/linux/tracepoint.h:344:20: note: expanded from macro 'EXPORT_TRACEPOINT_SYMBOL_GPL'
           EXPORT_SYMBOL_GPL(__traceiter_##name);                          \
                             ^
   <scratch space>:32:1: note: expanded from here
   __traceiter_gb_message_submit
   ^
   6 errors generated.


vim +15 drivers/greybus/hd.c

7bc6faaca7d829 drivers/staging/greybus/hd.c Johan Hovold 2015-11-03  14  
56278c7384a3c0 drivers/staging/greybus/hd.c Viresh Kumar 2016-06-09 @15  EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_create);
56278c7384a3c0 drivers/staging/greybus/hd.c Viresh Kumar 2016-06-09 @16  EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_release);
56278c7384a3c0 drivers/staging/greybus/hd.c Viresh Kumar 2016-06-09 @17  EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_add);
56278c7384a3c0 drivers/staging/greybus/hd.c Viresh Kumar 2016-06-09 @18  EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_del);
495787a792ac49 drivers/staging/greybus/hd.c Alex Elder   2016-06-03 @19  EXPORT_TRACEPOINT_SYMBOL_GPL(gb_hd_in);
56278c7384a3c0 drivers/staging/greybus/hd.c Viresh Kumar 2016-06-09 @20  EXPORT_TRACEPOINT_SYMBOL_GPL(gb_message_submit);
495787a792ac49 drivers/staging/greybus/hd.c Alex Elder   2016-06-03  21  

:::::: The code at line 15 was first introduced by commit
:::::: 56278c7384a3c0242fe2f7ba91473c978ab500ae greybus: hd: Export host device tracepoint from hd.c

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
