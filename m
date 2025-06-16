Received: from mail-ua1-f74.google.com (mail-ua1-f74.google.com [209.85.222.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12A728851F
	for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 18:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750097508; cv=none; b=FQLkYNQ9RE86XcUhm/rqk2bCf5cDVKTVmm3gRBxAUDdO/upKOVVEn+68jtMIfEuAHdDPvcY6Zo/h1YFpzDQJlPMdrZEqVh3nDToihX60xTXbPt6SVRAmM/d9tKIdAcHgXnCNdZLM0ZcbLlDlUEipTaE1d00GL8Ytixtiv23b7M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750097508; c=relaxed/simple;
	bh=GcubAK2X5FhvX3lKn31wF5WScXm/MYVsYGhQM9zkOGI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PzK4vyKHqwCCfuuf8sWGWOli84tsgfgUvoQHALo4t7cUu+NtTV4hZgD6py5ZskKuuqYcazGnUEszn6PvXk8QG5ZtGR7h8w0VJz1y28iGSdFYzVYQAMrkH1PwInPQoqv9OG8QRL7zrUptE8LWejVOYbWyX5q+1n1vzQUfE3Y5S90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BzLFJSgc; arc=none smtp.client-ip=209.85.222.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BzLFJSgc"
Received: by mail-ua1-f74.google.com with SMTP id a1e0cc1a2514c-87eedcd0f64so65131241.1
        for <llvm@lists.linux.dev>; Mon, 16 Jun 2025 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750097505; x=1750702305; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pigkyW7BcI5mVhb+n24BJs2W1x6DRYe3DJp6TE42oBU=;
        b=BzLFJSgcSBkQJwS2o87HIgsOPvK+BKEt4B27SJ2hkIjBWzmw47InX4/CG71YS8FB/c
         2gnYfPmw3WDPog7REHve7DPC79A/SCjmShhqtlVr7yBl9uyyO1glDh+BZkRFtc51RbHn
         G3kZcjCTyKYUAtlYDur88y31zsEyZSXpCQOhSllNjvEaSITCkNKZhQ+e2ONahecmMcWq
         PiLsyveEt5IiWA3aZs5ZdvyfB5PqzrTm9o2dccjP+N1NlQMTQqBIHOjrBf7/NcOnTYM6
         no1dKb1qw8g4DRAiZXWCx+o2Biz+rmS0+uvhGm+QawZ+T6byTdE/luF6iLbfjlUj/Nvp
         IVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750097505; x=1750702305;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pigkyW7BcI5mVhb+n24BJs2W1x6DRYe3DJp6TE42oBU=;
        b=B5LZgKYDWVgsmG90Bf0NumBdi9lOnn6hboc4C6hAWiRIcuLxn2eXmThZ8GUzHImMMT
         qHR0TOYvu+6C59VzaliRABSridRlzN9DjT22LsJbqxdWAyGcYx0PxXJFMblUoxdNTvOr
         zCMaHkOl8/U+jlNOdvTO0ZZcH3+g5G+XgfG/+ZC/fxv/nPRczY/SzJkQ+gws7oFjv2K9
         Xx1p0anBiAbDamxGFPKqwsnLfAqcnnL4pKC6866EKHYsZxAWoT//6ayFg9vKs/SgZzOQ
         oz04QqAJ4pfv8RFXdtQMLWR3BGyw5SwwZrY1u5G7jCyuGol/CP8Gu5ETzHOjGI2ZCcBE
         I5og==
X-Forwarded-Encrypted: i=1; AJvYcCXzu2e+o3S/TKOPrlPj4wGWHUzkwaR4QHhUyeXq/xDYCOzt+W7se4FFuZaCespa3CePqtj6@lists.linux.dev
X-Gm-Message-State: AOJu0YwlK9Oqo/eLPT9CgNXI/U9UPAbd7IiCW4Krt6URK1HgMWh1s3eT
	utFOyDm21lgVLIi8YmM8L9toPzLFYoy4UMGautJhwGueNCJV27h5tzliXPxxFdnhh/L/BnNEkta
	K2MR10gM1Xjnl0xhnoeHkjQ==
X-Google-Smtp-Source: AGHT+IFZXqypOEwxBtiFkSoL0Ikspp8t9OtsymhRtCWrWcv9rJUKo8igKv++c/FKV95j2ID8qgoztEyOhECx1j5T
X-Received: from vkbej10.prod.google.com ([2002:a05:6122:270a:b0:530:2c3a:a725])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6122:1b06:b0:531:172b:afe9 with SMTP id 71dfb90a1353d-53149927135mr7044462e0c.2.1750097504989;
 Mon, 16 Jun 2025 11:11:44 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:11:44 +0000
In-Reply-To: <202506142129.ClBlxdtW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202506142129.ClBlxdtW-lkp@intel.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250616181144.2874709-1-jthoughton@google.com>
Subject: Re: [PATCH v4 3/7] KVM: x86/mmu: Recover TDP MMU NX huge pages using
 MMU read lock
From: James Houghton <jthoughton@google.com>
To: lkp@intel.com, pbonzini@redhat.com, seanjc@google.com
Cc: dmatlack@google.com, jthoughton@google.com, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, vipinsh@google.com
Content-Type: text/plain; charset="UTF-8"

> All errors (new ones prefixed by >>):
> 
>    arch/x86/kvm/mmu/mmu.c:7570:28: error: use of undeclared identifier 'KVM_TDP_MMU'
>     7570 |         bool is_tdp = mmu_type == KVM_TDP_MMU;
>          |                                   ^
> >> arch/x86/kvm/mmu/mmu.c:7594:25: error: no member named 'tdp_mmu_pages_lock' in 'struct kvm_arch'
>     7594 |                         spin_lock(&kvm->arch.tdp_mmu_pages_lock);
>          |                                    ~~~~~~~~~ ^
>    arch/x86/kvm/mmu/mmu.c:7597:28: error: no member named 'tdp_mmu_pages_lock' in 'struct kvm_arch'
>     7597 |                                 spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
>          |                                              ~~~~~~~~~ ^
>    arch/x86/kvm/mmu/mmu.c:7617:27: error: no member named 'tdp_mmu_pages_lock' in 'struct kvm_arch'
>     7617 |                         spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
>          |                                      ~~~~~~~~~ ^
>    4 errors generated.

Fixup for this below.

I also realized that the variable name `is_tdp` is bad/misleading, so I've
changed it to `is_tdp_mmu` as part of this fixup too. Sean/Paolo, let me know
if I should just go ahead and post the fixed series, given the size of this
fixup.

I don't really like having to #ifdef all the places where we take
tdp_mmu_pages_lock, but I couldn't find a way to avoid that. Even doing

  #ifndef CONFIG_X86_64
  #define is_tdp_mmu false
  #endif

didn't work. :(

Anyway, here's the fixup:

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 10ba328b664d7..7df1b4ead705b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -7564,10 +7564,10 @@ static bool kvm_mmu_sp_dirty_logging_enabled(struct kvm *kvm,
 }
 
 static void kvm_recover_nx_huge_pages(struct kvm *kvm,
-				      enum kvm_mmu_type mmu_type)
+				      const enum kvm_mmu_type mmu_type)
 {
 	unsigned long to_zap = nx_huge_pages_to_zap(kvm, mmu_type);
-	bool is_tdp = mmu_type == KVM_TDP_MMU;
+	bool is_tdp_mmu = mmu_type == KVM_TDP_MMU;
 	struct list_head *nx_huge_pages;
 	struct kvm_mmu_page *sp;
 	LIST_HEAD(invalid_list);
@@ -7577,7 +7577,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 	nx_huge_pages = &kvm->arch.possible_nx_huge_pages[mmu_type].pages;
 
 	rcu_idx = srcu_read_lock(&kvm->srcu);
-	if (is_tdp)
+	if (is_tdp_mmu)
 		read_lock(&kvm->mmu_lock);
 	else
 		write_lock(&kvm->mmu_lock);
@@ -7590,11 +7590,15 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 	rcu_read_lock();
 
 	for ( ; to_zap; --to_zap) {
-		if (is_tdp)
+#ifdef CONFIG_X86_64
+		if (is_tdp_mmu)
 			spin_lock(&kvm->arch.tdp_mmu_pages_lock);
+#endif
 		if (list_empty(nx_huge_pages)) {
-			if (is_tdp)
+#ifdef CONFIG_X86_64
+			if (is_tdp_mmu)
 				spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+#endif
 			break;
 		}
 
@@ -7613,8 +7617,10 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 
 		unaccount_nx_huge_page(kvm, sp);
 
-		if (is_tdp)
+#ifdef CONFIG_X86_64
+		if (is_tdp_mmu)
 			spin_unlock(&kvm->arch.tdp_mmu_pages_lock);
+#endif
 
 		/*
 		 * Do not attempt to recover any NX Huge Pages that are being
@@ -7624,7 +7630,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 		 * logging is disabled.
 		 */
 		if (!kvm_mmu_sp_dirty_logging_enabled(kvm, sp)) {
-			if (is_tdp)
+			if (is_tdp_mmu)
 				flush |= kvm_tdp_mmu_zap_possible_nx_huge_page(kvm, sp);
 			else
 				kvm_mmu_prepare_zap_page(kvm, sp, &invalid_list);
@@ -7637,7 +7643,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 			kvm_mmu_remote_flush_or_zap(kvm, &invalid_list, flush);
 			rcu_read_unlock();
 
-			if (is_tdp)
+			if (is_tdp_mmu)
 				cond_resched_rwlock_read(&kvm->mmu_lock);
 			else
 				cond_resched_rwlock_write(&kvm->mmu_lock);
@@ -7650,7 +7656,7 @@ static void kvm_recover_nx_huge_pages(struct kvm *kvm,
 
 	rcu_read_unlock();
 
-	if (is_tdp)
+	if (is_tdp_mmu)
 		read_unlock(&kvm->mmu_lock);
 	else
 		write_unlock(&kvm->mmu_lock);
