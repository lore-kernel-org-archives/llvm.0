Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4AB1D53A
	for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 22:48:12 +0000 (UTC)
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1c6181dacf6so108236305ad.1
        for <llvm@lists.linux.dev>; Wed, 27 Sep 2023 15:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1695854892; x=1696459692; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6h9NlhRD8hF3JGpC0yj7VRjIJqQSgsUALXY/NiPb6h0=;
        b=Qm2PhOBuEgIgxa1aSIUxzoY8y0h14wwHgdYKgzFb/MJCpyhoT/ncBsWyZ8nMTTAznr
         lIFFT69IVPpfhWLkrlTlwjSGvlihLD/LYCxlg6HlABnucCt5B00FqkanzCj/GEMKox2S
         b78sr7vo83tKoLRxzFHD9Rg9YfNhMqweQmBsTOFFmw1qIY58M+M89vBx0UZ5xEIR34Qv
         yTfLIA/I+TI2UCBwLBhbn4sVXO/ObGHPca7meubAVJr/YZJkzYxlHF9AYANrpCtjt3Zl
         ACbk29BfewkVg1/z+y+x/Ro581jwsPkrykpYlN4FD6t3ZXgyeKmc1t2Z9O5Iun2Oi8w3
         8Cew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695854892; x=1696459692;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6h9NlhRD8hF3JGpC0yj7VRjIJqQSgsUALXY/NiPb6h0=;
        b=TR4fowrVgs3ydE/l0X8HjeZ1a+NGon2s+fgNT6mPIBxlV3tJcDV0Cd4nzvpnHBKKou
         bPC2Ua+IQs9DxBP8z1UV4AJbdU2eiqj9/ahVf9EyhUwg+Rhbvt74SClwCBgj0BmLvhuj
         Y/yRKfrFik551Q0X2zCklZRDdAnrzqHzipASg3Qe/LMN8qAtJhXZnqM5787RQ4cjFV6V
         DTCClDASL2/mwFtoz6b9lDK3RLQiMbESQrx8k+YhhiVtVskPjfVsqdpRrIWItkMjY07t
         a4moQlYrInckFyVmOJ/AcXZlorLvls1oaGQSXcwXYpIUxf/mGQF6UciK0Ao+zG5/SrGF
         zAbw==
X-Gm-Message-State: AOJu0YwEzMUkiz7zKoVyc2O0Pu3kML1S6JbDH0fjb/PTZaTAO3Wz6Gma
	9f7rVVmKpCaT2Qh6m4NkVgdL+A7eu12M3+7GqCc=
X-Google-Smtp-Source: AGHT+IHK+0biBPVWxcHovzaXWOtINj3uMRtfg9f7R8EmqXuweOi238eHtIUJiD/eg0+vD4plv8qwETomHuFNs3pZDjQ=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:2350:b0:1c6:d25:8750 with
 SMTP id c16-20020a170903235000b001c60d258750mr47383plh.10.1695854892186; Wed,
 27 Sep 2023 15:48:12 -0700 (PDT)
Date: Wed, 27 Sep 2023 22:48:04 +0000
In-Reply-To: <20230927224757.1154247-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230927224757.1154247-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2082; i=samitolvanen@google.com;
 h=from:subject; bh=4N5TA1RYsqEG6l9M0xplln+cBa1Qt0iz0MCbO5csiTU=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBlFLEdbuqhUGRkvHlpnRFoLVngxWUbGDzCKHZjB
 gXmrezGpZuJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZRSxHQAKCRBMtfaEi7xW
 7uL3C/9V/COsf71wMsf8LAD8PbXFSUssu/Ulme80Bc+IvZbku+VH0yCAi+0as+ACJEpRsTnNbIQ
 pScn4vacTqNH+5w4IriZtrxed/+JlJlJ3oFsv2kgI5IxJP44McljBfgT1GRyGCHurDabqPsJYX5
 TaGUz9a7+gFF6iVgMLHb9uNWunfwjDU0mlECp6rp+occD5rm4k0XsmhUdYYDNB2N7vwL4ar7t7Y
 bRUrWcDXIDTzByGd1qZFeUPJ4XRuZmExIhm3XrLYrmbZvkYIH6oKzVv5knn9MHzzjsjfdiVDoME
 e2Bibk2Mj6F9ABYdpfXOcVNTMcGMZtsjvwmAv9Qx3j7PwTa5naJ0np9PriPDIM2jsshK4hOOa65
 Z+fMEcQII52/5PTX5HX9sXBqn/ly0o9tU3LTzbR4GGVs6W1Rzk4Yoden9lVz+2Ti9QdMMMmqjSM hvdcZcYO8OTXRXZtW4dNPx1A4wMY6pfJadi3BaYatIPrJyHzova74Yk95MQNhaBqyh0DU=
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230927224757.1154247-14-samitolvanen@google.com>
Subject: [PATCH v4 6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
From: Sami Tolvanen <samitolvanen@google.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>
Cc: Clement Leger <cleger@rivosinc.com>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Fangrui Song <maskray@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

On RISC-V, the return address is before the current frame pointer,
unlike on most other architectures. Use the correct offset on RISC-V
to fix the CFI_BACKWARD test.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Acked-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/misc/lkdtm/cfi.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/lkdtm/cfi.c b/drivers/misc/lkdtm/cfi.c
index fc28714ae3a6..6a33889d0902 100644
--- a/drivers/misc/lkdtm/cfi.c
+++ b/drivers/misc/lkdtm/cfi.c
@@ -68,12 +68,20 @@ static void lkdtm_CFI_FORWARD_PROTO(void)
 #define no_pac_addr(addr)      \
 	((__force __typeof__(addr))((uintptr_t)(addr) | PAGE_OFFSET))
 
+#ifdef CONFIG_RISCV
+/* https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention */
+#define FRAME_RA_OFFSET		(-1)
+#else
+#define FRAME_RA_OFFSET		1
+#endif
+
 /* The ultimate ROP gadget. */
 static noinline __no_ret_protection
 void set_return_addr_unchecked(unsigned long *expected, unsigned long *addr)
 {
 	/* Use of volatile is to make sure final write isn't seen as a dead store. */
-	unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;
+	unsigned long * volatile *ret_addr =
+		(unsigned long **)__builtin_frame_address(0) + FRAME_RA_OFFSET;
 
 	/* Make sure we've found the right place on the stack before writing it. */
 	if (no_pac_addr(*ret_addr) == expected)
@@ -88,7 +96,8 @@ static noinline
 void set_return_addr(unsigned long *expected, unsigned long *addr)
 {
 	/* Use of volatile is to make sure final write isn't seen as a dead store. */
-	unsigned long * volatile *ret_addr = (unsigned long **)__builtin_frame_address(0) + 1;
+	unsigned long * volatile *ret_addr =
+		(unsigned long **)__builtin_frame_address(0) + FRAME_RA_OFFSET;
 
 	/* Make sure we've found the right place on the stack before writing it. */
 	if (no_pac_addr(*ret_addr) == expected)
-- 
2.42.0.515.g380fc7ccd1-goog

