Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8262C30BBAE
	for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777193901; cv=none; b=pYhT+7v/edGp+Qi9e8X6SUo6M7I1OCO4tjrksxGMjALsXViYnSydNPmbb5Gyg/2JML0mMZ0xS8u7xoNTJZz+HipTxXzibKJjTS2hQYZHk9xl8WBAux68gPHbZ4dAko1pnkjPJShGdZhBrScfnoDzWy28cEJR1QN8vOb+otsJ3yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777193901; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmIMbjbtQ732dohIaaVjGrwWY6S7Irujj4jsl8goUjyKb86ZKoJWt3ZvbhqpCB6bNboNthIarDvCA1Id6ZXeps+Rg/iPV5uXis6Z0/1hdbS1vCX03Yz+4/uMonTUqdZlYacMOYRi0aQodIuzckWVWbiPD2UBXSWs9GghPhdXoaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhBCJKWk; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhBCJKWk"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so6231087a91.0
        for <llvm@lists.linux.dev>; Sun, 26 Apr 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777193899; x=1777798699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=dhBCJKWkS5vX11xegGdMUcR9VO4hdEWg8iCL7l+nDtKP9u1U3XVr+F7ipogPie98ye
         AS36j7H9gJzWniC2CLq0Besjis8VkyL5+fmWYGptw7o2YUsEjur5yIeyVNz9wzHcPMAm
         nHZPeBiRGOXDakH2s0pskU/r1a3UKhl8QhVgAj+0HRwAwCJsDBpAtyIHQGuYu4w9j/Y0
         boHA4/qoJvA5mrn94XZ4fZR6wGYW3TlOXeoata8rYS9yIEa6xIQMgvx8JfCP4d5tJuTK
         +NZ+uSV8L156nza+J3u2eQ++//wF3PqpCTT+SfJy9GZYJNqdwIJWkJGzZlAlaWjKVYWN
         xz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777193899; x=1777798699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=OllkwnqND9EhI0q5Lxh/Ydune+fhLcDh5CEAvzQ4Gj+qlUl7PV0JrftSSOErWFAXYr
         pzRFrHs/qSk76iZnKLf2wRIIARkhiASu/ZPS/G9JXhHd34SCn79JuAHUdHW3vTFlHjD1
         jcl+XOjeW9vhzwHGH/58Q9ySYWndI6htmFJ7+KtFQJg0jZ5Im4EHtInevVDT8MpF8cu3
         TOF1aCeHuNzGTqnuFxHYU8npA1+Wdc8811FA7Jkm9f55h5KPvu9visKAg1VuDJUBPukr
         +ATORn2vUCSZRLrUldY8kR3EXUy5WG/kqYsD5slKTZl7aK5ydI+E+I7mTFS+oxNFNIbV
         Y35w==
X-Forwarded-Encrypted: i=1; AFNElJ+OPw7WEUrN45CEU52x+ViXtCTwMjHbx+zUjT1MudCB6yFLgD4f7+QRKtiRApT2DCXBmNGy@lists.linux.dev
X-Gm-Message-State: AOJu0YzaFtCyrCEUxa/17ap2p4bWwtvDwrJHQV/qd8K2VWOsDYpoU0zc
	qqIXbFg9FWeEXg8TiSO9Ibhr//3HOz+Xdz4JHKx2SxrjJH3Qm0ULBN84
X-Gm-Gg: AeBDies1cL4bJP34QuoszKzlmw/EoFF1VlLj1xOrhRpJKQsziH9NC7IYuY3dp79WGRL
	XQxHtsgHL6p+BiHtFiXEQeD0TyVrpBzdYyByFtbplbJ5FaqxqvFdFwKOY97cHvKPcdlodB3zBZ/
	yTVHTyk9b1HwqVBM6mqDF+Fz1/5K2jlWZ6K2aMbluiZwaQL8nyghW3ZomR1Tag1Lc9YUEPYGcYj
	845/ah3VVq/9csy8SVExBiGaTHBSSmWvWzkYCA5B+YMOX0Yeh742hHmKLiyb5Gbg3+tPDYiFiEI
	32+3I/UlHrStM/yPFISj1YBo2ZJ6bjJopvieFv6tClV/yCOczl6l8fCNgu++DFGPlg0l/QLw871
	7xGaa6/o1ZeWCq5VRO74a37JVa85mNWIy+1V9WwKQAozhJG0IDZo0+9vg+rYEuX9xyk2VNehhX7
	uSJXpe67/1GYnRdISSfakR064HsV6ZpwwgSwdMWBsvIplMtTd6MK5EWnMWHCNlGY/GYSuqsBZdW
	30w8IE0pwDeEyo=
X-Received: by 2002:a17:90b:3f47:b0:35f:b1ad:fded with SMTP id 98e67ed59e1d1-36140474686mr40098125a91.18.1777193899315;
        Sun, 26 Apr 2026 01:58:19 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141868906sm27718937a91.3.2026.04.26.01.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:58:18 -0700 (PDT)
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
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	j@jannau.net,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V14 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Sun, 26 Apr 2026 14:27:21 +0530
Message-ID: <20260426085725.2090827-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426085725.2090827-1-mkchauras@gmail.com>
References: <20260426085725.2090827-1-mkchauras@gmail.com>
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

