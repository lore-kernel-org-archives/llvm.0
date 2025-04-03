Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EDCB2528F1
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699435; cv=none; b=ElzRerS45y4BjJHelJDzK7kK2D9GRTgRGIy85RMa8XkX4xQzwB9Opo9uZDxGU/uggEwdsCMH8ygesivjpG4BT8KZam5N+RwYDkkfCfW5fuNgwFQ+5qVMOM4cxL/2Nl2vqgyqs/LBkGtfMy5JH+RljOej/WepO3OTovb9XheXQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699435; c=relaxed/simple;
	bh=Qz0QomEC//r00eQAz30vgB3K0BsSHU+UqMrkppYie2E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=bT+8F6gEo6qXGtIo0N1zAw5MZKS9vTfmgxDibuIrdbaLRIko3JCCvtt0MLwWnsnqV+iSE+WRBcBjn8R9vPsTVmXs1s9UmTqJ3gUt3UUKsH0/R0V9Tb8/U4rJj1UQrjUH2FaZltjCm01t+kt9uJ1jdZsNktHXMeUjP6C8IEF4Hs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O1HB/IaJ; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O1HB/IaJ"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3032ea03448so1255607a91.2
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699433; x=1744304233; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qW8HptWxtTGnb+NyUFSz4Rsqb7n3gW/Agd38GBuyPl4=;
        b=O1HB/IaJW111EsICgHzaS+sgRBfGRLy9obK49JmP2+PiFK205rBRQAwhbSpmxnAa7G
         g4eTj5rQUNSfmLbse5lb+9LvTtahD2kGJswnhUV+Fb+Vc8yWo3qZfu+ndThpOucS2mIX
         3mOqJDOHuEHH/QjfAY6tkCeEFwI3kjzmhDrIindW2hxKVTVzpq9ZAt/VsNCiAPLY+oLh
         NeK2xj+BFhON869vPr54J8+QxGR8G+da10H4dxnWuUN9EJYV5SKllq1Xs3KvyXYqk++1
         lD52vVG39qzpxTYxt9Hpo7pqxeToPrlX/oFwAgb5pFNxxoNJ2je6nKJqTy/uUUBsSq28
         9+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699433; x=1744304233;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qW8HptWxtTGnb+NyUFSz4Rsqb7n3gW/Agd38GBuyPl4=;
        b=P5wt5fNJea1mD6RR+RQCTbk3q2/Tq60dWyf0Ge2tEbgYhGPyxJ9FiryLd7c54IERQA
         QN/Bjo8Cdr6HiNhSEAkms4DISUVYXRbUYSBECVGhP2XTn3gX1RPjYNcpMY25+gvJFFmy
         pD+mxH+Vj3/dcufQnfz+4HFJjGbrdNDT3XZYoMkoVLI1VUd8N00R47bjWN4hh6g1UJCB
         iQ962UrLL1diAoWeMgUAKA6fyzv0bV7EXaHf9Graj7CjNo8u7MK21CoUzPD3USBHyO4l
         Z3hsW+O0py/pwnLvbKdtkzu7stgncTZqz+kU3ObNp5GcFH2kHNhJpRD6Lwy3vfBwiXN4
         EDiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZK6Japkm62DM42gYpvkGiCAmc3E58mjYdeAtFrwxh6089mPGCCGE5dAK6wKx0c+crrXqO@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcuu6+gBwU2zfz8MXSMApm+Me9v+vZMm/nriQmOLpsYgC3caAD
	WXdxoaNvJWLZ0/Ctryu1Y/fRht8T4iC8cBe2vlZIZ5y4v5GHGV2v3NStp2wzAyYjICddIDv6loq
	qfYXaKQ==
X-Google-Smtp-Source: AGHT+IF0CIOoJJeJRQHOUC3EpHHqa58y0n4/IbXEbLHpY4GALdcPXwOZpF/CmwFTc4V9Kvparfq+Lmxq0y9x
X-Received: from pjd11.prod.google.com ([2002:a17:90b:54cb:b0:2ff:5752:a78f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b0d:b0:2ff:52e1:c4b4
 with SMTP id 98e67ed59e1d1-306a4b8597emr236433a91.32.1743699433573; Thu, 03
 Apr 2025 09:57:13 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:57:00 -0700
In-Reply-To: <20250403165702.396388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-4-irogers@google.com>
Subject: [PATCH v1 3/5] bitops: Silence a clang -Wshorten-64-to-32 warning
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/bitops/fls64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/bitops/fls64.h b/include/asm-generic/bitops/fls64.h
index 866f2b2304ff..9ad3ff12f454 100644
--- a/include/asm-generic/bitops/fls64.h
+++ b/include/asm-generic/bitops/fls64.h
@@ -21,7 +21,7 @@ static __always_inline int fls64(__u64 x)
 	__u32 h = x >> 32;
 	if (h)
 		return fls(h) + 32;
-	return fls(x);
+	return fls((__u32)x);
 }
 #elif BITS_PER_LONG == 64
 static __always_inline int fls64(__u64 x)
-- 
2.49.0.504.g3bcea36a83-goog

