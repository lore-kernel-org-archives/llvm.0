Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB9B3D9DCE;
	Mon,  1 Jun 2026 16:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333085; cv=none; b=EyJTwNl9bPfPuZOpESBedQVL8jhezd1Djj8SVXYRxU3/9nhfqtfhqV5B2m594cNdY1+eIttCQbgKxBDlbvwleiy1aa+VdlCNdB7ykEJqxjufA1wzz7KVW39ojn8iU2FotpM8d2cIL1WHJkppOEKAS6+B5/WIrHRiFXxsfUDmBbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333085; c=relaxed/simple;
	bh=Sg3VBlxsSufMTJ5x2txi8kRFtcY0trAwHd0xbM0qoYU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u4D/BoFxqtAYP1pF4RX7WlEwzI048j/mJZnyIJzdR1qkj9A6UZNQhrUg0qPDxnqfZSYaHFm4G1q6tEzkF8ucjfPUT3B8xXRrx14Ub39QOSwN7NZgFt8/ccoUEqFGHSHw4J5mUTDO9l46eMIAMLXoMPy1Ixafp3sQiJQVoW+z29E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9SAGpen; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9SAGpen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780333079; x=1811869079;
  h=date:from:to:cc:subject:message-id;
  bh=Sg3VBlxsSufMTJ5x2txi8kRFtcY0trAwHd0xbM0qoYU=;
  b=K9SAGpenFqFZbio2R2ydLonbbq7Ox4b9E5m2msp7ERueNTrwrUg1tpmN
   Q5vSBQdun+DIfId1DWkhWCNoRw/Qu0JoOpQM+URIeQDGUMTFo4uNqqcXZ
   Au8EpLUqTphUhZWqI5a3+efgBCheIFzUNaGyRsjhTSWO+8j4hKBQSOEoB
   xSt84B3AdyUPBtKh9BtcKaApccGfwepOYnw8bb4PBAm9gBXw0fn2ZYzAp
   Evaxh9MHTmv2ixuBkVyhG22tAhHvTtSpzrrYzR8+Wpxx0W52c6NuAZaq8
   9Yx6FtGYdK7DDiY8LbCYAlcmhdXZJwd8uNxCLVH4KY9VX1w7/vNTwFIaW
   Q==;
X-CSE-ConnectionGUID: 4i0WfZmqQVerwja/FJW7qQ==
X-CSE-MsgGUID: XGVuHMoxRjylc2Abzrzyrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="98515272"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="98515272"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 09:57:53 -0700
X-CSE-ConnectionGUID: cyUs2nwxRgCPLW8RsODskQ==
X-CSE-MsgGUID: nmPLxtD9QB6wfWPMPxQ2qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="247909731"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jun 2026 09:57:50 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU5xU-00000000Ape-0dnf;
	Mon, 01 Jun 2026 16:57:48 +0000
Date: Tue, 02 Jun 2026 00:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-06-01-3 290/290]
 sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: declaration of
 'struct snd_soc_card_platform' will not be visible outside of this function
Message-ID: <202606020048.8TEJERNU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-06-01-3
head:   1ef39bbdce9099b285b9702e22c4defc277e42dd
commit: b9692079ff7862be72856b5db574a06b03299af2 [290/290] ASoC: intel: sof_*: use snd_soc_card_register()
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260602/202606020048.8TEJERNU-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020048.8TEJERNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020048.8TEJERNU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/intel/boards/sof_rt5682.c:28:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
                                        ^
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                            ^
   In file included from sound/soc/intel/boards/sof_rt5682.c:29:
>> sound/soc/intel/boards/sof_realtek_common.h:27:55: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.h:36:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
                                      ^
   sound/soc/intel/boards/sof_realtek_common.h:46:35: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
                                     ^
   sound/soc/intel/boards/sof_rt5682.c:494:37: error: variable has incomplete type 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_rt5682 = {
                                       ^
   sound/soc/intel/boards/sof_rt5682.c:494:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_rt5682 = {
                 ^
   sound/soc/intel/boards/sof_rt5682.c:540:56: error: incomplete definition of type 'struct snd_soc_card_platform'
           ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
                                                    ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_rt5682.c:494:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_rt5682 = {
                 ^
   5 warnings and 2 errors generated.
--
   In file included from sound/soc/intel/boards/sof_cs42l42.c:24:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
                                        ^
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                            ^
   sound/soc/intel/boards/sof_cs42l42.c:135:37: error: variable has incomplete type 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_cs42l42 = {
                                       ^
   sound/soc/intel/boards/sof_cs42l42.c:135:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_cs42l42 = {
                 ^
   sound/soc/intel/boards/sof_cs42l42.c:163:56: error: incomplete definition of type 'struct snd_soc_card_platform'
           ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
                                                    ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_cs42l42.c:135:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_cs42l42 = {
                 ^
   2 warnings and 2 errors generated.
--
   In file included from sound/soc/intel/boards/sof_nau8825.c:24:
>> sound/soc/intel/boards/sof_realtek_common.h:27:55: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.h:36:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
                                      ^
   sound/soc/intel/boards/sof_realtek_common.h:46:35: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
                                     ^
   In file included from sound/soc/intel/boards/sof_nau8825.c:25:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
                                        ^
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                            ^
   sound/soc/intel/boards/sof_nau8825.c:160:37: error: variable has incomplete type 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_nau8825 = {
                                       ^
   sound/soc/intel/boards/sof_nau8825.c:160:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_nau8825 = {
                 ^
   sound/soc/intel/boards/sof_nau8825.c:188:56: error: incomplete definition of type 'struct snd_soc_card_platform'
           ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
                                                    ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_nau8825.c:160:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_audio_card_nau8825 = {
                 ^
   5 warnings and 2 errors generated.
--
   In file included from sound/soc/intel/boards/sof_da7219.c:19:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
                                        ^
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                            ^
   sound/soc/intel/boards/sof_da7219.c:198:37: error: variable has incomplete type 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform card_da7219 = {
                                       ^
   sound/soc/intel/boards/sof_da7219.c:198:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform card_da7219 = {
                 ^
   sound/soc/intel/boards/sof_da7219.c:226:56: error: incomplete definition of type 'struct snd_soc_card_platform'
           ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
                                                    ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_da7219.c:198:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform card_da7219 = {
                 ^
   2 warnings and 2 errors generated.
--
   In file included from sound/soc/intel/boards/sof_ssp_amp.c:21:
>> sound/soc/intel/boards/sof_realtek_common.h:27:55: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.h:36:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
                                      ^
   sound/soc/intel/boards/sof_realtek_common.h:46:35: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
                                     ^
   In file included from sound/soc/intel/boards/sof_ssp_amp.c:22:
>> sound/soc/intel/boards/sof_cirrus_common.h:24:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void cs35l41_set_codec_conf(struct snd_soc_card_platform *card_platform);
                                      ^
   sound/soc/intel/boards/sof_ssp_amp.c:45:37: error: variable has incomplete type 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_ssp_amp_card = {
                                       ^
   sound/soc/intel/boards/sof_ssp_amp.c:45:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_ssp_amp_card = {
                 ^
   sound/soc/intel/boards/sof_ssp_amp.c:85:56: error: incomplete definition of type 'struct snd_soc_card_platform'
           ret = sof_intel_board_set_dai_link(dev, &card_platform->driver, ctx);
                                                    ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_ssp_amp.c:45:15: note: forward declaration of 'struct snd_soc_card_platform'
   static struct snd_soc_card_platform sof_ssp_amp_card = {
                 ^
   4 warnings and 2 errors generated.
--
   In file included from sound/soc/intel/boards/sof_maxim_common.c:15:
>> sound/soc/intel/boards/sof_maxim_common.h:24:38: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
                                        ^
   sound/soc/intel/boards/sof_maxim_common.h:36:58: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                            ^
>> sound/soc/intel/boards/sof_maxim_common.c:288:38: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform)
                                        ^
   sound/soc/intel/boards/sof_maxim_common.c:288:6: error: conflicting types for 'max_98373_set_codec_conf'
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform)
        ^
   sound/soc/intel/boards/sof_maxim_common.h:24:6: note: previous declaration is here
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
        ^
   sound/soc/intel/boards/sof_maxim_common.c:290:15: error: incomplete definition of type 'struct snd_soc_card_platform'
           card_platform->driver.codec_conf = max_98373_codec_conf;
           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_maxim_common.c:288:38: note: forward declaration of 'struct snd_soc_card_platform'
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform)
                                        ^
   sound/soc/intel/boards/sof_maxim_common.c:291:15: error: incomplete definition of type 'struct snd_soc_card_platform'
           card_platform->driver.num_configs = ARRAY_SIZE(max_98373_codec_conf);
           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_maxim_common.c:288:38: note: forward declaration of 'struct snd_soc_card_platform'
   void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform)
                                        ^
   sound/soc/intel/boards/sof_maxim_common.c:512:58: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                            ^
   sound/soc/intel/boards/sof_maxim_common.c:512:6: error: conflicting types for 'max_98390_set_codec_conf'
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
        ^
   sound/soc/intel/boards/sof_maxim_common.h:36:6: note: previous declaration is here
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
        ^
   sound/soc/intel/boards/sof_maxim_common.c:516:15: error: incomplete definition of type 'struct snd_soc_card_platform'
           card_platform->driver.codec_conf = max_98390_codec_conf;
           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_maxim_common.c:512:58: note: forward declaration of 'struct snd_soc_card_platform'
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                            ^
   sound/soc/intel/boards/sof_maxim_common.c:521:17: error: incomplete definition of type 'struct snd_soc_card_platform'
                           card_platform->driver.codec_conf = max_98390_cml_codec_conf;
                           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_maxim_common.c:512:58: note: forward declaration of 'struct snd_soc_card_platform'
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                            ^
   sound/soc/intel/boards/sof_maxim_common.c:525:16: error: incomplete definition of type 'struct snd_soc_card_platform'
                   card_platform->driver.num_configs = num_codecs;
                   ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_maxim_common.c:512:58: note: forward declaration of 'struct snd_soc_card_platform'
   void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                            ^
   4 warnings and 7 errors generated.
--
   In file included from sound/soc/intel/boards/sof_realtek_common.c:19:
>> sound/soc/intel/boards/sof_realtek_common.h:27:55: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.h:36:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
                                      ^
   sound/soc/intel/boards/sof_realtek_common.h:46:35: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
                                     ^
>> sound/soc/intel/boards/sof_realtek_common.c:279:55: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.c:279:6: error: conflicting types for 'sof_rt1011_codec_conf'
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
        ^
   sound/soc/intel/boards/sof_realtek_common.h:27:6: note: previous declaration is here
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform);
        ^
   sound/soc/intel/boards/sof_realtek_common.c:290:17: error: incomplete definition of type 'struct snd_soc_card_platform'
                           card_platform->driver.codec_conf = rt1011_4spk_codec_confs;
                           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_realtek_common.c:279:55: note: forward declaration of 'struct snd_soc_card_platform'
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.c:292:17: error: incomplete definition of type 'struct snd_soc_card_platform'
                           card_platform->driver.codec_conf = rt1011_2spk_codec_confs;
                           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_realtek_common.c:279:55: note: forward declaration of 'struct snd_soc_card_platform'
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.c:295:16: error: incomplete definition of type 'struct snd_soc_card_platform'
                   card_platform->driver.num_configs = num_codecs;
                   ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_realtek_common.c:279:55: note: forward declaration of 'struct snd_soc_card_platform'
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.c:298:16: error: incomplete definition of type 'struct snd_soc_card_platform'
                   card_platform->driver.codec_conf = rt1011_4spk_codec_confs;
                   ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_realtek_common.c:279:55: note: forward declaration of 'struct snd_soc_card_platform'
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.c:299:16: error: incomplete definition of type 'struct snd_soc_card_platform'
                   card_platform->driver.num_configs = ARRAY_SIZE(rt1011_4spk_codec_confs);
                   ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_realtek_common.c:279:55: note: forward declaration of 'struct snd_soc_card_platform'
   void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card_platform *card_platform)
                                                         ^
   sound/soc/intel/boards/sof_realtek_common.c:378:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform)
                                      ^
   sound/soc/intel/boards/sof_realtek_common.c:378:6: error: conflicting types for 'sof_rt1015p_codec_conf'
   void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform)
        ^
   sound/soc/intel/boards/sof_realtek_common.h:36:6: note: previous declaration is here
   void sof_rt1015p_codec_conf(struct snd_soc_card_platform *card_platform);
        ^
   sound/soc/intel/boards/sof_realtek_common.c:521:35: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform)
                                     ^
   sound/soc/intel/boards/sof_realtek_common.c:521:6: error: conflicting types for 'sof_rt1015_codec_conf'
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform)
        ^
   sound/soc/intel/boards/sof_realtek_common.h:46:6: note: previous declaration is here
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform);
        ^
   sound/soc/intel/boards/sof_realtek_common.c:523:15: error: incomplete definition of type 'struct snd_soc_card_platform'
           card_platform->driver.codec_conf = rt1015_amp_conf;
           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_realtek_common.c:521:35: note: forward declaration of 'struct snd_soc_card_platform'
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform)
                                     ^
   sound/soc/intel/boards/sof_realtek_common.c:524:15: error: incomplete definition of type 'struct snd_soc_card_platform'
           card_platform->driver.num_configs = ARRAY_SIZE(rt1015_amp_conf);
           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_realtek_common.c:521:35: note: forward declaration of 'struct snd_soc_card_platform'
   void sof_rt1015_codec_conf(struct snd_soc_card_platform *card_platform)
                                     ^
   6 warnings and 10 errors generated.
--
   In file included from sound/soc/intel/boards/sof_cirrus_common.c:11:
>> sound/soc/intel/boards/sof_cirrus_common.h:24:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void cs35l41_set_codec_conf(struct snd_soc_card_platform *card_platform);
                                      ^
>> sound/soc/intel/boards/sof_cirrus_common.c:199:36: warning: declaration of 'struct snd_soc_card_platform' will not be visible outside of this function [-Wvisibility]
   void cs35l41_set_codec_conf(struct snd_soc_card_platform *card_platform)
                                      ^
   sound/soc/intel/boards/sof_cirrus_common.c:199:6: error: conflicting types for 'cs35l41_set_codec_conf'
   void cs35l41_set_codec_conf(struct snd_soc_card_platform *card_platform)
        ^
   sound/soc/intel/boards/sof_cirrus_common.h:24:6: note: previous declaration is here
   void cs35l41_set_codec_conf(struct snd_soc_card_platform *card_platform);
        ^
   sound/soc/intel/boards/sof_cirrus_common.c:201:15: error: incomplete definition of type 'struct snd_soc_card_platform'
           card_platform->driver.codec_conf = cs35l41_codec_conf;
           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_cirrus_common.c:199:36: note: forward declaration of 'struct snd_soc_card_platform'
   void cs35l41_set_codec_conf(struct snd_soc_card_platform *card_platform)
                                      ^
   sound/soc/intel/boards/sof_cirrus_common.c:202:15: error: incomplete definition of type 'struct snd_soc_card_platform'
           card_platform->driver.num_configs = ARRAY_SIZE(cs35l41_codec_conf);
           ~~~~~~~~~~~~~^
   sound/soc/intel/boards/sof_cirrus_common.c:199:36: note: forward declaration of 'struct snd_soc_card_platform'
   void cs35l41_set_codec_conf(struct snd_soc_card_platform *card_platform)
                                      ^
   2 warnings and 3 errors generated.


vim +24 sound/soc/intel/boards/sof_maxim_common.h

    22	
    23	void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link);
  > 24	void max_98373_set_codec_conf(struct snd_soc_card_platform *card_platform);
    25	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
