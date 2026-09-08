Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E403B569F06
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886518; cv=none; b=Xk+bdBWpbLo1ajsqLHNKYT+7pR2aphwtGOHpYDL1Yeeoz3SgealUdvVtyh0t4ccwITOG5TppVdzNr38YXKHnTZyp8zQb9xX5ieO5qbyYTXwxCmHyNAedTBqsrkI5d1M9MP4q6rSG6wtRIOE9tEDPmlp6NqB/vFLAQP+EFiJ0Twc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886518; c=relaxed/simple;
	bh=ns2JDtylu0ZVx4C7znMm+Qun0k8Uo9dIcle/pG/Boc0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fVOO+eZVQNFI+nlkUJMYgbZorQnu4J13NzVv9mLqFqDIiadMZ12xMN60XH4aT2sWlEJXt55EVAxtkYrEg1G0WwYSORJzAtwbSU50Q/EeD3eq2CMh9CkMBp4Zv6/XhI6xutkSa9fTSYg4j1Ana/GZuR7top6/daj7AN9MSukP5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uDcUURSg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uDcUURSg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so96955e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886515; x=1789491315; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QT2LgRp+eFl8LbhRKic90r+4pTm4Z+44dh2+IjeCBi0=;
        b=uDcUURSgsih/+X3sRAk2+O85HGFPO5A9EmNWamtTYoUm/JFPzbE0k0f/0/gs+ElzIz
         jk4cJ3e/iW1gDE2XXz9mw3JMT3ihPc5NPEbWMWHhdLhSXpYLaYyPKQBOZE5yTw8gpDk7
         n2LOz40CfJO8u90invUINbiQ4iVFOB/CJ8Vr4lE866BVTan7Wcrenrx5PNJeV7ZG+KLe
         Zt1RTCf5BfMl5WTlu0BN2fMGRCtp9CWYCfjS7uAqkKy3FLUzck1G2kFPDIPBgyhm2lhh
         k7dmPkIu0YJfUWpKCT1ufryTRIc/FMqT6mu/cdGIbTK6xQ+/UeZnR8cfI4H/P2Fgpuro
         C65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886515; x=1789491315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QT2LgRp+eFl8LbhRKic90r+4pTm4Z+44dh2+IjeCBi0=;
        b=UXw2Gm6WIETsGi18J9mQVQh8E0WShJyBu5JHdLvhH+oXjx4IG/7OBVAykKj0b3J+uq
         I4SF/EaYSUZxYBe/8qKirZuNf5prEYsSO7w2jkFoXa6RV3SF1WOuBNNhzPWVGwVCXsj9
         uNLW3r0zm14qsrReZd/Htc8R/EcM+sgCcXEcsuszJz5i/GZ3G5yx/9F70ujxPDMbaMS2
         dNlaODzCDtsRIPK3iHgEd2lO9bY6cvXygIH3ufUdrMa5E7mncmfMNjI65kxdPfvAIIOJ
         5KY4D4QKYJDgwKd39/OFShwBthYRrmUqPMu7AGvJxffwIvL67xzY4P4RS70sAil9EOz/
         Us5Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZaiF2O5T9jichvTN09G8fdFQkKak9ILl8QOEeOF2Jt7Rz2uZHoFZSm+Z9UwnvQblShIK7@lists.linux.dev
X-Gm-Message-State: AFuF++lwOkbeZamv0CECNM3vQUJ+RZRa3sIl20ESLXdIpPT0LjbZdUal
	N+fnVVnT7SFN1BgLNOwkiPCQZULBd7Q7dna7BYRAvTnE7Mt0YBhmC25vrQKnMT34CQ==
X-Gm-Gg: AYBFou3GOpbyStvaPJRNhOcw4hLJIrlcxjdu3FhKmmiXtxZB8AODVJsNcQ/kmoyyhbI
	WwIPAEU/CC1wJgQ3/kWXYSr1u2T6R1pH+BOW3ZUkDQnnVG4ywU7xRRSaTop1d8HtrfORILgnhnZ
	NmSvSYU60Voe9/kreS9PK258wJZCDEhceJukM2OuXVKkZ8dajmqNSPbZFVFuQDSk7UAgdYIfQaQ
	hMaUJUREggYqAdqoy9kL2bzSJZlG0kUxuX60Y1rHefc20V0uwXt0CaUnAoudnDpdcDoB1hDVbqh
	ny19ejA4zFrXaRUcYh5sUkF7+l5E8WnQhthGJsSt5NHHvFx1qfjY/bwY1kFoZH4mRatY4ijl29W
	T+FDM+mETYwwUWhiIQ/TkDbdOTellYWUBccgbjCSuQqYm5F/+RVOkdM4aQuO3Ty26a3aTf/ZcRr
	rTqzL2/ug+XQy3zVFEkhCrQNIWkk/JJAfxdmNHNfIUUSSBAv432ntf7UB2KKg2/bkkF3gUHxwVL
	/TsqXXwxa2cMeCQQt86bEEJUVeUShxfQbtZ0QiWBmCOvjK2
X-Received: by 2002:a05:600d:650d:10b0:49b:dec:ae63 with SMTP id 5b1f17b1804b1-49d05898d9emr2153525e9.12.1788886514775;
        Tue, 08 Sep 2026 09:55:14 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fd845absm148015e9.3.2026.09.08.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:13 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:48 +0200
Subject: [PATCH RFC v3 08/12] kcov: log freeing of SLUB objects and pages
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-8-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=2117;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=ns2JDtylu0ZVx4C7znMm+Qun0k8Uo9dIcle/pG/Boc0=;
 b=K3J6yFPU21oXDkqAqu5zOxsYibb4xdpPLHoKvLH5qNom7vL+ErrS4AoAGUJwJmK4uGxq1QNWd
 vkAM0pi7NY4DuxZuPSpmrXCMiJD//apE3zJ+yZqkc1NisNYpRgSRl/C
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

To help with using CONFIG_KCOV_MEMORY for detecting use-after-free issues,
log when memory (SLUB objects or page allocations) is being freed.

This should happen after KASAN has already marked the memory as freed;
this will become important if we allow driving delay injection off this
in the future.

Signed-off-by: Jann Horn <jannh@google.com>
---
 include/uapi/linux/kcov.h | 1 +
 mm/kasan/common.c         | 2 ++
 mm/page_alloc.c           | 3 +++
 3 files changed, 6 insertions(+)

diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index 7d7147e7b427..76822d1c119a 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -90,6 +90,7 @@ static inline __u64 kcov_remote_handle(__u64 subsys, __u64 inst)
 #define MEMORY_ACCESS_RECORD_WRITE 0x10
 #define MEMORY_ACCESS_RECORD_RMW 0x20
 #define MEMORY_ACCESS_RECORD_ATOMIC 0x40
+#define MEMORY_ACCESS_RECORD_FREE 0x80
 struct memory_access_record {
 	__aligned_u64 ip_address_and_kcov_flags;
 	__aligned_u64 data_address;
diff --git a/mm/kasan/common.c b/mm/kasan/common.c
index 1ab77ac9719c..3a648eaad024 100644
--- a/mm/kasan/common.c
+++ b/mm/kasan/common.c
@@ -283,6 +283,8 @@ bool __kasan_slab_free(struct kmem_cache *cache, void *object, bool init,
 		return false;
 
 	poison_slab_object(cache, object, init);
+	_kcov_handle_memaccess(object, cache->object_size,
+				    MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACCESS_RECORD_FREE);
 
 	if (no_quarantine)
 		return false;
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 083cbcb5bdde..910d14925b84 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -1446,6 +1446,9 @@ static __always_inline bool __free_pages_prepare(struct page *page,
 	if (init)
 		clear_highpages_kasan_tagged(page, 1 << order);
 
+	_kcov_handle_memaccess(page_address(page), (1 << order)*PAGE_SIZE,
+				    MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACCESS_RECORD_FREE);
+
 	/*
 	 * arch_free_page() can make the page's contents inaccessible.  s390
 	 * does this.  So nothing which can access the page's contents should

-- 
2.55.0.979.g7e5102b832-goog

