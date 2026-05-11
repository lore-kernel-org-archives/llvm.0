Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BE932AAA7
	for <llvm@lists.linux.dev>; Mon, 11 May 2026 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778529737; cv=none; b=ATfd11sxRHPnsZYvw+YgD8jQhbciHI0gcC8SRXLq64JbWRgaEgabK+zAfWgVDUCKvV43Sg3K7EK+QHRY6r7wJRAa9c2dx8Mb+KKbBXtvcVDpXmwpSfQgVH5SbVCZKiDTQxNRXb8A1dPKSPkvD3zhsMuH2gGVb/zxblHSQhQuBxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778529737; c=relaxed/simple;
	bh=3soCOAIvdELQvsXpjzW6fUm/qXnhcabrdpgiCXdhVnQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hO+C/jsZCE0PuoRKVyj4Qn/FsuYNCBJ4/rKTLaXXxIVW7ufRGhiNMJVfPWPkgCPO71mNjuQNlq5SXE8pnY1ANaMcFRcPr7VIzrMl2DcivszDoRHud1PmC3c7VzztOKZhf7kz63jZerBo30TJa8tKxZF+w2y2zsIr+qKtC87dMi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oa5tbw9V; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oa5tbw9V"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b844098869cso372613666b.2
        for <llvm@lists.linux.dev>; Mon, 11 May 2026 13:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778529734; x=1779134534; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kSzWbBLsBd6qB4iAbq+envEAJK7ihSlVnGWw0+sGFs=;
        b=oa5tbw9VLpxbe0vF0x58TJXthquzvSkImte6x4zhLB2uRl4HRuYlXJ54KfpOflkD+b
         IKLbgrCIO3Zl4CGfmhpfkA0w7MGvKdx+HgJ9Byq3VoYTMhCb6FqkWiVW8Ox9nAhBxvMJ
         zY6RuOcTeqQxwdCrY1nUAV73pN+OMGIWtWaMpiaZJNuDTX1ZedllWbkHJS4vrI5SPV+j
         qJCte1VIycjtJYXT57mzchj2jQxdRVQ1pcY2sHblMxgnZ+l/2nH/Z0VMtxJLFDKbM5w6
         lHd5DTlsNXgpe1XzvF0zR+41mIq4WmOT62FHs1sC0qlDJiC3P5vt5AerwTGQjROb1a9g
         8rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778529734; x=1779134534;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kSzWbBLsBd6qB4iAbq+envEAJK7ihSlVnGWw0+sGFs=;
        b=R8PBfh2EWNy8uh0pwci6NhQdD6UcMg2SUTzrRTkUDgJC/Y9omZiWn+pynhA3cIQRg2
         JBPMFIfdQ3QDXa+UxKdllxGkzEBqI3Qed6CjwVt9FYwHCNwKLXDMpztw1libvYAk9hgJ
         bXpr23/+U+4gXHSiMJ+fG2r/unTCWFpznssowS3efJLwNh/vqF7IN0SlLABl3gRmluqD
         Kq2wpJHoQFEcrhc2CyLcLxjKjAoQgjorXET8RykcAe/CwsMqyXuyAAVIy1IdaKMwzF0w
         G1U1JNeOgPEK6vmPH0JlYeIaGgQE2Is5rV+boR5BhcvApe1U+A+bPp/Hmg3pmCMbn791
         Gyzg==
X-Forwarded-Encrypted: i=1; AFNElJ/g8nyFAPTvWWo/mUWLtUQqvMQF2IVmWUVWgcWOiavVLzuA0LUBXdbmKwhZfCvd9WhMnDKr@lists.linux.dev
X-Gm-Message-State: AOJu0YxxlqQaOwD+7z3N6WL4BJDAYfVTCFWdVR18fo62OAtyisEcuuU3
	DksHczzpqqDs/k6pflwtBsws1m1XvXDYnKxhZiz59jYI6hkRRmW8o7KwQRUPAYSMc9oSVyc8UYi
	vXg==
X-Received: from ejche33.prod.google.com ([2002:a17:907:3da1:b0:bcc:71b:9645])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:a01:b0:bab:f5c7:23ca
 with SMTP id a640c23a62f3a-bc56df0650fmr1477434066b.38.1778529733351; Mon, 11
 May 2026 13:02:13 -0700 (PDT)
Date: Mon, 11 May 2026 22:00:49 +0200
In-Reply-To: <20260511200136.3201646-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260511200136.3201646-1-elver@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511200136.3201646-2-elver@google.com>
Subject: [PATCH v4 2/3] slab: improve KMALLOC_PARTITION_RANDOM randomness
From: Marco Elver <elver@google.com>
To: elver@google.com, Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Bill Wendling <morbo@google.com>, 
	David Hildenbrand <david@kernel.org>, David Rientjes <rientjes@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jann Horn <jannh@google.com>, 
	Justin Stitt <justinstitt@google.com>, KP Singh <kpsingh@kernel.org>, Kees Cook <kees@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Matteo Rizzo <matteorizzo@google.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Suren Baghdasaryan <surenb@google.com>, linux-hardening@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, Alexander Potapenko <glider@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kasan-dev@googlegroups.com, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When using CONFIG_KMALLOC_PARTITION_RANDOM, _RET_IP_ was previously used
to identify the allocation site. _RET_IP_, however, evaluates to the
caller's parent's instruction pointer rather than the actual allocation
site; this would lead to collisions where a function performs multiple
allocations.

With the generalization to kmalloc_token_t, we now generate the token at
the outermost macro, and using _THIS_IP_ would fix this for all cases.

Unfortunately, the generic implementation of _THIS_IP_ relies on taking
the address of a local label, which is considered broken by both GCC [1]
and Clang [2] because label addresses are only expected to be used with
computed gotos. While the generic version more or less works today, it
is known to be brittle. For example, Clang -O2 always returns 1 when
this function is inlined:

        static inline unsigned long get_ip(void)
        { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

To provide a reliable unique identifier without breaking architectures
relying on the generic _THIS_IP_, introduce _CODE_LOCATION_: it resolves
to _THIS_IP_ where architectures provide a safe implementation, and
falls back to a zero-cost static marker where _THIS_IP_ is broken.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Signed-off-by: Marco Elver <elver@google.com>
---
v4:
* New patch.
---
 include/linux/instruction_pointer.h | 24 ++++++++++++++++++++++++
 include/linux/slab.h                |  2 +-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/instruction_pointer.h b/include/linux/instruction_pointer.h
index aa0b3ffea935..ea5bc756bd99 100644
--- a/include/linux/instruction_pointer.h
+++ b/include/linux/instruction_pointer.h
@@ -8,6 +8,30 @@
 
 #ifndef _THIS_IP_
 #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
+/*
+ * The current generic definition of _THIS_IP_ is considered broken by GCC [1]
+ * and Clang [2]. In particular, the address of a label is only expected to be
+ * used with a computed goto.
+ *
+ *   [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
+ *   [2] https://github.com/llvm/llvm-project/issues/138272
+ *
+ * Mark it as broken, so that appropriate fallback options can be implemented
+ * for architectures that do not define their own _THIS_IP_.
+ */
+#define HAS_BROKEN_THIS_IP
+#endif
+
+/*
+ * _CODE_LOCATION_ provides a unique identifier for the current code location.
+ * When _THIS_IP_ is broken (generic version), we fall back to a static marker
+ * which guarantees uniqueness and resolves to a constant address at link time,
+ * avoiding runtime overhead and compiler optimizations breaking it.
+ */
+#ifdef HAS_BROKEN_THIS_IP
+#define _CODE_LOCATION_ ({ static const char __here; (unsigned long)&__here; })
+#else
+#define _CODE_LOCATION_ _THIS_IP_
 #endif
 
 #endif /* _LINUX_INSTRUCTION_POINTER_H */
diff --git a/include/linux/slab.h b/include/linux/slab.h
index c232f8a10af6..efab6b2ccf21 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -503,7 +503,7 @@ int kmem_cache_shrink(struct kmem_cache *s);
 typedef struct { unsigned long v; } kmalloc_token_t;
 #ifdef CONFIG_KMALLOC_PARTITION_RANDOM
 extern unsigned long random_kmalloc_seed;
-#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _RET_IP_ })
+#define __kmalloc_token(...) ((kmalloc_token_t){ .v = _CODE_LOCATION_ })
 #elif defined(CONFIG_KMALLOC_PARTITION_TYPED)
 #define __kmalloc_token(...) ((kmalloc_token_t){ .v = __builtin_infer_alloc_token(__VA_ARGS__) })
 #endif
-- 
2.54.0.563.g4f69b47b94-goog

