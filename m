Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158263;
	b=kQwcnuChYp6nDakIKq3iIRmQJb2h14WX2O2IYzD1+gan25hrQz1YITGg2/Q7wpayowPb
	 6GcfuSwV2Cd1kuxIgK57rFg8VxJJkGF1U7vXH58MsmyLOgSu0me3wO6LBV4+xPbzDUeyW
	 vXpE3u49nO7I339gXePbV+tQRf2Hyv8LJJKw7ZNcvviCCcfP8rc+vC8j90qR/Uum9eIXS
	 ++kbgk0rO67WiNX7E6JqF7PcGU2nSVDSFAXmX2fCedAx4TvDR/I1tFiOM0NEMGaL3egcf
	 BI7QznkxtUXHPOt5TYdPD80yQkNJ04BqewTPp30UmkoNiinoGu3ANR44XX0kIXkv8eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158263;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AMvrVAMtQ57hhi7FxKpIp2O0cYihgRvEweGUrY2zEt0=;
	b=xOZufLJlUGxwIFHpgRAZRXabKn119uNOKZzM9HMgU2WQHKLpWz8//zLo7YU9FBpDCJHN
	 q+oLuvstTdpGBC8x+UelSBmIAfO/BQrAr1sR3V5i3U/0rIsxb1Bng2b70UI47M5FiaXFC
	 dI0btatZuM0da7jnZUxyl5nDCYOFxv8RdV+Y8H4NjrI5uIcl4bWOtUTBjJDxh5VQ2exVf
	 6uIpk+yWuQTqMdk6ByVdzQEXk02Bgs9AADw5BdRJyMs7YsUBNEz7wiNd+PcvJmnzbnZRs
	 c2MJZYfXeJmACqoKbUad9dKoM9IfHcQ2XJwN7qVwcjfcuvoKU7y02us5ZAA8SUMKuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+u3UelS;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECC7606A325;
	Fri, 20 Nov 2026 07:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECC7606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W+u3UelS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795158264; x=1826694264;
  h=date:from:to:cc:subject:message-id;
  bh=46ttVnU+KUi8s7/SAbFOJYdNU7EVqSMALl5Lm4/RpNE=;
  b=W+u3UelS1smf720npFlGqcnwYwE5apvu3d8P8vYDFcolM2iAXxzwjraq
   7ZdbLcjtHwSFPJz53N7zuv0w3tf2zb/NYITRvdW4d/wehiF9p+7iYtdyr
   W3aAwgeNIOa3VzMPw1raiMLlg7ozIn9Wb/DMbZNckBlj0qaBLW54gDiuo
   b1RhbP5DQbX28a+xeikJg697wpc6m3oxvQ+kqbJQhP533a3OHOKPgE3N6
   QphiURU2c1TJkzHYr60Wq/gtwaInCybww5lS9dz4okrmYI072jqVwKeki
   FFZrBB0xh5nl629JoKVPm8x2A5V14QXJSqhMbha4FuhH9UURvLIROFVTY
   w==;
X-CSE-ConnectionGUID: COjJ6M4GTcKSMbEKUbKrKw==
X-CSE-MsgGUID: AqVJtbfaRpSptXL8/SlVFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4038799"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4038799"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 23:04:23 -0800
X-CSE-ConnectionGUID: K7OZi7R5QJW80SgE5OB/8Q==
X-CSE-MsgGUID: YIqJz3twTNejh0gbbZRVYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="10567958"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Nov 2026 22:55:18 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUIWh-00000001HHR-0tk6;
	Fri, 20 Nov 2026 06:55:15 +0000
Date: Fri, 20 Nov 2026 14:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-11-13 351/351]
 sound/soc/soc-compress.c:294:1: error: redefinition of label 'out'
Message-ID: <202611201433.KRK9f62c-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/morimoto/linux sound-cleanup-2026-11-13
head:   437686bf7c08c92113908bda25c90a3a7761459c
commit: 431c6c3e838b47c7c7ff9927e38e9cb46521b08e [351/351] ASoC: soc-compress: use guard(pcm_mutex)
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261120/202611201433.KRK9f62c-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3b14d7c370558b46e5f0c6494a05c492e59bf32c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261120/202611201433.KRK9f62c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611201433.KRK9f62c-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/soc-compress.c:294:1: error: redefinition of label 'out'
     294 | out:
         | ^
   sound/soc/soc-compress.c:290:2: note: previous definition is here
     290 |         out:
         |         ^
   1 error generated.


vim +/out +294 sound/soc/soc-compress.c

   223	
   224	static int soc_compr_open_fe(struct snd_compr_stream *cstream)
   225	{
   226		struct snd_soc_pcm_runtime *fe = cstream->private_data;
   227		struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(fe, 0);
   228		struct snd_soc_dpcm *dpcm;
   229		struct snd_soc_dapm_widget_list *list;
   230		int stream = cstream->direction; /* SND_COMPRESS_xxx is same as SNDRV_PCM_STREAM_xxx */
   231		int ret;
   232	
   233		snd_soc_card_mutex_lock(fe->card);
   234	
   235		ret = soc_compr_alloc_fe_runtime(fe, stream);
   236		if (ret < 0)
   237			goto be_err;
   238	
   239		ret = dpcm_path_get(fe, stream, &list);
   240		if (ret < 0)
   241			goto be_err;
   242	
   243		{
   244			/* avoid scoped_guard() to allow goto */
   245			guard(pcm_mutex)(fe->card);
   246	
   247			/* calculate valid and active FE <-> BE dpcms */
   248			dpcm_add_paths(fe, stream, &list);
   249	
   250			fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
   251	
   252			ret = dpcm_be_dai_startup(fe, stream);
   253			if (ret < 0) {
   254				/* clean up all links */
   255				for_each_dpcm_be(fe, stream, dpcm)
   256					dpcm->state = SND_SOC_DPCM_LINK_STATE_FREE;
   257	
   258				dpcm_be_disconnect(fe, stream);
   259				goto out;
   260			}
   261	
   262			ret = snd_soc_dai_compr_startup(cpu_dai, cstream);
   263			if (ret < 0)
   264				goto out;
   265	
   266			ret = snd_soc_compr_components_open(cstream);
   267			if (ret < 0)
   268				goto open_err;
   269	
   270			ret = snd_soc_link_compr_startup(cstream);
   271			if (ret < 0)
   272				goto machine_err;
   273	
   274			dpcm_clear_pending_state(fe, stream);
   275			dpcm_path_put(&list);
   276	
   277			fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN;
   278			fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
   279	
   280			snd_soc_runtime_stream_user_update(fe, stream, 1);
   281	
   282			/* success */
   283			goto out;
   284	
   285			/* error handling in guard() */
   286		machine_err:
   287			snd_soc_compr_components_free(cstream, 1);
   288		open_err:
   289			snd_soc_dai_compr_shutdown(cpu_dai, cstream, 1);
   290		out:
   291			dpcm_path_put(&list);
   292			goto be_err;
   293		}
 > 294	out:
   295		snd_soc_card_mutex_unlock(fe->card);
   296	
   297		return 0;
   298	
   299	be_err:
   300		soc_compr_free_fe_runtime(fe, stream);
   301		fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_NO;
   302		snd_soc_card_mutex_unlock(fe->card);
   303	
   304		return soc_compr_ret(fe, ret);
   305	}
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
