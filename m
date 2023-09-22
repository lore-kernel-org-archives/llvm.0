Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AF844486
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:53:53 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-276b9d5ce1dso1731341a91.3
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405233; x=1696010033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C/sXEbgxXtNKYo/L4/vhLbpgVFK4H06rEANzOjtTwNM=;
        b=QCw14NxiZww1F+tI28Lua9V3LVtBb3w6seZ5DjY5nbk+1j5/kbrNDAkphDvfjR7oHx
         UZYMvgWpvJEIkraRHnchHp52zOW9VFPZwFAIAmVwNgS7YMmaewg59+SI/IG+V93YUxf3
         Jo1jl9Bn6JQu2Qj844zvyexljQRyIbiHGBaYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405233; x=1696010033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C/sXEbgxXtNKYo/L4/vhLbpgVFK4H06rEANzOjtTwNM=;
        b=jjBgxYTtHRW11o5ij5wk7QmjO6WO5vekFmQaK1XEcIbuKHVmasp7oTfz4VbUN5EZH5
         JlXY8NwSSH5aaB/3nwb+Z2iU+3vDQidBCn6MExeL843HQp1wDu4hdE4pwmJG7syNf8a+
         KcwuWE5IqXHaksYaw4tVddTFpMb7A10l9DUi0E1AMEBRQUuh1dyHx/5QRFmOE5f5miO/
         5AZRIZ7nPazao8aeCXaSjcBMcpMCBHp2sX9ZX7BxDLsUaNzKTzOkBXoH4eDIV2ONW4im
         8+J1FJCG2e3BGKU560aM6TjnC/+RjdSVlqwB6s8zetB0WDSEHmQwDGCX7ISfaKxL2nVc
         h8Lw==
X-Gm-Message-State: AOJu0YxiapIccwMetfqMlA6OjiaJgYHs0kiKk4I331w+VE/VgWWjWpNy
	TpowOKkdmcNnelJybmzX+uy/bg==
X-Google-Smtp-Source: AGHT+IHjmTLQbm2SiN3w8uyT78a+4tZ23kPyNdMBOXmx6iaVEN70LQnN88b589oOJikCMvI5LcWmIw==
X-Received: by 2002:a17:90b:1e4a:b0:274:5e18:851c with SMTP id pi10-20020a17090b1e4a00b002745e18851cmr438131pjb.4.1695405233436;
        Fri, 22 Sep 2023 10:53:53 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id 15-20020a17090a1a0f00b00263dfe9b972sm5559788pjk.0.2023.09.22.10.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:53:53 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kees Cook <keescook@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] mailbox: zynqmp: Annotate struct zynqmp_ipi_pdata with __counted_by
Date: Fri, 22 Sep 2023 10:53:51 -0700
Message-Id: <20230922175351.work.018-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269; i=keescook@chromium.org;
 h=from:subject:message-id; bh=1poq85ba9j+7J1PLFH3/OUdUEKILRF+ZhAzDjq4Mb1A=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdSv0B0ZAwn8thcnEoGKGRm6tzJNHNC4p1SKM
 twNnK6o/LyJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UrwAKCRCJcvTf3G3A
 JpICD/4s9t+i2GRgZhTVaFg+1WEWAK9XubwciA/mVOtx0WxFwtlB9FKhov7qaG3t9gZ4lzoMrMK
 4xct4DPrkm3EJX4D71EADhTvPbCzsPcJVxqrxLdUptg/nCgNrvKVRvigyvw8dJN7CEMKtohXO3p
 7+nD+RxwWorUc5zOaJhIUX+OtZN1MgqqXNHH3XlSPRglnMIiCg9uL12FUXGQ9huF9W2+CBdC5/G
 2hjhh2JfjT+ZkxCYjfsgakw3gz/B6lNH9B4ESOTQ+JDFCovfy8npuG/lnEPWVl1t3aQDTw+Ggvg
 Bm2VYWACynNShZlEisvshdeozocThIzZnp5388I/hjsfO3dGJ9NkEg3pYxIvaj3ZXmZZHb5n03c
 BKxHbmk84rHGRDfnv1JshClFI4fUy+QU4s7tTsjmYwvwvuPat04djCAB27Rmu7eKPVknR5U7Ygm
 F7Xk8GmbeNyOB8r3/b0z47UjjXri8DcBUSRJ7T5I0bci5BacG0974PRqG302aV0mNoOhysxe2rA
 vZWNpKUYK81yZ9Tsp6Jo+6YD9HH0bNEwmG81K2w6zbCDokfK2+Bz4UZ0OKcF2YRdqOtvdCWi9gy
 hbceAJvcoBvTaOPPT8bPQO7sA6TSJxF1xrFLNO+WzUCykLJ1nPq8GXQUBWK44XyhikDJI4Qe+hK
 FTeA9y1 2E9MSx2A==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct zynqmp_ipi_pdata.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/mailbox/zynqmp-ipi-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/zynqmp-ipi-mailbox.c b/drivers/mailbox/zynqmp-ipi-mailbox.c
index e4fcac97dbfa..7fa533e80dd9 100644
--- a/drivers/mailbox/zynqmp-ipi-mailbox.c
+++ b/drivers/mailbox/zynqmp-ipi-mailbox.c
@@ -108,7 +108,7 @@ struct zynqmp_ipi_pdata {
 	unsigned int method;
 	u32 local_id;
 	int num_mboxes;
-	struct zynqmp_ipi_mbox ipi_mboxes[];
+	struct zynqmp_ipi_mbox ipi_mboxes[] __counted_by(num_mboxes);
 };
 
 static struct device_driver zynqmp_ipi_mbox_driver = {
-- 
2.34.1

