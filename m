Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3060A2E8DE3;
	Sun, 18 Oct 2026 12:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792325218; cv=none; b=lEkcSHsirYHK+VliA7ymb//yHqE8I8QxTf7e4ZKwxZnfnxw3XE5Vby2BK14lot2M0Dj+FKP13ruV5QPWiabWoefAKJ2+OfTKfPN3iVHzs3nP23LWFaYTLzO47SkJ8jwO0Saro5aW0U0sqkS36g6cdkKePrRPNDu7PkOsFJ5LTsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792325218; c=relaxed/simple;
	bh=P8h1IYxU4NbNXkhQpcd+ujfKOQm7ULC9ImQuf/fxO3s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z9s656hPXEwJXzjY5W7WhCkdhZlPT89hmNcsnYufxm1/eXAG9IajzI/O/pKKgEKa0V5NPF0LHy5bkqDxWS7DJHD+1sZ+BZZjSU/WPc1Q1eRytA+tcmN9gg4GbrSnbByWh1UApLNZUOxq9QG48JCU3C94P9EaX5qiDcWvLxvJV3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/h+Yo94; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/h+Yo94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792325216; x=1823861216;
  h=date:from:to:cc:subject:message-id;
  bh=P8h1IYxU4NbNXkhQpcd+ujfKOQm7ULC9ImQuf/fxO3s=;
  b=V/h+Yo94ignsUzfeYBR5Jx2ZWn+Gs5lWBp/R8Jgr6fTjSbiRDZ4rHtXE
   gYVtLHSSCoAjrk93tUcQqwmqvJsBXmXgIopDJSEKy2+Ztoel0tt30Gx0j
   UjOh09CbwJu/ALfOUJ5kUzS0IYUV8w0079b7/PlT4qHytOZ5Bb7rvkm/q
   w8LL+cExj8gWV1TRuthvPmPihuFzYIoKgzr74u/jPd2v5gax7SqUiLPhJ
   iN1nkavs7hJCnZnF7INn5aeTi/n7a0te2Bwj4jdk1Hi7sdfzc1mlSsZdz
   hRNKDRHFPwhxXD/L0PVUk7cn2R9g9v6NcuHZ2Dp5zw5scrq8/eCouuB1o
   g==;
X-CSE-ConnectionGUID: bIZVvFxMQiGKeq0U55LTXA==
X-CSE-MsgGUID: TGX29wPVRd6bD/f1JcR3Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="937249"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="937249"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 05:06:55 -0700
X-CSE-ConnectionGUID: iYMhZoRVQ7ChNF+m07SX7w==
X-CSE-MsgGUID: DlMZbNh+Qdypy1TVWGSssg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4064906"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 18 Oct 2026 05:06:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIPf8-00000000KOE-2aZF;
	Sun, 18 Oct 2026 12:06:50 +0000
Date: Sun, 18 Oct 2026 20:06:45 +0800
From: kernel test robot <lkp@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alexei Starovoitov <ast@kernel.org>
Subject: [bpf-next:master 35/79] kernel/bpf/hashtab.c:1292:14: error:
 call to undeclared function 'arch_cmpxchg_local'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610182048.aEaiBP8W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   a6303535c2ad9d49598d52556183911f02287791
commit: ccb88db8dac8fabde58656d5d4a33711e89c480a [35/79] bpf: Don't hand out a linked element as extra element
config: hexagon-randconfig-1001-20261018 (https://download.01.org/0day-ci/archive/20261018/202610182048.aEaiBP8W-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610182048.aEaiBP8W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610182048.aEaiBP8W-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/bpf/hashtab.c:1292:14: error: call to undeclared function 'arch_cmpxchg_local'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1292 |                         } while (!try_cmpxchg_local(pl_new, &l_new, NULL));
         |                                   ^
   include/linux/atomic/atomic-instrumented.h:5022:2: note: expanded from macro 'try_cmpxchg_local'
    5022 |         raw_try_cmpxchg_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:392:9: note: expanded from macro 'raw_try_cmpxchg_local'
     392 |         ___r = raw_cmpxchg_local((_ptr), ___o, (_new)); \
         |                ^
   include/linux/atomic/atomic-arch-fallback.h:384:27: note: expanded from macro 'raw_cmpxchg_local'
     384 | #define raw_cmpxchg_local arch_cmpxchg_local
         |                           ^
>> kernel/bpf/hashtab.c:1292:14: error: incompatible integer to pointer conversion assigning to 'typeof (*(__ai_ptr))' (aka 'struct htab_elem *') from 'int' [-Wint-conversion]
    1292 |                         } while (!try_cmpxchg_local(pl_new, &l_new, NULL));
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:5022:2: note: expanded from macro 'try_cmpxchg_local'
    5022 |         raw_try_cmpxchg_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:392:7: note: expanded from macro 'raw_try_cmpxchg_local'
     392 |         ___r = raw_cmpxchg_local((_ptr), ___o, (_new)); \
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/arch_cmpxchg_local +1292 kernel/bpf/hashtab.c

  1268	
  1269	static struct htab_elem *alloc_htab_elem(struct bpf_htab *htab, void *key,
  1270						 void *value, u32 key_size, u32 hash,
  1271						 bool percpu, bool onallcpus,
  1272						 struct htab_elem *old_elem, u64 map_flags)
  1273	{
  1274		u32 size = htab->map.value_size;
  1275		bool prealloc = htab_is_prealloc(htab);
  1276		struct htab_elem *l_new, **pl_new;
  1277		void __percpu *pptr;
  1278	
  1279		if (prealloc) {
  1280			if (old_elem) {
  1281				/* if we're updating the existing element,
  1282				 * use per-cpu extra elems to avoid freelist_pop/push.
  1283				 * The caller puts old_elem into the slot once it is
  1284				 * unlinked. Until then the slot is empty for an NMI
  1285				 * or a kprobe that updates this map on this cpu.
  1286				 */
  1287				pl_new = this_cpu_ptr(htab->extra_elems);
  1288				l_new = READ_ONCE(*pl_new);
  1289				do {
  1290					if (!l_new)
  1291						return ERR_PTR(-EBUSY);
> 1292				} while (!try_cmpxchg_local(pl_new, &l_new, NULL));
  1293			} else {
  1294				struct pcpu_freelist_node *l;
  1295	
  1296				l = __pcpu_freelist_pop(&htab->freelist);
  1297				if (!l)
  1298					return ERR_PTR(-E2BIG);
  1299				l_new = container_of(l, struct htab_elem, fnode);
  1300				bpf_map_inc_elem_count(&htab->map);
  1301			}
  1302		} else {
  1303			void *container;
  1304	
  1305			if (is_map_full(htab))
  1306				if (!old_elem)
  1307					/* when map is full and update() is replacing
  1308					 * old element, it's ok to allocate, since
  1309					 * old element will be freed immediately.
  1310					 * Otherwise return an error
  1311					 */
  1312					return ERR_PTR(-E2BIG);
  1313			inc_elem_count(htab);
  1314			container = bpf_mem_cache_alloc(&htab->ma);
  1315			if (!container) {
  1316				l_new = ERR_PTR(-ENOMEM);
  1317				goto dec_count;
  1318			}
  1319			l_new = container + htab->elem_offset;
  1320		}
  1321	
  1322		if (htab_has_hash(htab))
  1323			memcpy(l_new->key, key, key_size);
  1324	
  1325		if (percpu) {
  1326			if (prealloc) {
  1327				pptr = htab_elem_get_ptr(l_new, key_size);
  1328			} else {
  1329				/* alloc_percpu zero-fills */
  1330				void *ptr = bpf_mem_cache_alloc(&htab->pcpu_ma);
  1331	
  1332				if (!ptr) {
  1333					bpf_mem_cache_free(&htab->ma, htab_elem_container(htab, l_new));
  1334					l_new = ERR_PTR(-ENOMEM);
  1335					goto dec_count;
  1336				}
  1337				htab_elem_set_ptr_to_pptr(htab, l_new, ptr);
  1338				pptr = *(void __percpu **)ptr;
  1339			}
  1340	
  1341			pcpu_init_value(htab, pptr, value, onallcpus, map_flags);
  1342	
  1343			if (!prealloc)
  1344				htab_elem_set_ptr(l_new, key_size, pptr);
  1345		} else if (fd_htab_map_needs_adjust(htab)) {
  1346			size = round_up(size, 8);
  1347			memcpy(htab_elem_value(l_new, key_size), value, size);
  1348		} else if (map_flags & BPF_F_LOCK) {
  1349			copy_map_value_locked(&htab->map,
  1350					      htab_elem_value(l_new, key_size),
  1351					      value, false);
  1352		} else {
  1353			copy_map_value(&htab->map, htab_elem_value(l_new, key_size), value);
  1354		}
  1355	
  1356		if (htab_has_hash(htab))
  1357			htab_elem_set_hash(l_new, hash);
  1358		else
  1359			WRITE_ONCE(*(unsigned long *)l_new->key,
  1360				   htab_zero_extend_key(key, key_size));
  1361		return l_new;
  1362	dec_count:
  1363		dec_elem_count(htab);
  1364		return l_new;
  1365	}
  1366	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
