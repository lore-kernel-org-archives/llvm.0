Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A014CB58
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706553257; cv=none; b=G5OcwncwIJvzKRW8utI+TX7vN0fOcYV7lnKVf105Vzt1K2ucFWlhHkS/MdS5Rs3fgVY4tN1bBvHEwu/Xu8MMc1k8msYCOHQXhkUFUxUszt615KlFXZoAQOCEXiliSlLZNH0hqlh1NWK4YhNg58eR+X5H61PO2kJXQh5xkOvrSwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706553257; c=relaxed/simple;
	bh=8qBo+r1o5uX8xwwRI2+8kwqWeOJfk0QZ5WpwUuylvAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mrysNOWopp5FABuKLixC/xqOBoLyTUJxNHSd4VoCNqnA2eGjdSoMOeMZ8jSNHoQTaOoXhgZhDVwpoD5AFePJJZ4jzP7MqnDuyKYmxrWprXodVV3Rdanu24anaMQP4TV5z22booQLRJVqpruuCTOEUHSLAUw/FF3QwCRT8IAQwNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BHeNNGt7; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BHeNNGt7"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cedfc32250so1642494a12.0
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706553255; x=1707158055; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOi3qaLwpWcyO/WH2EIxnXUOlsjjGr/OsABWCZKoxrI=;
        b=BHeNNGt7bAZHSL/RjSh5eTHSwwfrD7q+SZEbJA/2QLSKLUpOQyd0Fjj5PW2/9hz/gg
         nNMWpv7IWDjKiSxqvWWJSbKenVCsuxcrRVmFeu96Yu0rX+ObPiVhSe0wTEjdVOJ3tDoY
         UbAHHifkM9PCh+EnuY0xZejwZRbgZzzqUAZwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706553255; x=1707158055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOi3qaLwpWcyO/WH2EIxnXUOlsjjGr/OsABWCZKoxrI=;
        b=kKinqxUr0pQEuAlRMeBapfyqDlsCbzC7k6esS1Ij76LE8IgW4d//IUi1h58vngBr3j
         aX3ZmDgkFsJ/rINu4/psOk5VO11N4xL/7tykHeapwcpEYRSO4bwNbZTYAqCR7bozojx8
         p+/etGMgYFct7mvdEUDsvND46tal9isfOZgnrylLGOTRUjzIRDGS9pY9ITeiyrSi7oMe
         B40peLk7P/DFz4HGqE0tZOhtCy3YOZ+Sgwdhgv0VTsxKOpX9HQ8p+opkgOBvq35X5rR5
         JMWrUFaez3mDRHru0BEsHL2eUYizQOe/dFvbN53OooFfE5irQ7gRBevKetKpKuBzadMj
         pahQ==
X-Gm-Message-State: AOJu0YwG8DxfmuCUtBa05e49yV9WkODWRbA1Q5yQr/YnWIPZzRbme/SI
	HTUCjdvFfjlUyXfIPE8jQkltU5LANUjP7uVbkh+nHbpLj0lwJ1ERVLlxTLnDLA==
X-Google-Smtp-Source: AGHT+IFnFzWopA+FTNbLpeku3V9/v0WIlaYJvIgixHV3VvflgAsIYyXCbCLM6XVYfJn/avWkMTal3Q==
X-Received: by 2002:a05:6a20:4f1a:b0:19c:8fcf:97ca with SMTP id gi26-20020a056a204f1a00b0019c8fcf97camr2530546pzb.60.1706553255720;
        Mon, 29 Jan 2024 10:34:15 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g7-20020a170902f74700b001d71669a30fsm5722452plw.109.2024.01.29.10.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 10:34:14 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Kees Cook <keescook@chromium.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 5/5] overflow: Introduce inc_wrap() and dec_wrap()
Date: Mon, 29 Jan 2024 10:34:09 -0800
Message-Id: <20240129183411.3791340-5-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129182845.work.694-kees@kernel.org>
References: <20240129182845.work.694-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2034; i=keescook@chromium.org;
 h=from:subject; bh=8qBo+r1o5uX8xwwRI2+8kwqWeOJfk0QZ5WpwUuylvAw=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlt++hTMcckwazpkGwN3co7nO6qqaui6d7qOFGo
 HqcZdYYMsCJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZbfvoQAKCRCJcvTf3G3A
 JjLYD/41af8TH5vPKBme99k9V45iwAafnhobwzSpJqZkoF4aHZaUg8mvXE/PdM99iATMf4nPr/O
 ycsKDiuC7/euYHLEyODmb5I9L6hzlvWnzy42LxuTs2qIAFSxP5t9wx/DrAEDO3LAmhOQdFJlJMm
 2Ya7/S7q9Qz68sLIZXcotFktkTo/X4bZvLP126YodD7eWqlUlcK2vrCtT8tuDe9Zkp6VAaHTVOm
 KsbmGdkOwxg+/TbsvkvFAsAwGF/fuL9/dZ5yM61GTA7QXOEPvth0Qn7dNxOZWI4eHPH1vQe7h5Z
 q3sB+SXjCesHuzwWrb5yTTJYOiOAwNKg49o/EbdiX2smvigUX7v1rxToz8wEsj8hk1DP4q3oFC6
 Qo8klArnkKEr+dgnT2Efc1viiGfzP9mNWSKecF2xMm/WYmp3DSvP2BA708K+PGI8LBok2W/2Gt+
 zz6DukdknEKikX0o6i1odluirCLQohzsIQ7nGemLeuxI23hqmTwS/axvt5RUexfKh9cLroTPRgf
 3knmXQSDxlUrZIwyrhLjczoe36Hb0WgjSwMOounvBs2H1dF+67uD4HOd5Y6OkyVzf4W3EbHrA7R
 fpbNA1NoQ9sdcKeZQprybnCISRKc+FxGIQUWR99xo9Yu7mB6oaTidtLxM3vHjKPL2BMSZ6xdL5B 9K5/jDKen/0fwXA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

This allows replacements of the idioms "var += offset" and "var -= offset"
with the inc_wrap() and dec_wrap() helpers respectively. They will avoid
wrap-around sanitizer instrumentation.

Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/linux/overflow.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/overflow.h b/include/linux/overflow.h
index 4f945e9e7881..080b18b84498 100644
--- a/include/linux/overflow.h
+++ b/include/linux/overflow.h
@@ -138,6 +138,22 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 		__sum;					\
 	})
 
+/**
+ * add_wrap() - Intentionally perform a wrapping increment
+ * @a: variable to be incremented
+ * @b: amount to add
+ *
+ * Increments @a by @b with wrap-around. Returns the resulting
+ * value of @a. Will not trip any wrap-around sanitizers.
+ */
+#define inc_wrap(var, offset)					\
+	({							\
+		if (check_add_overflow(var, offset, &var)) {	\
+			/* do nothing */			\
+		}						\
+		var;						\
+	})
+
 /**
  * check_sub_overflow() - Calculate subtraction with overflow checking
  * @a: minuend; value to subtract from
@@ -169,6 +185,22 @@ static inline bool __must_check __must_check_overflow(bool overflow)
 		__val;					\
 	})
 
+/**
+ * dec_wrap() - Intentionally perform a wrapping decrement
+ * @a: variable to be decremented
+ * @b: amount to subtract
+ *
+ * Decrements @a by @b with wrap-around. Returns the resulting
+ * value of @a. Will not trip any wrap-around sanitizers.
+ */
+#define dec_wrap(var, offset)					\
+	({							\
+		if (check_sub_overflow(var, offset, &var)) {	\
+			/* do nothing */			\
+		}						\
+		var;						\
+	})
+
 /**
  * check_mul_overflow() - Calculate multiplication with overflow checking
  * @a: first factor
-- 
2.34.1

