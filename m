Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7785D4447D
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:53:40 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-690b8859c46so2247806b3a.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405220; x=1696010020; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=35gtyXNkaxV1CbWW0mQ4JhX2sryrgmwmW4Qyfs+/hZM=;
        b=W0PSMak1mux/qKONzjUB+wXYNGICVjXmLhQvzKimD6DGupoNNKfjCrV8BOw55UNVMl
         OmwwFf3qfwusVrw8hxT3LxzGpzVldbgMsoxBzfRzHkddt1d5hRkrI4/GVg3jgdmVyHSi
         jA2AtzsscJkmyVzHlntddAB64kCpzMtskT4gY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405220; x=1696010020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35gtyXNkaxV1CbWW0mQ4JhX2sryrgmwmW4Qyfs+/hZM=;
        b=KDkQcaQjh3jhMyiVcf+hNCNCb5HxScNvHbib2yG1ItmotkF2Q5wTGUxnGqSSMJCsfJ
         eEWaaRg+eMIA+yu86WZr+lW79mR88C6hwkyWtTUrHJITM3PYQwz+aMPQomR2bxQpwN8d
         RGjXbzzwbsPsqJ2TyBMlZUsB0tw8a61GSmSDVrZ9VdWQbFx180P7TOohWjQaBy1vwoVR
         /lsZ3Npz+GeLDE2s1gJqbkU3R9/nidL9+qhXnbuiajRFtqZqizkO3x7qBHLCNXWcrYlo
         9i8bC7zAh9TbMEk93VPF+M/57xP4oQR+rLFAYpdc8chsg5/ScPsvbxfRVtFyY/DlvUuv
         3IkA==
X-Gm-Message-State: AOJu0YxeNZj+T736LqJusFAFRj21dF34ehq8xAWMWBnebEDaH/XuAgM6
	fpAKEj/I9MQI2d1L/QZxRUMXdg==
X-Google-Smtp-Source: AGHT+IE4t0+eU5/4e6IKIf0243xPBzsg5WQKxy89ruYQeAv2++FejJkkI+uW5TH7Mk0QCKLUsty1kA==
X-Received: by 2002:a05:6a00:987:b0:690:41a1:9b64 with SMTP id u7-20020a056a00098700b0069041a19b64mr90043pfg.1.1695405219712;
        Fri, 22 Sep 2023 10:53:39 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id k130-20020a636f88000000b00563c1aa277asm3380555pgc.6.2023.09.22.10.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:53:39 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mfd: iqs62x: Annotate struct iqs62x_fw_blk with __counted_by
Date: Fri, 22 Sep 2023 10:53:38 -0700
Message-Id: <20230922175337.work.150-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=969; i=keescook@chromium.org;
 h=from:subject:message-id; bh=40smk5nu73u0vfTxfrOWAC2AnRabVPFAKtr9H6m06to=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdSierso3cLUCkrGkR7SzFR8Eef9SkFGVBB++
 YGtQ3yHy4yJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UogAKCRCJcvTf3G3A
 JjquEACNQ40A/dsuVWJtubBKqSUsV0RJy532o2a7KjsWRrhyAnUAyi95GcYxhpG1L2yeF3MdMBy
 thxxRTReJNGXfQwmqfsJQ1QMrDTWiVR7zXFq5mo7Uo/enLd1chriGNT+rMx1UvBuwOLj05zOchw
 MSpEKITLwGLx+YA0K02TZ9/3rt1ErYIX0xbTAPHcD+EP+T9uzKev2zNvbMj+kEmK0/Lkh1PVktA
 zHTyOqFn3coTptKLxDpkMJyWSlBeXb/lrvFYjaa3H45C3osBppBcKPGod9MMJAM/x73a6J5RzZc
 JfO5z5UsvwydKhrtUS+uoO+uEnIm7d7kYexmfe4FXQvJTMudNyH2MI8q2mXBo378A5PDkKLYeYF
 Ri2c4Ja+5VeIqpcCaxVGKngmTnT0Omlv6wHBT3zl1sCiRvqdEHf5lxIh+US/TTK+9F1l9ZdKnYv
 wQcUkUsep2ZxvWKHD/M1kQaxEzuEsA0oyGgO7iXmIW8HySZDT+Ii74EgmLDg+UxG+2xH2uZ09rp
 07Qqy8qtTiZdDo7eAptBkGmie70Sn4C2VdJl3XVF31DeU3ZKLNEQwbF1J73d4L61K3oeEtz0x7R
 IYmgjByteN3WXc4sxL30VJTXfnaZOz56zFsyPX5CmOPfIGOPu1q1pZrn9wEco3Clbbj8y4I0omy
 GNCQZNPa TRkH0iQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct iqs62x_fw_blk.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Lee Jones <lee@kernel.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mfd/iqs62x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/iqs62x.c b/drivers/mfd/iqs62x.c
index e03b4d38fbb0..1b465590567c 100644
--- a/drivers/mfd/iqs62x.c
+++ b/drivers/mfd/iqs62x.c
@@ -96,7 +96,7 @@ struct iqs62x_fw_blk {
 	u8 addr;
 	u8 mask;
 	u8 len;
-	u8 data[];
+	u8 data[] __counted_by(len);
 };
 
 struct iqs62x_info {
-- 
2.34.1

