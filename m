Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBEC8F60;
	Thu,  2 Feb 2023 19:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675366143; x=1706902143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DkpblrQs0BkB89wLSWJ9m95O3EGKR9Eq4gZzG4UK7J4=;
  b=UV7FT0xuqTkqfx/aV5Zz1kPe0QaeL52NBWEbSOCbJGX7ACKS4GzqKQzm
   3cEaF+LpnkjkKbntAezYx4Yu2Dq0kHQImXlbON+sDsjtz396fF3MDtSQ1
   Pbvexjcgj6ZxuHvhTanTVHsONLgoFCuhMdsqPLlfX9Sm4N3Y0hp7MjmRW
   Dki1mcPYEE39Qna/MCmP3/e/sMQa5ZsvnZ87BVdh/le4hTCZRZ7xNg3lg
   NIcgvlXL41EgPr77aoz3ZcIyMI+j1QjTZpfaTTccDC8/4c49XaKPfxphw
   Q9rqyhcXgRdrYbpHDFBEbr6DZANg5FKN1lCHYSYimV+cB4nDR/35gB/rd
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="355887026"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="355887026"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2023 11:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10609"; a="839317333"
X-IronPort-AV: E=Sophos;i="5.97,268,1669104000"; 
   d="scan'208";a="839317333"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 02 Feb 2023 11:28:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNfGH-0006ma-1j;
	Thu, 02 Feb 2023 19:28:45 +0000
Date: Fri, 3 Feb 2023 03:28:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-acpi@vger.kernel.org, devel@acpica.org,
	linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>
Subject: [rafael-pm:bleeding-edge 163/175]
 drivers/thermal/intel/intel_pch_thermal.c:321:14: warning: variable
 'nr_trips' is uninitialized when used here
Message-ID: <202302030306.7KoTwg62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   f24bb5858fe63bcdab4f0680e7648f907304789c
commit: a0ff8607c07f1c1c9ec69dec2ce55d90b58d9a5e [163/175] thermal: intel: intel_pch: Fold two functions into their callers
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230203/202302030306.7KoTwg62-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?id=a0ff8607c07f1c1c9ec69dec2ce55d90b58d9a5e
        git remote add rafael-pm https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
        git fetch --no-tags rafael-pm bleeding-edge
        git checkout a0ff8607c07f1c1c9ec69dec2ce55d90b58d9a5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/thermal/intel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/thermal/intel/intel_pch_thermal.c:321:14: warning: variable 'nr_trips' is uninitialized when used here [-Wuninitialized]
                   ptd->trips[nr_trips].temperature = GET_WPT_TEMP(trip_temp);
                              ^~~~~~~~
   drivers/thermal/intel/intel_pch_thermal.c:263:14: note: initialize the variable 'nr_trips' to silence this warning
           int nr_trips;
                       ^
                        = 0
   1 warning generated.


vim +/nr_trips +321 drivers/thermal/intel/intel_pch_thermal.c

   255	
   256	static int intel_pch_thermal_probe(struct pci_dev *pdev,
   257					   const struct pci_device_id *id)
   258	{
   259		enum board_ids board_id = id->driver_data;
   260		const struct board_info *bi = &board_info[board_id];
   261		struct pch_thermal_device *ptd;
   262		u16 trip_temp;
   263		int nr_trips;
   264		u8 tsel;
   265		int err;
   266	
   267		ptd = devm_kzalloc(&pdev->dev, sizeof(*ptd), GFP_KERNEL);
   268		if (!ptd)
   269			return -ENOMEM;
   270	
   271		pci_set_drvdata(pdev, ptd);
   272		ptd->pdev = pdev;
   273	
   274		err = pci_enable_device(pdev);
   275		if (err) {
   276			dev_err(&pdev->dev, "failed to enable pci device\n");
   277			return err;
   278		}
   279	
   280		err = pci_request_regions(pdev, driver_name);
   281		if (err) {
   282			dev_err(&pdev->dev, "failed to request pci region\n");
   283			goto error_disable;
   284		}
   285	
   286		ptd->hw_base = pci_ioremap_bar(pdev, 0);
   287		if (!ptd->hw_base) {
   288			err = -ENOMEM;
   289			dev_err(&pdev->dev, "failed to map mem base\n");
   290			goto error_release;
   291		}
   292	
   293		/* Check if BIOS has already enabled thermal sensor */
   294		if (WPT_TSEL_ETS & readb(ptd->hw_base + WPT_TSEL)) {
   295			ptd->bios_enabled = true;
   296			goto read_trips;
   297		}
   298	
   299		tsel = readb(ptd->hw_base + WPT_TSEL);
   300		/*
   301		 * When TSEL's Policy Lock-Down bit is 1, TSEL become RO.
   302		 * If so, thermal sensor cannot enable. Bail out.
   303		 */
   304		if (tsel & WPT_TSEL_PLDB) {
   305			dev_err(&ptd->pdev->dev, "Sensor can't be enabled\n");
   306			err = -ENODEV;
   307			goto error_cleanup;
   308		}
   309	
   310		writeb(tsel|WPT_TSEL_ETS, ptd->hw_base + WPT_TSEL);
   311		if (!(WPT_TSEL_ETS & readb(ptd->hw_base + WPT_TSEL))) {
   312			dev_err(&ptd->pdev->dev, "Sensor can't be enabled\n");
   313			err = -ENODEV;
   314			goto error_cleanup;
   315		}
   316	
   317	read_trips:
   318		trip_temp = readw(ptd->hw_base + WPT_CTT);
   319		trip_temp &= 0x1FF;
   320		if (trip_temp) {
 > 321			ptd->trips[nr_trips].temperature = GET_WPT_TEMP(trip_temp);
   322			ptd->trips[nr_trips++].type = THERMAL_TRIP_CRITICAL;
   323		}
   324	
   325		trip_temp = readw(ptd->hw_base + WPT_PHL);
   326		trip_temp &= 0x1FF;
   327		if (trip_temp) {
   328			ptd->trips[nr_trips].temperature = GET_WPT_TEMP(trip_temp);
   329			ptd->trips[nr_trips++].type = THERMAL_TRIP_HOT;
   330		}
   331	
   332		nr_trips += pch_wpt_add_acpi_psv_trip(ptd, nr_trips);
   333	
   334		ptd->tzd = thermal_zone_device_register_with_trips(bi->name, ptd->trips,
   335								   nr_trips, 0, ptd,
   336								   &tzd_ops, NULL, 0, 0);
   337		if (IS_ERR(ptd->tzd)) {
   338			dev_err(&pdev->dev, "Failed to register thermal zone %s\n",
   339				bi->name);
   340			err = PTR_ERR(ptd->tzd);
   341			goto error_cleanup;
   342		}
   343		err = thermal_zone_device_enable(ptd->tzd);
   344		if (err)
   345			goto err_unregister;
   346	
   347		return 0;
   348	
   349	err_unregister:
   350		thermal_zone_device_unregister(ptd->tzd);
   351	error_cleanup:
   352		iounmap(ptd->hw_base);
   353	error_release:
   354		pci_release_regions(pdev);
   355	error_disable:
   356		pci_disable_device(pdev);
   357		dev_err(&pdev->dev, "pci device failed to probe\n");
   358		return err;
   359	}
   360	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
