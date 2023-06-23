Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7167FC;
	Fri, 23 Jun 2023 04:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687493647; x=1719029647;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pezzVGVqtBDROV1XjDruKDPfTik1gHEt+FcVzS1lrbs=;
  b=k6P0/e2qw1mnCNzvnSkek8BcBM4z/+u1clxaODYNjyySPFXYF4bfqK5H
   KcWrLxTrh3qgZ2iaw6q0D+b4qPw6qHk6Tmug1uZLn8W71LaNzEoYlzzEL
   NYUJ5IyeKHUq7KkAnFaf9PHRGifCUNkk7rHdqGycmAI+u035SEhe9gM7a
   Y90ga6PcqkKJkcjojnf4fWgOS7bzrucpbPa3E+UbeisfBtRqX0pGL89nQ
   K8nnfW7PetEOMaWQ3j8XiOM1xkvyTvjRqSaqql94iO6RgTDOzmJ0E6FDU
   UYJNibZx52aDEdB/7ugFsHDmyC14cjhxNfvj6dxiMbtaobp4bCYqfhvTY
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="359543347"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="359543347"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 21:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="665342239"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="665342239"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Jun 2023 21:13:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCYBH-0007yl-2f;
	Fri, 23 Jun 2023 04:13:55 +0000
Date: Fri, 23 Jun 2023 12:13:28 +0800
From: kernel test robot <lkp@intel.com>
To: Syed Saba Kareem <Syed.SabaKareem@amd.com>, broonie@kernel.org,
	alsa-devel@alsa-project.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
	Sunil-kumar.Dommati@amd.com,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	V Sujith Kumar Reddy <vsujithkumar.reddy@amd.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 05/12] ASoC: amd: acp: remove the redundant acp
 enable/disable interrupts functions
Message-ID: <202306231233.NynpYomQ-lkp@intel.com>
References: <20230622152406.3709231-9-Syed.SabaKareem@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622152406.3709231-9-Syed.SabaKareem@amd.com>

Hi Syed,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.4-rc7 next-20230622]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Syed-Saba-Kareem/ASoC-amd-acp-remove-acp-poweroff-function/20230622-233145
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230622152406.3709231-9-Syed.SabaKareem%40amd.com
patch subject: [PATCH 05/12] ASoC: amd: acp: remove the redundant acp enable/disable interrupts functions
config: i386-buildonly-randconfig-r006-20230622 (https://download.01.org/0day-ci/archive/20230623/202306231233.NynpYomQ-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306231233.NynpYomQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306231233.NynpYomQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: acp_enable_interrupts
   >>> referenced by acp-renoir.c:191 (sound/soc/amd/acp/acp-renoir.c:191)
   >>>               sound/soc/amd/acp/acp-renoir.o:(renoir_audio_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: acp_disable_interrupts
   >>> referenced by acp-renoir.c:202 (sound/soc/amd/acp/acp-renoir.c:202)
   >>>               sound/soc/amd/acp/acp-renoir.o:(renoir_audio_remove) in archive vmlinux.a
   pahole: .tmp_vmlinux.btf: Invalid argument
   ld.lld: error: .btf.vmlinux.bin.o: unknown file type

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
