Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3B8202F71;
	Tue,  2 Dec 2025 06:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657965; cv=none; b=Ey/p2O9bXGqWVinfOkxSyyiegsbpkek9O45HyKM2aemDvVrQYrbI4uFhIsQcDyDffQ98HM4e1gUxcFUs24mdTfx+QBos4Zso4KIhaC0oMLXjklk4SsL8gpUud3N3k6lnb92jOoDRTfNljC7aNdOxo6RvJ68OJge1jiG+PYU0IlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657965; c=relaxed/simple;
	bh=xvUu9nHZly0piszu1ZiA+g8asjrLCBeG25NFe/p0ML0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FPYAPIpjFOqR1cmzxT0JajmfcAb2M8ZCXh/Ymx5oRVLE6tYzEnegTHUx0ggYVwRUnXBNqqts8UwnJkMxzDIBUn3NbqxbjnA/1fn01407ojyXUT3R9n9llj+QrV7fpzZn0v8LMpkMVLXFechwuVqC0V8mUoSkcENhAmuq6Hr9uSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgJjZ/HB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgJjZ/HB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764657964; x=1796193964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xvUu9nHZly0piszu1ZiA+g8asjrLCBeG25NFe/p0ML0=;
  b=IgJjZ/HByNyRgDKqJgFWX+WE76VBMD9Yat9WIbpV17Zy9Rp4y3yVQsEZ
   jYuEqKyqz9jfg9IqmjTAAgWmIUKjVjd5UWL3uNDyynxbkOwsMOUnGwmbD
   4zjCemznBgn3aRSTQRIL6VBIF4IvkRjNP06GbgaATqt6V7ZB/A0DcxcI1
   l2ByCnGUQr6N1SeX582mONv5qCYPFpAaBRucTPt6Hv4fLQm6oBtDTHWYQ
   l1Ql049SRuIkuysPlm968pU/pwwL+dGhQXqZ6rHWUGoOip10hHbXKJQSX
   sQg/wKC8yvSuSVGprXsiK8KVjEM/Ahr0T5YiXdmFnAWdyF1tmZvWWzh6Z
   w==;
X-CSE-ConnectionGUID: VHcVQWjySs+o652sta2kmQ==
X-CSE-MsgGUID: j3ottxySRfayPXXxMmV1rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66560303"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="66560303"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 22:46:02 -0800
X-CSE-ConnectionGUID: c9c4MKDcRAKvm21hBbnspA==
X-CSE-MsgGUID: fac9cx0bQJyzy9vDzQakRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; 
   d="scan'208";a="217632084"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2025 22:46:01 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQK99-000000009UQ-29B5;
	Tue, 02 Dec 2025 06:45:59 +0000
Date: Tue, 2 Dec 2025 14:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2025-12-01 11/13]
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2383:3: error: field designator
 'pcm_construct' does not refer to any field in type 'const struct
 snd_soc_component_driver'
Message-ID: <202512021418.rt7R26pg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2025-12-01
head:   a5568a9bacc493dbb1465f3b850acf8595553013
commit: bd2deca8dd7083e29460b70bedf2172a397d966b [11/13] ASoC: soc-component: remove pcm_construct()/pcm_destruct()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512021418.rt7R26pg-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021418.rt7R26pg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512021418.rt7R26pg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2383:3: error: field designator 'pcm_construct' does not refer to any field in type 'const struct snd_soc_component_driver'
    2383 |         .pcm_construct = mtk_afe_pcm_new,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8189/mt8189-afe-pcm.c:2384:3: error: field designator 'pcm_destruct' does not refer to any field in type 'const struct snd_soc_component_driver'
    2384 |         .pcm_destruct = mt8189_afe_pcm_free,
         |         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +2383 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c

7eb1535855983f Cyril Chao 2025-10-31  2379  
7eb1535855983f Cyril Chao 2025-10-31  2380  static const struct snd_soc_component_driver mt8189_afe_component = {
7eb1535855983f Cyril Chao 2025-10-31  2381  	.name = AFE_PCM_NAME,
7eb1535855983f Cyril Chao 2025-10-31  2382  	.probe = mt8189_afe_component_probe,
7eb1535855983f Cyril Chao 2025-10-31 @2383  	.pcm_construct = mtk_afe_pcm_new,
7eb1535855983f Cyril Chao 2025-10-31 @2384  	.pcm_destruct = mt8189_afe_pcm_free,
7eb1535855983f Cyril Chao 2025-10-31  2385  	.open = mt8189_afe_pcm_open,
7eb1535855983f Cyril Chao 2025-10-31  2386  	.pointer = mtk_afe_pcm_pointer,
7eb1535855983f Cyril Chao 2025-10-31  2387  };
7eb1535855983f Cyril Chao 2025-10-31  2388  

:::::: The code at line 2383 was first introduced by commit
:::::: 7eb1535855983f67b95c2ba777d686cc17188285 ASoC: mediatek: mt8189: add platform driver

:::::: TO: Cyril Chao <Cyril.Chao@mediatek.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
