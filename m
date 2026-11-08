Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174523;
	b=UFXSwk2iNMzYTynidKLpuNZjQS6lea2XnQKQL+2jrTBLyQdkukzcQZ6KXcyMGlQjc4gC
	 +Vm4lef39nsHX+5/BJdBpDQFT3myuA7TWiPN+pAKkVwP8KXs4uA+DD2lM4NubEfq3Nsav
	 eeAyjYnDq6JdyrB8P4uKZ17U1vxSJs/fKELGcQNYHeckXhNCXqTF0c+nQsuR670UPYA1n
	 Rd9O0hE610I3wDsW0sdKrlikAsz/y1nl0PEksC/ThJi3fgofScy/tPqAo5COQWaYo4UmI
	 pHdhcD9HUgrX8Ex5x6hE5/zAovQRGCNMF3sPK+Ko3yeqYVP2jpAS7HnF6f8w4pfdsgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=KC3Lhgxu6FP97ncfRy5DbvmCC8uT5+svGn+YcMvoKq0=;
	b=NftdhwxXpX4MrtERv4PBJdH1yyqAxvJHYxi/UqghEe7b3EOEh7aXK8Ge3q+DKczgpyvA
	 KT8k/ewD3+aSADeWk5voi7wpOso+4oc91HyCWw8ddSuqqVqg+DrOCW193LhdGJnjWTfxe
	 Ys13IPQvNUTQoTUJfCyLZck4Gq552G+dw3Ut7aq0LNxs0Es3aFfUuSQxWLgYi606uD8QE
	 NIaAiGxEt40b6G8SpKKFKWuvpQX6KHEVGWT9W0godhE0KYNDf95FwRhfS/GNzggyubhmZ
	 xpxKSobb39bqkm8JW9D5BXbXumRPFxH7/5CgOIgWNB4DOPsA2I8BpEYFT++NSiE3k6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HcS497RF;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4717606D801;
	Sun,  8 Nov 2026 21:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4717606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HcS497RF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794174522; x=1825710522;
  h=date:from:to:cc:subject:message-id;
  bh=JPe/7MxAOZcsmeDiG9vdDKYFy8tfON5IjkgrNmUK4qU=;
  b=HcS497RF/RNR0paq6Unl+aiOpootMoLAf/BWUfQoke2rmGBgLtXd5EPz
   WdIsOYsgH4fInRZv5GL1PltKcoBqPy1aNA7BSs8on2KP3hvmCO5rZ8hIT
   a3oloPF2xr0rJRO/FQuZ8JLar7EUM0kcsdG+pRuSjNC0ZDewq6qLZb60h
   4/eml7mGgfyKz1/upsXhQTzxdpJQviiHpBKwr7OfxpTrjBl0TK9QW/8ZE
   kvJcc1tnKCrQmt7jJfLa2Ar+uc4brAvRlbQPqqCbYHTIj/GX924ZQP4Dg
   DI+/2QMXrwh30di450iWgTYRjWjpbC7WO0oqG+ZwgutSHKMOQNyV6BuG2
   g==;
X-CSE-ConnectionGUID: CtJIefNbRA+J53CTWO4ULg==
X-CSE-MsgGUID: RsHp9YzeTqqTNNXA3Ez7hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2803087"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2803087"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 13:48:41 -0800
X-CSE-ConnectionGUID: iPPPmEgjTW+TKhcI68lRyw==
X-CSE-MsgGUID: b+twWHm3QzqT87E2Iv91dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7727089"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Nov 2026 13:48:40 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQAkf-00000000tRz-25T1;
	Sun, 08 Nov 2026 21:48:37 +0000
Date: Mon, 09 Nov 2026 05:48:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [bod:linux-7.4-rc1-ife-v1 74/102]
 drivers/media/platform/qcom/camss/camss.c:5110:20: warning: no previous
 prototype for function 'vfe_comp_group_output'
Message-ID: <202611090518.1PkNdyxL-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bod/linux.git linux-7.4-rc1-ife-v1
head:   830b5bcc668eb7ef5a2fe17463a2a374d2e45e04
commit: 67e450935000b5b20b2131b3206edaa95d248227 [74/102] media: qcom: camss: Add helper function vfe_comp_group_output
config: powerpc64-randconfig-1001-20261108 (https://download.01.org/0day-ci/archive/20261109/202611090518.1PkNdyxL-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090518.1PkNdyxL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090518.1PkNdyxL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/qcom/camss/camss.c:5110:20: warning: no previous prototype for function 'vfe_comp_group_output' [-Wmissing-prototypes]
    5110 | struct vfe_output *vfe_comp_group_output(struct vfe_device *vfe, unsigned int group)
         |                    ^
   drivers/media/platform/qcom/camss/camss.c:5110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    5110 | struct vfe_output *vfe_comp_group_output(struct vfe_device *vfe, unsigned int group)
         | ^
         | static 
   1 warning generated.


vim +/vfe_comp_group_output +5110 drivers/media/platform/qcom/camss/camss.c

  5109	
> 5110	struct vfe_output *vfe_comp_group_output(struct vfe_device *vfe, unsigned int group)
  5111	{
  5112		unsigned int i, j;
  5113	
  5114		for (i = 0; i < vfe->res->line_num; i++) {
  5115			struct vfe_line *line = &vfe->line[i];
  5116	
  5117			for (j = 0; j < line->num_outputs; j++) {
  5118				struct vfe_output *output = &line->output[j];
  5119	
  5120				if (output->wm_num && output->comp_group == group)
  5121					return output;
  5122			}
  5123		}
  5124	
  5125		return NULL;
  5126	}
  5127	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
