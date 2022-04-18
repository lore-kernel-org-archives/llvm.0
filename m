Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C36E80F
	for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 14:15:40 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id i20so18697578wrb.13
        for <llvm@lists.linux.dev>; Mon, 18 Apr 2022 07:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aK4MeadfQ+1NbFGxEqfyTLxfUGxa4k4UU8oEM9B0q3s=;
        b=fcEZ9fAONKGlYYsNruXnYxFgZt19JDTUK8qp+ByuHZ0JkZbH6apbRDkpc1XRJ59vft
         0uVcpml9F0gde7E4M5U5QtNEoU2sKbwXixRQID624emGxR+19fSTboUFSCnNulgMuClO
         xRHjqLPCpEr7hbf3m6k+ZimfLyIEmJKmcQh3JoiRI4Or8ZAX3uu4w3vPtsvzaD+63XeX
         Ge6Mdc5QyyAExIhyfa6dhdyJSSYv4sbnf7LEuFrypf4ghQi3A7IkQAhvWGDbkm2bnCxR
         1C/M8CoplMnC6av7EWCpT+cwepH0T2C+EQNsE45ZwoRGasPn7+VFXWA1VODqG9N5pfYs
         qizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aK4MeadfQ+1NbFGxEqfyTLxfUGxa4k4UU8oEM9B0q3s=;
        b=I3H5rslNjHVUk453qWrhm9I8RKYiwe1KqkEsRLaTh0M+AIvb40pY02qodf1WM7QieE
         1xFGH/aD3aoZVlkJqRFU7yrsPcMMEqx3Cvs8IAG1UVDxyf3kHswoPqcsG2pVuLw/yI7n
         piiRyVl7gf+E9fnTBLm/kKtNYO5CfvWHITy8IyxVJpJNzHcUTSqDFTCWXG75Hj/FsP2r
         yqfR2PY8zLIAbvd1XWk2+ioWj5IA+0aWpPZKrDbKulkrE2L4ktejoVKinpNZ/pf5icJV
         nTFRAY0Jh1eVWueseww8RJwgWT8Wau555WucTMovKN3Y0Kfw54R8xnxvI49iJKrmQ+QL
         mPcg==
X-Gm-Message-State: AOAM530iu2YF92O+UpJV9xOlASZVT8OnTeGZ11z5RwQ7UXI2l+cPugu0
	vjS1Hlu7Fzzst3m3fjbv0Mg=
X-Google-Smtp-Source: ABdhPJw/7Vqg6N8cUyh7HbbfJ6gTu0/cjFNupDra5Dx1rU7/OccnES44M2MLGIYQlL+fIUwxVz4Dsw==
X-Received: by 2002:a05:6000:154a:b0:20a:9529:aa8d with SMTP id 10-20020a056000154a00b0020a9529aa8dmr4413418wry.93.1650291338318;
        Mon, 18 Apr 2022 07:15:38 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id j14-20020a05600c190e00b00392910b276csm6875688wmq.27.2022.04.18.07.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 07:15:37 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] clk: actions: remove redundant assignment after a mask operation
Date: Mon, 18 Apr 2022 15:15:37 +0100
Message-Id: <20220418141537.83994-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The assignment operation after a & mask operation is redundant,
the &= operator can be replaced with just the & operator.

Cleans up a clang-scan warning:
drivers/clk/actions/owl-pll.c:28:9: warning: Although the value
stored to 'mul' is used in the enclosing expression, the value is
never actually read from 'mul' [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/clk/actions/owl-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 02437bdedf4d..155f313986b4 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -25,7 +25,7 @@ static u32 owl_pll_calculate_mul(struct owl_pll_hw *pll_hw, unsigned long rate)
 	else if (mul > pll_hw->max_mul)
 		mul = pll_hw->max_mul;
 
-	return mul &= mul_mask(pll_hw);
+	return mul & mul_mask(pll_hw);
 }
 
 static unsigned long _get_table_rate(const struct clk_pll_table *table,
-- 
2.35.1

