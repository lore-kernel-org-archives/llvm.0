Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336612F33
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 18:43:37 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id 185so2959630qke.7
        for <llvm@lists.linux.dev>; Wed, 11 May 2022 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EVcIbC3os2R84jxSHafkWfG0RgEPBNH134Le4XDoVnc=;
        b=5S0tuXmhycTuBnMCTLgz6njqVsnNK34gbNgZ817Qe0cDBcZOwoC4fpkcAInEpb9OEd
         USQnRxfeUlfFMK698Ku6N3oSuITk/8uaNJLIeOQ4i0HdWT9qAQV/2jGibWeTV5ab1OsQ
         lbsLkcKUKask/6L6L28sf0MameP1rYZTWI/owjziRSBIXOW3P0dVz70Qq5ZWk83ErrR7
         MB3PBU3rxSKk0nl9izDKudEoZJXmEkKlLPsHES6kirTvkIoy9H66Vqn2ZL7Z7TwLcw9n
         J89MqKgCGlCWRVDuk18CUGpDiaQHfNT/4asynHuLJE3vWEcCoLPQL27Mgo2Hrb4WZhIn
         Hpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EVcIbC3os2R84jxSHafkWfG0RgEPBNH134Le4XDoVnc=;
        b=sJxnyVV0YHfiTOS1Kz/0FubpQ6lV/fMlzzv7OycCY8FlsadWl3aNpTLJwyALDuSHpF
         OsxFu/z9rTh9oVvzg3S8IU3IxbiYiIW0HzcgY3F2J1EZNOkzQiO89R7sxBvy0+8WmJE7
         T/RuGqEJ6ATDcx7fNjhgJnCmVnS2OHF+enM3eV0MusvIZZ45BAupfvxUpFjr1vH81QCU
         U7uB4xtGW3fJAZzh8Atl/NMLIwuFONhsM6xuxkeeRBDmlgeFnc8zhXtHThJBhi8H2haw
         BTm/7l9KOhat7CbneMowFMxTlAa/4BRohfjt714zXT0dimSEtST4wf98ldu0WBc8ycO0
         pfeA==
X-Gm-Message-State: AOAM531hajfXPESanNHeFvoqHBRRSVyUeJ2/pfwlwKEcE7t2ydMqhP8N
	/nmecF9fq6YlQe7MKeIQXnvfHw==
X-Google-Smtp-Source: ABdhPJxgkihNXs6NLUcbgv8u3OcoleK8XIgeZZ5LNOpVgu3RqBooCduyZ+zN2QhyDmQKGqYPw7yc3g==
X-Received: by 2002:a05:620a:170f:b0:6a0:41dc:8f6c with SMTP id az15-20020a05620a170f00b006a041dc8f6cmr20846493qkb.191.1652294616918;
        Wed, 11 May 2022 11:43:36 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:14fe])
        by smtp.gmail.com with ESMTPSA id y11-20020ac85f4b000000b002f3e2435ee2sm1692779qta.63.2022.05.11.11.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 11:43:36 -0700 (PDT)
Date: Wed, 11 May 2022 14:43:35 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [linux-next:master 10902/11094] mm/memcontrol.c:7467:6: error:
 redefinition of 'obj_cgroup_may_zswap'
Message-ID: <YnwD14zxYjUJPc2w@cmpxchg.org>
References: <202205120115.D6nVZNke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205120115.D6nVZNke-lkp@intel.com>

On Thu, May 12, 2022 at 01:49:04AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6107040c99d5dfc920721c198d45ed2d639b113a
> commit: bf7930005b547c94d4cd312a2e0400cb8cf76d2a [10902/11094] zswap: memcg accounting
> config: i386-randconfig-a001-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120115.D6nVZNke-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bf7930005b547c94d4cd312a2e0400cb8cf76d2a
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout bf7930005b547c94d4cd312a2e0400cb8cf76d2a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/memcontrol.c:7467:6: error: redefinition of 'obj_cgroup_may_zswap'
>    bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
>         ^
>    include/linux/memcontrol.h:1816:20: note: previous definition is here
>    static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)

This is a slob configuration! I'll probably NOT test this routinely in
the future ;) But there is opportunity to simplify the underlying
complication that caused this, which is CONFIG_MEMCG_KMEM. I need to
dust off that patch and send it...

For now, this delta fix addresses the problem.

Runtime tested with slob and slub.

---
From f6029bc8676d990b3915b815dd6d15759ce6b1b1 Mon Sep 17 00:00:00 2001
From: Johannes Weiner <hannes@cmpxchg.org>
Date: Wed, 11 May 2022 14:26:59 -0400
Subject: [PATCH] zswap: memcg accounting fix

Fix for CONFIG_SLOB builds:

>> mm/memcontrol.c:7467:6: error: redefinition of 'obj_cgroup_may_zswap'
   bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
	^
   include/linux/memcontrol.h:1816:20: note: previous definition is here
   static inline bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)

The header file uses CONFIG_MEMCG_KMEM && CONFIG_ZSWAP to decide on
implementation vs dummies; the .c file uses CONFIG_ZSWAP. SLOB builds
don't have CONFIG_MEMCG_KMEM (for historical reasons).

Gate everything in the code file on CONFIG_MEMCG_KMEM as well for
now. Eventually, CONFIG_MEMCG_KMEM should be removed and folded into
CONFIG_MEMCG.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
---
 include/linux/memcontrol.h |  2 +-
 mm/memcontrol.c            | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/memcontrol.h b/include/linux/memcontrol.h
index 3385ce81ecf3..b0685d01570f 100644
--- a/include/linux/memcontrol.h
+++ b/include/linux/memcontrol.h
@@ -254,7 +254,7 @@ struct mem_cgroup {
 	/* Range enforcement for interrupt charges */
 	struct work_struct high_work;
 
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	unsigned long zswap_max;
 #endif
 
diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index cbb9b43bdb80..350012b93a95 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -1398,7 +1398,7 @@ static const struct memory_stat memory_stats[] = {
 	{ "sock",			MEMCG_SOCK			},
 	{ "vmalloc",			MEMCG_VMALLOC			},
 	{ "shmem",			NR_SHMEM			},
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	{ "zswap",			MEMCG_ZSWAP_B			},
 	{ "zswapped",			MEMCG_ZSWAPPED			},
 #endif
@@ -1517,7 +1517,7 @@ static char *memory_stat_format(struct mem_cgroup *memcg)
 	seq_buf_printf(&s, "%s %lu\n", vm_event_name(PGLAZYFREED),
 		       memcg_events(memcg, PGLAZYFREED));
 
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	seq_buf_printf(&s, "%s %lu\n", vm_event_name(ZSWPIN),
 		       memcg_events(memcg, ZSWPIN));
 	seq_buf_printf(&s, "%s %lu\n", vm_event_name(ZSWPOUT),
@@ -5184,7 +5184,7 @@ mem_cgroup_css_alloc(struct cgroup_subsys_state *parent_css)
 
 	page_counter_set_high(&memcg->memory, PAGE_COUNTER_MAX);
 	memcg->soft_limit = PAGE_COUNTER_MAX;
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	memcg->zswap_max = PAGE_COUNTER_MAX;
 #endif
 	page_counter_set_high(&memcg->swap, PAGE_COUNTER_MAX);
@@ -7451,7 +7451,7 @@ static struct cftype memsw_files[] = {
 	{ },	/* terminate */
 };
 
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 /**
  * obj_cgroup_may_zswap - check if this cgroup can zswap
  * @objcg: the object cgroup
@@ -7582,7 +7582,7 @@ static struct cftype zswap_files[] = {
 	},
 	{ }	/* terminate */
 };
-#endif /* CONFIG_ZSWAP */
+#endif /* CONFIG_MEMCG_KMEM && CONFIG_ZSWAP */
 
 /*
  * If mem_cgroup_swap_init() is implemented as a subsys_initcall()
@@ -7602,7 +7602,7 @@ static int __init mem_cgroup_swap_init(void)
 
 	WARN_ON(cgroup_add_dfl_cftypes(&memory_cgrp_subsys, swap_files));
 	WARN_ON(cgroup_add_legacy_cftypes(&memory_cgrp_subsys, memsw_files));
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	WARN_ON(cgroup_add_dfl_cftypes(&memory_cgrp_subsys, zswap_files));
 #endif
 	return 0;
-- 
2.35.3

