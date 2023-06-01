Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5ED17751;
	Thu,  1 Jun 2023 06:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685601012; x=1717137012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZg8RPEJ5qn+RKcW3Lm491+aEilrKkbVrnLJhkNg+ts=;
  b=W4pKcyrOiSbfD903Mdz1YuH9j9XP0yAQLGbTNTpEVPGvBihq8Ky9+QoQ
   0Tj6dA0BXamdrx8U79ZMHE+H0+IEmTmu9NHX6xwHuJVd/OD/73Wg/JX/R
   1pmuGb5qjlWnFUvH3PWtdMCwiP9HddgJxjavc6rEq9pUdhTuFrdvwZfUl
   9i8dwotKEYa6AGrwZPUSKIt9l+iggkwAcfPR5Zsazfb9moUKrlodKyrCn
   VlWZoPErN6i2vJfwOVn07ep/mjdPPbPzsRLz/Gtm4E3VmfSCw0U+g/61b
   QJ8Vb2ZGaEvuh7YNW8kPL/SAmgh6wv/9Qm4EzdjCQTGXZ60YAAU4BjpHW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="357866740"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="357866740"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 23:30:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="710355672"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="710355672"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 31 May 2023 23:30:07 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4bp0-00020J-2e;
	Thu, 01 Jun 2023 06:30:06 +0000
Date: Thu, 1 Jun 2023 14:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 5938/6538] mm/zswap.c:1183:6: warning: variable
 'ret' is used uninitialized whenever 'if' condition is true
Message-ID: <202306011435.2BxsHFUE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   571d71e886a5edc89b4ea6d0fe6f445282938320
commit: be23cb8e7a96c4ae97a35cd99f993e98d9bd66a5 [5938/6538] zswap: do not shrink if cgroup may not zswap
config: hexagon-randconfig-r045-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011435.2BxsHFUE-lkp@intel.com/config)
compiler: clang version 15.0.4 (https://github.com/llvm/llvm-project 5c68a1cb123161b54b72ce90e7975d95a8eaf2a4)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=be23cb8e7a96c4ae97a35cd99f993e98d9bd66a5
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout be23cb8e7a96c4ae97a35cd99f993e98d9bd66a5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011435.2BxsHFUE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zswap.c:18:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from mm/zswap.c:18:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from mm/zswap.c:18:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> mm/zswap.c:1183:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (objcg && !obj_cgroup_may_zswap(objcg))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:1327:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   mm/zswap.c:1183:2: note: remove the 'if' if its condition is always false
           if (objcg && !obj_cgroup_may_zswap(objcg))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/zswap.c:1158:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   7 warnings generated.


vim +1183 mm/zswap.c

a85f878b443f8d Srividya Desireddy  2018-01-31  1144  
2b2811178e8555 Seth Jennings       2013-07-10  1145  /*********************************
2b2811178e8555 Seth Jennings       2013-07-10  1146  * frontswap hooks
2b2811178e8555 Seth Jennings       2013-07-10  1147  **********************************/
2b2811178e8555 Seth Jennings       2013-07-10  1148  /* attempts to compress and store an single page */
2b2811178e8555 Seth Jennings       2013-07-10  1149  static int zswap_frontswap_store(unsigned type, pgoff_t offset,
2b2811178e8555 Seth Jennings       2013-07-10  1150  				struct page *page)
2b2811178e8555 Seth Jennings       2013-07-10  1151  {
2b2811178e8555 Seth Jennings       2013-07-10  1152  	struct zswap_tree *tree = zswap_trees[type];
2b2811178e8555 Seth Jennings       2013-07-10  1153  	struct zswap_entry *entry, *dupentry;
1ec3b5fe6eec78 Barry Song          2020-12-14  1154  	struct scatterlist input, output;
1ec3b5fe6eec78 Barry Song          2020-12-14  1155  	struct crypto_acomp_ctx *acomp_ctx;
f4840ccfca25db Johannes Weiner     2022-05-19  1156  	struct obj_cgroup *objcg = NULL;
f4840ccfca25db Johannes Weiner     2022-05-19  1157  	struct zswap_pool *pool;
2b2811178e8555 Seth Jennings       2013-07-10  1158  	int ret;
9c3760eb80880f Yu Zhao             2018-01-31  1159  	unsigned int hlen, dlen = PAGE_SIZE;
a85f878b443f8d Srividya Desireddy  2018-01-31  1160  	unsigned long handle, value;
2b2811178e8555 Seth Jennings       2013-07-10  1161  	char *buf;
2b2811178e8555 Seth Jennings       2013-07-10  1162  	u8 *src, *dst;
9c3760eb80880f Yu Zhao             2018-01-31  1163  	struct zswap_header zhdr = { .swpentry = swp_entry(type, offset) };
d2fcd82bb83aab Hui Zhu             2019-09-23  1164  	gfp_t gfp;
2b2811178e8555 Seth Jennings       2013-07-10  1165  
7ba716698cc53f Huang Ying          2018-02-21  1166  	/* THP isn't supported */
7ba716698cc53f Huang Ying          2018-02-21  1167  	if (PageTransHuge(page)) {
7ba716698cc53f Huang Ying          2018-02-21  1168  		ret = -EINVAL;
7ba716698cc53f Huang Ying          2018-02-21  1169  		goto reject;
7ba716698cc53f Huang Ying          2018-02-21  1170  	}
7ba716698cc53f Huang Ying          2018-02-21  1171  
c00ed16a9eb98a Dan Streetman       2015-06-25  1172  	if (!zswap_enabled || !tree) {
2b2811178e8555 Seth Jennings       2013-07-10  1173  		ret = -ENODEV;
2b2811178e8555 Seth Jennings       2013-07-10  1174  		goto reject;
2b2811178e8555 Seth Jennings       2013-07-10  1175  	}
2b2811178e8555 Seth Jennings       2013-07-10  1176  
be23cb8e7a96c4 Nhat Pham           2023-05-30  1177  	/*
be23cb8e7a96c4 Nhat Pham           2023-05-30  1178  	 * XXX: zswap reclaim does not work with cgroups yet. Without a
be23cb8e7a96c4 Nhat Pham           2023-05-30  1179  	 * cgroup-aware entry LRU, we will push out entries system-wide based on
be23cb8e7a96c4 Nhat Pham           2023-05-30  1180  	 * local cgroup limits.
be23cb8e7a96c4 Nhat Pham           2023-05-30  1181  	 */
f4840ccfca25db Johannes Weiner     2022-05-19  1182  	objcg = get_obj_cgroup_from_page(page);
f4840ccfca25db Johannes Weiner     2022-05-19 @1183  	if (objcg && !obj_cgroup_may_zswap(objcg))
be23cb8e7a96c4 Nhat Pham           2023-05-30  1184  		goto reject;
f4840ccfca25db Johannes Weiner     2022-05-19  1185  
2b2811178e8555 Seth Jennings       2013-07-10  1186  	/* reclaim space if needed */
2b2811178e8555 Seth Jennings       2013-07-10  1187  	if (zswap_is_full()) {
2b2811178e8555 Seth Jennings       2013-07-10  1188  		zswap_pool_limit_hit++;
45190f01dd4021 Vitaly Wool         2020-01-30  1189  		zswap_pool_reached_full = true;
f4840ccfca25db Johannes Weiner     2022-05-19  1190  		goto shrink;
2b2811178e8555 Seth Jennings       2013-07-10  1191  	}
16e536ef47f567 Li Wang             2018-07-26  1192  
45190f01dd4021 Vitaly Wool         2020-01-30  1193  	if (zswap_pool_reached_full) {
45190f01dd4021 Vitaly Wool         2020-01-30  1194  	       if (!zswap_can_accept()) {
16e536ef47f567 Li Wang             2018-07-26  1195  			ret = -ENOMEM;
16e536ef47f567 Li Wang             2018-07-26  1196  			goto reject;
45190f01dd4021 Vitaly Wool         2020-01-30  1197  		} else
45190f01dd4021 Vitaly Wool         2020-01-30  1198  			zswap_pool_reached_full = false;
2b2811178e8555 Seth Jennings       2013-07-10  1199  	}
2b2811178e8555 Seth Jennings       2013-07-10  1200  
2b2811178e8555 Seth Jennings       2013-07-10  1201  	/* allocate entry */
2b2811178e8555 Seth Jennings       2013-07-10  1202  	entry = zswap_entry_cache_alloc(GFP_KERNEL);
2b2811178e8555 Seth Jennings       2013-07-10  1203  	if (!entry) {
2b2811178e8555 Seth Jennings       2013-07-10  1204  		zswap_reject_kmemcache_fail++;
2b2811178e8555 Seth Jennings       2013-07-10  1205  		ret = -ENOMEM;
2b2811178e8555 Seth Jennings       2013-07-10  1206  		goto reject;
2b2811178e8555 Seth Jennings       2013-07-10  1207  	}
2b2811178e8555 Seth Jennings       2013-07-10  1208  
a85f878b443f8d Srividya Desireddy  2018-01-31  1209  	if (zswap_same_filled_pages_enabled) {
a85f878b443f8d Srividya Desireddy  2018-01-31  1210  		src = kmap_atomic(page);
a85f878b443f8d Srividya Desireddy  2018-01-31  1211  		if (zswap_is_page_same_filled(src, &value)) {
a85f878b443f8d Srividya Desireddy  2018-01-31  1212  			kunmap_atomic(src);
a85f878b443f8d Srividya Desireddy  2018-01-31  1213  			entry->offset = offset;
a85f878b443f8d Srividya Desireddy  2018-01-31  1214  			entry->length = 0;
a85f878b443f8d Srividya Desireddy  2018-01-31  1215  			entry->value = value;
a85f878b443f8d Srividya Desireddy  2018-01-31  1216  			atomic_inc(&zswap_same_filled_pages);
a85f878b443f8d Srividya Desireddy  2018-01-31  1217  			goto insert_entry;
a85f878b443f8d Srividya Desireddy  2018-01-31  1218  		}
a85f878b443f8d Srividya Desireddy  2018-01-31  1219  		kunmap_atomic(src);
a85f878b443f8d Srividya Desireddy  2018-01-31  1220  	}
a85f878b443f8d Srividya Desireddy  2018-01-31  1221  
cb325ddde56162 Maciej S. Szmigiero 2022-03-22  1222  	if (!zswap_non_same_filled_pages_enabled) {
cb325ddde56162 Maciej S. Szmigiero 2022-03-22  1223  		ret = -EINVAL;
cb325ddde56162 Maciej S. Szmigiero 2022-03-22  1224  		goto freepage;
cb325ddde56162 Maciej S. Szmigiero 2022-03-22  1225  	}
cb325ddde56162 Maciej S. Szmigiero 2022-03-22  1226  
f1c54846ee4504 Dan Streetman       2015-09-09  1227  	/* if entry is successfully added, it keeps the reference */
f1c54846ee4504 Dan Streetman       2015-09-09  1228  	entry->pool = zswap_pool_current_get();
f1c54846ee4504 Dan Streetman       2015-09-09  1229  	if (!entry->pool) {
f1c54846ee4504 Dan Streetman       2015-09-09  1230  		ret = -EINVAL;
f1c54846ee4504 Dan Streetman       2015-09-09  1231  		goto freepage;
f1c54846ee4504 Dan Streetman       2015-09-09  1232  	}
f1c54846ee4504 Dan Streetman       2015-09-09  1233  
2b2811178e8555 Seth Jennings       2013-07-10  1234  	/* compress */
1ec3b5fe6eec78 Barry Song          2020-12-14  1235  	acomp_ctx = raw_cpu_ptr(entry->pool->acomp_ctx);
1ec3b5fe6eec78 Barry Song          2020-12-14  1236  
1ec3b5fe6eec78 Barry Song          2020-12-14  1237  	mutex_lock(acomp_ctx->mutex);
1ec3b5fe6eec78 Barry Song          2020-12-14  1238  
1ec3b5fe6eec78 Barry Song          2020-12-14  1239  	dst = acomp_ctx->dstmem;
1ec3b5fe6eec78 Barry Song          2020-12-14  1240  	sg_init_table(&input, 1);
1ec3b5fe6eec78 Barry Song          2020-12-14  1241  	sg_set_page(&input, page, PAGE_SIZE, 0);
1ec3b5fe6eec78 Barry Song          2020-12-14  1242  
1ec3b5fe6eec78 Barry Song          2020-12-14  1243  	/* zswap_dstmem is of size (PAGE_SIZE * 2). Reflect same in sg_list */
1ec3b5fe6eec78 Barry Song          2020-12-14  1244  	sg_init_one(&output, dst, PAGE_SIZE * 2);
1ec3b5fe6eec78 Barry Song          2020-12-14  1245  	acomp_request_set_params(acomp_ctx->req, &input, &output, PAGE_SIZE, dlen);
1ec3b5fe6eec78 Barry Song          2020-12-14  1246  	/*
1ec3b5fe6eec78 Barry Song          2020-12-14  1247  	 * it maybe looks a little bit silly that we send an asynchronous request,
1ec3b5fe6eec78 Barry Song          2020-12-14  1248  	 * then wait for its completion synchronously. This makes the process look
1ec3b5fe6eec78 Barry Song          2020-12-14  1249  	 * synchronous in fact.
1ec3b5fe6eec78 Barry Song          2020-12-14  1250  	 * Theoretically, acomp supports users send multiple acomp requests in one
1ec3b5fe6eec78 Barry Song          2020-12-14  1251  	 * acomp instance, then get those requests done simultaneously. but in this
1ec3b5fe6eec78 Barry Song          2020-12-14  1252  	 * case, frontswap actually does store and load page by page, there is no
1ec3b5fe6eec78 Barry Song          2020-12-14  1253  	 * existing method to send the second page before the first page is done
1ec3b5fe6eec78 Barry Song          2020-12-14  1254  	 * in one thread doing frontswap.
1ec3b5fe6eec78 Barry Song          2020-12-14  1255  	 * but in different threads running on different cpu, we have different
1ec3b5fe6eec78 Barry Song          2020-12-14  1256  	 * acomp instance, so multiple threads can do (de)compression in parallel.
1ec3b5fe6eec78 Barry Song          2020-12-14  1257  	 */
1ec3b5fe6eec78 Barry Song          2020-12-14  1258  	ret = crypto_wait_req(crypto_acomp_compress(acomp_ctx->req), &acomp_ctx->wait);
1ec3b5fe6eec78 Barry Song          2020-12-14  1259  	dlen = acomp_ctx->req->dlen;
1ec3b5fe6eec78 Barry Song          2020-12-14  1260  
2b2811178e8555 Seth Jennings       2013-07-10  1261  	if (ret) {
2b2811178e8555 Seth Jennings       2013-07-10  1262  		ret = -EINVAL;
f1c54846ee4504 Dan Streetman       2015-09-09  1263  		goto put_dstmem;
2b2811178e8555 Seth Jennings       2013-07-10  1264  	}
2b2811178e8555 Seth Jennings       2013-07-10  1265  
2b2811178e8555 Seth Jennings       2013-07-10  1266  	/* store */
9c3760eb80880f Yu Zhao             2018-01-31  1267  	hlen = zpool_evictable(entry->pool->zpool) ? sizeof(zhdr) : 0;
d2fcd82bb83aab Hui Zhu             2019-09-23  1268  	gfp = __GFP_NORETRY | __GFP_NOWARN | __GFP_KSWAPD_RECLAIM;
d2fcd82bb83aab Hui Zhu             2019-09-23  1269  	if (zpool_malloc_support_movable(entry->pool->zpool))
d2fcd82bb83aab Hui Zhu             2019-09-23  1270  		gfp |= __GFP_HIGHMEM | __GFP_MOVABLE;
d2fcd82bb83aab Hui Zhu             2019-09-23  1271  	ret = zpool_malloc(entry->pool->zpool, hlen + dlen, gfp, &handle);
2b2811178e8555 Seth Jennings       2013-07-10  1272  	if (ret == -ENOSPC) {
2b2811178e8555 Seth Jennings       2013-07-10  1273  		zswap_reject_compress_poor++;
f1c54846ee4504 Dan Streetman       2015-09-09  1274  		goto put_dstmem;
2b2811178e8555 Seth Jennings       2013-07-10  1275  	}
2b2811178e8555 Seth Jennings       2013-07-10  1276  	if (ret) {
2b2811178e8555 Seth Jennings       2013-07-10  1277  		zswap_reject_alloc_fail++;
f1c54846ee4504 Dan Streetman       2015-09-09  1278  		goto put_dstmem;
2b2811178e8555 Seth Jennings       2013-07-10  1279  	}
ae34af1f11d0a6 Miaohe Lin          2021-06-30  1280  	buf = zpool_map_handle(entry->pool->zpool, handle, ZPOOL_MM_WO);
9c3760eb80880f Yu Zhao             2018-01-31  1281  	memcpy(buf, &zhdr, hlen);
9c3760eb80880f Yu Zhao             2018-01-31  1282  	memcpy(buf + hlen, dst, dlen);
f1c54846ee4504 Dan Streetman       2015-09-09  1283  	zpool_unmap_handle(entry->pool->zpool, handle);
1ec3b5fe6eec78 Barry Song          2020-12-14  1284  	mutex_unlock(acomp_ctx->mutex);
2b2811178e8555 Seth Jennings       2013-07-10  1285  
2b2811178e8555 Seth Jennings       2013-07-10  1286  	/* populate entry */
2b2811178e8555 Seth Jennings       2013-07-10  1287  	entry->offset = offset;
2b2811178e8555 Seth Jennings       2013-07-10  1288  	entry->handle = handle;
2b2811178e8555 Seth Jennings       2013-07-10  1289  	entry->length = dlen;
2b2811178e8555 Seth Jennings       2013-07-10  1290  
a85f878b443f8d Srividya Desireddy  2018-01-31  1291  insert_entry:
f4840ccfca25db Johannes Weiner     2022-05-19  1292  	entry->objcg = objcg;
f4840ccfca25db Johannes Weiner     2022-05-19  1293  	if (objcg) {
f4840ccfca25db Johannes Weiner     2022-05-19  1294  		obj_cgroup_charge_zswap(objcg, entry->length);
f4840ccfca25db Johannes Weiner     2022-05-19  1295  		/* Account before objcg ref is moved to tree */
f4840ccfca25db Johannes Weiner     2022-05-19  1296  		count_objcg_event(objcg, ZSWPOUT);
f4840ccfca25db Johannes Weiner     2022-05-19  1297  	}
f4840ccfca25db Johannes Weiner     2022-05-19  1298  
2b2811178e8555 Seth Jennings       2013-07-10  1299  	/* map */
2b2811178e8555 Seth Jennings       2013-07-10  1300  	spin_lock(&tree->lock);
2b2811178e8555 Seth Jennings       2013-07-10  1301  	do {
2b2811178e8555 Seth Jennings       2013-07-10  1302  		ret = zswap_rb_insert(&tree->rbroot, entry, &dupentry);
2b2811178e8555 Seth Jennings       2013-07-10  1303  		if (ret == -EEXIST) {
2b2811178e8555 Seth Jennings       2013-07-10  1304  			zswap_duplicate_entry++;
2b2811178e8555 Seth Jennings       2013-07-10  1305  			/* remove from rbtree */
0ab0abcf511545 Weijie Yang         2013-11-12  1306  			zswap_rb_erase(&tree->rbroot, dupentry);
0ab0abcf511545 Weijie Yang         2013-11-12  1307  			zswap_entry_put(tree, dupentry);
2b2811178e8555 Seth Jennings       2013-07-10  1308  		}
2b2811178e8555 Seth Jennings       2013-07-10  1309  	} while (ret == -EEXIST);
2b2811178e8555 Seth Jennings       2013-07-10  1310  	spin_unlock(&tree->lock);
2b2811178e8555 Seth Jennings       2013-07-10  1311  
2b2811178e8555 Seth Jennings       2013-07-10  1312  	/* update stats */
2b2811178e8555 Seth Jennings       2013-07-10  1313  	atomic_inc(&zswap_stored_pages);
f1c54846ee4504 Dan Streetman       2015-09-09  1314  	zswap_update_total_size();
f6498b776d280b Johannes Weiner     2022-05-19  1315  	count_vm_event(ZSWPOUT);
2b2811178e8555 Seth Jennings       2013-07-10  1316  
2b2811178e8555 Seth Jennings       2013-07-10  1317  	return 0;
2b2811178e8555 Seth Jennings       2013-07-10  1318  
f1c54846ee4504 Dan Streetman       2015-09-09  1319  put_dstmem:
1ec3b5fe6eec78 Barry Song          2020-12-14  1320  	mutex_unlock(acomp_ctx->mutex);
f1c54846ee4504 Dan Streetman       2015-09-09  1321  	zswap_pool_put(entry->pool);
f1c54846ee4504 Dan Streetman       2015-09-09  1322  freepage:
2b2811178e8555 Seth Jennings       2013-07-10  1323  	zswap_entry_cache_free(entry);
2b2811178e8555 Seth Jennings       2013-07-10  1324  reject:
f4840ccfca25db Johannes Weiner     2022-05-19  1325  	if (objcg)
f4840ccfca25db Johannes Weiner     2022-05-19  1326  		obj_cgroup_put(objcg);
2b2811178e8555 Seth Jennings       2013-07-10  1327  	return ret;
f4840ccfca25db Johannes Weiner     2022-05-19  1328  
f4840ccfca25db Johannes Weiner     2022-05-19  1329  shrink:
f4840ccfca25db Johannes Weiner     2022-05-19  1330  	pool = zswap_pool_last_get();
f4840ccfca25db Johannes Weiner     2022-05-19  1331  	if (pool)
f4840ccfca25db Johannes Weiner     2022-05-19  1332  		queue_work(shrink_wq, &pool->shrink_work);
f4840ccfca25db Johannes Weiner     2022-05-19  1333  	ret = -ENOMEM;
f4840ccfca25db Johannes Weiner     2022-05-19  1334  	goto reject;
2b2811178e8555 Seth Jennings       2013-07-10  1335  }
2b2811178e8555 Seth Jennings       2013-07-10  1336  

:::::: The code at line 1183 was first introduced by commit
:::::: f4840ccfca25db225b3371a8f7b5770febee87c5 zswap: memcg accounting

:::::: TO: Johannes Weiner <hannes@cmpxchg.org>
:::::: CC: akpm <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
