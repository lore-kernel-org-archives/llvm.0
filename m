Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB171A73C
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:06:04 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1c44a25bd0bso2660245ad.0
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808364; x=1695413164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N9rr5rnW7M+QUqwMbLAuv1BBxkDU6tl2Rwzxc3wI9BE=;
        b=d4g2ZGejPRNmAKo0oWRMMdbQjEkOr+2041SmXz1LjZfnxVLcuB1LMdD3RQxOyCBsz3
         q4FY7Z3zwxTM+DcKEVwyP3mG1UUTC4FM3F3nMCc16+mzgIXLxrUdgyWxYw3jCQoiX8mJ
         xfwKJ8XDTAvR6XyBDEbgpTKO+Y316oKDtZVAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808364; x=1695413164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N9rr5rnW7M+QUqwMbLAuv1BBxkDU6tl2Rwzxc3wI9BE=;
        b=tNNpJ32q8QRg/L+LFuHKG6pepqZFLsWABccG0uR/76xEF1NOY5Tp5jy33oLljrq93+
         62edKLXvykz4pqc9LpbcUZVRRbR9QCcT8st5mfxr9pglKG2T47P1wWKTTpLcXX5Chh87
         QAiQrVMfcyRTKsWwtBp6mveQD9aLlAYQD6BMYWbao8rjQTsGyZxVt+k8nEN+Wv3WhNJR
         TwX3dJfLvdZ8NUp+JP2Kg5XYvqgN8YsoHGXiM84MCycoTqsmu00UB2o1MSQ0/qpbqe+2
         MXXQRWOKrgHXRmxoHge9lDuKpZE9e9vMe6YHmUiOZjVtZ2TLUd5igLzbA/CE6MTJssJT
         IgWQ==
X-Gm-Message-State: AOJu0YzXzg6GfHwrlUEpcQ6ZMuQih5fHyai2RyM8swdfhf7etWUlQgEj
	V00sQhjERfhQTuMc8/9rhuVyoA==
X-Google-Smtp-Source: AGHT+IEiUYZWao46jwTFzhsUbeYezJCmc2TSqm8iXwKyxyDvyoYxgzAwYzd01BNN18e7bnVHGxj2Cw==
X-Received: by 2002:a17:902:ecd2:b0:1c3:432f:9f69 with SMTP id a18-20020a170902ecd200b001c3432f9f69mr4055618plh.23.1694808364318;
        Fri, 15 Sep 2023 13:06:04 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jj5-20020a170903048500b001bc6e6069a6sm3859003plb.122.2023.09.15.13.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:06:03 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] wifi: ipw2x00: Annotate struct libipw_txb with __counted_by
Date: Fri, 15 Sep 2023 13:06:02 -0700
Message-Id: <20230915200602.never.582-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1242; i=keescook@chromium.org;
 h=from:subject:message-id; bh=BlOg0b9ZP7IAoB9aNoGJyqHBOVbbSASk03slNCtWlu4=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLkq4Ro4W904lHrxUL3/kwPhhkgKuLe2GbG7t
 DEv5Jwszm2JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS5KgAKCRCJcvTf3G3A
 Ji1mEACadOX9sHVXOG4zLVbOByyO4CQvA/S6emh8SHQqv8P236h61PQpwNjAp+YCykCxo/oMWpQ
 wvFnDeoW5ZOd4fzlmTq1c2OKEEaVY4TAfe/Web/oGcd8qrqwDcRXDAEPjijHK29TxrdZ2OTHOW3
 WhRNpd39v3kEvO52sP+1xpoX2rEiAqwWVp+qKtCfHijSyArHeBX+RFE91rgzj5Vnz19kh3kuA9E
 uQ36jNbZRHOiQjUnKLFpQCGQdPrVJffRuiGFEu5NbpSbuKTE2iZ+y+p0OLuiacoAzFAlMFwdhBz
 7xSZUuL3CWj2F0geKj8pKBk9EGFcox+0o0gC8Us+eUuxmBgmeArutvx+vK8jCENgzoTYWo7KOyK
 /lUMR3ECzsCLBSIQRXhWD5VKElcSJT/SF+mx5RwvYPttp606ReOiXZCiwLOMX3UAhAVMmouDuJs
 0UXIM2r6mISWZJ3aROg4AT4wzX3ZataTiXEEeaQLIKuuPtXZYR7zIxHhPEeENoP8o2Mj4LgcRj8
 c0fVMadTmpfl7NXjHNz9gQyAfofRQLDlzykJ8NnonnulKgCgSpk9CHPCiIus1kkTeaiPLbWj6dT
 8RKftCdw5KgK1+J+k0FY9b+P/CMzimX/SBcBnoQYUCf2cbFI9KDwcJb6SuAmm913O/QqB3NJQrP
 jfKAnik fC112vtQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct libipw_txb.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/intel/ipw2x00/libipw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/ipw2x00/libipw.h b/drivers/net/wireless/intel/ipw2x00/libipw.h
index bec7bc273748..9065ca5b0208 100644
--- a/drivers/net/wireless/intel/ipw2x00/libipw.h
+++ b/drivers/net/wireless/intel/ipw2x00/libipw.h
@@ -488,7 +488,7 @@ struct libipw_txb {
 	u8 reserved;
 	u16 frag_size;
 	u16 payload_size;
-	struct sk_buff *fragments[];
+	struct sk_buff *fragments[] __counted_by(nr_frags);
 };
 
 /* SWEEP TABLE ENTRIES NUMBER */
-- 
2.34.1

