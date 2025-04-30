Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66523266562
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033347; cv=none; b=SXOyFLRoMg1AmUEXsYpH6NJqrdRRn819uhXw+MllTToWWGTSkxeJ8WGQkJZucSAZhYA0Lgc+FDZmeqwZJxBnjNup/ovMIWjl11dlJj96lyIDIU19rPYeoS9W93WQcNMJTsjGuxrTiMj0YybU+3IAEQ+Z1CL8rI9Uj0M5gkg+TZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033347; c=relaxed/simple;
	bh=/nCqqKVIM3lCaTp25K5Y9r9lVgOCOQUHMpBywdgb4IQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=qD4HR1LQ+6bqFO4Y6Xt7IVYI5WwupaeagimsyGkO4Uph4voo2z8ciyqVXrYXVPQFUn1kPSjBO5hCdrZN+R8Ly+NUxhSB25gzrxho+lt1u33QC2w8L308/XiEHsF0agQE+T4qfD0bn1vM7TxlEJ8izSmOSQptp0WsGCDZfZ4xRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E3BNYeL2; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E3BNYeL2"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-227ea16b03dso876305ad.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033345; x=1746638145; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gN/a6V8QiIvdypmyI6y6Go6q2Ye8wXD3lVvCZhX5yNo=;
        b=E3BNYeL2heKiQb7uVPXPW4C1VR9z8L/Q8Hj13Wtsw5LckmhhfkESy6QDDh12rqyw43
         QJXssuf20O5VFLTl7ibeiQ49g8fbgHy8Mah/U2iWN+A83B2jVYewUXYw/apWthSUwku3
         tCewSmiChHL2NoqrJIDxV2t+P85qSj03D0SQEBLfq54mAAiyDT/JgO+M30S8c3UZjrwx
         fVMCc6zdCl9vcbYOn2fFq7MYAysrV4xPRBsfXqPJ6plF+aagVaJHcUwvlZLP0IRL7UtH
         uxhQIPVBz65Gvwc6rfnQ20osjpAOtZmzsB7f+rpwz/SU8ySV5ozUfA4ZXd+wO8kTf8oO
         bukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033345; x=1746638145;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gN/a6V8QiIvdypmyI6y6Go6q2Ye8wXD3lVvCZhX5yNo=;
        b=FF7zi3L6lQwPnO6RKtSo5qmx90ZF3XWWG8mWCWL0KjVcoQ72hrqz93K2C/PXOtoGnS
         /XG14BLa5aZu9vT+LhIUb1UG1EXFWTWfIfSlY5tQZ1pJ15ksGuGVyA0lSP1XiqD1cPU4
         xVgiV1SOL2O0HOSqaUkztwpeNNUQugNpmRmb2P2AeFvLXTHwBQutUABTM/xPtg9wpLIV
         TngI2RpN9TUAbOIprcAQXB/1YC1rI7pFijYDEn7KmzBhT8/Z1I1EIdOo73u0t0pndciM
         dFBdd4CCaKhWFHLyvsffiMKiAUD/HOr6dXKF7LqmYP9RhrBcw5OwRdEGmo87InQ/wFAq
         1Bfg==
X-Forwarded-Encrypted: i=1; AJvYcCWftuF4OVrD6sX58tiSbgH6so/V33MM+X9JeGYKwzomdUI3Jnt3WXF7oX6ymiUR0Is8T/bV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/QP2bj8TuqlT/XPK1tWJtxm8sGwPCuWrnYk0DK/XZMuW1eqEl
	Xr7jua+aMvnKyED2pncnW/v9p06sWFW3N3T5tvcm7uLCMY9ZUrx/j59f//T29qyw4kV3tIKYLa5
	fzh71Xw==
X-Google-Smtp-Source: AGHT+IEyeKPexv1uh48dcAlUBWAzGseOfey8PKS/qHG5wARnrrceWevHm0oXIBRzRj/577/EUtzzAPcRJ5k6
X-Received: from pgam18.prod.google.com ([2002:a05:6a02:2b52:b0:af2:3385:de87])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:dac2:b0:21f:71b4:d2aa
 with SMTP id d9443c01a7336-22df5764482mr52271135ad.5.1746033343976; Wed, 30
 Apr 2025 10:15:43 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:31 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-3-irogers@google.com>
Subject: [PATCH v2 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
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
 include/linux/bitmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index 595217b7a6e7..4395e0a618f4 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -442,7 +442,7 @@ static __always_inline
 unsigned int bitmap_weight(const unsigned long *src, unsigned int nbits)
 {
 	if (small_const_nbits(nbits))
-		return hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
+		return (int)hweight_long(*src & BITMAP_LAST_WORD_MASK(nbits));
 	return __bitmap_weight(src, nbits);
 }
 
-- 
2.49.0.906.g1f30a19c02-goog

