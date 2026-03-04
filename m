Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181CD1E5B68;
	Wed,  4 Mar 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772628707; cv=none; b=sBhgeORpR4R/HMKV9YbFKSBynxi2X2QK9Q4ib98C9p7kqBpZBqjhtBlckFbh6spvXvBfrVAjTM/Nf7MQjLkDDSdIlxqVHrykN4HefQnLjTl++Dv6yqCIOwkbrkLSiu2TdgD1tkl+rga42wcF9PW8Y8Uv6lIiH06kUHAl08g+VnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772628707; c=relaxed/simple;
	bh=7Tp0sC9qdycYokHxu/nLo1M06pW5BKl+h6KLwe/PCwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UupwfxMz0ld5l6Ab0uuJjnXtXEgTNCapmp9ZHd+y5YmLWujcQKjhVDeu7oIvr+IG00iid8RudFDPR5qeCZN/QadL4e2YqDxhgGSRcSWBfUIMpSsCVXT/Od3A0Dtl6MOLEeWIV9dhnYIVUmDGusmpN69GTm/KqRDWQAMGBesl9eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnVpVBBV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnVpVBBV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772628705; x=1804164705;
  h=date:from:to:cc:subject:message-id;
  bh=7Tp0sC9qdycYokHxu/nLo1M06pW5BKl+h6KLwe/PCwE=;
  b=VnVpVBBVBrQBDe/NDOhlcJ44qk3ekZBZJKDtJKJJ8D9jRmbWfVoysO0L
   LhV06HzzIgHmCSRg8fTK4yLFDxWsnRimyAROzrV6qWB3g+S/KsznZsg2U
   J0ofu/X9gDfHxnaZNCXCBeEUOdFsBwQUpyI7g+C/MuDsvlN2mvZ/fA6u6
   Cf2N2hgcHiWli+J/BEO2R+cKPDsxQMYFGkjwbVZM937mCsKyRNwposfW7
   HJ0p5Ii3QVA2sR4FR2wY+v0ZqGQfI/Is+Y4AR2eCXkoO3zbx6Rp9z+n6/
   HjtCIuzLKAfwTW8b4hnNtEgAMh5HD+qpV8r0wWZ53ph1DqEi4ct1juHUj
   w==;
X-CSE-ConnectionGUID: aQzcXwo/Tc+49cjSp/+pxw==
X-CSE-MsgGUID: rqHDSf+TRPC11T2gSEHl0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73754919"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73754919"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 04:51:44 -0800
X-CSE-ConnectionGUID: 5aZXhc/nS5ehvFuZ6tQ5fA==
X-CSE-MsgGUID: U4dNZRtHSHiuroT+sNhyeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="241341359"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 04 Mar 2026 04:51:42 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxlhT-000000003jl-3BBo;
	Wed, 04 Mar 2026 12:51:39 +0000
Date: Wed, 04 Mar 2026 20:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260302 13/13]
 drivers/md/bcache/btree.c:120:19: error: incompatible pointer types passing
 'struct bkey_fixed *' to parameter of type 'const struct bkey *'
Message-ID: <202603042032.gn5QBN3e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260302
head:   edaeb7365fb0decc352db789ed93ef51bc8ebafa
commit: edaeb7365fb0decc352db789ed93ef51bc8ebafa [13/13] bcachefs: Avoid dozens of -Wflex-array-member-not-at-end warnings
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260304/202603042032.gn5QBN3e-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260304/202603042032.gn5QBN3e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603042032.gn5QBN3e-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/bcache/btree.c:120:19: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     120 |         if (b->written < btree_blocks(b))
         |                          ^~~~~~~~~~~~~~~
   drivers/md/bcache/bcache.h:770:28: note: expanded from macro 'btree_blocks'
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/btree.c:171:20: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     171 |              b->written < btree_blocks(b) && i->seq == b->keys.set[0].data->seq;
         |                           ^~~~~~~~~~~~~~~
   drivers/md/bcache/bcache.h:770:28: note: expanded from macro 'btree_blocks'
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/btree.c:179:7: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     179 |                     btree_blocks(b))
         |                     ^~~~~~~~~~~~~~~
   drivers/md/bcache/bcache.h:770:28: note: expanded from macro 'btree_blocks'
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/btree.c:209:50: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     209 |              bset_sector_offset(&b->keys, i) < KEY_SIZE(&b->key);
         |                                                         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/btree.c:219:15: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     219 |             bkey_cmp(&b->key, &b->keys.set[0].end) < 0)
         |                      ^~~~~~~
   drivers/md/bcache/bset.h:425:60: note: passing argument to parameter 'l' here
     425 | static __always_inline int64_t bkey_cmp(const struct bkey *l,
         |                                                            ^
   drivers/md/bcache/btree.c:222:19: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     222 |         if (b->written < btree_blocks(b))
         |                          ^~~~~~~~~~~~~~~
   drivers/md/bcache/bcache.h:770:28: note: expanded from macro 'btree_blocks'
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/btree.c:231:33: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     231 |                             err, PTR_BUCKET_NR(b->c, &b->key, 0),
         |                                                      ^~~~~~~
   drivers/md/bcache/bcache.h:821:27: note: passing argument to parameter 'k' here
     821 |                                    const struct bkey *k,
         |                                                       ^
   drivers/md/bcache/btree.c:254:34: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     254 |         bio->bi_iter.bi_size = KEY_SIZE(&b->key) << 9;
         |                                         ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
>> drivers/md/bcache/btree.c:261:29: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'struct bkey *' [-Wincompatible-pointer-types]
     261 |         bch_submit_bbio(bio, b->c, &b->key, 0);
         |                                    ^~~~~~~
   drivers/md/bcache/bcache.h:985:21: note: passing argument to parameter 'k' here
     985 |                      struct bkey *k, unsigned int ptr);
         |                                   ^
   drivers/md/bcache/btree.c:278:28: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     278 |                             PTR_BUCKET_NR(b->c, &b->key, 0));
         |                                                 ^~~~~~~
   drivers/md/bcache/bcache.h:821:27: note: passing argument to parameter 'k' here
     821 |                                    const struct bkey *k,
         |                                                       ^
   drivers/md/bcache/btree.c:371:20: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     371 |         bkey_copy(&k.key, &b->key);
         |                           ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:121:70: note: expanded from macro 'bkey_copy'
     121 | #define bkey_copy(_dest, _src)  unsafe_memcpy(_dest, _src, bkey_bytes(_src), \
         |                                                                       ^~~~
   include/linux/string.h:390:19: note: expanded from macro 'unsafe_memcpy'
     390 |         memcpy(dst, src, bytes)
         |                          ^~~~~
   arch/sparc/include/asm/string.h:15:48: note: expanded from macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^
   drivers/md/bcache/bcache_ondisk.h:116:59: note: passing argument to parameter 'k' here
     116 | static inline unsigned long bkey_bytes(const struct bkey *k)
         |                                                           ^
   drivers/md/bcache/btree.c:412:23: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     412 |         BUG_ON(b->written >= btree_blocks(b));
         |         ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   drivers/md/bcache/bcache.h:770:28: note: expanded from macro 'btree_blocks'
     770 |         ((unsigned int) (KEY_SIZE(&b->key) >> (b)->c->block_bits))
         |                                   ^
   include/asm-generic/bug.h:81:45: note: expanded from macro 'BUG_ON'
      81 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                    ~~~~~~~~~^~~~~~~~~~
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
>> drivers/md/bcache/btree.c:569:50: error: incompatible pointer types passing 'const struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     569 |         return -cmp_int(a->level, b->level) ?: bkey_cmp(&a->key, &b->key);
         |                                                         ^~~~~~~
   drivers/md/bcache/bset.h:425:60: note: passing argument to parameter 'l' here
     425 | static __always_inline int64_t bkey_cmp(const struct bkey *l,
         |                                                            ^
   drivers/md/bcache/btree.c:569:59: error: incompatible pointer types passing 'const struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     569 |         return -cmp_int(a->level, b->level) ?: bkey_cmp(&a->key, &b->key);
         |                                                                  ^~~~~~~
   drivers/md/bcache/bset.h:426:25: note: passing argument to parameter 'r' here
     426 |                                         const struct bkey *r)
         |                                                            ^
   drivers/md/bcache/btree.c:577:19: error: incompatible pointer types passing 'const struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     577 |                KEY_INODE(&b->key), KEY_OFFSET(&b->key));
         |                          ^~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:64:1: note: passing argument to parameter 'k' here
      64 | KEY_FIELD(KEY_INODE,    high, 0,  20)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/btree.c:577:40: error: incompatible pointer types passing 'const struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     577 |                KEY_INODE(&b->key), KEY_OFFSET(&b->key));
         |                                               ^~~~~~~
   include/linux/printk.h:511:60: note: expanded from macro 'printk'
     511 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                            ^~~~~~~~~~~
   include/linux/printk.h:483:19: note: expanded from macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:68:51: note: passing argument to parameter 'k' here
      68 | static inline __u64 KEY_OFFSET(const struct bkey *k)
         |                                                   ^
   drivers/md/bcache/btree.c:859:19: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     859 |                 if (PTR_HASH(c, &b->key) == PTR_HASH(c, k))
         |                                 ^~~~~~~
   drivers/md/bcache/btree.c:100:45: note: expanded from macro 'PTR_HASH'
     100 |         (((k)->ptr[0] >> c->bucket_bits) | PTR_GEN(k, 0))
         |                                                    ^
   drivers/md/bcache/bcache_ondisk.h:102:1: note: passing argument to parameter 'k' here
     102 | PTR_FIELD(PTR_GEN,                      0,  8)
         | ^
   drivers/md/bcache/bcache_ondisk.h:45:45: note: expanded from macro 'PTR_FIELD'
      45 | static inline __u64 name(const struct bkey *k, unsigned int i)          \
         |                                             ^
   drivers/md/bcache/btree.c:1035:19: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
    1035 |                 if (PTR_HASH(c, &b->key) != PTR_HASH(c, k)) {
         |                                 ^~~~~~~
   drivers/md/bcache/btree.c:100:45: note: expanded from macro 'PTR_HASH'
     100 |         (((k)->ptr[0] >> c->bucket_bits) | PTR_GEN(k, 0))
         |                                                    ^
   drivers/md/bcache/bcache_ondisk.h:102:1: note: passing argument to parameter 'k' here
     102 | PTR_FIELD(PTR_GEN,                      0,  8)
         | ^
   drivers/md/bcache/bcache_ondisk.h:45:45: note: expanded from macro 'PTR_FIELD'
      45 | static inline __u64 name(const struct bkey *k, unsigned int i)          \
         |                                             ^
   drivers/md/bcache/btree.c:1110:24: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'struct bkey *' [-Wincompatible-pointer-types]
    1110 |         bch_bucket_free(b->c, &b->key);
         |                               ^~~~~~~
   drivers/md/bcache/bcache.h:994:56: note: passing argument to parameter 'k' here
     994 | void bch_bucket_free(struct cache_set *c, struct bkey *k);
         |                                                        ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> drivers/md/bcache/debug.c:47:21: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
      47 |         bkey_copy(&v->key, &b->key);
         |                            ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:121:70: note: expanded from macro 'bkey_copy'
     121 | #define bkey_copy(_dest, _src)  unsafe_memcpy(_dest, _src, bkey_bytes(_src), \
         |                                                                       ^~~~
   include/linux/string.h:390:19: note: expanded from macro 'unsafe_memcpy'
     390 |         memcpy(dst, src, bytes)
         |                          ^~~~~
   arch/sparc/include/asm/string.h:15:48: note: expanded from macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^
   drivers/md/bcache/bcache_ondisk.h:116:59: note: passing argument to parameter 'k' here
     116 | static inline unsigned long bkey_bytes(const struct bkey *k)
         |                                                           ^
   drivers/md/bcache/debug.c:54:38: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
      54 |         bio->bi_iter.bi_sector  = PTR_OFFSET(&b->key, 0);
         |                                              ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:101:1: note: passing argument to parameter 'k' here
     101 | PTR_FIELD(PTR_OFFSET,                   8,  43)
         | ^
   drivers/md/bcache/bcache_ondisk.h:45:45: note: expanded from macro 'PTR_FIELD'
      45 | static inline __u64 name(const struct bkey *k, unsigned int i)          \
         |                                             ^
   drivers/md/bcache/debug.c:55:34: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
      55 |         bio->bi_iter.bi_size    = KEY_SIZE(&v->key) << 9;
         |                                            ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/debug.c:62:34: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
      62 |         memcpy(ondisk, sorted, KEY_SIZE(&v->key) << 9);
         |                                         ^~~~~~~
   arch/sparc/include/asm/string.h:15:48: note: expanded from macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/debug.c:83:3: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
      83 |                 for_each_written_bset(b, ondisk, i) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/md/bcache/debug.c:26:49: note: expanded from macro 'for_each_written_bset'
      26 |              (void *) i < (void *) (start) + (KEY_SIZE(&b->key) << 9) &&\
         |                                                        ^~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/debug.c:198:42: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     198 |                 bch_extent_to_text(kbuf, sizeof(kbuf), &w->key);
         |                                                        ^~~~~~~
   drivers/md/bcache/extents.h:11:68: note: passing argument to parameter 'k' here
      11 | void bch_extent_to_text(char *buf, size_t size, const struct bkey *k);
         |                                                                    ^
   6 errors generated.
--
>> drivers/md/bcache/movinggc.c:53:34: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'struct bkey *' [-Wincompatible-pointer-types]
      53 |                 trace_bcache_gc_copy_collision(&io->w->key);
         |                                                ^~~~~~~~~~~
   include/trace/events/bcache.h:328:24: note: passing argument to parameter 'k' here
     328 |         TP_PROTO(struct bkey *k),
         |                               ^
>> drivers/md/bcache/movinggc.c:83:26: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
      83 |                  DIV_ROUND_UP(KEY_SIZE(&io->w->key), PAGE_SECTORS), 0);
         |                                        ^~~~~~~~~~~
   include/linux/math.h:49:22: note: expanded from macro 'DIV_ROUND_UP'
      49 | #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
         |                      ^
   include/uapi/linux/const.h:51:40: note: expanded from macro '__KERNEL_DIV_ROUND_UP'
      51 | #define __KERNEL_DIV_ROUND_UP(n, d) (((n) + (d) - 1) / (d))
         |                                        ^
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/movinggc.c:87:34: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
      87 |         bio->bi_iter.bi_size    = KEY_SIZE(&io->w->key) << 9;
         |                                            ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/movinggc.c:100:45: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     100 |                 io->bio.bio.bi_iter.bi_sector = KEY_START(&io->w->key);
         |                                                           ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:95:36: note: expanded from macro 'KEY_START'
      95 | #define KEY_START(k)                    (KEY_OFFSET(k) - KEY_SIZE(k))
         |                                                     ^
   drivers/md/bcache/bcache_ondisk.h:68:51: note: passing argument to parameter 'k' here
      68 | static inline __u64 KEY_OFFSET(const struct bkey *k)
         |                                                   ^
   drivers/md/bcache/movinggc.c:100:45: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     100 |                 io->bio.bio.bi_iter.bi_sector = KEY_START(&io->w->key);
         |                                                           ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:95:50: note: expanded from macro 'KEY_START'
      95 | #define KEY_START(k)                    (KEY_OFFSET(k) - KEY_SIZE(k))
         |                                                                   ^
   drivers/md/bcache/bcache_ondisk.h:63:1: note: passing argument to parameter 'k' here
      63 | KEY_FIELD(KEY_SIZE,     high, 20, KEY_SIZE_BITS)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/movinggc.c:104:30: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     104 |                 op->writeback           = KEY_DIRTY(&io->w->key);
         |                                                     ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:61:1: note: passing argument to parameter 'k' here
      61 | KEY_FIELD(KEY_DIRTY,    high, 36, 1)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/movinggc.c:105:24: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     105 |                 op->csum                = KEY_CSUM(&io->w->key);
         |                                                    ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:59:1: note: passing argument to parameter 'k' here
      59 | KEY_FIELD(KEY_CSUM,     high, 56, 2)
         | ^
   drivers/md/bcache/bcache_ondisk.h:42:2: note: expanded from macro 'KEY_FIELD'
      42 |         BITMASK(name, struct bkey, field, offset, size)
         |         ^
   drivers/md/bcache/bcache_ondisk.h:12:38: note: expanded from macro 'BITMASK'
      12 | static inline __u64 name(const type *k)                         \
         |                                      ^
   drivers/md/bcache/movinggc.c:107:31: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     107 |                 bkey_copy(&op->replace_key, &io->w->key);
         |                                             ^~~~~~~~~~~
   drivers/md/bcache/bcache_ondisk.h:121:70: note: expanded from macro 'bkey_copy'
     121 | #define bkey_copy(_dest, _src)  unsafe_memcpy(_dest, _src, bkey_bytes(_src), \
         |                                                                       ^~~~
   include/linux/string.h:390:19: note: expanded from macro 'unsafe_memcpy'
     390 |         memcpy(dst, src, bytes)
         |                          ^~~~~
   arch/sparc/include/asm/string.h:15:48: note: expanded from macro 'memcpy'
      15 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                                                ^
   drivers/md/bcache/bcache_ondisk.h:116:59: note: passing argument to parameter 'k' here
     116 | static inline unsigned long bkey_bytes(const struct bkey *k)
         |                                                           ^
   drivers/md/bcache/movinggc.c:121:33: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'struct bkey *' [-Wincompatible-pointer-types]
     121 |         bch_submit_bbio(bio, io->op.c, &io->w->key, 0);
         |                                        ^~~~~~~~~~~
   drivers/md/bcache/bcache.h:985:21: note: passing argument to parameter 'k' here
     985 |                      struct bkey *k, unsigned int ptr);
         |                                   ^
   drivers/md/bcache/movinggc.c:143:20: error: incompatible pointer types passing 'struct bkey_fixed *' to parameter of type 'const struct bkey *' [-Wincompatible-pointer-types]
     143 |                 if (ptr_stale(c, &w->key, 0)) {
..


vim +120 drivers/md/bcache/btree.c

a85e968e66a175 Kent Overstreet    2013-12-20  111  
2a285686c10981 Kent Overstreet    2014-03-04  112  static void bch_btree_init_next(struct btree *b)
2a285686c10981 Kent Overstreet    2014-03-04  113  {
2a285686c10981 Kent Overstreet    2014-03-04  114  	/* If not a leaf node, always sort */
2a285686c10981 Kent Overstreet    2014-03-04  115  	if (b->level && b->keys.nsets)
2a285686c10981 Kent Overstreet    2014-03-04  116  		bch_btree_sort(&b->keys, &b->c->sort);
2a285686c10981 Kent Overstreet    2014-03-04  117  	else
2a285686c10981 Kent Overstreet    2014-03-04  118  		bch_btree_sort_lazy(&b->keys, &b->c->sort);
2a285686c10981 Kent Overstreet    2014-03-04  119  
2a285686c10981 Kent Overstreet    2014-03-04 @120  	if (b->written < btree_blocks(b))
2a285686c10981 Kent Overstreet    2014-03-04  121  		bch_bset_init_next(&b->keys, write_block(b),
4a784266c6a75f Coly Li            2020-10-01  122  				   bset_magic(&b->c->cache->sb));
2a285686c10981 Kent Overstreet    2014-03-04  123  
2a285686c10981 Kent Overstreet    2014-03-04  124  }
2a285686c10981 Kent Overstreet    2014-03-04  125  
cafe563591446c Kent Overstreet    2013-03-23  126  /* Btree key manipulation */
cafe563591446c Kent Overstreet    2013-03-23  127  
3a3b6a4e075188 Kent Overstreet    2013-07-24  128  void bkey_put(struct cache_set *c, struct bkey *k)
e7c590eb63509c Kent Overstreet    2013-09-10  129  {
6f10f7d1b02b1b Coly Li            2018-08-11  130  	unsigned int i;
e7c590eb63509c Kent Overstreet    2013-09-10  131  
e7c590eb63509c Kent Overstreet    2013-09-10  132  	for (i = 0; i < KEY_PTRS(k); i++)
e7c590eb63509c Kent Overstreet    2013-09-10  133  		if (ptr_available(c, k, i))
e7c590eb63509c Kent Overstreet    2013-09-10  134  			atomic_dec_bug(&PTR_BUCKET(c, k, i)->pin);
e7c590eb63509c Kent Overstreet    2013-09-10  135  }
e7c590eb63509c Kent Overstreet    2013-09-10  136  
cafe563591446c Kent Overstreet    2013-03-23  137  /* Btree IO */
cafe563591446c Kent Overstreet    2013-03-23  138  
cafe563591446c Kent Overstreet    2013-03-23  139  static uint64_t btree_csum_set(struct btree *b, struct bset *i)
cafe563591446c Kent Overstreet    2013-03-23  140  {
cafe563591446c Kent Overstreet    2013-03-23  141  	uint64_t crc = b->key.ptr[0];
fafff81cead781 Kent Overstreet    2013-12-17  142  	void *data = (void *) i + 8, *end = bset_bkey_last(i);
cafe563591446c Kent Overstreet    2013-03-23  143  
39fa7a95552cc8 Christoph Hellwig  2021-10-20  144  	crc = crc64_be(crc, data, end - data);
c19ed23a0b1848 Kent Overstreet    2013-03-26  145  	return crc ^ 0xffffffffffffffffULL;
cafe563591446c Kent Overstreet    2013-03-23  146  }
cafe563591446c Kent Overstreet    2013-03-23  147  
78b77bf8b20431 Kent Overstreet    2013-12-17  148  void bch_btree_node_read_done(struct btree *b)
cafe563591446c Kent Overstreet    2013-03-23  149  {
cafe563591446c Kent Overstreet    2013-03-23  150  	const char *err = "bad btree header";
ee811287c9f241 Kent Overstreet    2013-12-17  151  	struct bset *i = btree_bset_first(b);
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  152  	struct btree_iter *iter;
cafe563591446c Kent Overstreet    2013-03-23  153  
d2f96f487f471b Shenghui Wang      2018-12-13  154  	/*
d2f96f487f471b Shenghui Wang      2018-12-13  155  	 * c->fill_iter can allocate an iterator with more memory space
d2f96f487f471b Shenghui Wang      2018-12-13  156  	 * than static MAX_BSETS.
d2f96f487f471b Shenghui Wang      2018-12-13  157  	 * See the comment arount cache_set->fill_iter.
d2f96f487f471b Shenghui Wang      2018-12-13  158  	 */
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  159  	iter = mempool_alloc(&b->c->fill_iter, GFP_NOIO);
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  160  	iter->size = b->c->cache->sb.bucket_size / b->c->cache->sb.block_size;
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  161  	iter->used = 0;
cafe563591446c Kent Overstreet    2013-03-23  162  
280481d06c8a68 Kent Overstreet    2013-10-24  163  #ifdef CONFIG_BCACHE_DEBUG
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  164  	iter->b = &b->keys;
280481d06c8a68 Kent Overstreet    2013-10-24  165  #endif
280481d06c8a68 Kent Overstreet    2013-10-24  166  
5794351146199b Kent Overstreet    2013-04-25  167  	if (!i->seq)
cafe563591446c Kent Overstreet    2013-03-23  168  		goto err;
cafe563591446c Kent Overstreet    2013-03-23  169  
cafe563591446c Kent Overstreet    2013-03-23  170  	for (;
a85e968e66a175 Kent Overstreet    2013-12-20  171  	     b->written < btree_blocks(b) && i->seq == b->keys.set[0].data->seq;
cafe563591446c Kent Overstreet    2013-03-23  172  	     i = write_block(b)) {
cafe563591446c Kent Overstreet    2013-03-23  173  		err = "unsupported bset version";
cafe563591446c Kent Overstreet    2013-03-23  174  		if (i->version > BCACHE_BSET_VERSION)
cafe563591446c Kent Overstreet    2013-03-23  175  			goto err;
cafe563591446c Kent Overstreet    2013-03-23  176  
cafe563591446c Kent Overstreet    2013-03-23  177  		err = "bad btree header";
4e1ebae3ee4e0c Coly Li            2020-10-01  178  		if (b->written + set_blocks(i, block_bytes(b->c->cache)) >
ee811287c9f241 Kent Overstreet    2013-12-17  179  		    btree_blocks(b))
cafe563591446c Kent Overstreet    2013-03-23  180  			goto err;
cafe563591446c Kent Overstreet    2013-03-23  181  
cafe563591446c Kent Overstreet    2013-03-23  182  		err = "bad magic";
4a784266c6a75f Coly Li            2020-10-01  183  		if (i->magic != bset_magic(&b->c->cache->sb))
cafe563591446c Kent Overstreet    2013-03-23  184  			goto err;
cafe563591446c Kent Overstreet    2013-03-23  185  
cafe563591446c Kent Overstreet    2013-03-23  186  		err = "bad checksum";
cafe563591446c Kent Overstreet    2013-03-23  187  		switch (i->version) {
cafe563591446c Kent Overstreet    2013-03-23  188  		case 0:
cafe563591446c Kent Overstreet    2013-03-23  189  			if (i->csum != csum_set(i))
cafe563591446c Kent Overstreet    2013-03-23  190  				goto err;
cafe563591446c Kent Overstreet    2013-03-23  191  			break;
cafe563591446c Kent Overstreet    2013-03-23  192  		case BCACHE_BSET_VERSION:
cafe563591446c Kent Overstreet    2013-03-23  193  			if (i->csum != btree_csum_set(b, i))
cafe563591446c Kent Overstreet    2013-03-23  194  				goto err;
cafe563591446c Kent Overstreet    2013-03-23  195  			break;
cafe563591446c Kent Overstreet    2013-03-23  196  		}
cafe563591446c Kent Overstreet    2013-03-23  197  
cafe563591446c Kent Overstreet    2013-03-23  198  		err = "empty set";
a85e968e66a175 Kent Overstreet    2013-12-20  199  		if (i != b->keys.set[0].data && !i->keys)
cafe563591446c Kent Overstreet    2013-03-23  200  			goto err;
cafe563591446c Kent Overstreet    2013-03-23  201  
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  202  		bch_btree_iter_push(iter, i->start, bset_bkey_last(i));
cafe563591446c Kent Overstreet    2013-03-23  203  
4e1ebae3ee4e0c Coly Li            2020-10-01  204  		b->written += set_blocks(i, block_bytes(b->c->cache));
cafe563591446c Kent Overstreet    2013-03-23  205  	}
cafe563591446c Kent Overstreet    2013-03-23  206  
cafe563591446c Kent Overstreet    2013-03-23  207  	err = "corrupted btree";
cafe563591446c Kent Overstreet    2013-03-23  208  	for (i = write_block(b);
a85e968e66a175 Kent Overstreet    2013-12-20  209  	     bset_sector_offset(&b->keys, i) < KEY_SIZE(&b->key);
4e1ebae3ee4e0c Coly Li            2020-10-01  210  	     i = ((void *) i) + block_bytes(b->c->cache))
a85e968e66a175 Kent Overstreet    2013-12-20  211  		if (i->seq == b->keys.set[0].data->seq)
cafe563591446c Kent Overstreet    2013-03-23  212  			goto err;
cafe563591446c Kent Overstreet    2013-03-23  213  
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  214  	bch_btree_sort_and_fix_extents(&b->keys, iter, &b->c->sort);
cafe563591446c Kent Overstreet    2013-03-23  215  
a85e968e66a175 Kent Overstreet    2013-12-20  216  	i = b->keys.set[0].data;
cafe563591446c Kent Overstreet    2013-03-23  217  	err = "short btree key";
a85e968e66a175 Kent Overstreet    2013-12-20  218  	if (b->keys.set[0].size &&
a85e968e66a175 Kent Overstreet    2013-12-20  219  	    bkey_cmp(&b->key, &b->keys.set[0].end) < 0)
cafe563591446c Kent Overstreet    2013-03-23  220  		goto err;
cafe563591446c Kent Overstreet    2013-03-23  221  
cafe563591446c Kent Overstreet    2013-03-23  222  	if (b->written < btree_blocks(b))
a85e968e66a175 Kent Overstreet    2013-12-20  223  		bch_bset_init_next(&b->keys, write_block(b),
4a784266c6a75f Coly Li            2020-10-01  224  				   bset_magic(&b->c->cache->sb));
cafe563591446c Kent Overstreet    2013-03-23  225  out:
48fd7ebe00c1cd Kuan-Wei Chiu      2025-06-15  226  	mempool_free(iter, &b->c->fill_iter);
5794351146199b Kent Overstreet    2013-04-25  227  	return;
cafe563591446c Kent Overstreet    2013-03-23  228  err:
cafe563591446c Kent Overstreet    2013-03-23  229  	set_btree_node_io_error(b);
88b9f8c426f35e Kent Overstreet    2013-12-17  230  	bch_cache_set_error(b->c, "%s at bucket %zu, block %u, %u keys",
cafe563591446c Kent Overstreet    2013-03-23  231  			    err, PTR_BUCKET_NR(b->c, &b->key, 0),
88b9f8c426f35e Kent Overstreet    2013-12-17  232  			    bset_block_offset(b, i), i->keys);
cafe563591446c Kent Overstreet    2013-03-23  233  	goto out;
cafe563591446c Kent Overstreet    2013-03-23  234  }
cafe563591446c Kent Overstreet    2013-03-23  235  
4246a0b63bd8f5 Christoph Hellwig  2015-07-20  236  static void btree_node_read_endio(struct bio *bio)
5794351146199b Kent Overstreet    2013-04-25  237  {
5794351146199b Kent Overstreet    2013-04-25  238  	struct closure *cl = bio->bi_private;
1fae7cf05293d3 Coly Li            2018-08-11  239  
5794351146199b Kent Overstreet    2013-04-25  240  	closure_put(cl);
5794351146199b Kent Overstreet    2013-04-25  241  }
5794351146199b Kent Overstreet    2013-04-25  242  
78b77bf8b20431 Kent Overstreet    2013-12-17  243  static void bch_btree_node_read(struct btree *b)
cafe563591446c Kent Overstreet    2013-03-23  244  {
5794351146199b Kent Overstreet    2013-04-25  245  	uint64_t start_time = local_clock();
5794351146199b Kent Overstreet    2013-04-25  246  	struct closure cl;
5794351146199b Kent Overstreet    2013-04-25  247  	struct bio *bio;
cafe563591446c Kent Overstreet    2013-03-23  248  
c37511b863f36c Kent Overstreet    2013-04-26  249  	trace_bcache_btree_read(b);
c37511b863f36c Kent Overstreet    2013-04-26  250  
5794351146199b Kent Overstreet    2013-04-25  251  	closure_init_stack(&cl);
cafe563591446c Kent Overstreet    2013-03-23  252  
5794351146199b Kent Overstreet    2013-04-25  253  	bio = bch_bbio_alloc(b->c);
4f024f3797c43c Kent Overstreet    2013-10-11  254  	bio->bi_iter.bi_size = KEY_SIZE(&b->key) << 9;
5794351146199b Kent Overstreet    2013-04-25  255  	bio->bi_end_io	= btree_node_read_endio;
5794351146199b Kent Overstreet    2013-04-25  256  	bio->bi_private	= &cl;
70fd76140a6cb6 Christoph Hellwig  2016-11-01  257  	bio->bi_opf = REQ_OP_READ | REQ_META;
cafe563591446c Kent Overstreet    2013-03-23  258  
a85e968e66a175 Kent Overstreet    2013-12-20  259  	bch_bio_map(bio, b->keys.set[0].data);
cafe563591446c Kent Overstreet    2013-03-23  260  
5794351146199b Kent Overstreet    2013-04-25 @261  	bch_submit_bbio(bio, b->c, &b->key, 0);
5794351146199b Kent Overstreet    2013-04-25  262  	closure_sync(&cl);
cafe563591446c Kent Overstreet    2013-03-23  263  
4e4cbee93d5613 Christoph Hellwig  2017-06-03  264  	if (bio->bi_status)
5794351146199b Kent Overstreet    2013-04-25  265  		set_btree_node_io_error(b);
cafe563591446c Kent Overstreet    2013-03-23  266  
5794351146199b Kent Overstreet    2013-04-25  267  	bch_bbio_free(bio, b->c);
5794351146199b Kent Overstreet    2013-04-25  268  
5794351146199b Kent Overstreet    2013-04-25  269  	if (btree_node_io_error(b))
5794351146199b Kent Overstreet    2013-04-25  270  		goto err;
5794351146199b Kent Overstreet    2013-04-25  271  
5794351146199b Kent Overstreet    2013-04-25  272  	bch_btree_node_read_done(b);
5794351146199b Kent Overstreet    2013-04-25  273  	bch_time_stats_update(&b->c->btree_read_time, start_time);
5794351146199b Kent Overstreet    2013-04-25  274  
5794351146199b Kent Overstreet    2013-04-25  275  	return;
5794351146199b Kent Overstreet    2013-04-25  276  err:
61cbd250f867f9 Geert Uytterhoeven 2013-09-23  277  	bch_cache_set_error(b->c, "io error reading bucket %zu",
5794351146199b Kent Overstreet    2013-04-25  278  			    PTR_BUCKET_NR(b->c, &b->key, 0));
cafe563591446c Kent Overstreet    2013-03-23  279  }
cafe563591446c Kent Overstreet    2013-03-23  280  

:::::: The code at line 120 was first introduced by commit
:::::: 2a285686c109816ba71a00b9278262cf02648258 bcache: btree locking rework

:::::: TO: Kent Overstreet <kmo@daterainc.com>
:::::: CC: Kent Overstreet <kmo@daterainc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
