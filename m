Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B92022C5;
	Tue, 12 Nov 2024 15:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731426268; cv=none; b=F9fzSR35VY1yyVV43fdrHNpf6OIlEVYGegUreQ71THjMQrT8eujcjNvKckpeaOBnwhXF6gZ3V1fy9hB0ynzcK2jPej3+OLxPRKt4eM8uX9afZ782G+uMzKaMlKuSO7FmZPseHVrxNlZirTRiXq2xKAoBolPAXCwWNejWqh7h5r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731426268; c=relaxed/simple;
	bh=mccUYf2M83DikXjv9uUGzr2TEC86jKvPBcdc7spykVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JipTvWOFJCanUYQInqoCs7Mig4ya2a9BFUvRhu/N5hzy/jqdahTcPMLSdrm/KVcVG26Wd5Rc5Ql65YqvMK5zARG6Rh735WlYjQmMJJjINoSC7cpy//8RF3iECincCdZq+L4y9MDx7DTT6Ugx2IHf05KMkiRtXYM1PO2QYxU8A1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XIy8QsKH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XIy8QsKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731426266; x=1762962266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mccUYf2M83DikXjv9uUGzr2TEC86jKvPBcdc7spykVU=;
  b=XIy8QsKHb5ok+94pr4FIGdD/cE0qP+128WunGCBXEOD1odq9CHzFe0a1
   sOZmU9QuOle+zqBLzh/QY1+WvTWMtxQ0wtdsIeV5R1n1sWBTmT7XkDOH1
   PbN6HW9IYU/EYSjhpe8NnNT707xO7rvFgrdq093DLkX0VWeJpozjWgh8c
   ciN8/kyRhckB8w2LbDq2IRKBJ98Z2bA821KH7OX9i9ylayfPDeUszoupl
   6O0ydlHkfL9JjfEBilsNp2o0SVb/Mojkywl9ULIjfGguDpJ46pu+6MQ9R
   y5raEuVD5iayv71yAF4rlCjqkQXLSfEJ09TUXbyBrYFqGAMntXNOZBtQp
   A==;
X-CSE-ConnectionGUID: 1FTPbC65SUCC22Qxfud/gw==
X-CSE-MsgGUID: zneU0WtbRBSHgMLWAHjeqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="48724540"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="48724540"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 07:44:26 -0800
X-CSE-ConnectionGUID: gtBu/eX7TrK345WN+NtzkA==
X-CSE-MsgGUID: cyXqKQILRtuasmuZjfWo3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; 
   d="scan'208";a="91568695"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Nov 2024 07:44:24 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAt42-0001Tx-1q;
	Tue, 12 Nov 2024 15:44:22 +0000
Date: Tue, 12 Nov 2024 23:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-11-12-2 72/86]
 sound/soc/soc-pcm.c:2384:21: error: incompatible pointer types passing
 'struct snd_soc_pcm_runtime *' to parameter of type 'const struct device *'
Message-ID: <202411122317.bbRZejBP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2024-11-12-2
head:   e9ee7637473b0ebd74e4147970a2b809e0b19bc9
commit: abea6749066443c1916d5eb930a6e5aae22095f9 [72/86] ASoC: soc-pcm: use snd_soc_ret()
config: i386-buildonly-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241112/202411122317.bbRZejBP-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241112/202411122317.bbRZejBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411122317.bbRZejBP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/soc-pcm.c:22:
   In file included from include/sound/pcm.h:15:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   sound/soc/soc-pcm.c:741:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
     741 |         int i, ret = 0;
         |                ^
>> sound/soc/soc-pcm.c:2384:21: error: incompatible pointer types passing 'struct snd_soc_pcm_runtime *' to parameter of type 'const struct device *' [-Werror,-Wincompatible-pointer-types]
    2384 |         return snd_soc_ret(fe, ret, "trigger FE cmd: %d failed\n", cmd);
         |                            ^~
   include/sound/soc.h:542:38: note: passing argument to parameter 'dev' here
     542 | int snd_soc_ret(const struct device *dev, int ret, const char *fmt, ...);
         |                                      ^
   2 warnings and 1 error generated.


vim +2384 sound/soc/soc-pcm.c

  2354	
  2355	static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
  2356					  int cmd, bool fe_first)
  2357	{
  2358		struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
  2359		int ret;
  2360	
  2361		/* call trigger on the frontend before the backend. */
  2362		if (fe_first) {
  2363			dev_dbg(fe->dev, "ASoC: pre trigger FE %s cmd %d\n",
  2364				fe->dai_link->name, cmd);
  2365	
  2366			ret = soc_pcm_trigger(substream, cmd);
  2367			if (ret < 0)
  2368				goto end;
  2369	
  2370			ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
  2371			goto end;
  2372		}
  2373	
  2374		/* call trigger on the frontend after the backend. */
  2375		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
  2376		if (ret < 0)
  2377			goto end;
  2378	
  2379		dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
  2380			fe->dai_link->name, cmd);
  2381	
  2382		ret = soc_pcm_trigger(substream, cmd);
  2383	end:
> 2384		return snd_soc_ret(fe, ret, "trigger FE cmd: %d failed\n", cmd);
  2385	}
  2386	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
