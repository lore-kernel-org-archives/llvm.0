Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2550630DECC
	for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 15:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439427; cv=none; b=Bu86Vt17rNopY1oRjuJm+j2x/tMJLGs9pfsRcr1RRVKfXLFWT4QaWifp1/NWgcbgANpr3mLogt7WTD727Me96pHSOJyM9bAe6v8/dCpe59Zrkd9DO2f0jME9Pd6GCM/bCn2pWmHKTKpmJBIuq/VkML/4cvpAVbw58zgsJF229cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439427; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KnDLecAxAqlQObNht2qkcdnYreQsUD5W2WtuaEvYUNjSxLa0r6tP8L2bVEZJAbx/zGrByOCgxF4FhUKAiGxxsRSGcuPTXYciu+AgqVCznKVjeeDWI5sE8iIr/thS+zYK01VNETTGqwQddG/qRGk7qAE4LCotJxZAF1/Tg89Pd5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=le7yp2R+; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="le7yp2R+"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c6e2355739dso319122a12.2
        for <llvm@lists.linux.dev>; Fri, 17 Apr 2026 08:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776439425; x=1777044225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=le7yp2R+2qpJvfd4alfzkeklo29EfYz/SSiRfXmN6x3yyHWbid8KacfyTL9ZeTOF/J
         qOVRAhFt8hdBhdp03ea+9SSY0EoIHL2h74E7Ohmq9MtwuUbGD4AJSmQ4Sz6M3OAGEAvG
         C+ltub7/1qKvZIbQUIfoRDcv1gZtrL7mlUBu6KctiidR3vwgAjbvvrUoL4ulQx1vGdPw
         ge8f83/0ah4rcnjdaNpfGDMQbyZCmuYzLIls7q9NOeP1y4QfTayx7PLHCFaoChvgy+5x
         h29k4BAe+tUkBefhUrMhZlQRNUr0ub3gpQBA5BY07qt62MKHPSpQkzDo6RcyYtS5Ru2W
         cL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439425; x=1777044225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=nh29Yerznnll4djEKu8tNRPMTq3LqTiMHMtXiUJJRiutyiYg5o/KjG3BdBmQ4/AZLr
         4SdlVWDGIn0eOLhkoYB4TGEULRZ3zE2l9KJLU0cnIcpEq6oErX6Xte3HUdmTE/PNk33K
         DtFbRX1os8m3YILQuZ/FY0AJiL2ZXpBXOL13OpVNpkCB+jX2CWFBqhcsi4LAm24XRa1b
         PMyu8arw4LG3xBzbXzKug/vdxsqMmct/4k429zU+2FHGq08+JM25137H3YFF/Oj/Xtqp
         qQg57Ky4OR1fjm7R9rmtBBBCJ1ZRu1X5/+N/YSxP2nyAFvCrnpDw2jgv1m4n75N9wyLw
         oAFw==
X-Forwarded-Encrypted: i=1; AFNElJ9h7iUHImpF39v2pugDX4Rseud2wC2hjLfigBw1FaP8LPVTW5chMi04auctYNuTRh3kXjSX@lists.linux.dev
X-Gm-Message-State: AOJu0YwYdu2EjbtCwMnISvxYZGZ9XIsm3MWRxEpXvF1GiABHXITqWD9h
	w6PuK9O/auv1BaVCkRM+gA0UgDIVOzfd2M1T5xJvsBjwVWFrqrYJzkyi
X-Gm-Gg: AeBDievvKXF66mbqUfbjuBtRcrE87TJolQOMFBOiOPpumr6lJWH02fhch2034hhvVa4
	VpmJLIoYvEb0qeoK99/kKKo/9/HR3svqDYM6+ap04S9GDdb3wQd5rNcboQsZDfUeX7QhvW3Ugl/
	HkQJaPYM202Z3l4OnTuEuw2zX7Ese2Zf8EzpZpDqVbcnZsQq/9ibi8h8UTKb9iiGPovu6Vr2Np+
	LxDXeRMro5HFbLH438JIXPQ4nefb9M/lLdVqcyLm1QpxOJq7I+gKN7thxwHBJMkELKYP1bpxxfN
	AzcQyKyy60W5M20XqssyE4qzcxd8HiMxqJYYM4yiKTXv8aBFigZ30Ca9FKHSkPXJE0mJ8OGNqOT
	CLEJhMkm6RT0PXgxvgvDhMRNHjTT/fHrc1kqe2IwBSkHAn21D/K4SebvVubFw9REHdY5N1YwoKE
	0DPWHzA6Kj3CKKL3J2tk3Sb51Z3viQ0w4Q9/iCzQN5h2L9LCbEJpmnRVaMiZP777JyDvHqgxsXZ
	PPgDnfSN1VAIks=
X-Received: by 2002:a05:6a20:7491:b0:398:ac0d:9a06 with SMTP id adf61e73a8af0-3a08d933c68mr3614755637.55.1776439425364;
        Fri, 17 Apr 2026 08:23:45 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm2384373b3a.31.2026.04.17.08.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:23:45 -0700 (PDT)
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
Subject: [PATCH V11 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Fri, 17 Apr 2026 20:52:51 +0530
Message-ID: <20260417152253.2312961-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260417152253.2312961-1-mkchauras@gmail.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
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

