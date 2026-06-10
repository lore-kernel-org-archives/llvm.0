Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33B1361641;
	Wed, 10 Jun 2026 19:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781119982; cv=none; b=U6SZdXkod/N5N/X8AJ5YiU5mav62c+3MaF81RwTSgzRJDR7fwxPHDS6BSKc2gRKSdkmOjfLnyn9yu1o0L7evirtYZCN77ygBrAp617AkFlW2sXQQu8CoIV19XasaCaXYZ+mJ1dbcPLpjv6U9WL7+zVfudTpg64BxDNRRwxJXKTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781119982; c=relaxed/simple;
	bh=GY05IJrZKcxcHjpA8csG4o4QDYOJDwexr7PFGzhyaHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nzbpI99bcwTNrnXJz4J3ZwL7jsWLm5Bcaj7eylo5598RCGXt7csA0Ao4cq3wNNaEydtfb7YJDlic6CkL1GmL6gI/8jEdi2vs/D4ppx4j1SJiGmFxQ6ppVVAUZR6FTQ38Ksi4hkWuUfrmuLLPFXluvYkWTUTpcew4XL0jG3pwNI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i/CSut24; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i/CSut24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781119979; x=1812655979;
  h=date:from:to:cc:subject:message-id;
  bh=GY05IJrZKcxcHjpA8csG4o4QDYOJDwexr7PFGzhyaHc=;
  b=i/CSut24Hplje1O/FUrq82F72kkCuSklGuGwzwPxq7ajJftB1SeE+S4I
   70TLShbmq4EgiZLbipOb8/GC8XDu1BSZA9gYHvQQODLyrLeZjQb2r1cac
   9fOIfYAHghIz3ph663idlbLzOE9aGoUOyOrI2TGOO2d5nDqkkduc0C9IY
   /sMM0362UmFskH94e1Njrx8uChwBG4HOKa2Mq+mjdwXcYkCSTmCsAij0R
   F2TWbYalgljMr40OBJHGFPW5O2zokypClbB9qcCexX7q/pijz5JZeC9IQ
   oRQURVn6x2U7xnSl2FufkzYRGDeurItyL/pNklZfVLh6S4CRrHSLacBcJ
   w==;
X-CSE-ConnectionGUID: +ubKRUJBRJmwanTbODfRRQ==
X-CSE-MsgGUID: pHDMNz37SgG7pK7UdabpWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81987247"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81987247"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 12:32:48 -0700
X-CSE-ConnectionGUID: 1yBt8qdqTQ2GXOwIA2LhLg==
X-CSE-MsgGUID: LLohIqf+RuujZ4mFGGamRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="251179401"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Jun 2026 12:32:47 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXOfL-00000000Los-3vow;
	Wed, 10 Jun 2026 19:32:43 +0000
Date: Thu, 11 Jun 2026 03:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: Li Jun <lijun01@kylinos.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:asoc-7.1 10/10]
 sound/soc/loongson/loongson_dma.c:213:45: warning: format specifies type
 'unsigned int' but the argument has type 'u64' (aka 'unsigned long long')
Message-ID: <202606110332.I6vetCYj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.1
head:   3f3d5a7a065fc9874f671c5afb9dd214f7671946
commit: 3f3d5a7a065fc9874f671c5afb9dd214f7671946 [10/10] ASoC: loongson: Fix invalid position error in ls_pcm_pointer
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260611/202606110332.I6vetCYj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110332.I6vetCYj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110332.I6vetCYj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/loongson/loongson_dma.c:213:45: warning: format specifies type 'unsigned int' but the argument has type 'u64' (aka 'unsigned long long') [-Wformat]
     213 |                 dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
         |                                                    ~~     ^~~~
         |                                                    %llx
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                     ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +213 sound/soc/loongson/loongson_dma.c

   196	
   197	static snd_pcm_uframes_t
   198	loongson_pcm_pointer(struct snd_soc_component *component,
   199			     struct snd_pcm_substream *substream)
   200	{
   201		struct snd_pcm_runtime *runtime = substream->runtime;
   202		struct device *dev = substream->pcm->card->dev;
   203		struct loongson_runtime_data *prtd = runtime->private_data;
   204		struct loongson_dma_desc *desc;
   205		snd_pcm_uframes_t x;
   206		u64 addr;
   207	
   208		desc = dma_desc_save(prtd);
   209		addr = ((u64)desc->saddr_hi << 32) | desc->saddr;
   210	
   211		if (addr < runtime->dma_addr ||
   212		    addr > runtime->dma_addr + runtime->dma_bytes) {
 > 213			dev_warn(dev, "WARNING! dma_addr:0x%x\n", addr);
   214			x = 0;
   215		} else {
   216			x = bytes_to_frames(runtime, addr - runtime->dma_addr);
   217			if (x == runtime->buffer_size)
   218				x = 0;
   219		}
   220	
   221		return x;
   222	}
   223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
