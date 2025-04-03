Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D738253320
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699441; cv=none; b=N3EL3hw0PT2ky8AhdSjZvnpv89OQ5waEwvElwiwUWjAVtBTZGKOmHrSKTyNtxB9rd7h0TxlPAH9KHjrHsFkFMWO0iJawON9rUyhtVHREl4I22qgDtqNFWCXLqYh9hxePue8gOB40DT9TJAX8JLUUVILPxJOhA50qHu3PSM3MJlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699441; c=relaxed/simple;
	bh=1GBMY/blDMm/pZBEDDJ7pMxBepJY1ykTDsdud2Ofj2U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=t0tj7LU/UCnIww42OOfrKxktZIov/o4TAk5Eld40uuQDc2BY8wnZZrml8KvHXgziBX4ZT3nvT6Fony2tCaaPFZjVqq8MrAiw+JvgnbtkeEeHYtGKCrqp+3LhlW85GS4Jc6y8hMFK/CjcmYSFflEPhLn4c255QU+IHNCP/sBqSQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V5aYNe1e; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V5aYNe1e"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff55176edcso1168965a91.1
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 09:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699438; x=1744304238; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNHCeBq+kt/FIoDgbEk42F0HhswOr1VLdQ14FXQaWQs=;
        b=V5aYNe1eQcFgOKIdtqXSx4/qcRQObLRcqYpdYw1ORricdz0I5jBWg0odaMrT96LWd4
         krqPC6LJO4UcbBB5ADHOWVyOOw57EBqEYclZHE9BCg/tQZ1K1QQbVJj7piGJM7e9fWum
         eBbnSd1gq7OLebgNKTT20q9CyRvwCSygcv5jbYFjltSk5ZwAmmbPhgeJVWJkhdutK0fr
         hWaUiw170xPiJ9vrmy2kxmaMYOZeHl9NuaHO61HSnKBxHLavbFga1A6tIJK9lWynhO1S
         zyy8IwMWAgk3kcKuW9ezi6htK3+sIbghX40RI2/+SyJDQxiLCSStLfxlLV6vIt65WPYv
         dMnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699438; x=1744304238;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNHCeBq+kt/FIoDgbEk42F0HhswOr1VLdQ14FXQaWQs=;
        b=XtWuyAwTNUtuah8PwVo59FBmEP/0UgwppDr9M5FnLOYzV+caZ9t8Mz7owmGblz4xTY
         Tu45RCijCuEg9C3Ltrn69oUGW9mv3I5E1FiIE1NiQfJdczStHS/XF0GHABrTr/iCX35/
         bxPATH8jUWOdpG+fQclz40owOKpJI0DHXsiFhr50iaD3LdvQdwPvyNo4EJWZJhoKAn8N
         es+JbgC+R0Oq0pJ6KGgakpC5JvffHzZ0fMoFLopdJNtatjwCLVHWttuHcP9GEG7rZQUn
         VjHHkiO5467PgtU7TkClaAJpjUxWaRt4grVDf6c2QwTy+CCF6ULxKsP/TobqC9YSaaI0
         hkEA==
X-Forwarded-Encrypted: i=1; AJvYcCUdfcpqlqCPYpmKAWNfBEjsCATyIPd6KU9AuZYy6txS3fMLXIBYQ2Obg0MjpDGWcz6tuHVf@lists.linux.dev
X-Gm-Message-State: AOJu0YzVoOD16a7ooN7x6s9GAizUzcxzioHcf+GMvFW0FHnrEdf0v2u/
	jvOcYIAnSLKsgACnT+7LcEaeWRJAtvz78aGsnNzY8RD8q8/M3ebwWYByYt32IWhAjOsgh5oHe+Z
	/ddPbOw==
X-Google-Smtp-Source: AGHT+IHwAF9KgN3kBG96nyN/c70dCrvtSADqCvq2NC2KDP9UQWERHeR8jrgnBfjzks/VkiX6BY+HKFC/mvhS
X-Received: from pjbpb6.prod.google.com ([2002:a17:90b:3c06:b0:2ff:5344:b54])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:574d:b0:2ef:67c2:4030
 with SMTP id 98e67ed59e1d1-306a4975c0cmr355393a91.27.1743699437820; Thu, 03
 Apr 2025 09:57:17 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:57:02 -0700
In-Reply-To: <20250403165702.396388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-6-irogers@google.com>
Subject: [PATCH v1 5/5] hash.h: Silence a clang -Wshorten-64-to-32 warning
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
 include/linux/hash.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hash.h b/include/linux/hash.h
index 38edaa08f862..ecc8296cb397 100644
--- a/include/linux/hash.h
+++ b/include/linux/hash.h
@@ -75,7 +75,7 @@ static __always_inline u32 hash_64_generic(u64 val, unsigned int bits)
 {
 #if BITS_PER_LONG == 64
 	/* 64x64-bit multiply is efficient on all 64-bit processors */
-	return val * GOLDEN_RATIO_64 >> (64 - bits);
+	return (u32)(val * GOLDEN_RATIO_64 >> (64 - bits));
 #else
 	/* Hash 64 bits using only 32x32-bit multiply. */
 	return hash_32((u32)val ^ __hash_32(val >> 32), bits);
-- 
2.49.0.504.g3bcea36a83-goog

