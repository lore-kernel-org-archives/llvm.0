Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158306;
	b=jSgUJQIyFuxdU7JFR7fO8FoGupQ1sRFgjNJcaq2tHKAVChTwxLyoc8BbMDAEjEo/bdkp
	 ALFIzwykuw05Xt0h6LG6gwfaJ5Cn0IzQycMLS5A8YQ1HyKby00n5LYJ0B2Rw36YrGihfd
	 ++vALYNpT/MSHU+pDKwPjEn8cujR3weN026OYpmWbatlMJkfIrODQ5Tn78bBxAbHuS1dV
	 Y5XBXHS1Ygjwn7GBa1sy5ugXsiPDZUk00B8qa6UIMpivHhsxDAFZZaMzCba8J0lI9sOA0
	 ypCWXlCVR6EoWu94fm79z4YST4ruRmOLt2IpqlMK+OtIt++I79sOQ5xkm5qxtdky+mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
	b=WJJIbz8OidhoSOKO/CWiqgu0WQYexibyX+Mj1yxG3BAz6ZeLveSbBu0K9xV/RdhOrKlu
	 v4CpapKZwjhSGnFCe7vag0vDb9bI2Es/Azqdam9sV6d9DIBAe7rgROjQehpd+T0zR73Vm
	 kGv9szinC4IrFd5TPAYIrMK4y+maygWKpU3jbhau0kSjvYjVIaNvPKIX2nDT+1FVrMkDA
	 poAQLeI4QaPgsDrH79FWZ2ntd7HGVJmDDMEuzVJWXIeMc4TQNUExrwXCFmzjSyDZ8zv2U
	 jyQ6flfpYPYOeTsSm8YYOQWxlv0NQkj6nciZPshALBGTHOPmOzAxVnYhxxDpTunppHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DwI/Ydqb";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9A0606A321
	for <llvm@lists.linux.dev>; Wed, 28 Oct 2026 03:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwI/Ydqb
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3042615e9.0
        for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158304; x=1793763104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=DwI/YdqbIM2W+EyLRmCgfYJku9HBYIQDSjcnqYIIptnMa284z9OMoGhecaYySt0xF/
         stpBo5TwFzJYRWvCY0MIE4Kq9mFPfFAK8n2xeafh7Khm046MpJFwgWng1a5nMM2qOoO7
         E/5s+CS/ab0HRdyaD5hiu/Cg8/veIUckAnM2KV47uKz5Gcgq8peaD691Me2Mke3PAddR
         z4xLWkAUoEMRQlclRkCXUKz733lx+lLI++DZ7ayQCNfLWN99vE38cnnu9QwkfzmKf3XQ
         ER1kW2btSrgKO2EWz2TZ69G6oaRebcIZ6iOPoO/eTpZP59Tek9F6N4IFSaiCcaBim15i
         3bAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158304; x=1793763104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=KtU6BT+hE/jbKIKs8S+QBmwhfTnalrKojdjGZbxiz5L9jGzoexYFS0xaMG9f3zZRII
         4yZEtnRgxJ+XPqkryf+vH8ku5jrj5tV/MqycWUy+LEMIbBYzy+kRic+jMxbZ2eRNaLjV
         Ye5g+r30CaZHcwjpM9xzWmkZi1lZVqKYmOc4JEK6dpOr/20kWNPkXUs47w+k9H1cZM0p
         vR0U3G7YD2mLRJjjI9VZvMWUaH8fF2cUKnfYJukVKL6+WSUcl4Xez+PH5sp6mT2ZD/KW
         YA6D7OzGvbIClFXTk+f2ZhJeZvxTkKM7BdXGtq/mG+Zfs6ynql/nhtf0P1Z2d/LbrG6N
         Rl4g==
X-Forwarded-Encrypted: i=1; AKwUvBzS9G1J8kUhb5ceXo9FY+1otGQIK2wACO2YlMlVuSqbmiIBBQIHuhNnOivNTq+aOuS3/xqv@lists.linux.dev
X-Gm-Message-State: AFq9FYJeBP6e4w0equ+ix9pszAfnop4kcDKzqhb80sfva7cInkZll08C
	YJnRl7J/aYm+LiBI/bRjiKrLX3SHnFfv6BffOT6VbUDy2YhPR5i+lUvp
X-Gm-Gg: AYBFou1UB07eSWRobZIhQwBYI4xwokBOIYzSc1VG4l7gTGmF1fH/8DO7Tb6J+5XM+2b
	C5WYXsbcnVSTuwRn7UUPy0aCENx3wSwNmMgGbo1ezKXi3uXc0KzAGW7jxi3gaMKS8/F0x0RpUym
	89BgZdPNt6TeFQOr4ew9lrV65600B3sVR7RzlYj8Wb+WDxmkt2bn5JPz/cyRXujkSdJC2LqG0jl
	OS7q3RT1+4pYN1eluqmEM2H/cZEERv1GxgDyXsrAKZx0HAv/+hdenzGz96w6LExH3dpGN5nQdFa
	cu9IGrsP2GKcv2FfJzflN2JgPRnEynGnv4lrtCZnz87sA4B9VJplC5PzPvIMmt9uMksdP7uHYTu
	aPwvVy/apGcaCrBerCQlnKAnvuSmkqWe8nahOkP0xQVOdeAY7qs2LUIVvaZLKolpLZmySNcx/8c
	MFbH0zyHDW60pejnmekc+3WmRAaHQ4rhnRNXLVMRllnCoYqTi+6Dx6IPYl2+X6i0556lzRVtAt/
	hFzJ1ht3vTKTelU9b2+iClsOZUO8rrdTqXM8QVr/h8SkVHbuu3KkprOJ4pNEKZVRF0B1BPtRNKz
	+dm9Im+UllSNW64LVxgbbpSrw3j/VVtlxWJ/qEvlr/DHGLqGIQW9L9xBVIyGbtRKWCLLp4SZjkA
	XU8C0nrR2eMc+BuKsRxjpUq05P9f8FTqamoO6HEUMhPsAQSTbAl5VAIXlU316DjAGIRUyMKDL9i
	89qlY/D4aF/l2bPH35VZasz6gEjpDwW1eY
X-Received: by 2002:a05:600c:6206:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4a967e8c07cmr16606825e9.34.1793158303715;
        Tue, 27 Oct 2026 20:31:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:42 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 01/13] arm64: Always inline raw preempt count updates
Date: Wed, 28 Oct 2026 04:31:15 +0100
Message-Id: <20261028033127.82193-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyan.xia@transsion.com>

Clang can outline the raw preempt count helpers from noinstr callers into
ordinary instrumentable text. Force the add and subtract operations inline
so entry code performs the count update in its own noinstr section.

This is the preempt-count hunk from Hongyan Xia's pending Kprobe noinstr
RFC. Keep it as a separate prerequisite so the early-hardirq work neither
hides nor claims that fix.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47f7..f3a5c2cd1936d 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
 	return !current_thread_info()->preempt.need_resched;
 }
 
-static inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc += val;
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc -= val;
-- 
2.39.5 (Apple Git-154)
