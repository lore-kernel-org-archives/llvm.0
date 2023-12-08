Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0243139846;
	Fri,  8 Dec 2023 17:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OsYz13ea"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702056617; x=1733592617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+gB2Q0J8HX6MQGePWap2KwWwhmh91nZTU2F3h3jDrQg=;
  b=OsYz13eaieMFD3Tqn02RubUGI1+sHHY+BELWXt25rsMTQHCSvEPEi9Xa
   a37E8pDgZ4mIwiu/3XYZlKIieatBmFxSl58E4OdJZmnIis7M+zDlV5U0d
   GxgKe1Q6tM8lCOwEHMkNo7ITMRbKVdjJSVU7QIL4B0jLCwXcRR1RTax55
   xmzQZeL1ohOXTYv6/v9v1o9eWEJJ5aCfRtXsoaMnwJya0MFrrvF5DprI1
   WKbGSmo3W/JLOxgDtSCZ0SGtq4O+j4u6Zr9upz2d66sFS4HERaYqQDk0+
   JHzLPwmt2MupxDMcsw54hWD6WTfNhLhFh9GFwj8wopUCjTiLdZurXzb9F
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="13132796"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="13132796"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 09:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="806467994"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; 
   d="scan'208";a="806467994"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 08 Dec 2023 09:30:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBefy-000E6q-1w;
	Fri, 08 Dec 2023 17:30:10 +0000
Date: Sat, 9 Dec 2023 01:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>, bpf@vger.kernel.org,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, magnus.karlsson@intel.com, bjorn@kernel.org,
	maciej.fijalkowski@intel.com, echaudro@redhat.com,
	lorenzo@kernel.org
Subject: Re: [PATCH bpf 2/3] net: fix usage of multi-buffer BPF helper for ZC
 AF_XDP
Message-ID: <202312090104.6EOsoGVa-lkp@intel.com>
References: <20231208112945.313687-3-maciej.fijalkowski@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208112945.313687-3-maciej.fijalkowski@intel.com>

Hi Maciej,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/xsk-recycle-buffer-in-case-Rx-queue-was-full/20231208-193306
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20231208112945.313687-3-maciej.fijalkowski%40intel.com
patch subject: [PATCH bpf 2/3] net: fix usage of multi-buffer BPF helper for ZC AF_XDP
config: i386-buildonly-randconfig-003-20231208 (https://download.01.org/0day-ci/archive/20231209/202312090104.6EOsoGVa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231209/202312090104.6EOsoGVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312090104.6EOsoGVa-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/core/filter.c:4102:3: error: call to undeclared function 'xsk_buff_get_tail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   xsk_buff_get_tail(xdp)->data_end -= shrink;
                   ^
   net/core/filter.c:4102:3: note: did you mean 'xsk_buff_get_frag'?
   include/net/xdp_sock_drv.h:324:32: note: 'xsk_buff_get_frag' declared here
   static inline struct xdp_buff *xsk_buff_get_frag(struct xdp_buff *first)
                                  ^
>> net/core/filter.c:4102:27: error: member reference type 'int' is not a pointer
                   xsk_buff_get_tail(xdp)->data_end -= shrink;
                   ~~~~~~~~~~~~~~~~~~~~~~  ^
   net/core/filter.c:4115:14: error: call to undeclared function 'xsk_buff_get_tail'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           zc_frag = xsk_buff_get_tail(xdp);
                                     ^
>> net/core/filter.c:4115:12: error: incompatible integer to pointer conversion assigning to 'struct xdp_buff *' from 'int' [-Wint-conversion]
                           zc_frag = xsk_buff_get_tail(xdp);
                                   ^ ~~~~~~~~~~~~~~~~~~~~~~
>> net/core/filter.c:4117:4: error: call to undeclared function 'xsk_buff_tail_del'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           xsk_buff_tail_del(zc_frag);
                           ^
   5 errors generated.


vim +/xsk_buff_get_tail +4102 net/core/filter.c

  4097	
  4098	static void __shrink_data(struct xdp_buff *xdp, struct xdp_mem_info *mem_info,
  4099				  skb_frag_t *frag, int shrink)
  4100	{
  4101		if (mem_info->type == MEM_TYPE_XSK_BUFF_POOL)
> 4102			xsk_buff_get_tail(xdp)->data_end -= shrink;
  4103		skb_frag_size_sub(frag, shrink);
  4104	}
  4105	
  4106	static bool shrink_data(struct xdp_buff *xdp, skb_frag_t *frag, int shrink)
  4107	{
  4108		struct xdp_mem_info *mem_info = &xdp->rxq->mem;
  4109	
  4110		if (skb_frag_size(frag) == shrink) {
  4111			struct page *page = skb_frag_page(frag);
  4112			struct xdp_buff *zc_frag = NULL;
  4113	
  4114			if (mem_info->type == MEM_TYPE_XSK_BUFF_POOL) {
> 4115				zc_frag = xsk_buff_get_tail(xdp);
  4116				xdp_buff_clear_frags_flag(zc_frag);
> 4117				xsk_buff_tail_del(zc_frag);
  4118			}
  4119	
  4120			__xdp_return(page_address(page), mem_info, false, zc_frag);
  4121			return true;
  4122		}
  4123		__shrink_data(xdp, mem_info, frag, shrink);
  4124		return false;
  4125	}
  4126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
