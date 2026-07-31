Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA992D0C94
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528926; cv=none; b=n7i8fyTUU7rp6QYERYM7s9NDO5qcmG38s1bAfBBkhUejhrREJ1C7opzzH6zfFnpjs92zIOEVrj6LWMR3EaDhwo9O+8RFh6drJQx3g0Kc5gdP1fWS//LQsWEiNPiI2fjSz3tDawG2zxykkjBbXJOlUwWOObLUcLIUg4uv+cmQ/bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528926; c=relaxed/simple;
	bh=bdSmeAMghggTuA1J0I4rgleE0BB2q98NNwRi2/CqdhY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fZ5uP22Up4I6kX2CRy1sA4UAzTplrmScX10RErBTaWkqUOw0IkaD7aBSxBZ1epDo5o9UePLHZ8ZWF3KACxCfshpHlAejKIRvr5Ijivt/tPtYXPEy/AFYyHSlx2tipM7BzbDVEmG5O/HUG0MCoZ91PpA6SDkva4DIu23befdKewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ajordanr.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VIt5JI9I; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ajordanr.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VIt5JI9I"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so25626775ad.3
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785528925; x=1786133725; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AO9QVWaVHimnIgZbX5i/5mXX0JfsDFQlH7AOjqJnjH0=;
        b=VIt5JI9I48QBaLGjk2cuWuCpkasoaglxw+eTdp/28utuJew52ldkILWSG8jWMjoMT0
         KWp1OdcKTEzTQhMulVGSgXYp1wZNlvHhh/WiE+2sU4BgS3G1I4gGlvWJJRs+mecqqg+M
         RH4Gmrc4//8vruPHt2oQtA9Z6zUxdsFmtXAYNU+f7/Gu4i6piDM4ENJ4nFa4SQJOzBzU
         xjjIOuGNxrYf3T4+6Z+b8WU9eMN4RnIpvUZluIPf9m5oCv9QEADsywSNmDt9H5mrm3oo
         962nfhN13gPDBf31MbE0aOjGZtsjmSJEw4aq/vgm2vPuL2F9pNyTcHLtdO4YQep4kWz7
         OwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785528925; x=1786133725;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AO9QVWaVHimnIgZbX5i/5mXX0JfsDFQlH7AOjqJnjH0=;
        b=q6rkzUwm7e9jKyC7DoBHhaMOz8whjv+3vJ2CucgSiHy1F5OgqH/YiPF3kgSBJLoXR8
         S7BWA3Ccx0I1JiI9Wnuc+gXs7p1yASeCybaYLsHsKIBIlB/DsKMpEeRHtsnYn8X7x68G
         3uVa1XTv0ZNHcwQeUiKhUTbS37LLZJavBAKPIrEGx0EzFpMTpxj+NlqwWcthAQuAJv7F
         D16dF9XaFkYz6MO/ZICsfAvtqQqy4RdPLg1j95zu7BuIFcOZjyHAVGhYBfCGgvyd+5Qg
         VQo3g6jaONEnUg2PGhj5YFiXEjcMgWAQqaNRh+A8S2yZ6bG6QK1wmHPrluQ2kUDqzZ76
         15sw==
X-Forwarded-Encrypted: i=1; AHgh+RpNrsNr6OMNSjXhVKDRe7Kn+5RP/0pJEDUDmm2cc4OnOzjwPsQ/2+fSYbCMT/OyGQkY8rXN@lists.linux.dev
X-Gm-Message-State: AOJu0YyE3ezpJzs6gu4aY4JJ51T7gxAeNWxQCIJ2T+zTIf0yQaStH85M
	bL2rIsZV9VfwiXNYsnVSWcfCY7W92VOTu2spOuX5aGdQsIYG3u13uN4gzKVUgt1l7H+IAO7v9JX
	PtuG3Sgv7Ia7S9Q==
X-Received: from plbjw24.prod.google.com ([2002:a17:903:2798:b0:2cb:3f5b:b116])
 (user=ajordanr job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:41c4:b0:2cf:4c0f:5116 with SMTP id d9443c01a7336-2d052298addmr11061545ad.28.1785528924439;
 Fri, 31 Jul 2026 13:15:24 -0700 (PDT)
Date: Fri, 31 Jul 2026 20:15:19 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFYCbWoC/x2MSQqAMAwAvyI5G6gVIvoV8VBs1ECp0ogL4t8tM
 qc5zDygnIQVuuKBxIeorDFLVRYwLi7OjOKzgzWWTFMbdOF0t6LEIJExiO7ovMeaMi0ZYkuQ4y3 xJNc/7of3/QBeqPtgaAAAAA==
X-Change-Id: 20260730-always-inline-list-add-363639606e26
X-Developer-Key: i=ajordanr@google.com; a=ed25519; pk=ww5nbO3/Pd5R/873sdlbeNqCoUeIjBqvP3Bhcapjd/Y=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785528923; l=3418;
 i=ajordanr@google.com; s=20260730; h=from:subject:message-id;
 bh=bdSmeAMghggTuA1J0I4rgleE0BB2q98NNwRi2/CqdhY=; b=HS0GsaKcoa6PpiObSnjKc6Pp62XSbm0Pq9OnfKXu3X9DVEzRQr5yhrNwBK/V8G48MTQVBKq9h
 hIYbr6sKDy7B7kG+7zHi0MApYm4WStRPOfotkX3Y4TIZcs/Vrm/5ph6
X-Mailer: b4 0.14.3
Message-ID: <20260731-always-inline-list-add-v1-1-d29f54ce5477@google.com>
Subject: [PATCH] Mark list_add and __list_add as __always_inline
From: Jordan R Abrahams-Whitehead <ajordanr@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Jordan R Abrahams-Whitehead <ajordanr@google.com>, 
	Eric Dumazet <edumazet@google.com>
Content-Type: text/plain; charset="utf-8"

This commit resolves an issue where modpost section
verification fails due to section mismatches between list_add
and its callers.

At present, list_add (and its internal __list_add) are called from
both .text and .init code sections. Since inlining can vary per call
site, list_add can be 4 different states:

  list_add in text with arguments to non-.init.data values
  list_add in init with arguments to static .init.data values
  list_add in init with arguments to non-.init.data values
  list_add in text with arguments to static .init.data values

It is last instance that ends up causing the section mismatch caused by
constant propagation of the address of static libs inside the `dir_add`
as seen below (with the dir_list being defined statically in
initramfs.c, resting in .init.data).

  WARNING: modpost: vmlinux.o: section mismatch in reference: __list_add
  (section: .text.unlikely.) -> dir_list (section: .init.data)

Because of these section matching requirements, semantically,
__list_add and list_add MUST be inlined. This will then ensure
callers inside .init will receive a list_add that exists and refers
to only .init data, and list_add code in .text sections will only refer
to non-init data.

This issue manifests predominently in AutoFDO with clang, which is very
hesitant to inline cold functions such as list_add even when marked
`inline`. Marking them as `__always_inline` therefore matches the
existing semantic constraints imposed by modpost's section mismatch
checks.

Closes: https://github.com/ClangBuiltLinux/linux/issues/2173
Signed-off-by: Jordan R Abrahams-Whitehead <ajordanr@google.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Suggested-by: Eric Dumazet <edumazet@google.com>
Link: https://lore.kernel.org/all/CANn89iJVQe=wedLheJmjZjOTJsWHijT0jZs=iRxKssJZbjAxHw@mail.gmail.com/
---
 include/linux/list.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/linux/list.h b/include/linux/list.h
index 09d979976b3b..59f8aa0905d3 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -150,10 +150,13 @@ static inline bool __list_del_entry_valid(struct list_head *entry)
  *
  * This is only for internal list manipulation where we know
  * the prev/next entries already!
+ *
+ * Must be inlined to ensure it can be safely called
+ * with initdata arguments.
  */
-static inline void __list_add(struct list_head *new,
-			      struct list_head *prev,
-			      struct list_head *next)
+static __always_inline void __list_add(struct list_head *new,
+				       struct list_head *prev,
+				       struct list_head *next)
 {
 	if (!__list_add_valid(new, prev, next))
 		return;
@@ -171,8 +174,12 @@ static inline void __list_add(struct list_head *new,
  *
  * Insert a new entry after the specified head.
  * This is good for implementing stacks.
+ *
+ * Must be inlined to ensure it can be safely called
+ * with initdata arguments.
  */
-static inline void list_add(struct list_head *new, struct list_head *head)
+static __always_inline void list_add(struct list_head *new,
+				     struct list_head *head)
 {
 	__list_add(new, head, head->next);
 }

---
base-commit: fc46aed51f6280801f43a2cf4b5060cc33b572f9
change-id: 20260730-always-inline-list-add-363639606e26

Best regards,
-- 
Jordan R Abrahams-Whitehead <ajordanr@google.com>

