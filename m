Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BE437E
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 00:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714522930; cv=none; b=I5L/6dw7ui+c33RIJVgocOsoZCBikD9ntq2bIbu4wS4Ps7A6vH8P6pnJpmwlb8JBIijUAzXs0Pyfx5CbnN5tl5vE4rlon+x/CgSyjWHcjj9/vbrYCLDqlV8uXO0bRX/+TzGym0aZw+5nQT8cJ6nNCKqtyKSYiDQtcQIaFCqX9gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714522930; c=relaxed/simple;
	bh=X0WM2lVVVkrpkqRH8pWOu5puLWSYx1PKBK2oxI4tuB4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VviZ02Rxw3Y8RCGVVZgnSEl81ZPYeM0iRbC89k5QIHHP9LS1BvHS+WoeaS+EYZxaX+dnEl9zT88O8eaqR1I4RnrXjySmj1I6be0psttiRlKKdTjFFL3P/s4D6PLQnJGrI99jvwOAYJtYgFgIudG3OJC8+Jojh0jekzNnbSclHB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IrF/az12; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IrF/az12"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc743cc50a6so9211578276.2
        for <llvm@lists.linux.dev>; Tue, 30 Apr 2024 17:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714522928; x=1715127728; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aOeVT5ijOmluYWTqyy0kihWy6E7/FOShE/HltlDIAgs=;
        b=IrF/az12xQweImItH6oGL8Vz/nRG3q6YCJk1W6cOW/eSFuqcb8lNPusSOFvnFHeTMl
         +tf8dLgHYbSbTYAdWiR6rG9E6h4gMA+nImNyNgCGpmZEVNoqP5468a6btPcoh9RRxyvP
         qJ202MN6JFVjg4GIlZXZguAXq/sVCSe5ZGlY5LNW9RJDw0Fgxn+pb5k/fCfans3+FMnX
         9vAEB8vdXrRt5nt/OTy8m/SzkVgd6BDFDLnENEvLVSWsFuyPffoKTpg6vQpQoIshCeCt
         N0cWYc7dAKOGn8tu/ER8csgtgZ9LRlLgpXE/gL+L6pK/hiSRPD2d/Si2I/yFq5kH8elD
         QfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714522928; x=1715127728;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aOeVT5ijOmluYWTqyy0kihWy6E7/FOShE/HltlDIAgs=;
        b=Q9Xr0lqOURYZr0O4B9DRqEZnbUKnVcLkQsunw4KCXhvAg9UbWr+V9861boqfngQkFw
         he874906kuLWmI1NU4++cGqCWA6UuerQ/gWJ8CccKsCVsaPLkHsog4w6k4A6GKeSIdCs
         biq3AKoxcm+MCnduFAFRqj/o2DAIaVQOnF7ar6qrsYDk2XC+JbBLoON5oKyWxE0UwejT
         RPk3OEHf9Z5GgZqWUJUkTDB9buMPbBsOioEcNWl7VqRASQKmKbnvwfR8yz9/1yo743C/
         5ypWA+yobWNhCI9wji2LSIuMqv4eFG0DysaKYACcjYMbSHiQakjGBEKYc9EFNIBMz2E1
         aBuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7GPmiQ3C/9tWWyzJ7sSGiAX6XNvy1SqmOhlanTTVdHnBrBZ56/tSV5GnsH8NRetWopw3raUYMbEyE5FJUlgYpCOcM5A==
X-Gm-Message-State: AOJu0YwsyTyCFeaSTUfAqXhPk7gtJcqusbmr38IXTCJBoJVvRljOP4oU
	CPPM9Ah5RsO5w84POsBT8nXUUGq8vn0i5wsQsecw/Q9aiCqlEVjt6NMCalIm2YWoCwMSBZFG6cy
	FWQ==
X-Google-Smtp-Source: AGHT+IEklaC0M02gKwu0vEYUSv6f+jBLX5i1o80HacxvejQgGQU/HK8rwZXcSzpBPGZ7mCbPiYEdzIATv2o=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:2b8c:b0:dd9:1b94:edb5 with SMTP id
 fj12-20020a0569022b8c00b00dd91b94edb5mr169322ybb.10.1714522928046; Tue, 30
 Apr 2024 17:22:08 -0700 (PDT)
Date: Wed,  1 May 2024 00:21:48 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240501002150.1370861-1-edliaw@google.com>
Subject: [PATCH v2] selftests/vDSO: Fix assignment in condition without parentheses
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@mit.edu>, "H. Peter Anvin" <hpa@linux.intel.com>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fixes clang compiler warnings by adding parentheses:

parse_vdso.c:65:9: warning: using the result of an assignment as a
 condition without parentheses [-Wparentheses]
                if (g = h & 0xf0000000)
                    ~~^~~~~~~~~~~~~~~~
parse_vdso.c:65:9: note: place parentheses around the assignment to
 silence this warning
                if (g = h & 0xf0000000)
                      ^
                    (                 )
parse_vdso.c:65:9: note: use '==' to turn this assignment into an
 equality comparison
                if (g = h & 0xf0000000)
                      ^
                      ==

Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
Reviewed-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
v2: separated assignment from predicate
---
 tools/testing/selftests/vDSO/parse_vdso.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 413f75620a35..fdd38f7e0e43 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -62,7 +62,8 @@ static unsigned long elf_hash(const unsigned char *name)
 	while (*name)
 	{
 		h = (h << 4) + *name++;
-		if (g = h & 0xf0000000)
+		g = h & 0xf0000000;
+		if (g)
 			h ^= g >> 24;
 		h &= ~g;
 	}
--
2.45.0.rc0.197.gbae5840b3b-goog

