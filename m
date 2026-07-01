Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02234D93C;
	Wed,  1 Jul 2026 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782945915; cv=none; b=OCR1aWpnwn16NrhaUa5yaGkrMKNyOV2QX96x5ECg0aYXNlET6x/Pdxu9FBnvjiWK+cBK4CmmH12bf6tHS8ZcZoet9j+zJDnTh5O2wDo+8JIUukJQ8Hrh7VgHGBPO4/T56wSqZIFGZG+0NL5eObW/uLQRRPhj2jdtpmlRRxANwlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782945915; c=relaxed/simple;
	bh=kADgQX2eGAt64r/MvidfUMnPw/8Re/0iSpvJIkRlKeE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MxytpOEzASfPaIe0oEIfLLJ+YDnMaxe7QAcGCDBQadLPHtDTvLMgD0brZ+L35Vd23CTtwgIGV9fyQxK1VtJjtuePbhOhyy4/SfKA0oqKXPaSRwvi1qcSAk32WW6bHncM+IWuBhOfIujgzZJVmraPY0nuHzSyacm39P5R4QPmRRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpeCtXub; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpeCtXub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782945913; x=1814481913;
  h=date:from:to:cc:subject:message-id;
  bh=kADgQX2eGAt64r/MvidfUMnPw/8Re/0iSpvJIkRlKeE=;
  b=lpeCtXubTcil7NByaQ7pV129c66OxStM5krRrGRm8ux6NjRV/eZ3ie8w
   6HUjpkSOwKkx/zTdy4/MtCWY4bPio1fWIVGD2n/nvxhsKYbifS60VRuxd
   d68mJHzyfE5Bvd0NUPqSiVxyVmkqD9hF6GFboeTXX1IR7ShmiueFLhnle
   g1wyKPN0848anqa/ltwNymuSol5lKma/VFj7f7AbIZh2FwXT5oi67VfZB
   kOutPMjodLhaE3tHTUAWPEd/TMaJJ1loa0QfmpYqu9p92tqhWONpjzTyI
   OFS8PYj/Lqoc607+AnaZaFn9lgZp7ooSevGKpZKtOOgXhKe709K7ocBMy
   Q==;
X-CSE-ConnectionGUID: hgztwqd3QFiU1VH9mWuJRw==
X-CSE-MsgGUID: bXdH+9ZJQfq70BB5IbNVCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83742469"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83742469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 15:45:13 -0700
X-CSE-ConnectionGUID: 5+GyF86/TsiHqGQHc2oWuA==
X-CSE-MsgGUID: 7p1R1H43Qqux+/JvCC9kpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="246334186"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Jul 2026 15:45:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf3fr-000000009h5-1nL3;
	Wed, 01 Jul 2026 22:45:07 +0000
Date: Thu, 02 Jul 2026 06:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/acpi_scmi_pcc 19/23]
 drivers/firmware/arm_scmi/driver.c:3072:18: error: call to undeclared
 function 'acpi_device_hid'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607020623.psaiEySG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/acpi_scmi_pcc
head:   bdcaa5728f17002c1091efd93dd082c9c23ddd39
commit: f17b84ab4e8011a39adfbbf053b2cac4433e6918 [19/23] firmware: arm_scmi: Fall back to ACPI HID when "compatible" is absent
config: i386-buildonly-randconfig-004-20260702 (https://download.01.org/0day-ci/archive/20260702/202607020623.psaiEySG-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607020623.psaiEySG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607020623.psaiEySG-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/driver.c:3072:18: error: call to undeclared function 'acpi_device_hid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3072 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                                ^
   drivers/firmware/arm_scmi/driver.c:3072:18: note: did you mean 'acpi_device_handle'?
   include/linux/acpi.h:896:27: note: 'acpi_device_handle' declared here
     896 | static inline acpi_handle acpi_device_handle(struct acpi_device *adev)
         |                           ^
>> drivers/firmware/arm_scmi/driver.c:3072:16: warning: pointer/integer type mismatch in conditional expression ('int' and 'char *') [-Wconditional-type-mismatch]
    3072 |                 c_ptr = adev ? acpi_device_hid(adev) : "unknown";
         |                              ^ ~~~~~~~~~~~~~~~~~~~~~   ~~~~~~~~~
   1 warning and 1 error generated.


vim +/acpi_device_hid +3072 drivers/firmware/arm_scmi/driver.c

  3050	
  3051	static struct scmi_debug_info *scmi_debugfs_common_setup(struct scmi_info *info)
  3052	{
  3053		char top_dir[16];
  3054		struct dentry *trans, *top_dentry;
  3055		struct scmi_debug_info *dbg;
  3056		struct acpi_device *adev;
  3057		const char *c_ptr = NULL;
  3058	
  3059		dbg = devm_kzalloc(info->dev, sizeof(*dbg), GFP_KERNEL);
  3060		if (!dbg)
  3061			return NULL;
  3062	
  3063		dbg->name = kstrdup(fwnode_get_name(dev_fwnode(info->dev)), GFP_KERNEL);
  3064		if (!dbg->name) {
  3065			devm_kfree(info->dev, dbg);
  3066			return NULL;
  3067		}
  3068	
  3069		if (fwnode_property_read_string(dev_fwnode(info->dev), "compatible",
  3070						&c_ptr)) {
  3071			adev = ACPI_COMPANION(info->dev);
> 3072			c_ptr = adev ? acpi_device_hid(adev) : "unknown";
  3073		}
  3074		dbg->type = kstrdup(c_ptr, GFP_KERNEL);
  3075		if (!dbg->type) {
  3076			kfree(dbg->name);
  3077			devm_kfree(info->dev, dbg);
  3078			return NULL;
  3079		}
  3080	
  3081		snprintf(top_dir, 16, "%d", info->id);
  3082		top_dentry = debugfs_create_dir(top_dir, scmi_top_dentry);
  3083		trans = debugfs_create_dir("transport", top_dentry);
  3084	
  3085		dbg->is_atomic = info->desc->atomic_enabled &&
  3086					is_transport_polling_capable(info->desc);
  3087	
  3088		debugfs_create_str("instance_name", 0400, top_dentry,
  3089				   (char **)&dbg->name);
  3090	
  3091		debugfs_create_u32("atomic_threshold_us", 0400, top_dentry,
  3092				   (u32 *)&info->desc->atomic_threshold);
  3093	
  3094		debugfs_create_str("type", 0400, trans, (char **)&dbg->type);
  3095	
  3096		debugfs_create_bool("is_atomic", 0400, trans, &dbg->is_atomic);
  3097	
  3098		debugfs_create_u32("max_rx_timeout_ms", 0400, trans,
  3099				   (u32 *)&info->desc->max_rx_timeout_ms);
  3100	
  3101		debugfs_create_u32("max_msg_size", 0400, trans,
  3102				   (u32 *)&info->desc->max_msg_size);
  3103	
  3104		debugfs_create_u32("tx_max_msg", 0400, trans,
  3105				   (u32 *)&info->tx_minfo.max_msg);
  3106	
  3107		debugfs_create_u32("rx_max_msg", 0400, trans,
  3108				   (u32 *)&info->rx_minfo.max_msg);
  3109	
  3110		if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
  3111			scmi_debugfs_counters_setup(dbg, trans);
  3112	
  3113		dbg->top_dentry = top_dentry;
  3114	
  3115		if (devm_add_action_or_reset(info->dev,
  3116					     scmi_debugfs_common_cleanup, dbg))
  3117			return NULL;
  3118	
  3119		return dbg;
  3120	}
  3121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
