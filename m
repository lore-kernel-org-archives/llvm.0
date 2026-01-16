Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C752FF17D;
	Fri, 16 Jan 2026 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768551422; cv=none; b=MWeWUDW60FppmGAV2ZoaneR60BN4IyM6FuIUpBmYgPDgSqX0YboEA8oEHbFhstWqJ+wOUu0wssbH1SF5ooNnwaYp2XGl8tgFbK6lpzAJVCCvpHL6C3Qoz6KX3zt71L8GviC7UOTKCa4baCAnkdGdRpzzc4avIawHjjsQ0bDuudQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768551422; c=relaxed/simple;
	bh=cU+XMlUEGqGsZ/KBXWrhb6wtu9+6X3kjZ0yKE1IdGs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=unDFuXNUsvMA7dcofxJImcocPu4bWscqMosSVQyLwr/pUxTSHsdIZz8enmw5g3gi3dUn3lxjtyhuXg7uN7iqCgVnK2epkW51s1evh/wwqXTpyCsVkw+sUfkQz3a2YRyoG7CPXK6o9L0/kVi8Mf/gnDM9cuzxwEprLTCGSn4Eh4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=odNwwNec; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="odNwwNec"
Message-ID: <a8128951-326d-454e-84e2-8b7cdf797b8d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768551417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=va5y78fPbO6HA34/xMGaqzzkSeRtvgy8KJanB9u0Cr8=;
	b=odNwwNecNIf0Ft8H8tjIBF938/D2/r2/n6GtfKcOSW4+WwsQZn1t+Agy/ZITt4P3nVd4H7
	SnnWYN9h+XNT93n0GeZQdJIvyonnr0oztauH2EIQsifEJptIoUWv95hdTYFRmZxVwQU/2G
	TPirkCrNacTJ1ucYyDzCeKRtOGBJhC4=
Date: Fri, 16 Jan 2026 16:16:31 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU
 pages for lruvec lock
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch@bytedance.com>
 <202601152057.xgusZpKm-lkp@intel.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <202601152057.xgusZpKm-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

The compilation problem I see in the report occurs under the following
configuration:

1. enable CONFIG_WARN_CONTEXT_ANALYSIS_ALL
2. make CC=clang bzImage

Could you please test whether the following fixes can resolve the
compilation issue?

Thanks!

```
diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index e0b84b109b7ac..f28c5ef9bf604 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -742,15 +742,9 @@ struct mem_cgroup *get_mem_cgroup_from_current(void);
  struct mem_cgroup *get_mem_cgroup_from_folio(struct folio *folio);

  struct lruvec *folio_lruvec_lock(struct folio *folio);
-       __acquires(&lruvec->lru_lock)
-       __acquires(rcu)
  struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
-       __acquires(&lruvec->lru_lock)
-       __acquires(rcu)
  struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
                                                 unsigned long *flags);
-       __acquires(&lruvec->lru_lock)
-       __acquires(rcu)

  static inline
  struct mem_cgroup *mem_cgroup_from_css(struct cgroup_subsys_state *css){
@@ -1477,38 +1471,10 @@ static inline struct lruvec 
*parent_lruvec(struct lruvec *lruvec)
         return mem_cgroup_lruvec(memcg, lruvec_pgdat(lruvec));
  }

-static inline void lruvec_lock_irq(struct lruvec *lruvec)
-       __acquires(&lruvec->lru_lock)
-       __acquires(rcu)
-{
-       rcu_read_lock();
-       spin_lock_irq(&lruvec->lru_lock);
-}
-
-static inline void lruvec_unlock(struct lruvec *lruvec)
-       __releases(&lruvec->lru_lock)
-       __releases(rcu)
-{
-       spin_unlock(&lruvec->lru_lock);
-       rcu_read_unlock();
-}
-
-static inline void lruvec_unlock_irq(struct lruvec *lruvec)
-       __releases(&lruvec->lru_lock)
-       __releases(rcu)
-{
-       spin_unlock_irq(&lruvec->lru_lock);
-       rcu_read_unlock();
-}
-
-static inline void lruvec_unlock_irqrestore(struct lruvec *lruvec,
-               unsigned long flags)
-       __releases(&lruvec->lru_lock)
-       __releases(rcu)
-{
-       spin_unlock_irqrestore(&lruvec->lru_lock, flags);
-       rcu_read_unlock();
-}
+void lruvec_lock_irq(struct lruvec *lruvec);
+void lruvec_unlock(struct lruvec *lruvec);
+void lruvec_unlock_irq(struct lruvec *lruvec);
+void lruvec_unlock_irqrestore(struct lruvec *lruvec, unsigned long flags);

  /* Test requires a stable folio->memcg binding, see folio_memcg() */
  static inline bool folio_matches_lruvec(struct folio *folio,
diff --git a/include/linux/swap.h b/include/linux/swap.h
index 4449d1f371a56..77a6a9fa11981 100644
--- a/include/linux/swap.h
+++ b/include/linux/swap.h
@@ -328,9 +328,7 @@ extern unsigned long totalreserve_pages;

  /* linux/mm/swap.c */
  void lru_note_cost_unlock_irq(struct lruvec *lruvec, bool file,
-               unsigned int nr_io, unsigned int nr_rotated)
-               __releases(lruvec->lru_lock);
-               __releases(rcu)
+               unsigned int nr_io, unsigned int nr_rotated);
  void lru_note_cost_refault(struct folio *);
  void folio_add_lru(struct folio *);
  void folio_add_lru_vma(struct folio *, struct vm_area_struct *);
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index c303c483f55a4..8907c9ea33bbc 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1313,6 +1313,39 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
         }
  }

+void lruvec_lock_irq(struct lruvec *lruvec)
+       __acquires(&lruvec->lru_lock)
+       __acquires(rcu)
+{
+       rcu_read_lock();
+       spin_lock_irq(&lruvec->lru_lock);
+}
+
+void lruvec_unlock(struct lruvec *lruvec)
+       __releases(&lruvec->lru_lock)
+       __releases(rcu)
+{
+       spin_unlock(&lruvec->lru_lock);
+       rcu_read_unlock();
+}
+
+void lruvec_unlock_irq(struct lruvec *lruvec)
+       __releases(&lruvec->lru_lock)
+       __releases(rcu)
+{
+       spin_unlock_irq(&lruvec->lru_lock);
+       rcu_read_unlock();
+}
+
+void lruvec_unlock_irqrestore(struct lruvec *lruvec,
+               unsigned long flags)
+       __releases(&lruvec->lru_lock)
+       __releases(rcu)
+{
+       spin_unlock_irqrestore(&lruvec->lru_lock, flags);
+       rcu_read_unlock();
+}
+
  /**
   * folio_lruvec_lock - Lock the lruvec for a folio.
   * @folio: Pointer to the folio.

```

On 1/15/26 8:34 PM, kernel test robot wrote:
> Hi Qi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on next-20260114]
> [cannot apply to akpm-mm/mm-everything brauner-vfs/vfs.all trace/for-next linus/master dennis-percpu/for-next v6.19-rc5 v6.19-rc4 v6.19-rc3 v6.19-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-memcontrol-remove-dead-code-of-checking-parent-memory-cgroup/20260114-193921
> base:   next-20260114
> patch link:    https://lore.kernel.org/r/0252f9acc29d4b1e9b8252dc003aff065c8ac1f6.1768389889.git.zhengqi.arch%40bytedance.com
> patch subject: [PATCH v3 24/30] mm: memcontrol: prepare for reparenting LRU pages for lruvec lock
> config: powerpc64-randconfig-002-20260115 (https://download.01.org/0day-ci/archive/20260115/202601152057.xgusZpKm-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601152057.xgusZpKm-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601152057.xgusZpKm-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from crypto/ahash.c:26:
>     In file included from include/net/netlink.h:6:
>     In file included from include/linux/netlink.h:9:
>     In file included from include/net/scm.h:9:
>     In file included from include/linux/security.h:35:
>     In file included from include/linux/bpf.h:32:
>>> include/linux/memcontrol.h:772:14: error: use of undeclared identifier 'lruvec'
>       772 |         __acquires(&lruvec->lru_lock)
>           |                     ^~~~~~
>     include/linux/memcontrol.h:773:13: error: use of undeclared identifier 'rcu'
>       773 |         __acquires(rcu)
>           |                    ^~~
>     include/linux/memcontrol.h:775:14: error: use of undeclared identifier 'lruvec'
>       775 |         __acquires(&lruvec->lru_lock)
>           |                     ^~~~~~
>     include/linux/memcontrol.h:776:13: error: use of undeclared identifier 'rcu'
>       776 |         __acquires(rcu)
>           |                    ^~~
>     include/linux/memcontrol.h:779:14: error: use of undeclared identifier 'lruvec'
>       779 |         __acquires(&lruvec->lru_lock)
>           |                     ^~~~~~
>     include/linux/memcontrol.h:780:13: error: use of undeclared identifier 'rcu'
>       780 |         __acquires(rcu)
>           |                    ^~~
>     include/linux/memcontrol.h:1507:13: error: use of undeclared identifier 'rcu'
>      1507 |         __acquires(rcu)
>           |                    ^~~
>     include/linux/memcontrol.h:1515:13: error: use of undeclared identifier 'rcu'
>      1515 |         __releases(rcu)
>           |                    ^~~
>     include/linux/memcontrol.h:1523:13: error: use of undeclared identifier 'rcu'
>      1523 |         __releases(rcu)
>           |                    ^~~
>     include/linux/memcontrol.h:1532:13: error: use of undeclared identifier 'rcu'
>      1532 |         __releases(rcu)
>           |                    ^~~
>     In file included from crypto/ahash.c:26:
>     In file included from include/net/netlink.h:6:
>     In file included from include/linux/netlink.h:9:
>     In file included from include/net/scm.h:13:
>     In file included from include/net/compat.h:8:
>     include/linux/compat.h:454:22: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
>           |                             ^        ~
>     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
>        18 |         unsigned long sig[_NSIG_WORDS];
>           |         ^
>     In file included from crypto/ahash.c:26:
>     In file included from include/net/netlink.h:6:
>     In file included from include/linux/netlink.h:9:
>     In file included from include/net/scm.h:13:
>     In file included from include/net/compat.h:8:
>     include/linux/compat.h:454:10: warning: array index 7 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
>       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
>           |                 ^     ~
>     include/linux/compat.h:130:2: note: array 'sig' declared here
>       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>           |         ^
>     include/linux/compat.h:454:42: warning: array index 6 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
>       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
>           |                                                 ^     ~
>     include/linux/compat.h:130:2: note: array 'sig' declared here
>       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>           |         ^
>     include/linux/compat.h:454:53: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>       454 |         case 4: v.sig[7] = (set->sig[3] >> 32); v.sig[6] = set->sig[3];
>           |                                                            ^        ~
>     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
>        18 |         unsigned long sig[_NSIG_WORDS];
>           |         ^
>     In file included from crypto/ahash.c:26:
>     In file included from include/net/netlink.h:6:
>     In file included from include/linux/netlink.h:9:
>     In file included from include/net/scm.h:13:
>     In file included from include/net/compat.h:8:
>     include/linux/compat.h:456:22: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
>           |                             ^        ~
>     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
>        18 |         unsigned long sig[_NSIG_WORDS];
>           |         ^
>     In file included from crypto/ahash.c:26:
>     In file included from include/net/netlink.h:6:
>     In file included from include/linux/netlink.h:9:
>     In file included from include/net/scm.h:13:
>     In file included from include/net/compat.h:8:
>     include/linux/compat.h:456:10: warning: array index 5 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
>       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
>           |                 ^     ~
>     include/linux/compat.h:130:2: note: array 'sig' declared here
>       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>           |         ^
>     include/linux/compat.h:456:42: warning: array index 4 is past the end of the array (that has type 'compat_sigset_word[2]' (aka 'unsigned int[2]')) [-Warray-bounds]
>       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
>           |                                                 ^     ~
>     include/linux/compat.h:130:2: note: array 'sig' declared here
>       130 |         compat_sigset_word      sig[_COMPAT_NSIG_WORDS];
>           |         ^
>     include/linux/compat.h:456:53: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
>       456 |         case 3: v.sig[5] = (set->sig[2] >> 32); v.sig[4] = set->sig[2];
>           |                                                            ^        ~
>     arch/powerpc/include/uapi/asm/signal.h:18:2: note: array 'sig' declared here
>        18 |         unsigned long sig[_NSIG_WORDS];
>           |         ^
>     In file included from crypto/ahash.c:26:
>     In file included from include/net/netlink.h:6:
>     In file included from include/linux/netlink.h:9:
> 
> 
> vim +/lruvec +772 include/linux/memcontrol.h
> 
>     770	
>     771	struct lruvec *folio_lruvec_lock(struct folio *folio);
>   > 772		__acquires(&lruvec->lru_lock)
>     773		__acquires(rcu)
>     774	struct lruvec *folio_lruvec_lock_irq(struct folio *folio);
>     775		__acquires(&lruvec->lru_lock)
>     776		__acquires(rcu)
>     777	struct lruvec *folio_lruvec_lock_irqsave(struct folio *folio,
>     778							unsigned long *flags);
>     779		__acquires(&lruvec->lru_lock)
>     780		__acquires(rcu)
>     781	
> 

