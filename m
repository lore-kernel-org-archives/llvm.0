Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E326C40B0EF
	for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359200; cv=none; b=kuLAHekGw4QgRkkgbtP88AYuo7/RjJ7h6u4nFuAziSBRwaLBaibIfiWzx5K+4dyBN9T6DGPkduCLQndt0w4y5/GGKAGRWESkH4Qsz04ljuRB1G/lNpBf58gjiQKIaLu/YDR5qWlfybGIez5xTcDcsyn5mHgUrCTmXyviTlLHP6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359200; c=relaxed/simple;
	bh=g4BFvBfsn4oEjBKgRF001VzU3DsgniL/WavFRiTrhQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7PYK+9J87BxJXRKJoF0yVrFgjQXMW4rQw6ZGZfxcFmog+YG8mzzxSMlhl4rUW8o0KA4sk70DGvHwDBzR4ogL0aWu324gpjvSMD7H7umujnhUpvgos2VQnnj54CkUOJOKA438ZXRuK+vqBTlfF9iKDIu9NWy/3mJObY+zVvUOBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/m1V1cM; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/m1V1cM"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso9020981fa.3
        for <llvm@lists.linux.dev>; Fri, 25 Sep 2026 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359197; x=1790963997; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wexv0ThwJ2Po0yZ00a92cUQBj5VSlQRd+AC/rWaDMjs=;
        b=K/m1V1cM6KnfdzWzAdx+yAb7Aq5RwnJHvJLmYQNXbqu3BmPfq27kuzHuy6w5SZkIZb
         VZfr7H1F6Av3vA6S3lKiD1Rmxr3pQd5U7eIvTOP3b7oW23+SeOnQQpjkMGSOCh85uuyk
         UFc4gkHq7ebRO+kqh+mXEB6gMJ4VMGGSA7ajK1UCsfNgFMUJTVR4WO8aNjgb5IrjQ0T2
         bWDdyxH4L5hrrgVwFgqJc6N5AA+gH3PrDNklIJ4/8TtXWBF7gDnf13ou+C5nAssTROLJ
         M+dUhC74IzjDCSuYxOAhOm22Ijj+WU0iI5I7xqrRrfMvgUdSJo0NAaNi8JySzXtqdt7x
         f84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359197; x=1790963997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wexv0ThwJ2Po0yZ00a92cUQBj5VSlQRd+AC/rWaDMjs=;
        b=RZcABYSWeNFNkaLR1WMr4BftDBfz25w5xWtogvYKuSq5Rz+fDcQwMgV/lF8S5wOAJr
         tPTy2xVTy7G24NBPNwoWuCAEdidjG71TJiKiWgrYZItFmyhiKUzZ94lpblYNFR6uLGei
         TnSByZqnOx22sapKIHYJ7GFEiQySC8Y5bgQElBY9gYsO3GoDTNKGAitfhbInEk7baO76
         iAK3rwUy7V8fIJr4O7aID7lyzan2YkU3LquVf+2nfcuqgzutVdZToqoeH2CunEXd/1W5
         C/SqSeTl9THnTXCSS2wCiScO3J2ktZRM8xQrUu5E2ginil3WFAy1tCwc5/+dryrqLn6K
         DuzA==
X-Forwarded-Encrypted: i=1; AKwUvByNLlHgY+qXp9JuD8pu5IUBiSE0GBLpqh1BFyfJZABE83ZpgnnsvTi6UYPw53PJacWX2YJE@lists.linux.dev
X-Gm-Message-State: AFuF++nhLD6MwxgVdGjzd4aUUCIAFy/p7PPfUel6mM0W19b+BuAZ+uMz
	v2hvQY21X/R4H1jtvJw+RolFlne1W3k4pexaVufoOOzg3h2wCzJBheHB
X-Gm-Gg: AYBFou04vNnGFZGQwBFTXKAb3NTFjtGAE4QRrFUIBFDJZHKxOa1Y4/AL6CQc3O8x8/q
	9GI6Kb2Dhb3ceITNlmTAPPb/mYT7P8jjYpNBZfyXgGEFX2EGwCcDrK78B2YincWh2hEm6H8lLja
	BNRolKxXn6gPHBbB5QmNBzEUNMi748f1vSQpLuAVsVNNXgvr8dPsr3t5411EeXWzLJGy6gKzDVt
	+RpH7ml+r0lF5xU8dBguO5FbLK/mq0NCiDn1wAcwaIWXtw+A/+drH4+tyWyophAaNIeb7aqnV9d
	XPh33GS+WgnGzamGnWn3gL8DGAICiVRTKt9SRMhrUvgTcx/eITLQzGKRBc0Mih6KlYfXEY9eh4u
	lwwjildvAX+KdfKsGZA2LyN0DG1BcTG6JXTzwDfKHQB1Nyc/Z0pVIUk8zVjCBQogbgBGdoSYttB
	Y740ntLQxvrsEeORp5x3EGQON193koX761af6XvHX9g+uSCaOHdNH4CkF4lIo77tEII9u3eVcRw
	6ISA1VLbkGXI/IfihBWglcRubQcHcFq3QQib4RpIaX3x8S89aQgjQuDhaSUbdt4v+XX8g==
X-Received: by 2002:a05:651c:198d:b0:39c:624d:82b9 with SMTP id 38308e7fff4ca-3a63c06c278mr14724591fa.4.1790359196582;
        Fri, 25 Sep 2026 10:59:56 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64c2f167asm7361481fa.20.2026.09.25.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:59:56 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 09/10] iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
Date: Fri, 25 Sep 2026 20:58:16 +0300
Message-ID: <20260925175816.75842-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922005347.069c490e@jic23-hlaptop>
References: <20260918122517.377565-1-zoone.rupert@gmail.com> <20260918122517.377565-10-zoone.rupert@gmail.com> <178992913316.706584.1446996024286841775.b4-review@b4> <20260921183106.231972-1-zoone.rupert@gmail.com> <20260922005347.069c490e@jic23-hlaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 22 Sep 2026 00:53:47 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Adding the guard is fine - we kicked that back a while ago simply
> due to lack of users. Is there a path to annotating the non
> ACQUIRE.. functions to expose the right information to clang?

Yes, with the change below. dps310 then builds clean using
iio_device_try_claim_buffer_mode() and iio_device_release_buffer_mode(),
and clang warns on a missing or unbalanced release.

context_lock_struct() is needed because clang rejects the existing
__acquires(indio_dev) on a type that is not a lock. The header
suppression list hides that today.

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2252,6 +2252,7 @@ EXPORT_SYMBOL_GPL(__devm_iio_device_register);
  * iio_device_try_claim_buffer_mode() pairs or related helpers instead.
  */
 void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+	__no_context_analysis
 {
 	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
@@ -2262,6 +2263,7 @@ EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
  * @indio_dev: the iio_dev associated with the device
  */
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+	__no_context_analysis
 {
 	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
 }
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -610,6 +610,8 @@ struct iio_buffer_setup_ops {
 				   const unsigned long *scan_mask);
 };
 
+context_lock_struct(iio_dev);
+
 /**
  * struct iio_dev - industrial I/O device
  * @modes:		[DRIVER] bitmask listing all the operating modes
@@ -726,6 +728,7 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 
@@ -760,6 +763,7 @@ static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
  * Returns: true on success, false on failure.
  */
 static inline bool iio_device_try_claim_buffer_mode(struct iio_dev *indio_dev)
+	__cond_acquires(true, indio_dev)
 {
 	__iio_dev_mode_lock(indio_dev);
 

> I did similar for sparse and at least the direct_mode claims
> a while back. This might be a case of it just gets too complex
> though and the compiler fails to figure out what is wrong.

It holds up. drivers/iio (allmodconfig) with the analysis on for every
file goes from 254 warnings to 11, and none of the 11 are the mode lock.

If that works for you, v9 starts with this as a core patch and dps310
uses the named claim instead of a new guard.

Rupesh
