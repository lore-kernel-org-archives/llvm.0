Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F037E249EB;
	Sun, 29 Dec 2024 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735488581; cv=none; b=Gr1//tICGyhSE/rXsgft0lOGxo5odZqi2YHjRySZ7fw8gwsar+8teulxRUZSvil5EdOP9wO++2NHAMAyByfLhAeytPa+pKtfsSn4skVMG+GhBAdI6OkdQ5Y+AKDfytPj7H89j+RPZw1naYYfKI5FxX16+R77+No+2WyIDOYSDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735488581; c=relaxed/simple;
	bh=Wpz/hDH3WnSPZqUIvMVCDHPvC+SYrLST+J5+7OqI/B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrOUrPMUE1vnIxdMuNSzvBWE7JfVx+zXjJRhOBftkgdh1CZFfgpJaU38i3XVB4dj0kCJeEDTeOgPdSLR0rfUg8LtSB1fYHF9+rozhi8MRaJLPlma/g8/KRmmwAKwJJUE2+ujaUemNfa9KPnVvDDEdOMnGYm+vk7lnSDov5lHLV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evNqHmiV; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evNqHmiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735488579; x=1767024579;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wpz/hDH3WnSPZqUIvMVCDHPvC+SYrLST+J5+7OqI/B0=;
  b=evNqHmiVcjiIyV4nRfZShsLkdvNPMk3+o0cEZVs63NK7JEmEfVZoky7O
   814wUY7qIMmdY+wsMWX7En900pcYmEF8pmAnj9GaNfC5tuGLIG/h56gs/
   ZvJoQbZhQtR5P0idkrVNNbK7I1WNyANQy4k4RdBIS3VHCeG3lUsgQ4hhU
   gNUqu+MtCVXPuXsls3WQSzCF317ZLdRvaqyElesBbMWEgX6aZSjYpFx7X
   tn8uRt3tX1ih58sgsch2uFYjYn7u2570z2W7llZp75aacs0RXABuC1AKM
   csZebpyBReElBvLLiFVkkqi3H46ctfbRnysXfIKqkDxemQmVM3YM4jUmG
   w==;
X-CSE-ConnectionGUID: 5Eb/uZSWROOn7rURExDvIQ==
X-CSE-MsgGUID: zBIIGcbvRO6MwHg1aCbsyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="46795419"
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="46795419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 08:09:38 -0800
X-CSE-ConnectionGUID: flHdOnC+Tm6YB2Z0GSvCYQ==
X-CSE-MsgGUID: gD6h98uiQneziPbsKep8hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,274,1728975600"; 
   d="scan'208";a="100336897"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Dec 2024 08:09:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRvrD-0004n1-0O;
	Sun, 29 Dec 2024 16:09:35 +0000
Date: Mon, 30 Dec 2024 00:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] ASoC: codecs: ES8326: Reduce pop noise
Message-ID: <202412292344.POE1YKPC-lkp@intel.com>
References: <20241220104322.31867-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220104322.31867-1-zhangyi@everest-semi.com>

Hi Zhang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.13-rc4 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhang-Yi/ASoC-codecs-ES8326-Reduce-pop-noise/20241229-205825
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20241220104322.31867-1-zhangyi%40everest-semi.com
patch subject: [PATCH] ASoC: codecs: ES8326: Reduce pop noise
config: arm-randconfig-001-20241229 (https://download.01.org/0day-ci/archive/20241229/202412292344.POE1YKPC-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412292344.POE1YKPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412292344.POE1YKPC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/codecs/es8326.c:790:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           case 0x4b:
           ^
   sound/soc/codecs/es8326.c:790:2: note: insert '__attribute__((fallthrough));' to silence this warning
           case 0x4b:
           ^
           __attribute__((fallthrough)); 
   sound/soc/codecs/es8326.c:790:2: note: insert 'break;' to avoid fall-through
           case 0x4b:
           ^
           break; 
   1 warning generated.


vim +790 sound/soc/codecs/es8326.c

5c439937775d77 Zhu Ning 2022-08-16  759  
5c439937775d77 Zhu Ning 2022-08-16  760  /*
5c439937775d77 Zhu Ning 2022-08-16  761   *	For button detection, set the following in soundcard
5c439937775d77 Zhu Ning 2022-08-16  762   *	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
5c439937775d77 Zhu Ning 2022-08-16  763   *	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOLUMEUP);
5c439937775d77 Zhu Ning 2022-08-16  764   *	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEDOWN);
5c439937775d77 Zhu Ning 2022-08-16  765   */
5c439937775d77 Zhu Ning 2022-08-16  766  static void es8326_jack_button_handler(struct work_struct *work)
5c439937775d77 Zhu Ning 2022-08-16  767  {
5c439937775d77 Zhu Ning 2022-08-16  768  	struct es8326_priv *es8326 =
5c439937775d77 Zhu Ning 2022-08-16  769  		container_of(work, struct es8326_priv, button_press_work.work);
5c439937775d77 Zhu Ning 2022-08-16  770  	struct snd_soc_component *comp = es8326->component;
5c439937775d77 Zhu Ning 2022-08-16  771  	unsigned int iface;
5c439937775d77 Zhu Ning 2022-08-16  772  	static int button_to_report, press_count;
5c439937775d77 Zhu Ning 2022-08-16  773  	static int prev_button, cur_button;
5c439937775d77 Zhu Ning 2022-08-16  774  
5c439937775d77 Zhu Ning 2022-08-16  775  	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
5c439937775d77 Zhu Ning 2022-08-16  776  		return;
5c439937775d77 Zhu Ning 2022-08-16  777  
5c439937775d77 Zhu Ning 2022-08-16  778  	mutex_lock(&es8326->lock);
4ddad00c609bdc Zhu Ning 2023-07-17  779  	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
5c439937775d77 Zhu Ning 2022-08-16  780  	switch (iface) {
5c439937775d77 Zhu Ning 2022-08-16  781  	case 0x93:
5c439937775d77 Zhu Ning 2022-08-16  782  		/* pause button detected */
5c439937775d77 Zhu Ning 2022-08-16  783  		cur_button = SND_JACK_BTN_0;
5c439937775d77 Zhu Ning 2022-08-16  784  		break;
5c439937775d77 Zhu Ning 2022-08-16  785  	case 0x6f:
3ed48ef7e14cc4 Zhang Yi 2024-12-20  786  		if (es8326->version > ES8326_VERSION_B) {
3ed48ef7e14cc4 Zhang Yi 2024-12-20  787  			cur_button = SND_JACK_BTN_0;
3ed48ef7e14cc4 Zhang Yi 2024-12-20  788  			break;
3ed48ef7e14cc4 Zhang Yi 2024-12-20  789  		}
04f96c9340463a Zhu Ning 2023-07-17 @790  	case 0x4b:
5c439937775d77 Zhu Ning 2022-08-16  791  		/* button volume up */
5c439937775d77 Zhu Ning 2022-08-16  792  		cur_button = SND_JACK_BTN_1;
5c439937775d77 Zhu Ning 2022-08-16  793  		break;
5c439937775d77 Zhu Ning 2022-08-16  794  	case 0x27:
5c439937775d77 Zhu Ning 2022-08-16  795  		/* button volume down */
5c439937775d77 Zhu Ning 2022-08-16  796  		cur_button = SND_JACK_BTN_2;
5c439937775d77 Zhu Ning 2022-08-16  797  		break;
5c439937775d77 Zhu Ning 2022-08-16  798  	case 0x1e:
04f96c9340463a Zhu Ning 2023-07-17  799  	case 0xe2:
5c439937775d77 Zhu Ning 2022-08-16  800  		/* button released or not pressed */
5c439937775d77 Zhu Ning 2022-08-16  801  		cur_button = 0;
5c439937775d77 Zhu Ning 2022-08-16  802  		break;
5c439937775d77 Zhu Ning 2022-08-16  803  	default:
5c439937775d77 Zhu Ning 2022-08-16  804  		break;
5c439937775d77 Zhu Ning 2022-08-16  805  	}
5c439937775d77 Zhu Ning 2022-08-16  806  
5c439937775d77 Zhu Ning 2022-08-16  807  	if ((prev_button == cur_button) && (cur_button != 0)) {
5c439937775d77 Zhu Ning 2022-08-16  808  		press_count++;
04f96c9340463a Zhu Ning 2023-07-17  809  		if (press_count > 3) {
04f96c9340463a Zhu Ning 2023-07-17  810  			/* report a press every 120ms */
5c439937775d77 Zhu Ning 2022-08-16  811  			snd_soc_jack_report(es8326->jack, cur_button,
5c439937775d77 Zhu Ning 2022-08-16  812  					SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
5c439937775d77 Zhu Ning 2022-08-16  813  			press_count = 0;
5c439937775d77 Zhu Ning 2022-08-16  814  		}
5c439937775d77 Zhu Ning 2022-08-16  815  		button_to_report = cur_button;
5c439937775d77 Zhu Ning 2022-08-16  816  		queue_delayed_work(system_wq, &es8326->button_press_work,
04f96c9340463a Zhu Ning 2023-07-17  817  				   msecs_to_jiffies(35));
5c439937775d77 Zhu Ning 2022-08-16  818  	} else if (prev_button != cur_button) {
5c439937775d77 Zhu Ning 2022-08-16  819  		/* mismatch, detect again */
5c439937775d77 Zhu Ning 2022-08-16  820  		prev_button = cur_button;
5c439937775d77 Zhu Ning 2022-08-16  821  		queue_delayed_work(system_wq, &es8326->button_press_work,
04f96c9340463a Zhu Ning 2023-07-17  822  				   msecs_to_jiffies(35));
5c439937775d77 Zhu Ning 2022-08-16  823  	} else {
5c439937775d77 Zhu Ning 2022-08-16  824  		/* released or no pressed */
5c439937775d77 Zhu Ning 2022-08-16  825  		if (button_to_report != 0) {
5c439937775d77 Zhu Ning 2022-08-16  826  			snd_soc_jack_report(es8326->jack, button_to_report,
5c439937775d77 Zhu Ning 2022-08-16  827  				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
5c439937775d77 Zhu Ning 2022-08-16  828  			snd_soc_jack_report(es8326->jack, 0,
5c439937775d77 Zhu Ning 2022-08-16  829  				    SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2);
5c439937775d77 Zhu Ning 2022-08-16  830  			button_to_report = 0;
5c439937775d77 Zhu Ning 2022-08-16  831  		}
6024f3429fd1ac Zhang Yi 2024-07-26  832  		es8326_disable_micbias(es8326->component);
5c439937775d77 Zhu Ning 2022-08-16  833  	}
5c439937775d77 Zhu Ning 2022-08-16  834  	mutex_unlock(&es8326->lock);
5c439937775d77 Zhu Ning 2022-08-16  835  }
5c439937775d77 Zhu Ning 2022-08-16  836  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
