Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1456359703
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777201231; cv=none; b=Wr81394dJMICX9FzVPnRcq1ozw2Tdug5YPv9VLeNVHddtsdwHUet/TlzJ4xAwypdz/fPTlxoXBUo/klv1SkImZJsTjdM84wq1Z6s2GXhADCdwZe6wKPR674IycOhZGjDEf28jYDQwSghtjW7bdOb618ygrOh2P+Ost0/AYEqoy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777201231; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJFGJe5u8iXh9gG6QZSRXtYzA3/65ybyPD4vtibcbLodew4YNf16HQDHv+5L0Z10XMyOog6XimM9D3Xg19qGKPP6wYohJhafcVmAuiGEEI8nt7mB1QKLIsgR0CNAedWwMbgiH9jz5SiZJw37EsKSpkP3TJDj2yF/PY7YediYjCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDOzEU/U; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDOzEU/U"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b788a98557so41958185ad.2
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 04:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777201229; x=1777806029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=FDOzEU/UJRVYHYxnhUC//cyK88fCWLN3OHJ6uPmNjSU1vvQFHe0M1Mc2qxpTDPqhtO
         FzsqExfkhxXAg/65wWzfPsqZ1BFvNddUNKQpMIBrW8c8AP3OjUc9EtvUvOWxq2cWqmOR
         /m+UjJuXhG5Pd6+qzAEtcEqR3OORUH5erIW7oFnVENZSu6DH6tB7pKrJSIW1a9xhrRKK
         P4eHLHuMlfmS4UdcV7hJ3DodFVeqJVeOx1u9eygsT+VSn3tiKrdvpJrHi28LuV65QnaZ
         Iurs9x4mleXycvIeoORYtAXRz+szHw+9gW2Vgx4Wtjjed5by/O0hPsPUodOoA1/lMsfo
         K16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777201229; x=1777806029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=bdW5oSsnbt/zCAaUScClLOLcU2BspjIpAi4e2Bz1vr/7MNnADNZV9mrFxtPLq7IWeQ
         9ZvFJH2YHxbO2WVK54GDaF4m8rDGBMplGCMczjlgD+WyOKY0bjPRZmmw3tMsuegz0zRc
         6r8qEvMrm5jNCT6poRP92p+KoVYEGDA/Ipv49AJ0yF9R9hNxxwZLzkqxsAnyJ+fgULwi
         K1RABuEwM1i1ndao/mxjHG1OhP7kkzgA1YT6x2Ne13EQA3xxHcaoFcTG1J9pRGTqfn73
         wcpGmXeAk3tz2MbuuJJ1TmDmgvPr6VOB9vKMC241fNuTLH1YoyhahsJoxw2iI3NY1XMK
         4q3g==
X-Forwarded-Encrypted: i=1; AFNElJ8DIhmv6Tf1BFBViAp31c5G9AYI5LCjtHntxYETDVN4dxc88Rm23qNkj25IUAdjKRj6HlVk@lists.linux.dev
X-Gm-Message-State: AOJu0YwFZZJNeSUslLPHQ5V26tOnzw93deob10fNR5ocr7xLGNXH0NYm
	SQN9hR//tn9X5dC8jhaEFP+EHru8XsMC6rRMOmdkPU0WWy1sE7i8f1JD
X-Gm-Gg: AeBDieuZwkcp4qnVoImFyuKCY9+FAJb9M5GAy8qPupYfIfPfuCjvVNcczcauJa52q+E
	q/ASfQvH6249sNC390x3nCrErqrwyvUyFU5ffwvpLrfuoab5qiP+Xh/tVRtkItgforqXPHvWb1z
	NJ4ybmhZZSte1Zk4vnesuPpB2jT6hGYIoq+yVJnFlhnMzPjCt0FJip1I/2dlkzmQQGjdAkZIyAM
	xUeHMBszC7OiNkp+oB1RW+wEdnWzSM17HlML9yq/dxGK9Q3Zs3w06dsph9WErXUOsBgO8ekNl2c
	Ur4Mvuwr6rpiOVqRc+MgB4vhjOJiUX68lHDyECkFM5LxBs9AJDILauIBYNFr0yAKi+19R6hWino
	lEHG+lNeTgfrvkpwl2q6ccnD+nXgc4XL/LuE7KxMx5nEwpIPDDSjzEFz3hK9G0wcb4gtljGezI6
	cA5YUgTrsLZJ7PkXrfTUzavGqJeKNFKw+FHzGfcG7hProEX8SMjq3PJF1v691W6BmvD9q5Go5J5
	0eo5KowJx6r7eGR282jTPl51Q==
X-Received: by 2002:a17:902:8649:b0:2b4:65ab:57cd with SMTP id d9443c01a7336-2b5f9fbdd39mr296814685ad.36.1777201228981;
        Sun, 26 Apr 2026 04:00:28 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa2f129sm256667235ad.29.2026.04.26.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 04:00:26 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	fujita.tomonori@gmail.com,
	viresh.kumar@linaro.org,
	prafulrai522@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	tamird@kernel.org,
	mark.rutland@arm.com,
	mkchauras@gmail.com,
	lyude@redhat.com,
	lina+kernel@asahilina.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V15 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Sun, 26 Apr 2026 16:29:28 +0530
Message-ID: <20260426105932.2270364-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426105932.2270364-1-mkchauras@gmail.com>
References: <20260426105932.2270364-1-mkchauras@gmail.com>
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

