Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4F72C9D
	for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 11:45:46 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id c8-20020a7bc848000000b0033bf856f0easo13620977wml.1
        for <llvm@lists.linux.dev>; Tue, 30 Nov 2021 03:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=JvNCvfwB/M304r5/BDcWOzh3dLnMrHum3apHlfxEx/4=;
        b=HGTmGOZbV8BO8UVwawHP2qaUUIQR8l5KZLll/+rqQfeQwOOUV8mNOVjYuSRralZ5Aj
         Twljfp8LxW2WknHiRqI9QoWbiqLagWNhyAuGUORzqavLTJN5zuDJkA6xswrqgI98Q+uE
         sGDIjOsQo9WMuJw/ByUioVp1OJy74McWnV33/n/ke3sFX2NvSAiuq9skxWedjHC8nrai
         PFaVXbEHKi7lgTq4v/bsg0Ngh7AzO5iLGy1cgulyhEEKXvYvFqiiN0vi/YfKe4jiq5uk
         +dCCCqPcYM82viw2lZRJNNCNvZn4sNAzh4K9IyWAuaDW1a3v+W75mITtZVW93eEWrquG
         Qiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=JvNCvfwB/M304r5/BDcWOzh3dLnMrHum3apHlfxEx/4=;
        b=S6k19DlYova9L4bioX24Cgm+z6itP+CIvnXxa3qahx0mW9jMo+lhkzoG6ZH6XcznEI
         +hi/2GfyabFHccAugJdf9wEzg+gIkd8XLCkEqRHFqFXPhSGCbfdBGzO7RnWzWtGwrowX
         rHY2TBS50bFHm0xzG9kH+dt1gcJpUFotJWozsnpkwtMMx3ZFeNtp1k3w1/MzpL8FQp4X
         k5/0lE13VjwVDs2SvFj9Ho8A+rw2nijsR6iNilQomTiPnPMdC0gpCfN6dh0cnRjU1wi1
         q745yj7utRzaNjkT5VYb0P/Yz3lxJK9WnWeTEZd7H/gFH4s5vHWBlaCdChvpt/dVq5nt
         dJ3Q==
X-Gm-Message-State: AOAM533ae+o7XgD83UugJD9I19B9yMEQlHbilcj71aAc/0Uft/IsLoLE
	ZQLDZm77Ng8JdHEH13BM7qVGdrX+uw==
X-Google-Smtp-Source: ABdhPJzSDzQegokGIwsGrKkVQ/IhdBWsBMMU4nwhK3bFeKxSJ75NPWkWR6nK52NPFK40FBPIH38r66gw+w==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:2e46:: with SMTP id
 q6mr4344091wmf.6.1638272744574; Tue, 30 Nov 2021 03:45:44 -0800 (PST)
Date: Tue, 30 Nov 2021 12:44:25 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-18-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 17/25] asm-generic/bitops, kcsan: Add instrumentation for barriers
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

Adds the required KCSAN instrumentation for barriers of atomic bitops.

Signed-off-by: Marco Elver <elver@google.com>
---
 include/asm-generic/bitops/instrumented-atomic.h | 3 +++
 include/asm-generic/bitops/instrumented-lock.h   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/asm-generic/bitops/instrumented-atomic.h b/include/asm-generic/bitops/instrumented-atomic.h
index 81915dcd4b4e..c90192b1c755 100644
--- a/include/asm-generic/bitops/instrumented-atomic.h
+++ b/include/asm-generic/bitops/instrumented-atomic.h
@@ -67,6 +67,7 @@ static inline void change_bit(long nr, volatile unsigned long *addr)
  */
 static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
 {
+	kcsan_mb();
 	instrument_atomic_read_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_set_bit(nr, addr);
 }
@@ -80,6 +81,7 @@ static inline bool test_and_set_bit(long nr, volatile unsigned long *addr)
  */
 static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
 {
+	kcsan_mb();
 	instrument_atomic_read_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_clear_bit(nr, addr);
 }
@@ -93,6 +95,7 @@ static inline bool test_and_clear_bit(long nr, volatile unsigned long *addr)
  */
 static inline bool test_and_change_bit(long nr, volatile unsigned long *addr)
 {
+	kcsan_mb();
 	instrument_atomic_read_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_test_and_change_bit(nr, addr);
 }
diff --git a/include/asm-generic/bitops/instrumented-lock.h b/include/asm-generic/bitops/instrumented-lock.h
index 75ef606f7145..eb64bd4f11f3 100644
--- a/include/asm-generic/bitops/instrumented-lock.h
+++ b/include/asm-generic/bitops/instrumented-lock.h
@@ -22,6 +22,7 @@
  */
 static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
 {
+	kcsan_release();
 	instrument_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	arch_clear_bit_unlock(nr, addr);
 }
@@ -37,6 +38,7 @@ static inline void clear_bit_unlock(long nr, volatile unsigned long *addr)
  */
 static inline void __clear_bit_unlock(long nr, volatile unsigned long *addr)
 {
+	kcsan_release();
 	instrument_write(addr + BIT_WORD(nr), sizeof(long));
 	arch___clear_bit_unlock(nr, addr);
 }
@@ -71,6 +73,7 @@ static inline bool test_and_set_bit_lock(long nr, volatile unsigned long *addr)
 static inline bool
 clear_bit_unlock_is_negative_byte(long nr, volatile unsigned long *addr)
 {
+	kcsan_release();
 	instrument_atomic_write(addr + BIT_WORD(nr), sizeof(long));
 	return arch_clear_bit_unlock_is_negative_byte(nr, addr);
 }
-- 
2.34.0.rc2.393.gf8c9666880-goog

