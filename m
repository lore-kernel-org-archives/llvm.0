Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2FD314D1A;
	Wed,  1 Jul 2026 11:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906409; cv=none; b=PXXmeg08ADKQuJShDdr40y9X7DhJqPVhxNHx/TsJXPydXT2OJRhbcdODW2ENis+fghPrcMSvtmp2nlN+lIMEofN2Qk6doiOb4XE333ieeF2cLGFsCWx/TC0Rq5qGKbWAL7fPIuzR0SIY61RKpVpfAwLUBsuaDbRyGMUlxiYO0k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906409; c=relaxed/simple;
	bh=xEu87upj1bhcgtLx9DyYhRrCIIGiO4d3TuqJb8zHMUk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JaiKVwc6NtT0SKGgqRifu/HtR3YxGm3YJFbSofmh7F/33FvQ1C7OxfQBTHFVUWYxjfhYizkmvYFAIabibTBSvRsJhA4zOvJYNSJqmTz9uUeFvjH+yMIbUvjN072Q6Slt8TpGYO3wpvE7AV5hwAp6QstlVIqsAyBrPQmOKmDn6EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LhsrsLVx; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhsrsLVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782906407; x=1814442407;
  h=date:from:to:cc:subject:message-id;
  bh=xEu87upj1bhcgtLx9DyYhRrCIIGiO4d3TuqJb8zHMUk=;
  b=LhsrsLVxOZa7n+JIChtFgU3YWp6C9J2Yonp53dS7bKQvLPLkU2mw5YNk
   ezFH3kzMqZs8E9ZjJ5nmN8YqnOD86XuwN0h0i1oA7NoVjBo+vhxqlqHFi
   s4jIdtZ8SSagjyAhr6JBnhD/hNAG493ln5IuaNYZFOziP2H8t5QVu69D0
   HRfOAcnAyPw17fIlh0QyJ8dMP2AqjJC6/37K+1lkLgsX+NcJpFEY71+5N
   ltzBJmlWG4RmTwKDHkMBnq+9+YBI2Kt7bFL2MTwn/MO9hItzd2OeSZoNp
   pVvVxSowNFtruZn6RS1akc2rAzzdR12GMDVyFp1tghgC1Qk3iQ9cmVTkr
   Q==;
X-CSE-ConnectionGUID: 9OajaR0TTnKI4kv6Z9TuQw==
X-CSE-MsgGUID: c6b51mqbThWVF7zZneWucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="95020993"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="95020993"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 04:46:47 -0700
X-CSE-ConnectionGUID: F6dq/KVBRmS9ilzx/L9EAQ==
X-CSE-MsgGUID: HoYs3XeyTK+I3oF+xbeDlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="252673650"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Jul 2026 04:46:45 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wetOs-000000000lx-1cuA;
	Wed, 01 Jul 2026 11:46:42 +0000
Date: Wed, 01 Jul 2026 13:45:58 +0200
From: kernel test robot <lkp@intel.com>
To: Birger Koblitz <mail@birger-koblitz.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/net/usb/ax88179_178a.c:1351:16: warning: variable
 'tmp16' is uninitialized when passed as a const pointer argument here
Message-ID: <202607011343.hXWnOWjt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Birger-Koblitz/ax88179_178a-Fix-endianness-of-pause-watermark-register/20260701-135544
head:   1c753e5b45c1b7bacbdf78591bacbf018f7859cd
commit: a4caa62490a0d1e1eee3f961639ef1e48b858d36 ax88179_178a: Add VLAN offload support for AX88179A
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260701/202607011343.hXWnOWjt-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011343.hXWnOWjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011343.hXWnOWjt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/usb/ax88179_178a.c:1351:16: warning: variable 'tmp16' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
    1351 |                                                   2, 2, &tmp16);
         |                                                          ^~~~~
   1 warning generated.


vim +/tmp16 +1351 drivers/net/usb/ax88179_178a.c

  1309	
  1310	static int
  1311	ax88179_set_features(struct net_device *net, netdev_features_t features)
  1312	{
  1313		u8 tmp;
  1314		struct usbnet *dev = netdev_priv(net);
  1315		struct ax88179_data *data = dev->driver_priv;
  1316		netdev_features_t changed = net->features ^ features;
  1317	
  1318		if (changed & NETIF_F_IP_CSUM) {
  1319			ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, 1, &tmp);
  1320			tmp ^= AX_TXCOE_TCP | AX_TXCOE_UDP;
  1321			ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, 1, &tmp);
  1322		}
  1323	
  1324		if (changed & NETIF_F_IPV6_CSUM) {
  1325			ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, 1, &tmp);
  1326			tmp ^= AX_TXCOE_TCPV6 | AX_TXCOE_UDPV6;
  1327			ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_TXCOE_CTL, 1, 1, &tmp);
  1328		}
  1329	
  1330		if (changed & NETIF_F_RXCSUM) {
  1331			ax88179_read_cmd(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 1, &tmp);
  1332			tmp ^= AX_RXCOE_IP | AX_RXCOE_TCP | AX_RXCOE_UDP |
  1333			       AX_RXCOE_TCPV6 | AX_RXCOE_UDPV6;
  1334			ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RXCOE_CTL, 1, 1, &tmp);
  1335			data->rx_checksum = !!(features & NETIF_F_RXCSUM);
  1336		}
  1337	
  1338		if (changed & NETIF_F_HW_VLAN_CTAG_FILTER) {
  1339			ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
  1340			tmp ^= AX_VLAN_CONTROL_VFE;
  1341			ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
  1342			if (features & NETIF_F_HW_VLAN_CTAG_FILTER) {
  1343				for (int i = 0; i < 256; i++) {
  1344					u16 tmp16;
  1345					/* Address */
  1346					tmp = i;
  1347					ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_ADDRESS,
  1348							  1, 1, &tmp);
  1349					/* Data */
  1350					ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_DATA0,
> 1351							  2, 2, &tmp16);
  1352					tmp = AX_VLAN_CONTROL_WE;
  1353					ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL,
  1354							  1, 1, &tmp);
  1355				}
  1356			}
  1357		}
  1358	
  1359		if (changed & NETIF_F_HW_VLAN_CTAG_RX) {
  1360			ax88179_read_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
  1361			tmp ^= AX_VLAN_CONTROL_VSO;
  1362			ax88179_write_cmd(dev, AX_ACCESS_MAC, AX88179A_VLAN_ID_CONTROL, 1, 1, &tmp);
  1363		}
  1364	
  1365		return 0;
  1366	}
  1367	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
