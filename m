Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B837D412
	for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 22:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706652379; cv=none; b=J1/Bub5eSersXUuunqqtwX/JV57PLb5pk9YfMOjg1Tu7TIBhavHBU9AjbRXc7GcaQDmtLY1SLQGGEHmIhBFITNZPRzSN4H0SgYCCCZMGOs6EJhL1n+FkmN8/IbZnhEJvk6/vgnhtZpSGjRar4MozY22XVrz4hGK9tiveZl+pxkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706652379; c=relaxed/simple;
	bh=WUwqmJoFZQeyqmuC4k6x7kK2L9hMV5zmyghrfRiNqjc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j2WNKwMYoP/NnQSqvL+HZiH7ai+4jrwHY3yPKYFqnxNtaE+BlXDPhIj9aOWWbN3tI5jAEu/FDChXRWK5iAfuiYkMFG9OaeSEkU6eTw1MzAWRf5qVFKFHrZ8DGzbSVuEA6gokPVKyKxkyzspbUkkZoBsxWy8lXvSZSXBKhVRjuH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ixa1nXFg; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ixa1nXFg"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-595aa5b1fe0so2777552eaf.2
        for <llvm@lists.linux.dev>; Tue, 30 Jan 2024 14:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706652377; x=1707257177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NouAp6ATROls5AjgSHn6FMH+dDN0Afdv78yAag0W0U=;
        b=ixa1nXFgadGpeU1B0bykhCEY26UEwDJX0hvnneMY7aJfPb+GxrC6xvDp6QVEv9Z1+K
         ueIiEIXkIHZVyeW2oWBCxTYZX/YBtpJbypeKFUCBUKcdwU4ee4sq83SRntG38pLj2M4X
         gIQWV5J2iT3aLPgFTrLNMD7gNl6TLQ5AGC4fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706652377; x=1707257177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NouAp6ATROls5AjgSHn6FMH+dDN0Afdv78yAag0W0U=;
        b=Y/51HT/pe3XFYk2j8NzAm9w19j1bf1JJcACftz7oeWTqP46i7btoYKxueFy8Y/2iqh
         P0IreepwRCt6xgdJZTrLdxbiPXaedyF9XthQW42POAmNVic8B7r+U/Xn/uT9j9z+NhYw
         EJWOqvRS/VXIFcn4GvjUdxjpkqW+zhn8ZxkRTrjaVHTcgwEIdourW3QNnRAOYG0JckU3
         ZgEykcyJmoHbKPXyg3p2OUBp52dQINUoaTF1lIsztz10c0H03C5dd9qdcRKIdpJt9mwx
         nxojYl9PR+0pD71pBtxWHBcWabOOS9rLWfyUqwWKjGRJoxvDZ/eS+htT30vgo6+hFnBF
         JRzQ==
X-Gm-Message-State: AOJu0YzzkA7SJgcIPIy4QU1exFOe7L0P9PJKB7kw7oxL6iAIQfwV/nkR
	KiBIc52ljSP3onR53G5mxWF4Zdz9EK7AN+YSiLqQ4gEU/OMbRfoDQYlb37sk6g==
X-Google-Smtp-Source: AGHT+IHM5CIjGnaWPVQJbefnPzKTqkXb953lJjgYmVucTvoMoZOsWJbs69yFvunQXf+9oTJH3ef9LQ==
X-Received: by 2002:a05:6358:4318:b0:178:8ab7:e338 with SMTP id r24-20020a056358431800b001788ab7e338mr3080332rwc.22.1706652376816;
        Tue, 30 Jan 2024 14:06:16 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e20-20020a633714000000b005d8e280c879sm2373723pga.84.2024.01.30.14.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 14:06:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/5] overflow: Introduce add_would_overflow()
Date: Tue, 30 Jan 2024 14:06:08 -0800
Message-Id: <20240130220614.1154497-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130220218.it.154-kees@kernel.org>
References: <20240130220218.it.154-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1484; i=keescook@chromium.org;
 h=from:subject; bh=WUwqmJoFZQeyqmuC4k6x7kK2L9hMV5zmyghrfRiNqjc=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBluXLSKrOGOdtE6GxGZsc08FzWIhOaMnOeNq/p8
 lHKmLHU8x2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbly0gAKCRCJcvTf3G3A
 JsybD/9hil900CeIkSDVu7dEhGUU7Eh3jgkpN4uvXxQKhpz1xxwIYnxerdxt4kUhSZ3PU7Wn+a8
 y2tMl38HSeHfTMijx0VTRIz766tSzidw/km095DK7xlLqc1C7p0bOe1fXmjDJjZMo/h+B4iYAUP
 786UqO4ZLOPpSWWjbEoirC1DSpvbcZbf9v7z1W8wRV1v25gyUBQOvYrUMm1YCOaMm0RQGLfuLPC
 9VVUdvY4jETXBTpUlKQ7apR4LH+2R5ioDpI9ZaCEuIoZfny7BG9mJBkmXZuvWSrXUzwoqvhEQOi
 d/JwwmkQ97OSBCj3vYl/eYqvSADKpwdPKlHA1/LuyVDmqtbvEF5Zpvy/BxkFgcPvwProrebcWtj
 4Kc0aWfaId1UDIVNhDIbt2cGolemw66t7obWCVe59lXAAxjT5g1SQpAbVmnvDU0Pq88Ty4chzEN
 a5B1zUIWzfXejwU/U02FFfpn6jzIxuavta2dAkaqF57YIfzdaiKfCqE6G78qg7/EIUwJ1qsKJlD
 NtnqoqDMkGYOdmKSvMerFSc6HJuJAPskCMyoatyDAXt3Lors/XN0qMiAFiPxyW1JE7Q/EvtUcer
 2tuf3HJSurwaeE4R4tAEbTLHd0N57a495U5UbSpkLEwag6gPdKC/6sH5j119nzxFUVW0AxTv/+S YGphMUzZKOqjzuw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

For instances where only the overflow needs to be checked (and the sum
isn't used), provide the new helper add_would_overflow(), which is
a wrapper for check_add_overflow().

Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/overflow.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 210e5602e89b..3c46c648d2e8 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -104,6 +104,22 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 		__builtin_add_overflow(__filter_integral(a), b,		\
 				       __filter_ptrint(d))))
 
+/**
+ * add_would_overflow() - Check if an addition would overflow
+ * @var: variable to add to that is checked for overflow
+ * @offset: value to add
+ *
+ * Returns true if the sum would overflow.
+ *
+ * To keep a copy of the sum when the addition doesn't overflow, use
+ * check_add_overflow() instead.
+ */
+#define add_would_overflow(var, offset)				\
+	__must_check_overflow(({				\
+		typeof(var) __result;				\
+		check_add_overflow(var, offset, &__result);	\
+	}))
+
 /**
  * check_sub_overflow() - Calculate subtraction with overflow checking
  * @a: minuend; value to subtract from
-- 
2.34.1

