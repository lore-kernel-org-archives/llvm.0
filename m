Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B893921C191;
	Thu,  9 Jan 2025 15:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736436935; cv=none; b=it6f5Tj8kPSvdoxqbqixpz6dPgMT1JL+8paZ5aGCXehSIVKcin5nMS/5kL56YTt/zOSDkh/2IyryWXwwP3xNcW+fp3GFiSadEqpu4A/Qwe3Q89TZ6Rhddkt29fVsxghdX55jXscg9BcLkMH3PR3lvKDp2WCe+zfItAVGInfjM1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736436935; c=relaxed/simple;
	bh=SrcQ/8zYSyEihsRb2ykAIH/ByznPF+YacEjpgON4wFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQk/1wstikUdSbOY6ozh42Z5Kdwxp/06NCFP9Ybb8aQCn77LX8mcfT9VTKLzZbCdfhQ1ZiWC58V/YYjEy5X7873/eOG9clYm/Tdl1PTpc+nSHqihawc0y5wrGRapx49FICBgxHZ+Q9lu4qp8qS136f0z141+G+fLM+GQdeNfBPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lvs+xDAU; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lvs+xDAU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736436934; x=1767972934;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SrcQ/8zYSyEihsRb2ykAIH/ByznPF+YacEjpgON4wFA=;
  b=Lvs+xDAURX/fvixnohudGOOVCH4QfYZNU1sxLFiVX8PfbLyLrxsZ8k1c
   xkYd4/WtWZBTcRYGULeDMDGw7Yu5ygzzHZuGkg2CzqbSWhRZnW+ZF7TA2
   CrdAyPS7P6gtSMv2SY7HHO6XNMHatHCI8gjVo49T+kX5+IGRUqR/IbXOJ
   zBL+HHl6sWCdvDsZHMXF9vXLuhboB0qByAhgVI4GRPrm6/qoW0MLJ7bj1
   i4AIVV160pAHwq+7Bf4Si16HDD0a26wF/qo7XuAjeq7JKxr4ITpWFWpLD
   nlnHfCbKmamhZ5FMD9xN260V/+BGwUlHSgYUee0EwNDlUgMiZyx3RFC3v
   Q==;
X-CSE-ConnectionGUID: MW9irwRIQcWNXRDCy+WBkw==
X-CSE-MsgGUID: Csi4OFZTRbS77kes3lKZww==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59174614"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="59174614"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 07:35:21 -0800
X-CSE-ConnectionGUID: YkkI/L/tSMG7jguLwGnmFQ==
X-CSE-MsgGUID: MCwCzlA/TBWiqlR55nvWHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104308721"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2025 07:35:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVuYy-000HkJ-0F;
	Thu, 09 Jan 2025 15:35:12 +0000
Date: Thu, 9 Jan 2025 23:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	chunkuang.hu@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
	jitao.shi@mediatek.com, jie.qiu@mediatek.com,
	junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, dmitry.baryshkov@linaro.org,
	lewis.liao@mediatek.com, ives.chenjh@mediatek.com,
	tommyyl.chen@mediatek.com, jason-jh.lin@mediatek.com
Subject: Re: [PATCH v4 02/34] drm/mediatek: mtk_dpi: Add support for Pattern
 Generator in debugfs
Message-ID: <202501092326.5Xw3bp4p-lkp@intel.com>
References: <20250108112744.64686-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108112744.64686-3-angelogioacchino.delregno@collabora.com>

Hi AngeloGioacchino,

kernel test robot noticed the following build errors:

[auto build test ERROR on robh/for-next]
[also build test ERROR on linus/master v6.13-rc6 next-20250109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/AngeloGioacchino-Del-Regno/dt-bindings-display-mediatek-dpi-Add-MT8195-and-MT8188-compat/20250108-193136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250108112744.64686-3-angelogioacchino.delregno%40collabora.com
patch subject: [PATCH v4 02/34] drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
config: i386-buildonly-randconfig-003-20250109 (https://download.01.org/0day-ci/archive/20250109/202501092326.5Xw3bp4p-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250109/202501092326.5Xw3bp4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501092326.5Xw3bp4p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/mediatek/mtk_dpi.c:22:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/mediatek/mtk_dpi.c:175:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     175 |                 val = FIELD_PREP(DPI_PAT_SEL, type) | DPI_PAT_EN;
         |                       ^
>> drivers/gpu/drm/mediatek/mtk_dpi.c:794:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     794 |         val = FIELD_GET(DPI_PAT_SEL, val);
         |               ^
   1 warning and 2 errors generated.


vim +/FIELD_PREP +175 drivers/gpu/drm/mediatek/mtk_dpi.c

   169	
   170	static void mtk_dpi_test_pattern_en(struct mtk_dpi *dpi, u8 type, bool enable)
   171	{
   172		u32 val;
   173	
   174		if (enable)
 > 175			val = FIELD_PREP(DPI_PAT_SEL, type) | DPI_PAT_EN;
   176		else
   177			val = 0;
   178	
   179		mtk_dpi_mask(dpi, DPI_PATTERN0, val, DPI_PAT_SEL | DPI_PAT_EN);
   180	}
   181	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
