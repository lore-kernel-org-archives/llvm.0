Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E1979C1;
	Tue, 16 Jan 2024 04:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bi16WdPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705379832; x=1736915832;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PaKlGOU3xIt7vQdz8I24ZtRUquBKdMRP7y4UskASb74=;
  b=bi16WdPi2b09NvrYVx6VOcfDGU6Cv524eiVtfQT1ABIsXp5knqkL0GRP
   WlsZaOSSepAgAHoLExAngvcJUCumfPQzj6fL7dlWABKl6h3aZDO3dihyr
   0RoD9TgpMKXFncOhoUje+i3v6xMcsQX2w6iRs3/TKi4w26qkmKJOSM/Et
   ahBB3IeX8p/GhfDUEg0yKmtdF3db64uJm8cWXjv1YEt8J1uncmeezXQZz
   eXA9BnaE99oPdugvxGwwsHcWW7OLGxG5nCxlDQTEgj6VizGCAM4oBPTS+
   nxAm77qB45UMy8lbFB2tTaVKboEfOTTcDbU3k3K0LWW7PXlk9lSwpq30x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="403508232"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="403508232"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 20:37:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="854223342"
X-IronPort-AV: E=Sophos;i="6.04,198,1695711600"; 
   d="scan'208";a="854223342"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jan 2024 20:37:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPb9p-000Cy0-2C;
	Tue, 16 Jan 2024 04:35:39 +0000
Date: Tue, 16 Jan 2024 12:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Introduce the container for
 mac80211 hw
Message-ID: <202401161203.CRlHlz81-lkp@intel.com>
References: <20240112024214.3481840-3-quic_periyasa@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112024214.3481840-3-quic_periyasa@quicinc.com>

Hi Karthikeyan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a34e613ed3e02337577b26e308067fb6c4700586]

url:    https://github.com/intel-lab-lkp/linux/commits/Karthikeyan-Periyasamy/wifi-ath12k-Refactor-the-mac80211-hw-access-from-link-radio/20240112-104457
base:   a34e613ed3e02337577b26e308067fb6c4700586
patch link:    https://lore.kernel.org/r/20240112024214.3481840-3-quic_periyasa%40quicinc.com
patch subject: [PATCH v2 2/2] wifi: ath12k: Introduce the container for mac80211 hw
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240116/202401161203.CRlHlz81-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401161203.CRlHlz81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401161203.CRlHlz81-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/core.c:767:9: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     767 |         return ret;
         |                ^~~
   drivers/net/wireless/ath/ath12k/core.c:729:9: note: initialize the variable 'ret' to silence this warning
     729 |         int ret, i, j;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +767 drivers/net/wireless/ath/ath12k/core.c

   724	
   725	static int ath12k_core_mac_allocate(struct ath12k_base *ab)
   726	{
   727		struct ath12k_hw *ah;
   728		struct ath12k_pdev_map pdev_map[MAX_RADIOS];
   729		int ret, i, j;
   730		u8 radio_per_hw;
   731	
   732		if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags))
   733			return 0;
   734	
   735		ab->num_hw = ab->num_radios;
   736		radio_per_hw = 1;
   737	
   738		for (i = 0; i < ab->num_hw; i++) {
   739			for (j = 0; j < radio_per_hw; j++) {
   740				pdev_map[j].ab = ab;
   741				pdev_map[j].pdev_idx = (i * radio_per_hw) + j;
   742			}
   743	
   744			ah = ath12k_mac_hw_allocate(ab, pdev_map, radio_per_hw);
   745			if (!ah) {
   746				ath12k_warn(ab, "failed to allocate mac80211 hw device for hw_idx %d\n",
   747					    i);
   748				goto err;
   749			}
   750	
   751			ab->ah[i] = ah;
   752		}
   753	
   754		ath12k_dp_pdev_pre_alloc(ab);
   755	
   756		return 0;
   757	
   758	err:
   759		for (i = i - 1; i >= 0; i--) {
   760			if (!ab->ah[i])
   761				continue;
   762	
   763			ath12k_mac_hw_destroy(ab->ah[i]);
   764			ab->ah[i] = NULL;
   765		}
   766	
 > 767		return ret;
   768	}
   769	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
