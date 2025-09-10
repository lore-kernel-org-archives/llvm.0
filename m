Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A6221739;
	Wed, 10 Sep 2025 07:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488853; cv=none; b=bHSWrkjqKlzcOMKJcBdh8cnZnzE7yZwOViW9mU5w5dWXzvlWG5J1GGTOopTS9eUq6uizOCRSweFGPaHVocKF1+BB5dFoNYXXcbzFancczqkWPRX8ITsg4omOWoEqnWuq1aFOdk6f099xITkHMQJExjcXGj2QJCJppZr+ZXA0OgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488853; c=relaxed/simple;
	bh=vwghiswpYI7TXrHNriSxTn1AeR8u/UjYfD1TYxdWHII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7ekZuiJo0RQ88MMSb7yNC9oi5Pk0LKJQtp9YjX3bXTViqR2i+Nq4vU0Y0D3nbCLiDjbhzsNhSb4wM759yoiNWC+OM1NrYniWVJyBL1Cuds5PXLinSFOSCFLogIwUOGFPxVV2+k1wSHOwmawW2+80V3qseer1lxdsckTV7yrAK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBTJMKpp; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBTJMKpp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757488851; x=1789024851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vwghiswpYI7TXrHNriSxTn1AeR8u/UjYfD1TYxdWHII=;
  b=eBTJMKppeUgHYKY/5qn6gp6HML8ufXzUsPJA5SQaWdB8ZhnYPuKGeIVd
   3QcdHjcEB0guQOKtO7Dn95vBrZowHIybNPoES2/nPVybmD/MjhPXIcpaM
   MT5PzlqGFccjxucqKJgfTUkzh8mYc31pZUErAB6DD9eVj5MKJJTuEpA1f
   HeOl/y9JgapbmZTrjVTf26Bbf9hF3fqxNUP48mDhAtwE7XE+k1Fd3fcT2
   4hbeajmQ5peQEj0JftPjzadmPUTjB0jr80eIH+ZkkCM0iuYdjE+18+vKR
   3S5oPxjKpT/Dn1GJuN2Ok5sXZgIAuToiiL2RC7qTLm1X9jBOOrek7cV2M
   Q==;
X-CSE-ConnectionGUID: MelniKn4QGG+YFAZ0A2t1w==
X-CSE-MsgGUID: B2wxbc62TgerkxJF2ZIidA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="63419534"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="63419534"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 00:20:51 -0700
X-CSE-ConnectionGUID: 0fxhi66TTnKyjpK5TAuUng==
X-CSE-MsgGUID: I5EVtNQTQNuuqUs0B5E2hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; 
   d="scan'208";a="196976033"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2025 00:20:48 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwF8C-0005dH-1X;
	Wed, 10 Sep 2025 07:20:40 +0000
Date: Wed, 10 Sep 2025 15:19:53 +0800
From: kernel test robot <lkp@intel.com>
To: Lachlan Hodges <lachlan.hodges@morsemicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC wireless-next 1/3] wifi: cfg80211: correctly implement and
 validate S1G chandef
Message-ID: <202509101438.7YHHFQrG-lkp@intel.com>
References: <20250909080758.1004956-2-lachlan.hodges@morsemicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909080758.1004956-2-lachlan.hodges@morsemicro.com>

Hi Lachlan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on next-20250909]
[cannot apply to wireless/main linus/master v6.17-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lachlan-Hodges/wifi-cfg80211-correctly-implement-and-validate-S1G-chandef/20250909-161105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20250909080758.1004956-2-lachlan.hodges%40morsemicro.com
patch subject: [RFC wireless-next 1/3] wifi: cfg80211: correctly implement and validate S1G chandef
config: i386-buildonly-randconfig-004-20250910 (https://download.01.org/0day-ci/archive/20250910/202509101438.7YHHFQrG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509101438.7YHHFQrG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509101438.7YHHFQrG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/chan.c:370:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     370 |                 u32 control_khz, start_khz, end_khz;
         |                 ^
   1 warning generated.


vim +370 net/wireless/chan.c

   341	
   342	bool cfg80211_chandef_valid(const struct cfg80211_chan_def *chandef)
   343	{
   344		u32 control_freq;
   345	
   346		if (!chandef->chan)
   347			return false;
   348	
   349		if (chandef->freq1_offset >= 1000)
   350			return false;
   351	
   352		control_freq = chandef->chan->center_freq;
   353	
   354		switch (chandef->width) {
   355		case NL80211_CHAN_WIDTH_5:
   356		case NL80211_CHAN_WIDTH_10:
   357		case NL80211_CHAN_WIDTH_20:
   358		case NL80211_CHAN_WIDTH_20_NOHT:
   359			if (ieee80211_chandef_to_khz(chandef) !=
   360			    ieee80211_channel_to_khz(chandef->chan))
   361				return false;
   362			if (chandef->center_freq2)
   363				return false;
   364			break;
   365		case NL80211_CHAN_WIDTH_1:
   366		case NL80211_CHAN_WIDTH_2:
   367		case NL80211_CHAN_WIDTH_4:
   368		case NL80211_CHAN_WIDTH_8:
   369		case NL80211_CHAN_WIDTH_16:
 > 370			u32 control_khz, start_khz, end_khz;
   371	
   372			if (!cfg80211_chandef_is_s1g(chandef))
   373				return false;
   374			if (chandef->center_freq2)
   375				return false;
   376	
   377			control_khz = ieee80211_channel_to_khz(chandef->chan);
   378			start_khz = cfg80211_s1g_get_start_freq_khz(chandef);
   379			end_khz = cfg80211_s1g_get_end_freq_khz(chandef);
   380	
   381			if (control_khz < start_khz || control_khz > end_khz)
   382				return false;
   383			break;
   384		case NL80211_CHAN_WIDTH_80P80:
   385			if (!chandef->center_freq2)
   386				return false;
   387			/* adjacent is not allowed -- that's a 160 MHz channel */
   388			if (chandef->center_freq1 - chandef->center_freq2 == 80 ||
   389			    chandef->center_freq2 - chandef->center_freq1 == 80)
   390				return false;
   391			break;
   392		default:
   393			if (chandef->center_freq2)
   394				return false;
   395			break;
   396		}
   397	
   398		switch (chandef->width) {
   399		case NL80211_CHAN_WIDTH_5:
   400		case NL80211_CHAN_WIDTH_10:
   401		case NL80211_CHAN_WIDTH_20:
   402		case NL80211_CHAN_WIDTH_20_NOHT:
   403		case NL80211_CHAN_WIDTH_1:
   404		case NL80211_CHAN_WIDTH_2:
   405		case NL80211_CHAN_WIDTH_4:
   406		case NL80211_CHAN_WIDTH_8:
   407		case NL80211_CHAN_WIDTH_16:
   408			/* all checked above */
   409			break;
   410		case NL80211_CHAN_WIDTH_320:
   411			if (chandef->center_freq1 == control_freq + 150 ||
   412			    chandef->center_freq1 == control_freq + 130 ||
   413			    chandef->center_freq1 == control_freq + 110 ||
   414			    chandef->center_freq1 == control_freq + 90 ||
   415			    chandef->center_freq1 == control_freq - 90 ||
   416			    chandef->center_freq1 == control_freq - 110 ||
   417			    chandef->center_freq1 == control_freq - 130 ||
   418			    chandef->center_freq1 == control_freq - 150)
   419				break;
   420			fallthrough;
   421		case NL80211_CHAN_WIDTH_160:
   422			if (chandef->center_freq1 == control_freq + 70 ||
   423			    chandef->center_freq1 == control_freq + 50 ||
   424			    chandef->center_freq1 == control_freq - 50 ||
   425			    chandef->center_freq1 == control_freq - 70)
   426				break;
   427			fallthrough;
   428		case NL80211_CHAN_WIDTH_80P80:
   429		case NL80211_CHAN_WIDTH_80:
   430			if (chandef->center_freq1 == control_freq + 30 ||
   431			    chandef->center_freq1 == control_freq - 30)
   432				break;
   433			fallthrough;
   434		case NL80211_CHAN_WIDTH_40:
   435			if (chandef->center_freq1 == control_freq + 10 ||
   436			    chandef->center_freq1 == control_freq - 10)
   437				break;
   438			fallthrough;
   439		default:
   440			return false;
   441		}
   442	
   443		if (!cfg80211_valid_center_freq(chandef->center_freq1, chandef->width))
   444			return false;
   445	
   446		if (chandef->width == NL80211_CHAN_WIDTH_80P80 &&
   447		    !cfg80211_valid_center_freq(chandef->center_freq2, chandef->width))
   448			return false;
   449	
   450		/* channel 14 is only for IEEE 802.11b */
   451		if (chandef->center_freq1 == 2484 &&
   452		    chandef->width != NL80211_CHAN_WIDTH_20_NOHT)
   453			return false;
   454	
   455		if (cfg80211_chandef_is_edmg(chandef) &&
   456		    !cfg80211_edmg_chandef_valid(chandef))
   457			return false;
   458	
   459		return valid_puncturing_bitmap(chandef);
   460	}
   461	EXPORT_SYMBOL(cfg80211_chandef_valid);
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
