Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD0A361;
	Thu, 13 Apr 2023 01:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681350712; x=1712886712;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lMinR9VexdNji8lruIldsVGJQj5Z8Jw3IyU7JoubiqQ=;
  b=U3vgBaUfXX62oh4BaTdjJyRflYQigiwDPM2e6FKYocdK09lY/8aIcKhH
   GNbzV5SQd1WHZTy7n4tiSiDP1BvhMa0wT7wwjKlLnUWVcuVHxco3gRyFo
   VvU8RJBMhPmzhoX2JAQp9QRHxoUQAgdrW9s/6VOj/zhF7RLOv5chB4mHR
   ZtOz7weX1McSxn9HQAn0SqjtYrTZjKTC5ZWb+uP8+Z+P2rGWzl7Pw5iAJ
   X7sUCFeW06L6Yo8qmZQoKgcwf1s9SZ7qzkjUg70lmNv4smWs/tdw6fXLK
   uqAa33Vjc/KAo0U9YZMCMYaW2r7c2f0cKJaLyKN55imcgEnKEUmZoiSCa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="323687172"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="323687172"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 18:51:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="719619863"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="719619863"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Apr 2023 18:51:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmm7W-000YF3-26;
	Thu, 13 Apr 2023 01:51:30 +0000
Date: Thu, 13 Apr 2023 09:50:44 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Box David E <david.e.box@intel.com>, jstultz@google.com,
	pavel@ucw.cz, svenva@chromium.org,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Shyam-sundar.S-k@amd.com, rrangel@chromium.org,
	Jain Rajat <rajatja@google.com>, hdegoede@redhat.com,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mark Gross <markgross@kernel.org>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 4/4] platform/x86/intel/pmc: core: Report duration of
 time in HW sleep state
Message-ID: <202304130908.LOiMWRYR-lkp@intel.com>
References: <20230412194917.7164-5-mario.limonciello@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230412194917.7164-5-mario.limonciello@amd.com>

Hi Mario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 09a9639e56c01c7a00d6c0ca63f4c7c41abe075d]

url:    https://github.com/intel-lab-lkp/linux/commits/Mario-Limonciello/PM-Add-sysfs-files-to-represent-time-spent-in-hardware-sleep-state/20230413-035220
base:   09a9639e56c01c7a00d6c0ca63f4c7c41abe075d
patch link:    https://lore.kernel.org/r/20230412194917.7164-5-mario.limonciello%40amd.com
patch subject: [PATCH v8 4/4] platform/x86/intel/pmc: core: Report duration of time in HW sleep state
config: i386-randconfig-a004-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130908.LOiMWRYR-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/315b1dd23cbedfd2848c8ac8ec1f77c3610b955e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mario-Limonciello/PM-Add-sysfs-files-to-represent-time-spent-in-hardware-sleep-state/20230413-035220
        git checkout 315b1dd23cbedfd2848c8ac8ec1f77c3610b955e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/platform/x86/intel/pmc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130908.LOiMWRYR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/x86/intel/pmc/core.c:1156:31: warning: shift count >= width of type [-Wshift-count-overflow]
           pm_report_max_hw_sleep(((1UL << 32) - 1) * pmc_core_adjust_slp_s0_step(pmcdev, 1));
                                        ^  ~~
   1 warning generated.


vim +1156 drivers/platform/x86/intel/pmc/core.c

  1097	
  1098	static int pmc_core_probe(struct platform_device *pdev)
  1099	{
  1100		static bool device_initialized;
  1101		struct pmc_dev *pmcdev;
  1102		const struct x86_cpu_id *cpu_id;
  1103		void (*core_init)(struct pmc_dev *pmcdev);
  1104		u64 slp_s0_addr;
  1105	
  1106		if (device_initialized)
  1107			return -ENODEV;
  1108	
  1109		pmcdev = devm_kzalloc(&pdev->dev, sizeof(*pmcdev), GFP_KERNEL);
  1110		if (!pmcdev)
  1111			return -ENOMEM;
  1112	
  1113		platform_set_drvdata(pdev, pmcdev);
  1114		pmcdev->pdev = pdev;
  1115	
  1116		cpu_id = x86_match_cpu(intel_pmc_core_ids);
  1117		if (!cpu_id)
  1118			return -ENODEV;
  1119	
  1120		core_init = (void  (*)(struct pmc_dev *))cpu_id->driver_data;
  1121	
  1122		/*
  1123		 * Coffee Lake has CPU ID of Kaby Lake and Cannon Lake PCH. So here
  1124		 * Sunrisepoint PCH regmap can't be used. Use Cannon Lake PCH regmap
  1125		 * in this case.
  1126		 */
  1127		if (core_init == spt_core_init && !pci_dev_present(pmc_pci_ids))
  1128			core_init = cnp_core_init;
  1129	
  1130		mutex_init(&pmcdev->lock);
  1131		core_init(pmcdev);
  1132	
  1133	
  1134		if (lpit_read_residency_count_address(&slp_s0_addr)) {
  1135			pmcdev->base_addr = PMC_BASE_ADDR_DEFAULT;
  1136	
  1137			if (page_is_ram(PHYS_PFN(pmcdev->base_addr)))
  1138				return -ENODEV;
  1139		} else {
  1140			pmcdev->base_addr = slp_s0_addr - pmcdev->map->slp_s0_offset;
  1141		}
  1142	
  1143		pmcdev->regbase = ioremap(pmcdev->base_addr,
  1144					  pmcdev->map->regmap_length);
  1145		if (!pmcdev->regbase)
  1146			return -ENOMEM;
  1147	
  1148		if (pmcdev->core_configure)
  1149			pmcdev->core_configure(pmcdev);
  1150	
  1151		pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(pmcdev);
  1152		pmc_core_get_low_power_modes(pdev);
  1153		pmc_core_do_dmi_quirks(pmcdev);
  1154	
  1155		pmc_core_dbgfs_register(pmcdev);
> 1156		pm_report_max_hw_sleep(((1UL << 32) - 1) * pmc_core_adjust_slp_s0_step(pmcdev, 1));
  1157	
  1158		device_initialized = true;
  1159		dev_info(&pdev->dev, " initialized\n");
  1160	
  1161		return 0;
  1162	}
  1163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
