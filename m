Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066421360
	for <llvm@lists.linux.dev>; Thu, 24 Feb 2022 03:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645674246; x=1677210246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mv/gyykeu8IUzjNn/14ZbL5ZYye4y48GpdUnsID2quU=;
  b=YyHRIo/c7KEIWRe1PRiLREeuhOAPKsfPSoqAvt8N8zcJswfx6ZKOjhfM
   gjslnwx+gGPY7muye+mVFME8Dhw4E937qK6Xsfaicyomm4orxswTJGGib
   oZ7MvR3KseQWyDSrW/gS3J92qwLsTnu4D8ycCU81OQrTKZITg02ul+wpf
   TCAw9OdBa+jKJD3vsWxhJ0IIHhR3zEy/JiTyTukx24VCRCWqiNaPXPCkP
   YshvADDMMu1m8+Ta6XXUmML8bAY+SHMlux8dcig1hzUKSTl9Dt+SWE2Tz
   1ehZ1Ho6joHsAyJWuh9O7t4CjrrtNWRWmrjd6ZuHezEW6n4CfMTMMpuJp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="250970652"
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="250970652"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 19:44:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,392,1635231600"; 
   d="scan'208";a="628326426"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2022 19:44:01 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nN52u-0002CT-LY; Thu, 24 Feb 2022 03:44:00 +0000
Date: Thu, 24 Feb 2022 11:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1476/2340] kernel/power/wakelock.c:57:11:
 error: implicit declaration of function 'sysfs_emit_at'
Message-ID: <202202241133.jDlh5h9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   97c5eeb4de3ad324ed2a4656b46465299cfd010a
commit: b6a38a38fb2817f6575f45302405e6cfae374b4e [1476/2340] headers/deps: kobject: Use <linux/sysfs_types.h> in <linux/kobject.h>, remove <linux/sysfs.h> inclusion
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20220224/202202241133.jDlh5h9y-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=b6a38a38fb2817f6575f45302405e6cfae374b4e
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout b6a38a38fb2817f6575f45302405e6cfae374b4e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/sched/headers HEAD 97c5eeb4de3ad324ed2a4656b46465299cfd010a builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> kernel/power/wakelock.c:57:11: error: implicit declaration of function 'sysfs_emit_at' [-Werror,-Wimplicit-function-declaration]
                           len += sysfs_emit_at(buf, len, "%s ", wl->name);
                                  ^
   kernel/power/wakelock.c:60:9: error: implicit declaration of function 'sysfs_emit_at' [-Werror,-Wimplicit-function-declaration]
           len += sysfs_emit_at(buf, len, "\n");
                  ^
   2 errors generated.


vim +/sysfs_emit_at +57 kernel/power/wakelock.c

b86ff9820fd5df Rafael J. Wysocki  2012-04-29  45  
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  46  ssize_t pm_show_wakelocks(char *buf, bool show_active)
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  47  {
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  48  	struct rb_node *node;
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  49  	struct wakelock *wl;
c9d967b2ce40d7 Greg Kroah-Hartman 2022-01-13  50  	int len = 0;
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  51  
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  52  	mutex_lock(&wakelocks_lock);
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  53  
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  54  	for (node = rb_first(&wakelocks_tree); node; node = rb_next(node)) {
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  55  		wl = rb_entry(node, struct wakelock, node);
2434aea58e652a Tri Vo             2019-08-06  56  		if (wl->ws->active == show_active)
c9d967b2ce40d7 Greg Kroah-Hartman 2022-01-13 @57  			len += sysfs_emit_at(buf, len, "%s ", wl->name);
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  58  	}
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  59  
c9d967b2ce40d7 Greg Kroah-Hartman 2022-01-13  60  	len += sysfs_emit_at(buf, len, "\n");
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  61  
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  62  	mutex_unlock(&wakelocks_lock);
c9d967b2ce40d7 Greg Kroah-Hartman 2022-01-13  63  	return len;
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  64  }
b86ff9820fd5df Rafael J. Wysocki  2012-04-29  65  

:::::: The code at line 57 was first introduced by commit
:::::: c9d967b2ce40d71e968eb839f36c936b8a9cf1ea PM: wakeup: simplify the output logic of pm_show_wakelocks()

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
