Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4D263D2;
	Wed, 29 Mar 2023 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680113167; x=1711649167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jr9163mIYLr43Hz173UujeUSVNHaW9LuoyVpqERQQmQ=;
  b=UrLCrcIbhLEOl0a/FKwYckoRfSSoADgHnXQo5T0QeNErKnFnlzdtsOa+
   gVd8Y/YF1rcsMh6zBjmtj8ZsUMvYJm73oTKGDdKiQ/JBwyFVwWd05HpB2
   jlQOpNzoDRPBumjeyc8lfILddHZ22ZKqFfZlRR3OCpwWhFfbQzuFtHUW1
   mJ2/WlfGzyqShWji+Hy2TfLNo/ih1oFN4ArX4yeuls39N+ZfsPs14jR98
   GaysYohJ6rtaqkswHoAhKtucv+Asdn6ZHH7u/EwDuaaLS9lJ5XGQpeU+9
   T09a3J/aBDCEOIMNOSQlsD2ZoMNJpD29mnx5Yavy9wjARCy4SdpmtjXTX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="329440986"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="329440986"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 11:06:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="716996448"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="716996448"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 29 Mar 2023 11:06:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phaBR-000JnI-02;
	Wed, 29 Mar 2023 18:06:05 +0000
Date: Thu, 30 Mar 2023 02:05:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-sendpage 34/63] net/unix/af_unix.c:2167:8: warning:
 comparison of distinct pointer types ('typeof ((65536 / ((1UL) << 12) + 1) -
 ((struct skb_shared_info *)(skb_end_pointer(skb)))->nr_frags) *' (aka
 'unsigned long *') and 'typeof ((sizeof (pages) / sizeof ((pages)[0]) + ...
Message-ID: <202303300201.5l0cGzbT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-sendpage
head:   39e48c1301bf2fb60a53912fe5870a253256debc
commit: 4a6e526581d08d0f21ab309a13c8a17af267c5c3 [34/63] af_unix: Support MSG_SPLICE_PAGES
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20230330/202303300201.5l0cGzbT-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/commit/?id=4a6e526581d08d0f21ab309a13c8a17af267c5c3
        git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
        git fetch --no-tags dhowells-fs iov-sendpage
        git checkout 4a6e526581d08d0f21ab309a13c8a17af267c5c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/kcm/ net/unix/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300201.5l0cGzbT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/unix/af_unix.c:2167:8: warning: comparison of distinct pointer types ('typeof ((65536 / ((1UL) << 12) + 1) - ((struct skb_shared_info *)(skb_end_pointer(skb)))->nr_frags) *' (aka 'unsigned long *') and 'typeof ((sizeof (pages) / sizeof ((pages)[0]) + ((int)(sizeof(struct (unnamed struct at net/unix/af_unix.c:2167:8)))))) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
                   nr = min(MAX_SKB_FRAGS - skb_shinfo(skb)->nr_frags,
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
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
>> net/unix/af_unix.c:2181:18: warning: comparison of distinct pointer types ('typeof (((1UL) << 12) - off) *' (aka 'unsigned long *') and 'typeof (len) *' (aka 'unsigned int *')) [-Wcompare-distinct-pointer-types]
                           size_t part = min(PAGE_SIZE - off, len);
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:67:19: note: expanded from macro 'min'
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


vim +2167 net/unix/af_unix.c

  2153	
  2154	/*
  2155	 * Extract pages from an iterator and add them to the socket buffer.
  2156	 */
  2157	static ssize_t unix_extract_bvec_to_skb(struct sk_buff *skb,
  2158						struct iov_iter *iter, ssize_t maxsize)
  2159	{
  2160		struct page *pages[8], **ppages = pages;
  2161		unsigned int i, nr;
  2162		ssize_t ret = 0;
  2163	
  2164		while (iter->count > 0) {
  2165			size_t off, len;
  2166	
> 2167			nr = min(MAX_SKB_FRAGS - skb_shinfo(skb)->nr_frags,
  2168				 ARRAY_SIZE(pages));
  2169			if (nr == 0)
  2170				break;
  2171	
  2172			len = iov_iter_extract_pages(iter, &ppages, maxsize, nr, 0, &off);
  2173			if (len <= 0) {
  2174				if (!ret)
  2175					ret = len ?: -EIO;
  2176				break;
  2177			}
  2178	
  2179			i = 0;
  2180			do {
> 2181				size_t part = min(PAGE_SIZE - off, len);
  2182	
  2183				if (skb_append_pagefrags(skb, pages[i++], off, part) < 0) {
  2184					if (!ret)
  2185						ret = -EMSGSIZE;
  2186					goto out;
  2187				}
  2188				off = 0;
  2189				ret += part;
  2190				maxsize -= part;
  2191				len -= part;
  2192			} while (len > 0);
  2193			if (maxsize <= 0)
  2194				break;
  2195		}
  2196	
  2197	out:
  2198		return ret;
  2199	}
  2200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
