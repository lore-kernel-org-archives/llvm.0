Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6001E524;
	Wed, 13 Mar 2024 14:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710341579; cv=none; b=rJ/zCBU+pCN07aIaDVgZtyUCe0kPbISqmhYOAHDa+qThfSm7Aat/uIl1g0hFJlmgbYnatlIJWsjbgLpZ/m6+7BM0aUIXeqvyGWyLkKN8XDz/HD9fK2cjrytJTsN5g9ZHCED5RdYFbWj6i4nYCk9iNHpGB4jAiH9EgXicC/CP4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710341579; c=relaxed/simple;
	bh=z1w2CnCKMTbRroLbi4e6LXi/lMI2nKIKqjyZP1VGxCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i+lu9TBA5GAeuIjn/1wqCt8ZGpVFTtDGDoWDfF2QVAtEhI1mtM2b8Xn4i0rNh+dlx9HLiHOMWvoKi4gB+5ghPi09yCcQl5yaR1vnr+BJnBQXPzlWJceyR7YcUHR5zp+U74vY+3xpWgrgOhLGbWRk7tNJPxluSpv+Exim6ZdK4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=msi9OuI9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="msi9OuI9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710341577; x=1741877577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z1w2CnCKMTbRroLbi4e6LXi/lMI2nKIKqjyZP1VGxCk=;
  b=msi9OuI9UAtcFE4IigIMPKsGsqhMYCBy1hvy0dFr+JQUQyhIzm0n4BPV
   zM48cIetWoec/VwgxfDlsXyQbV68R5BhJnFxepVr0sIvkZ5Yxxs7kiwdm
   iCK4opZma5VukDXJe5VSdNXn6Nw0wFc2m687GkbJKLEef251Y7D4jZYqV
   OLPwmWXl4M8EHWoaXvUX18l9cNuJhJySAcyl/UfYueZFtu2jOiZb4t7fd
   HW7k48aFGmj4WALqCRgxFnfItJB6tcoOGvUfFR5Dzb1TdEhNEUbP0WNks
   KAj3v6qfU+GKHbGfjZUtfi1jccp/Uo3Scfr8pzluTiMXTuWehCZc+1mcF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8052368"
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="8052368"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 07:52:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,122,1708416000"; 
   d="scan'208";a="16523658"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Mar 2024 07:52:52 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkPyL-000CT7-2n;
	Wed, 13 Mar 2024 14:52:49 +0000
Date: Wed, 13 Mar 2024 22:51:55 +0800
From: kernel test robot <lkp@intel.com>
To: Johan Carlsson <johan.carlsson@teenage.engineering>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Takashi Iwai <tiwai@suse.de>
Subject: [linux-next:master 13138/13397] sound/usb/stream.c:306:13: error:
 use of undeclared identifier 'chmaps'; did you mean 'chmap'?
Message-ID: <202403132200.X4RzDIwM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   dad309222e4c3fc7f88b20ce725ce1e0eea07cc7
commit: a94566ace3ca789747cd4cb26dd59474d135c7ac [13138/13397] ALSA: usb-audio: Stop parsing channels bits when all channels are found.
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240313/202403132200.X4RzDIwM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240313/202403132200.X4RzDIwM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403132200.X4RzDIwM-lkp@intel.com/

Note: the linux-next/master HEAD dad309222e4c3fc7f88b20ce725ce1e0eea07cc7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> sound/usb/stream.c:306:13: error: use of undeclared identifier 'chmaps'; did you mean 'chmap'?
                           if (c == chmaps->channels)
                                    ^~~~~~
                                    chmap
   sound/usb/stream.c:287:29: note: 'chmap' declared here
           struct snd_pcm_chmap_elem *chmap;
                                      ^
   1 error generated.


vim +306 sound/usb/stream.c

   237	
   238	/* convert from USB ChannelConfig bits to ALSA chmap element */
   239	static struct snd_pcm_chmap_elem *convert_chmap(int channels, unsigned int bits,
   240							int protocol)
   241	{
   242		static const unsigned int uac1_maps[] = {
   243			SNDRV_CHMAP_FL,		/* left front */
   244			SNDRV_CHMAP_FR,		/* right front */
   245			SNDRV_CHMAP_FC,		/* center front */
   246			SNDRV_CHMAP_LFE,	/* LFE */
   247			SNDRV_CHMAP_SL,		/* left surround */
   248			SNDRV_CHMAP_SR,		/* right surround */
   249			SNDRV_CHMAP_FLC,	/* left of center */
   250			SNDRV_CHMAP_FRC,	/* right of center */
   251			SNDRV_CHMAP_RC,		/* surround */
   252			SNDRV_CHMAP_SL,		/* side left */
   253			SNDRV_CHMAP_SR,		/* side right */
   254			SNDRV_CHMAP_TC,		/* top */
   255			0 /* terminator */
   256		};
   257		static const unsigned int uac2_maps[] = {
   258			SNDRV_CHMAP_FL,		/* front left */
   259			SNDRV_CHMAP_FR,		/* front right */
   260			SNDRV_CHMAP_FC,		/* front center */
   261			SNDRV_CHMAP_LFE,	/* LFE */
   262			SNDRV_CHMAP_RL,		/* back left */
   263			SNDRV_CHMAP_RR,		/* back right */
   264			SNDRV_CHMAP_FLC,	/* front left of center */
   265			SNDRV_CHMAP_FRC,	/* front right of center */
   266			SNDRV_CHMAP_RC,		/* back center */
   267			SNDRV_CHMAP_SL,		/* side left */
   268			SNDRV_CHMAP_SR,		/* side right */
   269			SNDRV_CHMAP_TC,		/* top center */
   270			SNDRV_CHMAP_TFL,	/* top front left */
   271			SNDRV_CHMAP_TFC,	/* top front center */
   272			SNDRV_CHMAP_TFR,	/* top front right */
   273			SNDRV_CHMAP_TRL,	/* top back left */
   274			SNDRV_CHMAP_TRC,	/* top back center */
   275			SNDRV_CHMAP_TRR,	/* top back right */
   276			SNDRV_CHMAP_TFLC,	/* top front left of center */
   277			SNDRV_CHMAP_TFRC,	/* top front right of center */
   278			SNDRV_CHMAP_LLFE,	/* left LFE */
   279			SNDRV_CHMAP_RLFE,	/* right LFE */
   280			SNDRV_CHMAP_TSL,	/* top side left */
   281			SNDRV_CHMAP_TSR,	/* top side right */
   282			SNDRV_CHMAP_BC,		/* bottom center */
   283			SNDRV_CHMAP_RLC,	/* back left of center */
   284			SNDRV_CHMAP_RRC,	/* back right of center */
   285			0 /* terminator */
   286		};
   287		struct snd_pcm_chmap_elem *chmap;
   288		const unsigned int *maps;
   289		int c;
   290	
   291		if (channels > ARRAY_SIZE(chmap->map))
   292			return NULL;
   293	
   294		chmap = kzalloc(sizeof(*chmap), GFP_KERNEL);
   295		if (!chmap)
   296			return NULL;
   297	
   298		maps = protocol == UAC_VERSION_2 ? uac2_maps : uac1_maps;
   299		chmap->channels = channels;
   300		c = 0;
   301	
   302		if (bits) {
   303			for (; bits && *maps; maps++, bits >>= 1) {
   304				if (bits & 1)
   305					chmap->map[c++] = *maps;
 > 306				if (c == chmaps->channels)
   307					break;
   308			}
   309		} else {
   310			/* If we're missing wChannelConfig, then guess something
   311			    to make sure the channel map is not skipped entirely */
   312			if (channels == 1)
   313				chmap->map[c++] = SNDRV_CHMAP_MONO;
   314			else
   315				for (; c < channels && *maps; maps++)
   316					chmap->map[c++] = *maps;
   317		}
   318	
   319		for (; c < channels; c++)
   320			chmap->map[c] = SNDRV_CHMAP_UNKNOWN;
   321	
   322		return chmap;
   323	}
   324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
