Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA98836C0D8;
	Sat, 31 Jan 2026 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769889631; cv=none; b=SO7TwLkT8/jXLYmYefqqlljH3q7mGBVASQi6fdfBnOJkHwuYtjX/u3wNkExDSdjVEVXoOLraTAOwhkSs0wV4hntkx9dfDmOsu30xG8TixYNzYz6JkqJbvsQKaIfaaXcyEftcA1wSRy9FpfKcAkdqkR/J3pDyeoM/aY9i+S/uoxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769889631; c=relaxed/simple;
	bh=ol8unZvcrs7b+wmiigLrZH4qV/mo3pcnEn/GyeKvrcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfCb7U+xMk6O+kZeOR7QmFmdG5zbDGLBoADEtC2pTWcS6H3IKTTamh2bs78EJJfDcJfhAmn/w8XCxR24EdnthWAr3EWORVptrXsLTDhxmswH1AyrWTjjJ98DGbCV5zOSRRu0e1jVxDOc4l38C0uluzm+UnXU/6DiQEUbf0qMoZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9v+SoCl; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9v+SoCl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769889630; x=1801425630;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ol8unZvcrs7b+wmiigLrZH4qV/mo3pcnEn/GyeKvrcM=;
  b=i9v+SoCl//grpbPL2SSUCOacQweUHrK1apqsBOOvQqB/M5MWwOYUzJYn
   XkteVwy6t9S4Sckpm7u1/evVK/2yK5qbvmqpYlMRaldyPzoQGpigOt8tm
   95R9cEW6N7n7wi6GT0mSs6LWzv2h9MR+TUM2ReS8l4nLoCHSf67KUI2no
   mqyrUAd+xGJ2bk0U+jcTV0TdtKcOiQ6dNzHwfK11WvKYNms5XO75g50+t
   Fn/LrvjiIX5dzmimKYZzVoEtqp40MHDCK9dA4ri6YOsRLdr5mYEBMs82h
   Cr6TyXbZZBuH9qxnF9uYTJQyzDM16paZiMKKlnPhBcJFHVb+3K7xdNvm7
   Q==;
X-CSE-ConnectionGUID: qxNO4bWDRK+TsN2e3RshXQ==
X-CSE-MsgGUID: f0MufvNeSXSCoH+CCxP9xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="70826729"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="70826729"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 12:00:30 -0800
X-CSE-ConnectionGUID: nIvlyUqkT6uIvcCzCmQ7JQ==
X-CSE-MsgGUID: 3i8mf/KwT0GpNNEu8pLXpA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jan 2026 12:00:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmH8q-00000000eLE-1Y4x;
	Sat, 31 Jan 2026 20:00:24 +0000
Date: Sun, 1 Feb 2026 03:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
Message-ID: <202602010337.D6tyoDtw-lkp@intel.com>
References: <20260131094547.455916-6-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131094547.455916-6-zhengxingda@iscas.ac.cn>

Hi Icenowy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on robh/for-next krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.19-rc7 next-20260130]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/genirq-reserve-NR_IRQS_LEGACY-IRQs-in-dynirq-by-default/20260131-175403
base:   tip/irq/core
patch link:    https://lore.kernel.org/r/20260131094547.455916-6-zhengxingda%40iscas.ac.cn
patch subject: [PATCH 5/8] irqchip/loongson-pch-lpc: add OF init code
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20260201/202602010337.D6tyoDtw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260201/202602010337.D6tyoDtw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602010337.D6tyoDtw-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: pch_lpc_of_init+0xa8 (section: .text) -> pch_lpc_init (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
