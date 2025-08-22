Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3EB31AF21;
	Fri, 22 Aug 2025 17:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755882571; cv=none; b=oYS5Sf9a1iKNzYFYRmVJJZHI9LWuncRsuuFfzXMXqDWIVXNndR+hF+yhhikIQHaSsTZxGET70YsKAL0crN6qXmQu548l8SyP90vy/r+S2WJ1kldPHGlLlQo0dXeSZ3PIKzpxUM1TeNiZbRexZ54W5QV08RikoS+qMxGm9fKivqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755882571; c=relaxed/simple;
	bh=7Edpu4iaigfyMUiRCVPJ8Q6j8sogTZ4BIgKymb2DFMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kj7rKvPAdnZaBu9Q8rdeJatYCQCmZFa6K0qaQtoeKwL5Oc2owa31Y2mLB5I1rUcRAhVkgyLA49TpHGDAy7gMBBPdQqKU5Pu6qTrOA3b7LMc2WcVImEeiZu0uYJqDU4D6xv6jtDHMiidIX6hwREoedMZRPRQecuwIotXHGk9Ij+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4+wIUPb; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4+wIUPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755882569; x=1787418569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7Edpu4iaigfyMUiRCVPJ8Q6j8sogTZ4BIgKymb2DFMw=;
  b=C4+wIUPbOdQDw1nkMdDvYgCMGdWe8VQw+N6EaM9/pcy5Dzkvheu99CW/
   Pdgxry7ogt9KfZhBQUB0uHDONzmVvcbvt2aotBlq2E3BVHAIHZEnBWjq0
   b364hUoRWjhnCvKgVieQbezTMHOo/jwETFxVeZoGfbIXBHQMKH8Fw1msB
   Ay9Cl/0ZOzpeRYAJqs7le3qB6jcd91Yhu9W/A+nePQ0We5c4w3v9PjLxe
   o9Fj1gS4/7OAhmH6vqFxBWXWcQLoRJRwohHdkHOZW4oVkD86+Jmio3k0L
   ztc3HJ8DaPnmP1m+H/8mTdvXKuSYRAXrj1CjYtbkuc47jbkxYp/0ZLLhN
   w==;
X-CSE-ConnectionGUID: havs1/f0SZKMGz75TxXZAQ==
X-CSE-MsgGUID: 3HhMaCFCQ0e8VYY/vg1/LQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58145625"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58145625"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 10:09:28 -0700
X-CSE-ConnectionGUID: bSznwY7qTReg8XKsoJX+Qw==
X-CSE-MsgGUID: 5jtGIIBhT2ugTPUQX6bJ8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="168947402"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Aug 2025 10:09:24 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upVG1-000LZR-1i;
	Fri, 22 Aug 2025 17:09:01 +0000
Date: Sat, 23 Aug 2025 01:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Xiandong Wang <xiandong.wang@mediatek.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com,
	vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Xiandong Wang <xiandong.wang@mediatek.com>
Subject: Re: [PATCH v3 3/4] mailbox: mtk-cmdq: Add cmdq driver for mt8189
Message-ID: <202508230035.zCJcuz93-lkp@intel.com>
References: <20250819033746.16405-4-xiandong.wang@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819033746.16405-4-xiandong.wang@mediatek.com>

Hi Xiandong,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on robh/for-next krzk/for-next krzk-dt/for-next linus/master v6.17-rc2 next-20250822]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiandong-Wang/dt-bindings-mailbox-add-cmdq-yaml-for-MT8189/20250819-113946
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20250819033746.16405-4-xiandong.wang%40mediatek.com
patch subject: [PATCH v3 3/4] mailbox: mtk-cmdq: Add cmdq driver for mt8189
config: arm-randconfig-001-20250822 (https://download.01.org/0day-ci/archive/20250823/202508230035.zCJcuz93-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230035.zCJcuz93-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230035.zCJcuz93-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/mtk-cmdq-mailbox.c:781:3: error: field designator 'mminfra_offset' does not refer to any field in type 'const struct gce_plat'
     781 |         .mminfra_offset = 0x40000000, /* 1GB */
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +781 drivers/mailbox/mtk-cmdq-mailbox.c

   777	
   778	static const struct gce_plat gce_plat_mt8189 = {
   779		.thread_nr = 32,
   780		.shift = 3,
 > 781		.mminfra_offset = 0x40000000, /* 1GB */
   782		.control_by_sw = false,
   783		.sw_ddr_en = true,
   784		.gce_num = 2
   785	};
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
