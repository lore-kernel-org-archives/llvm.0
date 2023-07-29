Received: from mgamail.intel.com (unknown [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F71C06;
	Sat, 29 Jul 2023 07:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690616539; x=1722152539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EZOQbnRRshYDfaLoWy3RA+1Qs+jb7CO7OoqYwyF60Yc=;
  b=KNwMsneuL/MPwNhdQ4Bvnrk7l3qoYa9tX6wWHkr5w/tpRw7KSgZdJX2v
   cNjRSre8ukeMQmonmZ/VQsDtOipJP2dQxFAGw7rB2tMDQ/heYPhDRsdgG
   clFX0riRUcBzDJfRfdXNF9Eie+eYvxIf3PUBj7k9CERSmeinYk8ko7yIw
   jrSSmW10ea4iu/4LXYcQpyxgUfspqfuORdOwCcTE7847vzio3Kj53m8WG
   EvVNTF7Nw004fOO5V6MjIzoCoLX9PfvbQ7aDbuWjl7CkBYRfdGnAbc4Cl
   zrPv/slS9RpNwTXvZlMALHNDtr30kGRWbqI0Tnz6PCHlvY7SpElVSSyWV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="366211103"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="366211103"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 00:42:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="762811945"
X-IronPort-AV: E=Sophos;i="6.01,239,1684825200"; 
   d="scan'208";a="762811945"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 29 Jul 2023 00:42:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPeaG-0003uN-1M;
	Sat, 29 Jul 2023 07:42:01 +0000
Date: Sat, 29 Jul 2023 15:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/pcm-sockptr 18/26]
 drivers/media/pci/solo6x10/solo6x10-g723.c:242:11: error: use of undeclared
 identifier 'snd_solo_pcm_copy_user'; did you mean 'snd_solo_pcm_copy'?
Message-ID: <202307291526.AOnKZKB1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/pcm-sockptr
head:   3fffa74b00add561981357c76375e1829059d4e5
commit: 79cf0bf97368998dd44c1863d6f54057846b68c9 [18/26] media: solo6x10: Convert to generic PCM copy ops
config: x86_64-randconfig-x004-20230728 (https://download.01.org/0day-ci/archive/20230729/202307291526.AOnKZKB1-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291526.AOnKZKB1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291526.AOnKZKB1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/pci/solo6x10/solo6x10-g723.c:242:11: error: use of undeclared identifier 'snd_solo_pcm_copy_user'; did you mean 'snd_solo_pcm_copy'?
           .copye = snd_solo_pcm_copy_user,
                    ^~~~~~~~~~~~~~~~~~~~~~
                    snd_solo_pcm_copy
   drivers/media/pci/solo6x10/solo6x10-g723.c:207:12: note: 'snd_solo_pcm_copy' declared here
   static int snd_solo_pcm_copy(struct snd_pcm_substream *ss, int channel,
              ^
>> drivers/media/pci/solo6x10/solo6x10-g723.c:242:3: error: field designator 'copye' does not refer to any field in type 'const struct snd_pcm_ops'; did you mean 'copy'?
           .copye = snd_solo_pcm_copy_user,
            ^~~~~
            copy
   include/sound/pcm.h:72:8: note: 'copy' declared here
           int (*copy)(struct snd_pcm_substream *substream, int channel,
                 ^
   2 errors generated.


vim +242 drivers/media/pci/solo6x10/solo6x10-g723.c

   235	
   236	static const struct snd_pcm_ops snd_solo_pcm_ops = {
   237		.open = snd_solo_pcm_open,
   238		.close = snd_solo_pcm_close,
   239		.prepare = snd_solo_pcm_prepare,
   240		.trigger = snd_solo_pcm_trigger,
   241		.pointer = snd_solo_pcm_pointer,
 > 242		.copye = snd_solo_pcm_copy_user,
   243	};
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
