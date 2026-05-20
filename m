Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833552772E
	for <llvm@lists.linux.dev>; Wed, 20 May 2026 06:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259648; cv=none; b=XqWYLOgkf1xGO3pyxk2911A8HquBG1sH9hEavVcyTP4j1rilw9nMVbkfnIqx+m5asjn6EvCXDobijZjDlW+Z6UpxLFAuxrToQIYFJDuUXou41Sgf/nA/1xG0LB3ox+u2t0KYLTBHCvX7+qF2c8YMbTY3rH8Xlog1ecojq+7HeSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259648; c=relaxed/simple;
	bh=K6MUpZgy5eBIAUkcIRYa1Whzr02Heqs2j5+IBpUoWqc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EvBuQLQDqnRfB4RXGcag9g/Psk0HsfTv0F4hHakBJDYOfLJ0pP+XnB4dvwJOtOBAQbKWLZjUfSEWCbQkfGW4fygvI/G2GLL+pPqjqxKyJ+gvjCnDJkaY85FWrzOxdzRIzM0tJLrkUSnT45NcaVOn47Hzj//G3UvUqsBflmuYVVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbGWWtGN; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbGWWtGN"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3660ab73adbso3135497a91.1
        for <llvm@lists.linux.dev>; Tue, 19 May 2026 23:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779259646; x=1779864446; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cHgHzHWAoKXE2eMaeg8MSzma23SMwAsMBQx7k/VOAI=;
        b=WbGWWtGN71D/0R6aPm69FzIy5FcizSCaN8s85raWn6/0EoqPhMMUcTRV92XvGh9NAr
         g61yneFNQDTdSsOjAIlkP0dqqWN+hhUTNjm31b3MICL45I27YkGm9NtO3OYuClnuyezW
         u746025Petv4SKVLo6zw1bkwubAkQ+F01PpEQYbcbJnUIGWtQpZ+r47bm08DZVAvyFKU
         LTP+ctUhQbfNlLTiu+RY+xMdvQLG77zsJuSaBokZEsuCVhfv2jw9CCAxkIoDpBMvA6Y9
         UAFmVCD5YSXWOzWGIQ7TvvcVtmwEfcVBn6F4r2BzB28WWxLlhHxlHFuG+LahY+FsmZmc
         f2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779259646; x=1779864446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1cHgHzHWAoKXE2eMaeg8MSzma23SMwAsMBQx7k/VOAI=;
        b=YK6G/oNDfA2u/8F8hCVeuJmd9BZTecXXW8I3vqy3dYqs6pa1SY8gAQ8+53lYzxSA28
         1VXOG7ssGwcqZNmh6KpXLHlz2sHsr2+p7wljq4ByZaukwIdG7khzD5q/IEIVeijIJ+1V
         VCay+cwAVmzfq3p60fVqEAZFsIQhfe0SGVJ+yA7iclA3YmuMR52S+FjoMZMLfN6AMEf0
         1/yVC9OQNws+S921bzdEmpsZfhfwhsvGILk1tfhm0kE6gUOOMeKbNjGwA/TifGMWTDvB
         QGtsHg1aloCD3SHQKOP7ZbUS+8LrY34qLj0EuuPzDyz6Yn28oT6O7t1lp0mKgE9sya9s
         yT5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/xFH1GeW99KUe+P4aHr159V7R9SG/iGkgXvsCjiaZ/kdJCkpUW/NcyITTJFWl+jbeNE63B@lists.linux.dev
X-Gm-Message-State: AOJu0YzBh9YzMnq2fX1PGCm9la9vZrF3XBQv97IDOjO1Q1kGRoT3C1ck
	iiweJ2Nmjj1easS1cgKoMfIqzVMOM6shfctSiKmvttPDLEZ+4UZtZlOt
X-Gm-Gg: Acq92OH5OosMY1FVsWvHSrnIxJ0Kez7FZBmcaP7QqXS6NISZb3z3esCTmLs8KWqThHP
	qJdwfZSPg53oS+CDWXIX6IXfTowUyPfkC/XkS0mdFmxCJKlwVIniGmNPmU3wal7zyWsow9rbBQz
	q10sKx3VA8v/NYW7Gh4IIACIGJ7fj8+e+DoD8QZLuX8nFmJ1hFCBtCnucFFU91Zbivfby4xdHrL
	k8vvpZZ8rAKgvgvkru/P2OhT3h+gKu8eWpEJ9QJtNXhZ9prnR+MxIESQrATQnNEpnKnOiG7Yf/G
	4erE7hiiwWJnN7zlEPk0A4IIP7kHpT6CVSJycitbrT4AUckcoIEOaWpnjcThClML4av9KdiJqUR
	fgKnJKwCZv4zx2tK/43ATFAOTlrHurDAJFwPpQoO0oHapZz0CZsZMDqZQSHVnFDRehfFlI1tA23
	RSHuHiZZoASqTRJBTYK6vczmI8a8sQVH+k0Lrh4zHgQ/HtFjBNVaxG7N+jto7aXYCtVZ4IPEZRK
	Z5K
X-Received: by 2002:a17:90a:f10:b0:369:7944:d723 with SMTP id 98e67ed59e1d1-3697944defbmr7347179a91.4.1779259645871;
        Tue, 19 May 2026 23:47:25 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3695a0e93e0sm6069970a91.10.2026.05.19.23.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:47:25 -0700 (PDT)
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
	acourbot@nvidia.com,
	fujita.tomonori@gmail.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	tamird@kernel.org,
	kees@kernel.org,
	mkchauras@gmail.com,
	lyude@redhat.com,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V16 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Wed, 20 May 2026 12:16:25 +0530
Message-ID: <20260520064630.1785283-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520064630.1785283-1-mkchauras@gmail.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
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
2.54.0

