Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31E71400E;
	Thu,  7 Sep 2023 20:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694118516; x=1725654516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BB+LQdugJZ7GbL9afXRYDqv7rBUtA0qIbYwIhow0bK0=;
  b=UpgwkilhiRozgUEcQGv2ONXDOML4H+P2kc61th9Cd1HEzCs18uOodL9u
   zCKQxFlR3iQMrrlqzYq/CcWDENELKd+mFFPq5e74Wf7sk/V+htkkPfHCj
   9VuoeBRANnNWGDhUkXgtdYbdjZLiPFa8MeJfz2UzyeXg3RHA1oxV7eXS8
   xx1I8LXcJjy7i5XxVB8+LT4EtDvKXjWWBjC74ra6YkomvAPfou2Bvc95j
   wSZHSUo3DQ0OOmzZGm4ePPE9OLC5HpI99jOQ2iS06abcIe4S84k6qdDOV
   kS+COxOh0+aHy5YLFShyU27TPkoS/is3ZFpxPkN0IAcUudt/HLQccuqKp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="443884594"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="443884594"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 13:28:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="988926604"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="988926604"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Sep 2023 13:28:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeLc5-0001Z3-2K;
	Thu, 07 Sep 2023 20:28:29 +0000
Date: Fri, 8 Sep 2023 04:27:44 +0800
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-ia64@vger.kernel.org
Subject: [aegl:resctrl2_v65 2/4]
 fs/resctrl2/arch/x86/rdt_mbm_local_bytes.c:55:32: warning: unused variable
 'mon_feature'
Message-ID: <202309080444.lKTIXlIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git resctrl2_v65
head:   13c888afbee9f7da0a4a969617dea9889da9d711
commit: 48b1b4708de24b0c1dff810db00317c3fdcf7bab [2/4] resctrl2: Arch x86 modules for most of the legacy control/monitor functions
config: x86_64-randconfig-r011-20230908 (https://download.01.org/0day-ci/archive/20230908/202309080444.lKTIXlIS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309080444.lKTIXlIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309080444.lKTIXlIS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/resctrl2/arch/x86/rdt_mbm_local_bytes.c:55:32: warning: unused variable 'mon_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id mon_feature[] = {
                                  ^
   1 warning generated.
--
>> fs/resctrl2/arch/x86/rdt_mbm_total_bytes.c:55:32: warning: unused variable 'mon_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id mon_feature[] = {
                                  ^
   1 warning generated.
--
>> fs/resctrl2/arch/x86/rdt_llc_occupancy.c:55:32: warning: unused variable 'mon_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id mon_feature[] = {
                                  ^
   1 warning generated.
--
>> fs/resctrl2/arch/x86/rdt_mbm_total_rate.c:55:32: warning: unused variable 'mon_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id mon_feature[] = {
                                  ^
   1 warning generated.
--
>> fs/resctrl2/arch/x86/rdt_l3_cat.c:571:32: warning: unused variable 'cat_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id cat_feature[] = {
                                  ^
   1 warning generated.
--
>> fs/resctrl2/arch/x86/rdt_l2_cat.c:571:32: warning: unused variable 'cat_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id cat_feature[] = {
                                  ^
   1 warning generated.
--
>> fs/resctrl2/arch/x86/rdt_l3_mba.c:247:32: warning: unused variable 'mba_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id mba_feature[] = {
                                  ^
   1 warning generated.
--
>> fs/resctrl2/arch/x86/rdt_mbm_local_rate.c:55:32: warning: unused variable 'mon_feature' [-Wunused-const-variable]
   static const struct x86_cpu_id mon_feature[] = {
                                  ^
   1 warning generated.


vim +/mon_feature +55 fs/resctrl2/arch/x86/rdt_mbm_local_bytes.c

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
