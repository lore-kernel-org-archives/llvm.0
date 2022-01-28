Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6037168
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 08:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643359568; x=1674895568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H+tIbmhjE4QG2sWST/QIM9Alm+fPOHWqQHHUF22ZXGU=;
  b=O7bcGVpTzKyT7U7bpB15mrvdB4/ahnlS87m/1P1yghpC0G14NHuwzat3
   rRcK1fqsoLrkIX/CeEAjGLMCM1xZFguNfVHjtc9B20RfZugWkj2fxOuxd
   y3ocWWNdDzLkCt1dOaAQiomLK9d6AOZpyvoPnvO2TAQt9sR400eZOhDZC
   tS51KOoHf7MABr+9GyIa/RYVPHNQ4yRdCMBbv3yBok3GJpWnNB2T2Rk4e
   33SxTuoSPfs8+4YFOH0GwEf9WxnqHzleGHAmH0uoZ4nQYqB6+o5ZPY4WT
   09g4vI+bX4Gfm5sXNb3rJQ59WjmSMEcJcp7Cf59tpFg78zScwv0mDjLWd
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="230657261"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="230657261"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 00:46:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="496069381"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 28 Jan 2022 00:46:06 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDMtS-000NfW-1H; Fri, 28 Jan 2022 08:46:06 +0000
Date: Fri, 28 Jan 2022 16:45:29 +0800
From: kernel test robot <lkp@intel.com>
To: Zichar Zhang <zichar.zhang@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 1/1] [RFC] wakeup_reason: Add infrastructure to log and
 report why the system resumed from suspend.
Message-ID: <202201281645.eC7tWb3B-lkp@intel.com>
References: <20220128045522.3505336-1-zichar.zhang@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220128045522.3505336-1-zichar.zhang@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Zichar,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linux/master linus/master v5.17-rc1 next-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zichar-Zhang/wakeup_reason-Add-infrastructure-to-log-and-report-why-the-system-resumed-from-suspend/20220128-125627
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: i386-randconfig-a014-20220124 (https://download.01.org/0day-ci/archive/20220128/202201281645.eC7tWb3B-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b932c9637e3e3a14497ff60caedfc67608d93c13
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zichar-Zhang/wakeup_reason-Add-infrastructure-to-log-and-report-why-the-system-resumed-from-suspend/20220128-125627
        git checkout b932c9637e3e3a14497ff60caedfc67608d93c13
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/power/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/power/main.c:19:
>> include/linux/wakeup_reason.h:29:9: warning: no previous prototype for function 'log_ws_wakeup_reason' [-Wmissing-prototypes]
   ssize_t log_ws_wakeup_reason(void) { }
           ^
   include/linux/wakeup_reason.h:29:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t log_ws_wakeup_reason(void) { }
   ^
   static 
   include/linux/wakeup_reason.h:29:38: error: non-void function does not return a value [-Werror,-Wreturn-type]
   ssize_t log_ws_wakeup_reason(void) { }
                                        ^
>> include/linux/wakeup_reason.h:30:9: warning: no previous prototype for function 'log_irq_wakeup_reason' [-Wmissing-prototypes]
   ssize_t log_irq_wakeup_reason(unsigned int irq_number) { }
           ^
   include/linux/wakeup_reason.h:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t log_irq_wakeup_reason(unsigned int irq_number) { }
   ^
   static 
   include/linux/wakeup_reason.h:30:58: error: non-void function does not return a value [-Werror,-Wreturn-type]
   ssize_t log_irq_wakeup_reason(unsigned int irq_number) { }
                                                            ^
>> include/linux/wakeup_reason.h:31:6: warning: no previous prototype for function 'clear_wakeup_reason' [-Wmissing-prototypes]
   void clear_wakeup_reason(void) { }
        ^
   include/linux/wakeup_reason.h:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void clear_wakeup_reason(void) { }
   ^
   static 
>> include/linux/wakeup_reason.h:32:9: warning: no previous prototype for function 'last_wakeup_reason_get' [-Wmissing-prototypes]
   ssize_t last_wakeup_reason_get(char *buf, ssize_t max) { }
           ^
   include/linux/wakeup_reason.h:32:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t last_wakeup_reason_get(char *buf, ssize_t max) { }
   ^
   static 
   include/linux/wakeup_reason.h:32:58: error: non-void function does not return a value [-Werror,-Wreturn-type]
   ssize_t last_wakeup_reason_get(char *buf, ssize_t max) { }
                                                            ^
   4 warnings and 3 errors generated.


vim +/log_ws_wakeup_reason +29 include/linux/wakeup_reason.h

    22	
    23	#ifdef CONFIG_SUSPEND
    24	ssize_t log_ws_wakeup_reason(void);
    25	ssize_t log_irq_wakeup_reason(unsigned int irq_number);
    26	void clear_wakeup_reason(void);
    27	ssize_t last_wakeup_reason_get(char *buf, ssize_t max);
    28	#else
  > 29	ssize_t log_ws_wakeup_reason(void) { }
  > 30	ssize_t log_irq_wakeup_reason(unsigned int irq_number) { }
  > 31	void clear_wakeup_reason(void) { }
  > 32	ssize_t last_wakeup_reason_get(char *buf, ssize_t max) { }
    33	#endif
    34	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
