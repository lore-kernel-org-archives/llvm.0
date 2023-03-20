Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39E3A2D;
	Mon, 20 Mar 2023 00:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679273971; x=1710809971;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=smOBfRVqrOhWu8XvcIR133OdyNbI2Ln/Zggu1BX7YS8=;
  b=KobnnPzENf9oKRQHU0yNOJRZg5bXViY0V9BI9d2XoyNvQu3Amw57iJuZ
   LhZ0o20ouvc7FILHmdmC8V7hfbF8qJkLQtxm79PACghKHo2hTmTh9yN8w
   v6LxpBV8K9AbstCnWy2tkpP3sLgX4r5ukR9mdaMU5bPRoVsmmqoBgLm1P
   Xe+sb98V3DDzkQidd0KJPRgmxWKFNnhoOZk7Ael7t/TRpa/8R2rHt4ElD
   NuT6iMsMkVDf7StHLXYZDiZSeGIiOaayGiJYaUsBiaxH5NVffIpgrFSj1
   BdTgsn1RYTgEhkaSnNWQQgu9xMsR7pJydc6lBh0RvB/uyuf1hCJ3vi79Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="326921317"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="326921317"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 17:59:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="630939113"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="630939113"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 19 Mar 2023 17:59:26 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe3rw-000AjO-3C;
	Mon, 20 Mar 2023 00:59:24 +0000
Date: Mon, 20 Mar 2023 08:58:51 +0800
From: kernel test robot <lkp@intel.com>
To: Kal Conley <kal.conley@dectris.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, Kal Conley <kal.conley@dectris.com>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
Message-ID: <202303200837.DNorzOFV-lkp@intel.com>
References: <20230319195656.326701-2-kal.conley@dectris.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230319195656.326701-2-kal.conley@dectris.com>

Hi Kal,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on bpf/master]
[also build test ERROR on next-20230317]
[cannot apply to bpf-next/master linus/master v6.3-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kal-Conley/xsk-Support-UMEM-chunk_size-PAGE_SIZE/20230320-035849
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git master
patch link:    https://lore.kernel.org/r/20230319195656.326701-2-kal.conley%40dectris.com
patch subject: [PATCH bpf-next 1/3] xsk: Support UMEM chunk_size > PAGE_SIZE
config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20230320/202303200837.DNorzOFV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/bbcc35c4ff807754bf61ef2c1f11195533e53de0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kal-Conley/xsk-Support-UMEM-chunk_size-PAGE_SIZE/20230320-035849
        git checkout bbcc35c4ff807754bf61ef2c1f11195533e53de0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash net/core/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303200837.DNorzOFV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from net/core/xdp.c:22:
   In file included from include/net/xdp_sock_drv.h:10:
>> include/net/xsk_buff_pool.h:179:43: error: use of undeclared identifier 'HPAGE_SIZE'
           bool cross_pg = pool->hugetlb ? (addr & (HPAGE_SIZE - 1)) + len > HPAGE_SIZE :
                                                    ^
   include/net/xsk_buff_pool.h:179:68: error: use of undeclared identifier 'HPAGE_SIZE'
           bool cross_pg = pool->hugetlb ? (addr & (HPAGE_SIZE - 1)) + len > HPAGE_SIZE :
                                                                             ^
   2 errors generated.


vim +/HPAGE_SIZE +179 include/net/xsk_buff_pool.h

   175	
   176	static inline bool xp_desc_crosses_non_contig_pg(struct xsk_buff_pool *pool,
   177							 u64 addr, u32 len)
   178	{
 > 179		bool cross_pg = pool->hugetlb ? (addr & (HPAGE_SIZE - 1)) + len > HPAGE_SIZE :
   180						(addr & (PAGE_SIZE - 1)) + len > PAGE_SIZE;
   181	
   182		if (likely(!cross_pg))
   183			return false;
   184	
   185		if (pool->dma_pages_cnt) {
   186			return !(pool->dma_pages[addr >> PAGE_SHIFT] &
   187				 XSK_NEXT_PG_CONTIG_MASK);
   188		}
   189	
   190		/* skb path */
   191		return addr + len > pool->addrs_cnt;
   192	}
   193	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
