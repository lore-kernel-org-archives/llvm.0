Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7D83DC4B2
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 19:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798250; cv=none; b=tjPrrjKVSjikKWsppaVTwVnKkVraWcrjCGhwjn//cepdesfTeo9UIzgxJKNFZmM2K0Z9q8/bx4DeXkDZvqgVKOPRKuCq+qAd4+HCaVfa4CPd3g0hio4uilgwiyRSEY80HcmEF7dYFiQ6Phd4lIXIrx55yXRlsD0e4/gGLCtblco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798250; c=relaxed/simple;
	bh=+TIjHenySK7KBMmnDPQWgEZ4N7BSlTONF2U6rWErhRs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n5WZUIb2RQ919baNEHJgBjGYhCTdd8aPIlrCF4XDl16EYhv6znOZL6F6c9Nnko6ezFsn4EkgRRXq/VJjg1bpRKsqAbxbnNAOyRgUeF/cBd8lbxPBSmwzwS0znjNrIY+3w+QhqjL6awfrHBbE1G1iEolYstNp/S427T5L6RhrZ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Az1L3Iog; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Az1L3Iog"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4891f97aef0so12816475e9.2
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776798247; x=1777403047; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/bsDKIazjoUvS+1au3+tBOKUvZ6ecoU1stpalOdMHw4=;
        b=Az1L3IogXLp29kUsvd4o/Xm7TRSO6TF6U81vDCifOW0Ng5udTtcEj005G9AkGD6ZLE
         UcRZXjJFbMoJQC8MU8Q+bC5vJkFzBvGEqLwhG0LwnX/YRR4mXs8x9kVrCr6PHM1rqE2U
         tlzwHg9hE984FlcCHFF0lvLMndHyGvo1O+AjlIt3VU8/QAUX29gAmP9pAmMR4dpQvddO
         MtesIg9VVmak5PFHL4BXETrNNOAm6D3YDIUNdMy04gjo/Z0yYxzIftbD5I6aKJArdGW6
         l8XJBTRaxJTDcOE2ZaS8MBUwSrMzQf6LC275z3zccw4bl2ee9nBhzG9l8pEqlGCA+N9d
         WrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776798247; x=1777403047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/bsDKIazjoUvS+1au3+tBOKUvZ6ecoU1stpalOdMHw4=;
        b=Hsmm+0yy/jqKSPfLdJi8u2TKE7wGiak0p9IYAPwHX+eGmYrFX7hrfxdaw0ypX92Yqg
         6H+6jepNtoeMxN4cnCwZdBKFNzrVV3UcH7PTQ76M7yHkW2cqyUYeSTPOQhmbxOPK50P4
         NBEVsj3sHscuwpBiqyrVQOb1jPN7l8Kkz8Cg6AIl2Axlui/ub2r/y4EvkQf1d1peMRVX
         8t4M+WwRre4Be19r85m32X2pYa0aWACcharC2PCr8JyTmJEiBZrKGWje1Y95R7frFtlB
         rwznklrnFNYU/WbR/l9J/sYAnqqPSEDmGy5AZd8HHa8Z0vDIbzD6HfmssVL/MEb6tgep
         T0xg==
X-Forwarded-Encrypted: i=1; AFNElJ9xvysWo/8QSWvvZnEZoo6zv7YXazBQZ4765OQksvmIDqEjqHDV49EGhVmcNhysvE2QRYbl@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi9lfdJeXp8VYPuNyfxS2WgJ3Mcc7HT+T1fWtft/IY/9pxOuh+
	TStqCqKZRB/sgJzFH9PeTuhsZWmjRrxojwcho3eR+MQ0Be+gIBQpXOeSnAJycDjsC1W/w9QihI5
	ZJQ==
X-Received: from wmbd5.prod.google.com ([2002:a05:600c:58c5:b0:487:38f4:9550])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:19c8:b0:48a:554d:b9a2
 with SMTP id 5b1f17b1804b1-48a554dba51mr69868525e9.6.1776798247249; Tue, 21
 Apr 2026 12:04:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 21:03:48 +0200
In-Reply-To: <20260421190351.1976329-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com>
X-Mailer: git-send-email 2.54.0.rc2.533.g4f5dca5207-goog
Message-ID: <20260421190351.1976329-2-elver@google.com>
Subject: [PATCH 2/2] kcsan: Silence -Wmaybe-uninitialized when calling __kcsan_check_access()
From: Marco Elver <elver@google.com>
To: elver@google.com
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Some subsystems enable -Wmaybe-uninitialized [1], which can trigger
false positives when KCSAN is enabled. Specifically, passing an
uninitialized variable to functions that instrument accesses (e.g.,
`copy_from_user()`) results in calls to `__kcsan_check_access()`.

Because `__kcsan_check_access()` takes a `const volatile void *ptr`, GCC
infers that the function may read the memory location, and thus warns if
the passed variable is uninitialized.

However, KCSAN is a dynamic analysis tool for data race detection. While
it does read the memory location to detect concurrent modifications, the
"initialized'ness" of the memory location is irrelevant for its
analysis.

Silence the warning by annotating `__kcsan_check_access()` with
`__access(none, 1)`. This tells the compiler that the pointer is not
used to access the referenced object, avoiding the false positive.

This fixes warnings like:

|   CC      fs/ntfs3/file.o
| In file included from include/asm-generic/rwonce.h:27,
|                  from arch/arm64/include/asm/rwonce.h:81,
|                  from include/linux/compiler.h:369,
|                  from include/linux/array_size.h:5,
|                  from include/linux/kernel.h:16,
|                  from include/linux/backing-dev.h:12,
|                  from fs/ntfs3/file.c:10:
| In function 'instrument_copy_from_user_before',
|     inlined from '_inline_copy_from_user' at include/linux/uaccess.h:184:2,
|     inlined from 'copy_from_user' at include/linux/uaccess.h:221:9,
|     inlined from 'ntfs_ioctl_fitrim' at fs/ntfs3/file.c:77:6,
|     inlined from 'ntfs_ioctl' at fs/ntfs3/file.c:164:10:
| include/linux/kcsan-checks.h:220:28: error: 'range' may be used uninitialized [-Werror=maybe-uninitialized]
|   220 | #define kcsan_check_access __kcsan_check_access
|       |                            ^
| include/linux/kcsan-checks.h:311:9: note: in expansion of macro 'kcsan_check_access'
|   311 |         kcsan_check_access(ptr, size, KCSAN_ACCESS_WRITE)
|       |         ^~~~~~~~~~~~~~~~~~
| include/linux/instrumented.h:147:9: note: in expansion of macro 'kcsan_check_write'
|   147 |         kcsan_check_write(to, n);
|       |         ^~~~~~~~~~~~~~~~~
| include/linux/kcsan-checks.h: In function 'ntfs_ioctl':
| include/linux/kcsan-checks.h:37:6: note: by argument 1 of type 'const volatile void *' to '__kcsan_check_access' declared here
|    37 | void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
|       |      ^~~~~~~~~~~~~~~~~~~~
| fs/ntfs3/file.c:65:29: note: 'range' declared here
|    65 |         struct fstrim_range range;
|       |                             ^~~~~

Link: https://lore.kernel.org/all/5da10cca-875b-418d-b54e-6be3ea32c266@app.fastmail.com/ [1]
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kcsan-checks.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kcsan-checks.h b/include/linux/kcsan-checks.h
index 92f3843d9ebb..3a44f90ebd2b 100644
--- a/include/linux/kcsan-checks.h
+++ b/include/linux/kcsan-checks.h
@@ -34,7 +34,7 @@
  * @size: size of access
  * @type: access type modifier
  */
-void __kcsan_check_access(const volatile void *ptr, size_t size, int type);
+void __kcsan_check_access(const volatile void *ptr, size_t size, int type) __access(none, 1);
 
 /*
  * See definition of __tsan_atomic_signal_fence() in kernel/kcsan/core.c.
-- 
2.54.0.rc2.533.g4f5dca5207-goog

