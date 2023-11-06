Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B637E;
	Mon,  6 Nov 2023 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbXYJILz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699230192; x=1730766192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SuxuOKq7R0oQGY9uV/zrwBnahJeB2j4Sa9mqfnZ+Wnw=;
  b=IbXYJILzdFwG/bVV93vC76sr6HwwkB4ycYHn7IoViND2NPQsBV7wseGT
   LXdA0Zi/w8GgXTU9UiO9th7/5BNRGFlF5iKiR29/MwJVat5SJymG9wHu5
   bv5sJpZ3CVGeTCpY22cWuGPthDlwxjX4Wq3ROqyYSkWuqzvGuGmr3pYQ+
   iKsLjjm0aamrUQN/WQBxZDW/uyaGSMnHNuixdbum9PdjJQ6e7NrKaBUUr
   Pekn+pshEzv03Ktb7etv9kmaQGNHj7CwkLd8PTJemh0Qsu7Qp6D0zEKP9
   ap8x8AAZhnuqsqYa1LF1D5+uvQQyr1a3CG8VJexCdOD/ulbAMLMfbTE/5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="453495157"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="453495157"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 16:23:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="832565019"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="832565019"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Nov 2023 16:23:06 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qznOT-0005ul-0d;
	Mon, 06 Nov 2023 00:23:05 +0000
Date: Mon, 6 Nov 2023 08:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] PM / devfreq: introduce multiple devfreq devices per
 parent device
Message-ID: <202311060707.wCZVoRvK-lkp@intel.com>
References: <20231017211944.192978-1-rodrigo.vivi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231017211944.192978-1-rodrigo.vivi@intel.com>

Hi Rodrigo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.6-rc6]
[also build test WARNING on linus/master next-20231103]
[cannot apply to chanwoo/devfreq-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rodrigo-Vivi/PM-devfreq-introduce-multiple-devfreq-devices-per-parent-device/20231018-052140
base:   v6.6-rc6
patch link:    https://lore.kernel.org/r/20231017211944.192978-1-rodrigo.vivi%40intel.com
patch subject: [RFC PATCH] PM / devfreq: introduce multiple devfreq devices per parent device
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231106/202311060707.wCZVoRvK-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060707.wCZVoRvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311060707.wCZVoRvK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/devfreq/devfreq.c:805:6: warning: variable 'devfreq' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (id < 0) {
               ^~~~~~
   drivers/devfreq/devfreq.c:981:24: note: uninitialized use occurs here
           devfreq_remove_device(devfreq);
                                 ^~~~~~~
   drivers/devfreq/devfreq.c:805:2: note: remove the 'if' if its condition is always false
           if (id < 0) {
           ^~~~~~~~~~~~~
   drivers/devfreq/devfreq.c:794:25: note: initialize the variable 'devfreq' to silence this warning
           struct devfreq *devfreq;
                                  ^
                                   = NULL
   1 warning generated.


vim +805 drivers/devfreq/devfreq.c

   776	
   777	static void create_sysfs_files(struct devfreq *devfreq,
   778					const struct devfreq_governor *gov);
   779	static void remove_sysfs_files(struct devfreq *devfreq,
   780					const struct devfreq_governor *gov);
   781	
   782	/**
   783	 * devfreq_add_device() - Add devfreq feature to the device
   784	 * @dev:	the device to add devfreq feature.
   785	 * @profile:	device-specific profile to run devfreq.
   786	 * @governor_name:	name of the policy to choose frequency.
   787	 * @data:	devfreq driver pass to governors, governor should not change it.
   788	 */
   789	struct devfreq *devfreq_add_device(struct device *dev,
   790					   struct devfreq_dev_profile *profile,
   791					   const char *governor_name,
   792					   void *data)
   793	{
   794		struct devfreq *devfreq;
   795		struct devfreq_governor *governor;
   796		unsigned long min_freq, max_freq;
   797		int id, err = 0;
   798	
   799		if (!dev || !profile || !governor_name) {
   800			dev_err(dev, "%s: Invalid parameters.\n", __func__);
   801			return ERR_PTR(-EINVAL);
   802		}
   803	
   804		id = ida_alloc(&devfreq_ida, GFP_KERNEL);
 > 805		if (id < 0) {
   806		        err = -ENOMEM;
   807			goto err_ida;
   808		}
   809	
   810		mutex_lock(&devfreq_list_lock);
   811		devfreq = find_device_devfreq(dev);
   812		mutex_unlock(&devfreq_list_lock);
   813		if (!IS_ERR(devfreq) &&
   814		    (!profile->name ||
   815		     (profile->name && devfreq->profile->name &&
   816		      !strcmp(profile->name, devfreq->profile->name)))) {
   817			dev_err(dev, "%s: devfreq device already exists!\n",
   818				__func__);
   819			err = -EINVAL;
   820			goto err_out;
   821		}
   822	
   823		devfreq = kzalloc(sizeof(struct devfreq), GFP_KERNEL);
   824		if (!devfreq) {
   825			err = -ENOMEM;
   826			goto err_out;
   827		}
   828	
   829		mutex_init(&devfreq->lock);
   830		mutex_lock(&devfreq->lock);
   831		devfreq->dev.parent = dev;
   832		devfreq->dev.class = devfreq_class;
   833		devfreq->dev.release = devfreq_dev_release;
   834		INIT_LIST_HEAD(&devfreq->node);
   835		devfreq->profile = profile;
   836		devfreq->previous_freq = profile->initial_freq;
   837		devfreq->last_status.current_frequency = profile->initial_freq;
   838		devfreq->data = data;
   839		devfreq->nb.notifier_call = devfreq_notifier_call;
   840	
   841		if (devfreq->profile->timer < 0
   842			|| devfreq->profile->timer >= DEVFREQ_TIMER_NUM) {
   843			mutex_unlock(&devfreq->lock);
   844			err = -EINVAL;
   845			goto err_dev;
   846		}
   847	
   848		if (!devfreq->profile->max_state || !devfreq->profile->freq_table) {
   849			mutex_unlock(&devfreq->lock);
   850			err = set_freq_table(devfreq);
   851			if (err < 0)
   852				goto err_dev;
   853			mutex_lock(&devfreq->lock);
   854		} else {
   855			devfreq->freq_table = devfreq->profile->freq_table;
   856			devfreq->max_state = devfreq->profile->max_state;
   857		}
   858	
   859		devfreq->scaling_min_freq = find_available_min_freq(devfreq);
   860		if (!devfreq->scaling_min_freq) {
   861			mutex_unlock(&devfreq->lock);
   862			err = -EINVAL;
   863			goto err_dev;
   864		}
   865	
   866		devfreq->scaling_max_freq = find_available_max_freq(devfreq);
   867		if (!devfreq->scaling_max_freq) {
   868			mutex_unlock(&devfreq->lock);
   869			err = -EINVAL;
   870			goto err_dev;
   871		}
   872	
   873		devfreq_get_freq_range(devfreq, &min_freq, &max_freq);
   874	
   875		devfreq->suspend_freq = dev_pm_opp_get_suspend_opp_freq(dev);
   876		devfreq->opp_table = dev_pm_opp_get_opp_table(dev);
   877		if (IS_ERR(devfreq->opp_table))
   878			devfreq->opp_table = NULL;
   879	
   880		atomic_set(&devfreq->suspend_count, 0);
   881	
   882		if (profile->name)
   883			dev_set_name(&devfreq->dev, "df%d", id);
   884		else
   885			dev_set_name(&devfreq->dev, "%s", dev_name(dev));
   886		err = device_register(&devfreq->dev);
   887		if (err) {
   888			mutex_unlock(&devfreq->lock);
   889			put_device(&devfreq->dev);
   890			goto err_out;
   891		}
   892	
   893		devfreq->stats.trans_table = devm_kzalloc(&devfreq->dev,
   894				array3_size(sizeof(unsigned int),
   895					    devfreq->max_state,
   896					    devfreq->max_state),
   897				GFP_KERNEL);
   898		if (!devfreq->stats.trans_table) {
   899			mutex_unlock(&devfreq->lock);
   900			err = -ENOMEM;
   901			goto err_devfreq;
   902		}
   903	
   904		devfreq->stats.time_in_state = devm_kcalloc(&devfreq->dev,
   905				devfreq->max_state,
   906				sizeof(*devfreq->stats.time_in_state),
   907				GFP_KERNEL);
   908		if (!devfreq->stats.time_in_state) {
   909			mutex_unlock(&devfreq->lock);
   910			err = -ENOMEM;
   911			goto err_devfreq;
   912		}
   913	
   914		devfreq->stats.total_trans = 0;
   915		devfreq->stats.last_update = get_jiffies_64();
   916	
   917		srcu_init_notifier_head(&devfreq->transition_notifier_list);
   918	
   919		mutex_unlock(&devfreq->lock);
   920	
   921		err = dev_pm_qos_add_request(dev, &devfreq->user_min_freq_req,
   922					     DEV_PM_QOS_MIN_FREQUENCY, 0);
   923		if (err < 0)
   924			goto err_devfreq;
   925		err = dev_pm_qos_add_request(dev, &devfreq->user_max_freq_req,
   926					     DEV_PM_QOS_MAX_FREQUENCY,
   927					     PM_QOS_MAX_FREQUENCY_DEFAULT_VALUE);
   928		if (err < 0)
   929			goto err_devfreq;
   930	
   931		devfreq->nb_min.notifier_call = qos_min_notifier_call;
   932		err = dev_pm_qos_add_notifier(dev, &devfreq->nb_min,
   933					      DEV_PM_QOS_MIN_FREQUENCY);
   934		if (err)
   935			goto err_devfreq;
   936	
   937		devfreq->nb_max.notifier_call = qos_max_notifier_call;
   938		err = dev_pm_qos_add_notifier(dev, &devfreq->nb_max,
   939					      DEV_PM_QOS_MAX_FREQUENCY);
   940		if (err)
   941			goto err_devfreq;
   942	
   943		mutex_lock(&devfreq_list_lock);
   944	
   945		governor = try_then_request_governor(governor_name);
   946		if (IS_ERR(governor)) {
   947			dev_err(dev, "%s: Unable to find governor for the device\n",
   948				__func__);
   949			err = PTR_ERR(governor);
   950			goto err_init;
   951		}
   952	
   953		devfreq->governor = governor;
   954		err = devfreq->governor->event_handler(devfreq, DEVFREQ_GOV_START,
   955							NULL);
   956		if (err) {
   957			dev_err_probe(dev, err,
   958				"%s: Unable to start governor for the device\n",
   959				 __func__);
   960			goto err_init;
   961		}
   962		create_sysfs_files(devfreq, devfreq->governor);
   963	
   964		list_add(&devfreq->node, &devfreq_list);
   965	
   966		mutex_unlock(&devfreq_list_lock);
   967	
   968		if (devfreq->profile->is_cooling_device) {
   969			devfreq->cdev = devfreq_cooling_em_register(devfreq, NULL);
   970			if (IS_ERR(devfreq->cdev))
   971				devfreq->cdev = NULL;
   972		}
   973	
   974		return devfreq;
   975	
   976	err_ida:
   977		ida_free(&devfreq_ida, id);
   978	err_init:
   979		mutex_unlock(&devfreq_list_lock);
   980	err_devfreq:
   981		devfreq_remove_device(devfreq);
   982		devfreq = NULL;
   983	err_dev:
   984		kfree(devfreq);
   985	err_out:
   986		return ERR_PTR(err);
   987	}
   988	EXPORT_SYMBOL(devfreq_add_device);
   989	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
