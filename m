Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D5913B58C;
	Sun,  4 Aug 2024 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722814437; cv=none; b=HLhVSSQJSLBNr2zd3stOnC9r61UGV3mE2Ffj4Mv+dkJExrvBbGhzxGzJZmDoB9AEHwGujya+UFyW/a0RcP3tKsZvI7spV6Ukbus5DAb+GzOUhKazyWwS3X6tA5gQdCNnzcbZ5Qxo//olHOMtfjfxjcY1UIKkqvhi4tXRyl6sAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722814437; c=relaxed/simple;
	bh=YNiK52tqjvH1YMSFEVG1g6kPtcgRQbMOB62OYCiVx0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cXIgzdxbia3D44KT/sQgvIHjTUlthGz3IJUR76vbyD/oVxf623xRoW3XNgOJC0PVh5UWatTQtgeRj5sv4M9pNR4WgNEiybEbh2JO9rnSal7gnUfzziQScE/ZA6KneDYWty3qqzdJx2JhpRPXkxyTjB65WYNUovxj8r4GfxKRZW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HkUEhLNX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HkUEhLNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722814435; x=1754350435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YNiK52tqjvH1YMSFEVG1g6kPtcgRQbMOB62OYCiVx0A=;
  b=HkUEhLNX+09fglnD1jke1lqynMroTzN4/qqn9tO+Zal6uyHt0yPPUL5L
   4aZWu5kaNMGUS+ZtTxV6XivuRXxa/nq9yyVedZ++9XKRZVunv+vD8iM1E
   MGbzBlbgfCPz5ZIsTcAxbCxl3fJYORfFliNe7ZnijvIsAFNmj+Ko1Xhlq
   hxUML51iGVZSFjNMhmGAEQZXqTYsZOUZ7bNDZqfpR6zRuX4Z76O4dVHXh
   BlUQQjn/b+/bKRUV/jj6Icc8GaSUfpQL2c4SD48ZHPxCj08NJojwxn4N0
   4HS//t23Y+k9VAR4qxs8l3pEibV+K67au+wGB109TPCp3d+IC0SByck0Q
   A==;
X-CSE-ConnectionGUID: qnap8WiwQVS9wovSLd+tkg==
X-CSE-MsgGUID: F9TtlLARTJ6BB+wgi7ofUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="46163228"
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="46163228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2024 16:33:54 -0700
X-CSE-ConnectionGUID: x7F/yaDOQyuxCCTid+YdXA==
X-CSE-MsgGUID: /J5BAN8rR0uB8knM867Q0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,263,1716274800"; 
   d="scan'208";a="55933870"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 04 Aug 2024 16:33:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sakjW-0001e8-1w;
	Sun, 04 Aug 2024 23:33:50 +0000
Date: Mon, 5 Aug 2024 07:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	linux1394-devel@lists.sourceforge.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/17] firewire: ohci: use guard macro to serialize
 operations for isochronous contexts
Message-ID: <202408050730.y1eyRcTv-lkp@intel.com>
References: <20240804130225.243496-18-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240804130225.243496-18-o-takashi@sakamocchi.jp>

Hi Takashi,

kernel test robot noticed the following build errors:

[auto build test ERROR on ieee1394-linux1394/for-next]
[also build test ERROR on ieee1394-linux1394/for-linus linus/master v6.11-rc1 next-20240802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Takashi-Sakamoto/firewire-core-use-guard-macro-to-maintain-static-packet-data-for-phy-configuration/20240804-210645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git for-next
patch link:    https://lore.kernel.org/r/20240804130225.243496-18-o-takashi%40sakamocchi.jp
patch subject: [PATCH 17/17] firewire: ohci: use guard macro to serialize operations for isochronous contexts
config: arm64-randconfig-003-20240805 (https://download.01.org/0day-ci/archive/20240805/202408050730.y1eyRcTv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240805/202408050730.y1eyRcTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408050730.y1eyRcTv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firewire/ohci.c:3138:2: error: expected expression
    3138 |         guard(spinlock_irq)(&ohci->lock);
         |         ^
   include/linux/cleanup.h:167:2: note: expanded from macro 'guard'
     167 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:122:2: note: expanded from macro 'CLASS'
     122 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:133:1: note: expanded from here
     133 | class_spinlock_irq_t
         | ^
   1 error generated.


vim +3138 drivers/firewire/ohci.c

  3059	
  3060	static struct fw_iso_context *ohci_allocate_iso_context(struct fw_card *card,
  3061					int type, int channel, size_t header_size)
  3062	{
  3063		struct fw_ohci *ohci = fw_ohci(card);
  3064		struct iso_context *ctx;
  3065		descriptor_callback_t callback;
  3066		u64 *channels;
  3067		u32 *mask, regs;
  3068		int index, ret = -EBUSY;
  3069	
  3070		scoped_guard(spinlock_irq, &ohci->lock) {
  3071			switch (type) {
  3072			case FW_ISO_CONTEXT_TRANSMIT:
  3073				mask     = &ohci->it_context_mask;
  3074				callback = handle_it_packet;
  3075				index    = ffs(*mask) - 1;
  3076				if (index >= 0) {
  3077					*mask &= ~(1 << index);
  3078					regs = OHCI1394_IsoXmitContextBase(index);
  3079					ctx  = &ohci->it_context_list[index];
  3080				}
  3081				break;
  3082	
  3083			case FW_ISO_CONTEXT_RECEIVE:
  3084				channels = &ohci->ir_context_channels;
  3085				mask     = &ohci->ir_context_mask;
  3086				callback = handle_ir_packet_per_buffer;
  3087				index    = *channels & 1ULL << channel ? ffs(*mask) - 1 : -1;
  3088				if (index >= 0) {
  3089					*channels &= ~(1ULL << channel);
  3090					*mask     &= ~(1 << index);
  3091					regs = OHCI1394_IsoRcvContextBase(index);
  3092					ctx  = &ohci->ir_context_list[index];
  3093				}
  3094				break;
  3095	
  3096			case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
  3097				mask     = &ohci->ir_context_mask;
  3098				callback = handle_ir_buffer_fill;
  3099				index    = !ohci->mc_allocated ? ffs(*mask) - 1 : -1;
  3100				if (index >= 0) {
  3101					ohci->mc_allocated = true;
  3102					*mask &= ~(1 << index);
  3103					regs = OHCI1394_IsoRcvContextBase(index);
  3104					ctx  = &ohci->ir_context_list[index];
  3105				}
  3106				break;
  3107	
  3108			default:
  3109				index = -1;
  3110				ret = -ENOSYS;
  3111			}
  3112	
  3113			if (index < 0)
  3114				return ERR_PTR(ret);
  3115		}
  3116	
  3117		memset(ctx, 0, sizeof(*ctx));
  3118		ctx->header_length = 0;
  3119		ctx->header = (void *) __get_free_page(GFP_KERNEL);
  3120		if (ctx->header == NULL) {
  3121			ret = -ENOMEM;
  3122			goto out;
  3123		}
  3124		ret = context_init(&ctx->context, ohci, regs, callback);
  3125		if (ret < 0)
  3126			goto out_with_header;
  3127	
  3128		if (type == FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL) {
  3129			set_multichannel_mask(ohci, 0);
  3130			ctx->mc_completed = 0;
  3131		}
  3132	
  3133		return &ctx->base;
  3134	
  3135	 out_with_header:
  3136		free_page((unsigned long)ctx->header);
  3137	 out:
> 3138		guard(spinlock_irq)(&ohci->lock);
  3139	
  3140		switch (type) {
  3141		case FW_ISO_CONTEXT_RECEIVE:
  3142			*channels |= 1ULL << channel;
  3143			break;
  3144	
  3145		case FW_ISO_CONTEXT_RECEIVE_MULTICHANNEL:
  3146			ohci->mc_allocated = false;
  3147			break;
  3148		}
  3149		*mask |= 1 << index;
  3150	
  3151		return ERR_PTR(ret);
  3152	}
  3153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
