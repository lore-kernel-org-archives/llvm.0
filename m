Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D566442381;
	Mon, 17 Aug 2026 15:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786979722; cv=none; b=L/vuRRa31pOhuDSTIbmRXmmepVsDFkstbFobG9SScsmRVrRmFeozFM24GC98429MgltMISROZ0MDNwRKJP/NrpwD7OCeL9pBi+QvAzNjGu0H+wa776eOU5cOHQAu+B0bz+dTbP4+DWLYEb8/wpXvGaNwZdSQA8l+pIy+oAAJ8M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786979722; c=relaxed/simple;
	bh=lD75faxk6T2SqiPx9InsGxlmfBFxceKkBHBdqZZjC04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LxtdzoApnM+GZMhi5lhgVMIMhCm8PSNc2sl+0UUzOWJaDPomaOlziqAuN1LSO8zvFCCLI+INDnQN2z0GCJb+biOFlY7tvYlYVDjcMoa0v9tHq2vQCESsW3URdgbDf7iFbx8Nh+VzIHzMNOzyOnoVdIJwH6pKIZSBEwYddEbb7vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YzPgnnH7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YzPgnnH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786979721; x=1818515721;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lD75faxk6T2SqiPx9InsGxlmfBFxceKkBHBdqZZjC04=;
  b=YzPgnnH7A60Aglx+zrEwUxT1vHgGLVfZsnVJDqFb1wjNKUwxw0WR5lJp
   Pi59YN6MYzB7Yz+tPbI1fWbl20QmzHZG/NFGo1WVNtioYaIaafxuLOzxm
   QuPXRckPEGmPFufolfP+mTPWCi62S5cxgzHEUUUFt+RLkQvd0z0GThIK9
   DiQUW/MlSphr1HgKUWqQpsg4eaD9VhQ0nbum1ebr2+ja4WE9claIBMT9U
   HDGmeOSZahxNAeZMbxE8rhCIHMl2D/VKDPQXoD2+xKMN84MqDSwJm2jGd
   DkNm26QlzB/iQstTQ8tqjjx7uUDKLwf4I4pB83+dsp+wUWT+WyUGrLg1m
   Q==;
X-CSE-ConnectionGUID: R22EG1BaQr63rAGXPjQrZw==
X-CSE-MsgGUID: vf4CvBQeTgKA5q2aLrpVSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87667230"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="87667230"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 08:15:20 -0700
X-CSE-ConnectionGUID: KGDBhN9ySt63IqSQBW8/2Q==
X-CSE-MsgGUID: FI8sOt0ASByiXGenP4TNtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="261198537"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Aug 2026 08:15:17 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvz3S-00000000dY6-2Zou;
	Mon, 17 Aug 2026 15:15:14 +0000
Date: Mon, 17 Aug 2026 23:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Antonin Malzieu Ridolfi via B4 Relay <devnull+dev.nanonej.com@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Antonin Malzieu Ridolfi <dev@nanonej.com>
Subject: Re: [PATCH] gpu: nova-core: Extract PMC registers definitions
Message-ID: <202608172357.txha23v7-lkp@intel.com>
References: <20260804-b4-extract-pmc-registers-to-gpu-mod-v1-1-86c0895b6072@nanonej.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-b4-extract-pmc-registers-to-gpu-mod-v1-1-86c0895b6072@nanonej.com>

Hi Antonin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 44e7e7f7cffb10a93bb88e7cb59b7b8b3e2deb1c]

url:    https://github.com/intel-lab-lkp/linux/commits/Antonin-Malzieu-Ridolfi-via-B4-Relay/gpu-nova-core-Extract-PMC-registers-definitions/20260814-143445
base:   44e7e7f7cffb10a93bb88e7cb59b7b8b3e2deb1c
patch link:    https://lore.kernel.org/r/20260804-b4-extract-pmc-registers-to-gpu-mod-v1-1-86c0895b6072%40nanonej.com
patch subject: [PATCH] gpu: nova-core: Extract PMC registers definitions
config: arm64-randconfig-003-20260817 (https://download.01.org/0day-ci/archive/20260817/202608172357.txha23v7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172357.txha23v7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608172357.txha23v7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unused import: `prelude::*`
   --> drivers/gpu/nova-core/regs.rs:10:5
   |
   10 |     prelude::*,
   |     ^^^^^^^^^^
   |
   = note: `#[warn(unused_imports)]` (part of `#[warn(unused)]`) on by default

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
