Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A31B23DF
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 09:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650620924; x=1682156924;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x1vQFBIsNj2j27ZbIjDt3pno+CqY/0ui3z7PekQzkHc=;
  b=ZkItUpJNlN8YwgxgAPaJAVUKXbpobDKp60zq6G8hugnJwJeNcIv53Ldd
   52hp3T/+WkODO1ZOa1a7GKCs7grzXVbGGNbQTS7kprHZST8gimnf6okY2
   3qNs5VBnlLakiTFv7qzDB4nyT/RgOcRNVFEyM5hknbsKvvQ2X5warqcmU
   RwDZPB4w4jNyZgfAD3FIHU586pOcGx31FXdIPWIHh5KdSe397yZNOqkfx
   DkoMDfnb2zDtMGhAdeo3UvrjLn3etDrYZMjOSzeanqHRCwbgOMHuCHZdM
   diwPtGLEB+wS5LtGFUvASH1zh/VaoK3yLdQBvB2XA7EeeOqDFOTu9tDqX
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245208329"
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="245208329"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 02:48:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,281,1643702400"; 
   d="scan'208";a="728442232"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Apr 2022 02:48:42 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhpu5-0009zr-FJ;
	Fri, 22 Apr 2022 09:48:41 +0000
Date: Fri, 22 Apr 2022 17:48:11 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-5.18.y-rt-rebase 17/78]
 kernel/printk/printk.c:3182:13: warning: function 'console_emit_next_record'
 has internal linkage but is not defined
Message-ID: <202204221737.XUqb9giP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-5.18.y-rt-rebase
head:   03e7725ddbfb0ffd7f3d7b257bfa504c6f795f6b
commit: 72b5c1227b73b2cde1452cfc58717cff442ed473 [17/78] serial: 8250: implement write_atomic
config: hexagon-randconfig-r002-20220422 (https://download.01.org/0day-ci/archive/20220422/202204221737.XUqb9giP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=72b5c1227b73b2cde1452cfc58717cff442ed473
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.18.y-rt-rebase
        git checkout 72b5c1227b73b2cde1452cfc58717cff442ed473
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/printk/printk.c:3187:7: warning: variable 'any_usable' set but not used [-Wunused-but-set-variable]
           bool any_usable = false;
                ^
>> kernel/printk/printk.c:3182:13: warning: function 'console_emit_next_record' has internal linkage but is not defined [-Wundefined-internal]
   static bool console_emit_next_record(struct console *con, char *text, char *ext_text,
               ^
   kernel/printk/printk.c:3215:16: note: used here
                                   progress = console_emit_next_record(con,
                                              ^
   2 warnings generated.


vim +/console_emit_next_record +3182 kernel/printk/printk.c

fe3d8ad31cf51b kernel/printk.c        Feng Tang   2011-03-22  3180  
943b66638a0519 kernel/printk/printk.c John Ogness 2022-02-04  3181  #ifdef CONFIG_HAVE_ATOMIC_CONSOLE
943b66638a0519 kernel/printk/printk.c John Ogness 2022-02-04 @3182  static bool console_emit_next_record(struct console *con, char *text, char *ext_text,
943b66638a0519 kernel/printk/printk.c John Ogness 2022-02-04  3183  				     char *dropped_text, bool atomic_printing);
943b66638a0519 kernel/printk/printk.c John Ogness 2022-02-04  3184  

:::::: The code at line 3182 was first introduced by commit
:::::: 943b66638a0519612cdc25dcb07f59af89d37407 printk: add infrastucture for atomic consoles

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
