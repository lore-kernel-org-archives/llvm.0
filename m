Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25AEA68
	for <llvm@lists.linux.dev>; Tue, 14 Dec 2021 17:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639503918; x=1671039918;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F3HoPhFHGctdT/s7T7t7qJo6l9axdFPUmqG0h0u3N2c=;
  b=mFYeIsL/fh3ZeiMZIEs0Dwty6rHfnxhY+nMYzGgU7kwFWKvRjOLRGkM8
   YFy3qYeZBKNpq9yML8YfmSYPAIa5rGp0s4kvqzrp1FANebYcO9YbOiCp8
   QDj5GBgn7slot/yqit25FFFvOxTkF3STJNa9f9oOTw2tb7gjRKczgkKv+
   Xw7coEmwHuhwzHZ6xn5Mlceq0BOpjWyekEZeNwHAwazRssoycrzYzXVoU
   W5r4mRkhn+qN97BeuzqHVUfrooBE72DN84dezQXSEqyGRzZkGTGvai7V5
   70dyVvWjLDULCpDWrKDCfAUZTQ4KMuliP/SFFhxp9KV0gbWeBLXmelcb5
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219052052"
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="219052052"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2021 09:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,205,1635231600"; 
   d="scan'208";a="463882598"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2021 09:45:15 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mxBrW-0000a2-KM; Tue, 14 Dec 2021 17:45:14 +0000
Date: Wed, 15 Dec 2021 01:44:16 +0800
From: kernel test robot <lkp@intel.com>
To: cgel.zte@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] pktgen: use min() to make code cleaner
Message-ID: <202112150130.jdr5Ps5z-lkp@intel.com>
References: <20211214114447.439632-1-deng.changcheng@zte.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211214114447.439632-1-deng.changcheng@zte.com.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]
[also build test WARNING on net/master horms-ipvs/master linus/master v5.16-rc5 next-20211213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/cgel-zte-gmail-com/pktgen-use-min-to-make-code-cleaner/20211214-194646
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git a3c62a042237d1adeb0290dcb768e17edd6dcd25
config: x86_64-randconfig-r016-20211214 (https://download.01.org/0day-ci/archive/20211215/202112150130.jdr5Ps5z-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/7cc9aa88278e63d75ce0af120e4b6992bff00e7e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review cgel-zte-gmail-com/pktgen-use-min-to-make-code-cleaner/20211214-194646
        git checkout 7cc9aa88278e63d75ce0af120e4b6992bff00e7e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/power/supply/ net/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/core/pktgen.c:2781:14: warning: comparison of distinct pointer types ('typeof (datalen / frags) *' (aka 'int *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                   frag_len = min(datalen / frags, PAGE_SIZE);
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
>> net/core/pktgen.c:2798:9: warning: comparison of distinct pointer types ('typeof (datalen) *' (aka 'int *') and 'typeof (((1UL) << 12)) *' (aka 'unsigned long *')) [-Wcompare-distinct-pointer-types]
                                       min(datalen, PAGE_SIZE));
                                       ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:19: note: expanded from macro 'min'
   #define min(x, y)       __careful_cmp(x, y, <)
                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:36:24: note: expanded from macro '__careful_cmp'
           __builtin_choose_expr(__safe_cmp(x, y), \
                                 ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:26:4: note: expanded from macro '__safe_cmp'
                   (__typecheck(x, y) && __no_side_effects(x, y))
                    ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:20:28: note: expanded from macro '__typecheck'
           (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                      ~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~
   2 warnings generated.


vim +2781 net/core/pktgen.c

  2754	
  2755	static void pktgen_finalize_skb(struct pktgen_dev *pkt_dev, struct sk_buff *skb,
  2756					int datalen)
  2757	{
  2758		struct timespec64 timestamp;
  2759		struct pktgen_hdr *pgh;
  2760	
  2761		pgh = skb_put(skb, sizeof(*pgh));
  2762		datalen -= sizeof(*pgh);
  2763	
  2764		if (pkt_dev->nfrags <= 0) {
  2765			skb_put_zero(skb, datalen);
  2766		} else {
  2767			int frags = pkt_dev->nfrags;
  2768			int i, len;
  2769			int frag_len;
  2770	
  2771	
  2772			if (frags > MAX_SKB_FRAGS)
  2773				frags = MAX_SKB_FRAGS;
  2774			len = datalen - frags * PAGE_SIZE;
  2775			if (len > 0) {
  2776				skb_put_zero(skb, len);
  2777				datalen = frags * PAGE_SIZE;
  2778			}
  2779	
  2780			i = 0;
> 2781			frag_len = min(datalen / frags, PAGE_SIZE);
  2782			while (datalen > 0) {
  2783				if (unlikely(!pkt_dev->page)) {
  2784					int node = numa_node_id();
  2785	
  2786					if (pkt_dev->node >= 0 && (pkt_dev->flags & F_NODE))
  2787						node = pkt_dev->node;
  2788					pkt_dev->page = alloc_pages_node(node, GFP_KERNEL | __GFP_ZERO, 0);
  2789					if (!pkt_dev->page)
  2790						break;
  2791				}
  2792				get_page(pkt_dev->page);
  2793				skb_frag_set_page(skb, i, pkt_dev->page);
  2794				skb_frag_off_set(&skb_shinfo(skb)->frags[i], 0);
  2795				/*last fragment, fill rest of data*/
  2796				if (i == (frags - 1))
  2797					skb_frag_size_set(&skb_shinfo(skb)->frags[i],
> 2798					    min(datalen, PAGE_SIZE));
  2799				else
  2800					skb_frag_size_set(&skb_shinfo(skb)->frags[i], frag_len);
  2801				datalen -= skb_frag_size(&skb_shinfo(skb)->frags[i]);
  2802				skb->len += skb_frag_size(&skb_shinfo(skb)->frags[i]);
  2803				skb->data_len += skb_frag_size(&skb_shinfo(skb)->frags[i]);
  2804				i++;
  2805				skb_shinfo(skb)->nr_frags = i;
  2806			}
  2807		}
  2808	
  2809		/* Stamp the time, and sequence number,
  2810		 * convert them to network byte order
  2811		 */
  2812		pgh->pgh_magic = htonl(PKTGEN_MAGIC);
  2813		pgh->seq_num = htonl(pkt_dev->seq_num);
  2814	
  2815		if (pkt_dev->flags & F_NO_TIMESTAMP) {
  2816			pgh->tv_sec = 0;
  2817			pgh->tv_usec = 0;
  2818		} else {
  2819			/*
  2820			 * pgh->tv_sec wraps in y2106 when interpreted as unsigned
  2821			 * as done by wireshark, or y2038 when interpreted as signed.
  2822			 * This is probably harmless, but if anyone wants to improve
  2823			 * it, we could introduce a variant that puts 64-bit nanoseconds
  2824			 * into the respective header bytes.
  2825			 * This would also be slightly faster to read.
  2826			 */
  2827			ktime_get_real_ts64(&timestamp);
  2828			pgh->tv_sec = htonl(timestamp.tv_sec);
  2829			pgh->tv_usec = htonl(timestamp.tv_nsec / NSEC_PER_USEC);
  2830		}
  2831	}
  2832	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
