Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590558;
	b=NZluTxth93IB1nuva+9JVDmMGZ0Ny8nu8u1WbQdG9rEW5Qp80K0z9IZy5w5NkNNSUB8v
	 PU8jygDo57GLFcSJsP9kuUO/AR442sbzD7o3LfPZZSVWs9vy5CgZywx04U/Q56oSdmORx
	 4YXoDqJaQXVnsBE0DWIskHxn6Mlw5QKdke/jJzJTpiYMN67arLH2mavDSftVl95mJVcxK
	 WITH8Acc34i5Fvd29dTteDZhzVUfos2e57gZwsWVykw9EaLP1kKxPSnhJUMBDwdjOaqGe
	 b2JGZjNRiy64q4zwiEoJC4f6AhD7ew2spLdUGOeh2G1J7OKcBqziUew87tJV7OjdSNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590558;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qVqGbu3EPmTBW4Twvd08PxwlD0WDu8/1XGnJB3Kbw/4=;
	b=eUYUB/E7a3rNnUzHwExUEjW4+Tekcxa+bPNcGm42NzPMzKmTTEvxJ5bvQ2WELPFCEo0s
	 vPtyp41NtFTav3dyItqbeNPQUoQyQvUWKqhIMxtzQFPRheq6o9146oCIjWyXwUknwbkCp
	 e4J93zRv5lSO1NhPwywaETaXFYLgxAEDGDSVrkd4tyoT3OS9EMpO/tqImxpBwokvDrgRS
	 UYLxKPlj/b826f2Xlwz/0bxWa5Q+tibWs4sS57sjoQn/mmJLajV5azg30NX9vAIYwPtVX
	 22bQ/dEgFCGWEfzx2Ux30wwljXWuZrrnWvOf8z9aneTD3KU6nasgYPY9+Okea3i4dAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eUA5x4Pv;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DF608435F;
	Fri, 13 Nov 2026 17:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 966DF608435F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eUA5x4Pv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794590557; x=1826126557;
  h=date:from:to:cc:subject:message-id;
  bh=0U989mZasGLDYyi895rZ/J1KC+4WrXcFh1J3YMUf5ZE=;
  b=eUA5x4Pv4H2q9+qfsBl8LObk8OacuRKvCuZf5OLeMjHRpu6NMRDFHc2a
   GFnMkt8Br7PwpDgiq8YE3C679Ph2TOG+4Fp6aDovzWCfnnjqEWBaXBDAQ
   ugA7i2Kx2OamE88TDSfP5a0jBvBLRZq5HniiBpbwWeSdJn0tHZ2XMqTvK
   tjWbvutZEqLMC051SXN3LvbQO0YaXUFhsY5Cbc5AklE46dzq8JlkHAAuK
   /6q/IPsFpHhpXiBPLWkGeLARcTUD6evMNe4vqcljTmxY45WaYhzbQssAs
   TBndXHriPHECaDwD4FEoqRm7CC6r4H6pidQbpoBwN0YRLEcF7toeQ/r8V
   w==;
X-CSE-ConnectionGUID: E/sCXJmCQPOcu/Axe9XVXA==
X-CSE-MsgGUID: 9gfdYdCrSl6MemSPlfQ9kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3396314"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3396314"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 09:22:35 -0800
X-CSE-ConnectionGUID: 4b7y1PeTSu+UI0FClKfbOw==
X-CSE-MsgGUID: HfrkO8NfTpSnlsk1aYHI6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="8884408"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2026 09:22:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRuyt-000000013Rh-3yNJ;
	Fri, 13 Nov 2026 17:22:31 +0000
Date: Sat, 14 Nov 2026 01:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-mod-2026-11-06-2 348/348]
 sound/soc/soc-pcm-mod.c:89:19: error: use of undeclared identifier
 'soc_pcm_open'
Message-ID: <202611140104.oIJ6MIS5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-mod-2026-11-06-2
head:   9667cbd3f622480983c9c69e0525b2ca47c07f74
commit: 7454144fb3be295810104db73497ffa2d04a6254 [348/348] hoge
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261114/202611140104.oIJ6MIS5-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1b1fed44d3dcca649a9877915d57c3357a98124e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611140104.oIJ6MIS5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611140104.oIJ6MIS5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-pcm-mod.c:89:19: error: use of undeclared identifier 'soc_pcm_open'
      89 |         rtd->ops.open           = soc_pcm_open;
         |                                   ^~~~~~~~~~~~
>> sound/soc/soc-pcm-mod.c:90:23: error: use of undeclared identifier 'soc_pcm_hw_params'
      90 |         rtd->ops.hw_params      = soc_pcm_hw_params;
         |                                   ^~~~~~~~~~~~~~~~~
>> sound/soc/soc-pcm-mod.c:91:21: error: use of undeclared identifier 'soc_pcm_prepare'
      91 |         rtd->ops.prepare        = soc_pcm_prepare;
         |                                   ^~~~~~~~~~~~~~~
>> sound/soc/soc-pcm-mod.c:92:21: error: use of undeclared identifier 'soc_pcm_trigger'
      92 |         rtd->ops.trigger        = soc_pcm_trigger;
         |                                   ^~~~~~~~~~~~~~~
>> sound/soc/soc-pcm-mod.c:93:21: error: use of undeclared identifier 'soc_pcm_hw_free'
      93 |         rtd->ops.hw_free        = soc_pcm_hw_free;
         |                                   ^~~~~~~~~~~~~~~
>> sound/soc/soc-pcm-mod.c:94:20: error: use of undeclared identifier 'soc_pcm_close'
      94 |         rtd->ops.close          = soc_pcm_close;
         |                                   ^~~~~~~~~~~~~
>> sound/soc/soc-pcm-mod.c:95:21: error: use of undeclared identifier 'soc_pcm_pointer'
      95 |         rtd->ops.pointer        = soc_pcm_pointer;
         |                                   ^~~~~~~~~~~~~~~
   7 errors generated.


vim +/soc_pcm_open +89 sound/soc/soc-pcm-mod.c

    68	
    69	/* create a new pcm */
    70	int soc_new_pcm_mod(struct snd_soc_pcm_runtime *rtd)
    71	{
    72	//	struct snd_soc_component *component;
    73		struct snd_pcm *pcm;
    74		int ret = 0, playback = 0, capture = 0;
    75	
    76		ret = soc_get_playback_capture(rtd, &playback, &capture);
    77		if (ret < 0)
    78			goto err;
    79	
    80		ret = soc_create_pcm(&pcm, rtd, playback, capture);
    81		if (ret < 0)
    82			goto err;
    83	
    84		rtd->pcm		= pcm;
    85		pcm->nonatomic		= rtd->dai_link->nonatomic;
    86		pcm->private_data	= rtd;
    87		pcm->no_device_suspend	= true;
    88	
  > 89		rtd->ops.open		= soc_pcm_open;
  > 90		rtd->ops.hw_params	= soc_pcm_hw_params;
  > 91		rtd->ops.prepare	= soc_pcm_prepare;
  > 92		rtd->ops.trigger	= soc_pcm_trigger;
  > 93		rtd->ops.hw_free	= soc_pcm_hw_free;
  > 94		rtd->ops.close		= soc_pcm_close;
  > 95		rtd->ops.pointer	= soc_pcm_pointer;
    96	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
