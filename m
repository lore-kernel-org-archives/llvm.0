Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046350;
	b=kn3b0FIAdPHC2Y0S6ir6hX7joI2xsJA/bz7VAadjV1hvL6JC+jzvd6ICsnVZEK0qL9Jh
	 B7GwLvWw/6gtTmbnVfIF1bhBb/vzaj5i5H79R+NNCnMHcXSaKAEOaf4Cjrepo8uoViodX
	 DkzOpeORpAzRn/l6z3gjhXReQqRDxa5oOn+iRZgcuCt5yCcoPhC4nbPRUbZGmJlOLIUJ+
	 ZSNToXINtu7C7T4eafamBKAmBXxOIs9ohJ+aDFsonisv7ZzBeKum2g6t7aCh5mT6sU4lp
	 us4Qh0CsKJuN4n71kZmM5bNp4cBNqeCgSuZ/TeOvmYJ1/VlbcQm7rfX44BrXN86YRPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046350;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Qw5FjnXXfzwpDGlNW2PfeJtFwV+3pUInVwDZZKmI6fY=;
	b=owizB7g1d/pA/DS69AUMKPtjmTWmRuAXVRmC8X96L6M2m4U23jubzPkC0s0djpn2sPlr
	 JsPuV+8/VWtXiunOn+cdcPR1nPUUF6g0+WlWD7KPjDJjq87NJ4znhsY9meOWMadCsay9M
	 m3mYkV0/p2FEsHESy/GdcSLSNeny8cVjkwGJ+KF/e0PNBYi8hr6NpdVQDgNrli+UBK5HK
	 YPlCv8Z8sBe02tf44dR5YRzFzmC3jIpjWuFiOaVkphUxStEunGRY/AiChXJ1ShSXz2Wqq
	 CZIbR5Wv9OgkRVG/MiI5apprH1RXhYd2LxG4pRb5oZowRKlboHkrUzM3jwe0zT76MAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acnxV8t9;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C8C606A326;
	Sat,  7 Nov 2026 10:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C8C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acnxV8t9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794046348; x=1825582348;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+0bzElMLRQVQdeuAy6k4sQcLdl/lR0vD4aQMswNIzmg=;
  b=acnxV8t9A6pr2EtyClRwFU+9heG+e8P7ChrBIO1uM1CHMXlrq6IIrxbQ
   A6OgOzYyq3H5Q6BDyli8xJgQs8mwMqaBr51ZkKZ08b29LvGFLOdN42wcA
   O/MFwuqmxY17NLbssro5dJtEb9YtAPjMLEd1MW3IzvvH1KilRbnjvu6kg
   cSLfIE+yj1RGlLJV6XGqGsgwpPEhU36WLWlZUzbYjEFdJJCPuq+cl7iTU
   RHCskcGthL7RHWm3tlXQ10gZYnm2EYbmWlsZ093PMgLZuKBHJs51lOegA
   zBxkF0NbpfnLvX1r8wOjbfHwLpG29zwMGP1mNHHYveuvfjnRCeNcwcjTZ
   g==;
X-CSE-ConnectionGUID: fDSZ7vItSmOZGMLs/qdw+g==
X-CSE-MsgGUID: LF/UhLnMTU+Llro4e9ybzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2892370"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2892370"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 02:12:27 -0800
X-CSE-ConnectionGUID: 2rjWWHb6QYmHb4j4e90Wlw==
X-CSE-MsgGUID: 5t5VTdhRQMuVE/6lieGArw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7498928"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Nov 2026 02:12:24 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPdPK-00000000qhD-02IR;
	Sat, 07 Nov 2026 10:12:22 +0000
Date: Sat, 7 Nov 2026 18:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <syed.sabakareem@amd.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sunil-kumar.Dommati@amd.com, vijendar.mukunda@amd.com,
	Mario.Limonciello@amd.com, venkataprasad.potturu@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	"open list:AMD ASoC DRIVERS" <linux-sound@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] ASoC: amd: acp: add Cirrus SoundWire configs for
 ACP7.F
Message-ID: <202611071819.8CnKog4h-lkp@intel.com>
References: <20261106191627.1590542-2-syed.sabakareem@amd.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106191627.1590542-2-syed.sabakareem@amd.com>

Hi Syed,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[cannot apply to linus/master v7.4-rc1 next-20261105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-add-SoundWire-speaker-quirks-for-Dell-platforms/20261107-004611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20261106191627.1590542-2-syed.sabakareem%40amd.com
patch subject: [PATCH 1/2] ASoC: amd: acp: add Cirrus SoundWire configs for ACP7.F
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20261107/202611071819.8CnKog4h-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611071819.8CnKog4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611071819.8CnKog4h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/amd/acp/amd-acp7x-acpi-match.c:394:43: warning: unused variable 'acp7x_cs35l63x4_l0u0246' [-Wunused-const-variable]
     394 | static const struct snd_soc_acpi_link_adr acp7x_cs35l63x4_l0u0246[] = {
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/acp7x_cs35l63x4_l0u0246 +394 sound/soc/amd/acp/amd-acp7x-acpi-match.c

   393	
 > 394	static const struct snd_soc_acpi_link_adr acp7x_cs35l63x4_l0u0246[] = {
   395		{
   396			.mask = BIT(0),
   397			.num_adr = ARRAY_SIZE(cs35l63x4_l0u0246_adr),
   398			.adr_d = cs35l63x4_l0u0246_adr,
   399		},
   400		{}
   401	};
   402	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
