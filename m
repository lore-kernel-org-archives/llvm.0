Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D71732A3F2;
	Tue, 11 Nov 2025 19:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762890139; cv=none; b=hmnTACwrVi12YtbdM2Qj/ppJuqGaq2RxlUpqwH8X3Cp+EkXbbNQbiHCLGAg4Pywno5cGUG1611bOICqLCjffm4SDNymOM2akzElfeTqt+s5iNhJJq7iCrnKLKgdpXIM1QFcg6/DjF7lUxAo++4TjxDR7T4kVemvk6eYBwoVO0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762890139; c=relaxed/simple;
	bh=2rKdzM7fTCLU71Sj63JnkHoEiprrjbL5vcSWI5EgNos=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OU+u3qeBdUgu5Ofjx45RvWRj+KP14IjRy4+6ZesnilGchzhRME2vM444us1LWlQuSx3HVk5jBq6gwMWSqjF2JenV9udJZuIfjpZ9PVIFWh3pN9PJniem6fSKMAGHItksDeohfIZ9/GGm2N9l2HyObnV6CWz6CUu1U3WMxylYG1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gA1LL0+L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gA1LL0+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762890137; x=1794426137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rKdzM7fTCLU71Sj63JnkHoEiprrjbL5vcSWI5EgNos=;
  b=gA1LL0+Ld2oR/DEkDJXJnJpfXUS4bumrJmnlrVLZ0bolvuOkTYAT4lm3
   QgbE1HbjrY8AxpBDD8m9K/cUk07xTktn7XW2DBLt8wYPoaVAxfaVimZ4W
   N+2Ik38P3DqyVO0tK4pX95F74a+t7vV0hua53dCTxPPQBMeNsLteaSpph
   Dg5LCTm/jAQFbzTK2DzJQI5ivxEaEPsUcsxNH4GV2CwHdaj4We30BEnwM
   ZHK4IyMNFBg9GlpsynXQ9h8SKmN0mbavLYKScCIVFS02HOG/VnPXxVCgt
   YpMu60M5qzKQYDkcIIX8JLnJuHafYMLwUDebRQdn9zQkvA8x88PT/I+7N
   g==;
X-CSE-ConnectionGUID: GOZdTU66QnCC631nwasSxw==
X-CSE-MsgGUID: /Yy4kvqsT9WJksFyovO9rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="76061983"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="76061983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 11:42:16 -0800
X-CSE-ConnectionGUID: gE2FwgtJTtynWODdKXMX7g==
X-CSE-MsgGUID: 7mGRsjtJSiOGiEX7bYX7ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="188303918"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2025 11:42:15 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIuFo-0003Wh-1K;
	Tue, 11 Nov 2025 19:42:12 +0000
Date: Wed, 12 Nov 2025 03:42:06 +0800
From: kernel test robot <lkp@intel.com>
To: Yael Chemla <ychemla@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>,
	Shahar Shitrit <shshitrit@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [leon-rdma:rdma-next 71/73]
 drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:265:12: error: use of
 undeclared identifier 'ETHTOOL_LINK_MODE_1600000baseCR8_Full_BIT'
Message-ID: <202511120355.R51V5M1O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   52d63c47ac62a5c07bc4da971723794a06318dc1
commit: b8d0619197eb045508bea09813be88a2b91090d4 [71/73] net/mlx5e: Add 1600Gbps link modes
config: s390-defconfig (https://download.01.org/0day-ci/archive/20251112/202511120355.R51V5M1O-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120355.R51V5M1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120355.R51V5M1O-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:265:12: error: use of undeclared identifier 'ETHTOOL_LINK_MODE_1600000baseCR8_Full_BIT'
     265 |                                        ETHTOOL_LINK_MODE_1600000baseCR8_Full_BIT,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:266:12: error: use of undeclared identifier 'ETHTOOL_LINK_MODE_1600000baseKR8_Full_BIT'
     266 |                                        ETHTOOL_LINK_MODE_1600000baseKR8_Full_BIT,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:267:12: error: use of undeclared identifier 'ETHTOOL_LINK_MODE_1600000baseDR8_Full_BIT'
     267 |                                        ETHTOOL_LINK_MODE_1600000baseDR8_Full_BIT,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:268:12: error: use of undeclared identifier 'ETHTOOL_LINK_MODE_1600000baseDR8_2_Full_BIT'; did you mean 'ETHTOOL_LINK_MODE_800000baseDR8_2_Full_BIT'?
     268 |                                        ETHTOOL_LINK_MODE_1600000baseDR8_2_Full_BIT);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                        ETHTOOL_LINK_MODE_800000baseDR8_2_Full_BIT
   drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:88:34: note: expanded from macro 'MLX5_BUILD_PTYS2ETHTOOL_CONFIG'
      88 |                 const unsigned int modes[] = { __VA_ARGS__ };           \
         |                                                ^~~~~~~~~~~
   include/uapi/linux/ethtool.h:2055:2: note: 'ETHTOOL_LINK_MODE_800000baseDR8_2_Full_BIT' declared here
    2055 |         ETHTOOL_LINK_MODE_800000baseDR8_2_Full_BIT       = 96,
         |         ^
>> drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:264:2: error: invalid application of 'sizeof' to an incomplete type 'const unsigned int[]'
     264 |         MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_1600TAUI_8_1600TBASE_CR8_KR8, ext,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     265 |                                        ETHTOOL_LINK_MODE_1600000baseCR8_Full_BIT,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     266 |                                        ETHTOOL_LINK_MODE_1600000baseKR8_Full_BIT,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     267 |                                        ETHTOOL_LINK_MODE_1600000baseDR8_Full_BIT,
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     268 |                                        ETHTOOL_LINK_MODE_1600000baseDR8_2_Full_BIT);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:95:20: note: expanded from macro 'MLX5_BUILD_PTYS2ETHTOOL_CONFIG'
      95 |                 for (i = 0 ; i < ARRAY_SIZE(modes) ; ++i) {             \
         |                                  ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   5 errors generated.


vim +/ETHTOOL_LINK_MODE_1600000baseCR8_Full_BIT +265 drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c

    84	
    85	#define MLX5_BUILD_PTYS2ETHTOOL_CONFIG(reg_, table, ...)                  \
    86		({                                                              \
    87			struct ptys2ethtool_config *cfg;                        \
    88			const unsigned int modes[] = { __VA_ARGS__ };           \
    89			unsigned int i;                                         \
    90			cfg = &ptys2##table##_ethtool_table[reg_];		\
    91			bitmap_zero(cfg->supported,                             \
    92				    __ETHTOOL_LINK_MODE_MASK_NBITS);            \
    93			bitmap_zero(cfg->advertised,                            \
    94				    __ETHTOOL_LINK_MODE_MASK_NBITS);            \
    95			for (i = 0 ; i < ARRAY_SIZE(modes) ; ++i) {             \
    96				bitmap_set(cfg->supported, modes[i], 1);        \
    97				bitmap_set(cfg->advertised, modes[i], 1);       \
    98			}                                                       \
    99		})
   100	
   101	void mlx5e_build_ptys2ethtool_map(void)
   102	{
   103		memset(ptys2legacy_ethtool_table, 0, sizeof(ptys2legacy_ethtool_table));
   104		memset(ptys2ext_ethtool_table, 0, sizeof(ptys2ext_ethtool_table));
   105		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_1000BASE_CX_SGMII, legacy,
   106					       ETHTOOL_LINK_MODE_1000baseKX_Full_BIT);
   107		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_1000BASE_KX, legacy,
   108					       ETHTOOL_LINK_MODE_1000baseKX_Full_BIT);
   109		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_CX4, legacy,
   110					       ETHTOOL_LINK_MODE_10000baseKX4_Full_BIT);
   111		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_KX4, legacy,
   112					       ETHTOOL_LINK_MODE_10000baseKX4_Full_BIT);
   113		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_KR, legacy,
   114					       ETHTOOL_LINK_MODE_10000baseKR_Full_BIT);
   115		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_20GBASE_KR2, legacy,
   116					       ETHTOOL_LINK_MODE_20000baseKR2_Full_BIT);
   117		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_40GBASE_CR4, legacy,
   118					       ETHTOOL_LINK_MODE_40000baseCR4_Full_BIT);
   119		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_40GBASE_KR4, legacy,
   120					       ETHTOOL_LINK_MODE_40000baseKR4_Full_BIT);
   121		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_56GBASE_R4, legacy,
   122					       ETHTOOL_LINK_MODE_56000baseKR4_Full_BIT);
   123		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_CR, legacy,
   124					       ETHTOOL_LINK_MODE_10000baseKR_Full_BIT);
   125		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_SR, legacy,
   126					       ETHTOOL_LINK_MODE_10000baseKR_Full_BIT);
   127		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_ER, legacy,
   128					       ETHTOOL_LINK_MODE_10000baseKR_Full_BIT);
   129		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_40GBASE_SR4, legacy,
   130					       ETHTOOL_LINK_MODE_40000baseSR4_Full_BIT);
   131		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_40GBASE_LR4, legacy,
   132					       ETHTOOL_LINK_MODE_40000baseLR4_Full_BIT);
   133		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_50GBASE_SR2, legacy,
   134					       ETHTOOL_LINK_MODE_50000baseSR2_Full_BIT);
   135		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_100GBASE_CR4, legacy,
   136					       ETHTOOL_LINK_MODE_100000baseCR4_Full_BIT);
   137		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_100GBASE_SR4, legacy,
   138					       ETHTOOL_LINK_MODE_100000baseSR4_Full_BIT);
   139		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_100GBASE_KR4, legacy,
   140					       ETHTOOL_LINK_MODE_100000baseKR4_Full_BIT);
   141		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_100GBASE_LR4, legacy,
   142					       ETHTOOL_LINK_MODE_100000baseLR4_ER4_Full_BIT);
   143		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_100BASE_TX, legacy,
   144					       ETHTOOL_LINK_MODE_100baseT_Full_BIT);
   145		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_1000BASE_T, legacy,
   146					       ETHTOOL_LINK_MODE_1000baseT_Full_BIT);
   147		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_T, legacy,
   148					       ETHTOOL_LINK_MODE_10000baseT_Full_BIT);
   149		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_25GBASE_CR, legacy,
   150					       ETHTOOL_LINK_MODE_25000baseCR_Full_BIT);
   151		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_25GBASE_KR, legacy,
   152					       ETHTOOL_LINK_MODE_25000baseKR_Full_BIT);
   153		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_25GBASE_SR, legacy,
   154					       ETHTOOL_LINK_MODE_25000baseSR_Full_BIT);
   155		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_50GBASE_CR2, legacy,
   156					       ETHTOOL_LINK_MODE_50000baseCR2_Full_BIT);
   157		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_50GBASE_KR2, legacy,
   158					       ETHTOOL_LINK_MODE_50000baseKR2_Full_BIT);
   159		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_SGMII_100M, ext,
   160					       ETHTOOL_LINK_MODE_100baseT_Full_BIT);
   161		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_1000BASE_X_SGMII, ext,
   162					       ETHTOOL_LINK_MODE_1000baseT_Full_BIT,
   163					       ETHTOOL_LINK_MODE_1000baseKX_Full_BIT,
   164					       ETHTOOL_LINK_MODE_1000baseX_Full_BIT);
   165		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_5GBASE_R, ext,
   166					       ETHTOOL_LINK_MODE_5000baseT_Full_BIT);
   167		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_10GBASE_XFI_XAUI_1, ext,
   168					       ETHTOOL_LINK_MODE_10000baseT_Full_BIT,
   169					       ETHTOOL_LINK_MODE_10000baseKR_Full_BIT,
   170					       ETHTOOL_LINK_MODE_10000baseR_FEC_BIT,
   171					       ETHTOOL_LINK_MODE_10000baseCR_Full_BIT,
   172					       ETHTOOL_LINK_MODE_10000baseSR_Full_BIT,
   173					       ETHTOOL_LINK_MODE_10000baseLR_Full_BIT,
   174					       ETHTOOL_LINK_MODE_10000baseER_Full_BIT);
   175		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_40GBASE_XLAUI_4_XLPPI_4, ext,
   176					       ETHTOOL_LINK_MODE_40000baseKR4_Full_BIT,
   177					       ETHTOOL_LINK_MODE_40000baseCR4_Full_BIT,
   178					       ETHTOOL_LINK_MODE_40000baseSR4_Full_BIT,
   179					       ETHTOOL_LINK_MODE_40000baseLR4_Full_BIT);
   180		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_25GAUI_1_25GBASE_CR_KR, ext,
   181					       ETHTOOL_LINK_MODE_25000baseCR_Full_BIT,
   182					       ETHTOOL_LINK_MODE_25000baseKR_Full_BIT,
   183					       ETHTOOL_LINK_MODE_25000baseSR_Full_BIT);
   184		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_50GAUI_2_LAUI_2_50GBASE_CR2_KR2,
   185					       ext,
   186					       ETHTOOL_LINK_MODE_50000baseCR2_Full_BIT,
   187					       ETHTOOL_LINK_MODE_50000baseKR2_Full_BIT,
   188					       ETHTOOL_LINK_MODE_50000baseSR2_Full_BIT);
   189		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_50GAUI_1_LAUI_1_50GBASE_CR_KR, ext,
   190					       ETHTOOL_LINK_MODE_50000baseKR_Full_BIT,
   191					       ETHTOOL_LINK_MODE_50000baseSR_Full_BIT,
   192					       ETHTOOL_LINK_MODE_50000baseCR_Full_BIT,
   193					       ETHTOOL_LINK_MODE_50000baseLR_ER_FR_Full_BIT,
   194					       ETHTOOL_LINK_MODE_50000baseDR_Full_BIT);
   195		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_CAUI_4_100GBASE_CR4_KR4, ext,
   196					       ETHTOOL_LINK_MODE_100000baseKR4_Full_BIT,
   197					       ETHTOOL_LINK_MODE_100000baseSR4_Full_BIT,
   198					       ETHTOOL_LINK_MODE_100000baseCR4_Full_BIT,
   199					       ETHTOOL_LINK_MODE_100000baseLR4_ER4_Full_BIT);
   200		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_100GAUI_2_100GBASE_CR2_KR2, ext,
   201					       ETHTOOL_LINK_MODE_100000baseKR2_Full_BIT,
   202					       ETHTOOL_LINK_MODE_100000baseSR2_Full_BIT,
   203					       ETHTOOL_LINK_MODE_100000baseCR2_Full_BIT,
   204					       ETHTOOL_LINK_MODE_100000baseLR2_ER2_FR2_Full_BIT,
   205					       ETHTOOL_LINK_MODE_100000baseDR2_Full_BIT);
   206		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_200GAUI_4_200GBASE_CR4_KR4, ext,
   207					       ETHTOOL_LINK_MODE_200000baseKR4_Full_BIT,
   208					       ETHTOOL_LINK_MODE_200000baseSR4_Full_BIT,
   209					       ETHTOOL_LINK_MODE_200000baseLR4_ER4_FR4_Full_BIT,
   210					       ETHTOOL_LINK_MODE_200000baseDR4_Full_BIT,
   211					       ETHTOOL_LINK_MODE_200000baseCR4_Full_BIT);
   212		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_400GAUI_8_400GBASE_CR8, ext,
   213					       ETHTOOL_LINK_MODE_400000baseKR8_Full_BIT,
   214					       ETHTOOL_LINK_MODE_400000baseSR8_Full_BIT,
   215					       ETHTOOL_LINK_MODE_400000baseLR8_ER8_FR8_Full_BIT,
   216					       ETHTOOL_LINK_MODE_400000baseDR8_Full_BIT,
   217					       ETHTOOL_LINK_MODE_400000baseCR8_Full_BIT);
   218		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_100GAUI_1_100GBASE_CR_KR, ext,
   219					       ETHTOOL_LINK_MODE_100000baseKR_Full_BIT,
   220					       ETHTOOL_LINK_MODE_100000baseSR_Full_BIT,
   221					       ETHTOOL_LINK_MODE_100000baseLR_ER_FR_Full_BIT,
   222					       ETHTOOL_LINK_MODE_100000baseDR_Full_BIT,
   223					       ETHTOOL_LINK_MODE_100000baseCR_Full_BIT);
   224		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_200GAUI_2_200GBASE_CR2_KR2, ext,
   225					       ETHTOOL_LINK_MODE_200000baseKR2_Full_BIT,
   226					       ETHTOOL_LINK_MODE_200000baseSR2_Full_BIT,
   227					       ETHTOOL_LINK_MODE_200000baseLR2_ER2_FR2_Full_BIT,
   228					       ETHTOOL_LINK_MODE_200000baseDR2_Full_BIT,
   229					       ETHTOOL_LINK_MODE_200000baseCR2_Full_BIT);
   230		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_400GAUI_4_400GBASE_CR4_KR4, ext,
   231					       ETHTOOL_LINK_MODE_400000baseKR4_Full_BIT,
   232					       ETHTOOL_LINK_MODE_400000baseSR4_Full_BIT,
   233					       ETHTOOL_LINK_MODE_400000baseLR4_ER4_FR4_Full_BIT,
   234					       ETHTOOL_LINK_MODE_400000baseDR4_Full_BIT,
   235					       ETHTOOL_LINK_MODE_400000baseCR4_Full_BIT);
   236		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_800GAUI_8_800GBASE_CR8_KR8, ext,
   237					       ETHTOOL_LINK_MODE_800000baseCR8_Full_BIT,
   238					       ETHTOOL_LINK_MODE_800000baseKR8_Full_BIT,
   239					       ETHTOOL_LINK_MODE_800000baseDR8_Full_BIT,
   240					       ETHTOOL_LINK_MODE_800000baseDR8_2_Full_BIT,
   241					       ETHTOOL_LINK_MODE_800000baseSR8_Full_BIT,
   242					       ETHTOOL_LINK_MODE_800000baseVR8_Full_BIT);
   243		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_200GAUI_1_200GBASE_CR1_KR1, ext,
   244					       ETHTOOL_LINK_MODE_200000baseCR_Full_BIT,
   245					       ETHTOOL_LINK_MODE_200000baseKR_Full_BIT,
   246					       ETHTOOL_LINK_MODE_200000baseDR_Full_BIT,
   247					       ETHTOOL_LINK_MODE_200000baseDR_2_Full_BIT,
   248					       ETHTOOL_LINK_MODE_200000baseSR_Full_BIT,
   249					       ETHTOOL_LINK_MODE_200000baseVR_Full_BIT);
   250		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_400GAUI_2_400GBASE_CR2_KR2, ext,
   251					       ETHTOOL_LINK_MODE_400000baseCR2_Full_BIT,
   252					       ETHTOOL_LINK_MODE_400000baseKR2_Full_BIT,
   253					       ETHTOOL_LINK_MODE_400000baseDR2_Full_BIT,
   254					       ETHTOOL_LINK_MODE_400000baseDR2_2_Full_BIT,
   255					       ETHTOOL_LINK_MODE_400000baseSR2_Full_BIT,
   256					       ETHTOOL_LINK_MODE_400000baseVR2_Full_BIT);
   257		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_800GAUI_4_800GBASE_CR4_KR4, ext,
   258					       ETHTOOL_LINK_MODE_800000baseCR4_Full_BIT,
   259					       ETHTOOL_LINK_MODE_800000baseKR4_Full_BIT,
   260					       ETHTOOL_LINK_MODE_800000baseDR4_Full_BIT,
   261					       ETHTOOL_LINK_MODE_800000baseDR4_2_Full_BIT,
   262					       ETHTOOL_LINK_MODE_800000baseSR4_Full_BIT,
   263					       ETHTOOL_LINK_MODE_800000baseVR4_Full_BIT);
 > 264		MLX5_BUILD_PTYS2ETHTOOL_CONFIG(MLX5E_1600TAUI_8_1600TBASE_CR8_KR8, ext,
 > 265					       ETHTOOL_LINK_MODE_1600000baseCR8_Full_BIT,
 > 266					       ETHTOOL_LINK_MODE_1600000baseKR8_Full_BIT,
 > 267					       ETHTOOL_LINK_MODE_1600000baseDR8_Full_BIT,
 > 268					       ETHTOOL_LINK_MODE_1600000baseDR8_2_Full_BIT);
   269	}
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
