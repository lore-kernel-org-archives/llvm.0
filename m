Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EB2517AD
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699433; cv=none; b=LymgrZ3y3u8UPE3hmrMjx76t/KMGQYPkqYSjiD/ClHUWjhntJuWaFTHCYahoxSfyR2t6HvzJ6TYAg27hUTgWq2vrPu4roDmLB6zGgHdjKlLOaKVlcshbC65u+OmRIctQPk5wRXVwWDV67JQIn0/E4GkEUn7bZif4A8wB9h9v8qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699433; c=relaxed/simple;
	bh=EZ3OctgXrov4m1SIQQP0GA1CjxgdmMYx1wr5mwi8Yqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=VfMYHnj5Lcaoef90sSmuEGxLaBTaDQH/gLOTEFGZt92LYN0VuryPGDVZRwpxl/C4z9BSRx7hG3ktS1zn071R6iNjHWNdijDrQo+SeVqG82qNvxUGrkPpGgtAlA2TmVDiFEocx+vd9eacRRiXkuuZ/AiHu7ap3050CVT6gJxn+Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=euRYAQ5E; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="euRYAQ5E"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ade807fso18529325ad.2
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 09:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699431; x=1744304231; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2vMMUbWfGWJtt6qJg5TEjuYkc7LyjFLPOch4giCzBAE=;
        b=euRYAQ5EpE88Jj5Jqjch6FIir7eZKrDcg/4Z7U7hhxQ6HvPm1EEuYXh7SZ9nImo2JY
         Dm6nibjAf++c2PkeUzEb6EycQbyjK4l9Lt2WKOPC+tU6bFfP9EBima4cICsWZpk5NyB0
         zRig1DjcDHECTIptda8LcllHOMgWLMqKY3To3yLWVsWubM976o+8G9d5PiMh9h5ptDtA
         43UP5reFasFuNk8Aki0of5gM3NByWuomn2hUp8VJi3M0AlBt/47TflPfBU4SXKagSohs
         87DVMlFTUUcDt58lZX1QeD+ZjPdPQhkKxtMn96ap8KT9mnnShNmQt84GcmHVuGoHldja
         222w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699431; x=1744304231;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2vMMUbWfGWJtt6qJg5TEjuYkc7LyjFLPOch4giCzBAE=;
        b=KqqGEYT+sudDyEBsyY8IBeypQQsv1qpcrMxJJuUksGFdBtMc5s01cAL4CNH4YWI0np
         acG7wkZidkz4Ffgfh1oOavApVsvx2HKprmLwzMdhM8X1Db8poFmmWyJmVPP9wqNGAPcZ
         M9EVF1wxUkT3HL48ysbuA1AU8SMqp+2tVGXI9pOPjetpgDmeeMuYMOnltQ+cxgqOs1Xa
         7x8owLDudPC5WwdWXMJ8rSSI01pikI0zRaqvEa78yAsk6bFBfLC2kNQlItJAtTzEjpyD
         /X7wL8RWo72mnYDRG+oXA/k63vD9MLFUuKBCJPNHlVRo7AjASGOHpx3kC8GvkiuJ3N0n
         4uYA==
X-Forwarded-Encrypted: i=1; AJvYcCVF8n/cp/MZecRcGK+68xrhGKGXf0ckyXiibwlEBX3MkM4qD8f2rJhzXiY4RCqxbL/f5U7P@lists.linux.dev
X-Gm-Message-State: AOJu0YyRAGQPQnHvFfDKcUfJBRkEu3q0e0BSZGagRLZoP4jteaJPkjtH
	tQy0SZ4HhsTutR9kNiDu3O188ShD2Xs6caSz9eTTrcwEvifAq1BCAz4+Gfsildd/MvjllBVrCD3
	YSPz4Pg==
X-Google-Smtp-Source: AGHT+IHVdW6EuuBxX0sM92CTGs0VCjkpUZ5/eKwIrxGT0OKUKkZpfgTf7TdCK0KWd6NyRz82u0in6WUHraY0
X-Received: from plsd21.prod.google.com ([2002:a17:902:b715:b0:224:2ae9:b271])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f552:b0:224:f12:3734
 with SMTP id d9443c01a7336-2292f9e298bmr322176305ad.30.1743699431571; Thu, 03
 Apr 2025 09:57:11 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:56:59 -0700
In-Reply-To: <20250403165702.396388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-3-irogers@google.com>
Subject: [PATCH v1 2/5] bitmap: Silence a clang -Wshorten-64-to-32 warning
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
2.49.0.504.g3bcea36a83-goog

