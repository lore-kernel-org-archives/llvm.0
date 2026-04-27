Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD30D3AC0CC;
	Mon, 27 Apr 2026 11:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777287891; cv=none; b=QVpG82pXaoKcEpJOMwV9t5bRemTnv8LrNNZ3DmL39vNIQxvVlpbfBNoYcLcu8JlvgX2lzyb3ujRE4cjU9EwLUYIs4Q2XfoSzSNZ/zPMNqL5aGr810MUcJ8dm1gMYDxGVYB5gLXg8dr9N8fvGt71Jz07W6P8stSZ0YRXZJUr6cAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777287891; c=relaxed/simple;
	bh=f40pND1xsnfSVnpjGjx032CYMDceAay0/ouLWhlM718=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZSib54YpyX56HVeMpZ2z6t4DJ6sIYtY+7JgX+syqMuPzbMISRCQZx25Ql23kjYiWI7GTLaxbXwoK4mMNi/zdDFAaLdTT59MJbJozTG6Yi8+iYs8ErgnwM/oEGkH52jEAIVVSEfsua/gjnleeFhctWGt02OuzJGXtmPufiWKBuMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QefVRpWQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QefVRpWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777287890; x=1808823890;
  h=date:from:to:cc:subject:message-id;
  bh=f40pND1xsnfSVnpjGjx032CYMDceAay0/ouLWhlM718=;
  b=QefVRpWQFqU/5doJo8qupiJNQhznipMriGlme5jQwc27evX7uABSYtyD
   x4hMlJQolKCdQOUj/WovJBdlFnehBM5p0ReMPSF9svQpgyBLdLy732aRw
   ykktDcl7VlGNE4F0hrYI9pYf3x7d3jjv0FbmQztihZMuP5h7swehxIyih
   oaUqcsLpwPQFmJRpYwm6sDhBrY2iyAp1TP3pZMeQrpyzivu/wrXiNp0/f
   wmRyrNErBJtf1ca617XBqI56NTKcvvMMV5Eauup2Z+ryIOap5pdskxBFw
   PjGMJGRxFt+5wGJrwbpJfn+49jSJBb4ionRWkEtEiOzN2Cs6F8i+jjJ8/
   A==;
X-CSE-ConnectionGUID: Cg0kXpBZRVO3Pijakcskdg==
X-CSE-MsgGUID: talsqEJaQwKVMiaZKQVtwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78285056"
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="78285056"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 04:04:43 -0700
X-CSE-ConnectionGUID: ZgIgz3nvQuyqey7Xbrivog==
X-CSE-MsgGUID: xg/cSGgNRpuHZ7+2G/I24Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,202,1770624000"; 
   d="scan'208";a="229044484"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 04:04:41 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHJlW-000000008jB-3vrX;
	Mon, 27 Apr 2026 11:04:38 +0000
Date: Mon, 27 Apr 2026 19:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy-7.1 22/22]
 sound/soc/pxa/pxa2xx-pcm.c:21:19: error: use of undeclared identifier
 'pxa2xx_soc_pcm_new'
Message-ID: <202604271842.4gvTibgw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy-7.1
head:   bbb302c86fdfa7705d8511a74c4b6db205cd2683
commit: bbb302c86fdfa7705d8511a74c4b6db205cd2683 [22/22] ASoC: pxa: integrate sound/arm/pxa2xx into sound/soc/pxa2xx
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260427/202604271842.4gvTibgw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260427/202604271842.4gvTibgw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604271842.4gvTibgw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> sound/soc/pxa/pxa2xx-pcm.c:21:19: error: use of undeclared identifier 'pxa2xx_soc_pcm_new'
      21 |         .pcm_construct  = pxa2xx_soc_pcm_new,
         |                           ^
>> sound/soc/pxa/pxa2xx-pcm.c:22:11: error: use of undeclared identifier 'pxa2xx_soc_pcm_open'; did you mean 'pxa2xx_soc_platform'?
      22 |         .open           = pxa2xx_soc_pcm_open,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           pxa2xx_soc_platform
   sound/soc/pxa/pxa2xx-pcm.c:20:46: note: 'pxa2xx_soc_platform' declared here
      20 | static const struct snd_soc_component_driver pxa2xx_soc_platform = {
         |                                              ^
>> sound/soc/pxa/pxa2xx-pcm.c:23:12: error: use of undeclared identifier 'pxa2xx_soc_pcm_close'; did you mean 'pxa2xx_soc_platform'?
      23 |         .close          = pxa2xx_soc_pcm_close,
         |                           ^~~~~~~~~~~~~~~~~~~~
         |                           pxa2xx_soc_platform
   sound/soc/pxa/pxa2xx-pcm.c:20:46: note: 'pxa2xx_soc_platform' declared here
      20 | static const struct snd_soc_component_driver pxa2xx_soc_platform = {
         |                                              ^
>> sound/soc/pxa/pxa2xx-pcm.c:24:15: error: use of undeclared identifier 'pxa2xx_soc_pcm_hw_params'
      24 |         .hw_params      = pxa2xx_soc_pcm_hw_params,
         |                           ^
>> sound/soc/pxa/pxa2xx-pcm.c:25:13: error: use of undeclared identifier 'pxa2xx_soc_pcm_prepare'
      25 |         .prepare        = pxa2xx_soc_pcm_prepare,
         |                           ^
>> sound/soc/pxa/pxa2xx-pcm.c:26:13: error: use of undeclared identifier 'pxa2xx_soc_pcm_trigger'
      26 |         .trigger        = pxa2xx_soc_pcm_trigger,
         |                           ^
>> sound/soc/pxa/pxa2xx-pcm.c:27:13: error: use of undeclared identifier 'pxa2xx_soc_pcm_pointer'
      27 |         .pointer        = pxa2xx_soc_pcm_pointer,
         |                           ^
   7 errors generated.
--
>> sound/soc/pxa/pxa2xx-pcm-lib.c:60:8: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      60 | static pxa2xx_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
         | ~~~~~~ ^
         | int
>> sound/soc/pxa/pxa2xx-pcm-lib.c:127:5: warning: no previous prototype for function 'pxa2xx_soc_pcm_new' [-Wmissing-prototypes]
     127 | int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
         |     ^
   sound/soc/pxa/pxa2xx-pcm-lib.c:127:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     127 | int pxa2xx_soc_pcm_new(struct snd_soc_component *component,
         | ^
         | static 
>> sound/soc/pxa/pxa2xx-pcm-lib.c:142:5: warning: no previous prototype for function 'pxa2xx_soc_pcm_open' [-Wmissing-prototypes]
     142 | int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
         |     ^
   sound/soc/pxa/pxa2xx-pcm-lib.c:142:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     142 | int pxa2xx_soc_pcm_open(struct snd_soc_component *component,
         | ^
         | static 
>> sound/soc/pxa/pxa2xx-pcm-lib.c:149:5: warning: no previous prototype for function 'pxa2xx_soc_pcm_close' [-Wmissing-prototypes]
     149 | int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
         |     ^
   sound/soc/pxa/pxa2xx-pcm-lib.c:149:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     149 | int pxa2xx_soc_pcm_close(struct snd_soc_component *component,
         | ^
         | static 
>> sound/soc/pxa/pxa2xx-pcm-lib.c:156:5: warning: no previous prototype for function 'pxa2xx_soc_pcm_hw_params' [-Wmissing-prototypes]
     156 | int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
         |     ^
   sound/soc/pxa/pxa2xx-pcm-lib.c:156:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     156 | int pxa2xx_soc_pcm_hw_params(struct snd_soc_component *component,
         | ^
         | static 
>> sound/soc/pxa/pxa2xx-pcm-lib.c:164:5: warning: no previous prototype for function 'pxa2xx_soc_pcm_prepare' [-Wmissing-prototypes]
     164 | int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
         |     ^
   sound/soc/pxa/pxa2xx-pcm-lib.c:164:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     164 | int pxa2xx_soc_pcm_prepare(struct snd_soc_component *component,
         | ^
         | static 
>> sound/soc/pxa/pxa2xx-pcm-lib.c:171:5: warning: no previous prototype for function 'pxa2xx_soc_pcm_trigger' [-Wmissing-prototypes]
     171 | int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
         |     ^
   sound/soc/pxa/pxa2xx-pcm-lib.c:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     171 | int pxa2xx_soc_pcm_trigger(struct snd_soc_component *component,
         | ^
         | static 
>> sound/soc/pxa/pxa2xx-pcm-lib.c:179:1: warning: no previous prototype for function 'pxa2xx_soc_pcm_pointer' [-Wmissing-prototypes]
     179 | pxa2xx_soc_pcm_pointer(struct snd_soc_component *component,
         | ^
   sound/soc/pxa/pxa2xx-pcm-lib.c:178:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     178 | snd_pcm_uframes_t
         | ^
         | static 
   7 warnings and 1 error generated.


vim +/pxa2xx_soc_pcm_new +21 sound/soc/pxa/pxa2xx-pcm.c

f11a96d5cd9420 Liam Girdwood     2006-10-12  19  
0717e66f404123 Kuninori Morimoto 2018-01-29  20  static const struct snd_soc_component_driver pxa2xx_soc_platform = {
f8772e17def204 Kuninori Morimoto 2019-10-02 @21  	.pcm_construct	= pxa2xx_soc_pcm_new,
f8772e17def204 Kuninori Morimoto 2019-10-02 @22  	.open		= pxa2xx_soc_pcm_open,
f8772e17def204 Kuninori Morimoto 2019-10-02 @23  	.close		= pxa2xx_soc_pcm_close,
f8772e17def204 Kuninori Morimoto 2019-10-02 @24  	.hw_params	= pxa2xx_soc_pcm_hw_params,
f8772e17def204 Kuninori Morimoto 2019-10-02 @25  	.prepare	= pxa2xx_soc_pcm_prepare,
f8772e17def204 Kuninori Morimoto 2019-10-02 @26  	.trigger	= pxa2xx_soc_pcm_trigger,
f8772e17def204 Kuninori Morimoto 2019-10-02 @27  	.pointer	= pxa2xx_soc_pcm_pointer,
f11a96d5cd9420 Liam Girdwood     2006-10-12  28  };
f11a96d5cd9420 Liam Girdwood     2006-10-12  29  

:::::: The code at line 21 was first introduced by commit
:::::: f8772e17def20470f94bd1d6e1cf24badb2611de ASoC: pxa: remove snd_pcm_ops

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
