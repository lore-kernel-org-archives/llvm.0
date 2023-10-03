Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E6F3F4D2
	for <llvm@lists.linux.dev>; Tue,  3 Oct 2023 23:18:54 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-691c05bc5aaso1160567b3a.2
        for <llvm@lists.linux.dev>; Tue, 03 Oct 2023 16:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696375133; x=1696979933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWNIdeN2XwgWHo5X2YYBIvg85yUsaTggFd2yH1rpeNo=;
        b=KcBhO6zskUaicwQnI2ZTtYZpux5lz2fTAlRLHKH3PZLK/4geXd/QdXcnbbY+LM79/Y
         eV7Tj6l+AowZ9XzJGTi4FiJ7WhL40stHtJv9KGMY6e28WIpeSJXh2WMC6XXA78RtKQl6
         2g8H95WCBrTtabqC+M1i0cbQ6nE9g84wipe9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696375133; x=1696979933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWNIdeN2XwgWHo5X2YYBIvg85yUsaTggFd2yH1rpeNo=;
        b=wPcqCKvGfisbeqOh4WoZ0Guc5yedmZzYDcm8+L2ddbPHjKy50TNyYDFK3LguWglgoz
         2c/LY2IyK+MHeH4I6lzNd2Xa1BNLX7EPoQUv7NwWkwIzQ8p52NF8g8ODxArKf5E8mkj5
         ToCRSapHLy7c3N45ys/KTxsxbb3IKU3M2LY9uXDHsRSa2zK58/WUtfTOj/mVNAcXs2s2
         2YhgE4kkds/avdrJVXjdGXqaOojHiJc7gVW3vj9Qowsa6YefSvUqJkggo6FuIE0bMuVK
         17xwA9DxEWyhrq//8fx2KuXSRJuEuNWaKZFjWIEzOfN9Cga35qXuMiuEnCFxn+cnkTJA
         2e6w==
X-Gm-Message-State: AOJu0YxFN/JNCYCnJwGGiFMtJYvlDFNJxQmkXM+CZpAdzi6NinwIryn3
	LFFfMrIbU0EXcVRe+Jlfv2Fb8A==
X-Google-Smtp-Source: AGHT+IE2ezD7VkJBj90UTSYYCyLaSdWwrTpUvpxo1uGqb0HyKbaxHn5PneqQ/44FkdSbOE1AfbArPQ==
X-Received: by 2002:a05:6a00:1511:b0:690:cb8f:3320 with SMTP id q17-20020a056a00151100b00690cb8f3320mr1061401pfu.24.1696375133553;
        Tue, 03 Oct 2023 16:18:53 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f30-20020a63755e000000b005777a50c14csm1948843pgn.0.2023.10.03.16.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 16:18:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Simon Horman <horms@kernel.org>
Cc: Kees Cook <keescook@chromium.org>,
	Simon Horman <simon.horman@corigine.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Yinjun Zhang <yinjun.zhang@corigine.com>,
	Leon Romanovsky <leon@kernel.org>,
	Yu Xiao <yu.xiao@corigine.com>,
	Sixiang Chen <sixiang.chen@corigine.com>,
	oss-drivers@corigine.com,
	netdev@vger.kernel.org,
	Louis Peens <louis.peens@corigine.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] nfp: nsp: Annotate struct nfp_eth_table with __counted_by
Date: Tue,  3 Oct 2023 16:18:51 -0700
Message-Id: <20231003231850.work.335-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1591; i=keescook@chromium.org;
 h=from:subject:message-id; bh=kyIpUckdxhoPI7wg/1i7aDtbMCbDJmvf94yOHZ/LMos=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlHKFaqeDk2zRE3th7z8cYZ1dn2zrPeWsHfJfCM
 Cuy93rmm6WJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZRyhWgAKCRCJcvTf3G3A
 JtivD/921uPevWfkg8Iip9YGwRkTHQCT/UJ598wTfO+mlFZfgD8SEx3AvBWVtFAqDbrflleiDp7
 R58oBrQcmRqVIpJKsm718xxHUhMOtY3JGgUQYiv6bAN4lISc2z5Ju2QzD1IrXquWHev+ayiwS7n
 7KZVM+Gd+Sr/EQvetaHmNqzDWdIBpT5mdQLxQmX4+hCsrGzMAXlei3f84qoOw9V2e9u+n43W93H
 Z7rbuFzJIXu4IKLlngEXXY/RFZVr88AIIkpwz8/OLLEnYTJ7SkChFnM3/yMejx9Xsp9zCyfF/5w
 b+riLsgZTZzyAUN4l7+Pgl9Kqq1+xXc6+mV5O0MJ8pdzoA3aiUcTiMZqhJds8Ti0POEk+7pauBr
 d/n6Dnx+fZtx58xQUgpRvrVLtZkQ8pFgcNr3b3KNXXy3c2zxAv15kOKKK5jHD4/FpOINsE3FVfx
 SUZS2QHF0QVAWCxGH9+5QJn5SOVWKlzi0AFHyV6bRb0yyRkkp8+8Gj9xDDJMarG0yDVlaW6lPTT
 oYsKlppQ44FxNQ9UEDX3nZpTULabRuehfovG2KPpb4amory077swEoE6JUbBUf8rm9K09YA8FDk
 wyXGduO9eqahqe3FfT3xbGGSFV+k4JvfrMZrTP0+Eu5N659fq3paOBy8VsG3ts4pnnXNddDgEGP
 okULyFU CI3chMuA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct nfp_eth_table.

Cc: Simon Horman <simon.horman@corigine.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Yinjun Zhang <yinjun.zhang@corigine.com>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Yu Xiao <yu.xiao@corigine.com>
Cc: Sixiang Chen <sixiang.chen@corigine.com>
Cc: oss-drivers@corigine.com
Cc: netdev@vger.kernel.org
Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp.h b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp.h
index 6e044ac04917..00264af13b49 100644
--- a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp.h
+++ b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp_nsp.h
@@ -241,7 +241,7 @@ struct nfp_eth_table {
 
 		u64 link_modes_supp[2];
 		u64 link_modes_ad[2];
-	} ports[];
+	} ports[] __counted_by(count);
 };
 
 struct nfp_eth_table *nfp_eth_read_ports(struct nfp_cpp *cpp);
-- 
2.34.1

