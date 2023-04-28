Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A193C1D;
	Fri, 28 Apr 2023 13:25:59 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Q7Cr62NnTz9sq1;
	Fri, 28 Apr 2023 15:19:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1682687974;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FJlju9q/eAU8ml78a1QSBBVVPLx9rSH3QXnsOVJfvYs=;
	b=Eseaet8TiXC+lDflCmfqa8prVUWyyPIGWW6RCEydsSquXFNsjcZh0HXnxjKJOCEwDc2kZc
	zhL5wPyoJu/KPJey1ijcIb6bmQlzK9APjcUW568SjHWFDC7nSj/nWDMIVN6+X7Rztwv88k
	Gt22HvbdzCUZEc0nP2R2G/HHFmZf9kKrFBjNmFwTUlwVoLbNzQU7hrFuU7QU3v3ciqb3ta
	OG6TeJ5rsnvrwlutix2m5llaJKwyazHng39ZGMHhbBImLoUyct5mhV9Uzk/CZl7IpWiJl4
	oSU546TOHYBNLdEbnBW6Hv/Z2dWa/dzkikul6uVrDALw7+kVGa5Oyo9AMSDDCg==
Message-ID: <07ac0981b78fa9d12c549a6ad9fbadb0c7308cad.camel@mailbox.org>
Subject: Re: Library: [RFC PATCH] btree_blue - a btree with linear travesal
 function and more
From: liuwf <liuwf@mailbox.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	=?ISO-8859-1?Q?J=F6rn?= Engel
	 <joern@purestorage.com>, Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 28 Apr 2023 09:18:18 -0400
In-Reply-To: <202304250319.8IOPqkLH-lkp@intel.com>
References: <6d35bd15e3ec81bcde81b776a369d47ee1f373d2.camel@mailbox.org>
	 <202304250319.8IOPqkLH-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: p919wemu45hsmyqrym9jmgtn773rwsp9
X-MBO-RS-ID: c0db376ba55feecd4ee

On Tue, 2023-04-25 at 03:31 +0800, kernel test robot wrote:
> Hi liuwf,
> 
> [This is a private test report for your RFC patch.]
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on v6.3 next-20230424]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/liuwf/Library-RFC-PATCH-btree_blue-a-btree-with-linear-travesal-function-and-more/20230424-214853
> base:   linus/master
> patch link:    https://lore.kernel.org/r/6d35bd15e3ec81bcde81b776a369d47ee1f373d2.camel%40mailbox.org
> patch subject: Library: [RFC PATCH] btree_blue - a btree with linear travesal function and more
> config: i386-randconfig-a002-20230424 (https://download.01.org/0day-ci/archive/20230425/202304250319.8IOPqkLH-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/749f2fb7789008fd7bb23287c37f4f5aaed09f25
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review liuwf/Library-RFC-PATCH-btree_blue-a-btree-with-linear-travesal-function-and-more/20230424-214853
>         git checkout 749f2fb7789008fd7bb23287c37f4f5aaed09f25
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash lib/
> 
> If you fix the issue, kindly add following tag where applicable
> > Reported-by: kernel test robot <lkp@intel.com>
> > Link: https://lore.kernel.org/oe-kbuild-all/202304250319.8IOPqkLH-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> > > lib/btree_blue.c:109:5: warning: no previous prototype for function 'getpos' [-Wmissing-prototypes]
>    int getpos(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
>        ^
>    lib/btree_blue.c:109:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int getpos(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
>    ^
>    static 
> > > lib/btree_blue.c:144:5: warning: no previous prototype for function 'geteqv' [-Wmissing-prototypes]
>    int geteqv(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
>        ^
>    lib/btree_blue.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    int geteqv(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
>    ^
>    static 
> > > lib/btree_blue.c:392:7: warning: no previous prototype for function 'btree_blue_prev_or_next' [-Wmissing-prototypes]
>    void *btree_blue_prev_or_next(struct btree_blue_head *head, 
>          ^
>    lib/btree_blue.c:392:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    void *btree_blue_prev_or_next(struct btree_blue_head *head, 
>    ^
>    static 
>    lib/btree_blue.c:255:12: warning: unused function 'getpos_bin' [-Wunused-function]
>    static int getpos_bin(struct btree_blue_head *head, struct btree_blue_node_cb *cb, 
>               ^
>    lib/btree_blue.c:277:12: warning: unused function 'geteqv_bin' [-Wunused-function]
>    static int geteqv_bin(struct btree_blue_head *head, 
>               ^
>    5 warnings generated.
> 
> 
> vim +/getpos +109 lib/btree_blue.c
> 
>    108  
>  > 109  int getpos(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
>    110  {
>    111          int i, o, x, nr, p, c;
>    112  
>    113          nr = cb->slots_info.slots_nr;
>    114          x = nr / 8;
>    115  
>    116          for (i = 1; i <= x; i++) {
>    117                  p = i * 8 - 1;
>    118                  c = keycmp(head, cb, p, key);
>    119                  if (c < 0) {
>    120                          o = (i - 1) * 8;
>    121                          for (i = 0; i < 7; i++) {
>    122                                  p = o + i;
>    123                                  c = keycmp(head, cb, p, key);
>    124                                  if (c <= 0) {
>    125                                          return p;
>    126                                  }
>    127                          }
>    128                          return o + 7;
>    129                  } else if (c == 0)
>    130                          return p;
>    131          }
>    132          
>    133          o = x * 8;
>    134          for (i = 0; i < nr % 8; i++) {
>    135                  p =  o + i;
>    136                  c = keycmp(head, cb, p, key);
>    137                  if (c <= 0)
>    138                          return p;
>    139          }
>    140  
>    141          return nr;
>    142  }
>    143  
>  > 144  int geteqv(struct btree_blue_head *head, struct btree_blue_node_cb *cb, unsigned long *key)
>    145  {
>    146          int i, o, x, nr, p, c;
>    147  
>    148          nr = cb->slots_info.slots_nr;
>    149          x = nr / 8;
>    150  
>    151          for (i = 1; i <= x; i++) {
>    152                  p = i * 8 - 1;
>    153                  c = keycmp(head, cb, p, key);
>    154                  if (c < 0) {
>    155                          o = (i - 1) * 8;
>    156                          for (i = 0; i < 7; i++) {
>    157                                  p =  o + i;
>    158                                  c = keycmp(head, cb, p, key);
>    159                                  if (c != 0)
>    160                                          continue;
>    161                                  else
>    162                                          return p;
>    163                          }
>    164                          return nr;
>    165                  } else if (c == 0)
>    166                          return p;
>    167          }
>    168          
>    169          o = x * 8;
>    170          for (i = 0; i < nr % 8; i++) {
>    171                  p =  o + i;
>    172                  c = keycmp(head, cb, p, key);
>    173                  if (c == 0)
>    174                          return p;
>    175          }
>    176  
>    177          return nr;
>    178  }
>    179  
> 

thanks very much. following is the new version and test data.

This version(V4) removed some struct members, code pathes that are reserved 
in the V1 for feature, but I think they are not needed any more, so this 
lighter version of can get a bit more perf than V1.

This round of test is based on the kernel version 6.2.6. Again, the results 
may be unfair for those competitors, for example, maple tree is RCU-safe and 
can deal with many complex cases, rbtree support duplicated keys, lib/btree's 
grace has virtue itself ...


btree_blue also needs to mature (debug, stable), and some APIs are needed to 
give.


*** ***

1. Test for btree_blue used 512 bytes of node size. 

1000000 inserts to a empty tree ...

					btree	rbtree	maple tree
** btree_blue is faster than others	50%	280%	460%

maple tree 1000000 inserts use time: 	1129420872 ns
rbtree 1000000 inserts use time: 	 758329853 ns
btree 1000000 inserts use time: 	 297686337 ns
btree_blue 1000000 inserts use time: 	 198420840 ns


1000000 searches ...

** btree_blue, btree and maple tree almost got the same rate, and all faster 
about 100% than rbtree, btree_blue is 120% faster than rbtree and 20% faster
than the second(btree).

maple tree 1000000 searches use time: 	246779363 ns
rbtree 1000000 searches use time: 	454345925 ns
btree 1000000 searches use time: 	248777441 ns
btree_blue 1000000 searches use time: 	202541097 ns


1000000 mixed insert + delete based on a tree which has 1000000 keys ...

						btree	rbtree	maple tree
** btree_blue is faster than others		30%	170%	330%

maple tree 1000000 mixed insert + delete use time: 	2463726326 ns
rbtree 1000000 mixed insert + delete use time: 		1551667381 ns
btree 1000000 mixed insert + delete use time: 		 755925805 ns
btree_blue 1000000 mixed insert + delete use time: 	 572306495 ns


delete a tree which has 1000000 keys to empty ...

						btree	rbtree	maple tree
** btree_blue is faster than others		30%	150%	640%

maple tree 1000000 deletes use time: 		1624949238 ns
rbtree 1000000 deletes use time: 		 556931279 ns
btree 1000000 deletes use time: 		 299593684 ns
btree_blue 1000000 deletes use time: 		 217870837 ns



*** ***

2. Test for btree_blue used 4096 bytes of node size


btree_blue droped some rate than it's perf with 512 bytes of node size in two
test category, but is still some fast among the fours. Surprisingly, search 
rate of btree_blue with 4096 bytes of node size is bit faster than it's perf 
with 512 bytes node size.

1000000 inserts to a empty tree ...

						btree	rbtree	maple tree
** btree_blue is faster than others		20%	110%	280%

maple tree 1000000 inserts use time: 		1034704010 ns
rbtree 1000000 inserts use time: 		 576622058 ns
btree 1000000 inserts use time: 		 335227184 ns
btree_blue 1000000 inserts use time: 		 270671222 ns


1000000 searches ...
						btree	rbtree	maple tree
** btree_blue is faster than others		30%	150%	40%

maple tree 1000000 searches use time: 		251009597 ns
rbtree 1000000 searches use time: 		452514099 ns
btree 1000000 searches use time: 		240169006 ns
btree_blue 1000000 searches use time: 		175108819 ns


1000000 mixed insert + delete based on a tree which has 1000000 keys ...

							btree	rbtree	maple tree
** btree_blue is faster than others			15%	130%	270%

maple tree 1000000 mixed insert + delete use time: 	2408988939 ns
rbtree 1000000 mixed insert + delete use time: 		1481094124 ns
btree 1000000 mixed insert + delete use time: 		 749438077 ns
btree_blue 1000000 mixed insert + delete use time: 	 638332253 ns


delete a tree which has 1000000 keys to empty ...

						btree	rbtree	maple tree
** btree_blue is faster than others		40%	160%	670%

maple tree 1000000 deletes use time: 		1637768019 ns
rbtree 1000000 deletes use time: 		 555470350 ns
btree 1000000 deletes use time: 		 314487857 ns
btree_blue 1000000 deletes use time: 		 212205682 ns

Signed-off-by: Liu Weifeng 4019c26b5c0d5f6b <liuwf@mailbox.org>
---
 include/linux/btree_blue.h |  83 ++++
 lib/Kconfig                |   4 +
 lib/Makefile               |   1 +
 lib/btree_blue.c           | 994 +++++++++++++++++++++++++++++++++++++
 4 files changed, 1082 insertions(+)
 create mode 100644 include/linux/btree_blue.h
 create mode 100644 lib/btree_blue.c

diff --git a/include/linux/btree_blue.h b/include/linux/btree_blue.h
new file mode 100644
index 000000000000..67a20752d0f6
--- /dev/null
+++ b/include/linux/btree_blue.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef BTREE_BLUE_H
+#define BTREE_BLUE_H
+
+#include <linux/kernel.h>
+#include <linux/mempool.h>
+
+#define MAX_TREE_HEIGHT 8
+#define MIN_SLOTS_NUMBER 16
+#define MIN_NODE_SIZE (MIN_SLOTS_NUMBER * 2 * sizeof(unsigned long))
+
+#define GET_PREV 0
+#define GET_NEXT 1
+
+struct btree_blue_head;
+struct btree_blue_node_cb;
+
+struct btree_blue_head {
+	unsigned long *node;
+	mempool_t *mempool;
+
+	u16 node_size;
+	u16 stub_base;
+	u8 keylen;
+	u8 slot_width;
+	u8 height;
+	u8 reserved[1];
+
+	u16 vols[MAX_TREE_HEIGHT + 1];
+};
+
+void *btree_blue_alloc(gfp_t gfp_mask, void *pool_data);
+
+void btree_blue_free(void *element, void *pool_data);
+
+int __must_check btree_blue_init(struct btree_blue_head *head,
+				 int node_size_in_byte, int key_len_in_byte,
+				 int flags);
+
+void btree_blue_destroy(struct btree_blue_head *head);
+
+void *btree_blue_lookup(struct btree_blue_head *head, unsigned long *key);
+
+int __must_check btree_blue_insert(struct btree_blue_head *head,
+				   unsigned long *key, void *val, gfp_t gfp);
+
+int btree_blue_update(struct btree_blue_head *head, unsigned long *key,
+		      void *val);
+
+void *btree_blue_remove(struct btree_blue_head *head, unsigned long *key);
+
+void *btree_blue_first(struct btree_blue_head *head, unsigned long *__key);
+void *btree_blue_last(struct btree_blue_head *head, unsigned long *__key);
+
+void *btree_blue_get_prev(struct btree_blue_head *head, unsigned long *__key);
+void *btree_blue_get_next(struct btree_blue_head *head, unsigned long *__key);
+
+typedef bool (*btree_blue_traverse_FN_T)(const unsigned long *key,
+					 const void *val);
+
+/*
+ * Visit each key-value pair started from the @key and continue toward
+ * @prev_or_next until the last or fisrt.
+ *
+ * IF @key is given NULL, visit starts with the last(the biggest) key and walk
+ * toward the smallest.
+ *
+ * @prev_or_next, bool value to specify the visit direction.
+ *
+ * @callback. Your function that is called in the visit loop with each key-value
+ * visited.
+ * If a function like : bool myfunc(const unsigned long *key, const void *val)
+ * is given to the param @callback, you will see every *key and *val from the
+ * start @key(included, and it's value). Your function's return value of 0
+ * indicates to continue visit and 1 to exit the loop.
+ *
+ * */
+size_t btree_blue_traverse_from_key(struct btree_blue_head *head,
+				    unsigned long *key,
+				    btree_blue_traverse_FN_T callback,
+				    bool prev_or_next);
+
+#endif
diff --git a/lib/Kconfig b/lib/Kconfig
index ce2abffb9ed8..0e15f0b0781f 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -466,6 +466,10 @@ config TEXTSEARCH_FSM
 config BTREE
 	bool
 
+config BTREE_BLUE
+	tristate
+	default m
+
 config INTERVAL_TREE
 	bool
 	help
diff --git a/lib/Makefile b/lib/Makefile
index 4d9461bfea42..304b265fc736 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -152,6 +152,7 @@ obj-$(CONFIG_TRACE_MMIO_ACCESS) += trace_readwrite.o
 obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
 
 obj-$(CONFIG_BTREE) += btree.o
+obj-$(CONFIG_BTREE_BLUE) += btree_blue.o
 obj-$(CONFIG_INTERVAL_TREE) += interval_tree.o
 obj-$(CONFIG_ASSOCIATIVE_ARRAY) += assoc_array.o
 obj-$(CONFIG_DEBUG_PREEMPT) += smp_processor_id.o
diff --git a/lib/btree_blue.c b/lib/btree_blue.c
new file mode 100644
index 000000000000..496e0a1ad3c9
--- /dev/null
+++ b/lib/btree_blue.c
@@ -0,0 +1,994 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/btree_blue.h>
+#include <linux/cache.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+
+#define LONG_PER_U64 (64 / BITS_PER_LONG)
+#define MAX_KEYLEN (2 * LONG_PER_U64)
+#define VALUE_LEN (sizeof(unsigned long))
+
+struct btree_blue_slots_info {
+#if (BITS_PER_LONG == 32)
+	u16 slots_nr;
+	u16 offset;
+#else
+	u16 slots_nr;
+	u16 offset;
+	u16 reserved_a;
+	u16 reserved_b;
+#endif
+};
+
+struct btree_blue_node_cb {
+	struct btree_blue_slots_info slots_info;
+	unsigned long slots_base[];
+};
+
+struct btree_blue_stub {
+	unsigned long *prev;
+	unsigned long *next;
+};
+
+static struct kmem_cache *btree_blue_cachep;
+
+void *btree_blue_alloc(gfp_t gfp_mask, void *pool_data)
+{
+	return kmem_cache_alloc(btree_blue_cachep, gfp_mask);
+}
+EXPORT_SYMBOL_GPL(btree_blue_alloc);
+
+void btree_blue_free(void *element, void *pool_data)
+{
+	kmem_cache_free(btree_blue_cachep, element);
+}
+EXPORT_SYMBOL_GPL(btree_blue_free);
+
+static unsigned long *btree_blue_node_alloc(struct btree_blue_head *head,
+					    gfp_t gfp)
+{
+	unsigned long *node;
+
+	node = mempool_alloc(head->mempool, gfp);
+	if (likely(node))
+		memset(node, 0, head->node_size);
+	return node;
+}
+
+static int longcmp(const unsigned long *l1, const unsigned long *l2, size_t n)
+{
+	size_t i;
+
+	for (i = 0; i < n; i++) {
+		if (l1[i] < l2[i])
+			return -1;
+		if (l1[i] > l2[i])
+			return 1;
+	}
+	return 0;
+}
+
+static unsigned long *longcpy(unsigned long *dest, const unsigned long *src,
+			      size_t n)
+{
+	size_t i;
+
+	for (i = 0; i < n; i++)
+		dest[i] = src[i];
+	return dest;
+}
+
+static unsigned long *bkey(struct btree_blue_head *head,
+			   struct btree_blue_node_cb *cb, int n)
+{
+	return cb->slots_base + n * head->slot_width + 1;
+}
+
+static void *bval(struct btree_blue_head *head, struct btree_blue_node_cb *cb,
+		  int n)
+{
+	return (void *)(cb->slots_base[n * head->slot_width]);
+}
+
+static void setkey(struct btree_blue_head *head, struct btree_blue_node_cb *cb,
+		   int n, unsigned long *key)
+{
+	longcpy(bkey(head, cb, n), key, head->keylen);
+}
+
+static void setval(struct btree_blue_head *head, struct btree_blue_node_cb *cb,
+		   int n, void *val)
+{
+	cb->slots_base[n * head->slot_width] = (unsigned long)val;
+}
+
+static int keycmp(struct btree_blue_head *head, struct btree_blue_node_cb *cb,
+		  int pos, unsigned long *key)
+{
+	return longcmp(bkey(head, cb, pos), key, head->keylen);
+}
+
+static int getpos(struct btree_blue_head *head, struct btree_blue_node_cb *cb,
+		  unsigned long *key)
+{
+	int nr, q, r, i, p, c;
+
+	nr = cb->slots_info.slots_nr;
+	q = nr / 8;
+
+	for (i = 1; i <= q; i++) {
+		p = i * 8 - 1;
+		c = keycmp(head, cb, p, key);
+		if (c < 0) {
+			p = (i - 1) * 8;
+			for (i = 0; i < 7; i++) {
+				c = keycmp(head, cb, p, key);
+				if (c <= 0)
+					return p;
+				p++;
+			}
+			return p;
+
+		} else if (c == 0)
+			return p;
+	}
+
+	p = q * 8;
+	r = nr % 8;
+	for (i = 0; i < r; i++) {
+		c = keycmp(head, cb, p, key);
+		if (c <= 0)
+			return p;
+		p++;
+	}
+
+	return nr;
+}
+
+static int geteqv(struct btree_blue_head *head, struct btree_blue_node_cb *cb,
+		  unsigned long *key)
+{
+	int nr, q, r, i, p, c;
+
+	nr = cb->slots_info.slots_nr;
+	q = nr / 8;
+
+	for (i = 1; i <= q; i++) {
+		p = i * 8 - 1;
+		c = keycmp(head, cb, p, key);
+		if (c < 0) {
+			p = (i - 1) * 8;
+			for (i = 0; i < 7; i++) {
+				c = keycmp(head, cb, p, key);
+				if (c == 0)
+					return p;
+				p++;
+			}
+			return nr;
+		} else if (c == 0)
+			return p;
+	}
+
+	p = q * 8;
+	r = nr % 8;
+	for (i = 0; i < r; i++) {
+		c = keycmp(head, cb, p, key);
+		if (c == 0)
+			return p;
+		p++;
+	}
+
+	return nr;
+}
+
+/* binary search */
+/*
+static int getpos(struct btree_blue_head *head,
+		      struct btree_blue_node_cb *cb, unsigned long *key)
+{
+	int l = 0;
+	int h = cb->slots_info.slots_nr;
+	int m, ret;
+
+	while (l < h) {
+		m = (l + h) / 2;
+		ret = keycmp(head, cb, m, key);
+
+		if (ret < 0)
+			h = m;
+		else if (ret > 0)
+			l = m + 1;
+		else
+			return m;
+	}
+
+	return h;
+}
+
+static int geteqv(struct btree_blue_head *head,
+		      struct btree_blue_node_cb *cb, unsigned long *key)
+{
+	int l = 0;
+	int h, nr = cb->slots_info.slots_nr;
+	int m, ret;
+
+	while (l < h) {
+		m = (l + h) / 2;
+		ret = keycmp(head, cb, m, key);
+
+		if (ret < 0)
+			h = m;
+		else if (ret > 0)
+			l = m + 1;
+		else
+			return m;
+	}
+
+	return nr;
+}
+ */
+
+static inline struct btree_blue_stub *__get_stub(struct btree_blue_head *head,
+						 struct btree_blue_node_cb *cb)
+{
+	return (struct btree_blue_stub *)((char *)cb + head->stub_base);
+}
+
+static inline void _shift_slots(struct btree_blue_head *head,
+				struct btree_blue_node_cb *cb, int dest_slot,
+				int src_slot, size_t slots_nr)
+{
+	unsigned long *d = cb->slots_base + dest_slot * head->slot_width;
+	unsigned long *s = cb->slots_base + src_slot * head->slot_width;
+
+	size_t n = slots_nr * head->slot_width * sizeof(long);
+
+	memmove(d, s, n);
+}
+
+static inline void _transfer_slots(struct btree_blue_head *head,
+				   struct btree_blue_node_cb *dest,
+				   struct btree_blue_node_cb *src,
+				   int dest_slot, int src_slot, size_t slots_nr)
+{
+	unsigned long *d = dest->slots_base + dest_slot * head->slot_width;
+	unsigned long *s = src->slots_base + src_slot * head->slot_width;
+
+	size_t n = slots_nr * head->slot_width * sizeof(long);
+
+	memmove(d, s, n);
+}
+
+static inline int shift_slots_on_insert(struct btree_blue_head *head,
+					struct btree_blue_node_cb *node,
+					int pos, int level)
+{
+	int slots_nr = node->slots_info.slots_nr;
+	_shift_slots(head, node, pos + 1, pos, slots_nr - pos);
+	node->slots_info.slots_nr++;
+	return pos;
+}
+
+static inline void delete_slot(struct btree_blue_head *head,
+			       struct btree_blue_node_cb *node, int pos,
+			       int level)
+{
+	int slots_nr = node->slots_info.slots_nr;
+	_shift_slots(head, node, pos, pos + 1, slots_nr - pos - 1);
+	node->slots_info.slots_nr--;
+}
+
+static inline void split_to_empty(struct btree_blue_head *head,
+				  struct btree_blue_node_cb *dest,
+				  struct btree_blue_node_cb *src, int level)
+{
+	int slots_nr = src->slots_info.slots_nr / 2;
+
+	_transfer_slots(head, dest, src, 0, 0, slots_nr);
+	dest->slots_info.slots_nr += slots_nr;
+
+	_shift_slots(head, src, 0, slots_nr,
+		     src->slots_info.slots_nr - slots_nr);
+	src->slots_info.slots_nr -= slots_nr;
+}
+
+static inline void merge_nodes(struct btree_blue_head *head,
+			       struct btree_blue_node_cb *dest,
+			       struct btree_blue_node_cb *src, int level)
+{
+	int dest_nr, src_nr;
+
+	dest_nr = dest->slots_info.slots_nr;
+	src_nr = src->slots_info.slots_nr;
+
+	_transfer_slots(head, dest, src, dest_nr, 0, src_nr);
+	dest->slots_info.slots_nr += src_nr;
+}
+
+void *btree_blue_first(struct btree_blue_head *head, unsigned long *__key)
+{
+	int height = head->height;
+	struct btree_blue_node_cb *node =
+		(struct btree_blue_node_cb *)head->node;
+
+	if (height == 0)
+		return NULL;
+
+	for (; height > 1; height--)
+		node = bval(head, node, node->slots_info.slots_nr - 1);
+
+	longcpy(__key, bkey(head, node, node->slots_info.slots_nr - 1),
+		head->keylen);
+
+	return bval(head, node, node->slots_info.slots_nr - 1);
+}
+EXPORT_SYMBOL_GPL(btree_blue_first);
+
+void *btree_blue_last(struct btree_blue_head *head, unsigned long *__key)
+{
+	int height = head->height;
+	struct btree_blue_node_cb *node =
+		(struct btree_blue_node_cb *)head->node;
+
+	if (height == 0)
+		return NULL;
+	for (; height > 1; height--)
+		node = bval(head, node, 0);
+
+	longcpy(__key, bkey(head, node, 0), head->keylen);
+
+	return bval(head, node, 0);
+}
+EXPORT_SYMBOL_GPL(btree_blue_last);
+
+static unsigned long *btree_blue_lookup_node(struct btree_blue_head *head,
+					     unsigned long *key)
+{
+	int pos, height;
+	struct btree_blue_node_cb *node;
+
+	height = head->height;
+	if (height == 0)
+		return NULL;
+
+	node = (struct btree_blue_node_cb *)head->node;
+
+	for (; height > 1; height--) {
+		pos = getpos(head, node, key);
+		if (pos == node->slots_info.slots_nr)
+			return NULL;
+
+		node = bval(head, node, pos);
+	}
+
+	return (unsigned long *)node;
+}
+
+void *btree_blue_lookup(struct btree_blue_head *head, unsigned long *key)
+{
+	int pos;
+	struct btree_blue_node_cb *node;
+
+	node = (struct btree_blue_node_cb *)btree_blue_lookup_node(head, key);
+	if (!node)
+		return NULL;
+
+	pos = geteqv(head, node, key);
+	if (pos == node->slots_info.slots_nr)
+		return NULL;
+
+	return bval(head, node, pos);
+}
+EXPORT_SYMBOL_GPL(btree_blue_lookup);
+
+int btree_blue_update(struct btree_blue_head *head, unsigned long *key,
+		      void *val)
+{
+	int pos;
+	struct btree_blue_node_cb *node;
+
+	node = (struct btree_blue_node_cb *)btree_blue_lookup_node(head, key);
+	if (!node)
+		return -ENOENT;
+
+	pos = geteqv(head, node, key);
+	/*pos = geteqv_bin(head, node, key);*/
+
+	if (pos == node->slots_info.slots_nr)
+		return -ENOENT;
+
+	setval(head, node, pos, val);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(btree_blue_update);
+
+void *btree_blue_prev_or_next(struct btree_blue_head *head,
+			      unsigned long *__key, int flag)
+{
+	int i;
+	struct btree_blue_node_cb *node;
+	unsigned long key[MAX_KEYLEN];
+	int slots_nr;
+
+	if (head->height == 0)
+		return NULL;
+
+	longcpy(key, __key, head->keylen);
+
+	node = (struct btree_blue_node_cb *)btree_blue_lookup_node(head, key);
+	if (!node)
+		return NULL;
+
+	slots_nr = node->slots_info.slots_nr;
+	for (i = 0; i < slots_nr; i++)
+		if (keycmp(head, node, i, key) == 0)
+			break;
+	if (i == slots_nr)
+		return NULL;
+
+	if (flag == GET_PREV) {
+		if (++i < slots_nr) {
+			longcpy(__key, bkey(head, node, i), head->keylen);
+			return bval(head, node, i);
+		} else {
+			struct btree_blue_stub *stub = __get_stub(head, node);
+			if (stub->next) {
+				node = (struct btree_blue_node_cb *)(stub->next);
+				longcpy(__key, bkey(head, node, 0),
+					head->keylen);
+				return bval(head, node, 0);
+			} else
+				return NULL;
+		}
+	}
+
+	/* GET_NEXT  */
+
+	if (i > 0) {
+		--i;
+		longcpy(__key, bkey(head, node, i), head->keylen);
+		return bval(head, node, i);
+	} else {
+		struct btree_blue_stub *stub = __get_stub(head, node);
+		if (stub->prev) {
+			node = (struct btree_blue_node_cb *)(stub->prev);
+			longcpy(__key,
+				bkey(head, node, node->slots_info.slots_nr - 1),
+				head->keylen);
+			return bval(head, node, 0);
+		} else
+			return NULL;
+	}
+}
+
+void *btree_blue_get_prev(struct btree_blue_head *head, unsigned long *__key)
+{
+	return btree_blue_prev_or_next(head, __key, GET_PREV);
+}
+EXPORT_SYMBOL_GPL(btree_blue_get_prev);
+
+void *btree_blue_get_next(struct btree_blue_head *head, unsigned long *__key)
+{
+	return btree_blue_prev_or_next(head, __key, GET_NEXT);
+}
+EXPORT_SYMBOL_GPL(btree_blue_get_next);
+
+size_t btree_blue_traverse_from_key(struct btree_blue_head *head,
+				    unsigned long *key,
+				    btree_blue_traverse_FN_T callback,
+				    bool prev_or_next)
+{
+	struct btree_blue_node_cb *node;
+	struct btree_blue_stub *stub;
+	int i, slots_nr, height;
+	bool term;
+	unsigned long found_key[MAX_KEYLEN];
+	unsigned long found_val;
+	size_t total = 0;
+
+	height = head->height;
+	if (height == 0)
+		return total;
+
+	node = (struct btree_blue_node_cb *)(head->node);
+
+	if (key == NULL) {
+		for (; height > 1; height--)
+			node = bval(head, node, 0);
+
+		i = 0;
+		slots_nr = node->slots_info.slots_nr;
+		longcpy(found_key, bkey(head, node, i), head->keylen);
+		found_val = (unsigned long)bval(head, node, i);
+		term = callback((const unsigned long *)(&found_key),
+				(const void *)found_val);
+		total++;
+		if (term)
+			return total;
+		else
+			goto TRAVERSE;
+	}
+
+	node = (struct btree_blue_node_cb *)btree_blue_lookup_node(head, key);
+	if (!node)
+		return total;
+
+	slots_nr = node->slots_info.slots_nr;
+	for (i = 0; i < slots_nr; i++)
+		if (keycmp(head, node, i, (unsigned long *)key) == 0)
+			break;
+
+	if (i == slots_nr)
+		return total;
+
+	longcpy(found_key, bkey(head, node, i), head->keylen);
+	found_val = (unsigned long)bval(head, node, i);
+	term = callback((const unsigned long *)(&found_key),
+			(const void *)found_val);
+	total++;
+	if (term)
+		return total;
+
+TRAVERSE:
+
+	if (prev_or_next == GET_PREV) {
+		i = i + 1;
+		do {
+			if (i < slots_nr) {
+				longcpy(found_key, bkey(head, node, i),
+					head->keylen);
+				found_val = (unsigned long)bval(head, node, i);
+				term = callback(
+					(const unsigned long *)(&found_key),
+					(const void *)found_val);
+				total++;
+				if (term)
+					return total;
+				i++;
+			} else {
+				stub = __get_stub(head, node);
+				if (stub->next) {
+					node = (struct btree_blue_node_cb
+							*)(stub->next);
+					slots_nr = node->slots_info.slots_nr;
+					i = 0;
+				} else
+					return total;
+			}
+		} while (true);
+	}
+
+	/* GET_NEXT */
+	i = i - 1;
+	do {
+		if (i >= 0) {
+			longcpy(found_key, bkey(head, node, i), head->keylen);
+			found_val = (unsigned long)bval(head, node, i);
+			term = callback((const unsigned long *)(&found_key),
+					(const void *)found_val);
+			total++;
+			if (term)
+				return total;
+			i--;
+		} else {
+			stub = __get_stub(head, node);
+			if (stub->prev) {
+				node = (struct btree_blue_node_cb *)(stub->prev);
+				i = node->slots_info.slots_nr - 1;
+			} else
+				return total;
+		}
+	} while (true);
+}
+EXPORT_SYMBOL_GPL(btree_blue_traverse_from_key);
+
+static unsigned long *find_level(struct btree_blue_head *head,
+				 unsigned long *key, int level,
+				 struct btree_blue_node_cb **cb_p)
+{
+	struct btree_blue_node_cb *node =
+		(struct btree_blue_node_cb *)head->node;
+	struct btree_blue_node_cb *node_p = node;
+	int height = head->height;
+	int pos;
+
+	for (; height > level; height--) {
+		pos = getpos(head, node, key);
+		if (pos == node->slots_info.slots_nr) {
+			/* right-most key is too large, update it */
+			/* FIXME: If the right-most key on higher levels is
+			 * always zero, this wouldn't be necessary. */
+			pos--;
+			setkey(head, node, pos, key);
+		}
+
+		BUG_ON(pos < 0);
+		node_p = node;
+		node = bval(head, node, pos);
+	}
+
+	BUG_ON(!node);
+	*cb_p = node_p;
+	return (unsigned long *)node;
+}
+
+static int btree_blue_grow(struct btree_blue_head *head, gfp_t gfp)
+{
+	struct btree_blue_node_cb *node, *node_h;
+
+	node = (struct btree_blue_node_cb *)btree_blue_node_alloc(head, gfp);
+	if (!node)
+		return -ENOMEM;
+
+	if (likely(head->node)) {
+		node_h = (struct btree_blue_node_cb *)head->node;
+		setkey(head, node, 0,
+		       bkey(head, node_h, node_h->slots_info.slots_nr - 1));
+		setval(head, node, 0, head->node);
+		node->slots_info.slots_nr = 1;
+	}
+
+	head->node = (unsigned long *)node;
+	head->height++;
+
+	return 0;
+}
+
+static void btree_blue_shrink(struct btree_blue_head *head)
+{
+	struct btree_blue_node_cb *node;
+
+	if (head->height <= 1)
+		return;
+
+	node = (struct btree_blue_node_cb *)head->node;
+	BUG_ON(node->slots_info.slots_nr > 1);
+
+	head->node = bval(head, node, 0);
+	head->height--;
+
+	mempool_free(node, head->mempool);
+}
+
+static int btree_blue_insert_level(struct btree_blue_head *head,
+				   unsigned long *key, void *val, int level,
+				   struct btree_blue_node_cb *found, gfp_t gfp)
+{
+	struct btree_blue_node_cb *cb, *cb_new, *cb_p;
+	int pos, slots_nr, err;
+
+	BUG_ON(!val);
+
+	if (head->height < level) {
+		err = btree_blue_grow(head, gfp);
+		if (err)
+			return err;
+
+		found = 0;
+	}
+
+	if (found) {
+		cb = found;
+		cb_p = NULL;
+	} else
+		cb = (struct btree_blue_node_cb *)find_level(head, key, level,
+							     &cb_p);
+
+	pos = getpos(head, cb, key);
+	/* two identical keys are not allowed */
+	BUG_ON(pos < slots_nr && keycmp(head, cb, pos, key) == 0);
+
+	slots_nr = cb->slots_info.slots_nr;
+
+	if (slots_nr == head->vols[level]) {
+		/* need to split node */
+		struct btree_blue_node_cb *cb_prev;
+		struct btree_blue_stub *stub, *stub_new, *stub_prev;
+
+		cb_new = (struct btree_blue_node_cb *)btree_blue_node_alloc(
+			head, gfp);
+		if (!cb_new)
+			return -ENOMEM;
+
+		err = btree_blue_insert_level(head,
+					      bkey(head, cb, slots_nr / 2 - 1),
+					      cb_new, level + 1, cb_p, gfp);
+		if (err) {
+			mempool_free(cb_new, head->mempool);
+			return err;
+		}
+
+		if (level == 1) {
+			stub = __get_stub(head, cb);
+			stub_new = __get_stub(head, cb_new);
+			stub_new->next = (unsigned long *)cb;
+
+			if (stub->prev) {
+				cb_prev = (struct btree_blue_node_cb
+						   *)(stub->prev);
+				stub_prev = __get_stub(head, cb_prev);
+				stub_prev->next = (unsigned long *)cb_new;
+				stub_new->prev = stub->prev;
+			}
+			stub->prev = (unsigned long *)cb_new;
+		}
+
+		split_to_empty(head, cb_new, cb, level);
+
+		if (pos <= (slots_nr / 2 - 1)) {
+			slots_nr = slots_nr / 2;
+			cb = cb_new;
+		} else {
+			pos = pos - slots_nr / 2;
+			slots_nr = slots_nr - slots_nr / 2;
+		}
+	}
+
+	BUG_ON(slots_nr >= head->vols[level]);
+
+	/* shift and insert */
+	//pos = shift_slots_on_insert(head, cb, pos, level);
+	_shift_slots(head, cb, pos + 1, pos, slots_nr - pos);
+	cb->slots_info.slots_nr++;
+
+	setkey(head, cb, pos, key);
+	setval(head, cb, pos, val);
+
+	return 0;
+}
+
+int btree_blue_insert(struct btree_blue_head *head, unsigned long *key,
+		      void *val, gfp_t gfp)
+{
+	BUG_ON(!val);
+	return btree_blue_insert_level(head, key, val, 1, 0, gfp);
+}
+EXPORT_SYMBOL_GPL(btree_blue_insert);
+
+static void *btree_blue_remove_level(struct btree_blue_head *head,
+				     unsigned long *key, int level);
+
+static void merge(struct btree_blue_head *head, int level,
+		  struct btree_blue_node_cb *cb_left,
+		  struct btree_blue_node_cb *cb_right,
+		  struct btree_blue_node_cb *cb_parent, int lpos)
+{
+	struct btree_blue_node_cb *cb_right_right;
+
+	struct btree_blue_stub *stub_left, *stub_right, *stub_right_right;
+
+	/* Move all keys to the left */
+	merge_nodes(head, cb_left, cb_right, level);
+
+	if (level == 1) {
+		stub_left = __get_stub(head, cb_left);
+		stub_right = __get_stub(head, cb_right);
+
+		if (stub_right->next) {
+			stub_left->next = stub_right->next;
+
+			cb_right_right =
+				(struct btree_blue_node_cb *)(stub_right->next);
+			stub_right_right = __get_stub(head, cb_right_right);
+			stub_right_right->prev = (unsigned long *)cb_left;
+		} else
+			stub_left->next = NULL;
+	}
+
+	/* Exchange left and right child in parent */
+	setval(head, cb_parent, lpos, cb_right);
+	setval(head, cb_parent, lpos + 1, cb_left);
+	/* Remove left (formerly right) child from parent */
+	btree_blue_remove_level(head, bkey(head, cb_parent, lpos), level + 1);
+	mempool_free(cb_right, head->mempool);
+}
+
+static void rebalance(struct btree_blue_head *head, unsigned long *key,
+		      int level, struct btree_blue_node_cb *cb_child,
+		      struct btree_blue_node_cb *cb_p)
+{
+	struct btree_blue_node_cb *cb_parent, *cb_left, *cb_right;
+	struct btree_blue_stub *stub_child, *stub_left, *stub_right;
+	int i;
+	int slots_nr, slots_nr_left, slots_nr_right;
+
+	slots_nr = cb_child->slots_info.slots_nr;
+
+	if (slots_nr == 0) {
+		/* Because we don't steal entries from a neighbour, this case
+		 * can happen.  Parent node contains a single child, this
+		 * node, so merging with a sibling never happens.
+		 */
+		btree_blue_remove_level(head, key, level + 1);
+
+		if (level == 1) {
+			stub_child = __get_stub(head, cb_child);
+			if (stub_child->prev) {
+				cb_left = (struct btree_blue_node_cb
+						   *)(stub_child->prev);
+				stub_left = __get_stub(head, cb_left);
+				stub_left->next = stub_child->next ?
+								stub_child->next :
+								NULL;
+			}
+
+			if (stub_child->next) {
+				cb_right = (struct btree_blue_node_cb
+						    *)(stub_child->next);
+				stub_right = __get_stub(head, cb_right);
+				stub_right->prev = stub_child->prev ?
+								 stub_child->prev :
+								 NULL;
+			}
+		}
+
+		mempool_free(cb_child, head->mempool);
+		return;
+	}
+
+	cb_parent = cb_p;
+
+	i = getpos(head, cb_parent, key);
+	BUG_ON(bval(head, cb_parent, i) != cb_child);
+
+	if (i > 0) {
+		cb_left = bval(head, cb_parent, i - 1);
+		slots_nr_left = cb_left->slots_info.slots_nr;
+
+		if (slots_nr_left + slots_nr <= head->vols[level]) {
+			merge(head, level, cb_left, cb_child, cb_parent, i - 1);
+			return;
+		}
+	}
+
+	if (i + 1 < cb_parent->slots_info.slots_nr) {
+		cb_right = bval(head, cb_parent, i + 1);
+		slots_nr_right = cb_right->slots_info.slots_nr;
+
+		if (slots_nr + slots_nr_right <= head->vols[level]) {
+			merge(head, level, cb_child, cb_right, cb_parent, i);
+			return;
+		}
+	}
+	/*
+	 * We could also try to steal one entry from the left or right
+	 * neighbor.  By not doing so we changed the invariant from
+	 * "all nodes are at least half full" to "no two neighboring
+	 * nodes can be merged".  Which means that the average fill of
+	 * all nodes is still half or better.
+	 */
+}
+
+static void *btree_blue_remove_level(struct btree_blue_head *head,
+				     unsigned long *key, int level)
+{
+	struct btree_blue_node_cb *cb, *cb_p;
+	int pos, slots_nr;
+	void *ret;
+
+	if (level > head->height) {
+		/* we recursed all the way up */
+		head->height = 0;
+		head->node = NULL;
+		return NULL;
+	}
+
+	cb = (struct btree_blue_node_cb *)find_level(head, key, level, &cb_p);
+	slots_nr = cb->slots_info.slots_nr;
+	pos = getpos(head, cb, key);
+
+	if ((level == 1) && (pos == slots_nr))
+		return NULL;
+
+	ret = bval(head, cb, pos);
+
+	/* remove and shift */
+	//delete_slot(head, cb, pos, level);
+	_shift_slots(head, cb, pos, pos + 1, slots_nr - pos - 1);
+	cb->slots_info.slots_nr--;
+
+	if (cb->slots_info.slots_nr < head->vols[level] / 2 - 2) {
+		if (level < head->height)
+			rebalance(head, key, level, cb, cb_p);
+		else if (cb->slots_info.slots_nr == 1)
+			btree_blue_shrink(head);
+	}
+
+	return ret;
+}
+
+void *btree_blue_remove(struct btree_blue_head *head, unsigned long *key)
+{
+	if (head->height == 0)
+		return NULL;
+
+	return btree_blue_remove_level(head, key, 1);
+}
+EXPORT_SYMBOL_GPL(btree_blue_remove);
+
+static inline void __btree_blue_init(struct btree_blue_head *head,
+				     int node_size, int keylen, int flags)
+{
+	int vol;
+
+	head->node = NULL;
+	head->height = 0;
+	head->node_size = node_size;
+	head->keylen = (keylen * 8) / BITS_PER_LONG;
+	head->slot_width = (VALUE_LEN * 8) / BITS_PER_LONG + head->keylen;
+
+	vol = (node_size - sizeof(struct btree_blue_node_cb)) /
+	      (head->slot_width * sizeof(long));
+	for (int i = 2; i < MAX_TREE_HEIGHT + 1; i++)
+		head->vols[i] = vol;
+	vol = (node_size - sizeof(struct btree_blue_node_cb) -
+	       sizeof(struct btree_blue_stub)) /
+	      (head->slot_width * sizeof(long));
+	head->vols[0] = head->vols[1] = vol;
+
+	head->stub_base = sizeof(struct btree_blue_node_cb) +
+			  head->vols[1] * (head->slot_width * sizeof(long));
+}
+
+int __must_check btree_blue_init(struct btree_blue_head *head,
+				 int node_size_in_byte, int key_len_in_byte,
+				 int flags)
+{
+	if (node_size_in_byte % L1_CACHE_BYTES)
+		return -EINVAL;
+
+	if ((node_size_in_byte < MIN_NODE_SIZE) ||
+	    (node_size_in_byte > PAGE_SIZE))
+		return -EINVAL;
+
+#if defined(CONFIG_64BIT) || defined(BUILD_VDSO32_64)
+	if ((key_len_in_byte != sizeof(unsigned long)) &&
+	    (key_len_in_byte != 2 * sizeof(unsigned long)))
+		return -EINVAL;
+#else
+	if ((key_len_in_byte != sizeof(unsigned long)) &&
+	    (key_len_in_byte != 2 * sizeof(unsigned long)) &&
+	    (key_len_in_byte != 4 * sizeof(unsigned long)))
+		return -EINVAL;
+#endif
+
+	btree_blue_cachep = kmem_cache_create("btree_blue_node_cb",
+					      node_size_in_byte, 0,
+					      SLAB_HWCACHE_ALIGN, NULL);
+	if (!btree_blue_cachep)
+		return -ENOMEM;
+
+	__btree_blue_init(head, node_size_in_byte, key_len_in_byte, flags);
+
+	head->mempool =
+		mempool_create(0, btree_blue_alloc, btree_blue_free, NULL);
+	if (!head->mempool)
+		return -ENOMEM;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(btree_blue_init);
+
+void btree_blue_destroy(struct btree_blue_head *head)
+{
+	mempool_free(head->node, head->mempool);
+	mempool_destroy(head->mempool);
+	head->mempool = NULL;
+}
+EXPORT_SYMBOL_GPL(btree_blue_destroy);
+
+static int __init btree_blue_module_init(void)
+{
+	return 0;
+}
+
+static void __exit btree_blue_module_exit(void)
+{
+	kmem_cache_destroy(btree_blue_cachep);
+}
+
+module_init(btree_blue_module_init);
+module_exit(btree_blue_module_exit);
+
+MODULE_LICENSE("GPL");

base-commit: fbe1871b562af6e9cffcf622247e821d1dd16c64
-- 
2.30.2




