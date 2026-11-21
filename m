Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289495;
	b=HbEI39nPrh5YkNQiwrrwxtqyEfJUzk5IHruSm7zCxvCqrm5tsDXj2OlUsRaKxVIoq9MV
	 Z6f5Q4NmJXAYydrr3r/MGTPD/YeNu2gQTwbkeH6jPKOvh3lsJHEtyW1zDfG/KIbfakCQK
	 p2+hXV6zyZoYsjpxSrxfZ9q+vEMraMaQvB4ocLX2ug49Ao38TRFh0u7ijXVNCF9VNTzU/
	 B+T+h75R5S1sXYJAr2qjRHCrhGzONFeguZS6ANXO9h2bkheHyp2GJYuA0ZxQ5S8QcPIK9
	 cySLLaShwQZ3afr4ogb+/4qRe+gfsOU755ifIiAZO2+qCfuSVzU80NsKtZSH/I37Cww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289495;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=yqFg/CDfhcQQki7rbGu6XmQIamv54cpSA2pIhpeTPrI=;
	b=H0x/FvfV+0A1m3XZmptQWmtoAwJdCesPaH6Id91/PFad4dL84lfg6QnaPRxvV3drVDWk
	 Q8SuYTI+QJJawk/kEm6qnaDkpCtK92aTAzxELoUUeIRFDmuNJ55nP9mDXVErDCGKv38Cs
	 GlG8uPQzCYsEa3AZfCdIUKoR0J1EnByNN25idAs9nCLvPiBgsuki9WpwrkHq3B0YzmuYy
	 fFefjZfYJF12aHyBOzMx5LRGnb1O1Mbl5T7kS4odYSpCfXB2H/7wRghGlVQVJDwyWThoW
	 Kb3hfuKarhC9KyOlQlAUVwb1mnp3U0mADmZNInyGZqbEUQCp/uIk9yN3wY/iz83rjLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZwUmAk8;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C023E606A32A;
	Sat, 21 Nov 2026 19:31:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C023E606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PZwUmAk8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795289494; x=1826825494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9zj66kMuwbMu44FH/2iMUwR4Us5WeWzErC6aqT+gjgA=;
  b=PZwUmAk8DJdS5U+Ob6JiIT/+61l58OoCVpQ5ZPcIez+5JRbWBa0fI16o
   l1rKpN3JwgcqZJNk5VEqZiBLJFTpJ76lbwPAQSEpD/mlJzNnGZAYPiCMo
   QSBya+sCIZBbgI2fXPq1484nlZZ2tWreAriI/8MQmDcMLLeqCDq8uGhfh
   FgxYYZoyE1RP1nkjPpZ701cYYbfOnLrNLM12xCfMoOUT/QtZGginOP3Hp
   SB1BGFDGzypynwsa/afB55kurmaWlE2ZZYom/Ak8nNYKf+CgL1MlTq3jE
   L5eRlcOaIiRaenYycnf1LA0bwpYDig2uylAn9V+Htmf8glYKZjeet80kN
   w==;
X-CSE-ConnectionGUID: ahu8OHWbTxuWFK7/i+YijA==
X-CSE-MsgGUID: 5vwi65/wSzalxVwsr6Y2Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4035644"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4035644"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 11:31:34 -0800
X-CSE-ConnectionGUID: 0ayvV+adR7qaALPVu/CEdg==
X-CSE-MsgGUID: KtrBk2viQS+k/l115C11bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="10859667"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Nov 2026 11:31:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUqo3-00000001KV9-1kKB;
	Sat, 21 Nov 2026 19:31:27 +0000
Date: Sun, 22 Nov 2026 03:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: Paul Cercueil <paul.cercueil@bootlin.com>,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Sunil Kovvuri Goutham <sgoutham@marvell.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	George Cherian <gcherian@marvell.com>,
	Sujeet Baranwal <sbaranwal@marvell.com>,
	Paul Cercueil <paul.cercueil@bootlin.com>
Subject: Re: [PATCH v2 2/2] mailbox: marvell-mhu: add Marvell MHU driver
Message-ID: <202611220344.CTLohdLM-lkp@intel.com>
References: <20261120113952.168265-3-paul.cercueil@bootlin.com>
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
In-Reply-To: <20261120113952.168265-3-paul.cercueil@bootlin.com>

Hi Paul,

kernel test robot noticed the following build errors:

[auto build test ERROR on jassibrar-mailbox/for-next]
[also build test ERROR on robh/for-next krzk-dt/for-next linus/master v7.4-rc3 next-20261119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-Cercueil/dt-bindings-mailbox-add-Marvell-MHU/20261120-123951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git for-next
patch link:    https://lore.kernel.org/r/20261120113952.168265-3-paul.cercueil%40bootlin.com
patch subject: [PATCH v2 2/2] mailbox: marvell-mhu: add Marvell MHU driver
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261122/202611220344.CTLohdLM-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/202611220344.CTLohdLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611220344.CTLohdLM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mailbox/marvell_mhu.c:96:2: error: call to undeclared function 'iowrite64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      96 |         iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
         |         ^
>> drivers/mailbox/marvell_mhu.c:106:11: error: call to undeclared function 'ioread64'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     106 |         status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
         |                  ^
   2 errors generated.


vim +/iowrite64 +96 drivers/mailbox/marvell_mhu.c

    89	
    90	static int mrvl_mhu_send_data(struct mbox_chan *chan, void *data)
    91	{
    92		const u64 doorbell = 0xff;  /* Arbitrary value, SCP requires a value */
    93		struct mrvl_mhu *mhu = chan->con_priv;
    94	
    95		/* signal SCP */
  > 96		iowrite64(doorbell, mhu->base + AP0_TO_SCP_MBOX);
    97	
    98		return 0;
    99	}
   100	
   101	static bool mrvl_mhu_last_tx_done(struct mbox_chan *chan)
   102	{
   103		struct mrvl_mhu *mhu = chan->con_priv;
   104		u64 status;
   105	
 > 106		status = ioread64(mhu->base + AP0_TO_SCP_MBOX_LINT);
   107	
   108		return status != 0;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
