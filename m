Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D569346E6D;
	Mon,  4 May 2026 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777929963; cv=none; b=brL+exCDDTJ+YOjwYDZVIdPERCDrbWqdPK5nacGrpV8h24GKeBgsi/XTpUNIGKuejMPpbDZPCvfa3YFUSNpMWKFW1PcY3ooWMcCxs1EH60+gdEnPIEGiXTId3/Nyy10PzFqh+R0YFTONcu+FkGcxTJ++hcnuP4/kAOKRk+gjhD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777929963; c=relaxed/simple;
	bh=ke8DjRRDyYx1Z4oRIEVWrKBiNq3w6cVdUYC0CPzAfXY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BdqcJL7PoU3/jD1GowiqfD98A3aNiWIDanb5vABiO7UEQKqtpQNOsQmF1mdg24LzAs3bdOaU0KXwY5AQp//ZvP4UgBNruVo8mUMNf1p7CxP0bUOOMscQ+ruRjQ99vvNopR1RpDLADx8jEC2YouaZRu4N2JBZMmKwiftkwM05rRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jbk4TtHK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jbk4TtHK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777929960; x=1809465960;
  h=date:from:to:cc:subject:message-id;
  bh=ke8DjRRDyYx1Z4oRIEVWrKBiNq3w6cVdUYC0CPzAfXY=;
  b=Jbk4TtHKStKCAfbICVfwET3Gdm8sfssAMKkHJkCMEGi9qutrb5Ucmrp2
   LoAEvoggZVJtMCDxpTXved9oJp1oDWQalS9cHfPMPA84a1JOYRbvVl5Q4
   xcC+ukkLuPKvwgsb1noIiwz5bp0OGnmqM8gkKoOwXgzXN5l6xj1/S+VLC
   Cc8cgdJroOXsjNoeefOzS/syqSIoKJ8OxfF2EzDL9RzHH7PiSlQg/Fc9g
   M3yZH4Wnf2KQXC4kwAf27wJ85jFbWow5QfwDY+/LZjonGIIXKvcl4DwoI
   BO9+JVc50I89k0dI5rwtybygrnqa5nzeWTMk16TcX7Lqv/nYNT0nqrYiT
   Q==;
X-CSE-ConnectionGUID: g0AEBnDoQgS0Is0essCxQw==
X-CSE-MsgGUID: /Ijp9/wZThqnfxkAaHTTdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="89100065"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="89100065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 14:25:56 -0700
X-CSE-ConnectionGUID: j1GZLmh9Rg+l1uJS+25u3A==
X-CSE-MsgGUID: LSa5UxkORJW/wnaiWcRrlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="235681847"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 May 2026 14:25:55 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK0nR-0000000041N-3V8a;
	Mon, 04 May 2026 21:25:47 +0000
Date: Tue, 05 May 2026 05:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>,
 "Pierre-Louis Bossart" <pierre-louis.bossart@linux.dev>
Subject: [broonie-ci:asoc-7.2 1/4] sound/soc/sdca/sdca_jack.c:211:5:
 warning: variable 'jack_state' is uninitialized when used here
Message-ID: <202605050544.46Z8qOSY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git asoc-7.2
head:   50c2f0f086641fb96d4eb67a559ee18d441355b6
commit: cb3c257e08248521b22c67259d50ebb18574d1a1 [1/4] ASoC: SDCA: Add correct masks whilst reporting SDCA jack status
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260505/202605050544.46Z8qOSY-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050544.46Z8qOSY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605050544.46Z8qOSY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sdca/sdca_jack.c:211:5: warning: variable 'jack_state' is uninitialized when used here [-Wuninitialized]
     211 |                                 jack_state->mask |= type_get_mask(type);
         |                                 ^~~~~~~~~~
   sound/soc/sdca/sdca_jack.c:193:32: note: initialize the variable 'jack_state' to silence this warning
     193 |                 struct jack_state *jack_state;
         |                                              ^
         |                                               = NULL
   1 warning generated.


vim +/jack_state +211 sound/soc/sdca/sdca_jack.c

   173	
   174	/**
   175	 * sdca_jack_set_jack - attach an ASoC jack to SDCA
   176	 * @info: SDCA interrupt information.
   177	 * @jack: ASoC jack to be attached.
   178	 *
   179	 * Return: Zero on success or a negative error code.
   180	 */
   181	int sdca_jack_set_jack(struct sdca_interrupt_info *info, struct snd_soc_jack *jack)
   182	{
   183		int i, j;
   184		int ret;
   185	
   186		guard(mutex)(&info->irq_lock);
   187	
   188		for (i = 0; i < SDCA_MAX_INTERRUPTS; i++) {
   189			struct sdca_interrupt *interrupt = &info->irqs[i];
   190			struct sdca_control *control = interrupt->control;
   191			struct sdca_entity *entity = interrupt->entity;
   192			struct sdca_control_range *range;
   193			struct jack_state *jack_state;
   194	
   195			if (!interrupt->irq)
   196				continue;
   197	
   198			switch (SDCA_CTL_TYPE(entity->type, control->sel)) {
   199			case SDCA_CTL_TYPE_S(GE, DETECTED_MODE):
   200				range = sdca_selector_find_range(interrupt->dev, entity,
   201								 SDCA_CTL_GE_SELECTED_MODE,
   202								 SDCA_SELECTED_MODE_NCOLS, 0);
   203				if (!range)
   204					return -EINVAL;
   205	
   206				for (j = 0; j < range->rows; j++) {
   207					enum sdca_terminal_type type;
   208	
   209					type = sdca_range(range, SDCA_SELECTED_MODE_TERM_TYPE, j);
   210	
 > 211					jack_state->mask |= type_get_mask(type);
   212				}
   213	
   214				jack_state = interrupt->priv;
   215				jack_state->jack = jack;
   216	
   217				/* Report initial state in case IRQ was already handled */
   218				ret = sdca_jack_report(interrupt);
   219				if (ret)
   220					return ret;
   221				break;
   222			default:
   223				break;
   224			}
   225		}
   226	
   227		return 0;
   228	}
   229	EXPORT_SYMBOL_NS_GPL(sdca_jack_set_jack, "SND_SOC_SDCA");
   230	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
