Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7240672
	for <llvm@lists.linux.dev>; Wed, 27 Oct 2021 22:42:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10150"; a="210357585"
X-IronPort-AV: E=Sophos;i="5.87,188,1631602800"; 
   d="gz'50?scan'50,208,50";a="210357585"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 15:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,188,1631602800"; 
   d="gz'50?scan'50,208,50";a="665173977"
Received: from lkp-server01.sh.intel.com (HELO 3b851179dbd8) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Oct 2021 15:42:03 -0700
Received: from kbuild by 3b851179dbd8 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mfrcQ-00016t-Fn; Wed, 27 Oct 2021 22:42:02 +0000
Date: Thu, 28 Oct 2021 06:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC v16 8/9] iommu/smmuv3: report additional recoverable faults
Message-ID: <202110280626.FqOdgMND-lkp@intel.com>
References: <20211027104428.1059740-9-eric.auger@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Content-Disposition: inline
In-Reply-To: <20211027104428.1059740-9-eric.auger@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on joro-iommu/next]
[also build test WARNING on v5.15-rc7 next-20211027]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Eric-Auger/SMMUv3-Nested-Stage-Setup-IOMMU-part/20211027-184900
base:   https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git next
config: arm64-randconfig-r033-20211027 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5db7568a6a1fcb408eb8988abdaff2a225a8eb72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/7ab2730940794371e7d3fdd2b60b5b2639265ce6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Eric-Auger/SMMUv3-Nested-Stage-Setup-IOMMU-part/20211027-184900
        git checkout 7ab2730940794371e7d3fdd2b60b5b2639265ce6
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:1487:6: warning: variable 'reason' set but not used [-Wunused-but-set-variable]
           u32 reason;
               ^
   1 warning generated.


vim +/reason +1487 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

cdf315f907d46a drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-04-01  1482  
48ec83bcbcf509 drivers/iommu/arm-smmu-v3.c                 Will Deacon           2015-05-27  1483  /* IRQ and event handlers */
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1484  static int arm_smmu_handle_evt(struct arm_smmu_device *smmu, u64 *evt)
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1485  {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1486  	int ret;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26 @1487  	u32 reason;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1488  	u32 perm = 0;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1489  	struct arm_smmu_master *master;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1490  	bool ssid_valid = evt[0] & EVTQ_0_SSV;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1491  	u8 type = FIELD_GET(EVTQ_0_ID, evt[0]);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1492  	u32 sid = FIELD_GET(EVTQ_0_SID, evt[0]);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1493  	struct iommu_fault_event fault_evt = { };
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1494  	struct iommu_fault *flt = &fault_evt.fault;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1495  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1496  	switch (FIELD_GET(EVTQ_0_ID, evt[0])) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1497  	case EVT_ID_TRANSLATION_FAULT:
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1498  		reason = IOMMU_FAULT_REASON_PTE_FETCH;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1499  		break;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1500  	case EVT_ID_ADDR_SIZE_FAULT:
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1501  		reason = IOMMU_FAULT_REASON_OOR_ADDRESS;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1502  		break;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1503  	case EVT_ID_ACCESS_FAULT:
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1504  		reason = IOMMU_FAULT_REASON_ACCESS;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1505  		break;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1506  	case EVT_ID_PERMISSION_FAULT:
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1507  		reason = IOMMU_FAULT_REASON_PERMISSION;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1508  		break;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1509  	default:
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1510  		return -EOPNOTSUPP;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1511  	}
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1512  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1513  	/* Stage-2 is always pinned at the moment */
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1514  	if (evt[1] & EVTQ_1_S2)
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1515  		return -EFAULT;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1516  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1517  	if (evt[1] & EVTQ_1_RnW)
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1518  		perm |= IOMMU_FAULT_PERM_READ;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1519  	else
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1520  		perm |= IOMMU_FAULT_PERM_WRITE;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1521  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1522  	if (evt[1] & EVTQ_1_InD)
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1523  		perm |= IOMMU_FAULT_PERM_EXEC;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1524  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1525  	if (evt[1] & EVTQ_1_PnU)
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1526  		perm |= IOMMU_FAULT_PERM_PRIV;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1527  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1528  	if (evt[1] & EVTQ_1_STALL) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1529  		flt->type = IOMMU_FAULT_PAGE_REQ;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1530  		flt->prm = (struct iommu_fault_page_request) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1531  			.flags = IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE,
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1532  			.grpid = FIELD_GET(EVTQ_1_STAG, evt[1]),
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1533  			.perm = perm,
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1534  			.addr = FIELD_GET(EVTQ_2_ADDR, evt[2]),
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1535  		};
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1536  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1537  		if (ssid_valid) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1538  			flt->prm.flags |= IOMMU_FAULT_PAGE_REQUEST_PASID_VALID;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1539  			flt->prm.pasid = FIELD_GET(EVTQ_0_SSID, evt[0]);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1540  		}
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1541  	} else {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1542  		flt->type = IOMMU_FAULT_DMA_UNRECOV;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1543  		flt->event = (struct iommu_fault_unrecoverable) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1544  			.perm = perm,
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1545  			.addr = FIELD_GET(EVTQ_2_ADDR, evt[2]),
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1546  		};
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1547  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1548  		if (ssid_valid) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1549  			flt->event.flags |= IOMMU_FAULT_UNRECOV_PASID_VALID;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1550  			flt->event.pasid = FIELD_GET(EVTQ_0_SSID, evt[0]);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1551  		}
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1552  
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1553  		switch (type) {
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1554  		case EVT_ID_TRANSLATION_FAULT:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1555  			flt->event.reason = IOMMU_FAULT_REASON_PTE_FETCH;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1556  			flt->event.flags |= IOMMU_FAULT_UNRECOV_ADDR_VALID;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1557  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1558  		case EVT_ID_ADDR_SIZE_FAULT:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1559  			flt->event.reason = IOMMU_FAULT_REASON_OOR_ADDRESS;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1560  			flt->event.flags |= IOMMU_FAULT_UNRECOV_ADDR_VALID;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1561  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1562  		case EVT_ID_ACCESS_FAULT:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1563  			flt->event.reason = IOMMU_FAULT_REASON_ACCESS;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1564  			flt->event.flags |= IOMMU_FAULT_UNRECOV_ADDR_VALID;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1565  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1566  		case EVT_ID_PERMISSION_FAULT:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1567  			flt->event.reason = IOMMU_FAULT_REASON_PERMISSION;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1568  			flt->event.flags |= IOMMU_FAULT_UNRECOV_ADDR_VALID;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1569  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1570  		case EVT_ID_BAD_SUBSTREAMID:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1571  			flt->event.reason = IOMMU_FAULT_REASON_PASID_INVALID;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1572  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1573  		case EVT_ID_CD_FETCH:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1574  			flt->event.reason = IOMMU_FAULT_REASON_PASID_FETCH;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1575  			flt->event.flags |= IOMMU_FAULT_UNRECOV_FETCH_ADDR_VALID;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1576  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1577  		case EVT_ID_BAD_CD:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1578  			flt->event.reason = IOMMU_FAULT_REASON_BAD_PASID_ENTRY;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1579  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1580  		case EVT_ID_WALK_EABT:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1581  			flt->event.reason = IOMMU_FAULT_REASON_WALK_EABT;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1582  			flt->event.flags |= IOMMU_FAULT_UNRECOV_ADDR_VALID |
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1583  					    IOMMU_FAULT_UNRECOV_FETCH_ADDR_VALID;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1584  			break;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1585  		default:
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1586  			/* TODO: report other unrecoverable faults. */
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1587  			return -EFAULT;
7ab27309407943 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Eric Auger            2021-10-27  1588  		}
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1589  	}
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1590  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1591  	mutex_lock(&smmu->streams_mutex);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1592  	master = arm_smmu_find_master(smmu, sid);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1593  	if (!master) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1594  		ret = -EINVAL;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1595  		goto out_unlock;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1596  	}
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1597  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1598  	ret = iommu_report_device_fault(master->dev, &fault_evt);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1599  	if (ret && flt->type == IOMMU_FAULT_PAGE_REQ) {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1600  		/* Nobody cared, abort the access */
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1601  		struct iommu_page_response resp = {
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1602  			.pasid		= flt->prm.pasid,
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1603  			.grpid		= flt->prm.grpid,
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1604  			.code		= IOMMU_PAGE_RESP_FAILURE,
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1605  		};
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1606  		arm_smmu_page_response(master->dev, &fault_evt, &resp);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1607  	}
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1608  
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1609  out_unlock:
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1610  	mutex_unlock(&smmu->streams_mutex);
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1611  	return ret;
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1612  }
395ad89d11fd93 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c Jean-Philippe Brucker 2021-05-26  1613  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--bp/iNruPH9dso1Pn
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--bp/iNruPH9dso1Pn--
