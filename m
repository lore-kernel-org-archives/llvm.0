Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D082B33EB09;
	Wed, 22 Oct 2025 14:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761144964; cv=none; b=C4Ynl25o0agc5zJPfIxnh7iTd3Z6hQjunTGUGE/PAjspg/F4ac3s8eUJrQLY3Y1ZRB/8s6gVSEZbQstKiKSEqQYaSI/SGhXvn9qS2xTAM7sZoJ5l74fzEFX5nVa4t8uoxU3I4Zegmfc4VHMTK+qAFjIJ07klNKFdvMcyoCOsXL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761144964; c=relaxed/simple;
	bh=1k0h9ke+imuVkcbrlEJhbQrnGGwnjcDdE+eGUs82J5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KeCgytLzMqRxHLLDFezx9hIGsClpRkO0eNRcBQHjtxz7O/Z5yoTpijCX6M0ahVBPzW+eFAdO/LZG1ZVIWBqzhUfK/AGN16OP9LJTogFZPvSBHqpQGiL3fa5qJVh48Nomjh4k5jXsfj+LCuBTebr4FfhuPJ214Bg4dq4s8jg+jUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k0SQedCi; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k0SQedCi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761144963; x=1792680963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1k0h9ke+imuVkcbrlEJhbQrnGGwnjcDdE+eGUs82J5Y=;
  b=k0SQedCi1w9pnBSNGrjLUZyi/bb925rHL9VbEEGWaikhuskfU35jLMKy
   g1g3n2c9TH8g3Gv6sEUiBWu2tBJ/h4DxQdYkjCIFgh/mwP+AGAx4Gyp9A
   S3Kr7vIODdwgFy3+NFmccdZqC2sXZ6OGSOH8SAVDcd2RVFmgB1SF7qLwL
   RyMYWrIOnvpQN8RCbMLW7o3C6HhgQEagRiZwyI8o1krRJz49Wu5gnMx+i
   duNwfdRBS1/AtI95e/KC/Kuq0Xs90F2GA3IlUbiaP5VuKceBqQTmgvnUk
   s0Oj+D/5iQua3yM0Ax+BUqFcFR2IBs1cKZ4rIB2NZyXUI4TeOde/gouys
   w==;
X-CSE-ConnectionGUID: Z0OgfnPKSn2THM+690QTLg==
X-CSE-MsgGUID: 90+qIP7QRzGsLDoNZrbHwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80923769"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="80923769"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 07:56:02 -0700
X-CSE-ConnectionGUID: KnTCe76uSE2LBBnJ07TObg==
X-CSE-MsgGUID: uekKQdbfTbCUGBULnMqAFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; 
   d="scan'208";a="214836268"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Oct 2025 07:55:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBaEu-000CRU-3C;
	Wed, 22 Oct 2025 14:55:26 +0000
Date: Wed, 22 Oct 2025 22:53:14 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, bpf@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, magnus.karlsson@intel.com,
	aleksander.lobakin@intel.com, ilias.apalodimas@linaro.org,
	toke@redhat.com, lorenzo@kernel.org, kuba@kernel.org,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	syzbot+ff145014d6b0ce64a173@syzkaller.appspotmail.com,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Octavian Purdila <tavip@google.com>
Subject: Re: [PATCH v3 bpf 1/2] xdp: introduce xdp_convert_skb_to_buff()
Message-ID: <202510222209.D4RDn4DI-lkp@intel.com>
References: <20251022125209.2649287-2-maciej.fijalkowski@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022125209.2649287-2-maciej.fijalkowski@intel.com>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/xdp-introduce-xdp_convert_skb_to_buff/20251022-210958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20251022125209.2649287-2-maciej.fijalkowski%40intel.com
patch subject: [PATCH v3 bpf 1/2] xdp: introduce xdp_convert_skb_to_buff()
config: i386-buildonly-randconfig-002-20251022 (https://download.01.org/0day-ci/archive/20251022/202510222209.D4RDn4DI-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510222209.D4RDn4DI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510222209.D4RDn4DI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:19:
>> include/net/xdp.h:398:10: error: incompatible pointer to integer conversion assigning to 'u32' (aka 'unsigned int') from 'sk_buff_data_t' (aka 'unsigned char *') [-Wint-conversion]
     398 |         pkt_len =  skb->tail - skb->mac_header;
         |                 ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +398 include/net/xdp.h

   386	
   387	static inline
   388	void xdp_convert_skb_to_buff(struct sk_buff *skb, struct xdp_buff *xdp,
   389				     struct xdp_rxq_info *xdp_rxq)
   390	{
   391		u32 frame_sz, pkt_len;
   392	
   393		/* SKB "head" area always have tailroom for skb_shared_info */
   394		frame_sz = skb_end_pointer(skb) - skb->head;
   395		frame_sz += SKB_DATA_ALIGN(sizeof(struct skb_shared_info));
   396	
   397		DEBUG_NET_WARN_ON_ONCE(!skb_mac_header_was_set(skb));
 > 398		pkt_len =  skb->tail - skb->mac_header;
   399	
   400		xdp_init_buff(xdp, frame_sz, xdp_rxq);
   401		xdp_prepare_buff(xdp, skb->head, skb->mac_header, pkt_len, true);
   402	
   403		if (skb_is_nonlinear(skb)) {
   404			skb_shinfo(skb)->xdp_frags_size = skb->data_len;
   405			xdp_buff_set_frags_flag(xdp);
   406		} else {
   407			xdp_buff_clear_frags_flag(xdp);
   408		}
   409	
   410		xdp->rxq->mem.type = page_pool_page_is_pp(virt_to_head_page(xdp->data)) ?
   411					MEM_TYPE_PAGE_POOL : MEM_TYPE_PAGE_SHARED;
   412	}
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
