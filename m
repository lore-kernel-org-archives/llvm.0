Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF02C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:22 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id p17-20020adff211000000b0017b902a7701so3516041wro.19
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=j+xGmYJ7a6naxsOgId4/Y5ehX22eJTAnRqZAmnKJeqk=;
        b=BIT8VeP6OqlyivV/xY4OJ8catpXBR2IJSu8XREWcZg71WaAQIG5+hSM4qIocXAFjTH
         gRBCk6dzWkb5Ke0XMnBRGHcxF+p8r7eNgJsjXXBnQa3KuFdDeGf9PY/FWud8Z5tGk0Dx
         TMS5WC/YyCMQ4Kco5Sz4NOLsAIYw94zsal4vqc8G0xrQL4bEF/N60XkvMzDgctYFiQVI
         w2/tGq06afI4dtOL8NvZqEN4Mr+YXm2ckISYsl33DE1TvSuMEVl4UjqaYZZVgMqRPAO1
         l6LV3jYTi2PS2YN1bmf1XuSMpmIqz92ZQjvfQsvKif8oMYkkNTrZf5xUTmuLXSRM453W
         WdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=j+xGmYJ7a6naxsOgId4/Y5ehX22eJTAnRqZAmnKJeqk=;
        b=0oYYgGsQAgT+SqD3ekIVUpf2iNjIxTc4uiFTDcc8r7rRvD7Cl2JCzwOAInl5Dx5NOK
         ABDTmZiLyIDd0PEeno2618lU9LDG6/iyDxaI5qW8ZVhnbD25fWeQMxNu1vJ61eQeBWOI
         bE+QP+u/Uv7AF83AvUqdcB8s/VX4hbNa73AhRo6c9VlQ5IYUUc83w4GfF2hN2+/mCrRe
         Rl2KiOk2kJyVE4sIZWekjvO2sQXxsrjYZf+3QKQH6lWCQS56pcyD48PTxyDqvhqlSJsg
         Rjbmvt86Z+LA5MhiKDZUSWCBLxSgvvuMiV4SARKRJzgezCibzXnaI3cawbD/UANpiw7L
         QKmQ==
X-Gm-Message-State: AOAM531EdNFuBUkyWJhHBBKWuYkdCdYl1ZvnzGn2V09e3wJjjLl2FcJP
	FUst55Z6/4A9bGZkiUJ2TBiNV7uw3A==
X-Google-Smtp-Source: ABdhPJxMKVacuR9XDxyJLMVa2EiD6d4veLO+QybAaMsXncBxd+AFabcdu3YiPCN9Nl29f+z7+XhyR+Y0JA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:1d1b:: with SMTP id
 l27mr624069wms.1.1638272720147; Tue, 30 Nov 2021 03:45:20 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:15 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-8-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 07/25] kcsan: Call scoped accesses reordered in reports
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

The scoping of an access simply denotes the scope in which it may be
reordered. However, in reports, it'll be less confusing to say the
access is "reordered". This is more accurate when the race occurred.

Signed-off-by: Marco Elver <elver@google.com>
---
 kernel/kcsan/kcsan_test.c |  4 ++--
 kernel/kcsan/report.c     | 16 ++++++++--------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
index 660729238588..6e3c2b8bc608 100644
--- a/kernel/kcsan/kcsan_test.c
+++ b/kernel/kcsan/kcsan_test.c
@@ -213,9 +213,9 @@ static bool report_matches(const struct expect_report *r)
 		const bool is_atomic = (ty & KCSAN_ACCESS_ATOMIC);
 		const bool is_scoped = (ty & KCSAN_ACCESS_SCOPED);
 		const char *const access_type_aux =
-				(is_atomic && is_scoped)	? " (marked, scoped)"
+				(is_atomic && is_scoped)	? " (marked, reordered)"
 				: (is_atomic			? " (marked)"
-				   : (is_scoped			? " (scoped)" : ""));
+				   : (is_scoped			? " (reordered)" : ""));
 
 		if (i == 1) {
 			/* Access 2 */
diff --git a/kernel/kcsan/report.c b/kernel/kcsan/report.c
index fc15077991c4..1b0e050bdf6a 100644
--- a/kernel/kcsan/report.c
+++ b/kernel/kcsan/report.c
@@ -215,9 +215,9 @@ static const char *get_access_type(int type)
 	if (type & KCSAN_ACCESS_ASSERT) {
 		if (type & KCSAN_ACCESS_SCOPED) {
 			if (type & KCSAN_ACCESS_WRITE)
-				return "assert no accesses (scoped)";
+				return "assert no accesses (reordered)";
 			else
-				return "assert no writes (scoped)";
+				return "assert no writes (reordered)";
 		} else {
 			if (type & KCSAN_ACCESS_WRITE)
 				return "assert no accesses";
@@ -240,17 +240,17 @@ static const char *get_access_type(int type)
 	case KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC:
 		return "read-write (marked)";
 	case KCSAN_ACCESS_SCOPED:
-		return "read (scoped)";
+		return "read (reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_ATOMIC:
-		return "read (marked, scoped)";
+		return "read (marked, reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_WRITE:
-		return "write (scoped)";
+		return "write (reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC:
-		return "write (marked, scoped)";
+		return "write (marked, reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE:
-		return "read-write (scoped)";
+		return "read-write (reordered)";
 	case KCSAN_ACCESS_SCOPED | KCSAN_ACCESS_COMPOUND | KCSAN_ACCESS_WRITE | KCSAN_ACCESS_ATOMIC:
-		return "read-write (marked, scoped)";
+		return "read-write (marked, reordered)";
 	default:
 		BUG();
 	}
-- 
2.34.0.rc2.393.gf8c9666880-goog

