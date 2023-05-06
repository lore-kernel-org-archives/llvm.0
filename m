Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C31C13;
	Sat,  6 May 2023 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683372195; x=1714908195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wL+BUK45x5l/MkCamy3kTRrgsAOXeDa0thH3hy/X26Y=;
  b=J8/x2waIjA9dLGUUn7Lws0Kiu6hDxABssIhl4H2Et5FYB228QU7ZDtel
   x2U1ed3D/vFZDR/1fUlvVO7zR1XV3kQAMtWLHA1YQIrcms83gSy+cOeNa
   5Embrss+I4oZcBEJDeXqVQZ9fA0hntPTHVYA7zOuMa8uE3hvufIAuzIpi
   bDOV7e9pyPq6a4BWQqAGEzRJDZZRQpamj296AUcz6cuTPf+R+2/y2yUJ9
   2XRGGF01eVn0l8FnhicJm790OKAr+n9++1JsNJKf+NxlY+sk4+mz8iO78
   H2YZnF9wQPuIcr9isoLzWU+rCoGB/xyGBbTj/brLSu1nyp+Q6Gzh6p2Eq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="412622964"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="412622964"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 04:23:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="944238960"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="944238960"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 May 2023 04:23:12 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvG0N-0000Dd-2A;
	Sat, 06 May 2023 11:23:11 +0000
Date: Sat, 6 May 2023 19:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan McDowell <noodles@earth.li>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.4 24/26]
 drivers/crypto/inside-secure/safexcel.c:1539:21: error: no member named
 'irq' in 'struct safexcel_ring'
Message-ID: <202305061909.2l0NN1TW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.4
head:   7e4ab664280ce88c69fad5875e49d02c7c4cf810
commit: 6869200e5a4b96195cf90fe5ace37016197ef714 [24/26] crypto: safexcel - Cleanup ring IRQ workqueues on load failure
config: x86_64-randconfig-a013-20230501 (https://download.01.org/0day-ci/archive/20230506/202305061909.2l0NN1TW-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=6869200e5a4b96195cf90fe5ace37016197ef714
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.4
        git checkout 6869200e5a4b96195cf90fe5ace37016197ef714
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/crypto/inside-secure/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061909.2l0NN1TW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/inside-secure/safexcel.c:1539:21: error: no member named 'irq' in 'struct safexcel_ring'
                   if (priv->ring[i].irq)
                       ~~~~~~~~~~~~~ ^
   drivers/crypto/inside-secure/safexcel.c:1540:40: error: no member named 'irq' in 'struct safexcel_ring'
                           irq_set_affinity_hint(priv->ring[i].irq, NULL);
                                                 ~~~~~~~~~~~~~ ^
   drivers/crypto/inside-secure/safexcel.c:1581:18: warning: cast to smaller integer type 'enum safexcel_eip_version' from 'const void *' [-Wvoid-pointer-to-enum-cast]
           priv->version = (enum safexcel_eip_version)of_device_get_match_data(dev);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/inside-secure/safexcel.c:1619:39: warning: shift count >= width of type [-Wshift-count-overflow]
           ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
                                                ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:142:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   2 warnings and 2 errors generated.


vim +1539 drivers/crypto/inside-secure/safexcel.c

  1299	
  1300	/*
  1301	 * Generic part of probe routine, shared by platform and PCI driver
  1302	 *
  1303	 * Assumes IO resources have been mapped, private data mem has been allocated,
  1304	 * clocks have been enabled, device pointer has been assigned etc.
  1305	 *
  1306	 */
  1307	static int safexcel_probe_generic(void *pdev,
  1308					  struct safexcel_crypto_priv *priv,
  1309					  int is_pci_dev)
  1310	{
  1311		struct device *dev = priv->dev;
  1312		u32 peid, version, mask, val, hiaopt;
  1313		int i, ret, hwctg;
  1314	
  1315		priv->context_pool = dmam_pool_create("safexcel-context", dev,
  1316						      sizeof(struct safexcel_context_record),
  1317						      1, 0);
  1318		if (!priv->context_pool)
  1319			return -ENOMEM;
  1320	
  1321		/*
  1322		 * First try the EIP97 HIA version regs
  1323		 * For the EIP197, this is guaranteed to NOT return any of the test
  1324		 * values
  1325		 */
  1326		version = readl(priv->base + EIP97_HIA_AIC_BASE + EIP197_HIA_VERSION);
  1327	
  1328		mask = 0;  /* do not swap */
  1329		if (EIP197_REG_LO16(version) == EIP197_HIA_VERSION_LE) {
  1330			priv->hwconfig.hiaver = EIP197_VERSION_MASK(version);
  1331		} else if (EIP197_REG_HI16(version) == EIP197_HIA_VERSION_BE) {
  1332			/* read back byte-swapped, so complement byte swap bits */
  1333			mask = EIP197_MST_CTRL_BYTE_SWAP_BITS;
  1334			priv->hwconfig.hiaver = EIP197_VERSION_SWAP(version);
  1335		} else {
  1336			/* So it wasn't an EIP97 ... maybe it's an EIP197? */
  1337			version = readl(priv->base + EIP197_HIA_AIC_BASE +
  1338					EIP197_HIA_VERSION);
  1339			if (EIP197_REG_LO16(version) == EIP197_HIA_VERSION_LE) {
  1340				priv->hwconfig.hiaver = EIP197_VERSION_MASK(version);
  1341				priv->flags |= SAFEXCEL_HW_EIP197;
  1342			} else if (EIP197_REG_HI16(version) ==
  1343				   EIP197_HIA_VERSION_BE) {
  1344				/* read back byte-swapped, so complement swap bits */
  1345				mask = EIP197_MST_CTRL_BYTE_SWAP_BITS;
  1346				priv->hwconfig.hiaver = EIP197_VERSION_SWAP(version);
  1347				priv->flags |= SAFEXCEL_HW_EIP197;
  1348			} else {
  1349				return -ENODEV;
  1350			}
  1351		}
  1352	
  1353		/* Now initialize the reg offsets based on the probing info so far */
  1354		safexcel_init_register_offsets(priv);
  1355	
  1356		/*
  1357		 * If the version was read byte-swapped, we need to flip the device
  1358		 * swapping Keep in mind here, though, that what we write will also be
  1359		 * byte-swapped ...
  1360		 */
  1361		if (mask) {
  1362			val = readl(EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL);
  1363			val = val ^ (mask >> 24); /* toggle byte swap bits */
  1364			writel(val, EIP197_HIA_AIC(priv) + EIP197_HIA_MST_CTRL);
  1365		}
  1366	
  1367		/*
  1368		 * We're not done probing yet! We may fall through to here if no HIA
  1369		 * was found at all. So, with the endianness presumably correct now and
  1370		 * the offsets setup, *really* probe for the EIP97/EIP197.
  1371		 */
  1372		version = readl(EIP197_GLOBAL(priv) + EIP197_VERSION);
  1373		if (((priv->flags & SAFEXCEL_HW_EIP197) &&
  1374		     (EIP197_REG_LO16(version) != EIP197_VERSION_LE)) ||
  1375		    ((!(priv->flags & SAFEXCEL_HW_EIP197) &&
  1376		     (EIP197_REG_LO16(version) != EIP97_VERSION_LE)))) {
  1377			/*
  1378			 * We did not find the device that matched our initial probing
  1379			 * (or our initial probing failed) Report appropriate error.
  1380			 */
  1381			return -ENODEV;
  1382		}
  1383	
  1384		priv->hwconfig.hwver = EIP197_VERSION_MASK(version);
  1385		hwctg = version >> 28;
  1386		peid = version & 255;
  1387	
  1388		/* Detect EIP96 packet engine and version */
  1389		version = readl(EIP197_PE(priv) + EIP197_PE_EIP96_VERSION(0));
  1390		if (EIP197_REG_LO16(version) != EIP96_VERSION_LE) {
  1391			dev_err(dev, "EIP%d: EIP96 not detected.\n", peid);
  1392			return -ENODEV;
  1393		}
  1394		priv->hwconfig.pever = EIP197_VERSION_MASK(version);
  1395	
  1396		hiaopt = readl(EIP197_HIA_AIC(priv) + EIP197_HIA_OPTIONS);
  1397	
  1398		if (priv->flags & SAFEXCEL_HW_EIP197) {
  1399			/* EIP197 */
  1400			priv->hwconfig.hwdataw  = (hiaopt >> EIP197_HWDATAW_OFFSET) &
  1401						  EIP197_HWDATAW_MASK;
  1402			priv->hwconfig.hwcfsize = ((hiaopt >> EIP197_CFSIZE_OFFSET) &
  1403						   EIP197_CFSIZE_MASK) +
  1404						  EIP197_CFSIZE_ADJUST;
  1405			priv->hwconfig.hwrfsize = ((hiaopt >> EIP197_RFSIZE_OFFSET) &
  1406						   EIP197_RFSIZE_MASK) +
  1407						  EIP197_RFSIZE_ADJUST;
  1408		} else {
  1409			/* EIP97 */
  1410			priv->hwconfig.hwdataw  = (hiaopt >> EIP197_HWDATAW_OFFSET) &
  1411						  EIP97_HWDATAW_MASK;
  1412			priv->hwconfig.hwcfsize = (hiaopt >> EIP97_CFSIZE_OFFSET) &
  1413						  EIP97_CFSIZE_MASK;
  1414			priv->hwconfig.hwrfsize = (hiaopt >> EIP97_RFSIZE_OFFSET) &
  1415						  EIP97_RFSIZE_MASK;
  1416		}
  1417	
  1418		/* Get supported algorithms from EIP96 transform engine */
  1419		priv->hwconfig.algo_flags = readl(EIP197_PE(priv) +
  1420					    EIP197_PE_EIP96_OPTIONS(0));
  1421	
  1422		/* Print single info line describing what we just detected */
  1423		dev_info(priv->dev, "EIP%d:%x(%d)-HIA:%x(%d,%d,%d),PE:%x,alg:%08x\n",
  1424			 peid, priv->hwconfig.hwver, hwctg, priv->hwconfig.hiaver,
  1425			 priv->hwconfig.hwdataw, priv->hwconfig.hwcfsize,
  1426			 priv->hwconfig.hwrfsize, priv->hwconfig.pever,
  1427			 priv->hwconfig.algo_flags);
  1428	
  1429		safexcel_configure(priv);
  1430	
  1431		if (IS_ENABLED(CONFIG_PCI) && priv->version == EIP197_DEVBRD) {
  1432			/*
  1433			 * Request MSI vectors for global + 1 per ring -
  1434			 * or just 1 for older dev images
  1435			 */
  1436			struct pci_dev *pci_pdev = pdev;
  1437	
  1438			ret = pci_alloc_irq_vectors(pci_pdev,
  1439						    priv->config.rings + 1,
  1440						    priv->config.rings + 1,
  1441						    PCI_IRQ_MSI | PCI_IRQ_MSIX);
  1442			if (ret < 0) {
  1443				dev_err(dev, "Failed to allocate PCI MSI interrupts\n");
  1444				return ret;
  1445			}
  1446		}
  1447	
  1448		/* Register the ring IRQ handlers and configure the rings */
  1449		priv->ring = devm_kcalloc(dev, priv->config.rings,
  1450					  sizeof(*priv->ring),
  1451					  GFP_KERNEL);
  1452		if (!priv->ring)
  1453			return -ENOMEM;
  1454	
  1455		for (i = 0; i < priv->config.rings; i++) {
  1456			char wq_name[9] = {0};
  1457			int irq;
  1458			struct safexcel_ring_irq_data *ring_irq;
  1459	
  1460			ret = safexcel_init_ring_descriptors(priv,
  1461							     &priv->ring[i].cdr,
  1462							     &priv->ring[i].rdr);
  1463			if (ret) {
  1464				dev_err(dev, "Failed to initialize rings\n");
  1465				goto err_cleanup_rings;
  1466			}
  1467	
  1468			priv->ring[i].rdr_req = devm_kcalloc(dev,
  1469				EIP197_DEFAULT_RING_SIZE,
  1470				sizeof(*priv->ring[i].rdr_req),
  1471				GFP_KERNEL);
  1472			if (!priv->ring[i].rdr_req) {
  1473				ret = -ENOMEM;
  1474				goto err_cleanup_rings;
  1475			}
  1476	
  1477			ring_irq = devm_kzalloc(dev, sizeof(*ring_irq), GFP_KERNEL);
  1478			if (!ring_irq) {
  1479				ret = -ENOMEM;
  1480				goto err_cleanup_rings;
  1481			}
  1482	
  1483			ring_irq->priv = priv;
  1484			ring_irq->ring = i;
  1485	
  1486			irq = safexcel_request_ring_irq(pdev,
  1487							EIP197_IRQ_NUMBER(i, is_pci_dev),
  1488							is_pci_dev,
  1489							safexcel_irq_ring,
  1490							safexcel_irq_ring_thread,
  1491							ring_irq);
  1492			if (irq < 0) {
  1493				dev_err(dev, "Failed to get IRQ ID for ring %d\n", i);
  1494				ret = irq;
  1495				goto err_cleanup_rings;
  1496			}
  1497	
  1498			priv->ring[i].work_data.priv = priv;
  1499			priv->ring[i].work_data.ring = i;
  1500			INIT_WORK(&priv->ring[i].work_data.work,
  1501				  safexcel_dequeue_work);
  1502	
  1503			snprintf(wq_name, 9, "wq_ring%d", i);
  1504			priv->ring[i].workqueue =
  1505				create_singlethread_workqueue(wq_name);
  1506			if (!priv->ring[i].workqueue) {
  1507				ret = -ENOMEM;
  1508				goto err_cleanup_rings;
  1509			}
  1510	
  1511			priv->ring[i].requests = 0;
  1512			priv->ring[i].busy = false;
  1513	
  1514			crypto_init_queue(&priv->ring[i].queue,
  1515					  EIP197_DEFAULT_RING_SIZE);
  1516	
  1517			spin_lock_init(&priv->ring[i].lock);
  1518			spin_lock_init(&priv->ring[i].queue_lock);
  1519		}
  1520	
  1521		atomic_set(&priv->ring_used, 0);
  1522	
  1523		ret = safexcel_hw_init(priv);
  1524		if (ret) {
  1525			dev_err(dev, "HW init failed (%d)\n", ret);
  1526			goto err_cleanup_rings;
  1527		}
  1528	
  1529		ret = safexcel_register_algorithms(priv);
  1530		if (ret) {
  1531			dev_err(dev, "Failed to register algorithms (%d)\n", ret);
  1532			goto err_cleanup_rings;
  1533		}
  1534	
  1535		return 0;
  1536	
  1537	err_cleanup_rings:
  1538		for (i = 0; i < priv->config.rings; i++) {
> 1539			if (priv->ring[i].irq)
  1540				irq_set_affinity_hint(priv->ring[i].irq, NULL);
  1541			if (priv->ring[i].workqueue)
  1542				destroy_workqueue(priv->ring[i].workqueue);
  1543		}
  1544	
  1545		return ret;
  1546	}
  1547	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
