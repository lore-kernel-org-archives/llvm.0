Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF1D41AA4
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:01 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-276d611df9aso1759969a91.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405241; x=1696010041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=blbaNQfE8VF8IyCe56PdApvTuknWltr7FlvuMXZ9aXQ=;
        b=IOQFhHsc4I5PepcTly222p3Zw7dywDlZoJvftb5dhVx4XJiZzpKvhGgtTvpWIbDnCs
         IjARRWFPiA4E4BKXGTK66B06NhP3+oGTzW2aFhn3E6o1VZNJl5etDyDtqHc4TEg8UFvS
         nPz0U9QP54py8yut6kiRCIWOSWqsCovMnb49g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405241; x=1696010041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blbaNQfE8VF8IyCe56PdApvTuknWltr7FlvuMXZ9aXQ=;
        b=e3GPevsDiEk/Ekvl6NPcpFAqTXYW1R+R7+nEGILmNPqsJjiSdX8I1kfAA7tA5eD/fa
         b7kpdlIm9u7+4uBHvnR0lrzI3hPNeFH5p2oLXuB0Xg4WwgpVefNl5V13hEUThiZ337gL
         5bGyyuXPNeKZCbhP7cg1Bx1S6PWrBqcksdjBlVhfnsPYtYBUaFKZvHrENitroohVUafR
         6p2QPLU0iXaKSlw8mIfMLplN/xxgUbPW1qEgRymHN9ieOe+EDIVsILroZxKaibzcweNU
         peLcDek2AcUitEv0XvXxEHh8mXGwFTME5ufFfVwQNCjWFzmTbBg/wxry2Ap2XXCtkdV4
         OW2A==
X-Gm-Message-State: AOJu0YxxMTSu4qnW7M9Km7MSKpISFrUa2W2/rUxJs0dDWsjHmk6eKYPv
	yxFVe//NJaAHf6uPgpOZu4PG1g==
X-Google-Smtp-Source: AGHT+IFaO9KtLZCcUOV7EhIX5OjLxGdOM0WYzA+wc3k3wsNUoy0acGXxR7rJOrzS65Y/KaC9Mc1qiA==
X-Received: by 2002:a17:90b:3ec5:b0:268:3d4:24bb with SMTP id rm5-20020a17090b3ec500b0026803d424bbmr416808pjb.1.1695405240748;
        Fri, 22 Sep 2023 10:54:00 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090a818300b00267ae12b80bsm5156478pjn.34.2023.09.22.10.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:00 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-pm@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] power: supply: axp20x_usb_power: Annotate struct axp20x_usb_power with __counted_by
Date: Fri, 22 Sep 2023 10:53:58 -0700
Message-Id: <20230922175358.work.774-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263; i=keescook@chromium.org;
 h=from:subject:message-id; bh=hUdVdLxiWpJoNa3S8zTxaKIJTMK1jo8G/vYOGoC9vzo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdS2EABKtMu8RCKmdL8MpgPHDFTGxabuzsdMq
 njl6//sbfeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UtgAKCRCJcvTf3G3A
 JuDTD/4rO45l/UjCZvd4HNI2vUdfkJfoazSV8gz7Hvu9weac7Gr1IAEVf5JUdAVmNBR/y+2nf5r
 DQxckTpjO+exDErFnK5YMPRQawm9wSNemZz1mf16g34Ri/WjJgE5vBbaIzHBauH7wii9TSPuJWd
 9mYKwClTjH7RDKgtSSfuXGG3PwBzL1T9lu1Raw1Pj722MlBK+Bn8cOJ5CjJcfOvpXe6hHCBV8xj
 vb/IOw2R2vD2YQfeW/eYfYdhk3bddOMr5qKDk/+O4I8MybaWKRVyfeZk/xwPqH5rRe4hIzU0+uq
 fjo/G69vAk2nlGFJTUBUDjO62+YwN6L2OZwkAvdmhjH8BM2++UU0z627piI+msOiaUUrNVfT3/W
 c6Q4a/Wn0u0CC/M0j/gL0ZGrgr1jHtOKA+0Q67bOq3BeXKyQE6NgvdAA/vX4YCskkj/iRTLgZW5
 Mr/yTJ5ts2lYw9XS9mzf4mjlvAIEmYTVwiYfHHSxi/sy+OF3G39hrfEMwSQIPJseKFEhWR3V0+y
 yb4B1LpNYBzr4LFk5oD63XOTo8CmK+bM7zpspN+Zd3QOB5Zt3adIr6ZaHVcIqqlZA6ZlxevxglE
 8/KqnJI/NicJkcQxzCtvyFvN/cWyzhYND0DnlSgT2c/GsQ4+UJSVM8F8nNFVvxR57tIejz5fxrJ
 wYT6csd pqwThkzQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct axp20x_usb_power.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Sebastian Reichel <sre@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: linux-pm@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/power/supply/axp20x_usb_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/axp20x_usb_power.c b/drivers/power/supply/axp20x_usb_power.c
index bde17406c130..e23308ad4cc7 100644
--- a/drivers/power/supply/axp20x_usb_power.c
+++ b/drivers/power/supply/axp20x_usb_power.c
@@ -73,7 +73,7 @@ struct axp20x_usb_power {
 	unsigned int old_status;
 	unsigned int online;
 	unsigned int num_irqs;
-	unsigned int irqs[];
+	unsigned int irqs[] __counted_by(num_irqs);
 };
 
 static bool axp20x_usb_vbus_needs_polling(struct axp20x_usb_power *power)
-- 
2.34.1

