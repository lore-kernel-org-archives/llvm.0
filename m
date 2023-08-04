Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44B31BF0B;
	Fri,  4 Aug 2023 19:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691179013; x=1722715013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5uHakTa18gMG74+uki0aSMUbaCCv1199bxzciFPOKo=;
  b=ZozyKAaD2aBJx6N8w1nr5PsA2QKDWX6tK86sTQlTy0gFm42Akzgcdr1o
   jZybhAQZ25ipbJAIQGH+W8LLxZBwAMSCuAD2pUeqL0obGYP1fq2KytYD2
   /x8zYdqpFYFTvJFeswcHjUdvcV4LLc3sWugY8RoIDP8xLaIzQC4AXvbxg
   bbt4/2Sx6EP8eM4UWY8OezHEwhAp0p4Kv9QjNeA4DB8sTgiz9aXW80BI8
   SX/XMfBOq13dWij5tg6P9vdbtat1GE4nQwScB6APXDBnW5ZfKUU1JbcXE
   UXNqTvrEXmMLGItehYG2LAMFnAGHmIu3kaquuXQUQ2uCeTlLqBmMpHqDD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="367693617"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="367693617"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 12:56:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="844210120"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="844210120"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2023 12:56:45 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS0uj-00034d-09;
	Fri, 04 Aug 2023 19:56:45 +0000
Date: Sat, 5 Aug 2023 03:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 142/149]
 arch/x86/events/intel/uncore_snbep.c:1447:16: error: call to undeclared
 function 'topology_phys_to_logical_pkg'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202308050342.HzbhNLDk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   e3c8d0478a9b26ce42ad1bdc0c9e70abecf6f1ee
commit: 351a5810dab5f15e574c60f43bcf55c68077349a [142/149] x86/cpu/topology: Use topology logical mapping mechanism
config: i386-randconfig-i006-20230802 (https://download.01.org/0day-ci/archive/20230805/202308050342.HzbhNLDk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050342.HzbhNLDk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050342.HzbhNLDk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/intel/uncore_snbep.c:1447:16: error: call to undeclared function 'topology_phys_to_logical_pkg'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                                   die_id = topology_phys_to_logical_pkg(i);
                                                            ^
   arch/x86/events/intel/uncore_snbep.c:1447:16: note: did you mean 'topology_get_logical_id'?
   arch/x86/include/asm/topology.h:159:5: note: 'topology_get_logical_id' declared here
   int topology_get_logical_id(u32 apicid, enum x86_topology_domains at_level);
       ^
   1 error generated.


vim +/topology_phys_to_logical_pkg +1447 arch/x86/events/intel/uncore_snbep.c

c4aebdb3b5f50f arch/x86/events/intel/uncore_snbep.c                Alexander Antonov 2022-11-17  1398  
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1399  /*
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1400   * build pci bus to socket mapping
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1401   */
68ce4a0dea168e arch/x86/events/intel/uncore_snbep.c                Kan Liang         2016-08-16  1402  static int snbep_pci2phy_map_init(int devid, int nodeid_loc, int idmap_loc, bool reverse)
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1403  {
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1404  	struct pci_dev *ubox_dev = NULL;
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1405  	int i, bus, nodeid, segment, die_id;
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1406  	struct pci2phy_map *map;
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1407  	int err = 0;
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1408  	u32 config = 0;
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1409  
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1410  	while (1) {
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1411  		/* find the UBOX device */
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1412  		ubox_dev = pci_get_device(PCI_VENDOR_ID_INTEL, devid, ubox_dev);
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1413  		if (!ubox_dev)
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1414  			break;
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1415  		bus = ubox_dev->bus->number;
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1416  		/*
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1417  		 * The nodeid and idmap registers only contain enough
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1418  		 * information to handle 8 nodes.  On systems with more
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1419  		 * than 8 nodes, we need to rely on NUMA information,
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1420  		 * filled in from BIOS supplied information, to determine
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1421  		 * the topology.
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1422  		 */
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1423  		if (nr_node_ids <= 8) {
c4aebdb3b5f50f arch/x86/events/intel/uncore_snbep.c                Alexander Antonov 2022-11-17  1424  			err = upi_nodeid_groupid(ubox_dev, nodeid_loc, idmap_loc,
c4aebdb3b5f50f arch/x86/events/intel/uncore_snbep.c                Alexander Antonov 2022-11-17  1425  						 &nodeid, &config);
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1426  			if (err)
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1427  				break;
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1428  
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1429  			segment = pci_domain_nr(ubox_dev->bus);
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1430  			raw_spin_lock(&pci2phy_map_lock);
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1431  			map = __find_pci2phy_map(segment);
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1432  			if (!map) {
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1433  				raw_spin_unlock(&pci2phy_map_lock);
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1434  				err = -ENOMEM;
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1435  				break;
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1436  			}
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1437  
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1438  			/*
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1439  			 * every three bits in the Node ID mapping register maps
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1440  			 * to a particular node.
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1441  			 */
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1442  			for (i = 0; i < 8; i++) {
c4aebdb3b5f50f arch/x86/events/intel/uncore_snbep.c                Alexander Antonov 2022-11-17  1443  				if (nodeid == GIDNIDMAP(config, i)) {
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1444  					if (topology_max_die_per_package() > 1)
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1445  						die_id = i;
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1446  					else
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08 @1447  						die_id = topology_phys_to_logical_pkg(i);
4a0e3ff30980b7 arch/x86/events/intel/uncore_snbep.c                Kan Liang         2021-05-26  1448  					if (die_id < 0)
4a0e3ff30980b7 arch/x86/events/intel/uncore_snbep.c                Kan Liang         2021-05-26  1449  						die_id = -ENODEV;
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1450  					map->pbus_to_dieid[bus] = die_id;
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1451  					break;
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1452  				}
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1453  			}
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1454  			raw_spin_unlock(&pci2phy_map_lock);
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1455  		} else {
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1456  			segment = pci_domain_nr(ubox_dev->bus);
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1457  			raw_spin_lock(&pci2phy_map_lock);
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1458  			map = __find_pci2phy_map(segment);
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1459  			if (!map) {
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1460  				raw_spin_unlock(&pci2phy_map_lock);
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1461  				err = -ENOMEM;
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1462  				break;
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1463  			}
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1464  
dbf061b26221fa arch/x86/events/intel/uncore_snbep.c                Kan Liang         2023-01-12  1465  			map->pbus_to_dieid[bus] = die_id = uncore_device_to_die(ubox_dev);
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1466  
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1467  			raw_spin_unlock(&pci2phy_map_lock);
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1468  
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1469  			if (WARN_ON_ONCE(die_id == -1)) {
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1470  				err = -EINVAL;
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1471  				break;
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1472  			}
9a7832ce3d9204 arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1473  		}
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1474  	}
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1475  
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1476  	if (!err) {
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1477  		/*
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1478  		 * For PCI bus with no UBOX device, find the next bus
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1479  		 * that has UBOX device and use its mapping.
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1480  		 */
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1481  		raw_spin_lock(&pci2phy_map_lock);
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1482  		list_for_each_entry(map, &pci2phy_map_head, list) {
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1483  			i = -1;
68ce4a0dea168e arch/x86/events/intel/uncore_snbep.c                Kan Liang         2016-08-16  1484  			if (reverse) {
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1485  				for (bus = 255; bus >= 0; bus--) {
4a0e3ff30980b7 arch/x86/events/intel/uncore_snbep.c                Kan Liang         2021-05-26  1486  					if (map->pbus_to_dieid[bus] != -1)
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1487  						i = map->pbus_to_dieid[bus];
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1488  					else
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1489  						map->pbus_to_dieid[bus] = i;
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1490  				}
68ce4a0dea168e arch/x86/events/intel/uncore_snbep.c                Kan Liang         2016-08-16  1491  			} else {
68ce4a0dea168e arch/x86/events/intel/uncore_snbep.c                Kan Liang         2016-08-16  1492  				for (bus = 0; bus <= 255; bus++) {
4a0e3ff30980b7 arch/x86/events/intel/uncore_snbep.c                Kan Liang         2021-05-26  1493  					if (map->pbus_to_dieid[bus] != -1)
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1494  						i = map->pbus_to_dieid[bus];
68ce4a0dea168e arch/x86/events/intel/uncore_snbep.c                Kan Liang         2016-08-16  1495  					else
ba9506be4e402e arch/x86/events/intel/uncore_snbep.c                Steve Wahl        2021-01-08  1496  						map->pbus_to_dieid[bus] = i;
68ce4a0dea168e arch/x86/events/intel/uncore_snbep.c                Kan Liang         2016-08-16  1497  				}
68ce4a0dea168e arch/x86/events/intel/uncore_snbep.c                Kan Liang         2016-08-16  1498  			}
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1499  		}
712df65ccb63da arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Taku Izumi        2015-09-24  1500  		raw_spin_unlock(&pci2phy_map_lock);
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1501  	}
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1502  
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1503  	pci_dev_put(ubox_dev);
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1504  
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1505  	return err ? pcibios_err_to_errno(err) : 0;
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1506  }
8268fdfc45b747 arch/x86/kernel/cpu/perf_event_intel_uncore_snbep.c Yan, Zheng        2014-07-30  1507  

:::::: The code at line 1447 was first introduced by commit
:::::: ba9506be4e402ee597b8f41204008b97989b5eef perf/x86/intel/uncore: Store the logical die id instead of the physical die id.

:::::: TO: Steve Wahl <steve.wahl@hpe.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
