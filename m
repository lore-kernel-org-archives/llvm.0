Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A358D41AA4
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:05 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-68c576d35feso2265894b3a.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405245; x=1696010045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34/nNW3TrNCCiLSv5/UFr3FBjilgfcwTPeGBR7Y+KOg=;
        b=aoI2AlAwjl2/TpjOajJg7WA6dct2m2Upohvx49NGsf6rIhLPYGJdCCoGPj5HiTWNOz
         52JEFGP7xYYVPWwXV5VFkAkE0u5b+nu+Xv8v5kp0DvJA9QXjPUa8gHMEfnauqU2Bip1z
         WeajG7QHs2nrqcytN98WccgB39eZIJIpTDL0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405245; x=1696010045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34/nNW3TrNCCiLSv5/UFr3FBjilgfcwTPeGBR7Y+KOg=;
        b=o8dfEkSIpO9uPVRr4XHmvH4dX374L401dl2sI7IWbKPkywKt1kIJ+0chSjJuzABgMK
         sqPLy6FEkatO3WOWTA2tLSIPkyrjtg0nVKXv1VKMSyYkM/1EPbChgpuAw51TyW+gOryw
         ObqkZzxz62xTIgVyeWrYPwFFKWsqRhmk/Dov30IG39VVfCgs5WIPcLNvjz75O4uBeL/c
         Ia8PrPDZz8iEpGB5syQAAD+X7ldCQFW/BppdhqqOct83pRaC9vmTYdzM4WeCvQ4qVIF8
         hQgy8tH5LBrS/7wKageZKQj17HOFzHF5Y0YGew/NUkth8/GZeBXQmMyJV7mckxEV/U8d
         3EzA==
X-Gm-Message-State: AOJu0YxCT9bHGH7FeQAPqLNSgC+8j34fF36r0JXNZ6mbUohy893rmbHq
	yp+Zg2zi8gS3jDo3U8yFpWnEmw==
X-Google-Smtp-Source: AGHT+IFu8Si52robeLLrv7QnuV/ngmZ3vweNN3Fajk9liMS4mVgXsR5xejFs2KwwI5VKN4JuZFZUMQ==
X-Received: by 2002:a05:6a00:c8d:b0:68a:5cf8:dac5 with SMTP id a13-20020a056a000c8d00b0068a5cf8dac5mr127580pfv.22.1695405245065;
        Fri, 22 Sep 2023 10:54:05 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f14-20020aa782ce000000b00688435a9915sm3439900pfn.189.2023.09.22.10.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:04 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Mark Brown <broonie@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] regulator: mc13xxx: Annotate struct mc13xxx_regulator_priv with __counted_by
Date: Fri, 22 Sep 2023 10:54:02 -0700
Message-Id: <20230922175402.work.819-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=keescook@chromium.org;
 h=from:subject:message-id; bh=KsJXBGQGMKJej0OmC0WobZxtXra/Rqrs6lS3YBrQxLg=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdS65hlSt0m/5qN8cc1VbhNamI8AY6+v5Gz1j
 6eiEzywV7uJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UugAKCRCJcvTf3G3A
 JqyGD/9pxwUKyDCjaZwj9tRB6UH/KF8LOnItZsH2iWppBUJlMgX6c/2nT3syoqOJIqdnjmGOy8x
 f31ZyXzoPfdM0cIB2EPlAcWJsgK0IsUQ7fu2DHguSCWI02jL3IsUBBAAIwcklO1cM3F5qK54bwg
 jpELuZ53P91AHde5cplZD7CVHE61R6v+l1uug5MZTGzVUTnMbOL981zCABasMfkf5ujXIGq4Evs
 YUpeEMGOQWpL+dQkOzzr7DsOQIesMw2QM4enlSAA+7uwiROnq4xsiN/Bf3qRrLJBOYS0bwtA6H1
 S4usjGaAdXG127q9X34O7FFaE8n6rWviCZRREj2/+gbvk5ctM59ivqzGOP68wkG3WmoW8SFhOIq
 AWi6JH4i9QKhPjABYlalaRJ/sKV8uTQ32zP+S9+IZUvFUUse5N1SUV5bwkxDdCjoBSb8wqSN64z
 THOtdT7oDqtbkI7yG6ypfVR/YAl6MqwJhXn9yKSHbsZ07Zwh4V4MNVnrk3n7fzqfgMWH6a6KS1j
 gG4AWZjqfTWRugQGAA8077LwNOtyj8fyitwS2rdInDXYuFypO7/t/ioBfVxFSI2voeaFBirgUnA
 juPDUPRsEmPAzhrHaoGA3SEML+Gc9BX5ec5sEJ/s1OHDpx6JzekOOg3DbrC68Tv08s/56UgL11O
 w0QX184 vDcslfWg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mc13xxx_regulator_priv.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/regulator/mc13xxx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/mc13xxx.h b/drivers/regulator/mc13xxx.h
index e03279dc43f4..057aaef6f086 100644
--- a/drivers/regulator/mc13xxx.h
+++ b/drivers/regulator/mc13xxx.h
@@ -24,7 +24,7 @@ struct mc13xxx_regulator_priv {
 	u32 powermisc_pwgt_state;
 	struct mc13xxx_regulator *mc13xxx_regulators;
 	int num_regulators;
-	struct regulator_dev *regulators[];
+	struct regulator_dev *regulators[] __counted_by(num_regulators);
 };
 
 extern int mc13xxx_fixed_regulator_set_voltage(struct regulator_dev *rdev,
-- 
2.34.1

