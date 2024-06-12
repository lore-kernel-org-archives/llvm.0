Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D68C18131E;
	Wed, 12 Jun 2024 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718208480; cv=none; b=Ycwpmwi4SVPp10IzvNpLtnQS4EDaYqM5KEekEc82i8yj5lUv5sutFFhp11jdOorGP6Tpwet6/9ixk4DGlWMAOIO8x46PzwGc3UZaydjp+Gej1aFP9Hel2DltD42GUOTmAFURkFKoTfwAXyIJXDA+mSfX+2gEMTHyv/M5Z4xeWC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718208480; c=relaxed/simple;
	bh=rtuimWEm6TgrHQqKSZN5FgbZhYTBkvPBw2vhOKW+lq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sHwUc7g/C6hr31MF6wYb3uX2hh4wiLbU+vVrY1+gAboy3NUThm7AQIZOj4Ho2/IWqcW37V5yNk7ZN7i9wbvFw/VGpq6MW7ISAcZKengxm+z9kn+i2xAL1qt7tVcpKmbo9AGhAsYOd0Ji0OxruSJx65Kht2PiuWmNFO6oXM5GG3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQe+Pxd9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQe+Pxd9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718208479; x=1749744479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rtuimWEm6TgrHQqKSZN5FgbZhYTBkvPBw2vhOKW+lq8=;
  b=IQe+Pxd97EUHZxTlk+y1GZwaWLrcaFLbrcgs1MTU5LWMeNRoxKJlQEwq
   X/NgJdVcDMtvdl1oKHVWug60mAKD3ZIv4oLFAaOZr5TbeZnBgUu43rZti
   8k66kce4ykDVe1qmCHOotJv40SGAZebCJRbiVBdfRWj0b86NmG84RYNY5
   lc5HyieOsVbBhecA0KMteVpsMwhhBLnHOlZsAM4aufe70Wtty8AFQqSch
   R1ljq/y8UcYc7ShTsEmiqzcI2rsLCK6M4kzD2XDmCbmgUF65c7xFUnkIz
   MBy4lHbpSyvWzKWbVpjmwqmc5esattirda2LAAmHDi5QVi2LF1FZxcUR1
   Q==;
X-CSE-ConnectionGUID: k22TUPB3RxCPMqTmzQPFUg==
X-CSE-MsgGUID: qRqHX8thRN+vUjjKTKqhgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14944842"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="14944842"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 09:07:59 -0700
X-CSE-ConnectionGUID: hJ4h5/iiSraTFQbP5Am2CQ==
X-CSE-MsgGUID: 3EHjkLjXS9eAbzMVmczoSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; 
   d="scan'208";a="40461664"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jun 2024 09:07:58 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHQVu-0001h2-2T;
	Wed, 12 Jun 2024 16:07:54 +0000
Date: Thu, 13 Jun 2024 00:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Roger Quadros <rogerq@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roger Quadros <rogerq@kernel.org>
Subject: [rogerq:b4/am65-cpsw-multi-rx-1.1 6/9]
 drivers/net/ethernet/ti/cpsw_ale.h:80:1: error: expected identifier
Message-ID: <202406122343.SPhDIkzB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rogerq/linux b4/am65-cpsw-multi-rx-1.1
head:   8b49bb5d7ad14fc809b07436e283aefff4b35262
commit: 10a677b4a557203dbac8fb4dc78cfe72c415a61a [6/9] net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240612/202406122343.SPhDIkzB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406122343.SPhDIkzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406122343.SPhDIkzB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/ti/cpsw.c:42:
>> drivers/net/ethernet/ti/cpsw_ale.h:80:1: error: expected identifier
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
   ^
>> drivers/net/ethernet/ti/cpsw_ale.h:89:30: error: use of undeclared identifier 'ALE_FIELDS_MAX'; did you mean 'BTF_FIELDS_MAX'?
           struct regmap_field     *fields[ALE_FIELDS_MAX];
                                           ^~~~~~~~~~~~~~
                                           BTF_FIELDS_MAX
   include/linux/bpf.h:188:2: note: 'BTF_FIELDS_MAX' declared here
           BTF_FIELDS_MAX     = 10,
           ^
   2 errors generated.
--
   In file included from drivers/net/ethernet/ti/cpsw_ale.c:22:
>> drivers/net/ethernet/ti/cpsw_ale.h:80:1: error: expected identifier
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
   ^
>> drivers/net/ethernet/ti/cpsw_ale.h:89:30: error: use of undeclared identifier 'ALE_FIELDS_MAX'; did you mean 'BTF_FIELDS_MAX'?
           struct regmap_field     *fields[ALE_FIELDS_MAX];
                                           ^~~~~~~~~~~~~~
                                           BTF_FIELDS_MAX
   include/linux/bpf.h:188:2: note: 'BTF_FIELDS_MAX' declared here
           BTF_FIELDS_MAX     = 10,
           ^
>> drivers/net/ethernet/ti/cpsw_ale.c:1395:1: error: expected expression
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
   ^
   drivers/net/ethernet/ti/cpsw_ale.c:1395:3: error: expected expression
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
     ^
   drivers/net/ethernet/ti/cpsw_ale.c:1395:5: error: expected expression
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
       ^
   drivers/net/ethernet/ti/cpsw_ale.c:1395:7: error: expected expression
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
         ^
>> drivers/net/ethernet/ti/cpsw_ale.c:1395:9: error: implicit declaration of function 'a407f115fe99' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
           ^
>> drivers/net/ethernet/ti/cpsw_ale.c:1395:23: error: use of undeclared identifier 'net'
   >>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
                         ^
>> drivers/net/ethernet/ti/cpsw_ale.c:1481:18: error: use of undeclared identifier 'ALE_FIELDS_MAX'; did you mean 'BTF_FIELDS_MAX'?
           for (i = 0; i < ALE_FIELDS_MAX; i++) {
                           ^~~~~~~~~~~~~~
                           BTF_FIELDS_MAX
   include/linux/bpf.h:188:2: note: 'BTF_FIELDS_MAX' declared here
           BTF_FIELDS_MAX     = 10,
           ^
   9 errors generated.


vim +80 drivers/net/ethernet/ti/cpsw_ale.h

    33	
    34	enum ale_fields {
    35		MINOR_VER,
    36		MAJOR_VER,
    37		ALE_ENTRIES,
    38		ALE_POLICERS,
    39		POL_PORT_MEN,
    40		POL_TRUNK_ID,
    41		POL_PORT_NUM,
    42		POL_PRI_MEN,
    43		POL_PRI_VAL,
    44		POL_OUI_MEN,
    45		POL_OUI_INDEX,
    46		POL_DST_MEN,
    47		POL_DST_INDEX,
    48		POL_SRC_MEN,
    49		POL_SRC_INDEX,
    50		POL_OVLAN_MEN,
    51		POL_OVLAN_INDEX,
    52		POL_IVLAN_MEN,
    53		POL_IVLAN_INDEX,
    54		POL_ETHERTYPE_MEN,
    55		POL_ETHERTYPE_INDEX,
    56		POL_IPSRC_MEN,
    57		POL_IPSRC_INDEX,
    58		POL_IPDST_MEN,
    59		POL_IPDST_INDEX,
    60		POL_EN,
    61		POL_RED_DROP_EN,
    62		POL_YELLOW_DROP_EN,
    63		POL_YELLOW_THRESH,
    64		POL_POL_MATCH_MODE,
    65		POL_PRIORITY_THREAD_EN,
    66		POL_MAC_ONLY_DEF_DIS,
    67		POL_TEST_CLR,
    68		POL_TEST_CLR_RED,
    69		POL_TEST_CLR_YELLOW,
    70		POL_TEST_CLR_SELECTED,
    71		POL_TEST_ENTRY,
    72		POL_STATUS_HIT,
    73		POL_STATUS_HIT_RED,
    74		POL_STATUS_HIT_YELLOW,
    75		ALE_DEFAULT_THREAD_EN,
    76		ALE_DEFAULT_THREAD_VAL,
    77		ALE_THREAD_CLASS_INDEX,
    78		ALE_THREAD_ENABLE,
    79		ALE_THREAD_VALUE,
  > 80	>>>>>>> a407f115fe99 (net: ethernet: ti: cpsw_ale: add Policer and Thread control register fields)
    81		/* terminator */
    82		ALE_FIELDS_MAX,
    83	};
    84	
    85	struct cpsw_ale {
    86		struct cpsw_ale_params	params;
    87		struct timer_list	timer;
    88		struct regmap		*regmap;
  > 89		struct regmap_field	*fields[ALE_FIELDS_MAX];
    90		unsigned long		ageout;
    91		u32			version;
    92		u32			features;
    93		/* These bits are different on NetCP NU Switch ALE */
    94		u32			port_mask_bits;
    95		u32			port_num_bits;
    96		u32			vlan_field_bits;
    97		unsigned long		*p0_untag_vid_mask;
    98		const struct ale_entry_fld *vlan_entry_tbl;
    99	};
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
