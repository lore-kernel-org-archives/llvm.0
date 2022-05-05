Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4182568
	for <llvm@lists.linux.dev>; Thu,  5 May 2022 15:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE8EC385A8;
	Thu,  5 May 2022 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651764469;
	bh=mVIRt4yoiSxRUkECE7FwEEKVUQMrty6/i5Bfy9avcZw=;
	h=From:To:Cc:Subject:Date:From;
	b=IqTfK1DOBA9q7un4+7ST/1fhCQ5C0Fsqk1K9f4pSfp36DSjneyNQDm9bDfyD0H8rs
	 UMIOn/Bl9GUzZ4Ust3lh4XKsbaCwlPB8CKP+d+Gi7p/hUMyVNucjoV/WIUnRULQlMA
	 9m2Pv2LlbxiruPNjFUNKcuN+MyYSaqnLbqBoczTRDgTmFCkiWusCOek8yWtPRuEjE8
	 w4zruAgWJAoq9nWgvDdXMZqpi3givElrdGT4+BwtSzalG8poEXzELnuSpqs8/+Z6gh
	 g6uE6D5pHuqLH+Z5v329/qucwK4zPczzpRGh1ETfAhDJqrwssKDjFgFXcomwbzAd/z
	 mqVzUvHmWKO8A==
From: Nathan Chancellor <nathan@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Wolfram Sang <wsa@kernel.org>,
	Michael Walle <michael@walle.cc>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] i2c: at91: Initialize dma_buf in at91_twi_xfer()
Date: Thu,  5 May 2022 08:27:38 -0700
Message-Id: <20220505152738.1440249-1-nathan@kernel.org>
X-Mailer: git-send-email 2.36.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang warns:

  drivers/i2c/busses/i2c-at91-master.c:707:6: warning: variable 'dma_buf' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
          if (dev->use_dma) {
              ^~~~~~~~~~~~
  drivers/i2c/busses/i2c-at91-master.c:717:27: note: uninitialized use occurs here
          i2c_put_dma_safe_msg_buf(dma_buf, m_start, !ret);
                                   ^~~~~~~

Initialize dma_buf to NULL, as i2c_put_dma_safe_msg_buf() is a no-op
when the first argument is NULL, which will work for the !dev->use_dma
case.

Fixes: 03fbb903c8bf ("i2c: at91: use dma safe buffers")
Link: https://github.com/ClangBuiltLinux/linux/issues/1629
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/i2c/busses/i2c-at91-master.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 5eca3b3bb609..c0c35785a0dc 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -656,7 +656,7 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	unsigned int_addr_flag = 0;
 	struct i2c_msg *m_start = msg;
 	bool is_read;
-	u8 *dma_buf;
+	u8 *dma_buf = NULL;
 
 	dev_dbg(&adap->dev, "at91_xfer: processing %d messages:\n", num);
 

base-commit: a181b8d187319bf265a2019ddde856a3d2f107a6
-- 
2.36.0

