Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F53423109;
	Fri, 23 Jun 2023 22:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687560204; x=1719096204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MhZLju72Wu953YaQliJabK/FxTEhlQ/IuuKL76TUfzs=;
  b=n+iyhOqk/lnmP2J18u1fmgZQEI8mzUqSkzanfOPyFLMJiCfMsyxzOrF4
   VkOqZ6Up8fLE3viugrj2BOADLeYFCMqshhJDVnV7LxOLHyYQnwkwsIsZP
   woci7z6/9YyinoDqBH89JpxtnwOLOPkwvYrkEWEWh1Sb96g6TTH8/TAw/
   NL0SBV7nDCnF62vcy7zrNnbY8+XUh5m99DKd9qWU4CS5rMFPlppwkfA7a
   p4ylSBjmz0CdS0Pom4OQ1B+fqTtu8ChvfVc169IKyDkbzPGZwOz99Ud7h
   kBGkt9dplk0dqYMaHHaSVwdypgh1mUMpUU2zYW8nCdfkf79WF65FgXTNP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="364323804"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="364323804"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 15:43:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="718679708"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="718679708"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Jun 2023 15:43:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCpUu-0008Zf-0c;
	Fri, 23 Jun 2023 22:43:20 +0000
Date: Sat, 24 Jun 2023 06:43:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Kees Cook <keescook@chromium.org>
Subject: [tip:locking/core 37/43]
 drivers/char/ipmi/ipmi_msghandler.c:5194:13: warning: stack frame size
 (1032) exceeds limit (1024) in 'ipmi_panic_request_and_wait'
Message-ID: <202306240641.rigy2zg2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   b33eb50a92b0a298fa8a6ac350e741c3ec100f6d
commit: 1d78814d41701c216e28fcf2656526146dec4a1a [37/43] locking/atomic: scripts: simplify raw_atomic*() definitions
config: arm-randconfig-r016-20230622 (https://download.01.org/0day-ci/archive/20230624/202306240641.rigy2zg2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240641.rigy2zg2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240641.rigy2zg2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/ipmi/ipmi_msghandler.c:5194:13: warning: stack frame size (1032) exceeds limit (1024) in 'ipmi_panic_request_and_wait' [-Wframe-larger-than]
   static void ipmi_panic_request_and_wait(struct ipmi_smi *intf,
               ^
   1 warning generated.


vim +/ipmi_panic_request_and_wait +5194 drivers/char/ipmi/ipmi_msghandler.c

895dcfd1cab84d Corey Minyard  2012-03-28  5190  
895dcfd1cab84d Corey Minyard  2012-03-28  5191  /*
895dcfd1cab84d Corey Minyard  2012-03-28  5192   * Inside a panic, send a message and wait for a response.
895dcfd1cab84d Corey Minyard  2012-03-28  5193   */
a567b6230066e3 Corey Minyard  2018-04-05 @5194  static void ipmi_panic_request_and_wait(struct ipmi_smi *intf,
895dcfd1cab84d Corey Minyard  2012-03-28  5195  					struct ipmi_addr *addr,
895dcfd1cab84d Corey Minyard  2012-03-28  5196  					struct kernel_ipmi_msg *msg)
895dcfd1cab84d Corey Minyard  2012-03-28  5197  {
895dcfd1cab84d Corey Minyard  2012-03-28  5198  	struct ipmi_smi_msg  smi_msg;
895dcfd1cab84d Corey Minyard  2012-03-28  5199  	struct ipmi_recv_msg recv_msg;
895dcfd1cab84d Corey Minyard  2012-03-28  5200  	int rv;
895dcfd1cab84d Corey Minyard  2012-03-28  5201  
895dcfd1cab84d Corey Minyard  2012-03-28  5202  	smi_msg.done = dummy_smi_done_handler;
895dcfd1cab84d Corey Minyard  2012-03-28  5203  	recv_msg.done = dummy_recv_done_handler;
895dcfd1cab84d Corey Minyard  2012-03-28  5204  	atomic_add(2, &panic_done_count);
895dcfd1cab84d Corey Minyard  2012-03-28  5205  	rv = i_ipmi_request(NULL,
895dcfd1cab84d Corey Minyard  2012-03-28  5206  			    intf,
895dcfd1cab84d Corey Minyard  2012-03-28  5207  			    addr,
895dcfd1cab84d Corey Minyard  2012-03-28  5208  			    0,
895dcfd1cab84d Corey Minyard  2012-03-28  5209  			    msg,
895dcfd1cab84d Corey Minyard  2012-03-28  5210  			    intf,
895dcfd1cab84d Corey Minyard  2012-03-28  5211  			    &smi_msg,
895dcfd1cab84d Corey Minyard  2012-03-28  5212  			    &recv_msg,
895dcfd1cab84d Corey Minyard  2012-03-28  5213  			    0,
5fdb1fb2abe647 Corey Minyard  2017-09-05  5214  			    intf->addrinfo[0].address,
5fdb1fb2abe647 Corey Minyard  2017-09-05  5215  			    intf->addrinfo[0].lun,
895dcfd1cab84d Corey Minyard  2012-03-28  5216  			    0, 1); /* Don't retry, and don't wait. */
895dcfd1cab84d Corey Minyard  2012-03-28  5217  	if (rv)
895dcfd1cab84d Corey Minyard  2012-03-28  5218  		atomic_sub(2, &panic_done_count);
82802f968bd311 Hidehiro Kawai 2015-07-27  5219  	else if (intf->handlers->flush_messages)
82802f968bd311 Hidehiro Kawai 2015-07-27  5220  		intf->handlers->flush_messages(intf->send_info);
82802f968bd311 Hidehiro Kawai 2015-07-27  5221  
895dcfd1cab84d Corey Minyard  2012-03-28  5222  	while (atomic_read(&panic_done_count) != 0)
895dcfd1cab84d Corey Minyard  2012-03-28  5223  		ipmi_poll(intf);
^1da177e4c3f41 Linus Torvalds 2005-04-16  5224  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  5225  

:::::: The code at line 5194 was first introduced by commit
:::::: a567b6230066e3a2c964e2dc914e7f9a436806c4 ipmi: Change ipmi_smi_t to struct ipmi_smi *

:::::: TO: Corey Minyard <cminyard@mvista.com>
:::::: CC: Corey Minyard <cminyard@mvista.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
