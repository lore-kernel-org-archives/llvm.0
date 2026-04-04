Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA9A22A7F9
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 12:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775305008; cv=none; b=TlbI+FuaXiqM0y5Tf0c97d2lKEriBEXeIKF7LyBZe0bQrA1dmyFJh6IbMeTtbEaViiD2l4VZY5enM71LwmSlfosRmjTbtyqomfyyriVOPTzoRX3X8ESmleB3vUulWQ6TvdYt4DxxrVMQeIE0WQB3XoBj6x9+RKpSZIzEHQJKUJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775305008; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4YJuDmc2AWbT+PSL0AMrUU8MQyepwm6XTihwJnS7Ze0ehENlEjpxhg4XRWEu0E3m7k8ARk4pkqKbLideteaL3z2rMZdwZfx2aZcLyzda9na6VmmDjVjkn04Fv/ICrGSdip+dxI9zaxTgyovKGE1pPT5TXW5LF+pNgMPygUTgGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r3RQJlVw; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r3RQJlVw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d9827661bso1317034a91.3
        for <llvm@lists.linux.dev>; Sat, 04 Apr 2026 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775305006; x=1775909806; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=r3RQJlVwaqsmHVWFGBD+uuOgQCMFyhBUoJcsk9X2XRkP9IG3ttJ6PdLfZF64LNZF2u
         FEkkhk4A2cyiOP8G/BbeTsjC4qJWQPLhSkUGHkHHw7oXfScWdIo9BT0cmVOmn6msUfQC
         8vgDqrqX0dnEahwtkin1aCFjhIXY83zfTgcfkEFa+TXz4vC3knVVL5lvxsBq8CUWaW9r
         eSZ6A7/SiaXJrPfIpnNAjD9YX1Atub6MbNLYvx7Ut6dJTgFdcdYBKm+9heBt4UVpncgK
         NAjGzGOBU4nAxnkTLRL6ga/DF6dm0sr9bIt7CxKuBG7QzI37deGWe/5UifqumMuFy9US
         66Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305006; x=1775909806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=WOMJG+IMYlk3eCgCQZGBsy9gXjdgFpvYLcwZmOp0BPbGY3/dcNGVGewbILtycNRukT
         oNTs+g7MxagBT+fSgHdG+xXHB/il56Qt+UhKA/ahJdK8W0Hvt/QMxeSWvJY/ZqW7WGFd
         kc7V9YAKWEVl5VKqidBvHEK+4Dci/nME3DyWgsS6Z41uRxBKVcO0YGG7b7aiXBQ5fjUL
         1Yfz/rf3ya/HDn4/TYXW+kTpvKFlSGz5dvbg4Jwo4mFMew+9fLkE+zkQx7Wk8uavQ4av
         syjAyt3FJHOMBPixkGhX4TOWMIPI4V8To2UCfugJu++nPz5ZqvKg5Pt5TZKQmly1xtdi
         UrBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvshZJgTc/PElDQaUwu70NUsIBujfGZlhgUfpwjCIhn/UxtmGz4csPgy7/PanNbANWJ522@lists.linux.dev
X-Gm-Message-State: AOJu0YwYqxCahSiQ45Uha4QeWpzTSNB5XIJRFHcSLBD+dHif+D743o2l
	gCW1Tvgaw6B9OESOqpLnBDko73TI12LBTjiTtFT0C+8EjtPWub3xVVAX
X-Gm-Gg: AeBDieu5dgGT5Dv8dMhm1nJzeoK9hDws6gn0zT4Gj38kX3CiSUEFljZ6BYvT9nMoUds
	lUmImpStRnfXU54pc9W1tjHI7zfYOJ4vDfgh3yPNrVzQXMIXH+5VLwQxyHQ7lK/dpmoinDYEs6Z
	AIPxiZErPAemwdTAK9E4IN+/Ee1OHTT6U+s6J47DSkaVkKcQ2x6EqBS6ce+o/3xWYt3CxRsv3ZX
	pM4Xs32Ko8B35qYtXgYG+qSurbWUuvooQr7sqoBN61aS/4MsNWreH1KifuBfSP0KTcCuCaia4vl
	h++c4kNJVQyFQz1RxoagclK8GgkJgPKjce7LlBS04QFsc59tHon3vFDbRweYN94AgbKVb+4NSZy
	FDLZCAG0ANTn0QWMfGsy0u32XlPFDVG9mI9j2BUIbArTcztg7NRWbKFHCim3206RLM1DN/Z2Pa1
	wzdviIj2U/kPMOlEcwsa2hENgBcDJSwBJYnJpQj0dIf7wEm+6sfm1rFAhT3Xd7GFYnO6IlG39r9
	IA=
X-Received: by 2002:a17:90a:dfc3:b0:35d:8fdb:4f36 with SMTP id 98e67ed59e1d1-35de6941208mr5104917a91.18.1775305006017;
        Sat, 04 Apr 2026 05:16:46 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de500c42fsm2702745a91.0.2026.04.04.05.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:16:45 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	aliceryhl@google.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	dakr@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Subject: [PATCH V9 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Sat,  4 Apr 2026 17:46:08 +0530
Message-ID: <20260404121610.1956528-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404121610.1956528-1-mkchauras@gmail.com>
References: <20260404121610.1956528-1-mkchauras@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
to avoid duplication of inline asm between C and Rust. This is
inline with 'commit aecaf181651c ("jump_label: adjust inline asm to be consistent")'

Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Link: https://github.com/Rust-for-Linux/linux/issues/105
Link: https://github.com/linuxppc/issues/issues/451
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
 arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
index d4eaba459a0e..3016e9c8d6bc 100644
--- a/arch/powerpc/include/asm/jump_label.h
+++ b/arch/powerpc/include/asm/jump_label.h
@@ -15,14 +15,20 @@
 #define JUMP_ENTRY_TYPE		stringify_in_c(FTR_ENTRY_LONG)
 #define JUMP_LABEL_NOP_SIZE	4
 
+#define JUMP_TABLE_ENTRY(key, label)			\
+	".pushsection __jump_table,  \"aw\"	\n\t"	\
+	".long 1b - ., " label " - .		\n\t"	\
+	JUMP_ENTRY_TYPE key " - .		\n\t"	\
+	".popsection 				\n\t"
+
+#define ARCH_STATIC_BRANCH_ASM(key, label)		\
+	"1:	nop				\n\t"	\
+	JUMP_TABLE_ENTRY(key, label)
+
 static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
 {
-	asm goto("1:\n\t"
-		 "nop # arch_static_branch\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+	asm goto(
+		 ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
@@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
 {
 	asm goto("1:\n\t"
 		 "b %l[l_yes] # arch_static_branch_jump\n\t"
-		 ".pushsection __jump_table,  \"aw\"\n\t"
-		 ".long 1b - ., %l[l_yes] - .\n\t"
-		 JUMP_ENTRY_TYPE "%c0 - .\n\t"
-		 ".popsection \n\t"
+		 JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
 		 : :  "i" (&((char *)key)[branch]) : : l_yes);
 
 	return false;
-- 
2.53.0

