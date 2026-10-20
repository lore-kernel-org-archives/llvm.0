Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792534334;
	b=jV/WUylGVlEi/eRUyOSaCpED1UeUZJLxxlr+44sQsSguGfJt+UjciS9WMHQM6WShj6Wd
	 vrAmtB3LMt1cXt3KFTZKufs3X4Jgv+yPiGrDArfbvt1iA3qRX9T9aO/B2YI8/Dt23D36t
	 sIyIRb9etkWFY7bRzajZpulBLvrKElBEbNC/62F0i/bZQuZtlF+tbUn8WWBUjZkewQ7r8
	 po0qW3PNu85YXiFetg3mLCO5dwGFRKzclzR3kn6dDMIHqkNLESEQtp0ScfgSglYB0xnFV
	 te9eHmRSw2NoCDKdOpOgwPp2V3NAEyLNP2Mj+yuTHxLNU7dLFmFGhPCu8vZBJjgyuuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534334;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=U7au3t5kVB0xpJz0eh7kC1WMWHmi+UbqpJJZk5QKNJc=;
	b=DCGsmi6ERbapP3jnsc7UKT07Df4Ot3F9NlNXQi5aT9XtlJxvlEwGRFiGzF5ykn2j2ZgP
	 1eFklmVUZNfb2kS1N8QUzv0L9tfFx5tNcz9Vavv+6vO0GgpcBcGsWBP7+lTAHxu1CP86R
	 TroLCss8EabtgwmV7wY4/PNp5fRD/khctBD1Ek95xi6Zsut03Tvb9f+0tAIQ333/6T+W3
	 d/mNucXCgP+c3u+IrUjvPLuOdMrKpy36lHTn72HlxPcPUqieGGrnSTZRbc1vvkbgV8iBf
	 z2aqnFKSwQHVmAxZRwOMHljEGkfml68ohOci5bzg4uM/sLdZ9DQ6Z8u8l38v69t4oZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NnHLf/ru";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F4E606A31A;
	Tue, 20 Oct 2026 22:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F4E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NnHLf/ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792534329; x=1824070329;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nMLnoNUxgbBDXPR0Eskw1VxGB7hT2iifAx/KYRgAfCk=;
  b=NnHLf/ruvEioGMm8Kv2wSmuHxiFHExN2Sso3OnxKcvUM7rUgfF0MRdfU
   Kf+pbE1T9qJ8HMTida7jxdZwdaxakWeHEL3JQ5XxQzyemrTx0XOGWjDZ9
   fHG4jF+EGpYPiguVbfAwCXq0SRDSao693xuHCSvd9JeHbyBukMyzaog/m
   10pBQ4q/R/Xn7o8dlSkbpOE5mslYkYmLs17/n3yd9QT+mRFtUw/iFy9Ec
   lvRFm4MwBhNuvbvzgZ9/SIvxQrjmXIA8RizEsddX/iW0XLkOHpGpc01Qp
   /E2Giv1NBa3BqqcQmE+q0Ci/itTfYKsVwTPv3UGjIVDDfQJQgsLBLXC9/
   g==;
X-CSE-ConnectionGUID: eRJT1P+tR+6rVG2O1SCO1g==
X-CSE-MsgGUID: BrTHlzgpQlOcBEFtLL2qdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1266408"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1266408"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 15:12:08 -0700
X-CSE-ConnectionGUID: azN0FdMLQ1efTuEjWMSWzA==
X-CSE-MsgGUID: lh+vEJaNSF+VOlWv6EDDRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2913292"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Oct 2026 15:12:04 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJI3t-00000000OZi-2Ui4;
	Tue, 20 Oct 2026 22:12:01 +0000
Date: Wed, 21 Oct 2026 06:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: Binbin Deng <18983559317@163.com>, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Binbin Deng <18983559317@163.com>
Subject: Re: [PATCH v1] i40e: Lock VF cloud filter list operations
Message-ID: <202610210619.K13qhCpp-lkp@intel.com>
References: <20261020025856.519623-1-18983559317@163.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020025856.519623-1-18983559317@163.com>

Hi Binbin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]
[also build test WARNING on tnguy-net-queue/dev-queue linus/master v7.3 next-20261019]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Binbin-Deng/i40e-Lock-VF-cloud-filter-list-operations/20261020-105856
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20261020025856.519623-1-18983559317%40163.com
patch subject: [PATCH v1] i40e: Lock VF cloud filter list operations
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20261021/202610210619.K13qhCpp-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c419645e808a6667eee9dbb16c828f77e2fd2f0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210619.K13qhCpp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210619.K13qhCpp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:3739 function parameter 'i40e_vf_cloud_filter_lock' not described in 'DEFINE_MUTEX'
>> Warning: drivers/net/ethernet/intel/i40e/i40e_virtchnl_pf.c:3739 expecting prototype for i40e_del_all_cloud_filters(). Prototype was for DEFINE_MUTEX() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
