Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25ADF15A1;
	Sat, 10 Jun 2023 02:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686362405; x=1717898405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fWaQXUlpmMj44/Y6TdjzPczuAqj0157/goeGEhtFoYs=;
  b=mNs3lwjBCW2SHpWdWALIsw0CcGZSx0qxr9d5ojkRfLv96fsUy2rTb/4t
   YdGBvNr4cOonc3ndLYVKpWm8ueP+guBfWJfmFboTldYVMvEtEQhwkd8tf
   A5sjgWW3K4/u8/cO9+O8bIEGo/ptzJFYrauYWsL0k2/DpTSChLENRdavy
   GF9peYEhDYOZfZwWz0Bk3aAm4l0RBJvH5uuEBM6qnGAAyYy7wuaCGt5RI
   lwJzM1ewc48yr3cLQlObpnBnUs+wr1leXu6pVQNwwIxwHQOeoXCadLkh0
   wi5j/eSZdX8CSkfVsW7NPCH4Wvm8xEblUbFsgKzL6tJ14WDEvPmrrBEc0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338081498"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338081498"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 19:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="823260529"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="823260529"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 09 Jun 2023 19:00:02 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7ntZ-0009au-1O;
	Sat, 10 Jun 2023 02:00:01 +0000
Date: Sat, 10 Jun 2023 09:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [stable:linux-5.15.y 36/9999]
 drivers/media/dvb-frontends/mb86a16.c:1600:26: warning: stack frame size
 (1168) exceeds limit (1024) in 'mb86a16_search'
Message-ID: <202306100926.Svnvd4mx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   7349e40704a0209a2af8b37fa876322209de9684
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [36/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: riscv-randconfig-r012-20230608 (https://download.01.org/0day-ci/archive/20230610/202306100926.Svnvd4mx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=33db9912ff7c491f839c89a08e98f755aa09598f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 33db9912ff7c491f839c89a08e98f755aa09598f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/dvb-frontends/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306100926.Svnvd4mx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/dvb-frontends/mb86a16.c:1600:26: warning: stack frame size (1168) exceeds limit (1024) in 'mb86a16_search' [-Wframe-larger-than]
   static enum dvbfe_search mb86a16_search(struct dvb_frontend *fe)
                            ^
   1 warning generated.


vim +/mb86a16_search +1600 drivers/media/dvb-frontends/mb86a16.c

41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1599  
41da5320df6dec drivers/media/dvb/frontends/mb86a16.c Mauro Carvalho Chehab 2011-12-26 @1600  static enum dvbfe_search mb86a16_search(struct dvb_frontend *fe)
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1601  {
41da5320df6dec drivers/media/dvb/frontends/mb86a16.c Mauro Carvalho Chehab 2011-12-26  1602  	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1603  	struct mb86a16_state *state = fe->demodulator_priv;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1604  
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1605  	state->frequency = p->frequency / 1000;
41da5320df6dec drivers/media/dvb/frontends/mb86a16.c Mauro Carvalho Chehab 2011-12-26  1606  	state->srate = p->symbol_rate / 1000;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1607  
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-15  1608  	if (!mb86a16_set_fe(state)) {
25985edcedea63 drivers/media/dvb/frontends/mb86a16.c Lucas De Marchi       2011-03-30  1609  		dprintk(verbose, MB86A16_ERROR, 1, "Successfully acquired LOCK");
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-15  1610  		return DVBFE_ALGO_SEARCH_SUCCESS;
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-15  1611  	}
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1612  
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-15  1613  	dprintk(verbose, MB86A16_ERROR, 1, "Lock acquisition failed!");
5dd83a35bea908 drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-15  1614  	return DVBFE_ALGO_SEARCH_FAILED;
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1615  }
41e840b13e111b drivers/media/dvb/frontends/mb86a16.c Manu Abraham          2009-12-02  1616  

:::::: The code at line 1600 was first introduced by commit
:::::: 41da5320df6decec7efce0d936ccadfa9deb49d1 [media] dvb: don't pass a DVBv3 parameter for search() fops

:::::: TO: Mauro Carvalho Chehab <mchehab@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
