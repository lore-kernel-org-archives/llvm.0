Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637CE259C90;
	Mon, 14 Apr 2025 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744618203; cv=none; b=bxH7pgDZ8oFcAQhh2seLMMJa+ZRham1sqp7EgZZ63iUSn3x1iursL+qxdzvUAh0Z2/czgqDy5AgbYyBIgvm28ahHF2Y9qkU5B6jFecVzWLoVSABIitvCF8X2Dds5dTqPiBkt3Gg3LQs8u0CAISluIoNnqLrhbKbDKfb+qsAzfBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744618203; c=relaxed/simple;
	bh=UAWWkDhKlMeoJc5N1oM4q1rCMAWAwC4wkNh2Ricctkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lDHrU3pWyg8BbXut0n4CkJp8pkij5SUM/h4TK2ff1mdqrCX1VNWac1nuyUOT6JQg0RSzgKGz+uh4R6gNKkiGC8S178ZhlcTzgZmlBzs0FyPWYm2l23OGb/Vgt78JRSZam1zRYpkt6GEDeycGgxijpZ6C2XODiVZEImWWnBPEGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMyUCaVU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMyUCaVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744618202; x=1776154202;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UAWWkDhKlMeoJc5N1oM4q1rCMAWAwC4wkNh2Ricctkg=;
  b=YMyUCaVU0jELUWFCrcAkW0yuw/6lJXhY1bXekK8+s4g82N92HEnxCvEH
   v1o7U8g76HbGpanTEUXP6SiPN0XawCKM9b5lobzsF4gQi53BEp2ZKX/Oi
   j2c+gvJfDoPxOeZJPSiPLY8Tox2BKqAJA2r63cjOh9+OTq7PYeNB4Kj6O
   RErETCdUDRFDXLKI9QBPJLyKoItU5NFjoZZ3mf8FEOLMwjG0tyllvV39M
   /dtQ5vwP9GcTTw/CenoQ8oqkCD/14n5M1GRIM65yTTYBUyliiyR1hl9pa
   AMEt3Uq4XQUWvBTvi61syWdYwrkPSJe28+WpRrCdOaSFlxV5+9FrVGzwW
   Q==;
X-CSE-ConnectionGUID: tCH2k6cuTFOoySiitniNSA==
X-CSE-MsgGUID: SNdiV6RuRNmppYSswgy7Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="63618113"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="63618113"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 01:10:00 -0700
X-CSE-ConnectionGUID: Qvm6UMs9SBCbowBDnYAAwg==
X-CSE-MsgGUID: RmrJIlTsT2m+aWyW5ViEKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="134499833"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Apr 2025 01:09:29 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4Esh-000DvM-0f;
	Mon, 14 Apr 2025 08:09:27 +0000
Date: Mon, 14 Apr 2025 16:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lunn:v6.15-rc1-next-next-inband 9/24]
 drivers/net/dsa/qca/qca8k-8xxx.c:622:18: warning: variable 'mgmt_conduit' is
 uninitialized when used here
Message-ID: <202504141627.mn3a1Km6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/lunn/linux.git v6.15-rc1-next-next-inband
head:   9e2d85243a79cbf10ea6538b605260e3199fda1a
commit: bbf56e8f7d5498f3221826f0608649ddd997afa9 [9/24] net: dsa: qca8k: Move inband mutex into DSA core
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250414/202504141627.mn3a1Km6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250414/202504141627.mn3a1Km6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504141627.mn3a1Km6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/dsa/qca/qca8k-8xxx.c:622:18: warning: variable 'mgmt_conduit' is uninitialized when used here [-Wuninitialized]
     622 |         read_skb->dev = mgmt_conduit;
         |                         ^~~~~~~~~~~~
   drivers/net/dsa/qca/qca8k-8xxx.c:567:33: note: initialize the variable 'mgmt_conduit' to silence this warning
     567 |         struct net_device *mgmt_conduit;
         |                                        ^
         |                                         = NULL
   1 warning generated.


vim +/mgmt_conduit +622 drivers/net/dsa/qca/qca8k-8xxx.c

2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  559  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  560  static int
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  561  qca8k_phy_eth_command(struct qca8k_priv *priv, bool read, int phy,
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  562  		      int regnum, u16 data)
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  563  {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  564  	struct sk_buff *write_skb, *clear_skb, *read_skb;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  565  	struct qca8k_mgmt_eth_data *mgmt_eth_data;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  566  	u32 write_val, clear_val = 0, val;
6ca80638b90cec drivers/net/dsa/qca/qca8k-8xxx.c Florian Fainelli  2023-10-23  567  	struct net_device *mgmt_conduit;
a981e435577331 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  568  	u32 resp_data[4];
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  569  	int ret, ret1;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  570  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  571  	if (regnum >= QCA8K_MDIO_MASTER_MAX_REG)
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  572  		return -EINVAL;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  573  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  574  	mgmt_eth_data = &priv->mgmt_eth_data;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  575  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  576  	write_val = QCA8K_MDIO_MASTER_BUSY | QCA8K_MDIO_MASTER_EN |
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  577  		    QCA8K_MDIO_MASTER_PHY_ADDR(phy) |
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  578  		    QCA8K_MDIO_MASTER_REG_ADDR(regnum);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  579  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  580  	if (read) {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  581  		write_val |= QCA8K_MDIO_MASTER_READ;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  582  	} else {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  583  		write_val |= QCA8K_MDIO_MASTER_WRITE;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  584  		write_val |= QCA8K_MDIO_MASTER_DATA(data);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  585  	}
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  586  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  587  	/* Prealloc all the needed skb before the lock */
90386223f44e2a drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  588  	write_skb = qca8k_alloc_mdio_header(MDIO_WRITE, QCA8K_MDIO_MASTER_CTRL, &write_val,
90386223f44e2a drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  589  					    QCA8K_ETHERNET_PHY_PRIORITY, sizeof(write_val));
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  590  	if (!write_skb)
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  591  		return -ENOMEM;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  592  
90386223f44e2a drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  593  	clear_skb = qca8k_alloc_mdio_header(MDIO_WRITE, QCA8K_MDIO_MASTER_CTRL, &clear_val,
90386223f44e2a drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  594  					    QCA8K_ETHERNET_PHY_PRIORITY, sizeof(clear_val));
c3664d913dc115 drivers/net/dsa/qca8k.c          Dan Carpenter     2022-02-04  595  	if (!clear_skb) {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  596  		ret = -ENOMEM;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  597  		goto err_clear_skb;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  598  	}
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  599  
90386223f44e2a drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  600  	read_skb = qca8k_alloc_mdio_header(MDIO_READ, QCA8K_MDIO_MASTER_CTRL, &clear_val,
90386223f44e2a drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  601  					   QCA8K_ETHERNET_PHY_PRIORITY, sizeof(clear_val));
90386223f44e2a drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  602  	if (!read_skb) {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  603  		ret = -ENOMEM;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  604  		goto err_read_skb;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  605  	}
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  606  
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  607  	/* It seems that accessing the switch's internal PHYs via management
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  608  	 * packets still uses the MDIO bus within the switch internally, and
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  609  	 * these accesses can conflict with external MDIO accesses to other
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  610  	 * devices on the MDIO bus.
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  611  	 * We therefore need to lock the MDIO bus onto which the switch is
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  612  	 * connected.
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  613  	 */
078e0d596f7b59 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2024-11-10  614  	mutex_lock_nested(&priv->bus->mdio_lock, MDIO_MUTEX_NESTED);
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  615  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  616  	/* Actually start the request:
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  617  	 * 1. Send mdio master packet
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  618  	 * 2. Busy Wait for mdio master command
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  619  	 * 3. Get the data if we are reading
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  620  	 * 4. Reset the mdio master (even with error)
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  621  	 */
6ca80638b90cec drivers/net/dsa/qca/qca8k-8xxx.c Florian Fainelli  2023-10-23 @622  	read_skb->dev = mgmt_conduit;
6ca80638b90cec drivers/net/dsa/qca/qca8k-8xxx.c Florian Fainelli  2023-10-23  623  	clear_skb->dev = mgmt_conduit;
6ca80638b90cec drivers/net/dsa/qca/qca8k-8xxx.c Florian Fainelli  2023-10-23  624  	write_skb->dev = mgmt_conduit;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  625  
1af904b8c118ec drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  626  	ret = dsa_inband_request(&mgmt_eth_data->inband, write_skb,
a89ed17ef27735 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  627  				 qca8k_mdio_header_fill_seq_num,
a981e435577331 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  628  				 NULL, 0,
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  629  				 QCA8K_ETHERNET_TIMEOUT);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  630  
97c0b9f9f76e51 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-11-26  631  	if (ret < 0) {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  632  		kfree_skb(read_skb);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  633  		goto exit;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  634  	}
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  635  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  636  	ret = read_poll_timeout(qca8k_phy_eth_busy_wait, ret1,
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  637  				!(val & QCA8K_MDIO_MASTER_BUSY), 0,
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  638  				QCA8K_BUSY_WAIT_TIMEOUT * USEC_PER_MSEC, false,
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  639  				mgmt_eth_data, read_skb, &val);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  640  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  641  	if (ret < 0 && ret1 < 0) {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  642  		ret = ret1;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  643  		goto exit;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  644  	}
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  645  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  646  	if (read) {
1af904b8c118ec drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  647  		ret = dsa_inband_request(&mgmt_eth_data->inband, read_skb,
a89ed17ef27735 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  648  					 qca8k_mdio_header_fill_seq_num,
a981e435577331 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  649  					 &resp_data, sizeof(resp_data),
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  650  					 QCA8K_ETHERNET_TIMEOUT);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  651  
97c0b9f9f76e51 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-11-26  652  		if (ret < 0)
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  653  			goto exit;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  654  
a981e435577331 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  655  		ret = resp_data[0] & QCA8K_MDIO_MASTER_DATA_MASK;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  656  	} else {
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  657  		kfree_skb(read_skb);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  658  	}
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  659  exit:
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  660  
05ef699ffbdd73 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  661  	/* This is expected to fail sometimes, so don't check return value. */
05ef699ffbdd73 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  662  	dsa_inband_request(&mgmt_eth_data->inband, clear_skb,
a89ed17ef27735 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  663  			   qca8k_mdio_header_fill_seq_num,
a981e435577331 drivers/net/dsa/qca/qca8k-8xxx.c Andrew Lunn       2022-09-17  664  			   NULL, 0,
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  665  			   QCA8K_ETHERNET_TIMEOUT);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  666  
526c8ee04bdbd4 drivers/net/dsa/qca/qca8k-8xxx.c Marek Behún       2023-10-04  667  	mutex_unlock(&priv->bus->mdio_lock);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  668  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  669  	return ret;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  670  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  671  err_read_skb:
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  672  	kfree_skb(clear_skb);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  673  err_clear_skb:
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  674  	kfree_skb(write_skb);
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  675  
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  676  	return ret;
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  677  }
2cd5485663847d drivers/net/dsa/qca8k.c          Christian Marangi 2022-02-02  678  

:::::: The code at line 622 was first introduced by commit
:::::: 6ca80638b90cec66547011ee1ef79e534589989a net: dsa: Use conduit and user terms

:::::: TO: Florian Fainelli <florian.fainelli@broadcom.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
