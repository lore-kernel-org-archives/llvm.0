Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9C32C309
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 10:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880211; cv=none; b=PBNZKhfrnUDb3ZKZ3Nj0phGEKHBagwiHM4H4lIssUCI4bxAHxBC+4LPUIE/BYljc7LvKo/He8GH/K0fYhDEU24LFwEiXmvdq8nFjmbKw7PZfOYhnDTV3+Ja+jeFRs7Pi13YeFIHfxD1pt7CGTt/fc6zQ0EsGJ3Bf4EuXZLpq/m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880211; c=relaxed/simple;
	bh=inD0vuzY52gOH2nE9ERpF+9ByKT4ccPlPybBeV0pgH8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HCAPyy1eXEKDgFNKZ0ShLi+kpIwOV/HaTUn4X2GqsixMWB73j7wAayOFyMDpRKURT0HzGvWbk7fTCk1C3aAb83F+NjeIlU0SJiPXqOVQttctDae0qJQQf5jgynEgKPAvlagzs+c+PuOKLR1rRqApcPZxpiIWGYq+Jy9AVvyxeN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3AZgIvxY; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3AZgIvxY"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43065ad16a8so1420925f8f.1
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 02:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765880207; x=1766485007; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eBg82DgwaEqXYt7FN7z5QKnLiVSgwPtdomNA9XrlWso=;
        b=3AZgIvxYt/Z20Befh9WEH9nUcJ5qRVeb8xLz2hIW2iZ7kdsY3MvuNweumqUqizvFHY
         IEpukkcWUAPPTFqXWDEOIStM/F0mkVZ8CxIU6nBKVtpigRi41ip6OWgdiw6fTw2FUVm6
         AnMBxvDB8hBRGZ4OOVUV9xN52YMGNL7LlACBJKanfnhx4LToMb+qugyjzMPZpSbud5mB
         2wayL+i35yQu6xKmqrsyoLHzpEXjuHqk75pg9wg6Zlb+AVcllcDoVRa6b5FddIn1p5xG
         CPG2DaR1Oh2mHAP1JI1r+uUSN1TvWqfPB3ycz9foR/nKg2XJ8xW0ppxFp1SndONlDusA
         XzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880207; x=1766485007;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBg82DgwaEqXYt7FN7z5QKnLiVSgwPtdomNA9XrlWso=;
        b=Pwm2XfqZdaYltiKjvu2CiUS7Gg0TFnu5mT7Dyxy+QZrhNQYfM6PgUls6UgnRPa0p6d
         sIL60031fGCiVpGq8iJgxEVVGfIlo6cGfuxj/icERQo2Qb+8fmy3wBNCE0WY1DhqOdjf
         NYnTFlzad75VUTV42VREY2YSg73tdBnDd5BFmC9ET+yTe2JrxOw3nq0ebru4mdMEHugk
         Mu4LG+MfnRnIZtRfAucsG+AAZp/qzl7edcUZief3mtBMiIrXzt6cYFedzU+uGRAbeXho
         0j5IDFDTt5rWLqcEPXaI8CDYo7zBtAIux92yxbE1l4RP4brZaWoJ6IrCE6aeVrRWc4wc
         dEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVaSnP6Sga5MoMqgm8y5steUMKoBqge6X9YwevmaW+F4kUEMXHvS7CZix1sEyJOhSqFZJ2@lists.linux.dev
X-Gm-Message-State: AOJu0YzFDahZsirCUXwbZybn5ccbYRa9lhWGbn1hgitIwszvlPY/sRKN
	/E3LNmYQGZv4nTZWepibSGTe+l7077iZfRhIBqL+VFY0sutvb9K3zollEOKTOPY0I/xretEe31z
	qhrDtSu+Iff9kCQ==
X-Google-Smtp-Source: AGHT+IF8tg4ARFUPauM+RrKtcrJYaCoO/GiRg/I5s8E/PwBQR4bK4eIXW9Jg1Q+cB8/UwyWh9QatXY67S1YaaQ==
X-Received: from wmbju24.prod.google.com ([2002:a05:600c:56d8:b0:477:7aa2:99cb])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:6405:20b0:47a:935f:618e with SMTP id 5b1f17b1804b1-47a935f64d7mr109743655e9.15.1765880207747;
 Tue, 16 Dec 2025 02:16:47 -0800 (PST)
Date: Tue, 16 Dec 2025 10:16:36 +0000
In-Reply-To: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251216-gcov-inline-noinstr-v3-3-10244d154451@google.com>
Subject: [PATCH v3 3/3] x86/sev: Disable GCOV on noinstr object
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

With Debian clang version 19.1.7 (3+build5) there are calls to
kasan_check_write() from __sev_es_nmi_complete, which violates noinstr.
Fix it by disabling GCOV for the noinstr object, as has been done for
previous such instrumentation issues.

Note that this file already disables __SANITIZE_ADDRESS__ and
__SANITIZE_THREAD__, thus calls like kasan_check_write() ought to be
nops regardless of GCOV. This has been fixed in other patches. However,
to avoid any other accidental instrumentation showing up, (and since, in
principle GCOV is instrumentation and hence should be disabled for
noinstr code anyway), disable GCOV overall as well.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/coco/sev/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/coco/sev/Makefile b/arch/x86/coco/sev/Makefile
index 3b8ae214a6a64de6bb208eb3b7c8bf12007ccc2c..b2e9ec2f69014fa3507d40c6c266f1b74d634fcb 100644
--- a/arch/x86/coco/sev/Makefile
+++ b/arch/x86/coco/sev/Makefile
@@ -8,3 +8,5 @@ UBSAN_SANITIZE_noinstr.o	:= n
 # GCC may fail to respect __no_sanitize_address or __no_kcsan when inlining
 KASAN_SANITIZE_noinstr.o	:= n
 KCSAN_SANITIZE_noinstr.o	:= n
+
+GCOV_PROFILE_noinstr.o		:= n

-- 
2.50.1

