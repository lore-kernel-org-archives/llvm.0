Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE3263BD;
	Thu,  3 Aug 2023 22:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691101556; x=1722637556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mJ6W9URh+8DKMfM06sE1vD68va+3oPToTrVe+MWStTw=;
  b=W2RfAA1lXtLgdwVBaP8o+XzVi5WDMGFLc0Fq1KFK59OegvaYxjSNbXga
   j02uLV5byuAhbmg7IofV8ssG2nQAQ7tvGbyHx4GOYBFjVSMEAehTXi3ZI
   r2h/bSHrwKyINeasxm9aXeJJOrjGJLP3FGqkmKnGCg4LbZGUcfTbjBc66
   asMT9RKOSa5ew+zzozpLgrBmchf4VAaAeO7ROwLp4yNmf69Gch4r/Mo9Q
   vInb6rDpgoZ3Aj4Xhghrqm7KfDeAYRa+7YIdYVFvEuRRv+vb/+mHCC+H3
   A//++p3kOYerfDyymC87scaSFu86PWnRMyecEDpSOpcSQ0THYn9qOoCx/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349601586"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="349601586"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 15:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="679647389"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="679647389"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 03 Aug 2023 15:25:52 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRglT-0002PH-0S;
	Thu, 03 Aug 2023 22:25:51 +0000
Date: Fri, 4 Aug 2023 06:25:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:ffa_v1.1_notif 9/13]
 drivers/firmware/arm_ffa/driver.c:976:9: error: call to undeclared function
 'acpi_register_gsi'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202308040652.qWlKWfEN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git ffa_v1.1_notif
head:   40e36d14dadfa296f30d2e2da01fa30de86166be
commit: 6fc3f0af1086ba56ba2811ab4bc44c09571b5386 [9/13] firmware: arm_ffa: Initial support for scheduler receiver interrupt
config: arm64-randconfig-r026-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040652.qWlKWfEN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040652.qWlKWfEN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040652.qWlKWfEN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/arm_ffa/driver.c:976:9: error: call to undeclared function 'acpi_register_gsi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     976 |                 irq = acpi_register_gsi(NULL, sr_intid, ACPI_EDGE_SENSITIVE,
         |                       ^
   1 error generated.


vim +/acpi_register_gsi +976 drivers/firmware/arm_ffa/driver.c

   950	
   951	static int ffa_sched_recv_irq_map(void)
   952	{
   953		int ret, irq, sr_intid;
   954	
   955		ret = ffa_features(FFA_FEAT_SCHEDULE_RECEIVER_INT, 0, &sr_intid, NULL);
   956		if (ret < 0) {
   957			if (ret != -EOPNOTSUPP)
   958				pr_err("Failed to retrieve scheduler Rx interrupt\n");
   959			return ret;
   960		}
   961	
   962		if (acpi_disabled) {
   963			struct of_phandle_args oirq = {};
   964			struct device_node *gic;
   965	
   966			gic = of_find_compatible_node(NULL, NULL, "arm,gic-v3");
   967			if (!gic)
   968				return -ENXIO;
   969	
   970			oirq.np = gic;
   971			oirq.args_count = 1;
   972			oirq.args[0] = sr_intid;
   973			irq = irq_create_of_mapping(&oirq);
   974			of_node_put(gic);
   975		} else {
 > 976			irq = acpi_register_gsi(NULL, sr_intid, ACPI_EDGE_SENSITIVE,
   977						ACPI_ACTIVE_HIGH);
   978		}
   979	
   980		if (irq <= 0) {
   981			pr_err("Failed to create IRQ mapping!\n");
   982			return -ENODATA;
   983		}
   984	
   985		return irq;
   986	}
   987	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
