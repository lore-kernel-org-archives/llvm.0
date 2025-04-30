Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CE4267B04
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033350; cv=none; b=Ok20UjBa6G/dpmt1u7ckJZOtpjmKz03yi+ftffAQ2HfDdN/PFXV8f6i8fr5qtKMs0fM+OasTrec7dR67Ej/IFtUu4HYeD6HSG4Oqnl4uGWnwIiJ7EppWXtfZGVYyoFwZHR/RK8MKXtd1/tVz8SIXESEY4L/zcAjLE+JHXFLh6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033350; c=relaxed/simple;
	bh=0giGEwbxakAUv76u37w4z4HZNA3HR28IEwGrKloZfbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=LPD+DOsNJ9b+1heeYOJs4vHbFBeBhfTCK50zTz/zE/RubC0Q//nXEBdDzZkMynfKVxAaEBbCNEpgau8kmACZ5uMrgNgmodFbLv5dF3DAAVWzlTBdBpLA3C9s3+Sz7gH726oAVF6wSaPh/iIrWbz0CM5C5ye5Vg+dZx40Q+LQiGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q/ay1m99; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q/ay1m99"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so128525a91.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033348; x=1746638148; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOjn9I/CPl6hOGWikVl+PEhxM6YNnhs+3iDFhqJ7e1Q=;
        b=Q/ay1m99vW6osihCW1zLwUMAvSCsXUx4QfAwSr9wEgLlMqbchUPpHi5CqTc3ivKAo/
         0jAR/RWyTKFf3rgdEEKooavqT0Dlv/07y+ycZqRipV4nlG9kBu2e7/nHoYiRcHQLUd9E
         xGYFMIQvW+M2GxMmdeW6Y5nYMjHk0yqUbdTMPvWYxpCwCumbUSHVKeF1u+Rl3nuI0Njw
         8/MA4jO01H2r2UgLozEcpWv34ra2bzG+ne5HFST54HfC5sOHo1v6EYucliCWX2DW3fUl
         CtyDMLCu3j8yY0O30yZ4xMPJ8X21FVHEhDu+cV1PWj/StS+0iTY0Wi5BZ/szJPSv+Xk+
         Vb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033348; x=1746638148;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fOjn9I/CPl6hOGWikVl+PEhxM6YNnhs+3iDFhqJ7e1Q=;
        b=K6quE8zbPrikS4rm7X0o1xNlKr18nVEcq5wbPIcxZUUkKgMT+xcekvvahCbNJ+CaZV
         K+qoLhx91iURmGJ0f0s+bLv0HpN42+i1eAKCeB/t/NlU9uGOFw8gSwHka34w6ay1X0Ro
         mbume+VshvdC3iPvrFJWxA08WNxGuCNyMmMs9I7yNm1+eQ0iwCnDJXVkROlb7llMDFM7
         3lI8xqnjdCCmHP6NyKAWVDl+/w89tT7SO/uY4vwNbpT2shuoqSw1/ymDDh/R/AB1attx
         rYdyeMxaOjGq6hK8k3PFR0hwJYHlqg0cA+eAZ9NK/gvWpQztNqflLn0scMmKTmJBIezO
         jccw==
X-Forwarded-Encrypted: i=1; AJvYcCUTxXRVfMkKo1PkVKovJPkXnudD/a5W1g/SC8e5cbOCNMmkcbNJertUeESyqDPzaXFtBqLw@lists.linux.dev
X-Gm-Message-State: AOJu0YxizGQwyDIm3yIUTm+6GSmj8C8/0BWg/04yqyxVXkbg9HDnOGzA
	kDjnCKiQUiSlxI5WIz+1UBVRquwTBSAarKQwk8/aY/WMD3xNptUwJmgmA8iZ4veKNAkr0v8zpRI
	WmCBKrQ==
X-Google-Smtp-Source: AGHT+IHK97p3d4624e1GJoE8HKE9+msldMS/AyxZk3q0FqC3fhWjqcopfMGNBtO9wUuHcIl2vdgL7V5NAXJ3
X-Received: from pjbsm11.prod.google.com ([2002:a17:90b:2e4b:b0:309:f831:28e0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4984:b0:2ff:796b:4d05
 with SMTP id 98e67ed59e1d1-30a343ffdcbmr5747063a91.11.1746033348290; Wed, 30
 Apr 2025 10:15:48 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:33 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-5-irogers@google.com>
Subject: [PATCH v2 4/5] math64: Silence a clang -Wshorten-64-to-32 warning
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit. This isn't to say the code is currently incorrect
but without silencing the warning it is hard to spot the erroneous
cases.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/math64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/math64.h b/include/linux/math64.h
index 6aaccc1626ab..f32fcb2a2331 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -179,7 +179,7 @@ static __always_inline u64 mul_u64_u64_shr(u64 a, u64 mul, unsigned int shift)
 #ifndef mul_u64_u32_shr
 static __always_inline u64 mul_u64_u32_shr(u64 a, u32 mul, unsigned int shift)
 {
-	u32 ah = a >> 32, al = a;
+	u32 ah = a >> 32, al = (u32)a;
 	u64 ret;
 
 	ret = mul_u32_u32(al, mul) >> shift;
-- 
2.49.0.906.g1f30a19c02-goog

