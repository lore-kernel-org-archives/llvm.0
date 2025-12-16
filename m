Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65BBC32E143
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 10:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880210; cv=none; b=k6NWPhPKl7d9vhCDDKBoRljqiKk4toOL0HnRPNB+EC8oMAj97e2dYjlldwNe6egfyQCPr7ss9TGYYOF52NetFvvhkOgs2q/ab998QXH0HLa8OJjpLaVJovSRwukykgSLTMpVBprl3ZQjNCrmcdoiByFEc/Hlw64laya661YjA/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880210; c=relaxed/simple;
	bh=6gLHtvCRjdFJvUPhmnKzmZ6MUckU9lfZ/Xjsh3goSnw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=utyc/IdXTWp9hSVF1XuP779yuh9Ox9NCUGsP/aFLtlX3mwG9lukQB8AaSGuRVmTTY/Z5n+kRBUs8SCao/TDqnkN9qRA4SKeEEXk6zTKR3seXKrhTZVx1dCfZFoBoRomDR6F/BE6TE/owj7p7hGFFDYHu552o4cf8Qum8FxvfUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RLvYUJ/O; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RLvYUJ/O"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43100a07eb1so886932f8f.3
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765880207; x=1766485007; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIaoUkPmmOJUMbaBzFd5RgQ3q7rdKEgi166V60yfEd4=;
        b=RLvYUJ/O3grFTTsAIRO5zWX2oawIHD50atG9tzeljvD9c8+q4DeJyPMauA0J8daotM
         aKsr62+KtBK3VTJLNgc/btlHTPd9YwyRpQSsBZzclTyT+50qxJW0AeR3B/NR2pa+tJO6
         aVl+6NEeDhh9DBEmaLbny04leTOc2cVww6ugKm0CHOBiYGtuqIUeJa1QSZ0GoUja8zXV
         kGK2ovRY6GmeL/XqkmTsPWzXE3K6GnTAtJZn1JLYJ2sNK0QvOKxBmPNC9wh6ip/kF6ST
         Pf3kD3EmdpH8PcxyDbr73ZMB1DUjKHTNdyawNLxzTeVNwuF5aDcNcjOkiF68usw8L4rg
         44nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880207; x=1766485007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIaoUkPmmOJUMbaBzFd5RgQ3q7rdKEgi166V60yfEd4=;
        b=bFS3zm1JhjmaycsyzYxPLj5gtrfNqdM14DLcury1kO4xzh/FFKUBAIAP8k4HG5mweb
         sj6y9Tv3VtEn+RP2VI70pK2RLVQ/UGM5B9iDnqW22Oepe2ReuKzPKiIp2AngxJ8tA2gU
         o/czu7sqrs2NcwmFMfPY60bDoLHLF/oLqMx4njJcuE8tcfJuXZ0+6qa767a40pa1Ct9/
         WQ3aVtYbNSnIKUJ0FnMdzCU0vdFMvO66Vp+rv++hMHzyS0mfZfzrf0zNDP1EBXUJBz/D
         fknUgkONPjArcZ3YN25PP01i5bm2+JFCQX0Jqq2crTgtjwa9HTSf3jJkqCyrglRFh0lH
         5bEw==
X-Forwarded-Encrypted: i=1; AJvYcCX0Wlu+S0yi9O7RmEVcJq1u9ThvJi6vwR8KDDLqDJg/9ZE5jqhw5pOLreMPTrWLT+A0BbQS@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp72suT4iuHEoSm9E1bKSXks0RdoJRRhIgnawKKLvQeJwqfOWO
	0LGSbiQnY0GCAmD1b63dC0J0w8Hz11RRtBHc2VGfsdUklOb6cgDpvuEtOw4ePq2Bfi3CVTTqxQI
	9TThbJhhVXTOn8g==
X-Google-Smtp-Source: AGHT+IFS5MNBem4cFAx1/02LlUKM4nsKU3vLRTVMVpy1DPCx+drNnY04kUwxrb61WCmz4Bwjhz6dwtKzVbGRYg==
X-Received: from wmbhi3.prod.google.com ([2002:a05:600c:5343:b0:477:c551:bdb9])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6405:20b0:47a:935f:618e with SMTP id 5b1f17b1804b1-47a935f64d7mr109743225e9.15.1765880206873;
 Tue, 16 Dec 2025 02:16:46 -0800 (PST)
Date: Tue, 16 Dec 2025 10:16:35 +0000
In-Reply-To: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251216-gcov-inline-noinstr-v3-2-10244d154451@google.com>
Subject: [PATCH v3 2/3] kcsan: mark !__SANITIZE_THREAD__ stubs __always_inline
From: Brendan Jackman <jackmanb@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Marco Elver <elver@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

The x86 instrumented bitops in
include/asm-generic/bitops/instrumented-non-atomic.h are
KCSAN-instrumented via explicit calls to instrument_* functions from
include/linux/instrumented.h.

This bitops are used from noinstr code in __sev_es_nmi_complete(). This
code avoids noinstr violations by disabling __SANITIZE_THREAD__ etc for
the compilation unit.

However, when GCOV is enabled, there can still be violations caused by
the stub versions of these functions, since coverage instrumentation is
injected that causes them to be out-of-lined.

Fix this by just applying __always_inline.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 include/linux/kcsan-checks.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
index 92f3843d9ebb8177432bb4eccc151ea66d3dcbb7..c4c8e03e53459f5030ca33f9103a9bde49fd3820 100644
--- a/include/linux/kcsan-checks.h
+++ b/include/linux/kcsan-checks.h
@@ -226,10 +226,10 @@ static inline void kcsan_end_scoped_access(struct kcsan_scoped_access *sa) { }
 #define __kcsan_disable_current kcsan_disable_current
 #define __kcsan_enable_current kcsan_enable_current_nowarn
 #else /* __SANITIZE_THREAD__ */
-static inline void kcsan_check_access(const volatile void *ptr, size_t size,
-				      int type) { }
-static inline void __kcsan_enable_current(void)  { }
-static inline void __kcsan_disable_current(void) { }
+static __always_inline void kcsan_check_access(const volatile void *ptr,
+					       size_t size, int type) { }
+static __always_inline void __kcsan_enable_current(void)  { }
+static __always_inline void __kcsan_disable_current(void) { }
 #endif /* __SANITIZE_THREAD__ */
 
 #if defined(CONFIG_KCSAN_WEAK_MEMORY) && defined(__SANITIZE_THREAD__)

-- 
2.50.1

