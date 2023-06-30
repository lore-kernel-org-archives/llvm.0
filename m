Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C312EC3;
	Fri, 30 Jun 2023 02:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688092691; x=1719628691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfYuid5WhN1TcedRrZPGcCTN+9vw/Umg8m0NoOqlJd8=;
  b=YvhLgLSMI9EYqopBieg3XibDjBslm0gktuHGuu2BDKCFZ6Ko6ig5vy2S
   Ro+qRo9/DxoDOgVaVRWgi8nGmEEKDvO8FczFwfIJov2SoWsb7LE6TSKr9
   DQLgXoW3NkPfXKnbj2EFZjcYw2THxIlzG5CJS94DxM4nh6XtGmzGZVh4T
   eflqtIqFHw7Rob+oh0u4CTPbRLQPVA2KkfmW6qWQ4V4QlD5k1l35RXzw3
   4v6waQlbUWbLGguMCgOHv2mTghIfpmlCSkgMcNEgqxPn0dZAoVuIqS0t8
   7dds71hnG0xoQOasCUyo8lsj/vrfPvtlfmpj+R4u85Y5um+dDLF+3VrBz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="425982568"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="425982568"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 19:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="862140671"
X-IronPort-AV: E=Sophos;i="6.01,169,1684825200"; 
   d="scan'208";a="862140671"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Jun 2023 19:38:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qF41Q-000EcH-0G;
	Fri, 30 Jun 2023 02:38:08 +0000
Date: Fri, 30 Jun 2023 10:37:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jsarha:no_wname_in_kcontrol_name 2/2]
 sound/soc/sof/topology.c:856:12: error: label at end of compound statement:
 expected statement
Message-ID: <202306301027.MGaRoqpG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux no_wname_in_kcontrol_name
head:   64b366f30bf75f5525ef9b88f0b9cf810cc160bc
commit: 64b366f30bf75f5525ef9b88f0b9cf810cc160bc [2/2] ASoC: SOF: topology: Add a token for dropping widget name in kcontrol name
config: x86_64-randconfig-x006-20230629 (https://download.01.org/0day-ci/archive/20230630/202306301027.MGaRoqpG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306301027.MGaRoqpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306301027.MGaRoqpG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/sof/topology.c:856:12: error: label at end of compound statement: expected statement
                           default:
                                   ^
                                    ;
   1 error generated.


vim +856 sound/soc/sof/topology.c

   824	
   825	static int sof_dapm_widget_init(struct snd_soc_component *scomp,
   826					struct snd_soc_dapm_widget *w,
   827					struct snd_soc_tplg_vendor_array *array,
   828					int array_size)
   829	{
   830		while (array_size > 0) {
   831			int asize, type, i;
   832	
   833			asize = le32_to_cpu(array->size);
   834	
   835			/* validate asize */
   836			if (asize <= 0) {
   837				dev_err(scomp->dev, "error: invalid array size 0x%x\n",
   838					asize);
   839				return -EINVAL;
   840			}
   841	
   842			/* make sure there is enough data before parsing */
   843			array_size -= asize;
   844			if (array_size < 0) {
   845				dev_err(scomp->dev, "error: invalid array size 0x%x\n",
   846					asize);
   847				return -EINVAL;
   848			}
   849			type = le32_to_cpu(array->type);
   850	
   851			for (i = 0; i < le32_to_cpu(array->num_elems); i++) {
   852				switch (le32_to_cpu(array->value[i].token)) {
   853				case SOF_TKN_COMP_NO_WNAME_IN_KCONTROL_NAME:
   854					sof_w_no_wname_in_long_name(scomp, w, type, &array->value[i]);
   855					break;
 > 856				default:
   857				}
   858			}
   859	
   860			/* next array */
   861			array = (struct snd_soc_tplg_vendor_array *)((u8 *)array + asize);
   862		}
   863		return 0;
   864	}
   865	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
