Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE611917F4;
	Tue, 11 Mar 2025 13:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699136; cv=none; b=eGuHnBTlEggK4yv530w/zptyr7rbGVNAO2HEwjpY6G07Qqhwd1dFD/F7WbI3YeiAE9dDxbFojT5FwKG0dRotRbja6vi4O+EL8/gI4qIioQZ9/po677vRM2gnzp8BvLonax6FXOCDEORVSqq1jMBJ6nNf+r69xHgBvW3joSWJqrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699136; c=relaxed/simple;
	bh=VZ789kDo3hqYjHBuM3KMxTgaR8UhZppYKdPbcbfIxVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gY6K8ISgB78zshAtgLwz27TYB2ckNE2ArUzgicy0/6xhTTR6ne0qt1phg5Nr2IwP3EzGjyYnQVOxNWqejgG80c5CseUd3ooQgzuf8nTaVSSk7Vf93ynYKwXvbi7eF8Xd6U4WZnbfcsA54w61IDdcYwFzi3K57ZVphqovcgsWak8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT8GNyjx; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT8GNyjx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741699135; x=1773235135;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VZ789kDo3hqYjHBuM3KMxTgaR8UhZppYKdPbcbfIxVY=;
  b=jT8GNyjxbR15Ah3O6d/rOcHvcV6OeSWXgzTL4mhozpkuuFTNRJulTBz3
   15KJAPNOCygli12oJLXkrYpXnwfD4hw6tqnLYpfeihn4lnm3mZf4UcUq5
   M/iZToGeSVI7gKoEp3Ez5DVOAJ8E0csr+gTJcr60wNGPeMFGASu3q/Ryv
   cvRYa4Sv9YRMp5HV0eJVoDv8x7bj9ChEm7CRZGiZq+zuEPE01M2eNNQQ0
   Ql3Fu9mjP+wbTB09GeOLmG4eQSohD2m/UzIS7mQMLro7sdEJXjN8XlUXf
   nGW1fSmam6/UAVSkHYHwe52YoEKvyhTRDlR8T28APCkQ3sTuMMcUnTjgv
   Q==;
X-CSE-ConnectionGUID: JNN5Dn8RTAqgMInMrITOlw==
X-CSE-MsgGUID: HsXQe3tlSaSuOcQI+QIrGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42863049"
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="42863049"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 06:18:54 -0700
X-CSE-ConnectionGUID: puXCHVEVTDq0nUK8CqYi8g==
X-CSE-MsgGUID: Tn6K92Z3Sauvvj9afxPK4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,239,1736841600"; 
   d="scan'208";a="120809143"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Mar 2025 06:18:52 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trzVS-0006fu-2E;
	Tue, 11 Mar 2025 13:18:50 +0000
Date: Tue, 11 Mar 2025 21:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>
Subject: [nbd168-wireless:mt76 20/34]
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h:35:27: warning:
 'cc_list_be' defined but not used
Message-ID: <202503112103.Iuy6Ox55-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbd168/wireless mt76
head:   9b717a6cf418a48764fa88ff63fc595980564127
commit: afa9bec7ee2df76b1e3fabf9221116f7365107c7 [20/34] wifi: mt76: mt792x: extend MTCL of APCI to version3 for EHT control
config: sparc-randconfig-002-20250311 (https://download.01.org/0day-ci/archive/20250311/202503112103.Iuy6Ox55-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250311/202503112103.Iuy6Ox55-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503112103.Iuy6Ox55-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/mediatek/mt76/mt792x.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt792x_dma.c:7:
>> drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h:35:27: warning: 'cc_list_be' defined but not used [-Wunused-const-variable=]
      35 | static const char * const cc_list_be[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h:27:27: warning: 'cc_list_eu' defined but not used [-Wunused-const-variable=]
      27 | static const char * const cc_list_eu[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h:20:27: warning: 'cc_list_all' defined but not used [-Wunused-const-variable=]
      20 | static const char * const cc_list_all[] = {
         |                           ^~~~~~~~~~~
--
   drivers/net/wireless/mediatek/mt76/mt7925/init.c: In function 'mt7925_regd_channel_update':
   drivers/net/wireless/mediatek/mt76/mt7925/init.c:105:26: warning: unused variable 'mdev' [-Wunused-variable]
     105 |         struct mt76_dev *mdev = &dev->mt76;
         |                          ^~~~
   In file included from drivers/net/wireless/mediatek/mt76/mt7925/../mt792x.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7925/init.c:9:
   drivers/net/wireless/mediatek/mt76/mt7925/../mt792x_acpi_sar.h: At top level:
>> drivers/net/wireless/mediatek/mt76/mt7925/../mt792x_acpi_sar.h:35:27: warning: 'cc_list_be' defined but not used [-Wunused-const-variable=]
      35 | static const char * const cc_list_be[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7925/../mt792x_acpi_sar.h:27:27: warning: 'cc_list_eu' defined but not used [-Wunused-const-variable=]
      27 | static const char * const cc_list_eu[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7925/../mt792x_acpi_sar.h:20:27: warning: 'cc_list_all' defined but not used [-Wunused-const-variable=]
      20 | static const char * const cc_list_all[] = {
         |                           ^~~~~~~~~~~
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7925/../mt792x.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7925/mac.c:7:
>> drivers/net/wireless/mediatek/mt76/mt7925/../mt792x_acpi_sar.h:35:27: warning: 'cc_list_be' defined but not used [-Wunused-const-variable=]
      35 | static const char * const cc_list_be[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7925/../mt792x_acpi_sar.h:27:27: warning: 'cc_list_eu' defined but not used [-Wunused-const-variable=]
      27 | static const char * const cc_list_eu[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7925/../mt792x_acpi_sar.h:20:27: warning: 'cc_list_all' defined but not used [-Wunused-const-variable=]
      20 | static const char * const cc_list_all[] = {
         |                           ^~~~~~~~~~~
--
   In file included from drivers/net/wireless/mediatek/mt76/mt7921/../mt792x.h:12,
                    from drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h:7,
                    from drivers/net/wireless/mediatek/mt76/mt7921/mac.c:7:
>> drivers/net/wireless/mediatek/mt76/mt7921/../mt792x_acpi_sar.h:35:27: warning: 'cc_list_be' defined but not used [-Wunused-const-variable=]
      35 | static const char * const cc_list_be[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7921/../mt792x_acpi_sar.h:27:27: warning: 'cc_list_eu' defined but not used [-Wunused-const-variable=]
      27 | static const char * const cc_list_eu[] = {
         |                           ^~~~~~~~~~
>> drivers/net/wireless/mediatek/mt76/mt7921/../mt792x_acpi_sar.h:20:27: warning: 'cc_list_all' defined but not used [-Wunused-const-variable=]
      20 | static const char * const cc_list_all[] = {
         |                           ^~~~~~~~~~~


vim +/cc_list_be +35 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.h

    19	
  > 20	static const char * const cc_list_all[] = {
    21		"00", "EU", "AR", "AU", "AZ", "BY", "BO", "BR",
    22		"CA", "CL", "CN", "ID", "JP", "MY", "MX", "ME",
    23		"MA", "NZ", "NG", "PH", "RU", "RS", "SG", "KR",
    24		"TW", "TH", "UA", "GB", "US", "VN", "KH", "PY",
    25	};
    26	
  > 27	static const char * const cc_list_eu[] = {
    28		"AD", "AT", "BE", "BG", "CY", "CZ", "HR", "DK",
    29		"EE", "FI", "FR", "DE", "GR", "HU", "IS", "IE",
    30		"IT", "LV", "LI", "LT", "LU", "MC", "MT", "NL",
    31		"NO", "PL", "PT", "RO", "SK", "SI", "ES", "SE",
    32		"CH",
    33	};
    34	
  > 35	static const char * const cc_list_be[] = {
    36		"AR", "BR", "BY", "CL", "IQ", "MX", "OM", "RU",
    37		"RW", "VN", "KR", "UA", "", "", "", "",
    38		"EU", "AT", "CN", "CA", "TW", "NZ", "PH", "UK",
    39		"US",
    40	};
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
