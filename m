Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8B929417;
	Mon,  6 Nov 2023 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/PHCboo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699293196; x=1730829196;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yFF6ajJagl/5Ex+71j1+0ayOaGeA4IKChZaeUz/c5PI=;
  b=N/PHCboo14FoSJotiGjBaedhd/mPKGOq/K4boomWHAnNR0upGWkffTpE
   R8aCM/DE+Tx6xkSMG8A0wwKSZ1p9ok2ch2JsldJlOpXZ/eGVfR2wzXpt2
   LGubl5FguYc3Rl2O++M9EE+q0//qb37Zvc4gIfKH/0jKVF8lKL8k8fYcH
   UAJ7i3X9yezK7xb4cnaOVWwMEQXHHrLKCf/jbCH3ZDw+BMIUR67/JZS11
   WJvqSBzezrw4hkcbvsXFb2DKaWwMA15l4aqDwIfmVTsbd5kSX0DjwxXEm
   0u+VtFMxJ2TVeXWuf9P8JLiEUD5SgFD+c4U32rzBxxDWZUqWNA+cUPOno
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="10875952"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="10875952"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 09:53:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="797383287"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="797383287"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Nov 2023 09:53:11 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r03mf-0006cm-28;
	Mon, 06 Nov 2023 17:53:09 +0000
Date: Tue, 7 Nov 2023 01:52:39 +0800
From: kernel test robot <lkp@intel.com>
To: Calvince Otieno <calvncce@gmail.com>, gustavo@embeddedor.com,
	outreachy@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vc04_services: remove empty functions
Message-ID: <202311070101.3sRlVl2Z-lkp@intel.com>
References: <ZTD677iqMkRPxT27@lab-ubuntu>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTD677iqMkRPxT27@lab-ubuntu>

Hi Calvince,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Calvince-Otieno/staging-vc04_services-remove-empty-functions/20231019-174823
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/ZTD677iqMkRPxT27%40lab-ubuntu
patch subject: [PATCH] staging: vc04_services: remove empty functions
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231107/202311070101.3sRlVl2Z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231107/202311070101.3sRlVl2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311070101.3sRlVl2Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:181:6: warning: no previous prototype for function 'vchiq_debugfs_add_instance' [-Wmissing-prototypes]
   void vchiq_debugfs_add_instance(struct vchiq_instance *instance)
        ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vchiq_debugfs_add_instance(struct vchiq_instance *instance)
   ^
   static 
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:198:6: warning: no previous prototype for function 'vchiq_debugfs_remove_instance' [-Wmissing-prototypes]
   void vchiq_debugfs_remove_instance(struct vchiq_instance *instance)
        ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vchiq_debugfs_remove_instance(struct vchiq_instance *instance)
   ^
   static 
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:206:6: warning: no previous prototype for function 'vchiq_debugfs_init' [-Wmissing-prototypes]
   void vchiq_debugfs_init(void)
        ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:206:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vchiq_debugfs_init(void)
   ^
   static 
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:224:6: warning: no previous prototype for function 'vchiq_debugfs_deinit' [-Wmissing-prototypes]
   void vchiq_debugfs_deinit(void)
        ^
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c:224:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void vchiq_debugfs_deinit(void)
   ^
   static 
   4 warnings generated.


vim +/vchiq_debugfs_add_instance +181 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_debugfs.c

71bad7f086419d popcornmix           2013-07-02  179  
71bad7f086419d popcornmix           2013-07-02  180  /* add an instance (process) to the debugfs entries */
4ddf9a2555caf2 Jamal Shareef        2019-11-05 @181  void vchiq_debugfs_add_instance(struct vchiq_instance *instance)
71bad7f086419d popcornmix           2013-07-02  182  {
71bad7f086419d popcornmix           2013-07-02  183  	char pidstr[16];
0723103f8ba15a Greg Kroah-Hartman   2018-06-01  184  	struct dentry *top;
71bad7f086419d popcornmix           2013-07-02  185  
71bad7f086419d popcornmix           2013-07-02  186  	snprintf(pidstr, sizeof(pidstr), "%d",
71bad7f086419d popcornmix           2013-07-02  187  		 vchiq_instance_get_pid(instance));
71bad7f086419d popcornmix           2013-07-02  188  
24e8d3fc42f259 Greg Kroah-Hartman   2018-06-01  189  	top = debugfs_create_dir(pidstr, vchiq_dbg_clients);
71bad7f086419d popcornmix           2013-07-02  190  
0723103f8ba15a Greg Kroah-Hartman   2018-06-01  191  	debugfs_create_file("use_count", 0444, top, instance,
71bad7f086419d popcornmix           2013-07-02  192  			    &debugfs_usecount_fops);
0723103f8ba15a Greg Kroah-Hartman   2018-06-01  193  	debugfs_create_file("trace", 0644, top, instance, &debugfs_trace_fops);
71bad7f086419d popcornmix           2013-07-02  194  
71bad7f086419d popcornmix           2013-07-02  195  	vchiq_instance_get_debugfs_node(instance)->dentry = top;
71bad7f086419d popcornmix           2013-07-02  196  }
71bad7f086419d popcornmix           2013-07-02  197  
4ddf9a2555caf2 Jamal Shareef        2019-11-05 @198  void vchiq_debugfs_remove_instance(struct vchiq_instance *instance)
71bad7f086419d popcornmix           2013-07-02  199  {
aa987e55132f78 Dominic Braun        2018-12-14  200  	struct vchiq_debugfs_node *node =
aa987e55132f78 Dominic Braun        2018-12-14  201  				vchiq_instance_get_debugfs_node(instance);
6e475350a40685 Yamanappagouda Patil 2017-02-21  202  
71bad7f086419d popcornmix           2013-07-02  203  	debugfs_remove_recursive(node->dentry);
71bad7f086419d popcornmix           2013-07-02  204  }
71bad7f086419d popcornmix           2013-07-02  205  
0723103f8ba15a Greg Kroah-Hartman   2018-06-01 @206  void vchiq_debugfs_init(void)
71bad7f086419d popcornmix           2013-07-02  207  {
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  208  	struct dentry *dir;
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  209  	int i;
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  210  
2739deaece4bc2 Greg Kroah-Hartman   2018-06-01  211  	vchiq_dbg_dir = debugfs_create_dir("vchiq", NULL);
24e8d3fc42f259 Greg Kroah-Hartman   2018-06-01  212  	vchiq_dbg_clients = debugfs_create_dir("clients", vchiq_dbg_dir);
71bad7f086419d popcornmix           2013-07-02  213  
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  214  	/* create an entry under <debugfs>/vchiq/log for each log category */
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  215  	dir = debugfs_create_dir("log", vchiq_dbg_dir);
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  216  
e1a17ce82f1808 Stefan Wahren        2022-01-23  217  	for (i = 0; i < ARRAY_SIZE(vchiq_debugfs_log_entries); i++)
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  218  		debugfs_create_file(vchiq_debugfs_log_entries[i].name, 0644,
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  219  				    dir, vchiq_debugfs_log_entries[i].plevel,
3b93c0f4b6accb Greg Kroah-Hartman   2018-06-01  220  				    &debugfs_log_fops);
71bad7f086419d popcornmix           2013-07-02  221  }
71bad7f086419d popcornmix           2013-07-02  222  
71bad7f086419d popcornmix           2013-07-02  223  /* remove all the debugfs entries */
71bad7f086419d popcornmix           2013-07-02 @224  void vchiq_debugfs_deinit(void)
71bad7f086419d popcornmix           2013-07-02  225  {
2739deaece4bc2 Greg Kroah-Hartman   2018-06-01  226  	debugfs_remove_recursive(vchiq_dbg_dir);
71bad7f086419d popcornmix           2013-07-02  227  }
71bad7f086419d popcornmix           2013-07-02  228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
