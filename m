Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D67A345731
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777009713; cv=none; b=PVajKJGv0SMrGxvrFoKM+sHD2QCTP6J8m1QrReSHbnXVlFJ6wS2isQBtg6ZLJqSTjoXGX1vuuux4H5KyjkpFEhDrXTWSYfJC9ZsZD+VksionPAqiaKpGEq0KI+VVqGP68QXS6rfY3F37WfgG3cy0JsLMjnfqKzI3l83bHyy115o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777009713; c=relaxed/simple;
	bh=8WQ7jEq8bJBsdnlHGUXrbWXnXrrr5Xxc2+zvN+1cF+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sdit5MdKtJhTXwxJptZ4WYUpBlz2dTykM3MTzxeMfylPjsJOjXb4rEv2159278pQI6GRiluL6GAmUN8yoCWUuA3rFPHXg5rPDy9JcT9U8HOgW/ZN6iaREUKcMRrp63TwDTGuqLbsQuLl02Vd4kkOjJ1MSurD5fjabJUWUzv5ywU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDGJfWTT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDGJfWTT"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b299b3c739so34536275ad.3
        for <llvm@lists.linux.dev>; Thu, 23 Apr 2026 22:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777009710; x=1777614510; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=HDGJfWTTUz2xeg3imGRpTGNQDNB1+qHZtb+aclYZ5BsIcIJYXrn/7ZDJzNBxnMdjnM
         pXW0gX93dpiW8+hsSQGLSDnm8lV2ofJaSWmnsdJQ7kqFc4zGPb0zic3AiAFa/U7ZKrCA
         74BocVfH2WLueZ4zAASiHO1kbe/CekVkSakhk2STWZcRDcM/G0707rei0y2DLCLV8m+h
         Nj3Z7meElycJoLXXigOYdfqME6lHxOgyTf3Crv5/IHvjE1Q0jeed4qZFJQ/uMHwNNlYy
         XyFTpYfneqz4xnZcEZ+m2u+8k/r8KwyS7AHffN55nCnRWPcN+c5eIf0mrBshy54WT5wx
         rb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777009710; x=1777614510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SIf376OZyXcpY0mdrIrP1nTWV/VE0v5g8114Fjjgl84=;
        b=CPUI+lazFXQQs/MX2IwLgVVOv+s3YZFsBbvTBGMdy9nmDziz1sMOqm1YvuhufsTNR8
         FDIAcUBETOezqJCDSrILJN1mLeDggJzMSxC8Ci+De0m+rZPHK2h3N+ZKr4jb/NlLlocF
         RQckIYOEBQYGppbyfhATLXa9q31XiqVp1YXmtF58fpxJ5YCI6wVeAoeZOhsi6GUXHsDW
         +9YsFBeKC3aSr0G7L0lKLpQA83aCuYNhiLvFPC05FeW+8qaQbNeexs0mN/FRo6Uz69vF
         jPT1u9MwiCx1NI0NyuH3Fcc9LA8B3zAUc6N1pt7o7ll1wvlV3ugdIfy8TD+f4teYfteN
         NWqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/LhwXrTg+jGUiSEbBPr6QWj/vGo/of6KZWTsjsPlItyBHO+yd5rtFebE/Xsj8e2v+J0IH@lists.linux.dev
X-Gm-Message-State: AOJu0YyOSVbiFaZaMrQC+4v8DVjmT0W+JPONnplMFMvt5J41+WtFAIgY
	zfqNkzhlx5po+6d6XqrU0BWRnyWr4DyNtRzYosqg+0ziW+Lnvi6fTcE8
X-Gm-Gg: AeBDieuyKbwgWW6s0HDlPHRvUd6eZmqgFrE/CQL2eipONaIsIZdtmQmSYGeGnB7ybkF
	gqAbdoj3F9GyzVe0juCW04AOhzo3KyZbvCzIBe1PcqD3xLg0K8gX+Z77K1DgKXZ9QEJvfuFGI2F
	Y39m0f2AoBsZZFIxi+jOqqvrwrDIW25cL05zqgREOzjRQBsAEiy/VTUi3H+HDlff5zOJvMCqUZm
	j7RZ9271rKa3ZHogpEERYxqTDNNqBh+9fs159gJtTPWLeMCu8590oEZO4IPcOFGsDVs8Jhg5prZ
	zPB6+WDVoaKPbLmq8oQsM0Dhdq/HJYe3ROEsA2R8Zl0V/l5SVHqGqlzxfDIwU7NUGPLTdmuNeuY
	C9211dkcjni9BcD9tVis36g5eI/dA8NqX2Tz8TXOZnnaeC5z596+kOlBnIzB61/H6OERYYlcaa5
	Je00wcCw/KCfjddkmvLfOEs+9hhUMdByrKtuHkZgZrLnOKYzLevD+y7bb1fJFoiNonGd8DQ2qvx
	xwb0UAB5JkrRYI=
X-Received: by 2002:a17:903:1a88:b0:2b2:5ec6:dcf6 with SMTP id d9443c01a7336-2b5f9e85f20mr310774475ad.8.1777009710516;
        Thu, 23 Apr 2026 22:48:30 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa176e9sm208778245ad.20.2026.04.23.22.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:48:30 -0700 (PDT)
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
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
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
	tamird@kernel.org,
	arnd@arndb.de,
	nsc@kernel.org,
	mkchauras@gmail.com,
	simona.vetter@ffwll.ch,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V13 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Fri, 24 Apr 2026 11:17:38 +0530
Message-ID: <20260424054742.45832-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424054742.45832-1-mkchauras@gmail.com>
References: <20260424054742.45832-1-mkchauras@gmail.com>
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

