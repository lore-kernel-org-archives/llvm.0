Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EB2266585
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033352; cv=none; b=tYdcGE9QTEsjS+ds+Kc84lygea4hcXvwng2QARgnQlSWdtZrhee3rdtOD55H1ZcHmBkAPbADrh9hj4u7t3QMSazmuHT8Xx0nptAP+mo1nsOhkqDorwp7R0ADCd7VVHGK9L5VvIBI3vIHi8Z1Kv6GYyzaekNXSl5Ye1kTv6Y73fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033352; c=relaxed/simple;
	bh=mAU7UddOSIuhHOgW0dcTHe2+YPpXYqGh56bzZQb4Iac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=kUaaMb1+c82JZ+41RVGiai26jihkEVJ+s43kHtsddc9qanQQUkyxPmtpXXYUiUM7snfPqGYyk18MzLeQq69HcohKoAqYLlU3kUZkLvTwELS2/CtPbK73M6Vl07tbnno5Q5EmAJDA+yTu+S99bIPUO5xxeZLV0xWw08kZxnSw9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1mhoQJcC; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1mhoQJcC"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22647ff3cf5so643725ad.0
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033350; x=1746638150; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhBH53x+wqLHSip++JVbv92U64Pz0+iOyWwwIUecJ6E=;
        b=1mhoQJcCYyjfu3xSMuJzil0ZLkCmGR/cgE8ttndDXgoOlBDAyJWeDlu8t15LwOmVdq
         8gByO2Z6TPh1guDcnSHYQmvkQNTtGWwZd35MXSerqF/4JlKfKoFlaKC+X5pUZ/3Axre2
         LhK3Lni4O6Dl0AEUs7gZK2dQqilbiDv3ugO1tTVaPjkg+rDeBfUXFndmYoWFzfrwLG8o
         EHpsR2PzYsTU+1hpw6FTZ7tdupAcFcYtWafHks137nI0czeE870zESg8hRfbHpyJFzhz
         wM5dcjdAvX4X+S0InWYcpQjiA8IXZ3jJ08ZK3mt2kH11u7z3YylRQPp33FSOf04dUJu8
         VHNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033350; x=1746638150;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhBH53x+wqLHSip++JVbv92U64Pz0+iOyWwwIUecJ6E=;
        b=ioJxsd7Ve/Ev1gwwBfo+AzktWVzCtWkVWDHAPIdLVBuP/SDDFN+2FxQXi4uM6JEhwt
         bGsXtfDm1+NQEd+0H/DyhQouCiHvHDonJecpS1TmFtWW01J1KBz5WUfSzNrPds7p4QsL
         NK5tKIGnl0MzllzKblS9sCuqlLcc4vFdDKiRcCoSEx+JMV7cClkFaLM9pS3rZzM/36HP
         R2oZfz1r0FNo2yxQj0xmcFRqbbV7yn+SAGwdmC+co4gdRNAC9tyFWlF0kQ2Pr/Ym6YRj
         14i+1iw5hoQnZng/pcpvjLoZKH/8fpoRdWvMODvsgr40pEwEo+oM+Si9EKcT9XTEUUH8
         hWqw==
X-Forwarded-Encrypted: i=1; AJvYcCXzqa6aTLVeLP5udZqIe6o2o5ex44p38Y1ok35ykg8f3D6ewhSuwSVNm+TFIsV3tNKxvJNP@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwrad8PPd+2Y7U6/qNdRVhknYugISi0TFa8omxCCRIhfBICCGW
	JkEShPUqLtq5woJijnhPuprV99eX+gqwonr1k/eyk8zpHl+nxV98FEcRBELSmFfpGBQ/FaWs/GK
	i/lP8vA==
X-Google-Smtp-Source: AGHT+IEaapOgmoVRsKolxvo/uh0+Fje0GanC2UTPR9ZO79czz3tAeLom6ayGJKwoq/mQfddsskfR6kPqjVdO
X-Received: from pgmm35.prod.google.com ([2002:a05:6a02:5523:b0:af2:50f0:bc79])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2d0:b0:223:325c:89f6
 with SMTP id d9443c01a7336-22df34aa393mr68396565ad.10.1746033350412; Wed, 30
 Apr 2025 10:15:50 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:34 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-6-irogers@google.com>
Subject: [PATCH v2 5/5] hash.h: Silence a clang -Wshorten-64-to-32 warning
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
2.49.0.906.g1f30a19c02-goog

