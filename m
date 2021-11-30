Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B122C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:09 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id ay34-20020a05600c1e2200b00337fd217772so12696038wmb.4
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=ZmySmV7nXgp7ZU44HAHRwN8PhZWnIeFNi9/5LSGaJn0=;
        b=hs4LlI5lsoVztdyeXHYGVaXqoGqfWxtfU47ZxaWIXMF2LtJbb78kUIVc0cRuvGbMfb
         UNw6/fXMdGtPv2h8zBMi5zOcBaSwfjE2+nKiMNKeM9jeUs4vjbJK99CBpMUY1igcK2AO
         hkM8i+x5rI34uTiK4kGz6Ny8KsFfPBn9Skfxtgdf+EY6mB5WctN9uRu5XKue8YS4CWPZ
         MuVmceyTqxFjckuQpfDMMo3/XKIvHHLDEu5mET7aFh3FTzDlkJ5ONfBlsc2EWCjP5kGc
         SyQVbaVFhKuFSos4aYqJ8KZimc+D5tJysctdVSWpiS6AHqJ7/PEA9mqqH25rLKWF5py6
         iIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ZmySmV7nXgp7ZU44HAHRwN8PhZWnIeFNi9/5LSGaJn0=;
        b=ZLY9JPY+ZDrmxCgmWQeD8XG66HwDSgefP2cZ8966z5Ft6+9g8XEmZijpm9tEqOivFq
         l4Wm4QqVUQAmG+fi5484xwzc3boV5RdZP7Zu3n57MVPTvrk/WyOw/aTItrIA6njly9Ih
         Z5D6PGwzydpZ7VpbPWsjsLjpsGeRsE2ekliwWar1ek64xtVTPWO9fWjxSD+yrx3VXCQO
         CEhCiJ7+Y9lcM79Dcov26aRTDy200sCG3NQsn6M7XpsxoMB93vZuM3ZOl90ayh4fCf4v
         EExtbpUZPB3d+Tgr1PhFlTaukMkoL49rcb5c8VlUze4fC4EsZiAXGBiPoksD6MciJlKK
         smUA==
X-Gm-Message-State: AOAM530a0BtE3YZLrUSEZIrNeVWTA3SZ57Z+IN9+NsM/iL7pxAVkqWv0
	hKmw+r6Asi7ztBzmSklwy1ycq2MKNQ==
X-Google-Smtp-Source: ABdhPJwtFgfDTN6vPjSFkCyUpvSQ19ytHU7Acqp52u/sb5E17RDsJPS4ZB9wklKdX5QEMGX86DVOVVVs4A==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:4f0b:: with SMTP id
 l11mr625318wmq.0.1638272707028; Tue, 30 Nov 2021 03:45:07 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:10 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-3-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 02/25] kcsan: Remove redundant zero-initialization of globals
From: Marco Elver <elver@google.com>
To: elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

They are implicitly zero-initialized, remove explicit initialization.
It keeps the upcoming additions to kcsan_ctx consistent with the rest.

No functional change intended.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
v3:
* Minimize diff by leaving "scoped_accesses" on its own line, which
  should also reduce diff of future changes.
---
 init/init_task.c    | 5 -----
 kernel/kcsan/core.c | 5 -----
 2 files changed, 10 deletions(-)

diff --git a/init/init_task.c b/init/init_task.c
index 2d024066e27b..73cc8f03511a 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -182,11 +182,6 @@ struct task_struct init_task
 #endif
 #ifdef CONFIG_KCSAN
 	.kcsan_ctx = {
-		.disable_count		= 0,
-		.atomic_next		= 0,
-		.atomic_nest_count	= 0,
-		.in_flat_atomic		= false,
-		.access_mask		= 0,
 		.scoped_accesses	= {LIST_POISON1, NULL},
 	},
 #endif
diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 6bfd3040f46b..e34a1710b7bc 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -44,11 +44,6 @@ bool kcsan_enabled;
 
 /* Per-CPU kcsan_ctx for interrupts */
 static DEFINE_PER_CPU(struct kcsan_ctx, kcsan_cpu_ctx) = {
-	.disable_count		= 0,
-	.atomic_next		= 0,
-	.atomic_nest_count	= 0,
-	.in_flat_atomic		= false,
-	.access_mask		= 0,
 	.scoped_accesses	= {LIST_POISON1, NULL},
 };
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

