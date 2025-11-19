Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F542366DC7
	for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576072; cv=none; b=LK08qFR6Yi7oh9XzX41o085n9BOzTejW9ZlL7Qnz2Te9PPjOh52EHBcaE7rq4yUYWY7b3ghsll/BQSC//ynQ7hEsYNKeOqC+5wIB8qEJ6000rmN+65QrYX9/aMle3WK1lSEGnSgP1g5sHUrOqxwxDKXbUaIyDZENTTGer6B7XR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576072; c=relaxed/simple;
	bh=fOaYndhzO7GXOWo11e/wLosmESF6vtdq2dn5BPwRTXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cs9UcXKzPxMQpdr3Ug7/9XCxtyXFKonomHQaJ0PsVyPcLKLCp4CWnRC2T/+gLXplCHmSJJrIyCo62syjpO7+AB5ZuG3tqCI9BPWlQAApxZzuTiHJma0wGxG1lyhGVfomAyNAokfoMkkUedyz2HEWXKuXESYOOGLUOIRRUB8UxvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=llzATAru; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="llzATAru"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-43380a6fe8cso476325ab.0
        for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 10:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576055; x=1764180855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RPirOi0w0Cb/s6FnCbMEuNgCnH0qPfOw0gyvUWbzUDU=;
        b=llzATAru2jk3ZZD0dZ+SB7Yb2q3nN46GsSghbr+uENJWplHZQURAWhcBky7yH1dWVl
         o93CmpeBoPJBEJDPnlh4EzUy6WZYxl7NfBpESV3X/+/0J5oHwmIvhbrczoVRxicBg6LH
         YbeV4llS1EsoKtvMXwrvpGmqdh2BF3XzSQ0Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576055; x=1764180855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RPirOi0w0Cb/s6FnCbMEuNgCnH0qPfOw0gyvUWbzUDU=;
        b=Fv6qEJAZPghUCwoE7crTJY+lQzHN2So4XoJNwmoXOB6DP2PinHjJIES4OxplFaUyMJ
         WtF1ND+qJMPaXFTZU/zeg/0t0D2ymt1b9djgYSS4bg+zT7DhaJ0J3/dF3MoTJUxm91j0
         297Nk4CcmEf5eaBkh3Js9gw3XeZCDnL7XQ+b3ZBrkc7fuoPAFRiDOFkP6cEjo6HAupJC
         VZF/2uCkxxSfbJNP/RlvlBU0C5nGGgwKCj+jPxMqP8LAz121jaTi2rQkyApNBM2f8ZgZ
         kuGM+pw2zpUygrhZPLNwE+uAamuc8yM7lo/UfYTRgC5SRS1GIi9XmtZzHXdfmgTljZvs
         tW3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZ7Wrn8jB0ikUtW0oXdt5JY25X2vswmfnPnWJEUtsyXvRfyc7c5trmv5ubrO0PPnUuN1I5@lists.linux.dev
X-Gm-Message-State: AOJu0YzvSr2o9VK/A3k4w7Z4Qevg3+OU2HXYoX7FJKTt9rhCIxuVKj2r
	dEqenet/wbks1s3nL0zx2ldnfrxg2UhKH/uljt0EaGOcnI4igR77yMzaCPKIEDOBMQ==
X-Gm-Gg: ASbGncu4/5tD3QXpYsh0QTwMB4EiIERZeLSZ61hYbhKyTy1TsdqI+fa+lmIm5plGTD4
	12ViZ1iIg4qCnR2OK9BV9k7pCossbwCg4f/pXmd2lom90eq6QQzKK+UB6kphlUqyOsg3IbTjapN
	oIbatKQ7wsRKj1Mr8jEG8sCn2gQDEjysGQ3j1gfhdBrjHYmR8t2A1i+NTyPYwi6zVdWhMPQc7jv
	D6DAHqpSeijb/toConKsKRzDL8TqJScoitnkgUh6FMKz/vxY/UQF+qMeTtS45RVxx+pxqgw9btv
	NyMYJ0lIWYZEjFlNuuAGJIh7AnuZ51yDLoL4TGkAxBvkRGkQBNUBY91FHVd6Be360CFZWIVUYM+
	3acSePkihcJq+taOpIeXCHeMdOtph8MtqE4CC7FXL0DQV8Z8yf7F3vV4MhmP6IM3CjThuE2kBkP
	XnajGv
X-Google-Smtp-Source: AGHT+IEqawcvOIPqsXpALDErL/1Go+TjtEXbiX8/+Jw/9VSxcMjIN9Ju3r68ajG6bVKTrOJBVHHikA==
X-Received: by 2002:a05:6e02:3398:b0:433:7f13:3a8c with SMTP id e9e14a558f8ab-435a902d081mr4341845ab.16.1763576054629;
        Wed, 19 Nov 2025 10:14:14 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v6 5/8] kbuild: Split out module targets into a variable
Date: Wed, 19 Nov 2025 11:13:26 -0700
Message-ID: <20251119181333.991099-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a modules-targets variable to list the targets which cause modules
to be built, since we want to add a conditional target.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v5)

Changes in v5:
- Add a new patch to split out module targets into a variable

 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 638bc09a546a..8cd46222fc48 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,12 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
+modules-targets := all
+modules-targets += modules
+modules-targets += nsdeps
+modules-targets += compile_commands.json
+modules-targets += clang-%
+ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
   KBUILD_MODULES := y
 endif
 
-- 
2.43.0

