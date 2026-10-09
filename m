Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619E64CA798;
	Fri,  9 Oct 2026 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543442; cv=none; b=pFH97X4aeODXe6Qf7xdE7i1V1N0iqMd/DiUBfAf+uGJNaCV3140VZv2R+Z8gnyR+4PEc//Vu8zVJvjkeQAqRNSu0yrvQMdBpftMDVGI2n2W7qUgU3LHgGJUcqtC3wGim5zUxxEd8PDIHw/wBtOriYxIY8/J64dmMMwMb4ho4HP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543442; c=relaxed/simple;
	bh=rk2zM2i3KXECaXrcHOnzQ6DwsIKfL9kWloopwlSYjeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0eANgaNi4KY8VgwHZ1afhG85D/c8TV+qBoAFjwvE7kjxzs9asJP5UQpTLSbATt9pnepSPnf1HOAYUx7jbl8Oe5V5uy3eF+q0+QwZeExAaqF6QUvQvBQOhCznjFSKb/MxUFRyeqeUSoyUEBk2sH8NlCkPTBafScTiMhJWi8gk8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlzW8dFH; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlzW8dFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791543436; x=1823079436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rk2zM2i3KXECaXrcHOnzQ6DwsIKfL9kWloopwlSYjeM=;
  b=HlzW8dFHRFKooZoGGk/6e0VwcEoR1D+oLXGIn0t52U2DV7VLOUo2HofG
   /QGrgQd9BJew8Z3op+az6V7JnUN0P3rlQu1hWWe3gyUhKGoUgb82nqKqW
   jeGgCj71xe2IoBzYby5YGlu0iiTVm3LSTbwJR3Hj/nE4kFc0EzHSaHtih
   Eerd08mR05qhnFpeDRJKkSAVwYb7yr4jtl4GEoEKdBf/Jrk6XxMrzvdx9
   0NZEMUFz9FOvKRZlsNZ/j3jbhz/7MOzvZ5b9htoOqnZzR1ygGV/8Q49iT
   biiJ39xjz6R2WC2anwAfn+WcWAjloHphL242yXbzU1VdVm75KKDvSWrT/
   w==;
X-CSE-ConnectionGUID: EQpDGz6MT6appeuSGJoK3w==
X-CSE-MsgGUID: iAZo/v5IR1aP49stTjwwig==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="234247"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="234247"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:57:15 -0700
X-CSE-ConnectionGUID: jdbUKkceTiquOxwKLtBGSw==
X-CSE-MsgGUID: WncFnrASSnW5CDXR7FZxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="2029731"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 09 Oct 2026 03:57:14 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF8Hm-000000005eq-2hom;
	Fri, 09 Oct 2026 10:57:10 +0000
Date: Fri, 9 Oct 2026 18:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/11] ALSA: hda: Add lock around codec->registered flag
 manipulations
Message-ID: <202610092046.7N0li03i-lkp@intel.com>
References: <20261008192553.300025-4-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008192553.300025-4-tiwai@suse.de>

Hi Takashi,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-next]
[also build test ERROR on next-20261008]
[cannot apply to tiwai-sound/for-linus broonie-sound/for-next linus/master v7.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Iwai/ALSA-hda-intel-Cancel-delayed-work-at-shutdown-too/20261008-212541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20261008192553.300025-4-tiwai%40suse.de
patch subject: [PATCH 03/11] ALSA: hda: Add lock around codec->registered flag manipulations
config: i386-defconfig (https://download.01.org/0day-ci/archive/20261009/202610092046.7N0li03i-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610092046.7N0li03i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610092046.7N0li03i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/hda/common/codec.c:764:18: error: use of undeclared identifier 'bus'
     764 |                 spin_lock_irq(&bus->reg_lock);
         |                                ^~~
   sound/hda/common/codec.c:766:20: error: use of undeclared identifier 'bus'
     766 |                 spin_unlock_irq(&bus->reg_lock);
         |                                  ^~~
   sound/hda/common/codec.c:820:18: error: use of undeclared identifier 'bus'
     820 |                 spin_lock_irq(&bus->reg_lock);
         |                                ^~~
   sound/hda/common/codec.c:822:20: error: use of undeclared identifier 'bus'
     822 |                 spin_unlock_irq(&bus->reg_lock);
         |                                  ^~~
   4 errors generated.


vim +/bus +764 sound/hda/common/codec.c

   753	
   754	/**
   755	 * snd_hda_codec_cleanup_for_unbind - Prepare codec for removal
   756	 * @codec: codec device to cleanup
   757	 */
   758	void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec)
   759	{
   760		if (codec->core.registered) {
   761			/* pm_runtime_put() is called in snd_hdac_device_exit() */
   762			pm_runtime_get_noresume(hda_codec_dev(codec));
   763			pm_runtime_disable(hda_codec_dev(codec));
 > 764			spin_lock_irq(&bus->reg_lock);
   765			codec->core.registered = false;
   766			spin_unlock_irq(&bus->reg_lock);
   767		}
   768	
   769		snd_hda_codec_disconnect_pcms(codec);
   770		cancel_delayed_work_sync(&codec->jackpoll_work);
   771		if (!codec->in_freeing)
   772			snd_hda_ctls_clear(codec);
   773		codec_release_pcms(codec);
   774		snd_hda_detach_beep_device(codec);
   775		snd_hda_jack_tbl_clear(codec);
   776		codec->proc_widget_hook = NULL;
   777		codec->spec = NULL;
   778	
   779		/* free only driver_pins so that init_pins + user_pins are restored */
   780		snd_array_free(&codec->driver_pins);
   781		snd_array_free(&codec->cvt_setups);
   782		snd_array_free(&codec->spdif_out);
   783		snd_array_free(&codec->verbs);
   784		codec->follower_dig_outs = NULL;
   785		codec->spdif_status_reset = 0;
   786		snd_array_free(&codec->mixers);
   787		snd_array_free(&codec->nids);
   788		remove_conn_list(codec);
   789		snd_hdac_regmap_exit(&codec->core);
   790		codec->configured = 0;
   791		snd_refcount_init(&codec->pcm_ref); /* reset refcount */
   792	}
   793	EXPORT_SYMBOL_GPL(snd_hda_codec_cleanup_for_unbind);
   794	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
