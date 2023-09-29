Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D049C6668E
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 18:11:53 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c60cec8041so77481265ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 11:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696011113; x=1696615913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrmkuelEd3rJ28up92cyB2Np2I/dyvESECk2QEaqxqI=;
        b=gtOKe9nPqbvfHxCjQmsYcm/BEEvoUo8vqf5XRFs7/hfdsvAnpVNg2kgWd2Bu3v+kzB
         OMTxFu9wBcxotbUVBDQ3xdUgI7P/RQ+y1451QIWWszu3Do8Fr3jB2rwogHo+gxhKCkns
         3KXtpCHiUrZmr9pG5wT4Ao/NnoDn3FWEV3Dkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696011113; x=1696615913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vrmkuelEd3rJ28up92cyB2Np2I/dyvESECk2QEaqxqI=;
        b=t0rl7D3So9I+B2n5s2/TG1EFSz2KSxvWlnZ3vLJVX1cMzPXTNyoVvPM4e7MVV36neh
         bhT1uDaFaxdao0sZJ9NUMwXCKLg5BR1MQoyJb5iTJJgL+rS4I2Z7zC7eAOMgCKqyEfld
         gxREEy1T3MqPweMHXRHxkHaBR6WEgDNGzoHGow9+0EVFY3fo2kQVMpkaQlNqBwn4ZiL0
         nLVgcda2tdOLmv6iW4JXowWl6Ev0v27hM/r2kiFTO9NUIMn7yUapgi5+HISrmt0+3997
         fUDCbF2Gb0L40H8OsU80yzUY2SlIRP45t0WiDZ/G19mHVWDqa+h+FoRwmBtfAq9f188D
         looA==
X-Gm-Message-State: AOJu0YwMtXzkVMeqeSjXk1WWgCGORZgCle5xkiIfkcc8I5P1B512lipQ
	FZLP1JdDmtOoTTPCixHqTRRj/w==
X-Google-Smtp-Source: AGHT+IF0+llAWLKGd5tXXfz3AaZJWSIgRckzd/8+Cbfq0HsBzZOPCAEvp67CPVp2BmJIO5snh7SQug==
X-Received: by 2002:a17:903:248:b0:1b8:8b72:fa28 with SMTP id j8-20020a170903024800b001b88b72fa28mr5257379plh.58.1696011113144;
        Fri, 29 Sep 2023 11:11:53 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id u16-20020a170902e81000b001b898595be7sm17123630plg.291.2023.09.29.11.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:11:50 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Raju Rangoju <rajur@chelsio.com>
Cc: Kees Cook <keescook@chromium.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 3/5] cxgb4: Annotate struct cxgb4_tc_u32_table with __counted_by
Date: Fri, 29 Sep 2023 11:11:47 -0700
Message-Id: <20230929181149.3006432-3-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929181042.work.990-kees@kernel.org>
References: <20230929181042.work.990-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1483; i=keescook@chromium.org;
 h=from:subject; bh=WNbLnqzZE+z+esp5efLnkGvq7OtgHHNunnfXU8ZF7oU=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlFxNk0t1kkwpfJqHrZx/YdrjBahRhU6dQg7Okx
 u6FscRO6QeJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRcTZAAKCRCJcvTf3G3A
 JidkD/9HX3Au2/63QgH0EK6PoLXEVxhxTyzFmm55RQkNUQ12mIdkyPQhXOdXdPaHOzINQkl3IxD
 XtInCBrvYRQV2fX6pGVD1FzuCQ8SVPLSnzKPJ9MzkyBA8G85jQJa27qbc8nOjADf84SnqUCU3E7
 abcFVVjUIDSZ0Ra/x92q32EPlOOmtGen8/5bd8oxADgtB1544tA/KdDiSkdx3YCXjN8VB3z7xqX
 Wd/RfUFBxFKzvD04iU34CID25Fp2EVQpI9y40lIzMtT3PizWOSLDYoFQ3NMr9dd9j71i3jHRkhU
 GaapzNg4UDQBfvv+ux2J5b6i+IAKJu0b+8a7tIfhhaKBNp2ISI4vIk9HqloOnQd+BWuluLKBpWj
 hrNtFoV3awi1v4YzPnCKrK0MvAhSaBekPoVttFqzxYutyFR66bgQx8yWh+h1V8+PfuZXkEhqpbO
 716CDFdVDm5pX8SWdmfs34fHxXg7aaD0cbUiOzEgXBZdyIZfRo+jtvT7z3lSEKFowA6ob5zSrCQ
 WRJT6MRTbvYTC5OtncSF65Ban2SQYBF3y7H8RvBQP4DCLG/hISKlxmIE/gCdL5musZW/gOJEyXx
 pxcm/D9H08sb0IH4WQreDSfrwlrjgngkjeCI+ouNbR/ybBapAwLHlhNU8QpNMPwM/LW4Tu3f2aX RMyKWiztAyV60qQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct cxgb4_tc_u32_table.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Raju Rangoju <rajur@chelsio.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_u32_parse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_u32_parse.h b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_u32_parse.h
index f59dd4b2ae6f..9050568a034c 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_u32_parse.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_u32_parse.h
@@ -331,6 +331,6 @@ struct cxgb4_link {
 
 struct cxgb4_tc_u32_table {
 	unsigned int size;          /* number of entries in table */
-	struct cxgb4_link table[]; /* Jump table */
+	struct cxgb4_link table[] __counted_by(size); /* Jump table */
 };
 #endif /* __CXGB4_TC_U32_PARSE_H */
-- 
2.34.1

