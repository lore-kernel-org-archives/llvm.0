Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF9EC8A
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644873333; x=1676409333;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=J4hIJhQJ8TZDvy9vzDkIGG0PlmpGJ9AX3gMVhcbUmNE=;
  b=JZQGKIgYC6ekrl+0BDwvthDQo+K/ecU064ZBBXHdJAz4RJV5mdN2kcjk
   S3265z++jzqWEEB55Txg4X93SfsmaGTvkSFQDJCi0oy2ou5tlYu2+85Nj
   iRutdIBbsYM4GjbdS6/k4qi6PuCqLPgIMlEbdrUjGWuzuUcXr6m3y1ezM
   ZGvcGDhYuqLj5b778Se6u8+uZ2FUQDtm04r6UWXLn2o5VBachbFp9kZi0
   N18oRnPd+zUYsxAZbjHPNNgZJgK/KPvNnZGFoOiNenBaef8tEC09XZhH6
   U+EnwvKvNz5D4AZmliub9Ur8J0xjMsosbdN5GDW0WRlMAfLH1V9hJ2qtB
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="250391864"
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="250391864"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2022 13:15:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,368,1635231600"; 
   d="scan'208";a="587363375"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Feb 2022 13:15:19 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJigp-0008x4-8z; Mon, 14 Feb 2022 21:15:19 +0000
Date: Tue, 15 Feb 2022 05:15:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH V6] panic: Move panic_print before kmsg dumpers
Message-ID: <202202150534.l8er8722-lkp@intel.com>
References: <20220214141308.841525-1-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214141308.841525-1-gpiccoli@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Guilherme,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220214]
[cannot apply to linux/master linus/master v5.17-rc4 v5.17-rc3 v5.17-rc2 v5.17-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Guilherme-G-Piccoli/panic-Move-panic_print-before-kmsg-dumpers/20220214-221740
base:    259cbfc98c55ba3b6ef6e61fb7cfc3751dfded1e
config: i386-randconfig-a004-20220214 (https://download.01.org/0day-ci/archive/20220215/202202150534.l8er8722-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/b27c506d04cb0a186f4719397e43e3755e3dbe90
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Guilherme-G-Piccoli/panic-Move-panic_print-before-kmsg-dumpers/20220214-221740
        git checkout b27c506d04cb0a186f4719397e43e3755e3dbe90
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/panic.c:265:24: error: too few arguments to function call, single argument 'console_flush' was not specified
                   panic_print_sys_info();
                   ~~~~~~~~~~~~~~~~~~~~ ^
   kernel/panic.c:151:13: note: 'panic_print_sys_info' declared here
   static void panic_print_sys_info(bool console_flush)
               ^
   1 error generated.


vim +/console_flush +265 kernel/panic.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  252  
7d92bda271ddcb Douglas Anderson     2019-09-25  253  	/*
7d92bda271ddcb Douglas Anderson     2019-09-25  254  	 * If kgdb is enabled, give it a chance to run before we stop all
7d92bda271ddcb Douglas Anderson     2019-09-25  255  	 * the other CPUs or else we won't be able to debug processes left
7d92bda271ddcb Douglas Anderson     2019-09-25  256  	 * running on them.
7d92bda271ddcb Douglas Anderson     2019-09-25  257  	 */
7d92bda271ddcb Douglas Anderson     2019-09-25  258  	kgdb_panic(buf);
7d92bda271ddcb Douglas Anderson     2019-09-25  259  
a681283c7052f3 Guilherme G. Piccoli 2022-02-12  260  	/*
a681283c7052f3 Guilherme G. Piccoli 2022-02-12  261  	 * If we have a kdump kernel loaded, give a chance to panic_print
a681283c7052f3 Guilherme G. Piccoli 2022-02-12  262  	 * show some extra information on kernel log if it was set...
a681283c7052f3 Guilherme G. Piccoli 2022-02-12  263  	 */
a681283c7052f3 Guilherme G. Piccoli 2022-02-12  264  	if (kexec_crash_loaded())
a681283c7052f3 Guilherme G. Piccoli 2022-02-12 @265  		panic_print_sys_info();
a681283c7052f3 Guilherme G. Piccoli 2022-02-12  266  
dc009d92435f99 Eric W. Biederman    2005-06-25  267  	/*
dc009d92435f99 Eric W. Biederman    2005-06-25  268  	 * If we have crashed and we have a crash kernel loaded let it handle
dc009d92435f99 Eric W. Biederman    2005-06-25  269  	 * everything else.
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  270  	 * If we want to run this after calling panic_notifiers, pass
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  271  	 * the "crash_kexec_post_notifiers" option to the kernel.
7bbee5ca3896f6 Hidehiro Kawai       2015-12-14  272  	 *
7bbee5ca3896f6 Hidehiro Kawai       2015-12-14  273  	 * Bypass the panic_cpu check and call __crash_kexec directly.
dc009d92435f99 Eric W. Biederman    2005-06-25  274  	 */
b26e27ddfd2a98 Hidehiro Kawai       2016-08-02  275  	if (!_crash_kexec_post_notifiers) {
7bbee5ca3896f6 Hidehiro Kawai       2015-12-14  276  		__crash_kexec(NULL);
dc009d92435f99 Eric W. Biederman    2005-06-25  277  
dc009d92435f99 Eric W. Biederman    2005-06-25  278  		/*
dc009d92435f99 Eric W. Biederman    2005-06-25  279  		 * Note smp_send_stop is the usual smp shutdown function, which
0ee59413c967c3 Hidehiro Kawai       2016-10-11  280  		 * unfortunately means it may not be hardened to work in a
0ee59413c967c3 Hidehiro Kawai       2016-10-11  281  		 * panic situation.
dc009d92435f99 Eric W. Biederman    2005-06-25  282  		 */
^1da177e4c3f41 Linus Torvalds       2005-04-16  283  		smp_send_stop();
0ee59413c967c3 Hidehiro Kawai       2016-10-11  284  	} else {
0ee59413c967c3 Hidehiro Kawai       2016-10-11  285  		/*
0ee59413c967c3 Hidehiro Kawai       2016-10-11  286  		 * If we want to do crash dump after notifier calls and
0ee59413c967c3 Hidehiro Kawai       2016-10-11  287  		 * kmsg_dump, we will need architecture dependent extra
0ee59413c967c3 Hidehiro Kawai       2016-10-11  288  		 * works in addition to stopping other CPUs.
0ee59413c967c3 Hidehiro Kawai       2016-10-11  289  		 */
0ee59413c967c3 Hidehiro Kawai       2016-10-11  290  		crash_smp_send_stop();
0ee59413c967c3 Hidehiro Kawai       2016-10-11  291  	}
^1da177e4c3f41 Linus Torvalds       2005-04-16  292  
6723734cdff152 Kees Cook            2013-09-11  293  	/*
6723734cdff152 Kees Cook            2013-09-11  294  	 * Run any panic handlers, including those that might need to
6723734cdff152 Kees Cook            2013-09-11  295  	 * add information to the kmsg dump output.
6723734cdff152 Kees Cook            2013-09-11  296  	 */
e041c683412d5b Alan Stern           2006-03-27  297  	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
^1da177e4c3f41 Linus Torvalds       2005-04-16  298  
b27c506d04cb0a Guilherme G. Piccoli 2022-02-14  299  	panic_print_sys_info(false);
b27c506d04cb0a Guilherme G. Piccoli 2022-02-14  300  
6723734cdff152 Kees Cook            2013-09-11  301  	kmsg_dump(KMSG_DUMP_PANIC);
6723734cdff152 Kees Cook            2013-09-11  302  
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  303  	/*
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  304  	 * If you doubt kdump always works fine in any situation,
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  305  	 * "crash_kexec_post_notifiers" offers you a chance to run
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  306  	 * panic_notifiers and dumping kmsg before kdump.
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  307  	 * Note: since some panic_notifiers can make crashed kernel
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  308  	 * more unstable, it can increase risks of the kdump failure too.
7bbee5ca3896f6 Hidehiro Kawai       2015-12-14  309  	 *
7bbee5ca3896f6 Hidehiro Kawai       2015-12-14  310  	 * Bypass the panic_cpu check and call __crash_kexec directly.
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  311  	 */
b26e27ddfd2a98 Hidehiro Kawai       2016-08-02  312  	if (_crash_kexec_post_notifiers)
7bbee5ca3896f6 Hidehiro Kawai       2015-12-14  313  		__crash_kexec(NULL);
f06e5153f4ae2e Masami Hiramatsu     2014-06-06  314  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
