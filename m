Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46E18F6D;
	Sun, 29 Sep 2024 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727621916; cv=none; b=uuWmtE2VOXtGcA3mddrJiqHOnKaKAxDwC8cwth/I+SVSlslB9aVSRhNwvQbQqP+cFFWq3JVvbFYEbblm/5KXI8c+iWNQNAxYfmhgfIs5WBRte3qeOamRHLJQ4sNOCP09JR1bgTplcIuHI75KVCsccHQXpJxqfOJPqJjHzefV63c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727621916; c=relaxed/simple;
	bh=EsvOCb8mouWgIp+t2D5j7SiNaCWqYYTwsbWe/Lk3+w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CQQMBaUiN9KG/YtObjhG3qm3Zs90NTrRTm4ZySGZl6kK6lTn97LBi9c2dAiQl+70cPUzjW9ewnl7bwamV7FVJyaJEEpwIlP/rVA9vHrzSg5QVEPKbr8GkpdPa7KcpunoubdgKcrWfP23MDpBZ2fDtbwS/gEL4gfLNbQPQ9LOp94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9v6Mlng; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9v6Mlng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727621915; x=1759157915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EsvOCb8mouWgIp+t2D5j7SiNaCWqYYTwsbWe/Lk3+w0=;
  b=b9v6MlngV+uwX/3BIPDdVSv4qQn/wyH1Ks5rXIFLEF3Md65jOGkTh/I6
   uhp4AZznWFjG2lHI25v/cfkYBdYxZmABLOemzz95CQuv3pcT+TRWYKNXE
   uRmVZaUtbPx3sOduAzE+1F1VytCdZsuBCF9VEbcak4zs+6aoT8XVnyq5T
   KbLXLdewNi1wm6Ia6WYaK5iEJLQ9jF+WNHE688HHP5Y2KDufz5bbrgLTL
   +HdP+uWqFCXQPU/7UsZzbWNO9vujcwb8c317olvujI/RMJGUKUul6Rudf
   c2RBTNb04eMe8D8O+PzNE+CWpg+o3sGPk2jHnJ+20xm5sXYJo8KJC1pjX
   A==;
X-CSE-ConnectionGUID: +VIssi3FQG+CzGDUGotlqg==
X-CSE-MsgGUID: lr5npcHEQhO1DsY7Vg4SPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26840094"
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="26840094"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 07:58:35 -0700
X-CSE-ConnectionGUID: q1WNjJDPSJK7ItJR4DWC3A==
X-CSE-MsgGUID: o9m6U9FKQbWZBnpsPJ/Zfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,163,1725346800"; 
   d="scan'208";a="96368322"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Sep 2024 07:58:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suvNW-000ONB-1u;
	Sun, 29 Sep 2024 14:58:30 +0000
Date: Sun, 29 Sep 2024 22:57:47 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Sa <nuno.sa@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nuno Sa <noname.nuno@gmail.com>
Subject: [nsa:b4/dev-adp5589-fw-conversion 7/14]
 drivers/input/keyboard/adp5589-keys.c:1000:13: warning: format specifies
 type 'size_t' (aka 'unsigned long') but the argument has type 'u32' (aka
 'unsigned int')
Message-ID: <202409292244.bec1fiwy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nunojsa/linux b4/dev-adp5589-fw-conversion
head:   d8f775093f32be0f662a6093041d941d372d4830
commit: b6abc9f63f6e47bc7ed2772edeb85381a0f5da67 [7/14] Input: adp5589-keys: add support for fw properties
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240929/202409292244.bec1fiwy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409292244.bec1fiwy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409292244.bec1fiwy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/keyboard/adp5589-keys.c:763:9: warning: implicit conversion from 'unsigned long' to 'int' changes value from 18446744073709551615 to -1 [-Wconstant-conversion]
     763 |         return INVALID_HWIRQ;
         |         ~~~~~~ ^~~~~~~~~~~~~
   include/linux/irq.h:1300:24: note: expanded from macro 'INVALID_HWIRQ'
    1300 | #define INVALID_HWIRQ   (~0UL)
         |                          ^~~~
   drivers/input/keyboard/adp5589-keys.c:970:30: error: no member named 'col_shift' in 'struct adp5589_info'
     970 |             BIT(col) << kpad->info->col_shift & kpad->keypad_en_mask)
         |                         ~~~~~~~~~~  ^
>> drivers/input/keyboard/adp5589-keys.c:1000:13: warning: format specifies type 'size_t' (aka 'unsigned long') but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
     999 |                 dev_err(&client->dev, "Invalid number of keys(%u > %zu) for %s\n",
         |                                                                    ~~~
         |                                                                    %u
    1000 |                         *n_keys, max_keys, prop);
         |                                  ^~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   2 warnings and 1 error generated.


vim +1000 drivers/input/keyboard/adp5589-keys.c

   978	
   979	static int adp5589_parse_key_array(struct adp5589_kpad *kpad, const char *prop,
   980					   u32 *keys, u32 *n_keys, u32 max_keys,
   981					   bool reset_key)
   982	{
   983		struct i2c_client *client = kpad->client;
   984		unsigned int key, max_keypad;
   985		int ret;
   986	
   987		ret = device_property_count_u32(&client->dev, prop);
   988		if (ret < 0)
   989			return 0;
   990	
   991		*n_keys = ret;
   992	
   993		if (kpad->info->is_adp5585 && !reset_key) {
   994			dev_err(&client->dev, "Unlock keys not supported for adp5585\n");
   995			return -EOPNOTSUPP;
   996		}
   997	
   998		if (*n_keys  > max_keys) {
   999			dev_err(&client->dev, "Invalid number of keys(%u > %zu) for %s\n",
> 1000				*n_keys, max_keys, prop);
  1001			return -EINVAL;
  1002		}
  1003	
  1004		ret = device_property_read_u32_array(&client->dev, prop, keys, *n_keys);
  1005		if (ret)
  1006			return ret;
  1007	
  1008		max_keypad = (kpad->info->var->max_row_num + 1) * (kpad->info->var->max_col_num + 1);
  1009	
  1010		for (key = 0; key < *n_keys; key++) {
  1011			/* part of the keypad... */
  1012			if (in_range(keys[key], 1, max_keypad)) {
  1013				/* is it part of the keypad?! */
  1014				ret = adp5589_validate_key(kpad, keys[key], false);
  1015				if (ret)
  1016					return ret;
  1017	
  1018				continue;
  1019			}
  1020	
  1021			/* part of gpio-keys... */
  1022			if (in_range(keys[key], kpad->info->var->gpi_pin_base,
  1023				     kpad->info->var->maxgpio)) {
  1024				/* is the GPI being used as part of the keypad?! */
  1025				ret = adp5589_validate_key(kpad, keys[key], true);
  1026				if (ret)
  1027					return ret;
  1028	
  1029				continue;
  1030			}
  1031	
  1032			/* wildcard unlock event... */
  1033			if (!reset_key && keys[key] == 127)
  1034				continue;
  1035	
  1036			dev_err(&client->dev, "Invalid key(%u) for %s\n", keys[key],
  1037				prop);
  1038	
  1039			return -EINVAL;
  1040		}
  1041	
  1042		return 0;
  1043	}
  1044	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
