Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678CD29BDB4
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776773431; cv=none; b=qFJUnLFFVSngy5uZjg6gp4hq3SZH9LiQKAwI/tKXhXe+d1RM0+kDly1DC3IK96l7RBnJKTRGV4IanMz9TtUVVAdhRZNwpIUcRU0pum7Mkz4hgD9ydJZp9o7onCYAuCr8e253RUUHbU1Mpzg47kkI+vEpEvbVAnR/Oc2Ea/5DukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776773431; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JCU27YirmoWDK8P/aECRDq8gqntMkFpumYOwMrjjayVH8KN0l8MjMcn3DBnyND39CagLb7eXVTRwR/5PCEX5ejmeF2q5Zpk1T/YbRqVkcfTaioq36soRTOTZYK6HiLM/qH4nvTMx+dqXtMxU89sAFRpXUSrGBVnjprmtwCt6fEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hD95MBCI; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hD95MBCI"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c741692db4cso1175835a12.1
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 05:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776773429; x=1777378229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=hD95MBCISHcljvEmFYVkEtEgSWbNqo+xLg440cLXhHw52IF72up9lsfId2U4Ip3FqZ
         UMjhEKTDz6F60xDqk5v1knJ3Phz5AwjtTc+8jdNZBBHK2hIBW92YrEO5mZ5a0hCX4EzZ
         Twyy7f7r92LzwZfJTwEPc6YNdHuiVT3SSZ3bmG2oOSXAqP09oV4BZthQhQ0ScMx5ISpL
         WmgT6CgkWv3r/nlLDGFgI07WK2nVcSdLc+M5vLBwIwhRmMSSjtZ5z82+LZM9hgUrkcC5
         kgnD/caLOAbeCarXGZynQK5qaNcn+zrzO9xT+W410YMcgKZSZhC5Zt54SXwoQhB8JFxE
         AjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776773429; x=1777378229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=cCzjQrktCzwEWFmolEgWwRzV4Q0SfeBM5F3nydqP0PjfuBRb5iHcGC+MPMYCWpSKdO
         oEHo7f31+AbqLR0FsRG0PnWULUsMPq5Q6DhUVXg4ZbnxtKKsYSqpUCrFcEjmLfFd1Y1m
         KtLgFeV06cgCIKVI/fu6wV0+82+DA7vpcVcN/RhAchch29IQGSda5Td8SzUs5b/TxgwV
         658Ops+o2sQBCj5DioSeP+eRnQrU5zRyQYYeCQl++hzAYqT+iizCrCCh2NHaJAdLB6o4
         JdLP2lNUV8KblEdYFcR0qu7i9UUrKV3rC8P9FVU4DJnXO7mu8RQE/N+mEz6ln4WX3J9i
         JC6Q==
X-Forwarded-Encrypted: i=1; AFNElJ+mdQGzyoYLvwn8x6XStSrtk93MYdYgDL+6bkT/3cREK3vaJv14sXxDpymeCk8yv2gCVhvr@lists.linux.dev
X-Gm-Message-State: AOJu0YyXuBPk65SyBJnaVOItUe1PpN7Y83dejVHrW6gXn2OdrWImDnQY
	M0EVkC7Zqy2tBnUKHSOauhLYOGrTZNwCGM8u2QAQit6z8HaJEksZfn+r
X-Gm-Gg: AeBDieuhBn9uiJOCG6Uxfh6hqESAb/B4guWInTb35Tcszvi8hOc5llr82puqo5LRYOb
	+lmDV3Y2x8sUJRz99UjQBBwLjC1BPKdEfaPR2u+M20Mn6J1A6iWtSx0AxagI5s+tAbGExAe0fK8
	WvhaZHF8FMtHKbjL6cnXThEyM/B3XrJbxcejZHIC+UjNvxeKrr35V6xflSD2wgzDa2kW7oTLzhf
	spCPJ6AXUuwz741cQayzImPIhFX695bGE9r8lqSX11nyP2S+n3PMOQ49+4op/z6FYzLtPi0oM3v
	FY1Bq4tEIk0b7Tr0fYhyTJOSJRYtstncodcAqI2tG3Pv0rYW0PEM8mYo92XYRj1MStUYzEh+JrD
	1wRN+yHNQXO1Hq/NtDA65YKRz8w2TBuY6XA3rebsnQfIR/uJtKJT5wlQ8k5c0rHPYBu3JJVAjt+
	UEHo2oQ6by5QmBmqzyScyhMQQfkI5HtdvVS23moqTL5K9c4gEEcgakmUBaaHef8jnPcpFkhLrKN
	yjliXLv4EfQeNkqigOR4tRyvA==
X-Received: by 2002:a05:6a20:6a10:b0:3a2:edff:296b with SMTP id adf61e73a8af0-3a2edff3a32mr1965327637.21.1776773428601;
        Tue, 21 Apr 2026 05:10:28 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797701d9bfsm10045274a12.16.2026.04.21.05.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 05:10:27 -0700 (PDT)
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
Subject: [PATCH V12 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Tue, 21 Apr 2026 17:39:56 +0530
Message-ID: <20260421120958.190430-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260421120958.190430-1-mkchauras@gmail.com>
References: <20260421120958.190430-1-mkchauras@gmail.com>
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

