Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2521E32C84
	for <llvm@lists.linux.dev>; Thu, 22 Feb 2024 22:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708640625; cv=none; b=eaL/EUEnlRxk1+EgK4g7dvR2pZ5urwfZ9DIJDhZa79M8y9/mXfX3vZUb0lBEYO5BjU6RDEW8vPNqRZO0IzzWRubj1gGlte+l9Xe8qpmdUJSij41obabVuPNcnFOMuo4e1Z/n5LKNqwvHC7qpzm6JwiDb2uq/GOYH9uulBgsp8W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708640625; c=relaxed/simple;
	bh=0xRi+wRovLEtle3IAhjBAqJ3i0Q5IwxvEzplbN5MjGY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=WeC1bp67BAorrJnOHhVFDNIrO9wO8N+xS7TpHeMuQTFDgfWrZ7105LMhHSTvYbdk6HodwF016ZT7Ss6tD42d2d5xdoDX9GRSXNgOLl4s71d4FvZTMk6t5eAcR5T67dr8LtCIiv5RPoNLBXhqFDe54J79iocaCb7jAcmxSFIdUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PZMMYjW2; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PZMMYjW2"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1dc5d0162bcso1439365ad.0
        for <llvm@lists.linux.dev>; Thu, 22 Feb 2024 14:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708640622; x=1709245422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q+5ilM19CFuUy0zgxwZQpQ+MBc9LAqwOhihVDIFuqNw=;
        b=PZMMYjW2KfpdtsnhHenV8gr+5kGMBRWgNOfAsqh8E1efYM8sMrwhbixTYdxec9goXQ
         8ezymKFMG+2BI1lkaNg2pomVUcBj4+k3Z4yD18WyyjglvxwwiG0iQD1bpXc28IJ2T3W+
         +mF5+s+SLOW3ixI5vHgxJqo1CnKoZfBk15Iws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708640622; x=1709245422;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q+5ilM19CFuUy0zgxwZQpQ+MBc9LAqwOhihVDIFuqNw=;
        b=prg91T0AjuAuT2I/CGTBi+1WWeUZJtehVB4DdFKzvqIk/CWIMI4KtoDa2dDhUyBgOX
         uwDURmYTbBni/Wv6x2Wa+hdGcXr5Dq2kDBvx/SHEwj6/hdVttLtyhDutPP9g4azQm7ej
         SNW7WU418kPRCQ794P0V9wCqswD/rtekQFZBg97hmrihnnwYWAThHFaVAQqtq5W2EhDQ
         D4AJvr8Wncw+0vgnTJlBFcySDU/WhR61Efq1GsJraRXXywzvMG5mJu8wWph6TKGUeMGL
         Uh8FiVWT6EAsK8NSWodV/pZJ6wwBMX/oghcICbu4A1YfH1IXdF0DIMaDbfeUR1ezzk7g
         yh1w==
X-Forwarded-Encrypted: i=1; AJvYcCX2wjkpnu2fwZHnYWlpRtf9fNHnQ1hAgf0H45pr5yjal71FTHjAHSpe8PFQ70WfWhReh1Oxavdjy2EifTD+2gEflnV02g==
X-Gm-Message-State: AOJu0YzgR1xlqLjsmsGGxUbTbvgthT4AK8X0LR6ZptQfwoL4PWYjh+uh
	x9klLD9K6OziYjlwgWR4v4WjTzgwyDAYpxR78YP55DP87tbUtF/AfGdL6z/COg==
X-Google-Smtp-Source: AGHT+IHTlMT87C9FVzzBUlliIz9cjmezsgccL1stCQ33LCcAcJX6p5zAFxvPwu7ziBvSPYuZmtGtZw==
X-Received: by 2002:a17:902:e5cb:b0:1db:d13e:26fb with SMTP id u11-20020a170902e5cb00b001dbd13e26fbmr266381plf.5.1708640622569;
        Thu, 22 Feb 2024 14:23:42 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id g12-20020a170902c98c00b001d8aadaa7easm10458002plc.96.2024.02.22.14.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 14:23:41 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] [RFC] iio: pressure: dlhl60d: Check mask_width for IRQs
Date: Thu, 22 Feb 2024 14:23:39 -0800
Message-Id: <20240222222335.work.759-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986; i=keescook@chromium.org;
 h=from:subject:message-id; bh=0xRi+wRovLEtle3IAhjBAqJ3i0Q5IwxvEzplbN5MjGY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBl18lq4o+31/1R0DWW8xWF6Y+7BP30IH/M1esol
 O1U6dy83cuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZdfJagAKCRCJcvTf3G3A
 JtaRD/9phV+1oaxweCDWM7RyA5yYZNO0eEqTdKf4RB6phXBkx9kEI7rGUVfbyrXtZ0NC+Nx1rNv
 YPwLgODU6hZ6heWm1tX+r26uJ4XR7UM/wqORisZmp8e9X4iicnJtPPF9BpC8YsWfbDf5EFw09ip
 N+4mhNwKHfW6hvAG4l0ujSvKtJnIGTaKy8JowAz0VRswGgw/xGbQatKmvPuABoOxt3HMXXBP3Qm
 gSzJQ09JSv2A74EpZAcRKvX1qg8a3bAdPrHyQFHmZNt1sqW54K2KWU+w2umluFntRwtv9AfItiv
 81zNznm5WHoKMz83Y8VyHE5bBcUpRp06+1+KfnAZ6JdexzUsQ3Sw7t1rqTfUsRLjreMaplHPbf1
 Xbv4YatUXU3FeQ0kuvAH3z66vmuGvG9j4GvjxjvJ1tgJ/aFAD6gsayqP1j07Op5om1MCgspydfv
 ATbWJR60pbqyr37CFhZ7LDB3ko/cKUq+FBUFl8Ot4iN0ffVMOtLLHNTY0Os0A/L2ZyM9MLilnLF
 4M5PfHPjKrAeU869+gMxnFWfA/vTdZ3ti4rVtvLwYPzpCbTxcRmOTNY7zo9bA8HEUqHelVjo0Bv
 f0RfC+TisOs7I5itK9ke182+3YIAUbVYWtkOFQluiu5dsJCzihtVr6/0MVdORj1rVJ+Jq4pW1CP
 x2bqQQk KFcoGfpA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Clang tripped over a FORTIFY warning in this code, and while it seems it
may be a false positive in Clang due to loop unwinding, the code in
question seems to make a lot of assumptions. Comments added, and the
Clang warning[1] has been worked around by growing the array size.
Also there was an uninitialized 4th byte in the __be32 array that was
being sent through to iio_push_to_buffers().

Link: https://github.com/ClangBuiltLinux/linux/issues/2000 [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org
---
 drivers/iio/pressure/dlhl60d.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index 28c8269ba65d..9bbecd0bfe88 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -250,20 +250,27 @@ static irqreturn_t dlh_trigger_handler(int irq, void *private)
 	struct dlh_state *st = iio_priv(indio_dev);
 	int ret;
 	unsigned int chn, i = 0;
-	__be32 tmp_buf[2];
+	/* This was only an array pair of 4 bytes. */
+	__be32 tmp_buf[4] = { };
 
 	ret = dlh_start_capture_and_read(st);
 	if (ret)
 		goto out;
 
+	/* Nothing was checking masklength vs ARRAY_SIZE(tmp_buf)? */
+	if (WARN_ON_ONCE(indio_dev->masklength > ARRAY_SIZE(tmp_buf)))
+		goto out;
+
 	for_each_set_bit(chn, indio_dev->active_scan_mask,
 		indio_dev->masklength) {
-		memcpy(tmp_buf + i,
+		/* This is copying 3 bytes. What about the 4th? */
+		memcpy(&tmp_buf[i],
 			&st->rx_buf[1] + chn * DLH_NUM_DATA_BYTES,
 			DLH_NUM_DATA_BYTES);
 		i++;
 	}
 
+	/* How do we know the iio buffer_list has only 2 items? */
 	iio_push_to_buffers(indio_dev, tmp_buf);
 
 out:
-- 
2.34.1

