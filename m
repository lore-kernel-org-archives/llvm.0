Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4685227BA4;
	Tue,  2 Dec 2025 02:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764641515; cv=none; b=u5DIewiyJwQEo15ddqvRAFXiWe3dy2VCyoOGkJejo6BfPABBycv3AKlWJgp/zVcqQP6XwUEYvHvo1JVk9jx9qoz6OqhKyPHjZxu7Jpx72nxzPnBhPjNRB5z33ZoZ0P4P9fdxdYypkggSc5UxoJrjgu7iNLZRBFzAvQhvjnxuSXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764641515; c=relaxed/simple;
	bh=KIkcSZmsCKYG8A4wN0Pyyzwu9+pOmTVUsNzJylJYrVA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awRFiEUSIHVAWdAUvL2W6CNTHfQ1S5HHwSvapNAZap8bZLozzL1gA9Q3Fo+RXsdlgHZbDRnbOB2cl17m6fkjmHW+RwX1XkijQmZhC2Jc2I/jytI4VFxB1U6lXntZKht7GtET/OX6yJqIz6DYnmflEuNPvZZvJ+NEbUXWdmYh5+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YO0J/I9u; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YO0J/I9u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764641514; x=1796177514;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KIkcSZmsCKYG8A4wN0Pyyzwu9+pOmTVUsNzJylJYrVA=;
  b=YO0J/I9uLtl6IzPqbY0cjWo/PyXnFExwIPlKgjPP5njFdgdWWbXSEjNh
   ok+/tbaWVWYhms/CfGBe/vuZIZq+BkFXzH4/XWdB9O2eJN0BAadQX21w5
   ys/K9Yh4ArwoKopugecilKpnoi3Ml6yDwT/uSZ3ebfYASNhZgnvnrTcHi
   U6rt2ODFPdGu+8otrJ1dM/RlvS46NJ1oZHjL6L1hq3QmkykREU0CbpN5W
   2cvPMvWJ77vB1VcNCA2MPkt3HSoVv8O6kq6g2Ry5cTJvkWb9/FSToCJE3
   1Pi9xjRK8zuBq1q4GwxE+k31EQpnu0OhDwUmiVcPY/NwBVfAGx1wc4OEx
   Q==;
X-CSE-ConnectionGUID: rXk6KAMQTGqKn6D75gD0Xg==
X-CSE-MsgGUID: rbjwEomgS8qg7E+ZW6ggjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="65599150"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="65599150"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 18:11:53 -0800
X-CSE-ConnectionGUID: Xo9G9SzhQM+5oQ7Hn/QcKA==
X-CSE-MsgGUID: dT73CrKDS1ulWOmgP/2gJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199171437"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 Dec 2025 18:11:50 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQFro-000000009Jp-0COB;
	Tue, 02 Dec 2025 02:11:48 +0000
Date: Tue, 2 Dec 2025 10:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: joakim.zhang@cixtech.com, lgirdwood@gmail.com, broonie@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	cix-kernel-upstream@cixtech.com,
	Joakim Zhang <joakim.zhang@cixtech.com>
Subject: Re: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
Message-ID: <202512020919.sEEAZ5w1-lkp@intel.com>
References: <20251201105700.832715-4-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201105700.832715-4-joakim.zhang@cixtech.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus linus/master v6.18 next-20251201]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/joakim-zhang-cixtech-com/ALSA-hda-dt-bindings-add-CIX-IPBLOQ-HDA-controller-support/20251201-185859
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20251201105700.832715-4-joakim.zhang%40cixtech.com
patch subject: [PATCH v3 3/3] ALSA: hda: add CIX IPBLOQ HDA controller support
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251202/202512020919.sEEAZ5w1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020919.sEEAZ5w1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512020919.sEEAZ5w1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/hda/controllers/cix-ipbloq.c:224:31: warning: implicit conversion from 'unsigned long long' to 'dma_addr_t' (aka 'unsigned int') changes value from 18446744071293632512 to 1879048192 [-Wconstant-conversion]
     224 |         chip->bus.core.addr_offset = CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
         |                                    ~ ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   sound/hda/controllers/cix-ipbloq.c:23:51: note: expanded from macro 'CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET'
      23 | #define CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET        (-0x90000000ULL)
         |                                                          ^~~~~~~~~~~~~~
   1 warning generated.


vim +224 sound/hda/controllers/cix-ipbloq.c

   180	
   181	static int cix_ipbloq_hda_create(struct cix_ipbloq_hda *hda,
   182					 struct snd_card *card,
   183					 unsigned int driver_caps)
   184	{
   185		static const struct snd_device_ops ops = {
   186			.dev_disconnect = cix_ipbloq_hda_dev_disconnect,
   187			.dev_free = cix_ipbloq_hda_dev_free,
   188		};
   189		struct azx *chip;
   190		int err;
   191	
   192		chip = &hda->chip;
   193		chip->card = card;
   194		chip->ops = &cix_ipbloq_hda_ops;
   195		chip->driver_caps = driver_caps;
   196		chip->driver_type = driver_caps & 0xff;
   197		chip->dev_index = 0;
   198		chip->single_cmd = 0;
   199		chip->codec_probe_mask = -1;
   200		chip->align_buffer_size = 1;
   201		chip->jackpoll_interval = msecs_to_jiffies(CIX_IPBLOQ_JACKPOLL_DEFAULT_TIME_MS);
   202		mutex_init(&chip->open_mutex);
   203		INIT_LIST_HEAD(&chip->pcm_list);
   204	
   205		/*
   206		 * HD-audio controllers appear pretty inaccurate about the update-IRQ timing.
   207		 * The IRQ is issued before actually the data is processed. So use stream
   208		 * link position by default instead of dma position buffer.
   209		 */
   210		chip->get_position[0] = chip->get_position[1] = azx_get_pos_lpib;
   211	
   212		err = azx_bus_init(chip, NULL);
   213		if (err < 0) {
   214			dev_err(hda->dev, "failed to init bus, err = %d\n", err);
   215			return err;
   216		}
   217	
   218		/* RIRBSTS.RINTFL cannot be cleared, cause interrupt storm */
   219		chip->bus.core.polling_mode = 1;
   220		chip->bus.core.not_use_interrupts = 1;
   221	
   222		chip->bus.core.aligned_mmio = 1;
   223		chip->bus.core.dma_stop_delay = 100;
 > 224		chip->bus.core.addr_offset = CIX_IPBLOQ_SKY1_ADDR_HOST_TO_HDAC_OFFSET;
   225	
   226		chip->bus.jackpoll_in_suspend = 1;
   227	
   228		err = snd_device_new(card, SNDRV_DEV_LOWLEVEL, chip, &ops);
   229		if (err < 0) {
   230			dev_err(card->dev, "failed to create device, err = %d\n", err);
   231			return err;
   232		}
   233	
   234		return 0;
   235	}
   236	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
