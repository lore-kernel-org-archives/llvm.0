Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D8C1CDFAC;
	Thu, 14 Aug 2025 19:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755199946; cv=none; b=dRFs5KGuCFyFXKIIWprsqKbZzEDsj8ZnJeb+/8KBKkko+2U/Qod5IeIIxLm5gfpT8YGng4U3g4UABTiUOZz199xIyeK1OGJPHvcJoDPirQhSL4giG4ZVORtlsJ4Lc4SDDFP6M8p9y7Q0wbXPbUEuMDUjw0tQ5qUHIas/goJeV8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755199946; c=relaxed/simple;
	bh=sYNHy3au3eJJGLyMM/KY+GBcda4zdf0KZ+o9Rn0lDjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZi2ECAFOhZjWWezQr5kXRwyXhAW34v4+nRIRpcmAaNq8IXQ8Oal1dMFUGSFb2eC7Ga2ytDKMOjtXYtOTlTodXi4JtlcD+gZunAxVhYfXgJ0/6EwaJQsC6Hbr4pxiHZ4/FPgZ6m7RsFkKd9Hq/3VDOxV8z66cxnnucrx+1wp48c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JK0IFjMb; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JK0IFjMb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755199945; x=1786735945;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sYNHy3au3eJJGLyMM/KY+GBcda4zdf0KZ+o9Rn0lDjo=;
  b=JK0IFjMbwybg34jFwfT0lDsJt7NLwAkhgjhHigNvrYlovYWqWP6ZONmA
   zJm18srtuVPPLiIupYgU8Sh1+MOZCChUcCC13lc5ciYwF9eB58UKLm/pI
   016PKHaCjQ7ZJqHHlBpdrrwuHhR2rTpptZA7Ml4YgE16IhshmXJyYAD15
   RsToZpz3lQK4eSNls1NkqkPRpvY023Uo8VQ18lzVf9V8vb1q+KBzq1N4F
   HXGbJLaaG808Z4XjssL6GTmQdFhCyEdvExJFrmYQOePDqWnMtCIG0+COn
   ZEycuAcZfiJ19Y933nf4sAgLxecB93F3KIuuKqGcDTShs7O3XoIPxhTn6
   g==;
X-CSE-ConnectionGUID: QanCejUtRKeTBi5TqY5ATg==
X-CSE-MsgGUID: ldhG5sHGS0uESxZO8NBBdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68226980"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68226980"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 12:32:23 -0700
X-CSE-ConnectionGUID: Zw1G2UnqTsuBfPLENwqAVA==
X-CSE-MsgGUID: EWHfKfNOQs+XEJGaMZISwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166807007"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2025 12:32:19 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umdgP-000BGs-08;
	Thu, 14 Aug 2025 19:32:17 +0000
Date: Fri, 15 Aug 2025 03:31:56 +0800
From: kernel test robot <lkp@intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Houlong Wei <houlong.wei@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: Re: [PATCH v1 2/4] [v1,02/04]mailbox: mtk-cmdq: Add cmdq driver for
 mt8189
Message-ID: <202508150338.bTVJvFtV-lkp@intel.com>
References: <20250814070401.13432-2-xiandong.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814070401.13432-2-xiandong.wang@mediatek.com>

Hi Xiandong,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiandong-Wang/mailbox-mtk-cmdq-Add-cmdq-driver-for-mt8189/20250814-152237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20250814070401.13432-2-xiandong.wang%40mediatek.com
patch subject: [PATCH v1 2/4] [v1,02/04]mailbox: mtk-cmdq: Add cmdq driver for mt8189
config: x86_64-buildonly-randconfig-004-20250815 (https://download.01.org/0day-ci/archive/20250815/202508150338.bTVJvFtV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150338.bTVJvFtV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150338.bTVJvFtV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mtk-cmdq-mailbox.c:781:3: error: field designator 'mminfra_offset' does not refer to any field in type 'const struct gce_plat'
     781 |         .mminfra_offset = 0x40000000, /* 1GB */
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-cmdq-mailbox.c:784:3: error: field designator 'dma_mask_bit' does not refer to any field in type 'const struct gce_plat'
     784 |         .dma_mask_bit = 35,
         |         ~^~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-cmdq-mailbox.c:785:3: error: field designator 'secure_thread_nr' does not refer to any field in type 'const struct gce_plat'
     785 |         .secure_thread_nr = 2,
         |         ~^~~~~~~~~~~~~~~~~~~~
>> drivers/mailbox/mtk-cmdq-mailbox.c:786:3: error: field designator 'secure_thread_min' does not refer to any field in type 'const struct gce_plat'
     786 |         .secure_thread_min = 8,
         |         ~^~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +781 drivers/mailbox/mtk-cmdq-mailbox.c

   777	
   778	static const struct gce_plat gce_plat_mt8189 = {
   779		.thread_nr = 32,
   780		.shift = 3,
 > 781		.mminfra_offset = 0x40000000, /* 1GB */
   782		.control_by_sw = false,
   783		.sw_ddr_en = true,
 > 784		.dma_mask_bit = 35,
 > 785		.secure_thread_nr = 2,
 > 786		.secure_thread_min = 8,
   787		.gce_num = 2
   788	};
   789	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
