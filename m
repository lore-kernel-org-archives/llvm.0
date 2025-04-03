Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C35A2512E8
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 16:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699438; cv=none; b=So767ITTEETQh/Xy/WZyUIREWTezNwuKclAdBiPXsTlHdTn8sIne2ULjiPkZhI6dmN1w9QTv1fefYRS+OaSJE39ZHriXuTpJPqUysmVtBn93thm6A7FlaS39GM0cOse5rgT8Z5jGEj7/HedlcoMT8vFHPrVR1beLmEpSk7uKBe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699438; c=relaxed/simple;
	bh=pZlVCJRViECraWY8Y+BJqWX1y/rA40Dggavq4E6VOKI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=WGwRVie59mbVUUcGCZbLDWj/vIu2ozhO4g1re9cULA64Be3nmRDwkkPTU9Eo+Q/yVvPg5+jrPYCu24WiE8wJJGyzNi9ZGQfcdkusZDGEJos+JdSq54OzDWsibQ0eVkagZaas5B5xES8v1cEiezfKHLfkbEuyuxlyLTrTIdXsqJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pIw13Srx; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pIw13Srx"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-af534e796baso775485a12.3
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 09:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699435; x=1744304235; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdGNPnhkmnSYFw1hLabTm19S3ZzmXtS5SLBi0D4Xb94=;
        b=pIw13SrxApXZ+Jl4ynF4q/yd68jXt2KmKVW4yOi7gSxyxQLXFXKR9WvKMlzsGWN8Ox
         a9K54nh/T6ex6jve90Jj/ROEx8NURIWC9m0ONnnAU1L4eZ7H+DW3DytwkYBsBEdQdgWC
         4eXQQf6yQcT4YbxKFeHdNpYyBldwI5M+J9xZldZLtjjBLOYzFTZDZ3e6oxaPLKZgD4ya
         F9xs8TVt8jL8XRgWre/e856vjOPxzSB4v+97XaWE8ccGGWmK0dT0Way35gsDbOYP77+U
         /e/Uk7S3UCN5RQlQX8z2cmtDcbN9kU2DNcQw38DGuCzQd5E+4JKMx1VNL6hoSWnWHJx7
         o7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699435; x=1744304235;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdGNPnhkmnSYFw1hLabTm19S3ZzmXtS5SLBi0D4Xb94=;
        b=QNqzxrirH/OBNFsCNrMXZ60gxEKoT8z74X1/fIysMUAV68zwGX3790sGYZpP3pD1H/
         rwy19UTkYpEDgrAj/JG5hCl1WGZ0x4/6WP6zzButJS+QKwJDofeb1tIP0sQj5cwya93+
         TacSbaDaBI8+LG1Me4sdoHG1+f55ikqeEVOgQFk8aAmrWoyt1vvLv/8E2PURIzpzZWdR
         B51ERHa/oEEz2L0GUejw4NxuDtS4sEWPZOZLWGY0jqtJgKD2asJaXXBjW6WMndyDtdew
         TSV9HnP+lk5vEN2G9qOou4a6JqzjksHy/WVXPf5hmqi7T+2PrvgjYTsGKaMJm7cSBWoY
         8lWA==
X-Forwarded-Encrypted: i=1; AJvYcCU+L0G1T0wNOEC0QrBdUMZAiohgaC/uNIvAOS2IPsL7XzhzaiVxTvr9/mKUcVxTX+OcosLh@lists.linux.dev
X-Gm-Message-State: AOJu0YynDAycm5OIjIdrwjXB28Q3DFpqf96g+RY5LE/P96fsfAd/ArZD
	TsWTvoveS+FO/fLA87H2Z3YeGY+1UVrdj/NXYmNY86HZVEyD7TFNLVfOPn80E8C0tVlfgyos6k1
	puw0NSA==
X-Google-Smtp-Source: AGHT+IHf4+lZdfNC4Pd+fVVLfgEfGYIen3a2OuSa3UqLYxlvTyLWi+hHtj2Vluq/obtqYLkaNT1ivwRzacjy
X-Received: from plpn4.prod.google.com ([2002:a17:902:9684:b0:227:eb6c:504a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1c2:b0:227:ac2a:1dd6
 with SMTP id d9443c01a7336-2292f974a5bmr344475055ad.24.1743699435654; Thu, 03
 Apr 2025 09:57:15 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:57:01 -0700
In-Reply-To: <20250403165702.396388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-5-irogers@google.com>
Subject: [PATCH v1 4/5] math64: Silence a clang -Wshorten-64-to-32 warning
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
2.49.0.504.g3bcea36a83-goog

