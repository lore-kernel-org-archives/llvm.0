Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C74329E62;
	Fri, 20 Feb 2026 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771605744; cv=none; b=h5Dvhn53PQQZNkFX2tEIhhArCmx4bKPFmr1o5vM4f4kKvTyenpxLyEeJusZc6FdzJ0kUVuMVABqVq3qjlK5gmYkatIMvDV3pArQQunXce7VTLLaf9AXNu7yhRPX4fyajlqgCqnkHCPy47kh5jHfrycZfQPboIkvlwEoxb/OOPMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771605744; c=relaxed/simple;
	bh=r/sepJixBPg/xRKnzkRcAHGgzdrf4uO3hhAe8zR/u1s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SWenlInCWvOv58qgnv5EduUTu44GKim/RbsrRJypvHwV0II1chj6aJ49SllNcYAyjAXlhXQyGfUwH57t9LqqrSHat2Wwq9wCprMpnpj0Y0Lt/xXxyhZ96Rh8mleXHJb2O7lDh91FxhHFEBQosIjuZGADhKDNQ7KLg5XGb5EksQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhWNP+1C; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhWNP+1C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771605742; x=1803141742;
  h=date:from:to:cc:subject:message-id;
  bh=r/sepJixBPg/xRKnzkRcAHGgzdrf4uO3hhAe8zR/u1s=;
  b=UhWNP+1CjZy9JSRkDpB7Gc5NJbq07XF6GDb/A6+ZgJAp2n8LQa1Gir7P
   mTRyWmvxCcUYJea5mMcCM2xTKxUKxV+UPfscv2IfY5mZpCjndeCZYGZJU
   L4atGqh1oeAKcG1rkNSpCzacqfcgcwmLDpaB1zt4r7gYC8n/1YBu90Wfj
   FPsbvJHcX737oP9YidKx4dnzeAS0y4uIoWLCnBjePSq1BdWX560dYmDo5
   kyHmwJumL0RjV+25KnRhbbR2IYY3WB11DhVX5Y+L8RmrlqZwP3aio7jTW
   d2nKPUT1ugAAHn9ZAlgp7PF/5nxqUiKPwiMTz2kNxkwQu0R7UbU6mAqdA
   g==;
X-CSE-ConnectionGUID: epMr/DxLQ/2Vul/PtnWiEg==
X-CSE-MsgGUID: Md8NpqjkTQyEbOEJ9u9dhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72606491"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72606491"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 08:42:21 -0800
X-CSE-ConnectionGUID: 3ndrb6gTTCehhBOiB0eeFg==
X-CSE-MsgGUID: yyqwBIkqRqOHJIbnKFkPlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219894205"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 20 Feb 2026 08:42:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtTa5-000000014H8-1tTW;
	Fri, 20 Feb 2026 16:42:17 +0000
Date: Sat, 21 Feb 2026 00:41:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-02-20 65/66]
 sound/soc/pxa/mmp-sspa.c:329:2: error: call to undeclared function
 'snd_soc_dai_init_dma_data'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202602210031.mVN5nMag-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-02-20
head:   e7fa84e2f755a12d6e0312da700bb8f6038c035c
commit: d7a632d3e1073660fc408d04ffbfaa71447def6c [65/66] remove define
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260221/202602210031.mVN5nMag-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210031.mVN5nMag-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210031.mVN5nMag-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/pxa/mmp-sspa.c:110:30: error: incomplete definition of type 'struct snd_soc_dai'
     110 |         struct device *dev = cpu_dai->component->dev;
         |                              ~~~~~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/pxa/mmp-sspa.c:138:30: error: incomplete definition of type 'struct snd_soc_dai'
     138 |         struct device *dev = cpu_dai->component->dev;
         |                              ~~~~~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/pxa/mmp-sspa.c:216:26: error: incomplete definition of type 'struct snd_soc_dai'
     216 |         struct device *dev = dai->component->dev;
         |                              ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/pxa/mmp-sspa.c:327:46: error: incomplete definition of type 'struct snd_soc_dai'
     327 |         struct sspa_priv *sspa = dev_get_drvdata(dai->dev);
         |                                                  ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
>> sound/soc/pxa/mmp-sspa.c:329:2: error: call to undeclared function 'snd_soc_dai_init_dma_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |         snd_soc_dai_init_dma_data(dai,
         |         ^
   5 errors generated.
--
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:186:34: error: call to undeclared function 'snd_soc_dai_get_widget_playback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |         struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                         ^
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:186:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     186 |         struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                     ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:187:34: error: call to undeclared function 'snd_soc_dai_get_widget_capture'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     187 |         struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                         ^
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:187:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     187 |         struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                     ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:189:67: error: incomplete definition of type 'struct snd_soc_dai'
     189 |         unsigned int rate_reg = mt6797_rate_transform(afe->dev, rate, dai->id);
         |                                                                       ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:194:6: error: incomplete definition of type 'struct snd_soc_dai'
     194 |                 dai->id,
         |                 ~~~^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:204:13: error: incomplete definition of type 'struct snd_soc_dai'
     204 |         switch (dai->id) {
         |                 ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt6797/mt6797-dai-pcm.c:235:18: error: incomplete definition of type 'struct snd_soc_dai'
     235 |                          __func__, dai->id);
         |                                    ~~~^
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                             ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   8 errors generated.
--
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:186:34: error: call to undeclared function 'snd_soc_dai_get_widget_playback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     186 |         struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                         ^
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:186:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     186 |         struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                     ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:187:34: error: call to undeclared function 'snd_soc_dai_get_widget_capture'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     187 |         struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                         ^
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:187:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     187 |         struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                     ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:189:67: error: incomplete definition of type 'struct snd_soc_dai'
     189 |         unsigned int rate_reg = mt8183_rate_transform(afe->dev, rate, dai->id);
         |                                                                       ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:194:6: error: incomplete definition of type 'struct snd_soc_dai'
     194 |                 dai->id,
         |                 ~~~^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:203:13: error: incomplete definition of type 'struct snd_soc_dai'
     203 |         switch (dai->id) {
         |                 ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8183/mt8183-dai-pcm.c:234:18: error: incomplete definition of type 'struct snd_soc_dai'
     234 |                          __func__, dai->id);
         |                                    ~~~^
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                             ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   8 errors generated.
--
>> sound/soc/mediatek/mt8189/mt8189-dai-pcm.c:230:3: error: call to undeclared function 'snd_soc_dai_get_widget'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     230 |                 snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_PLAYBACK);
         |                 ^
>> sound/soc/mediatek/mt8189/mt8189-dai-pcm.c:229:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     229 |         struct snd_soc_dapm_widget *playback_widget =
         |                                     ^
     230 |                 snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_PLAYBACK);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8189/mt8189-dai-pcm.c:231:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     231 |         struct snd_soc_dapm_widget *capture_widget =
         |                                     ^
     232 |                 snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_CAPTURE);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8189/mt8189-dai-pcm.c:240:6: error: incomplete definition of type 'struct snd_soc_dai'
     240 |                 dai->id, substream->stream, rate, rate_reg,
         |                 ~~~^
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                              ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8189/mt8189-dai-pcm.c:245:13: error: incomplete definition of type 'struct snd_soc_dai'
     245 |         switch (dai->id) {
         |                 ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8189/mt8189-dai-pcm.c:270:17: error: incomplete definition of type 'struct snd_soc_dai'
     270 |                         __func__, dai->id);
         |                                   ~~~^
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   6 errors generated.
--
>> sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:276:34: error: call to undeclared function 'snd_soc_dai_get_widget_playback'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     276 |         struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                         ^
>> sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:276:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     276 |         struct snd_soc_dapm_widget *p = snd_soc_dai_get_widget_playback(dai);
         |                                     ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:277:34: error: call to undeclared function 'snd_soc_dai_get_widget_capture'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |         struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                         ^
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:277:30: error: incompatible integer to pointer conversion initializing 'struct snd_soc_dapm_widget *' with an expression of type 'int' [-Wint-conversion]
     277 |         struct snd_soc_dapm_widget *c = snd_soc_dai_get_widget_capture(dai);
         |                                     ^   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:279:67: error: incomplete definition of type 'struct snd_soc_dai'
     279 |         unsigned int rate_reg = mt8192_rate_transform(afe->dev, rate, dai->id);
         |                                                                       ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:284:7: error: incomplete definition of type 'struct snd_soc_dai'
     284 |                  dai->id,
         |                  ~~~^
   include/linux/dev_printk.h:160:67: note: expanded from macro 'dev_info'
     160 |         dev_printk_index_wrap(_dev_info, KERN_INFO, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:294:13: error: incomplete definition of type 'struct snd_soc_dai'
     294 |         switch (dai->id) {
         |                 ~~~^
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   sound/soc/mediatek/mt8192/mt8192-dai-pcm.c:325:18: error: incomplete definition of type 'struct snd_soc_dai'
     325 |                          __func__, dai->id);
         |                                    ~~~^
   include/linux/dev_printk.h:156:70: note: expanded from macro 'dev_warn'
     156 |         dev_printk_index_wrap(_dev_warn, KERN_WARNING, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                             ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                                     ^~~~~~~~~~~
   include/sound/soc.h:413:8: note: forward declaration of 'struct snd_soc_dai'
     413 | struct snd_soc_dai;
         |        ^
   8 errors generated.


vim +/snd_soc_dai_init_dma_data +329 sound/soc/pxa/mmp-sspa.c

fa375d42f0e531 Zhangfei Gao   2012-06-11  324  
fa375d42f0e531 Zhangfei Gao   2012-06-11  325  static int mmp_sspa_probe(struct snd_soc_dai *dai)
fa375d42f0e531 Zhangfei Gao   2012-06-11  326  {
3c4e89df3b4534 Lubomir Rintel 2020-05-11  327  	struct sspa_priv *sspa = dev_get_drvdata(dai->dev);
fa375d42f0e531 Zhangfei Gao   2012-06-11  328  
c9aeda1c94973f Lubomir Rintel 2020-05-11 @329  	snd_soc_dai_init_dma_data(dai,
3c4e89df3b4534 Lubomir Rintel 2020-05-11  330  				&sspa->playback_dma_data,
3c4e89df3b4534 Lubomir Rintel 2020-05-11  331  				&sspa->capture_dma_data);
c9aeda1c94973f Lubomir Rintel 2020-05-11  332  
fa375d42f0e531 Zhangfei Gao   2012-06-11  333  	return 0;
fa375d42f0e531 Zhangfei Gao   2012-06-11  334  }
fa375d42f0e531 Zhangfei Gao   2012-06-11  335  

:::::: The code at line 329 was first introduced by commit
:::::: c9aeda1c94973f835b3d1b6c785a414caaf935c3 ASoC: mmp-sspa: Get rid of dma_params and phys_base

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
