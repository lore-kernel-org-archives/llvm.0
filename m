Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5A039021D
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785257608; cv=none; b=jfgNkrWUJx2BwXWJ/VLxyXrvsQz/1D9b+jdcD4oMgJwOwHZrQv3k8waXodH1c410YX52PScB9fWJ1z7ricreWFvaoUk3jKCRr9ovsSwv2lJHAh4UBTULLKPewo7pqS6cKF9EXT8o/PZ+HUb+T4Z0yE6XkDOsJWn06MFaNcRXPvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785257608; c=relaxed/simple;
	bh=kTJ8PG13VccAf/UnFEdjF6pIKkjG29SPsjujryYhJgo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJbxHHxgbicGa09OoCCWW9aIZPBAmleYMY2dqF0yjTbbbAj3NIahiQ5jUdFNv5kuU9AN5Z+4JVrPeMpt9BTCfNAHtRt3A6MlDuwmYL9lQYeIdqQv8qiVkiztusiWqyma75qBzTwfWPo6OFdCzAhlFkqfBMpcqUcP/TPI/BB7qCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2U6k4Qv; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2U6k4Qv"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38511175ad3so21774a91.2
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 09:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785257606; x=1785862406; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhYWZOa0HkN7WiWXxoj866N4nnOOceoPTUkPqNFCddo=;
        b=G2U6k4QvFqiDZuh/qcs9dX2rvj8FA8h7E/PIFTPMitcrwnVsuryeMhyTJf0WhTkv9A
         NofKKx14rUEel3dGKd5++nbIuVTGn69C+kw8DAENqBcYGTya4LcC51tB2yj1iTDCCWcc
         yZbL2cTKd4gpG3z2WlCFEapENCGIUv9y2Mvmzd4wlCU8HZgXNJceArmDp660ySasee+Q
         DDCerQkD+oPwXgu1MVkMtFgjrMCq9TDlBVAeDzf0w8FulXxUajC0kb9RAhh5fabl7lOO
         BzKEV4AwePlS6kIbTYbR2EyUVsfKc65DXzg85za15fC3IcFNR60q6uB5IzF1Ruu32FpX
         u9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785257606; x=1785862406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhYWZOa0HkN7WiWXxoj866N4nnOOceoPTUkPqNFCddo=;
        b=ju+PHbGbptsNuowsCX3ytrPimBGPxHG0+obk0DSdUIXAcaynfHPOBsQCJWCeP+8h27
         1Ij/708f2OHC+DWUb4ExoUTl8Hx+YAZTvUABCLRkgcMP+aAHpH699A096pK9m6FJL5JG
         poxMMDUQ5h1tinw1/S61OqBrgNmmbNUqEp3jEKPcE5J2JKOYd81j5gMpLgmvwLX1VDfr
         pT44YDMhIICA7YVCgwXbntQfQwTQ/1uvN8Htae0JgIjeTVNKl7Dh+fIo2OvY11BDO1Gq
         DyZ/I/FE1S+xcGN6jGIRu3+9+jftPgq2A6Ev7ENHlTFyphJZzXA9cv0QtLA06cH+WN3R
         krvg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/wvC2kpwtVYve+1KxImT/etkWxSMkXxYrgGE8594lIKgV42ye+NjH6bJk5c/wIW+zJTaf@lists.linux.dev
X-Gm-Message-State: AOJu0YxogaVzOQvQcWFh884zUxC/DhFd4sHOBmOM6C++Iggb01nADCGH
	kY6I4gq1CDPCREuWFX0MQaywwEks3ZL7Mfpsp/9YKBw+tmKAcJv0lI8y
X-Gm-Gg: AR+sD1166S4h+HVxeRLSGIgWr6Ud5s6VBZzjukQfBRufdPVHeusKYvA4EhKLhXcZ6Lu
	0P4qsJy/xEX/hBO8/Ggnrl1rAAomDezP/19ndU9QR83RU7aBTu9Vfyb5B/wNkeYc93XHnFXq2aX
	K3rbdoEc1Vw+3Ep0j2/MW1LLAdw0XGiH3iDZy9I2E/3eYtOLfivI3C99124FSbj1I+8mcuQ//8h
	qqzpzwNDvzzBXFMBxLylgi/Bt0OBgZczMAdpF8m4Y2ADbugcJo++F8wjt2w6dy/NZVcEFHMu8+r
	nZlJL/rnDyiGSNb5tW18KYAu5ARDL+61uUDd2/op1QPiYZzQwOoJ4HxpeBwO3vLR3pYGnf3VdQ/
	j9812XIPcYvUgVjUCq3XzXNSzZZzGyDwPauVK/WFYEUVzz35ltNtjdIFBvHrkbl7XY6mcgsQYJi
	0EyEkhEDDyFpTyXz/XZlKFvMczvm/l62F3bvszET3Ig8ksw8GmGUozM0pPUhQ+WBQ3JEdPPopMh
	i5f+bBKgjCC86/5nhylaFwpKzjDfpCtEsbm0Uazrwqz8hc=
X-Received: by 2002:a17:90b:3886:b0:38e:8021:2ea9 with SMTP id 98e67ed59e1d1-38f6a36245dmr3663482a91.19.1785257606006;
        Tue, 28 Jul 2026 09:53:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:acc0:1306:9d5b:e192:4a0c:2079:ffb7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b15f77sm618980eec.4.2026.07.28.09.53.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 09:53:25 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] cfi: Ignore non-allocated module trap sections
Date: Tue, 28 Jul 2026 22:38:04 +0545
Message-ID: <20260728165304.56449-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rewrite_section_headers() initially sets sh_addr for every section to its
address in the temporary module image. Only SHF_ALLOC sections are later
copied to module memory and have sh_addr updated.

module_cfi_finalize() accepts any section named __kcfi_traps. A malformed
module can therefore leave mod->kcfi_traps pointing into the temporary
image, which is freed after loading. A later CFI trap would then scan freed
memory.

Require the trap section to be allocated before retaining its address.
Clang emits .kcfi_traps with SHF_ALLOC, so valid modules are unchanged.

Fixes: 89245600941e ("cfi: Switch to -fsanitize=kcfi")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 kernel/cfi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/cfi.c b/kernel/cfi.c
index 4dad04ead06c..3ee67b723ab4 100644
--- a/kernel/cfi.c
+++ b/kernel/cfi.c
@@ -74,7 +74,8 @@ void module_cfi_finalize(const Elf_Ehdr *hdr, const Elf_Shdr *sechdrs,
 	secstrings = (char *)hdr + sechdrs[hdr->e_shstrndx].sh_offset;
 
 	for (i = 1; i < hdr->e_shnum; i++) {
-		if (strcmp(secstrings + sechdrs[i].sh_name, "__kcfi_traps"))
+		if (strcmp(secstrings + sechdrs[i].sh_name, "__kcfi_traps") ||
+		    !(sechdrs[i].sh_flags & SHF_ALLOC))
 			continue;
 
 		mod->kcfi_traps = (s32 *)sechdrs[i].sh_addr;
-- 
2.51.2

