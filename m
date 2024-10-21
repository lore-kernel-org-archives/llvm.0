Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BA91E47B2
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729512036; cv=none; b=QhA4Yg2ad5gYSx6VH5uesTk7EN89b+e63Ac48ddD8SaIdTYOBHPFH4GI6YSqV/ykq07CiFxW9Vji6aanbqVfNEB7a8xLMEon6J8XKFyJf68LzpGPr0dquCLbpuJZHccIoHtj5CWC3rH7a3OSGwtwmHZNOVSlXLDPNfYoUe7Y8Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729512036; c=relaxed/simple;
	bh=zZ+RIEKJaeAzac64tOlAm+si4QUfJCxVQ2Zk4gbQ+hU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I0QGJrth1VuDGAOTR6RApIwzPhNuvYKXM2y3VsncngahD35ZuBv23mlIg0cjGDkmDmJec1qC3xwFqmREvx+RY48iRXTr4ZLjLmUYQuDupED5pL1o/puKZJmpdg1yVryaaDaBaPkotfyLOGqdi5xdAXNIi9J6v99T9rAKCwgmDi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=itPCX1+z; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="itPCX1+z"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-a99ea3e1448so301703466b.3
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 05:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729512033; x=1730116833; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+RPnI/3Gz1Y4IhHQKOjsXLrlBegzE9vzRcMrKpdABMo=;
        b=itPCX1+zSFoHCfWNjf6jDcio5+tll1OdZ3fHwmWNDJ2iPVbICpUWy/+slIBJJcixj2
         UQxvi+m+4oy8I1SKP76Iyoc88g2Hai/WGNmvNqYqWCR9F2LgQR//x0h0ebl7HfYjG3V+
         tVcOdgdArAu5JjKWO8L00CWgqkB23UOeAE48V2AJyj66q2ZhUz4GVgpOuCp5jTPs2tdD
         BBVEuKFQbtW4c0eTTV87aG449HNq8dKl5/QKMUTYG4FFQV+1lCo83NK07hBUe6RVVbeq
         c83LzvnH3cLiEszAObxxQFtkCvZSs5xhzpiMXp1KYf1EaRgfCcSDHv5n6NQw7/IfkFrv
         v0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512033; x=1730116833;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+RPnI/3Gz1Y4IhHQKOjsXLrlBegzE9vzRcMrKpdABMo=;
        b=X8f+sfGMiQXKowzYYec6xkSkQ4acj1ECupBHoAzNJn9vQW6AAEHcMZd8BXQcTJREFK
         1mlefz8EyF7gB1mtYa8lA03tY4p6uVLmKJEAh9ZPVUr6ewTU0O6BMemUDhUNsrx6nOfb
         Ab8Fz4qPdWwutk4Qw3wspaNPQiwT9uRAdCeap8fq/FEYBLeCCUG6UnCT8jHzPIKmG4zc
         AggmnGACxvolvntC5wKIIyJmQUmATYl7zimUz8xo7gShedsGP0hf5JPOM+3crTCH4u/p
         7wGbI44scER+5AS9XGQQvYArLUo02frROuzSv6ywVIzW9tEFJTY22T0iscpDI4XV8+IE
         o97g==
X-Forwarded-Encrypted: i=1; AJvYcCUPnv+k8+GGEnH4p2i0IfOEJcO8DE18CPnU2FAG9wVASsn0W+OAZshAhUnsdNLwi6fR2iU1@lists.linux.dev
X-Gm-Message-State: AOJu0YzEcf9F8HpusGrfNAeyE7mfLWFxmPBnsriIYAWLJ33ClDgvNJJ6
	yXnwfJrhl2512UT6FuZ7b4ORCUVoGjBN/xub81J0l4aQtRFapi75Nop7dmE/9nR+HNn15Yvthg=
	=
X-Google-Smtp-Source: AGHT+IExePDf+baL7jjY6BFnRt7a2CMIFgRxleUIxOO8K5rRpRCnjIukbvL698G8PB4qafOaxx6gC1grYA==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:9c:201:3103:a9bb:c02c:c514])
 (user=elver job=sendgmr) by 2002:a05:6402:3888:b0:5cb:7780:f516 with SMTP id
 4fb4d7f45d1cf-5cb7780f61fmr57a12.8.1729512032815; Mon, 21 Oct 2024 05:00:32
 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:00:11 +0200
In-Reply-To: <20241021120013.3209481-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241021120013.3209481-1-elver@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241021120013.3209481-2-elver@google.com>
Subject: [PATCH 2/2] Revert "kasan: Disable Software Tag-Based KASAN with GCC"
From: Marco Elver <elver@google.com>
To: elver@google.com, Will Deacon <will@kernel.org>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrew Pinski <pinskia@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This reverts commit 7aed6a2c51ffc97a126e0ea0c270fab7af97ae18.

Now that __no_sanitize_address attribute is fixed for KASAN_SW_TAGS with
GCC, allow re-enabling KASAN_SW_TAGS with GCC.

Cc: Andrey Konovalov <andreyknvl@gmail.com>
Cc: Andrew Pinski <pinskia@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 lib/Kconfig.kasan | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index 233ab2096924..98016e137b7f 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -22,11 +22,8 @@ config ARCH_DISABLE_KASAN_INLINE
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
-# GCC appears to ignore no_sanitize_address when -fsanitize=kernel-hwaddress
-# is passed. See https://bugzilla.kernel.org/show_bug.cgi?id=218854 (and
-# the linked LKML thread) for more details.
 config CC_HAS_KASAN_SW_TAGS
-	def_bool !CC_IS_GCC && $(cc-option, -fsanitize=kernel-hwaddress)
+	def_bool $(cc-option, -fsanitize=kernel-hwaddress)
 
 # This option is only required for software KASAN modes.
 # Old GCC versions do not have proper support for no_sanitize_address.
@@ -101,7 +98,7 @@ config KASAN_SW_TAGS
 	help
 	  Enables Software Tag-Based KASAN.
 
-	  Requires Clang.
+	  Requires GCC 11+ or Clang.
 
 	  Supported only on arm64 CPUs and relies on Top Byte Ignore.
 
-- 
2.47.0.rc1.288.g06298d1525-goog

