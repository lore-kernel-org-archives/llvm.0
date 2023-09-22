Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D380E4448E
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:54:27 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-274d3ff35e5so1734893a91.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405267; x=1696010067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j+EF4vJBkJk+ZVR9CblihV9KVKwpbDqXkhI36zKUO6c=;
        b=CHZcr9mVAstMkSPdv8kKfaYs5zNmQ8QlwDty7gkNhCVRfnDx9YRQ3x+mvbY5jfDbO+
         bmkPuq2H568GMTx6s0SkvBbNHaUHOEwq+KSwxFCwUe6SVv2VClLsHHy/IJXW/lqSIj14
         D+nNv7DAK1+SV4Qtm+EhQy04TsW9JACIlX62A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405267; x=1696010067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+EF4vJBkJk+ZVR9CblihV9KVKwpbDqXkhI36zKUO6c=;
        b=bLTDQDKwA0VZXcagGi7WAVMYKlf+vK7NszGdyu3XN99ZoTyIbecUxn5doDmoLGpTvd
         W087m4FOG9CtO/KIPLQRgjCxoljxdWygq0WH25aLurrGkRZ6z+Dxso2L2IYG69F9wI4k
         5EMYuXxxRpiXmMwQgAS8UzHVbsC2aIgrRh0LtTEwGBCdqhvUn1/2CCWxu9KisE8UpAod
         mrPnHBtAMX8CN9BMU+6E8uffmcNTGD9+TZc2qWQ7pYkkbMMoOT7MaDNZsEN3PdS/qi5t
         VHEVwJwIm0P5H7W2dF2Vba6hC657XemMObRQcfKloEL1bWqoNKaFihXtKZpeKcQHNTrZ
         0NTw==
X-Gm-Message-State: AOJu0Yw+89ANYObb1YXeGanoxaA+7uR82b6xFl2j+dRt2t3qswumsYPw
	YlJqr26dkGA6TTYhUPuTKlaCYA==
X-Google-Smtp-Source: AGHT+IEHTrz6vwmxrsTFOxVvmSb41QWPkh3jvMMRyJ03luJqtTFxKRrwM8037x7mO0uOF1KONBCuJg==
X-Received: by 2002:a17:90a:c7d2:b0:26b:4e40:7be8 with SMTP id gf18-20020a17090ac7d200b0026b4e407be8mr425881pjb.12.1695405267155;
        Fri, 22 Sep 2023 10:54:27 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 4-20020a17090a098400b00274a9f8e82asm5621422pjo.51.2023.09.22.10.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:54:26 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-i2c@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] media: i2c: Annotate struct i2c_atr with __counted_by
Date: Fri, 22 Sep 2023 10:54:25 -0700
Message-Id: <20230922175424.work.863-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1312; i=keescook@chromium.org;
 h=from:subject:message-id; bh=xHqAexkdir++JtYVtYwcT7l23jrkf39UFVqFNHYvTUM=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdTROjZmn9PrBfPmIbpkMcg5sdNYLw8r0dJEE
 dRDF6P38uuJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3U0QAKCRCJcvTf3G3A
 JmMlEACyXQMycy4pimGfzQlMXVi/e5YP4/RoKKXxI3rA+mIRz/OEaWUNy187GNrPLMuVRUEl6+m
 7HBRBE5xxKe03wBcUu0kmWdpDuLIN0efMNzsWH2PQY8YPDw1V7Gaeh5FHD+MTY9xp+88FCZq0dw
 O5fNNwnBpaiJ8q+hwyak4O84zmGhnxy/Mo7yPZMWaq4nFn8IbqprfKnjorcedYUuWWHfJQ1wkzN
 HoR3w0l8YapoHDkp1vCqhdfExasn72Qu0UgN/n4xVTJckAJ0+UYYw9s3DpLvqRzSi0PTgN67ypb
 MtWf6E0kk2TN113KyScBCSU9h6D6uo0uRSZvt8PrTi2J50/IftiSoNkwY2w3DuBxqu28vd+lJJz
 sWfGFrp0lfdEIb5YqkIWT1BUxW6nD1VcLLfUWD1zneBljOu5GXct0D3g342AYe0F3g8u2LpXzH0
 uVG/7sBg/wHslmjgTJWx+VpOXkqbGue5ZH4PhIzc7kislQ3tkMj22IuxBpvqiWqVFZL+cvF3SdL
 ur0bGhn7qFjouZrQNO0SP3eQP9E3dxRNyf3zyiuBzMvrejRFAt6V7oeIgKwjGns6fOBtQUonNQg
 sZQ0aauL4gW0OOpE4M5dDcWJo8GNLi1tkdvWc5+p8IzCTba898Lo16aluMogKJDOy6MZDBvb2pN
 7SVgLij pk1wMheg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct i2c_atr.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Wolfram Sang <wsa@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Tom Rix <trix@redhat.com>
Cc: linux-i2c@vger.kernel.org
Cc: llvm@lists.linux.dev
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i2c/i2c-atr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index 8ca1daadec93..f21475ae5921 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -94,7 +94,7 @@ struct i2c_atr {
 
 	struct notifier_block i2c_nb;
 
-	struct i2c_adapter *adapter[];
+	struct i2c_adapter *adapter[] __counted_by(max_adapters);
 };
 
 static struct i2c_atr_alias_pair *
-- 
2.34.1

