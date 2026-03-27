Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2923D15A864;
	Fri, 27 Mar 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627248; cv=none; b=rHKORy5eJ6k1gOcUkLelFHSyHsm3KXk6rBcDGvjmcpzjhj6gOIo3M7VxGqWUnbZPrAXqfCnWvCFQ4XPCtStD8MROlnOaIlwdaDfJUCV99Dr7V0qhW36MhzVwaT8j9WZzPsuvEUxXQhAuntzEeCwzPeZ0HyiksfwGvRYGTzgdBJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627248; c=relaxed/simple;
	bh=8ABsho9fB27uHd0E9e8vJwKZriqU6JH5Anl9iuDxn7o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HdjkN22hKVV1HWK+sMtTq46BwoG55XSMcwnoqsa0xbOZuCoCXpOttLgyp3PDsqVSrAvPMtUSJ/e2njGyupaYsAZBRGrjYMD9zVIvIkll/WGV8GFTaE19EEfg9q+PqUrAVAquBu2wQaFvsuFhsgTOTWLsv+D82EoR+XPRc6KxonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LyuIozf/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LyuIozf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774627246; x=1806163246;
  h=date:from:to:cc:subject:message-id;
  bh=8ABsho9fB27uHd0E9e8vJwKZriqU6JH5Anl9iuDxn7o=;
  b=LyuIozf/W8m9JQGuu4MeoE9vKaN3KLDFfXysueYd90VHhW9Pz5csTnVZ
   rqIfKUt9iQF2fpx41OdwFlUCxTD4tVzs16Jgg7vdcX4Niiz1gT2aQL3r1
   wWZTZmcf5AsG4FWB8TDcbCkcToCLrhBI9USZgqJfVv/Cqyiwk2R1UhPMb
   mxf1cMsgssGOn+isl2OuEAMPe4rtlXVfngMJiEXxw3iXiATSu9kZk3Xjf
   B851QLAUlivACni653l9EDy6LgzM7CdfxJOkX+53UcTTNyN+PQTYzr+50
   ESTdcu82KeXl5t/086uReojMmaFA96fDgSG6xRKWotUGJQgJwG42q3BBV
   A==;
X-CSE-ConnectionGUID: ++eWPBXHRzmCEmbQ5KFxOQ==
X-CSE-MsgGUID: REjNc2kaTNKVzSlkqcpCew==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75901998"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="75901998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 09:00:46 -0700
X-CSE-ConnectionGUID: qG1QRG/FQAG2X5MZ3Lnbwg==
X-CSE-MsgGUID: b6hQJ1YvQq2GH0n1dwv3cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="248387157"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Mar 2026 09:00:44 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w69c1-00000000AQn-3O8v;
	Fri, 27 Mar 2026 16:00:41 +0000
Date: Sat, 28 Mar 2026 00:00:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-03-27 82/106]
 sound/soc/intel/avs/pcm.c:1403:10: warning: variable 'ret' is uninitialized
 when used here
Message-ID: <202603272354.8LQSBKkh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-03-27
head:   b547ff73a13ed8ce92e8e208ccd27884077b160b
commit: a22cf4c5c5139a4eb0afdd43d21ab0c8e359594b [82/106] ASoC: intel: avs: use snd_soc_component_alloc()
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260327/202603272354.8LQSBKkh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260327/202603272354.8LQSBKkh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603272354.8LQSBKkh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/intel/avs/pcm.c:1403:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
    1403 |                 return ret;
         |                        ^~~
   sound/soc/intel/avs/pcm.c:1391:9: note: initialize the variable 'ret' to silence this warning
    1391 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +/ret +1403 sound/soc/intel/avs/pcm.c

  1384	
  1385	int avs_register_component(struct device *dev, const char *name,
  1386				   struct snd_soc_component_driver *drv,
  1387				   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
  1388	{
  1389		struct avs_soc_component *acomp;
  1390		char *cpname;
  1391		int ret;
  1392	
  1393		cpname = devm_kstrdup(dev, name, GFP_KERNEL);
  1394		if (!cpname)
  1395			return -ENOMEM;
  1396	
  1397		acomp = devm_kzalloc(dev, sizeof(*acomp), GFP_KERNEL);
  1398		if (!acomp)
  1399			return -ENOMEM;
  1400	
  1401		acomp->base = snd_soc_component_alloc(dev, drv, NULL, cpname, NULL, NULL);
  1402		if (!acomp->base)
> 1403			return ret;
  1404	
  1405		snd_soc_component_attach_priv(acomp->base, acomp);
  1406		INIT_LIST_HEAD(&acomp->node);
  1407	
  1408		drv->use_dai_pcm_id = !obsolete_card_names;
  1409	
  1410		return snd_soc_component_add(acomp->base, cpu_dais, num_cpu_dais);
  1411	}
  1412	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
