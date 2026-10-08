Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B50395243
	for <llvm@lists.linux.dev>; Thu,  8 Oct 2026 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487036; cv=none; b=aPk+9M3QOZXmlUhb/+Gew8H8yeTQ7W6447XU7sjInHd51bOQ0euCE+RLJzt6RHFiU3BENdYLRtlXXEgreiD6FnRGIhTTgQvx4sVGeJ1orvD4xb4akz5ZvzdNBvZ0xJ8CEQ0rgeAUgF71nWmFM5MnTKYOGw2pk6v7b08oT0IaqtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487036; c=relaxed/simple;
	bh=41LTbWVjpTvo4M1E4NbCgmRFCizGUSRpVOrbjrIjkRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ll969zEugCGkPioQ5iDckC/CbYkmXjPIRatHpbH3KdXzlp5BeO+zjGROpiFDPAlKRxbQ/m36EtPpXRqqt/gwK24mbt84iwxefe7QOjixIlMHhM7NXZypr2n7EQgWqraaCDnxt5zO+emeGvjjIZEvymmaOH2gbLqkNIDKSsCxKhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgU4TQUW; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgU4TQUW"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91968804af0so33882216d6.2
        for <llvm@lists.linux.dev>; Thu, 08 Oct 2026 12:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791487034; x=1792091834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUu+rVVcA0+9TqEMKJogDIMf7RBcjtzwW2+KKNlVxXE=;
        b=sgU4TQUWMX1bbtXIZWRxi4+M4L0izH7kM0MM55EQS2+N/ckfp+SjvIZqlU7L9kSeO8
         0pm4hKBJwkqmIjmV4LJFcXuwbqgGXhf1Y1bf5d4ICHuSo154Y/UNVMy4MYVxDZnVlCu3
         WpmpmVd2OjFmDK+NaanL/RBqaMmJnGGsDlLsSITn/QvjuychsT5kUI5haYNk7lPJrOmU
         p93iWrzsSMOp8maG6x522fajJb9vO6m7e44qKpTwu3pNZM40m50jd3WoCtcTrU8n3vcj
         4f1tbD8YG9R7L2Le3hGH7he4UvTuVwyPwKBdFtDygkxlWDSeVgYcG2+ne932TTKsnfCT
         uojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487034; x=1792091834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUu+rVVcA0+9TqEMKJogDIMf7RBcjtzwW2+KKNlVxXE=;
        b=OC0Hr8YHD3Sn6wQZz/lZ1hAcSZSa4HAfC9ZqH9k0ufmHYPovPW/Tf6I0yyUxE66AiC
         5P4MUuzwYPAbJpjy4wLFczFoCTSeke8AckMqSi0NyyzVmSbTbwowd/ebSFTgdHfK9r6S
         KNLoPYA7AOpX4LVg2dKaMnQh8wcT80AQPJqmk7tvGgTvuJPZxvXlIt2x8RtAJ6+clQCw
         RveXf3BSzOGKndDBCxVZMZevs9teAHgkqot9yTCy5qHqa1Sl83XgeLpyWPkXKab0qCjI
         4DC1hjsMTY8oMlhl9E9BeDcqOGrpoyAGmqVwFkJrfvv/HFWOf5ouHcI7O2/Qgpq4x9DK
         PUhg==
X-Forwarded-Encrypted: i=1; AKwUvBxQbKvqgArZAyCisC6SGsBtPh4PUW3Ac2j5koJ2j6zl5neeNgv8dOdSnNtgd9QgT5h5VoSm@lists.linux.dev
X-Gm-Message-State: AFq9FYI6Ncgz/kC63goo3M+wbDLaSDF+PZGktoE0L7PtzO739mnYzISb
	6p5qalTyzvr4DrG54yeIa4fTuEbDBJl05U8NHEzOyH7o7fWBsy4CKjKr
X-Gm-Gg: AYBFou2xkdIihYLTCDsX4vy0ApnufebSXOIoEnT0Cd6bvlYCZRDyVpjBWNNeRKh+QXl
	cBN9fY/RH2Br+XWRlZQBh1EoFxfkztFa35MK+52GaMxPCb2E9n3T7LJXUj79EBlY8izI8JA8fGO
	OXwZ1zmkDAbOZtUgoOX2WacNKVigbHhS+3ioOIaQBVGbk7mG8dI4IHJIOLlYP8/URqkHOa+q9Vb
	7fo78pb/u4hIXqeNA5fF+tt/D8ArBhUAm9ccG3XgzkhLeg2Rb3x+KMXMz5sXFnRjWcDWHVxxWbY
	YpfcomJfLNeFJSYBvVe2MkDCcZOoNuCi4gbSQhFsGhLqy15HACi+G63Fpxz9oy4KaI9ed1fLbLP
	GxhNVIb9XtQtGsJ3RungPgrTiHJUCPiGPj0jQzd0lqgDRNDiB36vbeZWGfiAtrfZ1oPs1JnR+Et
	aX+vaa+ECsBRYnNSME7utq7SUwUH8y28eAAz21Z14aKkDgCbQbMzRCVepneSLzgilbRC8EYiTMr
	1+88W36xARaYquU33AnVHcou9fjk0D2g0Jv05xw0CsBGKoK+m6WJdv1BcJXu9j5Pe1MWcb1ouRn
	ooequ5QKMBumcx/kXCo1ozjeO3THFe1vsZPjorBV8PGwdv2d
X-Received: by 2002:ad4:5c6f:0:b0:919:952d:f5b8 with SMTP id 6a1803df08f44-91b53c8beedmr229366d6.50.1791487034251;
        Thu, 08 Oct 2026 12:17:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b5199b032sm4046936d6.4.2026.10.08.12.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:17:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: sparclinux@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH v2] sparc64: Define p4d_page() instead of stubbing it to NULL
Date: Thu,  8 Oct 2026 12:17:11 -0700
Message-ID: <20261008191711.223236-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A sparc64 allmodconfig build with LLVM fails in vmalloc_to_page():

  mm/vmalloc.c: error: performing pointer arithmetic on a null pointer
  has undefined behavior [-Werror,-Wnull-pointer-arithmetic]

sparc64 defines p4d_page() as NULL, on the assumption that it is only
used by stubbed out hugetlb gup code. Generic code now uses it in
vmalloc_to_page(), ptdump and KASAN. In vmalloc_to_page() the NULL is
used in pointer arithmetic, which clang diagnoses even though the
branch is unreachable on sparc64.

Define p4d_page() as a NULL function to silence clang's warning on an
unreachable branch. sparc64 has no p4d leaf mappings, so there is no
functional change.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: use a NULL function instead.
 arch/sparc/include/asm/pgtable_64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 35a217bf6e5c..54e563eb0efd 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -851,7 +851,7 @@ static inline pmd_t *pud_pgtable(pud_t pud)
 #define p4d_clear(p4dp)			(p4d_val(*(p4dp)) = 0UL)
 
 /* only used by the stubbed out hugetlb gup code, should never be called */
-#define p4d_page(p4d)			NULL
+#define p4d_page(p4d)			static inline struct page *p4d_page(p4d_t p4d) { return NULL; }
 
 #define pud_leaf pud_leaf
 static inline bool pud_leaf(pud_t pud)
-- 
2.56.0

