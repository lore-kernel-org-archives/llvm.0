Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DF335AC01
	for <llvm@lists.linux.dev>; Mon,  6 Apr 2026 20:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775505743; cv=none; b=ZlUCO363aGfPzy6lPtZkcJHzL+xN+1dgLSztdxqbCnlE+Gm82fhgURbP1LT9B2Y81G15IKv07vFHmDSts5uzeHqhITMRttVWBkVJm5JyXdJRkMxigk23LbIitFIkkZfLlHI66eggnIWvasf/OQTQbNhPwiD9L966eHaT3I40HxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775505743; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2OWSYOLnP6OgH02Jjqa8+Mg5oyUu7qZagSJ69TvQpTWFe0PsabsQpeiesB0i5AjgdGDX/53sp7xX6C5UIQ6SeXgGK1O4atCKlxX3AlEuebc491MVELOYKlNOuGYlcEu9vm4Ssxea7xY7s4w8pmEkquyHirm7hVtKVymzRBqSgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbSgrraM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbSgrraM"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b24fcc2b5dso28236205ad.1
        for <llvm@lists.linux.dev>; Mon, 06 Apr 2026 13:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775505742; x=1776110542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=AbSgrraMIPTsNJ2dvjasI8+1+QQT+bcOgHDV+JQ0D04e8v0Sx7Hw/2/p1RfmB8Ap4L
         kFKrWLSnkgJzwVcjirpEXwPVzjqXx4ol7Ut5lhOA7VfO4E32hAwZQKI/9EyHA23Klirj
         kN30PCvSIuOBG0c6Jtx5Rx9YVDKinOAA1QL7lcfz8pwMsbT7gvoWnBovXDhagRoglYKn
         OLf8DIKDzUoWF1BnweC0DRWvQjGzDQJ7qiqX0/K+blY4fMfNmBzNB6uA/5I0jjZqoKYP
         OzmPTEtm5KNrXKGCdB4skhCwSEibsmjOWFuQZYDKmZ0kNAQAKmHDPkACUGpwkSWNpaTu
         qkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775505742; x=1776110542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=kmLj8cK3u5J58C10CUAoeMq0Gh/znFHWZxYyYM3S9GZvuNnTYzSQ8F9BQppi/GthUw
         ponrE56JROJL1L2+VJu25jFchoBjIEHdJtj8PLSbiU+kI2yX+lLu6+VSP+5/HAP8PRi3
         NSXL/h1y+NnDdoWSyv3bgKDq8Y6enNNHoOVXMt/O4bRkriqLJ75Hi+Br681cQiCWZCYh
         UQ3DKKGLtEBnwR0Q/Ez+g+vZBF7d/lCUqyOyeeP4a+KM1CsuvhdUulWHGkUiiiRFbKH8
         wfXM6myILyDJlJYKvbRvXyhhh5gInbR1QVRTd0Jia6UTIY6x+YJScdTRffKpBt4TqkxT
         oMkw==
X-Forwarded-Encrypted: i=1; AJvYcCWtZeuROGQwQ/FL2dekhqsCgkZi6SN2HoD5v9iQ0BHj7KzyzVp4S791vHmkBMSviczqXX5y@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu7X6MAmCVq49bkrrVf0kBKtr+DWEDHOAChxqxVE8rBkMlUjZ2
	9SYhMZr48CVLI4KG+TmRCTb+IoihbgYKHTStLABXiYffFSZiidF+u8F7
X-Gm-Gg: AeBDieuEUpTciTqKiyZhkJTqKUy+yVTmFgYvzoVELJU42KxjHFLkyrINwqGtNutRvnf
	X0smoyvjwCiwlnl0d7zpRNmH7Ba9RElPE7/vPuRx7tQ/R0TwjG5a7p6PJWI7x/ta0y+xqwOdXo1
	7B8gRgmC3Q7Gw0C0mRwguAzBSQXJ2gH38FXjR76fmjS8FbHPfB5MbKIKGgiWcT9Zu4CgbHzBF5O
	9z2FfcWn1MYjEEt9wYEjY/OfC3uC0JRYdA97OfYExpdLMU+pNPgpF3VyxhqoZhfqBbexyzFephQ
	QR7JA99YPzX8Aj8sGFZTZeTfWNt+02PpNTi6vlqFEA7H6lQH8+ZyQigUZENYsS1MFt42bE/+8Rn
	aQbWuSDEN3RASVA8R9emo0R0yGuOZo14ubA/urydbouX2RTRlCLFsst8HQGajjk28VT4GhexXvI
	al75i7fSGvQwLCqcV/z/0enZP2QtnKPfxVauTJcWMo27KX/pQeXhYg1DhPxw3jp2Huef3BRJMxE
	fxT4gPrmeyMUg==
X-Received: by 2002:a17:902:f54f:b0:2ae:5eab:132e with SMTP id d9443c01a7336-2b28173fa9dmr143439795ad.12.1775505741829;
        Mon, 06 Apr 2026 13:02:21 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27497af26sm151098205ad.49.2026.04.06.13.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:02:21 -0700 (PDT)
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
Subject: [PATCH V10 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue,  7 Apr 2026 01:31:47 +0530
Message-ID: <20260406200149.3727922-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406200149.3727922-1-mkchauras@gmail.com>
References: <20260406200149.3727922-1-mkchauras@gmail.com>
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

