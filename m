Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C214287
	for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 19:58:49 +0000 (UTC)
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5701dbeaf9fso774026a12.2
        for <llvm@lists.linux.dev>; Mon, 28 Aug 2023 12:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693252729; x=1693857529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqxXsJhK/PDnu5QKzOuhVQVuGBQ7YV59awRNcw8M9KA=;
        b=5vbcngL8ZVHRFE2eljBR/WQoqnwHuLVs7upb4C37eJWQbZVjr56f/ur647yJ4AUyqU
         odlSa8/RjIkDV07G0UBaBb4auy8DU4amPuju8M5IQqLJYH54J4qila2NhRd+E1O4RyAM
         uVYOKvozn6NT8UEW8VWKOZJe/DKWNoXAIn9cnQYVR4AleyEg1/b63QvqUxI0dcSLbnMx
         XLuUylSfyiMonef/eNWAAMq+tnS4EWsKMBu8wIhTW3R0YLJ6tJf56CDFzDgaITSCuq+s
         BLuYHuv7RfEgVzf9k8LBhuxRvd2HXWmtf2Vk/OTijRK93Crc/qqwJGPUvgiTw7PzvnTZ
         ll/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252729; x=1693857529;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqxXsJhK/PDnu5QKzOuhVQVuGBQ7YV59awRNcw8M9KA=;
        b=aLA1z9I2KoWhEhY9Gby+U4jly9Q8X25FN5v1/rn4nXuxJTG7YhczrR3ugmFlG6j/nz
         rwIH4JlwgaA+hxpEVWMRyOjEzM/InDUs/CislrGC6sPWj4TRWuyWitOm2iYB3Wc+o002
         W9VkRmg5c23inkdGcWKTQQkCnt37GSY1iv5wLsaX3ETJLEnIRyBk22hFgjG5UQfaIAd4
         bG5h8FvEB8DPYh9Ttx/wCxzgMcLi/dmJDMU/NNyewenXUf3MfNJemrbXM3jfO8horfGi
         cEEvscZHwUycJBtheEP0hyGZ/t7/WYMz6GyfcdCM3KQJC+VS0H9bPBvf76fT0e4GOWuk
         pcAg==
X-Gm-Message-State: AOJu0YyQvTfv4WoJtm7KixwqfSWtAmTBgOay79J7pjeA4Jpro8bzcXZE
	SkMaJoSbqmApE8kGCbzIBZta3WSgRZdYISxWjlk=
X-Google-Smtp-Source: AGHT+IFGsaaO0XSM/Y67KiglbiGwn9oCum6xrnQEFf9Pggoc6RCuQ0rJ2Xb5U12wKvaEKKMsCRfVVSyEDOKWowHVSW0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a63:9351:0:b0:569:52d4:fb68 with SMTP
 id w17-20020a639351000000b0056952d4fb68mr2368998pgm.5.1693252729217; Mon, 28
 Aug 2023 12:58:49 -0700 (PDT)
Date: Mon, 28 Aug 2023 19:58:40 +0000
In-Reply-To: <20230828195833.756747-8-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230828195833.756747-8-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=samitolvanen@google.com;
 h=from:subject; bh=P2l56HkzVV4iJDbhsS59ZlfJgm96l/buqsb6+trKTfA=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBk7PxqKl9k+yTdNALVx1ZMSiIiYkPp3ifD0Ueug
 LDeD+59dp2JAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCZOz8agAKCRBMtfaEi7xW
 7ombC/44I2N+oNE0mhFWTI0lDlgL+4/JMQhfMKSufRM3U1T5OqabvtPwFHQhOXRz1TiwEcDr7i8
 5yQiZuqOXgg3iZ4h+9F4cRzw28ArehJIEGz+O7FO70FgOBNXOSHaWGcyv7VuHdprWhST+C1v9Zk
 ZgslARn9fBw5HJwmwr6bN8M9im4r9jKtVsPr55L3xnUWbk+knu12/aZpE/GGE0bbf3QK+N4vt3A
 0nNh0iiFlV4YayOAPFabrTDShrkvvWlE4rzF+fG11hd/h8APu37zoH57B2AywUWNj14p83mXT6k
 u9y2x57j40yu0iK/b1JflZvDK7CJ0s8ajtQhMOXhjDmApgyeWZVLMLAZTpKv4gs/oO2xodXiw4R
 ksl1GmDHjdIlhyeMTWWtCCcg/DIiAd6f1B740jP4kkXUDiP9Sy3P/G0MHt1K+RGieGHpaB5B13/ UvPppmx2PeR8h40O/fHIATSyyElr9SQ8Dg84t2Fd6nUgiqKsWp+OrKSdL0qF6hmaWxQ0o=
X-Mailer: git-send-email 2.42.0.rc2.253.gd59a3bf2b4-goog
Message-ID: <20230828195833.756747-14-samitolvanen@google.com>
Subject: [PATCH v3 6/6] lkdtm: Fix CFI_BACKWARD on RISC-V
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
2.42.0.rc2.253.gd59a3bf2b4-goog

