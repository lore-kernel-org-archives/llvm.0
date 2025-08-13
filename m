Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987F82D12EF;
	Wed, 13 Aug 2025 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755074510; cv=none; b=GH4OOM3YtvUQQyGVBK/GUuJ11NWOD72f9WWuqefsyFFiEpl4mvq75ZXJg0a07Y8X0c0bSgOrLU/3oSDOZulx2NLvhAktTU/77Dg/7xS8d0fIi2kN+bqvEvCMZeBqKYHznalj0eAkl/8SPaZTUo5aKNBDse5XV0l7msECZ8m6mIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755074510; c=relaxed/simple;
	bh=AvZk+zgxuQfiOMg0vQjPpjNzdlByRZBJennwO6coYuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B8udGpaETLCjuVIt7mrwvwAw/NcUuoLMQoVAqxKlEEJpfU6rz3FT79Qr4b+WHFkmQwL+COZjmGjpyic7lU0CrLZWt9e+w55AvKRj3kZQgA7Stv9+D7uyx5rfgVOqlUtfkb/4UkOlR0CbvqCB/HqLGgt9hxFOOksZC70T65lfByU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mlopbG9q; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mlopbG9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755074509; x=1786610509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AvZk+zgxuQfiOMg0vQjPpjNzdlByRZBJennwO6coYuI=;
  b=mlopbG9qT6t/ArcdQNjxvmgBOr9TzK3yZMcB7nDE64Y7ASbBKrv94dUH
   LAMCVpuHGnoFFnCtAE9awHXYvIX+33yn35cxRmbG/RR11LMMrLga/bYJm
   Y2szLoXtIgp+YZxfavcepVo9ia4it9cZwDvlZ4CYiflL50WTjxRhvhoAK
   DwrvfU8PWgzCePnnbblZTgOjoCWTTmOCn6dUJzhJ31+7vQvd6OD2XsRzG
   QkzBgbgs2Pz26vod+azNdoLm3CwD+kJW3p80hm176kItmXTIjmGQHgN/Q
   H9sXX2DXPrc0wZFWRwJ8LnosV1IhKw5uTdhR2kquuXXIbruV7jKMt7tTF
   A==;
X-CSE-ConnectionGUID: 3l6+rczoQCSWFzd7n9/Vng==
X-CSE-MsgGUID: KoUdLQDDSPW53U+Qv/rktQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57440397"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57440397"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 01:41:49 -0700
X-CSE-ConnectionGUID: RV7XY04BTreurR2x4gsvzw==
X-CSE-MsgGUID: iUf6w5csQxWzFgZu06+mIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171742281"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 13 Aug 2025 01:41:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um73J-0009iy-02;
	Wed, 13 Aug 2025 08:41:45 +0000
Date: Wed, 13 Aug 2025 16:41:19 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1736/2153] sound/hda/codecs/ca0132.c:4247:2:
 error: expected expression
Message-ID: <202508131651.BZD3v2Bq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   43c3c17f0c805882d1b48818b1085747a68c80ec
commit: 8d0843bcdd00743dcde94d2af9349fcdce86c8f1 [1736/2153] ALSA: hda/ca0132: Use cleanup macros for PM controls
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250813/202508131651.BZD3v2Bq-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131651.BZD3v2Bq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131651.BZD3v2Bq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/hda/codecs/ca0132.c:4247:2: error: expected expression
    4247 |         CLASS(snd_hda_power, pm)(codec);
         |         ^
   include/linux/cleanup.h:290:2: note: expanded from macro 'CLASS'
     290 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:202:1: note: expanded from here
     202 | class_snd_hda_power_t
         | ^
   1 error generated.


vim +4247 sound/hda/codecs/ca0132.c

  4235	
  4236	static int tuning_ctl_set(struct hda_codec *codec, hda_nid_t nid,
  4237				  const unsigned int *lookup, int idx)
  4238	{
  4239		int i = 0;
  4240	
  4241		for (i = 0; i < TUNING_CTLS_COUNT; i++)
  4242			if (nid == ca0132_tuning_ctls[i].nid)
  4243				goto found;
  4244	
  4245		return -EINVAL;
  4246	found:
> 4247		CLASS(snd_hda_power, pm)(codec);
  4248		dspio_set_param(codec, ca0132_tuning_ctls[i].mid, 0x20,
  4249				ca0132_tuning_ctls[i].req,
  4250				&(lookup[idx]), sizeof(unsigned int));
  4251	
  4252		return 1;
  4253	}
  4254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
