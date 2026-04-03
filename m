Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117AD39FCD1
	for <llvm@lists.linux.dev>; Fri,  3 Apr 2026 14:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228024; cv=none; b=ee+/LngsORUrH/kvupZ7JXUizLCijY1nVFBTigSSx9mQyI1Wb9PgtEiRlfPM3aaBehATUXwqYN4jc+MzVdbzGIQmxirLaRnJZJhZzHZlhx5qYxL7vaGyfXfzN1jBy6wchwjEkqi63zeUsFZmG6vGfNARtBaT4C+cRphR7zCfaIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228024; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdPVnlSL1DFte4C6JXuzzsLNHF/WDdc7+MPtNKuxosQbq82FZr7jTCl5scnGwpri/UoagNZqRucH05qmJjg7T+kev+k2AOSe+6CqXoccbE/7B0WrxrTSW6yCVn9HSic454l1CT0SHc++FOIRjX3u6GL+ToxZdBSC3zMo0OsglQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nv425s8D; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nv425s8D"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824c9da9928so1197118b3a.3
        for <llvm@lists.linux.dev>; Fri, 03 Apr 2026 07:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775228022; x=1775832822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=nv425s8DQszNl9of3YYSWXgHEQMucNp3G7KglyVOxNgTiPnRC+x5kK3xlIVUAWDqkc
         0IuoVcdkG8ILuXUXTfFK3hVZ3846bRQU2XspDi5FfJTBcCORjMNv29GXOUcR2yxHQohM
         Pt99VlNT5PinuApi0kJJ+Zz4j2AtAJlwr01K6+Ywa67QndQQQq/rX/kMH7UlASJ3QLsk
         d3z3ytwD7D4gouvCeDgCgqoZxvtxeNa6Z+erszwa8x7/aAawREWduSB+/bYuXQO1sZqS
         IfioyqVoZNKwRV9EKo9EJCneJ4ltbLgR9CqYitPU73odiSrdX/yFxB5gZpnTZIayWWq/
         hJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228022; x=1775832822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=j94n1+mzVLg0bl9mRxDyWpVS+LulCwsL4gLizZPGlBgZ7ly7AjBWKe1lZZjZ0lNCdn
         uYvUH9huwvS35vAece3sXWOTBdjvIzKz+M4VLNAm2qrvw5sFmrBZ0WuLsEXKLspaa7a7
         c5gPaZEE+fH23l/ODZWORKNYi6cyVG7C3g1VkcHMrYDR84X0s/iBZytVpKgrCbDZcV1p
         lSJ3BgHoaDc/BOwUaSSc2MPzxIlkPx3hzz36RNMuhv/E5WEHcMskmmelzcjO33Df6Jwe
         sCMFqBlEhwjrCkba8ahWKzklkhgA26XgFa7qlqU0C/1P8YtNHlaKj2jrwJYFvhtQSU26
         Qvtw==
X-Forwarded-Encrypted: i=1; AJvYcCWLKanvQ43IjDJRBVk9iiBGB42ONaMESLY9XixlRFVVlOnFC4LD0VgoonRvLc4AVHAW19zV@lists.linux.dev
X-Gm-Message-State: AOJu0Yy28ukoG3+/DbZj51AOzujdn7Otz8UEuhTk3nw79hRoGGTDy+WM
	BJkX4MOQz04TgFcu8xm/Xl+BEmSh1KG8fXY88MAmT5Zcb09q69wNlyS0
X-Gm-Gg: ATEYQzx7mtEPianmj46GxSrO9X7smInLwSwDMe4iCeyNfszDNa0MIqlgLDWD6tGeohi
	fnCOI3BZU24/0UZws42LLFMKKxHiFxvJfet5s1ZqAF8AWOZX9km+B7W/RwtcHDhelmSBj2v0WEs
	NN8KpupIHogMKzMkVeZudW0QzdJQXm0w+5dX6t7As3RMvCBwVzWBJEiK8IOFWXqKA2TO/kcd7WX
	wFQaEHy91D1pL9x4Q3AIYevmJWPqru4nG/0hHmhYipPWGd8Jcr1G/uwPx4DPEPwyRTmRC4e5rhV
	MCLQ2dLDaZ8yo/yHNRRNU+c/RJxF8nvvJWmphoAy7T0NT/9oHOWWyCzqfEQNklnd7IedGT3ln6D
	RwyHDNphsxRvDn7LkR5rEBBxx7xpjjCPXeD0zG3qtX9OYj52h0MBXJN3NbBYurvUvgg56TuqenA
	HKmy/3EqE2GrJKNmIdCM8PlU/NRX5PekueXNrfkJiUJ7y8LzdHYJWXkDPZ0nyaFrw9d5HkO78ZZ
	sk=
X-Received: by 2002:a05:6a00:414c:b0:82c:fe17:5af5 with SMTP id d2e1a72fcca58-82d0db96d9emr2983355b3a.44.1775228022326;
        Fri, 03 Apr 2026 07:53:42 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm6301682b3a.61.2026.04.03.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:53:41 -0700 (PDT)
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
Subject: [PATCH V8 2/4] powerpc/jump_label: adjust inline asm to be consistent
Date: Fri,  3 Apr 2026 20:23:06 +0530
Message-ID: <20260403145308.1042622-3-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403145308.1042622-1-mkchauras@gmail.com>
References: <20260403145308.1042622-1-mkchauras@gmail.com>
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

