Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D527B41C0C6;
	Fri,  6 Mar 2026 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772817568; cv=none; b=Qd3Klr6YURDFJEXpTkdPAsd6SaxqNHTwNgj3W7uU+O6e7eoOSBrXzH/Ke/aNk1HlWEA1rgGLmV6B+Q7KADPgD7fqDa+jdLEebYuJfnshZO7mLw84Yx2LB5u2tDvSVTNt8SwVOedliqgo6NUOZ1Ltleb+QkVoBy9pPgz9D4qv3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772817568; c=relaxed/simple;
	bh=8hWU1/aSXngmCxpvoFJNUE4BT6DXgIMmelC4RAPmkmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9SD2aLZ4FqZ+GWw8fLxzAxcIFpDHzMLpMclZ8rhtSb0ZqZURrTU/2+Xu9tHhnggqj5KUmK4op1K9i9HnxiLYtSGapeCHCjcMiE2bWNwsbv4ZOVwEVvSNY5Q3BAita548hqGL4uGjvYA7nHael4ugkuOCbWaVGsQX3ZELzzQPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXDhRO2B; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXDhRO2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772817566; x=1804353566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=8hWU1/aSXngmCxpvoFJNUE4BT6DXgIMmelC4RAPmkmc=;
  b=bXDhRO2BHei/03or+v4Vr7PqI7O4zKFH9c/nMvLLk+cUvaZ45Qyh55mb
   dclc/ufPtgnETqrV+CryX7ZnjMGY4ilTYT+sIyQH7Hu3XkX8p3xQ1XamZ
   xP+w/qqvXdIf48oTBYGJ29aAh3GLX/loUHP+Un02WsnhhP/00VnJvFR7h
   NZRLmM3pf96cbESBBjbb7QyKZO9uKyAqMYxQ+U/r6zEJjFDztaI1zqZhC
   oyViab6l/fu0RdbAmzM0yWMkdDl2lTPbZV8EXre3VXmcJjDMv34W+d5KM
   jJ9pVkiNaRRdFxt/Pw3NcjjllzB5DR5AOUsv9a+zcEJs+v6OKialPDiu+
   A==;
X-CSE-ConnectionGUID: Fl7q1V7dSxG5fWB2DfnkjQ==
X-CSE-MsgGUID: cNIkuCOtRqGPgkAaM7nMBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73834933"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73834933"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 09:19:26 -0800
X-CSE-ConnectionGUID: xqvO1hDcQxSVNm4+QBYtJw==
X-CSE-MsgGUID: TnLnqOBZRKmCHeMWZlOHWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223554871"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 09:19:24 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyYpd-0000000018P-1zSL;
	Fri, 06 Mar 2026 17:19:21 +0000
Date: Sat, 7 Mar 2026 01:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFCv2 12/13] net: usb: smsc95xx: use dynamic private allocation
Message-ID: <202603070119.dhMGdoEO-lkp@intel.com>
References: <20260303145242.1377514-12-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303145242.1377514-12-oneukum@suse.com>

Hi Oliver,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v7.0-rc2 next-20260305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oliver-Neukum/net-usb-move-updating-filter-and-status-from-cdc-to-usbnet/20260303-230347
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260303145242.1377514-12-oneukum%40suse.com
patch subject: [RFCv2 12/13] net: usb: smsc95xx: use dynamic private allocation
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260307/202603070119.dhMGdoEO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070119.dhMGdoEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070119.dhMGdoEO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/usb/smsc95xx.c:1186:2: warning: variable 'pdata' is uninitialized when used here [-Wuninitialized]
    1186 |         pdata->irqfwnode = irq_domain_alloc_named_fwnode(usb_path);
         |         ^~~~~
   drivers/net/usb/smsc95xx.c:1149:29: note: initialize the variable 'pdata' to silence this warning
    1149 |         struct smsc95xx_priv *pdata;
         |                                    ^
         |                                     = NULL
   1 warning generated.


vim +/pdata +1186 drivers/net/usb/smsc95xx.c

a049a30fc27c1c Martyn Welch      2021-11-22  1146  
2f7ca802bdae2c Steve Glendinning 2008-10-02  1147  static int smsc95xx_bind(struct usbnet *dev, struct usb_interface *intf)
2f7ca802bdae2c Steve Glendinning 2008-10-02  1148  {
ad90a73f0236c4 Andre Edich       2020-08-26  1149  	struct smsc95xx_priv *pdata;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1150  	char usb_path[64];
1ce8b37241ed29 Lukas Wunner      2022-05-12  1151  	int ret, phy_irq;
bbd9f9ee69242f Steve Glendinning 2012-10-26  1152  	u32 val;
2f7ca802bdae2c Steve Glendinning 2008-10-02  1153  
2f7ca802bdae2c Steve Glendinning 2008-10-02  1154  	ret = usbnet_get_endpoints(dev, intf);
b052e0737593c2 Steve Glendinning 2012-11-30  1155  	if (ret < 0) {
b052e0737593c2 Steve Glendinning 2012-11-30  1156  		netdev_warn(dev->net, "usbnet_get_endpoints failed: %d\n", ret);
b052e0737593c2 Steve Glendinning 2012-11-30  1157  		return ret;
b052e0737593c2 Steve Glendinning 2012-11-30  1158  	}
2f7ca802bdae2c Steve Glendinning 2008-10-02  1159  
2f7ca802bdae2c Steve Glendinning 2008-10-02  1160  	spin_lock_init(&pdata->mac_cr_lock);
2f7ca802bdae2c Steve Glendinning 2008-10-02  1161  
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1162  	/* LAN95xx devices do not alter the computed checksum of 0 to 0xffff.
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1163  	 * RFC 2460, ipv6 UDP calculated checksum yields a result of zero must
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1164  	 * be changed to 0xffff. RFC 768, ipv4 UDP computed checksum is zero,
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1165  	 * it is transmitted as all ones. The zero transmitted checksum means
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1166  	 * transmitter generated no checksum. Hence, enable csum offload only
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1167  	 * for ipv4 packets.
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1168  	 */
78e47fe4194ca7 Michał Mirosław   2011-04-01  1169  	if (DEFAULT_TX_CSUM_ENABLE)
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1170  		dev->net->features |= NETIF_F_IP_CSUM;
78e47fe4194ca7 Michał Mirosław   2011-04-01  1171  	if (DEFAULT_RX_CSUM_ENABLE)
78e47fe4194ca7 Michał Mirosław   2011-04-01  1172  		dev->net->features |= NETIF_F_RXCSUM;
78e47fe4194ca7 Michał Mirosław   2011-04-01  1173  
fe0cd8ca1b8298 Nisar Sayed       2017-05-19  1174  	dev->net->hw_features = NETIF_F_IP_CSUM | NETIF_F_RXCSUM;
810eeb1f41a9a2 Ben Dooks         2018-11-14  1175  	set_bit(EVENT_NO_IP_ALIGN, &dev->flags);
2f7ca802bdae2c Steve Glendinning 2008-10-02  1176  
f4e8ab7cc4e819 Bernard Blackham  2010-10-18  1177  	smsc95xx_init_mac_address(dev);
f4e8ab7cc4e819 Bernard Blackham  2010-10-18  1178  
2f7ca802bdae2c Steve Glendinning 2008-10-02  1179  	/* Init all registers */
2f7ca802bdae2c Steve Glendinning 2008-10-02  1180  	ret = smsc95xx_reset(dev);
7c8b1e855f94f8 Andre Edich       2020-07-06  1181  	if (ret)
0cc66beba9c2a0 Oliver Neukum     2026-03-03  1182  		goto bail_out;
2f7ca802bdae2c Steve Glendinning 2008-10-02  1183  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1184  	/* create irq domain for use by PHY driver and GPIO consumers */
1ce8b37241ed29 Lukas Wunner      2022-05-12  1185  	usb_make_path(dev->udev, usb_path, sizeof(usb_path));
1ce8b37241ed29 Lukas Wunner      2022-05-12 @1186  	pdata->irqfwnode = irq_domain_alloc_named_fwnode(usb_path);
1ce8b37241ed29 Lukas Wunner      2022-05-12  1187  	if (!pdata->irqfwnode) {
1ce8b37241ed29 Lukas Wunner      2022-05-12  1188  		ret = -ENOMEM;
0cc66beba9c2a0 Oliver Neukum     2026-03-03  1189  		goto bail_out;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1190  	}
1ce8b37241ed29 Lukas Wunner      2022-05-12  1191  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1192  	pdata->irqdomain = irq_domain_create_linear(pdata->irqfwnode,
1ce8b37241ed29 Lukas Wunner      2022-05-12  1193  						    SMSC95XX_NR_IRQS,
1ce8b37241ed29 Lukas Wunner      2022-05-12  1194  						    &irq_domain_simple_ops,
1ce8b37241ed29 Lukas Wunner      2022-05-12  1195  						    pdata);
1ce8b37241ed29 Lukas Wunner      2022-05-12  1196  	if (!pdata->irqdomain) {
1ce8b37241ed29 Lukas Wunner      2022-05-12  1197  		ret = -ENOMEM;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1198  		goto free_irqfwnode;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1199  	}
1ce8b37241ed29 Lukas Wunner      2022-05-12  1200  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1201  	phy_irq = irq_create_mapping(pdata->irqdomain, PHY_HWIRQ);
1ce8b37241ed29 Lukas Wunner      2022-05-12  1202  	if (!phy_irq) {
1ce8b37241ed29 Lukas Wunner      2022-05-12  1203  		ret = -ENOENT;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1204  		goto remove_irqdomain;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1205  	}
1ce8b37241ed29 Lukas Wunner      2022-05-12  1206  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1207  	pdata->irqchip = dummy_irq_chip;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1208  	pdata->irqchip.name = SMSC_CHIPNAME;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1209  	irq_set_chip_and_handler_name(phy_irq, &pdata->irqchip,
1ce8b37241ed29 Lukas Wunner      2022-05-12  1210  				      handle_simple_irq, "phy");
1ce8b37241ed29 Lukas Wunner      2022-05-12  1211  
05b35e7eb9a11b Andre Edich       2020-08-26  1212  	pdata->mdiobus = mdiobus_alloc();
05b35e7eb9a11b Andre Edich       2020-08-26  1213  	if (!pdata->mdiobus) {
05b35e7eb9a11b Andre Edich       2020-08-26  1214  		ret = -ENOMEM;
1ce8b37241ed29 Lukas Wunner      2022-05-12  1215  		goto dispose_irq;
05b35e7eb9a11b Andre Edich       2020-08-26  1216  	}
05b35e7eb9a11b Andre Edich       2020-08-26  1217  
05b35e7eb9a11b Andre Edich       2020-08-26  1218  	ret = smsc95xx_read_reg(dev, HW_CFG, &val);
05b35e7eb9a11b Andre Edich       2020-08-26  1219  	if (ret < 0)
05b35e7eb9a11b Andre Edich       2020-08-26  1220  		goto free_mdio;
05b35e7eb9a11b Andre Edich       2020-08-26  1221  
809ff97a677ff8 Alexandru Tachici 2022-11-15  1222  	pdata->is_internal_phy = !(val & HW_CFG_PSEL_);
809ff97a677ff8 Alexandru Tachici 2022-11-15  1223  	if (pdata->is_internal_phy)
05b35e7eb9a11b Andre Edich       2020-08-26  1224  		pdata->mdiobus->phy_mask = ~(1u << SMSC95XX_INTERNAL_PHY_ID);
05b35e7eb9a11b Andre Edich       2020-08-26  1225  
05b35e7eb9a11b Andre Edich       2020-08-26  1226  	pdata->mdiobus->priv = dev;
05b35e7eb9a11b Andre Edich       2020-08-26  1227  	pdata->mdiobus->read = smsc95xx_mdiobus_read;
05b35e7eb9a11b Andre Edich       2020-08-26  1228  	pdata->mdiobus->write = smsc95xx_mdiobus_write;
809ff97a677ff8 Alexandru Tachici 2022-11-15  1229  	pdata->mdiobus->reset = smsc95xx_mdiobus_reset;
05b35e7eb9a11b Andre Edich       2020-08-26  1230  	pdata->mdiobus->name = "smsc95xx-mdiobus";
05b35e7eb9a11b Andre Edich       2020-08-26  1231  	pdata->mdiobus->parent = &dev->udev->dev;
05b35e7eb9a11b Andre Edich       2020-08-26  1232  
05b35e7eb9a11b Andre Edich       2020-08-26  1233  	snprintf(pdata->mdiobus->id, ARRAY_SIZE(pdata->mdiobus->id),
05b35e7eb9a11b Andre Edich       2020-08-26  1234  		 "usb-%03d:%03d", dev->udev->bus->busnum, dev->udev->devnum);
05b35e7eb9a11b Andre Edich       2020-08-26  1235  
05b35e7eb9a11b Andre Edich       2020-08-26  1236  	ret = mdiobus_register(pdata->mdiobus);
05b35e7eb9a11b Andre Edich       2020-08-26  1237  	if (ret) {
05b35e7eb9a11b Andre Edich       2020-08-26  1238  		netdev_err(dev->net, "Could not register MDIO bus\n");
05b35e7eb9a11b Andre Edich       2020-08-26  1239  		goto free_mdio;
05b35e7eb9a11b Andre Edich       2020-08-26  1240  	}
05b35e7eb9a11b Andre Edich       2020-08-26  1241  
05b35e7eb9a11b Andre Edich       2020-08-26  1242  	pdata->phydev = phy_find_first(pdata->mdiobus);
05b35e7eb9a11b Andre Edich       2020-08-26  1243  	if (!pdata->phydev) {
05b35e7eb9a11b Andre Edich       2020-08-26  1244  		netdev_err(dev->net, "no PHY found\n");
05b35e7eb9a11b Andre Edich       2020-08-26  1245  		ret = -ENODEV;
05b35e7eb9a11b Andre Edich       2020-08-26  1246  		goto unregister_mdio;
05b35e7eb9a11b Andre Edich       2020-08-26  1247  	}
05b35e7eb9a11b Andre Edich       2020-08-26  1248  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1249  	pdata->phydev->irq = phy_irq;
809ff97a677ff8 Alexandru Tachici 2022-11-15  1250  	pdata->phydev->is_internal = pdata->is_internal_phy;
05b35e7eb9a11b Andre Edich       2020-08-26  1251  
bbd9f9ee69242f Steve Glendinning 2012-10-26  1252  	/* detect device revision as different features may be available */
bbd9f9ee69242f Steve Glendinning 2012-10-26  1253  	ret = smsc95xx_read_reg(dev, ID_REV, &val);
e360a8b4eddc8b Steve Glendinning 2013-01-03  1254  	if (ret < 0)
05b35e7eb9a11b Andre Edich       2020-08-26  1255  		goto unregister_mdio;
3ed58f96a70b85 Andre Edich       2020-07-06  1256  
bbd9f9ee69242f Steve Glendinning 2012-10-26  1257  	val >>= 16;
9ebca5071c8679 Steve Glendinning 2012-11-22  1258  	if ((val == ID_REV_CHIP_ID_9500A_) || (val == ID_REV_CHIP_ID_9530_) ||
9ebca5071c8679 Steve Glendinning 2012-11-22  1259  	    (val == ID_REV_CHIP_ID_89530_) || (val == ID_REV_CHIP_ID_9730_))
9ebca5071c8679 Steve Glendinning 2012-11-22  1260  		pdata->features = (FEATURE_8_WAKEUP_FILTERS |
9ebca5071c8679 Steve Glendinning 2012-11-22  1261  			FEATURE_PHY_NLP_CROSSOVER |
eb970ff07c15f1 Ming Lei          2013-02-22  1262  			FEATURE_REMOTE_WAKEUP);
9ebca5071c8679 Steve Glendinning 2012-11-22  1263  	else if (val == ID_REV_CHIP_ID_9512_)
9ebca5071c8679 Steve Glendinning 2012-11-22  1264  		pdata->features = FEATURE_8_WAKEUP_FILTERS;
bbd9f9ee69242f Steve Glendinning 2012-10-26  1265  
63e77b391f7230 Stephen Hemminger 2009-03-20  1266  	dev->net->netdev_ops = &smsc95xx_netdev_ops;
2f7ca802bdae2c Steve Glendinning 2008-10-02  1267  	dev->net->ethtool_ops = &smsc95xx_ethtool_ops;
2f7ca802bdae2c Steve Glendinning 2008-10-02  1268  	dev->net->flags |= IFF_MULTICAST;
78e47fe4194ca7 Michał Mirosław   2011-04-01  1269  	dev->net->hard_header_len += SMSC95XX_TX_OVERHEAD_CSUM;
85b18b0237ce99 Stefan Wahren     2018-11-08  1270  	dev->net->min_mtu = ETH_MIN_MTU;
85b18b0237ce99 Stefan Wahren     2018-11-08  1271  	dev->net->max_mtu = ETH_DATA_LEN;
9bbf56609d304e Stephane Fillod   2012-04-20  1272  	dev->hard_mtu = dev->net->mtu + dev->net->hard_header_len;
a049a30fc27c1c Martyn Welch      2021-11-22  1273  
c521b8c9f212f8 Oleksij Rempel    2025-07-18  1274  	pdata->pause_tx = true;
c521b8c9f212f8 Oleksij Rempel    2025-07-18  1275  	pdata->pause_rx = true;
c521b8c9f212f8 Oleksij Rempel    2025-07-18  1276  	pdata->pause_autoneg = true;
c521b8c9f212f8 Oleksij Rempel    2025-07-18  1277  	phy_support_asym_pause(pdata->phydev);
c521b8c9f212f8 Oleksij Rempel    2025-07-18  1278  
a049a30fc27c1c Martyn Welch      2021-11-22  1279  	ret = phy_connect_direct(dev->net, pdata->phydev,
a049a30fc27c1c Martyn Welch      2021-11-22  1280  				 &smsc95xx_handle_link_change,
a049a30fc27c1c Martyn Welch      2021-11-22  1281  				 PHY_INTERFACE_MODE_MII);
a049a30fc27c1c Martyn Welch      2021-11-22  1282  	if (ret) {
a049a30fc27c1c Martyn Welch      2021-11-22  1283  		netdev_err(dev->net, "can't attach PHY to %s\n", pdata->mdiobus->id);
a049a30fc27c1c Martyn Welch      2021-11-22  1284  		goto unregister_mdio;
a049a30fc27c1c Martyn Welch      2021-11-22  1285  	}
a049a30fc27c1c Martyn Welch      2021-11-22  1286  
a049a30fc27c1c Martyn Welch      2021-11-22  1287  	phy_attached_info(dev->net->phydev);
a049a30fc27c1c Martyn Welch      2021-11-22  1288  
05b35e7eb9a11b Andre Edich       2020-08-26  1289  	return 0;
d69d169493463e Christoph Fritz   2016-05-26  1290  
05b35e7eb9a11b Andre Edich       2020-08-26  1291  unregister_mdio:
05b35e7eb9a11b Andre Edich       2020-08-26  1292  	mdiobus_unregister(pdata->mdiobus);
d69d169493463e Christoph Fritz   2016-05-26  1293  
05b35e7eb9a11b Andre Edich       2020-08-26  1294  free_mdio:
05b35e7eb9a11b Andre Edich       2020-08-26  1295  	mdiobus_free(pdata->mdiobus);
7c8b1e855f94f8 Andre Edich       2020-07-06  1296  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1297  dispose_irq:
1ce8b37241ed29 Lukas Wunner      2022-05-12  1298  	irq_dispose_mapping(phy_irq);
1ce8b37241ed29 Lukas Wunner      2022-05-12  1299  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1300  remove_irqdomain:
1ce8b37241ed29 Lukas Wunner      2022-05-12  1301  	irq_domain_remove(pdata->irqdomain);
1ce8b37241ed29 Lukas Wunner      2022-05-12  1302  
1ce8b37241ed29 Lukas Wunner      2022-05-12  1303  free_irqfwnode:
1ce8b37241ed29 Lukas Wunner      2022-05-12  1304  	irq_domain_free_fwnode(pdata->irqfwnode);
1ce8b37241ed29 Lukas Wunner      2022-05-12  1305  
0cc66beba9c2a0 Oliver Neukum     2026-03-03  1306  bail_out:
7c8b1e855f94f8 Andre Edich       2020-07-06  1307  	return ret;
2f7ca802bdae2c Steve Glendinning 2008-10-02  1308  }
2f7ca802bdae2c Steve Glendinning 2008-10-02  1309  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
