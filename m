Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F7E401A38
	for <llvm@lists.linux.dev>; Wed,  8 Jul 2026 08:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499153; cv=none; b=cm/2l3Tt6f2+lB9fwGrpP7wD4UHciv9vSYoNm5thnDk3geElbwUAGFHQOhpbRf9lyPjOKoxc0zgomDkVsAC/tG1Wm8Ng5rL7G84PsUeZbjx8pef0GDCZumf7j+Fvy+tmr29ZPhYixnh5pyI4/xe7MIru3eSlqDkMO/yAvPrmX6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499153; c=relaxed/simple;
	bh=jsGopDHOfXXkIl6WT5aY2aPVGfW1NHdrHUQMy1rh4mU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o04YGNmqVatbk/HrKjeoNYiGVneWPkO7EimssijJAACC9kUrWST1hvVG99yTOuBLVTnvJBdZ52GAmiux5tl2PvNJ5DQd/CvwZHXv7gnJ95gVVx5HxM6n8jWCU1cbHJipqbFGEVsKuottPv4/Y6iqjEF+r7fvS+WpEe3wS7KmS9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kuny4adt; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kuny4adt"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca1328b8584so308250a12.1
        for <llvm@lists.linux.dev>; Wed, 08 Jul 2026 01:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783499148; x=1784103948; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IU8cHdVeDTqUeczB1eq13oLH6Kg182LaK9ECFYg1DHk=;
        b=kuny4adtGG4YFBHx6qoiNGAXiDPqUWKasDiWP1s5Kkcg80eEXiGGkO1eweL883KrtB
         QPtM+SSYksxw+LjW4dfKNEf6XOMcIjJMJ1Byh9ezVGru8xX7LQ2kXKsI76zbdYzU0QO+
         361OMd6QkGPjxAOugb354muMqvmh3LrVbBtCNZLmPHY5qaex/GQcT+SxCn/YXhJSx0xz
         NbnRu1TeHZAQfe2gn4+cQnPuYXf1zL3oywcDvhm/qaI0Oroq7k/g+9R2esY21JxE3wYO
         gDiQIFlT3BQOulfyuSuHYfRXke8aLTlkGwzK61Hzi1RZirtCmiutMq6pUbYmSNKvSa9m
         dlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499148; x=1784103948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IU8cHdVeDTqUeczB1eq13oLH6Kg182LaK9ECFYg1DHk=;
        b=n3I5dYl+G1+aoeLVfn6EDh70Ldx1eyGyQFJTiwm++aUTLszwWDIJlMbZRqKy5hKt/H
         ANBmgnppML2mmysbPj2LqlvkksemQwcw6l0tBBEuS7NDL444JqcgPTvSqqPXopMZPqK0
         CdO5Vj/kD7lrWjg5HzchAa5ckwmv1OVVDvvwctrdPC48RKicK34h7glZTS7qSL/1/E9l
         oskz+hlPmVQrCX2NrARdG8TthVzGqudrWZLDzDaPDGINNlBl37dsPyEXWMTIUA7/jlau
         eml1Xwqtz72gZXgUbNhmtLR5zHc5KWlVpJMxFGcVMy97XElgwu2tF30ykVhe4vkYzxr5
         FPig==
X-Forwarded-Encrypted: i=1; AHgh+RpdXqMprsIxJNsDG9JrcfCSjICiArdnZcDu1ME7eLUIh1MDxM2RkqF4lw0hX1LpuER1g79B@lists.linux.dev
X-Gm-Message-State: AOJu0YwjYBt6dfpwbHKycepnfmUCv3oqHx2dgTEm9kQwXs/S5Pa8GG63
	MpzLYdS0etzRI7np5o4DkwtgkagZw7qwq0VCintC84vtg/0lZjTLGhja
X-Gm-Gg: AfdE7cmHPoquvEDkSlMlZXeHGebLOJUVRQVK8W+RpAx4vt40YnbgdyFA2VB2xQsvyMX
	CAoVFJw8fuN9kS07CJ2A8rmThr6INNubnCbxdyV0IaDHxRELnIdQToV6PfKe+yYAol+Chr5qW/5
	jLuui8xj6ksnmj/YVijFKfcOmqcu5AnIqlWUAsa8zA/P1ebhCnjfxvtga4MjOOr1byA2D9qk1eI
	QzzEgJY3bTVcy3Oa9DV8F6iLSxdSRahuCKPZc3GjnwrWmfw6vLlHqPAI+NrGMzFahmr1KLHwrZd
	+9AGhLxP3OITxTCtAg1uTOPCVFQknQzBxIiSp4kfemZS9dphh6w4XoyaGIWDFr6H9DRKmwiwwQo
	xTcvwh/ITq5kR//hRQZPq8SbuaLYYYIqK2IblXF0+XCvNLGgSGRt579jT9Jhpy3j/VWmh9uk1Ok
	9dpyOPiwA7ZLYf95MGwiGLnU7ZLph1KMlcOUm2ecXI2rvjDn3JtTp+keBOd1un/EDJCceYkI6In
	U3s
X-Received: by 2002:a05:6a20:4308:b0:3c0:9c19:65c3 with SMTP id adf61e73a8af0-3c0bcd26715mr1623869637.75.1783499147997;
        Wed, 08 Jul 2026 01:25:47 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3117462f5c7sm19975117eec.0.2026.07.08.01.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:25:47 -0700 (PDT)
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
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	fujita.tomonori@gmail.com,
	joelagnelf@nvidia.com,
	gregkh@linuxfoundation.org,
	prafulrai522@gmail.com,
	nsc@kernel.org,
	japo@linux.ibm.com,
	mkchauras@gmail.com,
	lina+kernel@asahilina.net,
	j@jannau.net,
	airlied@gmail.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V17 3/7] powerpc/jump_label: adjust inline asm to be consistent
Date: Wed,  8 Jul 2026 13:54:50 +0530
Message-ID: <20260708082454.1254320-4-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708082454.1254320-1-mkchauras@gmail.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
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
2.55.0

