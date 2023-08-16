Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF81125B2;
	Wed, 16 Aug 2023 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692221817; x=1723757817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GLrep3zWAWecLxnVrj+0zBevg0yD7puWrAAY6DqkJE=;
  b=c7l/nWNOnCsbd/tJr1juRbBWxMgCgMQmKdTmHKAIsRih8hTzVmX+3r3p
   Mpny853mNoPAqRe0lREumNa+u9ztMCDkNTGj9u9kyYIPChBs2JqCllAmp
   nD4DxEahsVF+eGOKst1miafFSDrsRY6PADQAbuC1GoPhW+6KbMyreDpsI
   tQoZT74k3+mnHaS4Eof0BUf8Kz//30VGe8E0iwo11Lk5PD1eguZ2SaN2p
   abk9Z3wNiMZm9PKdNws9BSXRyFHSpWTxeqxEcnEXmx1z9F+iiw4HgKlMe
   RGTDy4q8djdU5zzAyfVe2ExCm9xYKAwdqB7gbBLpiAM351iIkEqOwSosa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="436545591"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="436545591"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 14:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848636602"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="848636602"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2023 14:36:55 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWOCE-0000aU-36;
	Wed, 16 Aug 2023 21:36:54 +0000
Date: Thu, 17 Aug 2023 05:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.5-rc1 138/148] fs/resctrl/rdtgroup.c:850:17:
 error: call to undeclared function 'iommu_get_group_kset'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202308170557.Eohc79zL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.5-rc1
head:   3feae02a8f8cf9aca5d7d1915ea1e026c9d3d8ec
commit: 9e9af35cd8e4b32e9ccba2fa49c1ce600b3066b8 [138/148] fs/resctrl: Add support for assigning iommu_groups to resctrl groups
config: x86_64-randconfig-x013-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170557.Eohc79zL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170557.Eohc79zL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170557.Eohc79zL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/resctrl/rdtgroup.c:850:17: error: call to undeclared function 'iommu_get_group_kset'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           iommu_groups = iommu_get_group_kset();
                          ^
   fs/resctrl/rdtgroup.c:850:17: note: did you mean 'iommu_group_get'?
   include/linux/iommu.h:919:35: note: 'iommu_group_get' declared here
   static inline struct iommu_group *iommu_group_get(struct device *dev)
                                     ^
>> fs/resctrl/rdtgroup.c:850:15: error: incompatible integer to pointer conversion assigning to 'struct kset *' from 'int' [-Wint-conversion]
           iommu_groups = iommu_get_group_kset();
                        ^ ~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/iommu_get_group_kset +850 fs/resctrl/rdtgroup.c

   839	
   840	static void show_rdt_iommu(struct rdtgroup *r, struct seq_file *s)
   841	{
   842		struct kset *iommu_groups;
   843		struct iommu_group *group;
   844		struct kobject *group_kobj = NULL;
   845	
   846		if (!IS_ENABLED(CONFIG_RESCTRL_IOMMU) ||
   847		    !static_branch_unlikely(&resctrl_abi_playground))
   848			return;
   849	
 > 850		iommu_groups = iommu_get_group_kset();
   851	
   852		while ((group_kobj = kset_get_next_obj(iommu_groups, group_kobj))) {
   853	
   854			/* iommu_group_get_from_kobj() wants to drop a reference */
   855			kobject_get(group_kobj);
   856	
   857			group = iommu_group_get_from_kobj(group_kobj);
   858			if (!group)
   859				continue;
   860	
   861			if (iommu_matches_rdtgroup(group, r))
   862				seq_printf(s, "iommu_group:%s\n", group_kobj->name);
   863		}
   864	
   865		kset_put(iommu_groups);
   866	}
   867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
