Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15E1C0DDE;
	Sun,  7 Apr 2024 04:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712463789; cv=none; b=e25OXKBBqcza6na+1rGC0qxl4PSDdSVV0lu5n/ycETXgJxd/YwyO+sUB/wAuaj9FK7oO/zX9pjguVlROpTRLqLiPXGk03IWpIIhNN254DqugJE+LoX53xMDGqlpKcSXINrgwOz67SWq55MZNKslEhgByOz0vkwizOBZOScxw+ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712463789; c=relaxed/simple;
	bh=4X6F9KhVDvPmaPesQrJ4nWaLgOa/pgQOODW9iQ53W5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hi4xioUW0OZt1rtmNnDM/xfh2VSXlGOz3o3mIpD8MCoS7zUH5GxdFPsup5uo5HtKaTZmw043TOEPOTSWKoZazqmTYdzpeM0rt8odVzO8RnUri9rNTLNFIHESUz9imkhfPP9CJBAYJtbdK6SNmzmvw16fPwFgLzOSg8u3VJ2u644=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xl/gFsOL; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xl/gFsOL"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e74bd85f26so3032052b3a.1;
        Sat, 06 Apr 2024 21:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712463787; x=1713068587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP7muBwu7UMyYBfJQ5J0w7sTIiEnaLoePixNkhv1wIo=;
        b=Xl/gFsOLXeA/RwUE2ond4PoJBLybE+VuwcidVfloWWlDisKyY5v1m72L6JHvz+Jmtl
         Iy1NbMft169S2EnxC1FxQrxXwpQToP8tZNyUriNE4f9h8Or38wUQdiWSWPvmRprOwUzD
         UgHFQAANcsvsgIX4zOpfQ9s+Zj48bxkKkPUb5HMuwZKXLSRsrME00gSl3xU3I5adYt76
         UaP/a3wLyKeNK9uTH9/JSGZSVAsCxwinayVncIOeaMYmELw3M28hkbMwTT4FSFwnifPP
         EOSAEWunKHkb5aUoHR3pZ9v45Gh62yX9Ehvm+KHjXSIluYrnrFdWV691YcLK3FHwo9RC
         qLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712463787; x=1713068587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP7muBwu7UMyYBfJQ5J0w7sTIiEnaLoePixNkhv1wIo=;
        b=nHKLWmCUr7jT+2xylg/rmCc+KbMvihjeMbAYVqOEga6KEM3eDwsCJtksKDbC9Im2oY
         Jnh+dCyviKEKJAlJMYccvXhcjl1wZ7bTpj1U9prgfj8SgFnzBuqRpa7mjpIH3x0ucnky
         5rslgghp6Hj2FEpu3phiauEiIoAFWjcVz+Ta6kPEmZUf/g49mev5krkjELUbN1H3fDCw
         scti6KhknIaMwa4jisTF7/Mjrl0O+j3Kv3oK2tX5VIrGFR4/7uGL44ts7voBEGcHPuHP
         Nap8YCucC68VuWwOdx9GpPZQ9u10DkfdoZ/EQakBdAtZ+Xd+cph2gFkgcgVES9IKcBLk
         Qbgg==
X-Forwarded-Encrypted: i=1; AJvYcCVZNHEIcV87rmUufny1F03ehJsO11fOxjFzDQVQiEaRPGEY24nlb/+0l84DS5G6eOokrfaWCbU2ZX6uOMDvLE4MjU6UzSs4CKeUlG/P+jzGFqAx9lmQvxMdSSpka4PWKzlH/S0=
X-Gm-Message-State: AOJu0YxgKbLcQmHTK4xpnKIrJi3Q0a9FX8yR0E7Fm5umkosGHWjI3kBy
	coxb3bLkRi/a9SpeUM04OQwFyO+pUzkO1CeF1/PVNg6xU75ILfgA
X-Google-Smtp-Source: AGHT+IGmuvtObmu4KbfeZjaXsW6wuJ3de38S6C6us1oFoI+NaDlXBWzlpUhxFroh54S4/BrLVST7dw==
X-Received: by 2002:a05:6a20:9186:b0:1a7:4ab0:714c with SMTP id v6-20020a056a20918600b001a74ab0714cmr3270703pzd.43.1712463786498;
        Sat, 06 Apr 2024 21:23:06 -0700 (PDT)
Received: from localhost.localdomain ([2407:7000:8942:5500:aaa1:59ff:fe57:eb97])
        by smtp.gmail.com with ESMTPSA id j8-20020a170903024800b001e28a5b48c7sm4182067plh.77.2024.04.06.21.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Apr 2024 21:23:06 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: 21cnbao@gmail.com,
	lkp@intel.com
Cc: akpm@linux-foundation.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	v-songbaohua@oppo.com
Subject: Re: [akpm-mm:mm-unstable 313/322] include/linux/huge_mm.h:274:16: error: fields must have a constant size: 'variable length array in structure' extension will never be supported
Date: Sun,  7 Apr 2024 16:22:47 +1200
Message-Id: <20240407042247.201412-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240406224038.5412-1-21cnbao@gmail.com>
References: <20240406224038.5412-1-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
>> head:   f43b3aae94511d62174c3b29239da0dd22d0eeb3
>> commit: d4358ee0a075e232114dfec0cd162860cfa2771b [313/322] mm: add per-order mTHP anon_alloc and anon_alloc_fallback counters
>> config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/config)
>> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061754.n8jmZ6s3-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202404061754.n8jmZ6s3-lkp@intel.com/
>> 
>> All error/warnings (new ones prefixed by >>):
>> 
>>    In file included from arch/powerpc/kernel/asm-offsets.c:19:
>>    In file included from include/linux/mman.h:5:
>>    In file included from include/linux/mm.h:1115:
>>>> include/linux/huge_mm.h:274:22: warning: variable length array used [-Wvla]
>>      274 |         unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
>          |                             ^~~~~~~~~~~~~
> 
> This is amazing. powerpc's PMD_ORDER isn't const. I will
> move to alloc_percpu instead of using a static array.

As replied in another thread, can you please test the below patch?
this is v2 combining the fix and the fix of the fix.

From 6f8604a51ff3333be467e2a681a1f1e8a5d41c48 Mon Sep 17 00:00:00 2001
From: Barry Song <v-songbaohua@oppo.com>
Date: Sun, 7 Apr 2024 12:23:35 +1200
Subject: [PATCH v2] mm: fix powerpc build issue

On powerpc, PMD_ORDER is not a constant variable. We should transition
to using alloc_percpu instead of a static percpu array.

Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 include/linux/huge_mm.h |  9 ++++-----
 mm/huge_memory.c        | 12 ++++++++++--
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index c5d33017a4dd..0717063dc5e7 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -271,16 +271,15 @@ enum mthp_stat_item {
 };
 
 struct mthp_stat {
-	unsigned long stats[PMD_ORDER + 1][__MTHP_STAT_COUNT];
+	unsigned long stats[0][__MTHP_STAT_COUNT];
 };
 
-DECLARE_PER_CPU(struct mthp_stat, mthp_stats);
+extern struct mthp_stat __percpu *mthp_stats;
 
 static inline void count_mthp_stat(int order, enum mthp_stat_item item)
 {
-	if (unlikely(order > PMD_ORDER))
-		return;
-	this_cpu_inc(mthp_stats.stats[order][item]);
+	if (likely(order <= PMD_ORDER))
+		raw_cpu_ptr(mthp_stats)->stats[order][item]++;
 }
 
 #define transparent_hugepage_use_zero_page()				\
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 5b875f0fc923..7a72760dc1ce 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -526,7 +526,7 @@ static const struct kobj_type thpsize_ktype = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
-DEFINE_PER_CPU(struct mthp_stat, mthp_stats) = {{{0}}};
+struct mthp_stat __percpu *mthp_stats;
 
 static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
 {
@@ -534,7 +534,7 @@ static unsigned long sum_mthp_stat(int order, enum mthp_stat_item item)
 	int cpu;
 
 	for_each_online_cpu(cpu) {
-		struct mthp_stat *this = &per_cpu(mthp_stats, cpu);
+		struct mthp_stat *this = per_cpu_ptr(mthp_stats, cpu);
 
 		sum += this->stats[order][item];
 	}
@@ -636,6 +636,13 @@ static int __init hugepage_init_sysfs(struct kobject **hugepage_kobj)
 		goto remove_hp_group;
 	}
 
+	mthp_stats = __alloc_percpu((PMD_ORDER + 1) * sizeof(mthp_stats->stats[0]),
+			sizeof(unsigned long));
+	if (!mthp_stats) {
+		err = -ENOMEM;
+		goto remove_hp_group;
+	}
+
 	orders = THP_ORDERS_ALL_ANON;
 	order = highest_order(orders);
 	while (orders) {
@@ -673,6 +680,7 @@ static void __init hugepage_exit_sysfs(struct kobject *hugepage_kobj)
 	sysfs_remove_group(hugepage_kobj, &khugepaged_attr_group);
 	sysfs_remove_group(hugepage_kobj, &hugepage_attr_group);
 	kobject_put(hugepage_kobj);
+	free_percpu(mthp_stats);
 }
 #else
 static inline int hugepage_init_sysfs(struct kobject **hugepage_kobj)
-- 
2.34.1


