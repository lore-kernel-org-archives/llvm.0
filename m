Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB587C
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 17:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659633283; x=1691169283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9KuNnJt+M35u4eLm0hTGNHmV5vhmpjvlr8FIc4Wd8U=;
  b=l79JRAuruCczi0H3fVptz48T4R6z9ejinTWlRWztzb1DdoICAcp9sOf3
   ypRuBSQjWS3jU9yHQr1A+2pJZurdBkOcNsEwlnc+n5nCiUEZphOBP/Xsc
   Q2iaMw98uySx3135na45KMo66cpSbi5jShkkFO86/V8OClV4XYbojcybG
   HHiVAANKtNX2DlPOaCJ8ph4LzcAHSAO1kyAy20mYhH+EVa7XwCufqAn35
   qWGUM65B23vbphoddSzIs0rgLjJ8Qt2y4/LgHF58hqbkjWERWmhaHlq4+
   frfNiBdXHrE9quE3slt71lAtRrfDlZMjg/HghiK5+dXv9GYjgyJ+MIfgS
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10429"; a="290769595"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="290769595"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 10:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="553799237"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Aug 2022 10:14:28 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oJeQV-000Iep-34;
	Thu, 04 Aug 2022 17:14:27 +0000
Date: Fri, 5 Aug 2022 01:13:58 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/100-shutdown-notifier 4/20] kernel/reboot.c:527:
 warning: expecting prototype for devm_register_sys_off_handler(). Prototype
 was for register_sys_off_handler() instead
Message-ID: <202208050126.i7RtmCyo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/100-shutdown-notifier
head:   46a27d382539df38bc077d9b5222bc59c5419da3
commit: a3f4d076562a88f1b59fbb194befc2dd9766838b [4/20] kernel: Add combined power-off+restart handler call chain API
config: hexagon-randconfig-r045-20220804 (https://download.01.org/0day-ci/archive/20220805/202208050126.i7RtmCyo-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 26dd42705c2af0b8f6e5d6cdb32c9bd5ed9524eb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/a3f4d076562a88f1b59fbb194befc2dd9766838b
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/100-shutdown-notifier
        git checkout a3f4d076562a88f1b59fbb194befc2dd9766838b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/reboot.c:231: warning: Function parameter or member 'cmd' not described in 'do_kernel_restart'
>> kernel/reboot.c:527: warning: expecting prototype for devm_register_sys_off_handler(). Prototype was for register_sys_off_handler() instead
   kernel/reboot.c:1123: warning: Function parameter or member 'poweroff_delay_ms' not described in 'hw_failure_emergency_poweroff'


vim +527 kernel/reboot.c

   515	
   516	/**
   517	 *	devm_register_sys_off_handler - Register system power-off/restart handler
   518	 *	@dev: Device that registers handler
   519	 *	@handler: System-off handler
   520	 *
   521	 *	Registers handler that will be called as last step of the power-off
   522	 *	and restart sequences.
   523	 *
   524	 *	Returns zero on success, or error code on failure.
   525	 */
   526	int register_sys_off_handler(struct sys_off_handler *handler)
 > 527	{
   528		struct sys_off_handler_private_data *priv;
   529		int err, priority;
   530	
   531		priv = sys_off_handler_private_data(handler);
   532	
   533		/* sanity-check whether handler is registered twice */
   534		if (priv->registered)
   535			return -EBUSY;
   536	
   537		if (handler->power_off_cb || handler->power_off_prepare_cb) {
   538			if (handler->power_off_priority == POWEROFF_PRIO_RESERVED)
   539				priority = POWEROFF_PRIO_DEFAULT;
   540			else
   541				priority = handler->power_off_priority;
   542	
   543			priv->power_off_nb.notifier_call = sys_off_handler_power_off;
   544			priv->power_off_nb.priority = priority;
   545	
   546			err = register_power_off_handler(&priv->power_off_nb);
   547			if (err)
   548				goto reset_sys_off_handler;
   549		}
   550	
   551		if (handler->restart_cb) {
   552			if (handler->restart_priority == RESTART_PRIO_RESERVED)
   553				priority = RESTART_PRIO_DEFAULT;
   554			else
   555				priority = handler->restart_priority;
   556	
   557			priv->restart_nb.notifier_call = sys_off_handler_restart;
   558			priv->restart_nb.priority = priority;
   559	
   560			err = register_restart_handler(&priv->restart_nb);
   561			if (err)
   562				goto unreg_power_off_handler;
   563		}
   564	
   565		if (handler->reboot_prepare_cb) {
   566			priv->reboot_nb.notifier_call = sys_off_handler_reboot;
   567			priv->reboot_nb.priority = handler->reboot_priority;
   568	
   569			err = register_reboot_notifier(&priv->reboot_nb);
   570			if (err)
   571				goto unreg_restart_handler;
   572		}
   573	
   574		priv->registered = true;
   575	
   576		return 0;
   577	
   578	unreg_restart_handler:
   579		if (handler->restart_cb)
   580			unregister_restart_handler(&priv->restart_nb);
   581	
   582	unreg_power_off_handler:
   583		if (handler->power_off_cb)
   584			unregister_power_off_handler(&priv->power_off_nb);
   585	
   586	reset_sys_off_handler:
   587		memset(priv, 0, sizeof(*priv));
   588	
   589		return err;
   590	}
   591	EXPORT_SYMBOL(register_sys_off_handler);
   592	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
