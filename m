Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9332D9798
	for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 10:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880208; cv=none; b=GSmO843WzgJ6w9RoD6F8iG1traR1lsHwOVfrox58KM5tT9JR/xtarQHWFsQp5bHsgD2Lwf6iR3meytuOQ5nufYHzBuPbP9TgWZL7fLGgEdZujTb25XX+RYW+QWVQl1JrOB4B+j8AWyG9mCBINrVWRKcKRsmVyRb+dUlxfCpQaqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880208; c=relaxed/simple;
	bh=UqT3/wpgbl7D5Ah8gT/lzqQXa/i5498DuuatCip0UAg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fRKXAe/GZOAHwWqXBEVGRkgKlfVS72jEHDGHKCkDRlfQ+gP/ywjAC14XAm4wL+vsmInkql4++w5ya04GesKfaYHgXbpVDPv0eUS8b+NI+ivjYgXdqb4KrFeM6K095+jV7jgcs0hLDlBg0E6NjbZ294lThmEYWu7KHW3GqUPHzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JjPLB9zH; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JjPLB9zH"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so23629035e9.2
        for <llvm@lists.linux.dev>; Tue, 16 Dec 2025 02:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765880206; x=1766485006; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uP2brnCrErMSve8D4fzLeDUYWZS9bjiXvF2HnuazcK4=;
        b=JjPLB9zHbgTM7cFnxr16magxPtMwAwSVvCO3fgVGNuW8XLvqB6Pbq3wD/2n/CIp0K4
         4L2ZlqifDi9qmwMz03O4t2JFkMuUfgI77L0KFbTj7RSyVG3/XfA19aO7m8W8xSB1S27A
         P9R0Eyx+b0pHUv3gsTg5gqizVka/8j3veO9Hn1OztjfpaM6h4XqxfR86a+2YG015jgSf
         jU9HkClBENOmPQsMb7VkDgdJH/CQpU/PH3wTD6eg1O8oNhsD63a1A37N+mJqVJBg5nE6
         vSmecqxkdQJBp70x7kaBoDu525djfsYQINOMej/5o66dhdeAmtO9k13/jE2t6ZK+xL9T
         bWsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765880206; x=1766485006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uP2brnCrErMSve8D4fzLeDUYWZS9bjiXvF2HnuazcK4=;
        b=m34NYuP7aUSWWnKF0CPNAyNB44Gpnoz1By4mkB+hdb3jC5O0WY9hXdc6wimpHApsNQ
         ToiysApORQoP+7z5bGVXYDkBRCYSNstTqkv5nweLhqlqwUb9UxeaVr+CZWzulyaWzxat
         29KfEXnDunhTe0Au1iFdT4/DXJsKFn/zgIrk/MdxDyqspp6F5oFWbqCBiKzIrdV7ydR+
         IcaqPdECGlwDCnhv2gIWqfyiIQdHkwOIr2/p9yMOCcHLPVS1jvLWaigu7UpsWETMTfxo
         lmZG+0Q4CujxOIJ9+u0DOuz96L0dEBruqJwO34sxW+VUozDdB3v9xEKNfNFfeWMy0KYK
         IkQw==
X-Forwarded-Encrypted: i=1; AJvYcCW77DnPkBg6fNPfHq6srD/tJJji9lmHYVPEXOg+J3pMwTV76Btg+jyJSxw8cin6bK0Sk9RV@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5tjgJ/JHkyp6VuNHlOmLIvmTaFC2NGdCFaiP4v3yVgp9K4GAI
	NvNzBy1tGXf2Lk86mywh2r5DEwGDssgCo72upIv4TkMRLUU+rwtKMrRLzzPvo+8IMx1l9FMzK0D
	43VhbEnojt+Q7+w==
X-Google-Smtp-Source: AGHT+IE9byNy3arFbMr8XcZNB20Awn6Uqt+GnxA9cDbawxlvEo1C+skvkh+GN9lewQ05aOKuGiox0YHCKpVs8Q==
X-Received: from wmsl5.prod.google.com ([2002:a05:600c:1d05:b0:476:ddb0:2391])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820f:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47a8f90656dmr126613995e9.19.1765880205747;
 Tue, 16 Dec 2025 02:16:45 -0800 (PST)
Date: Tue, 16 Dec 2025 10:16:34 +0000
In-Reply-To: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20251216-gcov-inline-noinstr-v3-0-10244d154451@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20251216-gcov-inline-noinstr-v3-1-10244d154451@google.com>
Subject: [PATCH v3 1/3] kasan: mark !__SANITIZE_ADDRESS__ stubs __always_inline
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
KASAN-instrumented via explicit calls to instrument_* functions from
include/linux/instrumented.h.

This bitops are used from noinstr code in __sev_es_nmi_complete(). This
code avoids noinstr violations by disabling __SANITIZE_ADDRESS__ etc for
the compilation unit.

However, when GCOV is enabled, there can still be violations caused by
the stub versions of these functions, since coverage instrumentation is
injected that causes them to be out-of-lined.

Fix this by just applying __always_inline.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 include/linux/kasan-checks.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/kasan-checks.h b/include/linux/kasan-checks.h
index 3d6d22a25bdc391c0015a6daf2249d6bea752dcb..9aa0f1cc90133ca334afa478b5f762aef9e5d79c 100644
--- a/include/linux/kasan-checks.h
+++ b/include/linux/kasan-checks.h
@@ -37,11 +37,11 @@ static inline bool __kasan_check_write(const volatile void *p, unsigned int size
 #define kasan_check_read __kasan_check_read
 #define kasan_check_write __kasan_check_write
 #else
-static inline bool kasan_check_read(const volatile void *p, unsigned int size)
+static __always_inline bool kasan_check_read(const volatile void *p, unsigned int size)
 {
 	return true;
 }
-static inline bool kasan_check_write(const volatile void *p, unsigned int size)
+static __always_inline bool kasan_check_write(const volatile void *p, unsigned int size)
 {
 	return true;
 }

-- 
2.50.1

