Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36381C8616
	for <llvm@lists.linux.dev>; Thu, 29 May 2025 07:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748504116; cv=none; b=sxaNhATyMYNkxUMQpsJR4YdaRWVZhbdLxbgXmqhtogm7VsL9g15U00ZqHLh5IbKfgec4neMFhic0NQd5FTg4ApvUrMUYrlqZFQN6ECtC2w/+IFDuuR0qT6rY3DJI4GBEnd8gUOmTFUW6coHSLeA4fna1pg6ZdQYoj4lA3YjXDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748504116; c=relaxed/simple;
	bh=FxiGK0m4sF+Iy0qaP75FOEtroibjZfeuWs5XT7JobEk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=D95mZ2bH4yKfn6vz/5zytVibh/seGGUg3hd5r8ad/sqsarh3kC2k0nE/Vfs8ZNs4Gp1bXyxgFRrn2faOR8R5OvXn6YNGlHbzLuacP1npE3kQnGwoGaAXsqf2DTphoCWnG8I+2jlPctpPG0XI12zB9jPXny4ts5yivYmOuUB6bXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vvqv+3R3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vvqv+3R3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-441c122fa56so3103205e9.2
        for <llvm@lists.linux.dev>; Thu, 29 May 2025 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748504113; x=1749108913; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lcQZPNOwVritWIDtMp41b7bB5T4gHCJ575UDlNYCGTU=;
        b=vvqv+3R3MkOlu0hy45rA/xY3lu084pn9begzRJFXvwUTTGUkGav6+CbAt+6MQPCI7O
         ACrjL1EWVErbhnwv2wUgnKnqnufpBROkwann4cVejblRW5zm4XTE093iCDoASeHVFSpa
         +CaS4lo9n2RZIa5KmT32a4lVISkQizzjErEbUZ4QAuhjGEfOL0GA6ufcrgWbkA85sE9P
         ve5zvgCoe0q3u4LK7bX5OwLakH7hQDcFPRaK9YL0pyrhj3QG/mYl8TDH2Rai0an/LUZw
         QLC/fDdHo1PU2Sl54EGL6OqBp2jT7Wyf41jrl5uypqNh+4seZkGlI1bnThFQY8m1m14H
         HJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748504113; x=1749108913;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lcQZPNOwVritWIDtMp41b7bB5T4gHCJ575UDlNYCGTU=;
        b=kb9i9jmUyx2nTb+rfr1ClbC6tIBXUXuswKGtJvDa9hG9NGT0Jwl6FBEKRh5A1/vTLo
         re20CbChQ1poMQcrwQcmnbgHFl7kZTxDuNfozXMYRh9UEvF45dttl55iMj4qOmlRgem8
         ydW3kbu/EQc/yp8aFPMtxDY+of8C8sUkdZEj81NOQCd1bNE0qpVtp+pdNrnrfFUhPR0D
         xg8/fwsPrbzqLZsrZT449Dy5YefWYoVnrfJ5XV+dI0h3yGUv3fMKoeAGhhv5mvMAtkqP
         JkRKAGf3bVga+7PoakoojbN5EZdcqmxdgdKgrNDVzxR4nL2ASjg0VxzPkowP/jFMsAO+
         Xw4A==
X-Gm-Message-State: AOJu0YySCFW2BgJPr4N9X8sRo/L2q6zU/5ukmj08+lDsYgLpJSTM+O0B
	NZDyICoAa/NLmB48LTTLNfdOEY8uzvN7lHLv+64Swb759VJUkqm86dFMlpMvA/TUQPcZ62rDqw=
	=
X-Google-Smtp-Source: AGHT+IEjieu1PVP6lrScJ37wIH5pXuxZNzIy4/yXl2IhlnKgrGkcAzIB+hUnC+Uf0+4+b4ccTu67Tb52
X-Received: from wrbgz6.prod.google.com ([2002:a05:6000:4806:b0:3a3:62c7:3b9b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:430a:b0:3a4:e6e4:6ee7
 with SMTP id ffacd0b85a97d-3a4f35e1c93mr941938f8f.45.1748504113015; Thu, 29
 May 2025 00:35:13 -0700 (PDT)
Date: Thu, 29 May 2025 09:35:08 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=ardb@kernel.org;
 h=from:subject; bh=H0IRuCkh1pL6XzUoM1zoycMKPDG3rt06UIiGp6YYXNM=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIcOCT+eV/PQbb3Y++uR4799xfrUfRzZNiU+7XO/WWWp0d
 8/fkxOEOkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEBK0Z/vArbN31x7K9yT7k
 bpuPGof5t4qK/96T/HY2X4j6tcGa5RAjw3e1WIdvL0sM/Lcc/5fEaTU7Yu2zFQf2S7cz7lrX6JI 3lQsA
X-Mailer: git-send-email 2.49.0.1238.gf8c92423fb-goog
Message-ID: <20250529073507.2984959-2-ardb+git@google.com>
Subject: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, will@kernel.org, 
	catalin.marinas@arm.com, nathan@kernel.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

It turns out that the way LLD handles ASSERT()s in the linker script can
result in spurious failures, so disable them for the newly introduced
BSS symbol export checks.

Link: https://github.com/ClangBuiltLinux/linux/issues/2094
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/kernel/image-vars.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
index c5266430284b..86f088a16147 100644
--- a/arch/arm64/kernel/image-vars.h
+++ b/arch/arm64/kernel/image-vars.h
@@ -10,6 +10,10 @@
 #error This file should only be included in vmlinux.lds.S
 #endif
 
+#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
+#define ASSERT(...)
+#endif
+
 #define PI_EXPORT_SYM(sym)		\
 	__PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
 #define __PI_EXPORT_SYM(sym, pisym, msg)\
@@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
 _kernel_codesize = ABSOLUTE(__inittext_end - _text);
 #endif
 
+#undef ASSERT
+
 #endif /* __ARM64_KERNEL_IMAGE_VARS_H */
-- 
2.49.0.1238.gf8c92423fb-goog

