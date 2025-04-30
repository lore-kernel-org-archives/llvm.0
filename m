Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E096D262811
	for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033345; cv=none; b=Hn6F8H2vm3L7SRMA/xA7Lw0s58sjS+0Snnnvt5WZsQwnOtz3RD++/iC8sEouzWlpN6Fz6GXk1lkfTwvcDPutAsVnulhFOHYGjJ9fc7hVZKMUakezngqf7Kc4hs1oDthBhyvQiuhy9geZurSQh3EK00d+wKa23pSIhfDz2OVZUQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033345; c=relaxed/simple;
	bh=lm5ga5E1Bh0WGysa1ZSSmKbnAd9w4JpDDVcJpw+p0k4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=ZbpBwU69i1CvLRwtpjRtXjekdw8ix77ZuXT/xlt2nk5CRRf5WPPSy6o/sL+wS8X6V2vKXGpMHQ1E5NiH5Ss4UP77e2WMpmGpJuA9wb7zTk7e3bVMsV8LUk94QhrvVNdOvb/mjZ//dBLRqswD8/qu96f0Hw/jRBKDJjGtGO8iAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qdpBrsK7; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qdpBrsK7"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736cb72efd5so107779b3a.3
        for <llvm@lists.linux.dev>; Wed, 30 Apr 2025 10:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033342; x=1746638142; darn=lists.linux.dev;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FpIgS0wmOV5UbvgaGzkA8qij/rEeOqGzeG6VWVukYPI=;
        b=qdpBrsK7Y9EyfNzj2EkT2j/oaawqaUdF8UiQV3pjo1Jp+YWzFKf8XFlptNTeuj72XP
         f8Kdz/L5btGJQEPY6j8ZuC4SjNUM2X0MJJsTx+K4KvtY1t5UxoP+U/lmAR/quELOVNic
         jnGcqPwdbEmI7doSfWwZUTy9PDpzluvPV9+0wYXJUJ0kr55McSfwyyIRCYCLIIhEyAka
         vMqbf5ibdynoB0KBwASyiGcC9jubigROL9UdtCp5aiSy3kYr2nrs5ZKIGdh6TBoUgvIM
         jXXX+cyClMjmeHro89gspNV+9kjuNiDOk6/hWp6+fmQ82+DgxP0UiRbDlVMminBaq28B
         N3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033342; x=1746638142;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpIgS0wmOV5UbvgaGzkA8qij/rEeOqGzeG6VWVukYPI=;
        b=LVHcQs/EyFjvNv190lFT4Fbd9rHSuF2Gg+gyrUXHy06OY+/pnTEmD8A22oiCL4eqIq
         HvLUuYl++V7uwP0odiNwiMaXffA1Poa1kOlApEicgyk83Gu+TZo/5w5liVjViJg8zmW+
         dS45jkIC2xKkQg8jtTvheZgZB978BGK2t4jiPBmA/8np/eFdMm5n4QKlDATxxWEEOVi+
         pXgg3ioI/4lgH7uMHyToYkx9bEYpxLnwG13XNaFdRhni/BEUposmiHMI+x1tjKRCRt1F
         Xvw/60a0h3GVPBy8tG66Zk//kn/Ablc0noif2vnB9cBi8SS8wln06Bs3lP+P+KS52mNs
         3VPw==
X-Forwarded-Encrypted: i=1; AJvYcCXjx91nGLswGt4qZBno91ifMtoEGeD0fjmKCtP4pO14T+XhLFSBrYl1QaSKdsFEOeWhpxOA@lists.linux.dev
X-Gm-Message-State: AOJu0YySFNXtuBjVo9vtsxh6qMFrpCSnNAyn6f++WdIoTxtBOtpE2YjO
	EaHA0fuCxtc66M51BzeP4C8Rj4I6jRx0We5v1sh8OAowciLKZcCjnw2AE3+PNOWexQsmbSw266Q
	1kWHg8g==
X-Google-Smtp-Source: AGHT+IGv8XMgRIoeJR1rySLXISqqmVQqJou5NGwUjKxk7iOH4VQdGHhiObrDzUu60o16T054lU4v3OaRDTR/
X-Received: from pgkb21.prod.google.com ([2002:a63:eb55:0:b0:b1f:857e:2198])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e617:b0:1f5:75a9:526c
 with SMTP id adf61e73a8af0-20a87c5680dmr5326067637.13.1746033342084; Wed, 30
 Apr 2025 10:15:42 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:30 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-2-irogers@google.com>
Subject: [PATCH v2 1/5] bitfield: Silence a clang -Wshorten-64-to-32 warning
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
2.49.0.906.g1f30a19c02-goog

