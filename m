Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AA029D297;
	Thu, 18 Sep 2025 21:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230044; cv=none; b=fiuDsGEYMMbwmuoiio3c00GY3XcCmPta8KBscoPZjrgIzvADE5hQ6b5pfbIt1wd+ytEOFFVRhwa9Pgdnw5aszk4ymk04RDHnBczQiNP4ckxtwsiHdG5lz1LnQs79QUTWtKS98o/N8L9Xb2242Bd2tu0YuOocZ4jo2K8FvAAkJLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230044; c=relaxed/simple;
	bh=0Uv8ek4dO88aoeey0y1Bha7XgETgaJkAxVznnBtpkAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K+pBVZVgrlv4cIJc/4DZMfA5TBoFV8W451mj/p88w182jpFgpDJC+KP1vnscuksOO+YmoVf/+5okhiWmfdKBg0nLvU+SeHRir30WPejpxGPQY6PW9ef+/4tPlxB2c3hUdgJun4ubxdDNUrAS/A9aSHk6sN86TqcP35QC4L933m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QyvHdhzY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QyvHdhzY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758230043; x=1789766043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Uv8ek4dO88aoeey0y1Bha7XgETgaJkAxVznnBtpkAA=;
  b=QyvHdhzYhFqa0SVUA223TPphwYQ1PTTSXM8tI2LIhvUQO1CXtbduCcCF
   jHEuw+xpmexbPFRJ/o4DDM06i5xV7m9ND+g779A8deEmAzOEP99Gb+lKT
   P4jDQWXMat7fOUKhOKszpnDHuPtoBFJmm9AcX3/PWLcum8Oz3yGlaSHgF
   AvpgjixNJPYDrT3XlQjH4F559ADQ6e8HxFefXPGLNoRUo1rbjl5nP7X3J
   /M5Nu1q7dWhCtglayx2WnNEIkb0fWFpK//CaNBoXmHjUXzw5MCi7Vpdfd
   NWwujWFj4b1CjcqabuM4CDCMYXfAM4UF7i6re+MjrCSZ/nZ9l81t+GOxm
   g==;
X-CSE-ConnectionGUID: e1UGMXF6QmaHxJt7NFcdow==
X-CSE-MsgGUID: IGcJ+TYfQVSDWyITnR8STg==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60506136"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="60506136"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 14:14:02 -0700
X-CSE-ConnectionGUID: WzyAAESPQh2g7WauK5hD4Q==
X-CSE-MsgGUID: A6Dp3vLQSJ+jnjTsTldtaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="212809531"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Sep 2025 14:14:01 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzLwz-0003it-31;
	Thu, 18 Sep 2025 21:13:57 +0000
Date: Fri, 19 Sep 2025 05:13:45 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [thesofproject:topic/sof-dev 6/8]
 sound/soc/sof/ipc4-topology.c:3009:4: warning: format specifies type
 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int')
Message-ID: <202509190540.9cp0ESQW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   2b78e316ef97a3c551ba8357e63e44bc6a19cfe7
commit: dbed0a33a87b7b6170f9fcb9de6d6af35109b31e [6/8] ASoC: sof ipc4: Add sof_ipc4_widget_setup_msg_payload() and call it
config: i386-buildonly-randconfig-006-20250919 (https://download.01.org/0day-ci/archive/20250919/202509190540.9cp0ESQW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190540.9cp0ESQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509190540.9cp0ESQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc4-topology.c:3009:4: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
    3008 |                 dev_err(sdev->dev, "Max ipc payload size %lu exceeded: %u",
         |                                                          ~~~
         |                                                          %zu
    3009 |                         sdev->ipc->max_payload_size, new_size);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
     154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                                                ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
     110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
         |                              ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +3009 sound/soc/sof/ipc4-topology.c

  2954	
  2955	static int sof_ipc4_widget_setup_msg_payload(struct snd_sof_dev *sdev,
  2956						     struct snd_sof_widget *swidget,
  2957						     struct sof_ipc4_msg *msg,
  2958						     void *ipc_data, u32 ipc_size,
  2959						     void **new_data)
  2960	{
  2961		struct sof_ipc4_mod_init_ext_dp_memory_data *dp_mem_data;
  2962		struct sof_ipc4_module_init_ext_init *ext_init;
  2963		struct sof_ipc4_module_init_ext_object *hdr;
  2964		int new_size;
  2965		u32 *payload;
  2966		u32 ext_pos;
  2967	
  2968		/* For the moment the only reason for adding init_ext_init payload is DP
  2969		 * memory data. If both stack and heap size are 0 (= use default), then
  2970		 * there is no need for init_ext_init payload.
  2971		 */
  2972		if (swidget->comp_domain != SOF_COMP_DOMAIN_DP) {
  2973			msg->extension &= ~SOF_IPC4_MOD_EXT_EXTENDED_INIT_MASK;
  2974			return 0;
  2975		}
  2976	
  2977		payload = kzalloc(sdev->ipc->max_payload_size, GFP_KERNEL);
  2978		if (!payload)
  2979			return -ENOMEM;
  2980	
  2981		/* Add ext_init first and set objects array flag to 1 */
  2982		ext_init = (struct sof_ipc4_module_init_ext_init *)payload;
  2983		ext_init->word0 |= SOF_IPC4_MOD_INIT_EXT_OBJ_ARRAY_MASK;
  2984		ext_pos = DIV_ROUND_UP(sizeof(*ext_init), sizeof(u32));
  2985	
  2986		/* Add object array objects after ext_init */
  2987	
  2988		/* Add dp_memory_data if comp_domain indicates DP */
  2989		if (swidget->comp_domain == SOF_COMP_DOMAIN_DP) {
  2990			hdr = (struct sof_ipc4_module_init_ext_object *)&payload[ext_pos];
  2991			hdr->header = SOF_IPC4_MOD_INIT_EXT_OBJ_LAST_MASK |
  2992				SOF_IPC4_MOD_INIT_EXT_OBJ_ID(SOF_IPC4_MOD_INIT_DATA_ID_DP_DATA) |
  2993				SOF_IPC4_MOD_INIT_EXT_OBJ_WORDS(DIV_ROUND_UP(sizeof(*dp_mem_data),
  2994									     sizeof(u32)));
  2995			ext_pos += DIV_ROUND_UP(sizeof(*hdr), sizeof(u32));
  2996			dp_mem_data = (struct sof_ipc4_mod_init_ext_dp_memory_data *)&payload[ext_pos];
  2997			dp_mem_data->domain_id = swidget->dp_domain_id;
  2998			dp_mem_data->stack_bytes = swidget->dp_stack_bytes;
  2999			dp_mem_data->heap_bytes = swidget->dp_heap_bytes;
  3000			ext_pos += DIV_ROUND_UP(sizeof(*dp_mem_data), sizeof(u32));
  3001		}
  3002	
  3003		/* If another array object is added, remember clear previous OBJ_LAST bit */
  3004	
  3005		/* Calculate final size and check that it fits to max payload size */
  3006		new_size = ext_pos * sizeof(u32) + ipc_size;
  3007		if (new_size > sdev->ipc->max_payload_size) {
  3008			dev_err(sdev->dev, "Max ipc payload size %lu exceeded: %u",
> 3009				sdev->ipc->max_payload_size, new_size);
  3010			kfree(payload);
  3011			return -EINVAL;
  3012		}
  3013		*new_data = payload;
  3014	
  3015		/* Copy module specific ipc_payload to end */
  3016		memcpy(&payload[ext_pos], ipc_data, ipc_size);
  3017	
  3018		/* Update msg extension bits according to the payload changes */
  3019		msg->extension |= SOF_IPC4_MOD_EXT_EXTENDED_INIT_MASK;
  3020		msg->extension &= ~SOF_IPC4_MOD_EXT_PARAM_SIZE_MASK;
  3021		msg->extension |= SOF_IPC4_MOD_EXT_PARAM_SIZE(DIV_ROUND_UP(new_size, sizeof(u32)));
  3022	
  3023		return new_size;
  3024	}
  3025	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
