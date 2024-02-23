Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C91420CE
	for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 17:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708709384; cv=none; b=t2vQB34rZbohRY3xW0b3H5kq2G+43ymst0+XaVvMblAT6gOOrdsksqKUZOVZCP6HhnPVrAaawE1O78pVjOfKuZ9Bu2PvhNW0b9VJsoEC5uf3OdbbfZXcdzgPRdECg+aVlvMP5QQjq14UtKbDWjtZ8FsEm4YPtGIjQU8h6A9PXA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708709384; c=relaxed/simple;
	bh=ZSQMrFcXK67EoYJFvWEtAVXpJz5HlNabiFfB2+DnMz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=DriPGSi2Otzj/VDsMFlmgs4i88AhNM6J+yez7sUBP4h94GYSH1W+7iD+5aEtuNypuqhg4ohlPVc3CTO2mrxhdIMh9yKPcN7JaZzi+sSphJLydB+Hd4tkoBRKWbzzj1jmFBv99SPxVmpYLqY5dCRquFzpBXqTcj3kxAVUk8JyWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GoPP+Kgk; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GoPP+Kgk"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc5d0162bcso9136175ad.0
        for <llvm@lists.linux.dev>; Fri, 23 Feb 2024 09:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708709382; x=1709314182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bM3MPkF58+jFMGrw4OrogBOTmRr+QWSJaSYzjCyKYu4=;
        b=GoPP+Kgka+Xz7+tS7u/uQHKKbucix1n/ofh6YeEcWBbO8B314T8npiasusSKw/vK/l
         Uk05kUDYWi7CVt0YynK79Rwob1MNHU7toRFMF+hMcv7f1nOB6r98NVuM7XVUN/jkZdoO
         3/o0wTxaRMJKnYFMbTHj5Mx/VUB4oWrWaJvxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708709382; x=1709314182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bM3MPkF58+jFMGrw4OrogBOTmRr+QWSJaSYzjCyKYu4=;
        b=Y7OTKOOUXD0CgBA7wHVqrOQ1w7nw0uIoEhide+boLhKEZ/eecdKTFXVjyI9EbWAzWv
         ATrU1ffOiDbL/Z7usmqHbDjS3oF0CrMdYdSyc9trIuV5FetmjwtFNhl9LwL4UPwGXyUm
         si1/x3XxwCzTotj8z623A2Q+EFpodoFuDta8qyIBu44AlbXe44sUxC76OTzhbJWD8Mxj
         ywfU3X2z9Ub2d6/XLHmxvvb2uFEuk80iw6bZRAbK3Gu/ld7qeb7wBRn0fa+7CglGSIUL
         cBP2dBWtEU55/w5A82JZhTSZ0KSdKbPD9FyMzNVM+MEEFd5Xm3zldgbSw0S/OfbAKs2p
         2gYw==
X-Forwarded-Encrypted: i=1; AJvYcCUvtuEFtHhdiN2hDeEeIkiOe9TD6+b0+JiLWDnqj29XykJRCCIcmorAnbv4qye3Cvsk2+Gm2g7hN+WIbQCIbp3Th019KA==
X-Gm-Message-State: AOJu0Ywfu7fXBkXJTdi7V37kmoGkoW2YVNRKPJK2ZgqNxh2AvCr5roTD
	SLpEFQtx/LCBG4AfrjE/Ip7+tCvWcIhf7znuCUIvX/0pY+9N98lS7ULf6wmh8Q==
X-Google-Smtp-Source: AGHT+IFzDY8go56+ptU8+F6xFCu+b2Z7ssHDmUg/9Vyz+3JhhD1xjzJWr9XeBbMxTH99G/AutAFy0g==
X-Received: by 2002:a17:902:c102:b0:1db:c536:803c with SMTP id 2-20020a170902c10200b001dbc536803cmr435891pli.33.1708709382389;
        Fri, 23 Feb 2024 09:29:42 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id b2-20020a170902b60200b001db604f41dcsm1778891pls.103.2024.02.23.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:29:42 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	"Lars-Peter Clausen" <lars@metafoo.de>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	"Nathan Chancellor" <nathan@kernel.org>,
	"Nick Desaulniers" <ndesaulniers@google.com>,
	"Bill Wendling" <morbo@google.com>,
	"Justin Stitt" <justinstitt@google.com>,
	llvm@lists.linux.dev,
	Tomislav Denis <tomislav.denis@avl.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2] iio: pressure: dlhl60d: Initialize empty DLH bytes
Date: Fri, 23 Feb 2024 09:29:39 -0800
Message-Id: <20240223172936.it.875-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1937; i=keescook@chromium.org;
 h=from:subject:message-id; bh=ZSQMrFcXK67EoYJFvWEtAVXpJz5HlNabiFfB2+DnMz4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBl2NYDdis920sydQS6ipBI49BtcHYYpvp5bOl50
 hx40NdinzyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZdjWAwAKCRCJcvTf3G3A
 JnTxD/wM4aMItMA1GlvtME+XbzHXS9RwkeN0sJ2am73tn22dB2vdV/htY/rmnPgBgjy46iuc62k
 Q3m4V2vmIRR7oin7Dp6MHFYVWNysZUrOrwO8uoINALTCyF30N3JPEUAlk4XA7j+U6DxerZ2IdL2
 jERDFaW6E+LGdZ3aQ6NsWuJxVvv1CRf2vcdwt8LL852yhg04L+MVtjejOhyu5dpy2wwFWU1qRGD
 cclqSl/4dB639iKcUgL3C9V9HKkPNtCYNINpITFMjIQFQzsNWTGonSvc/j3a5qgjb0gOMjlZ3+w
 cgF0DtlubTNlGX3Cpcq1K1B7qACqsit98xxDp561xm8fxD5LzuBoUfAlUZ3FhMj03iGsyMibDs8
 sk2GVwIANvPLWEriBJoqA83QqASX0TUC2BoszwezFgAriD0yMUS1O+j9zvO1SL8sNENlY7hzfIF
 Uo8fIy0Ey61dvD4BLNIY/5gQINuPOcGnpiw6PUIuUw1YywkubRbxs/Kajkeh2JjzESkcGpHXVO2
 zWqeB9B8/TO83C5O/BVx13LUq4OabuCRcOQA3anJYepO7RV5Nm2pUlZkx7gznkJtH68AMU9pmiu
 F3zxSeRPQ96CxmN+/baatYUN4AR1631D1oJIWyIM9SKfmCwzVUENT+QYOHbx0I0DhV0/52n0wAY
 wgn4Woo Gjwzea2g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

3 bytes were being read but 4 were being written. Explicitly initialize
the unused bytes to 0 and refactor the loop to use direct array
indexing, which appears to silence a Clang false positive warning[1].

Link: https://github.com/ClangBuiltLinux/linux/issues/2000 [1]
Fixes: ac78c6aa4a5d ("iio: pressure: Add driver for DLH pressure sensors")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: "Lars-Peter Clausen" <lars@metafoo.de>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org
Cc: "Nathan Chancellor" <nathan@kernel.org>
Cc: "Nick Desaulniers" <ndesaulniers@google.com>
Cc: "Bill Wendling" <morbo@google.com>
Cc: "Justin Stitt" <justinstitt@google.com>
Cc: llvm@lists.linux.dev
 v2: drop comments, array expansion, and WARN. refactor loop.
 v1: https://lore.kernel.org/linux-hardening/20240222222335.work.759-kees@kernel.org/
---
 drivers/iio/pressure/dlhl60d.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index 28c8269ba65d..0bba4c5a8d40 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -250,18 +250,17 @@ static irqreturn_t dlh_trigger_handler(int irq, void *private)
 	struct dlh_state *st = iio_priv(indio_dev);
 	int ret;
 	unsigned int chn, i = 0;
-	__be32 tmp_buf[2];
+	__be32 tmp_buf[2] = { };
 
 	ret = dlh_start_capture_and_read(st);
 	if (ret)
 		goto out;
 
 	for_each_set_bit(chn, indio_dev->active_scan_mask,
-		indio_dev->masklength) {
-		memcpy(tmp_buf + i,
+			 indio_dev->masklength) {
+		memcpy(&tmp_buf[i++],
 			&st->rx_buf[1] + chn * DLH_NUM_DATA_BYTES,
 			DLH_NUM_DATA_BYTES);
-		i++;
 	}
 
 	iio_push_to_buffers(indio_dev, tmp_buf);
-- 
2.34.1

