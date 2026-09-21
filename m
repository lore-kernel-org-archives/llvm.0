Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39834FDE76
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015510; cv=none; b=Ta2N2f7LybyRWJG4t4WuNlKXqnIeRJfD3c3a6ADT0D0sAP/TU6rlrvMY4Wb1/0TprekbLJW1KwHK0GyGQ1EST1SsB1O+kcYjVmODzp97Xis2taMgYrHoPW61krAO9c7ldNsyH7XSqcm9Jxicdn6Sb8syiBEvOxsUbptKZ5sq69w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015510; c=relaxed/simple;
	bh=LqBSm3USoMc1NhaRdGxHYrJshaTcBLFmk+HruTyC934=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WBJvLXrkOdB7SWqvy2FLBsYClsMWkCEHZNUAROuqLyYLtDFmG1XQuqiO4XatnIkbwH1R7eFAckqrayZgv3fubG325cDtntz/JNhAxzlnIQeqfjtqDAPDeYrblw0hUdCN/bmeKLZiz77oy3ooN8ARfNNQ+r7mUeToZemGI5Hj66Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ADSG4M1S; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADSG4M1S"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso29608171fa.3
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015506; x=1790620306; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=ADSG4M1SDNBjJsz/B1sU43MDQLe3XOzSrAs+ZgwjLdsLJbkR+dn0k1LQyiWQlK/mRM
         8u3jZo1f8J3r+vKZV+GWTOuIANDtVBaqRYyEDGnoFxfkKCbAyBURNQdhJ2QqdbQU1iW1
         T89YPps/WZtDziIF0ABlvDP7BYteJVTcBLpKhswqVexHjpGLZhEhrbzk8imuPYDTKI9P
         KxloIJmXdnkTKh6MK1S0SvpsDBiCZxIFtEKHlAHhAQ8iJW818uf1GHH8/ycW9z5SVHWN
         Ano2Hvj3kRl8bIGWbcgCb75OfgO61AJ+44uvSTnChQNBJ29QtiyaH3Xf36WcI+PO2ZXp
         LR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015506; x=1790620306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tl5FK/P0IILzUPHeJ1tB9KQK9WXKF1I6DTxx+ou/T/Q=;
        b=XKW68UrMRWe2ETWbU2BnLRPHvpFQcnpoP7VBjEfUgccwFNuJ+Me9ccFQ7xBs1YYM42
         hFEdtMx123JUf5b3JSnBhJF6z4cFqj/ht0a6Sy9vCdgxeb/UrCItNaACc1TvI5Vfznt0
         eJ3brJsO3Swl95/SFWv4Y+zvjO+2XthYr07DT+u0SLIx0gFDK2uTTs5dUJToJ0R1NhRT
         Gju8lb5NBLmsl6Qn0uMSWQW7vWtLkk1BtcRFepx6unmr2u7tskbnmzSDbCQDEwFeM8Ai
         iiaiA2BCW8PYPp4QDjxDhe5zb+mzQsiVbeYlEv7uYAXp4AJrfu3/mWyLefX2SmDtk9XQ
         VmmQ==
X-Forwarded-Encrypted: i=1; AKwUvByDWXR5a1Nd+5cU3I9iHViMQC0i4/av9qvCKFlenMZFWhAmaniKD4Xb5rs70wF9mYXhiAH4@lists.linux.dev
X-Gm-Message-State: AFuF++n8SOeWSW1ti9S57KZrDynutXJ3FqRgU8ZsEUCKoYjq9vGvx2/N
	VZ14Dmj8093E3zW1NpvivFu8fH13XL6pjHSSYpXhw2XN66gq3BXrm5pN
X-Gm-Gg: AYBFou3doOLljImL5R4zbYtbUNmcVMkkrySm6vB0W0Qqg4jY2pWoQNwRfbFP84ZlmpK
	KouIysXCyUkR7AI1VMwBwJwvQ9oYjCgLzSe8nstBcAvSvME9XLY34yEl+aP8/aL5UJbZnVEjUos
	SS36poLu3gTsCKAkSEGRi4WuXNTqrXb0AjB/ogRwAM4l4kxL/JC4k+hVbrm/Xi+iot5IEoXa+Qz
	BMF9p9vBawMoSHIyDLeV6JC8x3cykrFwlhzeZIRahK0KXBkvrk7u0QEcKztebQJWcF54uKEJEK3
	NYMnWkkCybISDTqyAlUiIdc4c+JpInO+OAxwVlxwXiLZVB5YhLnQFb4uptY46QJToDpkhJZomub
	733BGL/g/Tib7fDTGhIFYrkHbZMP+qOTY+VKx9CqIpGWAQe2vDLyVShjsjqAkCDgZY3Sd1bezFo
	kTNPHXGHe0nhZvavkx6sqcSM+C+4/cvLp1/3q0nhGF5hg2pFcvaIexLA8SUSxg4BaEj6B6pRBFp
	Wq25gZuIn880K2gmya1Kfe5NfYdGwnQPZSF1aH1uqHQNNaE6yXHHq0HQ8R8LqUGEW28yQ==
X-Received: by 2002:a2e:b889:0:b0:3a2:f233:5c6e with SMTP id 38308e7fff4ca-3a5fbe31949mr26986631fa.6.1790015505618;
        Mon, 21 Sep 2026 11:31:45 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a60761e5d6sm24260141fa.29.2026.09.21.11.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:45 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v8 06/10] iio: core: add an accessor for scan_timestamp
Date: Mon, 21 Sep 2026 21:31:28 +0300
Message-ID: <20260921183132.233136-7-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921183132.233136-1-zoone.rupert@gmail.com>
References: <20260921183132.233136-1-zoone.rupert@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

indio_dev->scan_timestamp is __private, so a driver has no way to ask
whether the timestamp channel is in the current scan. Hide the
ACCESS_PRIVATE() behind a read-only helper, the way iio_get_masklength()
already does.

The dps310 FIFO patch later in this series is the first user: that
hardware does not timestamp entries, so it refuses a buffer with the
timestamp channel enabled.

Suggested-by: Jonathan Cameron <jic23@kernel.org>
Assisted-by: LLM
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 include/linux/iio/iio.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 989c1db8fb36..a893e36be988 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -1083,6 +1083,15 @@ static inline unsigned int iio_get_masklength(const struct iio_dev *indio_dev)
 	return ACCESS_PRIVATE(indio_dev, masklength);
 }
 
+/**
+ * iio_scan_timestamp_enabled - Is the timestamp channel in the current scan
+ * @indio_dev: the IIO device to check
+ */
+static inline bool iio_scan_timestamp_enabled(const struct iio_dev *indio_dev)
+{
+	return ACCESS_PRIVATE(indio_dev, scan_timestamp);
+}
+
 int iio_active_scan_mask_index(struct iio_dev *indio_dev);
 
 /**
-- 
2.43.0

