Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1FB33C5;
	Sun, 12 May 2024 02:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715480558; cv=none; b=fQ/GwplCOkmH8PJ26qCyYshrLYhr7sbE7ohvqJzXsgpmul6mK3fJ81+g/JTF+U3rVVD4eUrsNUCqakW1xYYUp2OkqexgB98u1/5dk6AutfsqB36/doqnUl3fZEaNdeVk0cSy5M9BAw0andswuOcv+oHfuKWx4Kn63kkYRusGJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715480558; c=relaxed/simple;
	bh=inG+onzSuLzYX54UJOzr+3/ye97pwGaKBvpvJIcTA+8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H/EcBicKxnpp+LD9BJ4yB1FFcd11RBF4SMeuGyearWYnaSOvy/JqBuCAGWxRc0JxIVzjZccVyuiE1bGuNU2xSG74uOHkQ1udo0ZqZleo2EKNWRm6BYWp57jRZdtoDthKXctB80DyDnrZRWIac9YNVTT71MzsSU1jPvmyKlWPgZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgxcHd6D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgxcHd6D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715480555; x=1747016555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=inG+onzSuLzYX54UJOzr+3/ye97pwGaKBvpvJIcTA+8=;
  b=bgxcHd6Df/TZS/CBWl2VyXP0zFqN6icYpyeANFY7c4rDQzNalLHBXBao
   h6J1OGYhL2dtI+UvutzIW0N4LRr8u+ijO+yJiDGHaILbuZk/lcULinCGa
   PQ26Ra0jsbhPWPVBa8kujM/uNiTSMpF4j+SyetxvZNaiCL4G2g7Vs9K98
   9FdW6LF1K0EDZ8ZbM0lZFOSf0h3KTxDqT95v11FzPl/LQ5rikg+DTitlR
   /yi/CEEXBGzCJrD5jKimqMz93pbo6hXTdgZXdCB6htrStt6ChKeDwR7QP
   OuRAyBQBt5k+bqCfykuwfSYvV5eq7H1CMn+eqIpbsM3OP9WjdBhpNS32F
   w==;
X-CSE-ConnectionGUID: rizbMAyfQeCZKam0tD3TLQ==
X-CSE-MsgGUID: 2LI+DMIoSIaS3cbCoN3LzQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="11485866"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="11485866"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 19:22:35 -0700
X-CSE-ConnectionGUID: Ny9oLXeETBCqJmXZVblbhw==
X-CSE-MsgGUID: DYgWiQ88SP2lKP3LAVMq7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34541892"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 May 2024 19:22:33 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5yr9-00084J-0h;
	Sun, 12 May 2024 02:22:31 +0000
Date: Sun, 12 May 2024 10:22:20 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Henzl <thenzl@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [mkp-scsi:queue 51/51]
 drivers/scsi/mpi3mr/mpi3mr_transport.c:1370:11: warning: format specifies
 type 'unsigned long' but the argument has type 'unsigned int'
Message-ID: <202405121016.0E6ufbnh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git queue
head:   3668651def2c1622904e58b0280ee93121f2b10b
commit: 3668651def2c1622904e58b0280ee93121f2b10b [51/51] scsi: mpi3mr: Sanitise num_phys
config: i386-randconfig-005-20240512 (https://download.01.org/0day-ci/archive/20240512/202405121016.0E6ufbnh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121016.0E6ufbnh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121016.0E6ufbnh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/mpi3mr/mpi3mr_transport.c:1370:11: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1369 |                         ioc_warn(mrioc, "skipping port %u, max allowed value is %lu\n",
         |                                                                                 ~~~
         |                                                                                 %u
    1370 |                             i, sizeof(mr_sas_port->phy_mask) * 8);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/mpi3mr/mpi3mr_debug.h:46:37: note: expanded from macro 'ioc_warn'
      46 |         pr_warn("%s: " fmt, (ioc)->name, ##__VA_ARGS__)
         |                        ~~~                 ^~~~~~~~~~~
   include/linux/printk.h:510:37: note: expanded from macro 'pr_warn'
     510 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
     457 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
     429 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1370 drivers/scsi/mpi3mr/mpi3mr_transport.c

  1291	
  1292	/**
  1293	 * mpi3mr_sas_port_add - Expose the SAS device to the SAS TL
  1294	 * @mrioc: Adapter instance reference
  1295	 * @handle: Firmware device handle of the attached device
  1296	 * @sas_address_parent: sas address of parent expander or host
  1297	 * @hba_port: HBA port entry
  1298	 *
  1299	 * This function creates a new sas port object for the given end
  1300	 * device matching sas address and hba_port and adds it to the
  1301	 * sas_node's sas_port_list and expose the attached sas device
  1302	 * to the SAS transport layer through sas_rphy_add.
  1303	 *
  1304	 * Returns a valid mpi3mr_sas_port reference or NULL.
  1305	 */
  1306	static struct mpi3mr_sas_port *mpi3mr_sas_port_add(struct mpi3mr_ioc *mrioc,
  1307		u16 handle, u64 sas_address_parent, struct mpi3mr_hba_port *hba_port)
  1308	{
  1309		struct mpi3mr_sas_phy *mr_sas_phy, *next;
  1310		struct mpi3mr_sas_port *mr_sas_port;
  1311		unsigned long flags;
  1312		struct mpi3mr_sas_node *mr_sas_node;
  1313		struct sas_rphy *rphy;
  1314		struct mpi3mr_tgt_dev *tgtdev = NULL;
  1315		int i;
  1316		struct sas_port *port;
  1317	
  1318		if (!hba_port) {
  1319			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
  1320			    __FILE__, __LINE__, __func__);
  1321			return NULL;
  1322		}
  1323	
  1324		mr_sas_port = kzalloc(sizeof(struct mpi3mr_sas_port), GFP_KERNEL);
  1325		if (!mr_sas_port)
  1326			return NULL;
  1327	
  1328		INIT_LIST_HEAD(&mr_sas_port->port_list);
  1329		INIT_LIST_HEAD(&mr_sas_port->phy_list);
  1330		spin_lock_irqsave(&mrioc->sas_node_lock, flags);
  1331		mr_sas_node = __mpi3mr_sas_node_find_by_sas_address(mrioc,
  1332		    sas_address_parent, hba_port);
  1333		spin_unlock_irqrestore(&mrioc->sas_node_lock, flags);
  1334	
  1335		if (!mr_sas_node) {
  1336			ioc_err(mrioc, "%s:could not find parent sas_address(0x%016llx)!\n",
  1337			    __func__, (unsigned long long)sas_address_parent);
  1338			goto out_fail;
  1339		}
  1340	
  1341		if ((mpi3mr_set_identify(mrioc, handle,
  1342		    &mr_sas_port->remote_identify))) {
  1343			ioc_err(mrioc,  "failure at %s:%d/%s()!\n",
  1344			    __FILE__, __LINE__, __func__);
  1345			goto out_fail;
  1346		}
  1347	
  1348		if (mr_sas_port->remote_identify.device_type == SAS_PHY_UNUSED) {
  1349			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
  1350			    __FILE__, __LINE__, __func__);
  1351			goto out_fail;
  1352		}
  1353	
  1354		mr_sas_port->hba_port = hba_port;
  1355		mpi3mr_sas_port_sanity_check(mrioc, mr_sas_node,
  1356		    mr_sas_port->remote_identify.sas_address, hba_port);
  1357	
  1358		if (mr_sas_node->num_phys > sizeof(mr_sas_port->phy_mask) * 8)
  1359			ioc_info(mrioc, "max port count %u could be too high\n",
  1360			    mr_sas_node->num_phys);
  1361	
  1362		for (i = 0; i < mr_sas_node->num_phys; i++) {
  1363			if ((mr_sas_node->phy[i].remote_identify.sas_address !=
  1364			    mr_sas_port->remote_identify.sas_address) ||
  1365			    (mr_sas_node->phy[i].hba_port != hba_port))
  1366				continue;
  1367	
  1368			if (i > sizeof(mr_sas_port->phy_mask) * 8) {
  1369				ioc_warn(mrioc, "skipping port %u, max allowed value is %lu\n",
> 1370				    i, sizeof(mr_sas_port->phy_mask) * 8);
  1371				goto out_fail;
  1372			}
  1373			list_add_tail(&mr_sas_node->phy[i].port_siblings,
  1374			    &mr_sas_port->phy_list);
  1375			mr_sas_port->num_phys++;
  1376			mr_sas_port->phy_mask |= (1 << i);
  1377		}
  1378	
  1379		if (!mr_sas_port->num_phys) {
  1380			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
  1381			    __FILE__, __LINE__, __func__);
  1382			goto out_fail;
  1383		}
  1384	
  1385		mr_sas_port->lowest_phy = ffs(mr_sas_port->phy_mask) - 1;
  1386	
  1387		if (mr_sas_port->remote_identify.device_type == SAS_END_DEVICE) {
  1388			tgtdev = mpi3mr_get_tgtdev_by_addr(mrioc,
  1389			    mr_sas_port->remote_identify.sas_address,
  1390			    mr_sas_port->hba_port);
  1391	
  1392			if (!tgtdev) {
  1393				ioc_err(mrioc, "failure at %s:%d/%s()!\n",
  1394				    __FILE__, __LINE__, __func__);
  1395				goto out_fail;
  1396			}
  1397			tgtdev->dev_spec.sas_sata_inf.pend_sas_rphy_add = 1;
  1398		}
  1399	
  1400		if (!mr_sas_node->parent_dev) {
  1401			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
  1402			    __FILE__, __LINE__, __func__);
  1403			goto out_fail;
  1404		}
  1405	
  1406		port = sas_port_alloc_num(mr_sas_node->parent_dev);
  1407		if ((sas_port_add(port))) {
  1408			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
  1409			    __FILE__, __LINE__, __func__);
  1410			goto out_fail;
  1411		}
  1412	
  1413		list_for_each_entry(mr_sas_phy, &mr_sas_port->phy_list,
  1414		    port_siblings) {
  1415			if ((mrioc->logging_level & MPI3_DEBUG_TRANSPORT_INFO))
  1416				dev_info(&port->dev,
  1417				    "add: handle(0x%04x), sas_address(0x%016llx), phy(%d)\n",
  1418				    handle, (unsigned long long)
  1419				    mr_sas_port->remote_identify.sas_address,
  1420				    mr_sas_phy->phy_id);
  1421			sas_port_add_phy(port, mr_sas_phy->phy);
  1422			mr_sas_phy->phy_belongs_to_port = 1;
  1423			mr_sas_phy->hba_port = hba_port;
  1424		}
  1425	
  1426		mr_sas_port->port = port;
  1427		if (mr_sas_port->remote_identify.device_type == SAS_END_DEVICE) {
  1428			rphy = sas_end_device_alloc(port);
  1429			tgtdev->dev_spec.sas_sata_inf.rphy = rphy;
  1430		} else {
  1431			rphy = sas_expander_alloc(port,
  1432			    mr_sas_port->remote_identify.device_type);
  1433		}
  1434		rphy->identify = mr_sas_port->remote_identify;
  1435	
  1436		if (mrioc->current_event)
  1437			mrioc->current_event->pending_at_sml = 1;
  1438	
  1439		if ((sas_rphy_add(rphy))) {
  1440			ioc_err(mrioc, "failure at %s:%d/%s()!\n",
  1441			    __FILE__, __LINE__, __func__);
  1442		}
  1443		if (mr_sas_port->remote_identify.device_type == SAS_END_DEVICE) {
  1444			tgtdev->dev_spec.sas_sata_inf.pend_sas_rphy_add = 0;
  1445			tgtdev->dev_spec.sas_sata_inf.sas_transport_attached = 1;
  1446			mpi3mr_tgtdev_put(tgtdev);
  1447		}
  1448	
  1449		dev_info(&rphy->dev,
  1450		    "%s: added: handle(0x%04x), sas_address(0x%016llx)\n",
  1451		    __func__, handle, (unsigned long long)
  1452		    mr_sas_port->remote_identify.sas_address);
  1453	
  1454		mr_sas_port->rphy = rphy;
  1455		spin_lock_irqsave(&mrioc->sas_node_lock, flags);
  1456		list_add_tail(&mr_sas_port->port_list, &mr_sas_node->sas_port_list);
  1457		spin_unlock_irqrestore(&mrioc->sas_node_lock, flags);
  1458	
  1459		if (mrioc->current_event) {
  1460			mrioc->current_event->pending_at_sml = 0;
  1461			if (mrioc->current_event->discard)
  1462				mpi3mr_print_device_event_notice(mrioc, true);
  1463		}
  1464	
  1465		/* fill in report manufacture */
  1466		if (mr_sas_port->remote_identify.device_type ==
  1467		    SAS_EDGE_EXPANDER_DEVICE ||
  1468		    mr_sas_port->remote_identify.device_type ==
  1469		    SAS_FANOUT_EXPANDER_DEVICE)
  1470			mpi3mr_report_manufacture(mrioc,
  1471			    mr_sas_port->remote_identify.sas_address,
  1472			    rphy_to_expander_device(rphy), hba_port->port_id);
  1473	
  1474		return mr_sas_port;
  1475	
  1476	 out_fail:
  1477		list_for_each_entry_safe(mr_sas_phy, next, &mr_sas_port->phy_list,
  1478		    port_siblings)
  1479			list_del(&mr_sas_phy->port_siblings);
  1480		kfree(mr_sas_port);
  1481		return NULL;
  1482	}
  1483	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
