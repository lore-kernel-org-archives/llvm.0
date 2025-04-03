Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C4A251783
	for <llvm@lists.linux.dev>; Thu,  3 Apr 2025 16:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699431; cv=none; b=dqJPQAwYXK/m9Au4VfnVJI2fNywvzjIbCjYrQUHlbKgCWyFj2NtSeK5iRESyvRVAWXajva4psQ0iloLFUZMUlJu5c8JkNCbu1LW15BSGfyEyyvpUc1smRAoPwXn4Vsco6HJKzYqsDIenmkDzziocR18hUr4MtX+5Jb614Y7oqb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699431; c=relaxed/simple;
	bh=zILY8QKhcQswVn+rw8O67wBaegmDIoNMhIlfFZckLcs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=cNpsUQSsBw3AtiqliVksS18phSY1/8Q6jJ47XZI9HMyj4iEd5Xo9CyCIKG/YluyajAMD1bYsrKoyX3e5PLbXlZdwNWeFg0FRIbANlTOQRzNA7CPjOd5kIALyUhBzn4kK69J4RWrB6xR8bQgiJRVLyF2iSR3RRoBgJZwRIwSqDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s0WVWlWp; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s0WVWlWp"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22410b910b0so8786755ad.2
        for <llvm@lists.linux.dev>; Thu, 03 Apr 2025 09:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699430; x=1744304230; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aH7Ec5u6cTDPfyUdEzfgPdfyysE8iLjLm12xst9ksRw=;
        b=s0WVWlWp2wIS4s4Kl6DpJ8xciKD4j21J0roz/2J9PWmV/GRPC3mfFKVu//87XCFMuc
         wwS6cNv+wX23Y2tj3yJrIoUZtR+MpSsidu/w8R99l0hEmtnFqXsAMW2QH/IYhL23OpXO
         qrytwinSF0EKAl4u+b9MQC893aBrafRbbsQh0Z6UEAFu8xZjyGkGUhoEwFwpKCipm3nm
         Wdb8SGPvm0AC4F+guJdRZVvWjzqCCcHB2LWTNej9nLWAqAtfNJl2SgS3h7L21QdktmoP
         aY8d0A7Dw9uJxQbFBHwMYDRzT9kIjNLwYRCMA5m8tsZ19jCCNazK6ToK7q8ptHTeWHGq
         M5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699430; x=1744304230;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aH7Ec5u6cTDPfyUdEzfgPdfyysE8iLjLm12xst9ksRw=;
        b=IqqJZw3bhitHT90ofUqDEUOiVzjYAQ0eSnaQFd7snbBh9ySJo5oePjVtyqTCKUyGSd
         wKmpMTrrl7qTHaGbuMjZ5D0ILlfiWRx3Rxban/t5pmFGQvln2NvgxcPJrgmlRlrF0gIh
         XMf1iBJO29evkZMKoohO91chfRZ1CCa+vMa53EXYdxvZiV6ODvOpII5OSWUUj5H+NMqR
         2P71qwGUygB+Xhs5ZGhCLDmPDIdX95bVovUsIHBC4iKbaML45l5Nqhrze1UELs1fpjlA
         54Hu41Fk1HUBX+MsGQF/9VCy85NOXU4a8dbt9VJ7iREvKY+IHREOaaMFGnO94LW5Pp6D
         XX5g==
X-Forwarded-Encrypted: i=1; AJvYcCXH+rmxnd60C7d80JwhjPXgkXhW9g1vZIKQVPXiawCQ+rZiRoaZnMD+CGdMq3JH6HHyrIiA@lists.linux.dev
X-Gm-Message-State: AOJu0YzsSsmb8yUet6r6S1lvPcHxmtl/yG5SHLwVav86XViIb+4H6zRG
	Pu9MWQ7FZhTaxv0Dm+8qf0toJyUNMZpMSOSZyljjBIvkc0QgNe5sa9/iZr/2h5Mxs9od9ldh7Cy
	N1Wplig==
X-Google-Smtp-Source: AGHT+IG9oZEuu6NDkJoIa2JD9l2/TLvpDjP0WeNnnvefNvsoRX5iyB+xveOTqMHwj8Lg+En5G1S8314Nlrs7
X-Received: from plbjw20.prod.google.com ([2002:a17:903:2794:b0:227:e9e8:7153])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:22c3:b0:223:f408:c3f8
 with SMTP id d9443c01a7336-22977d8bc8bmr47225985ad.14.1743699429988; Thu, 03
 Apr 2025 09:57:09 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:56:58 -0700
In-Reply-To: <20250403165702.396388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-2-irogers@google.com>
Subject: [PATCH v1 1/5] bitfield: Silence a clang -Wshorten-64-to-32 warning
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
 include/linux/bitfield.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
index 63928f173223..cc5cfed041bb 100644
--- a/include/linux/bitfield.h
+++ b/include/linux/bitfield.h
@@ -176,7 +176,7 @@ static __always_inline __##type type##_encode_bits(base v, base field)	\
 {									\
 	if (__builtin_constant_p(v) && (v & ~field_mask(field)))	\
 		__field_overflow();					\
-	return to((v & field_mask(field)) * field_multiplier(field));	\
+	return to((__##type)((v & field_mask(field)) * field_multiplier(field))); \
 }									\
 static __always_inline __##type type##_replace_bits(__##type old,	\
 					base val, base field)		\
-- 
2.49.0.504.g3bcea36a83-goog

