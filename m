Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC721874
	for <llvm@lists.linux.dev>; Tue, 17 May 2022 22:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652825406; x=1684361406;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vbFFq9LhJFEn4pEk5dzDidOQmscwoz2JxLyq+T5T4ZE=;
  b=UmVh0S0lkKAhYsNHuBLxNykhUUUCrWuurNOjp5BSP3/zrjHQvV+1AioX
   u9hBEYekmTT8AW+irj55HV1BAfXLhp0Hjf+Eytz+cTH+JU7KKltnvX+Yv
   n8LFJ18zlpcIcUgxRR78mWrKmDZ5jUdC8msIx/wKstyKZyE4wejVeH1oW
   ODsLt0j4PKywykjyhdLsjY31WVg74ggNANR8D+Hq3c9AbGENniYSettKR
   3wc2cpGmO3di7nOsZDmFB3AitmbQU7w+HYId5m9UYYylR5hpD37l1meVf
   LO5vQXH75Dw9OxjHwToiprDZN6Al3p5oYVDM5yPc857JIu595OtEl9xIP
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271044956"
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="271044956"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 15:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,233,1647327600"; 
   d="scan'208";a="545110402"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 May 2022 15:10:04 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nr5OG-0001Un-0m;
	Tue, 17 May 2022 22:10:04 +0000
Date: Wed, 18 May 2022 06:09:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Chen <suichen@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC Patch v5 1/1] i2c debug counters as sysfs attributes
Message-ID: <202205180640.LEuR1qW3-lkp@intel.com>
References: <20220517100505.2569874-2-suichen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517100505.2569874-2-suichen@google.com>

Hi Sui,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on wsa/i2c/for-next]
[also build test ERROR on linux/master linus/master v5.18-rc7 next-20220517]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Chen/i2c-core-Adapter-and-client-stats-as-sysfs-attributes/20220517-180857
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
config: hexagon-randconfig-r041-20220516 (https://download.01.org/0day-ci/archive/20220518/202205180640.LEuR1qW3-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2d26f1bca9ffcd15ddb7ab0bbb596cacd89712ca
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Sui-Chen/i2c-core-Adapter-and-client-stats-as-sysfs-attributes/20220517-180857
        git checkout 2d26f1bca9ffcd15ddb7ab0bbb596cacd89712ca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/i2c/i2c-core-base.c:280:6: warning: mixing declarations and code is incompatible with standards before C99 [-Wdeclaration-after-statement]
           int ret = adap->bus_recovery_info->recover_bus(adap);
               ^
>> drivers/i2c/i2c-core-base.c:910:9: warning: no previous prototype for function 'i2c_client_stats_messages_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_messages_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:910:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_messages_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
>> drivers/i2c/i2c-core-base.c:922:9: warning: no previous prototype for function 'i2c_client_stats_bus_errors_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_bus_errors_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:922:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_bus_errors_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
>> drivers/i2c/i2c-core-base.c:934:9: warning: no previous prototype for function 'i2c_client_stats_nacks_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_nacks_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:934:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_nacks_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
>> drivers/i2c/i2c-core-base.c:946:9: warning: no previous prototype for function 'i2c_client_stats_timeouts_show' [-Wmissing-prototypes]
   ssize_t i2c_client_stats_timeouts_show(struct kobject *kobj, struct kobj_attribute *addr,
           ^
   drivers/i2c/i2c-core-base.c:946:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t i2c_client_stats_timeouts_show(struct kobject *kobj, struct kobj_attribute *addr,
   ^
   static 
>> drivers/i2c/i2c-core-base.c:968:3: error: field designator 'default_attrs' does not refer to any field in type 'struct kobj_type'
           .default_attrs = i2c_client_stats_attrs,
            ^
>> drivers/i2c/i2c-core-base.c:1064:2: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
           kobject_init_and_add(&client_stats->kobj, &i2c_client_stats_ktype,
           ^~~~~~~~~~~~~~~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/i2c/i2c-core-base.c:2704:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ret, addr;
               ^
   drivers/i2c/i2c-core-base.c:2703:7: warning: unused variable 'buf' [-Wunused-variable]
           char buf[32];
                ^
   8 warnings and 1 error generated.


vim +968 drivers/i2c/i2c-core-base.c

   909	
 > 910	ssize_t i2c_client_stats_messages_show(struct kobject *kobj, struct kobj_attribute *addr,
   911					       char *buf)
   912	{
   913		return sysfs_emit(buf, "%llu\n",
   914			container_of(kobj, struct i2c_client_stats, kobj)->messages);
   915	}
   916	
   917	struct kobj_attribute i2c_client_stats_messages_attr = {
   918		.attr = { .name = "messages", .mode = 0444 },
   919		.show = i2c_client_stats_messages_show,
   920	};
   921	
 > 922	ssize_t i2c_client_stats_bus_errors_show(struct kobject *kobj, struct kobj_attribute *addr,
   923						 char *buf)
   924	{
   925		return sysfs_emit(buf, "%llu\n",
   926			container_of(kobj, struct i2c_client_stats, kobj)->bus_errors);
   927	}
   928	
   929	struct kobj_attribute i2c_client_stats_bus_errors_attr = {
   930		.attr = { .name = "bus_errors", .mode = 0444 },
   931		.show = i2c_client_stats_bus_errors_show,
   932	};
   933	
 > 934	ssize_t i2c_client_stats_nacks_show(struct kobject *kobj, struct kobj_attribute *addr,
   935					    char *buf)
   936	{
   937		return sysfs_emit(buf, "%llu\n",
   938			container_of(kobj, struct i2c_client_stats, kobj)->nacks);
   939	}
   940	
   941	struct kobj_attribute i2c_client_stats_nacks_attr = {
   942		.attr = { .name = "nacks", .mode = 0444 },
   943		.show = i2c_client_stats_nacks_show,
   944	};
   945	
 > 946	ssize_t i2c_client_stats_timeouts_show(struct kobject *kobj, struct kobj_attribute *addr,
   947					       char *buf)
   948	{
   949		return sysfs_emit(buf, "%llu\n",
   950			container_of(kobj, struct i2c_client_stats, kobj)->timeouts);
   951	}
   952	
   953	struct kobj_attribute i2c_client_stats_timeouts_attr = {
   954		.attr = { .name = "timeouts", .mode = 0444 },
   955		.show = i2c_client_stats_timeouts_show,
   956	};
   957	
   958	static struct attribute *i2c_client_stats_attrs[] = {
   959		&i2c_client_stats_messages_attr.attr,
   960		&i2c_client_stats_bus_errors_attr.attr,
   961		&i2c_client_stats_nacks_attr.attr,
   962		&i2c_client_stats_timeouts_attr.attr,
   963		NULL
   964	};
   965	
   966	static struct kobj_type i2c_client_stats_ktype = {
   967		.sysfs_ops = &kobj_sysfs_ops,
 > 968		.default_attrs = i2c_client_stats_attrs,
   969	};
   970	
   971	/**
   972	 * Functions for maintaining the adapter -> client stats lookup structure
   973	 */
   974	static struct i2c_client_stats *__get_i2c_client_stats(struct i2c_adapter_stats *stats,
   975							       int i2c_addr);
   976	static void __insert_i2c_client_stats(struct i2c_adapter_stats *stats,
   977					      struct i2c_client_stats *client_stats,
   978					      int i2c_addr);
   979	static void __remove_i2c_client_stats(struct i2c_adapter_stats *stats, int i2c_addr);
   980	static int __count_i2c_client_stats(struct i2c_adapter_stats *stats);
   981	
   982	/**
   983	 * i2c_new_client_device - instantiate an i2c device
   984	 * @adap: the adapter managing the device
   985	 * @info: describes one I2C device; bus_num is ignored
   986	 * Context: can sleep
   987	 *
   988	 * Create an i2c device. Binding is handled through driver model
   989	 * probe()/remove() methods.  A driver may be bound to this device when we
   990	 * return from this function, or any later moment (e.g. maybe hotplugging will
   991	 * load the driver module).  This call is not appropriate for use by mainboard
   992	 * initialization logic, which usually runs during an arch_initcall() long
   993	 * before any i2c_adapter could exist.
   994	 *
   995	 * This returns the new i2c client, which may be saved for later use with
   996	 * i2c_unregister_device(); or an ERR_PTR to describe the error.
   997	 */
   998	struct i2c_client *
   999	i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
  1000	{
  1001		struct i2c_client	*client;
  1002		int			status;
  1003		struct i2c_client_stats *client_stats;
  1004	
  1005		client = kzalloc(sizeof *client, GFP_KERNEL);
  1006		if (!client)
  1007			return ERR_PTR(-ENOMEM);
  1008	
  1009		client->adapter = adap;
  1010	
  1011		client->dev.platform_data = info->platform_data;
  1012		client->flags = info->flags;
  1013		client->addr = info->addr;
  1014	
  1015		client->init_irq = info->irq;
  1016		if (!client->init_irq)
  1017			client->init_irq = i2c_dev_irq_from_resources(info->resources,
  1018								 info->num_resources);
  1019	
  1020		strlcpy(client->name, info->type, sizeof(client->name));
  1021	
  1022		status = i2c_check_addr_validity(client->addr, client->flags);
  1023		if (status) {
  1024			dev_err(&adap->dev, "Invalid %d-bit I2C address 0x%02hx\n",
  1025				client->flags & I2C_CLIENT_TEN ? 10 : 7, client->addr);
  1026			goto out_err_silent;
  1027		}
  1028	
  1029		/* Check for address business */
  1030		status = i2c_check_addr_busy(adap, i2c_encode_flags_to_addr(client));
  1031		if (status)
  1032			goto out_err;
  1033	
  1034		client->dev.parent = &client->adapter->dev;
  1035		client->dev.bus = &i2c_bus_type;
  1036		client->dev.type = &i2c_client_type;
  1037		client->dev.of_node = of_node_get(info->of_node);
  1038		client->dev.fwnode = info->fwnode;
  1039	
  1040		device_enable_async_suspend(&client->dev);
  1041		i2c_dev_set_name(adap, client, info);
  1042	
  1043		if (info->swnode) {
  1044			status = device_add_software_node(&client->dev, info->swnode);
  1045			if (status) {
  1046				dev_err(&adap->dev,
  1047					"Failed to add software node to client %s: %d\n",
  1048					client->name, status);
  1049				goto out_err_put_of_node;
  1050			}
  1051		}
  1052	
  1053		status = device_register(&client->dev);
  1054		if (status)
  1055			goto out_remove_swnode;
  1056	
  1057		dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
  1058			client->name, dev_name(&client->dev));
  1059	
  1060		client_stats = kzalloc(sizeof(*client_stats), GFP_KERNEL);
  1061		client->stats = client_stats;
  1062		client_stats->address = info->addr;
  1063	
> 1064		kobject_init_and_add(&client_stats->kobj, &i2c_client_stats_ktype,
  1065				     &client->dev.kobj, "stats");
  1066	
  1067		if (!adap->stats)
  1068			i2c_adapter_create_stats_directory(adap);
  1069	
  1070		__insert_i2c_client_stats(adap->stats, client_stats, info->addr);
  1071		dev_info(&adap->dev, "Added i2c_client_stats, adapter has %d client stats now",
  1072			 __count_i2c_client_stats(adap->stats));
  1073	
  1074		return client;
  1075	
  1076	out_remove_swnode:
  1077		device_remove_software_node(&client->dev);
  1078	out_err_put_of_node:
  1079		of_node_put(info->of_node);
  1080	out_err:
  1081		dev_err(&adap->dev,
  1082			"Failed to register i2c client %s at 0x%02x (%d)\n",
  1083			client->name, client->addr, status);
  1084	out_err_silent:
  1085		kfree(client);
  1086		return ERR_PTR(status);
  1087	}
  1088	EXPORT_SYMBOL_GPL(i2c_new_client_device);
  1089	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
