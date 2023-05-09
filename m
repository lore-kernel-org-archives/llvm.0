Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5E07C;
	Tue,  9 May 2023 00:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683593810; x=1715129810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CHRDmATNd+cu84KOlpSXxhq/BfDuEfYk+bHHjHOCmQU=;
  b=nJfX08F3YEM8hBd5Fyr+HKYpxT5dxGPj0zijww1Hs211iazrI+c7I0I7
   ty64qSXdtOkjKCB4w9rFeGvkN+chDH31OIaYsRGQvqUiHzmuoQS0nYuR+
   a2dVo5RinJU3iHi0CSFiXsjunejQAsWemFHBokBZr8pm30AIxvQtUQ9w0
   gZ5tu8jR5mYMFxV/fWPt1Yuf7PSOqlXNoryga4eibFFBEaoyUB8xsZy1V
   p9BSf0AdfTBbDXDdfugSZDaHYGRGi41goGcYzX2H/+PfGY87GleDqwFmy
   cbKw3UIEcwRfuJKjUeBBHQFNv7fp2IDV2oY44DjUwBqxSZ/yO5ychjlmu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="334232046"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="334232046"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 17:56:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649082806"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; 
   d="scan'208";a="649082806"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 May 2023 17:56:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwBeo-0001Vs-1l;
	Tue, 09 May 2023 00:56:46 +0000
Date: Tue, 9 May 2023 08:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] net: remove __skb_frag_set_page()
Message-ID: <202305090842.2IQADg4N-lkp@intel.com>
References: <20230508123922.39284-3-linyunsheng@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508123922.39284-3-linyunsheng@huawei.com>

Hi Yunsheng,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]
[also build test WARNING on net-next/main linus/master v6.4-rc1 next-20230508]
[cannot apply to horms-ipvs/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yunsheng-Lin/net-introduce-and-use-skb_frag_fill_page_desc/20230508-204326
base:   net/main
patch link:    https://lore.kernel.org/r/20230508123922.39284-3-linyunsheng%40huawei.com
patch subject: [PATCH RFC 2/2] net: remove __skb_frag_set_page()
config: x86_64-randconfig-a004-20230508 (https://download.01.org/0day-ci/archive/20230509/202305090842.2IQADg4N-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/999d6693757a196e863558b6d7663425165a7acb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Yunsheng-Lin/net-introduce-and-use-skb_frag_fill_page_desc/20230508-204326
        git checkout 999d6693757a196e863558b6d7663425165a7acb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/ethernet/broadcom/bnxt/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305090842.2IQADg4N-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:1105:17: warning: variable 'nr_frags' set but not used [-Wunused-but-set-variable]
                           unsigned int nr_frags;
                                        ^
   1 warning generated.


vim +/nr_frags +1105 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d8409 Michael Chan    2015-10-22  1054  
23e4c0469ad03f Andy Gospodarek 2022-04-08  1055  static u32 __bnxt_rx_agg_pages(struct bnxt *bp,
e44758b78ae814 Michael Chan    2018-10-14  1056  			       struct bnxt_cp_ring_info *cpr,
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1057  			       struct skb_shared_info *shinfo,
31b9998bf225ec Andy Gospodarek 2022-04-08  1058  			       u16 idx, u32 agg_bufs, bool tpa,
31b9998bf225ec Andy Gospodarek 2022-04-08  1059  			       struct xdp_buff *xdp)
c0c050c58d8409 Michael Chan    2015-10-22  1060  {
e44758b78ae814 Michael Chan    2018-10-14  1061  	struct bnxt_napi *bnapi = cpr->bnapi;
c0c050c58d8409 Michael Chan    2015-10-22  1062  	struct pci_dev *pdev = bp->pdev;
b6ab4b01f53b5f Michael Chan    2016-01-02  1063  	struct bnxt_rx_ring_info *rxr = bnapi->rx_ring;
c0c050c58d8409 Michael Chan    2015-10-22  1064  	u16 prod = rxr->rx_agg_prod;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1065  	u32 i, total_frag_len = 0;
bfcd8d791ec184 Michael Chan    2019-07-29  1066  	bool p5_tpa = false;
c0c050c58d8409 Michael Chan    2015-10-22  1067  
bfcd8d791ec184 Michael Chan    2019-07-29  1068  	if ((bp->flags & BNXT_FLAG_CHIP_P5) && tpa)
bfcd8d791ec184 Michael Chan    2019-07-29  1069  		p5_tpa = true;
bfcd8d791ec184 Michael Chan    2019-07-29  1070  
c0c050c58d8409 Michael Chan    2015-10-22  1071  	for (i = 0; i < agg_bufs; i++) {
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1072  		skb_frag_t *frag = &shinfo->frags[i];
c0c050c58d8409 Michael Chan    2015-10-22  1073  		u16 cons, frag_len;
c0c050c58d8409 Michael Chan    2015-10-22  1074  		struct rx_agg_cmp *agg;
c0c050c58d8409 Michael Chan    2015-10-22  1075  		struct bnxt_sw_rx_agg_bd *cons_rx_buf;
c0c050c58d8409 Michael Chan    2015-10-22  1076  		struct page *page;
c0c050c58d8409 Michael Chan    2015-10-22  1077  		dma_addr_t mapping;
c0c050c58d8409 Michael Chan    2015-10-22  1078  
bfcd8d791ec184 Michael Chan    2019-07-29  1079  		if (p5_tpa)
bfcd8d791ec184 Michael Chan    2019-07-29  1080  			agg = bnxt_get_tpa_agg_p5(bp, rxr, idx, i);
bfcd8d791ec184 Michael Chan    2019-07-29  1081  		else
4a228a3a5e58e5 Michael Chan    2019-07-29  1082  			agg = bnxt_get_agg(bp, cpr, idx, i);
c0c050c58d8409 Michael Chan    2015-10-22  1083  		cons = agg->rx_agg_cmp_opaque;
c0c050c58d8409 Michael Chan    2015-10-22  1084  		frag_len = (le32_to_cpu(agg->rx_agg_cmp_len_flags_type) &
c0c050c58d8409 Michael Chan    2015-10-22  1085  			    RX_AGG_CMP_LEN) >> RX_AGG_CMP_LEN_SHIFT;
c0c050c58d8409 Michael Chan    2015-10-22  1086  
c0c050c58d8409 Michael Chan    2015-10-22  1087  		cons_rx_buf = &rxr->rx_agg_ring[cons];
9501ff8f37986d Yunsheng Lin    2023-05-08  1088  		skb_frag_fill_page_desc(frag, cons_rx_buf->page,
9501ff8f37986d Yunsheng Lin    2023-05-08  1089  					cons_rx_buf->offset, frag_len);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1090  		shinfo->nr_frags = i + 1;
c0c050c58d8409 Michael Chan    2015-10-22  1091  		__clear_bit(cons, rxr->rx_agg_bmap);
c0c050c58d8409 Michael Chan    2015-10-22  1092  
c0c050c58d8409 Michael Chan    2015-10-22  1093  		/* It is possible for bnxt_alloc_rx_page() to allocate
c0c050c58d8409 Michael Chan    2015-10-22  1094  		 * a sw_prod index that equals the cons index, so we
c0c050c58d8409 Michael Chan    2015-10-22  1095  		 * need to clear the cons entry now.
c0c050c58d8409 Michael Chan    2015-10-22  1096  		 */
11cd119d31a71b Michael Chan    2017-02-06  1097  		mapping = cons_rx_buf->mapping;
c0c050c58d8409 Michael Chan    2015-10-22  1098  		page = cons_rx_buf->page;
c0c050c58d8409 Michael Chan    2015-10-22  1099  		cons_rx_buf->page = NULL;
c0c050c58d8409 Michael Chan    2015-10-22  1100  
31b9998bf225ec Andy Gospodarek 2022-04-08  1101  		if (xdp && page_is_pfmemalloc(page))
31b9998bf225ec Andy Gospodarek 2022-04-08  1102  			xdp_buff_set_frag_pfmemalloc(xdp);
31b9998bf225ec Andy Gospodarek 2022-04-08  1103  
c0c050c58d8409 Michael Chan    2015-10-22  1104  		if (bnxt_alloc_rx_page(bp, rxr, prod, GFP_ATOMIC) != 0) {
c0c050c58d8409 Michael Chan    2015-10-22 @1105  			unsigned int nr_frags;
c0c050c58d8409 Michael Chan    2015-10-22  1106  
c0c050c58d8409 Michael Chan    2015-10-22  1107  			nr_frags = --shinfo->nr_frags;
c0c050c58d8409 Michael Chan    2015-10-22  1108  			cons_rx_buf->page = page;
c0c050c58d8409 Michael Chan    2015-10-22  1109  
c0c050c58d8409 Michael Chan    2015-10-22  1110  			/* Update prod since possibly some pages have been
c0c050c58d8409 Michael Chan    2015-10-22  1111  			 * allocated already.
c0c050c58d8409 Michael Chan    2015-10-22  1112  			 */
c0c050c58d8409 Michael Chan    2015-10-22  1113  			rxr->rx_agg_prod = prod;
4a228a3a5e58e5 Michael Chan    2019-07-29  1114  			bnxt_reuse_rx_agg_bufs(cpr, idx, i, agg_bufs - i, tpa);
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1115  			return 0;
c0c050c58d8409 Michael Chan    2015-10-22  1116  		}
c0c050c58d8409 Michael Chan    2015-10-22  1117  
c519fe9a4f0d1a Shannon Nelson  2017-05-09  1118  		dma_unmap_page_attrs(&pdev->dev, mapping, BNXT_RX_PAGE_SIZE,
9a6aa350488533 Andy Gospodarek 2022-04-08  1119  				     bp->rx_dir,
c519fe9a4f0d1a Shannon Nelson  2017-05-09  1120  				     DMA_ATTR_WEAK_ORDERING);
c0c050c58d8409 Michael Chan    2015-10-22  1121  
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1122  		total_frag_len += frag_len;
c0c050c58d8409 Michael Chan    2015-10-22  1123  		prod = NEXT_RX_AGG(prod);
c0c050c58d8409 Michael Chan    2015-10-22  1124  	}
c0c050c58d8409 Michael Chan    2015-10-22  1125  	rxr->rx_agg_prod = prod;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1126  	return total_frag_len;
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1127  }
ca1df2dd8e2f2c Andy Gospodarek 2022-04-08  1128  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
