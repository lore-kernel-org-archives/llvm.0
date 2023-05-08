Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A1168C7
	for <llvm@lists.linux.dev>; Mon,  8 May 2023 11:53:20 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1aaf706768cso33122995ad.0
        for <llvm@lists.linux.dev>; Mon, 08 May 2023 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546800; x=1686138800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd6PQ1vE/SZdiXRk2V4YVd/9ukw5PfEy62nQ6sf0Uk0=;
        b=Wj+BdFY08go+Klnkl9ikMjatb5QJpTO2cewG54fs1b3lW77HcXNjgQTN2vzRD/j8ke
         U3yyKNS6ssEcggGMDfAXgwZPVb+FBmqfOr+Em+1ArsfHhZf2wSJZfgC6VkUq+JwWgyLn
         g+RLMWOOtmon/m7EVa2DCP+ETl1ECCK4M3nMIjFho7LKvb2yNVDCezwfPiVlDcs9QJCj
         8LW7073DSm3mdChDFXxsHRRaDLUKp6u28cqpHj2tCtL9vO7xzRypFejOqMQyJUAGg7RB
         COx5W+bUevsvQur/1Cp+1+YUYxa7JkuqnS6OOhyy6oxt/zn2DyhnlYWkHpifR+QPUO6n
         siaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546800; x=1686138800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd6PQ1vE/SZdiXRk2V4YVd/9ukw5PfEy62nQ6sf0Uk0=;
        b=jIwPf0d5kPDyAIR7NSbehtvuIrmtToU+yoJQvnCrOBIUb5S4hswhgr4cP8AHbcrX2f
         Gr4oawWvvpqN0cD4Q50Lwo5WHYPiUu/j48Yx1SWVblFtNbvpbeyWH8vwQODWD5XxI3wx
         CeZlq6lVMm8SZnwP2SUjK6LMxgDPfU0z9NilOc0rPeXL0Xvj+hAKM5TPv6kMxXtY20Lo
         4N6eCjyAzhtvg3DVAqTQ1gCf01IWRcsJ5npqDv7keMvw57LdvaaIpVcN7eWwtuO4krjb
         sBxgMW5oiktZf+9d4qhSfBObAqYUQcoqi2ltxAB92xgEQr6hVeRRqCqX6X8SCWTwtECS
         SXXA==
X-Gm-Message-State: AC+VfDzoDlYOhdnQ7WClermosX2ohetfgYJqOOAo3yvfnYDI+tYQH/hX
	mTh8N0atrMzRPFbfNJARH0XLCA==
X-Google-Smtp-Source: ACHHUZ44JOKf09v8SpLqQAPymUJYFxrBhM0oK44TrPeFKd+o5n6tK/8ozBu8m8cH4Q+O9X7/qncP4w==
X-Received: by 2002:a17:903:1252:b0:1aa:f0a7:933 with SMTP id u18-20020a170903125200b001aaf0a70933mr12699535plh.25.1683546800261;
        Mon, 08 May 2023 04:53:20 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:19 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Weili Qian <qianweili@huawei.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Marc Zyngier <maz@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V5 03/21] crypto: hisilicon/qm: Fix to enable build with RISC-V clang
Date: Mon,  8 May 2023 17:22:19 +0530
Message-Id: <20230508115237.216337-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
allmodconfig build. However, build fails with clang and below
error is seen.

drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
                       "+Q" (*((char __iomem *)fun_base))
                       ^
This is expected error with clang due to the way it is designed.

To fix this issue, move arm64 assembly code under #if.

Link: https://github.com/ClangBuiltLinux/linux/issues/999
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
[sunilvl@ventanamicro.com: Moved tmp0 and tmp1 into the #if]
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/crypto/hisilicon/qm.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index ad0c042b5e66..2eaeaac2e246 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -610,13 +610,9 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
 static void qm_mb_write(struct hisi_qm *qm, const void *src)
 {
 	void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
-	unsigned long tmp0 = 0, tmp1 = 0;
 
-	if (!IS_ENABLED(CONFIG_ARM64)) {
-		memcpy_toio(fun_base, src, 16);
-		dma_wmb();
-		return;
-	}
+#if IS_ENABLED(CONFIG_ARM64)
+	unsigned long tmp0 = 0, tmp1 = 0;
 
 	asm volatile("ldp %0, %1, %3\n"
 		     "stp %0, %1, %2\n"
@@ -626,6 +622,11 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
 		       "+Q" (*((char __iomem *)fun_base))
 		     : "Q" (*((char *)src))
 		     : "memory");
+#else
+	memcpy_toio(fun_base, src, 16);
+	dma_wmb();
+#endif
+
 }
 
 static int qm_mb_nolock(struct hisi_qm *qm, struct qm_mailbox *mailbox)
-- 
2.34.1

