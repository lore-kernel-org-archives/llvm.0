Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0E747E;
	Fri, 24 Mar 2023 16:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679673932; x=1711209932;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HttfvnyXCQqOkJU+j57yoRgMer8aan6GWP0q37AlsUI=;
  b=k4zi9gHXh8GCCrMNMXJFjJTfdMZqS6kseDyeebJOpRUsjLmbzGuuy7nN
   qEBpVKQ4W6ipZblCmPC9f2ncYYKCVNs0oNUTjEW52r/iqmGfCJibHp/FM
   8801h1NiNhYBHRqXPZuUi7X8oKByIwUSTGmRhexmHRBV3EOyQd6y2zc6N
   GOOtaSs3xicHz8jwUa4Hp8icBmsRBCj15XA473JIHXTcihmGe/kp1W1tf
   5rzuMG4jZfIauMulJkRw1jj1MzsyYbCG4ZFykFmEYoNpldhMM54G62Y4A
   7PG0Sot4BBwhmd7r/OWqudMnxJINy5wM0WYIpNVOi43kmn/pxaaghFvqc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="320210783"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="320210783"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 09:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="751943445"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="751943445"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 Mar 2023 09:04:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfjtt-000FRQ-0L;
	Fri, 24 Mar 2023 16:04:21 +0000
Date: Sat, 25 Mar 2023 00:03:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linyu Yuan <quic_linyyuan@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org, Linyu Yuan <quic_linyyuan@quicinc.com>
Subject: Re: [PATCH v2 1/3] usb: gadget: f_fs: remove ENTER() macro
Message-ID: <202303242317.aIQQrrX1-lkp@intel.com>
References: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679638227-20496-1-git-send-email-quic_linyyuan@quicinc.com>

Hi Linyu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v6.3-rc3 next-20230324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Linyu-Yuan/usb-gadget-f_fs-add-more-function-with-struct-ffs_data-ffs-parameter/20230324-141223
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1679638227-20496-1-git-send-email-quic_linyyuan%40quicinc.com
patch subject: [PATCH v2 1/3] usb: gadget: f_fs: remove ENTER() macro
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230324/202303242317.aIQQrrX1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f4623ea5e9a18bfb3e96bc6566afe46ebdefff33
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Linyu-Yuan/usb-gadget-f_fs-add-more-function-with-struct-ffs_data-ffs-parameter/20230324-141223
        git checkout f4623ea5e9a18bfb3e96bc6566afe46ebdefff33
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/usb/gadget/legacy/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303242317.aIQQrrX1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/legacy/g_ffs.c:183:2: error: implicit declaration of function 'ENTER' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ENTER();
           ^
   drivers/usb/gadget/legacy/g_ffs.c:245:2: error: implicit declaration of function 'ENTER' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ENTER();
           ^
   drivers/usb/gadget/legacy/g_ffs.c:319:2: error: implicit declaration of function 'ENTER' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ENTER();
           ^
   drivers/usb/gadget/legacy/g_ffs.c:448:2: error: implicit declaration of function 'ENTER' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ENTER();
           ^
   4 errors generated.


vim +/ENTER +183 drivers/usb/gadget/legacy/g_ffs.c

c6c560085172c1 drivers/usb/gadget/g_ffs.c Michal Nazarewicz     2010-05-05  176  
8545e6031a7196 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-03-12  177  static int __init gfs_init(void)
c6c560085172c1 drivers/usb/gadget/g_ffs.c Michal Nazarewicz     2010-05-05  178  {
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  179  	struct f_fs_opts *opts;
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  180  	int i;
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  181  	int ret = 0;
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  182  
c6c560085172c1 drivers/usb/gadget/g_ffs.c Michal Nazarewicz     2010-05-05 @183  	ENTER();
c6c560085172c1 drivers/usb/gadget/g_ffs.c Michal Nazarewicz     2010-05-05  184  
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  185  	if (func_num < 2) {
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  186  		gfs_single_func = true;
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  187  		func_num = 1;
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  188  	}
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  189  
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  190  	/*
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  191  	 * Allocate in one chunk for easier maintenance
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  192  	 */
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  193  	f_ffs[0] = kcalloc(func_num * N_CONF, sizeof(*f_ffs), GFP_KERNEL);
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  194  	if (!f_ffs[0]) {
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  195  		ret = -ENOMEM;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  196  		goto no_func;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  197  	}
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  198  	for (i = 1; i < N_CONF; ++i)
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  199  		f_ffs[i] = f_ffs[0] + i * func_num;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  200  
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  201  	fi_ffs = kcalloc(func_num, sizeof(*fi_ffs), GFP_KERNEL);
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  202  	if (!fi_ffs) {
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  203  		ret = -ENOMEM;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  204  		goto no_func;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  205  	}
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  206  
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  207  	for (i = 0; i < func_num; i++) {
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  208  		fi_ffs[i] = usb_get_function_instance("ffs");
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  209  		if (IS_ERR(fi_ffs[i])) {
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  210  			ret = PTR_ERR(fi_ffs[i]);
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  211  			--i;
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  212  			goto no_dev;
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  213  		}
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  214  		opts = to_f_fs_opts(fi_ffs[i]);
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  215  		if (gfs_single_func)
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  216  			ret = ffs_single_dev(opts->dev);
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  217  		else
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  218  			ret = ffs_name_dev(opts->dev, func_names[i]);
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  219  		if (ret)
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  220  			goto no_dev;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  221  		opts->dev->ffs_ready_callback = functionfs_ready_callback;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  222  		opts->dev->ffs_closed_callback = functionfs_closed_callback;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  223  		opts->dev->ffs_acquire_dev_callback = functionfs_acquire_dev;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  224  		opts->dev->ffs_release_dev_callback = functionfs_release_dev;
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  225  		opts->no_configfs = true;
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  226  	}
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  227  
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  228  	missing_funcs = func_num;
581791f5c7a480 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2012-05-14  229  
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  230  	return 0;
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  231  no_dev:
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  232  	while (i >= 0)
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  233  		usb_put_function_instance(fi_ffs[i--]);
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  234  	kfree(fi_ffs);
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  235  no_func:
6f823cd5305c78 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  236  	kfree(f_ffs[0]);
4b187fceec3c73 drivers/usb/gadget/g_ffs.c Andrzej Pietrasiewicz 2013-12-03  237  	return ret;
c6c560085172c1 drivers/usb/gadget/g_ffs.c Michal Nazarewicz     2010-05-05  238  }
c6c560085172c1 drivers/usb/gadget/g_ffs.c Michal Nazarewicz     2010-05-05  239  module_init(gfs_init);
c6c560085172c1 drivers/usb/gadget/g_ffs.c Michal Nazarewicz     2010-05-05  240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
