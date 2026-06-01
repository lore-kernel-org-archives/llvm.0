Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B71221B191;
	Mon,  1 Jun 2026 17:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333977; cv=none; b=DXBSiJllr20swYjcq+047HWkj3hH7jA+AIQjKeOPSN2oTX+x0BBevLPpd7rEdG1qTjpmZbiUbZ29giFL4+lR4fIgF/5SfPQyq3lpvkReHUTLEqhZ3DcBDYFaV5HSzvVP8dS4onfdxZ6SJS058RCgzg5suGeEMJTNX9hATS1RffE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333977; c=relaxed/simple;
	bh=HGCBJNT5xHjP7M44PjWLlHo7zAqAqEQVniPaeOFlTk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GkXz5LdU+FJthM4mBq0kcUSNd1Agrj3quph3Oo4lDfhUE0E2Kis6bFQE/xWvIlT2hygrUFAbY8oBG0kD3FqkqqHwJStk1I0Ijc9+o2EU8uHZMJ+bj0Yqxa/mK5XT7gSMvl8QUv+EfcX4EN6c/DgtRxP6Rw8xlmT6m++PEe7xF4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XSYySsPO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XSYySsPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780333976; x=1811869976;
  h=date:from:to:cc:subject:message-id;
  bh=HGCBJNT5xHjP7M44PjWLlHo7zAqAqEQVniPaeOFlTk8=;
  b=XSYySsPOlT36xu1LwTFeWA5p+ta+ETsCB0tYTiRO26grs2GCGiuXUer7
   G9CjLrNn2LMx01k6WdsPtZindWIg/xAPKnr2vLVqq1/Hvt/YXbCf5rUka
   utUX7uYl/O48z5Qo0eYcc9YfsEuYb7m0sO/VQAFBhOpuZXr7Ki6+Gh6rj
   NuDRXzvFNlct/ejyK8xLIbExwk0ixkfbiz0QqbTcdE1b1dC/VrPiOIVdj
   RT3xidyzVthAZowyFXEND96gVTuu3b2qL5gV8lhA0h5N8yvY48bRqkkjT
   V01cQGFkR5DpcZ59QhH4z8NcsZArNQnJO3wdutozFnGuthW9OH4ceEVAn
   Q==;
X-CSE-ConnectionGUID: NYN6/U8DT8eylpFxtLWMFg==
X-CSE-MsgGUID: XZPlDEIPSKux0OtRb6M0JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="80242233"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="80242233"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 10:12:56 -0700
X-CSE-ConnectionGUID: 1aIsH3h0TDWdJjzDgoyuyQ==
X-CSE-MsgGUID: lFxc4wm6Sv2hwxVyRHXuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="281748513"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 01 Jun 2026 10:12:54 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU6C3-00000000Aqc-3UNp;
	Mon, 01 Jun 2026 17:12:51 +0000
Date: Tue, 02 Jun 2026 01:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:37: error: variable has
 incomplete type 'struct snd_soc_card_platform'
Message-ID: <202606020118.nDp97jYk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: ceb4319f163402090427779b85c1ddb46b89fb90 [290/290] ASoC: mediatek: mt2701-cs42448: use snd_soc_card_register()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260602/202606020118.nDp97jYk-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020118.nDp97jYk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020118.nDp97jYk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:37: error: variable has incomplete type 'struct snd_soc_card_platform'
     305 | static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
         |                                     ^
   sound/soc/mediatek/mt2701/mt2701-cs42448.c:305:15: note: forward declaration of 'struct snd_soc_card_platform'
     305 | static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
         |               ^
   1 error generated.


vim +305 sound/soc/mediatek/mt2701/mt2701-cs42448.c

   304	
 > 305	static struct snd_soc_card_platform mt2701_cs42448_card_platform = {
   306		.name = "mt2701-cs42448",
   307		.owner = THIS_MODULE,
   308		.driver = {
   309			.dai_link = mt2701_cs42448_dai_links,
   310			.num_links = ARRAY_SIZE(mt2701_cs42448_dai_links),
   311			.controls = mt2701_cs42448_controls,
   312			.num_controls = ARRAY_SIZE(mt2701_cs42448_controls),
   313			.dapm_widgets = mt2701_cs42448_asoc_card_dapm_widgets,
   314			.num_dapm_widgets = ARRAY_SIZE(mt2701_cs42448_asoc_card_dapm_widgets),
   315		},
   316	};
   317	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
