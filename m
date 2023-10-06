Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86D641E38
	for <llvm@lists.linux.dev>; Fri,  6 Oct 2023 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CMO44yEK"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-692eed30152so2163268b3a.1
        for <llvm@lists.linux.dev>; Fri, 06 Oct 2023 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696623443; x=1697228243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kW97lFtdi7tQSx5WV0UdX/3taJs5J9htbLPAyylMrXE=;
        b=CMO44yEKskpXAquWA58G1XtWH4TA3OY6aTnFuyM1QTYgXbYHsoeuWCa2ty+6eTA9Mf
         OcglCfci4JLAl53PsF5h11nKErrGpqjiQiuTCt3GB7RTH7VNnQghKDCWew/IUzTb6KWy
         JwhhDP7IFtFlg/D2TgZWaXwL5KycOHRbicncI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696623443; x=1697228243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kW97lFtdi7tQSx5WV0UdX/3taJs5J9htbLPAyylMrXE=;
        b=vbbtpfOgY3ye2tbTbkLdJQIQ4WwInA0mWWHjafvxA06VHNDausvbkFsa8FbXEkQ0Np
         UZwOZeQhSXTD66nux+upYCw2KTr/rm3Vdw6m6zD7OUNRL52nglPH60wWs+n3SZOuM9OK
         oKxj6YSK1EMEpHc0mI0FGaktWw9MrFB1IEi0m8aF++W+nIHJ4jrNaCmkXAkaUQ9IOLSm
         uJx2K1YL5YFT7JMU41DGvGsHQ40Tt5pR3IsCO8BtZnJU9jVIW/wHTXIDUa350aNI1ev3
         RfrRn3Smgm2om9IhTolZmNb4MGBAqnxn95T6Gn/VlVe+C1mxKEYesHOHob7cVXV3eN5z
         bnXw==
X-Gm-Message-State: AOJu0YwcthMFLtnz4/1kAXw04ezKTkZT6Mkz8SkX1Ivg1NJYhtMDbi8r
	YPB5WXzinESaOZ37UIcl9oqHew==
X-Google-Smtp-Source: AGHT+IG6MS6aq0hR7NEmqMW13hny+F7i2UoqfOJWvAQ5rl6J3/G66uwQc2vUM5xOUeHLWKCJ3JR0OQ==
X-Received: by 2002:a05:6a21:3296:b0:140:d536:d428 with SMTP id yt22-20020a056a21329600b00140d536d428mr10800853pzb.51.1696623443148;
        Fri, 06 Oct 2023 13:17:23 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id q16-20020a62ae10000000b0069343e474bcsm1886916pff.104.2023.10.06.13.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:17:22 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Kalle Valo <kvalo@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] wifi: p54: Annotate struct p54_cal_database with __counted_by
Date: Fri,  6 Oct 2023 13:17:20 -0700
Message-Id: <20231006201719.work.356-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=keescook@chromium.org;
 h=from:subject:message-id; bh=NFwzX0Eq7KCDbbQM5umu2p/6j6lMwTY9c2gIIvIyXH8=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlIGtQu26M1sSthhYbE6kdTUaJiSm4LeUxUUykm
 4fh5mQO3aaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZSBrUAAKCRCJcvTf3G3A
 Jhn3D/9y8+XILyj+byVNV0fCgmz3v95DGYn0tJmv1MXslgAFu8Pww0V8y65fznB07xphjUv3cxA
 WEudhs5dA2oWKVPIwgQkBr3dHpfR7MfTVAMX10JUODoUvZVbazlu7hg0b1/7JFv1xtmuwolgPFU
 ZDLr+eXAHNGcBC7mQDHWoQhR/anMut6KlTh0STekS1k9UApNKth4ayj4Q27n6URT7tgcLyhTpXG
 IDqWi7pmZhV0HTzbN3qJ9OzS8Ea6Mrr3flfaApdtgc8l4Q8/KxLtO+gbQgWTd5bSAhG8ee3BrW7
 CbghSKSSzyymAfdDTmw0xrvj6qfi+fTNEnOC/ahuDL/gsc+OPa/JbiLIWhLqhF5tOPKrwtvEPWQ
 zaUV5mYkSplYev71JajAiT3XxdTIy4NvIAHvwhdz6qakMmuIPeWdxXVsF30xALAoGqwA4LUljcE
 rOKtVVsTzIf3yZNJhOzFzBwOZlf6gpiSCfX/WLCn9+84Xf44KcnkWmIOrAJp8v85wuBKsOa3FGh
 7TVCgeR/pe2oepKBwd24/KIQfu00XLzyQ7gliBRqobRTqowyK+UH4HCz6dW8TJ9+xF/1MBlohwB
 xWPTCxRzak2H8nyD8d/6psRG4kwCNICHXBCHdZ2sggZ3np+yS6sngN07u5+GoFUfkOBP2trZMya
 Y8XV3hQ JBRA4ZRg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct p54_cal_database.

Cc: Christian Lamparter <chunkeey@googlemail.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-wireless@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intersil/p54/p54.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intersil/p54/p54.h b/drivers/net/wireless/intersil/p54/p54.h
index 3356ea708d81..770e348d1f6c 100644
--- a/drivers/net/wireless/intersil/p54/p54.h
+++ b/drivers/net/wireless/intersil/p54/p54.h
@@ -126,7 +126,7 @@ struct p54_cal_database {
 	size_t entry_size;
 	size_t offset;
 	size_t len;
-	u8 data[];
+	u8 data[] __counted_by(entries);
 };
 
 #define EEPROM_READBACK_LEN 0x3fc
-- 
2.34.1

