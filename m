Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7EE137A;
	Tue,  9 May 2023 03:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683603653; x=1715139653;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aAbXQZv66Dwx8PO2FemxGgP6+ZkaMBCjGWc+G/4aUbM=;
  b=hQXY7IP/MlzaoQURUu1MS7QTCU1fmEZuSiGal7q3pnbHi0YhuRTXTE1t
   eti9O5xN/J92Kn8VjOqmikmkYQKbHwjP9eed1qQD0mXDAypcmIjGTvt+t
   Ti1FQTR5xxa1aEy65A+pgYZu2KLfOFvZOw2fQGqbpLUzEZ8KmEzjjSiSv
   n92pxVclM1svOOZ2ALuYvdcBPnQuof6LDtpV/vsYr4bvANQB03ncjlw2w
   z2ynRqfuaVXBaAlOBxAAbObPxn+A1MvYesEzT0jlmntuG/vszdfpHs0KH
   mf+zjyFBJT8QAqPI2iv+XQHTYgx5wkRoCxktHOREBW/7RCgTgYJhdVqZb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334253098"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="334253098"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 20:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="945112345"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="945112345"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 May 2023 20:40:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwEDa-0001e0-2m;
	Tue, 09 May 2023 03:40:50 +0000
Date: Tue, 9 May 2023 11:40:42 +0800
From: kernel test robot <lkp@intel.com>
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 1/3] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
Message-ID: <202305091153.AnViRlSx-lkp@intel.com>
References: <b4d60f3408f8fe839933fa3938ecdc9bfceb75d7.1682513390.git.oleksii_moisieiev@epam.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4d60f3408f8fe839933fa3938ecdc9bfceb75d7.1682513390.git.oleksii_moisieiev@epam.com>

Hi Oleksii,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.4-rc1 next-20230508]
[cannot apply to linusw-pinctrl/devel linusw-pinctrl/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oleksii-Moisieiev/pinctrl-Implementation-of-the-generic-scmi-pinctrl-driver/20230426-222739
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/b4d60f3408f8fe839933fa3938ecdc9bfceb75d7.1682513390.git.oleksii_moisieiev%40epam.com
patch subject: [RFC v2 1/3] firmware: arm_scmi: Add SCMI v3.2 pincontrol protocol basic support
config: hexagon-randconfig-r045-20230508 (https://download.01.org/0day-ci/archive/20230509/202305091153.AnViRlSx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/d75721913de292ab464a1580633f927a5dd86fde
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Oleksii-Moisieiev/pinctrl-Implementation-of-the-generic-scmi-pinctrl-driver/20230426-222739
        git checkout d75721913de292ab464a1580633f927a5dd86fde
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/firmware/arm_scmi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091153.AnViRlSx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/pinctrl.c:633:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (!pi->groups[selector].present) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/pinctrl.c:643:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/firmware/arm_scmi/pinctrl.c:633:2: note: remove the 'if' if its condition is always true
           if (!pi->groups[selector].present) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/pinctrl.c:620:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   drivers/firmware/arm_scmi/pinctrl.c:734:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (!pi->functions[selector].present) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/pinctrl.c:744:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/firmware/arm_scmi/pinctrl.c:734:2: note: remove the 'if' if its condition is always true
           if (!pi->functions[selector].present) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/arm_scmi/pinctrl.c:721:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   2 warnings generated.


vim +633 drivers/firmware/arm_scmi/pinctrl.c

   615	
   616	static int scmi_pinctrl_get_group_pins(const struct scmi_protocol_handle *ph,
   617					       u32 selector, const unsigned int **pins,
   618					       unsigned int *nr_pins)
   619	{
   620		int ret;
   621		struct scmi_pinctrl_info *pi;
   622	
   623		if (!ph || !pins || !nr_pins)
   624			return -EINVAL;
   625	
   626		pi = ph->get_priv(ph);
   627		if (!pi)
   628			return -EINVAL;
   629	
   630		if (selector > pi->nr_groups)
   631			return -EINVAL;
   632	
 > 633		if (!pi->groups[selector].present) {
   634			ret = scmi_pinctrl_get_group_info(ph, selector,
   635							  &pi->groups[selector]);
   636			if (ret)
   637				return ret;
   638		}
   639	
   640		*pins = pi->groups[selector].group_pins;
   641		*nr_pins = pi->groups[selector].nr_pins;
   642	
   643		return ret;
   644	}
   645	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
