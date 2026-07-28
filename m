Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B503A9D9C
	for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 17:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261104; cv=none; b=A9tZTlbnsXoEbHuLP59Uu3tzKo5LlXCfeWSuS44ESBWDRFliMuX3EEFrLETR10N1r1x+qA1HQjbSY8E9dWiVN4BHWUVp8SiXBElL8uEusgSvm+6OeOMvecKyiNI60K9FAI/6J5rLmO6qoojynO9DNS573kdfmRMi6PIKypJ6R08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261104; c=relaxed/simple;
	bh=5EDgkKunk3EuSfc9T+Q1eBOxRVhrPV7cos5ouOKzp5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sd6/p1zgyn9rozLq9cLDO0xrCDV+pLVo0Cr4Ab5gy93IoV5N6yo3LMhQjxrNp+b36b6EexMDmOcP7LKO6tqSTU2tXNP2Y+K2wLuu0G1AFtU5cBNQSs3iqBFJGVIYyxhOsAbu6T+khdUjDmXq7K0BpmC/eS1ygPrFomdQb18KY4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsJCLlRD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsJCLlRD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc61541f8cso20630575ad.0
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785261102; x=1785865902; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8W8t5tftK1vDc1qsPICPRCSPFcmSyMyPg0AlpPcMPM=;
        b=gsJCLlRDhK4TDu5zIkEcoRGdAvwVfqWCuLYARHgcpi8WjOH8Dh74Pd7SzD7kMHzxCF
         W3BfhxLuFe0jZz9sG9594TyucwEswHuMYygL6Dy2EBQrRrVM8iB0wxS9FFHGXNrMNTtF
         m3htPIHc7I29F5rVR3QKkOK/OgW66B2Bf9EXum14AvTRxIwMSPk/s0QwSgNLHKUXRvw+
         Ed4wYE61YgurmMsy5F6Q+bqzF+lU9vdoCKigQdmb4y411YZ27i4CHVfaivbzWq6NN77k
         iRVyCOjvxEx+xvu84bkslRSGvkUW2etqPmbO6RzhGrUQAKGEeuWGMlWZc3JqPCzAoUWi
         Z/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785261102; x=1785865902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8W8t5tftK1vDc1qsPICPRCSPFcmSyMyPg0AlpPcMPM=;
        b=Ficz3h4CdyhH+HlL+3ri10VI8RKYmLDFceOBySd/C9c0NWB3N3NkoHfXnvLnHmgUls
         53/QnpOzQDjcIm1iQRT6QfIUZPxryWxjppObh3Pn49DwmHyC9r74g7sLibgErrjQQktR
         jJRQs7xCEK9/0CMKqvHgAxh3HlBgoyBfQgD0ZLfFgbRPj3bpwb4uMa237BAvSu3L0TvZ
         2Es5ep2Bd5CSpT5dA/ufbr2x8UkjiHVkzwcJiZU46E+T2COmYDvKbjSYlGjh1ME5jK7g
         OapKLlCzljC/DoJlPGUw6ft0Wm/idxvyLkLrnSACC0WbVJFkjFavyJPhXhxF6wWzrPcH
         mVig==
X-Forwarded-Encrypted: i=1; AHgh+RoM0x0Y7hVSrgCn9AsztTd5JsWpGQr3hF0LJgJmIHFMUj/HW8te3yWxyKMoNuiXD2iAjw6O@lists.linux.dev
X-Gm-Message-State: AOJu0YyPxyHyi4FXrtS2hWnW3H+kUzboSPIJ0ENJMtsrnr8Q/0jV+NsX
	DkW+H7cP80NC56gEJNGN7+pg5oM0+2LzrnCmmRXJiy5yAaXaki2eSSka
X-Gm-Gg: AR+sD12+1xwPINpRjTlGx7Rvhy38n2O8GlbiflFOz699qgeyXWE4/lC/bu097Er9atL
	6PPWdjwJZ5ZPQ7dJW1EBZRTxUo9ttpvC4NTJXYJKuqd6MQblRl89snjFnUjXZVtTV0mXYJx1bsi
	665vZaA9p6+vsisAv+FS6MNLO/u1l3j4/AjbHcb9f5j9auuEIxNxFQ70ob8PNrznM2ntqX+/T+l
	5wD0Cobe4kgVpbi+DazngBz92vMf12KJdZFqm6P7JtFjuYng4u5pu6VA/ZigxZ/16uKfmM8/ReN
	XwvpUvVPYYYzd681TFsMODb0dJOm7mX1l7JMTASKbXJG+a4z+L4Wj76Ylt3i1uQhtPoJE90nv69
	w1QAOntuKXezKiR+peY7qMTHu9Hjv10fU366hcaYpzoJcNj+Ax+knyhs1EFNZ62uAbOL1P/k9ck
	mm8nmzIRjr1/jlSKWAjCBudU2ec8RVooJJtlPZOfmD6jj4AwwyDV9cPjPAirtLU5KZfv20iR05l
	UnnmQEwYSl4UcsMI5we2oB5F9eaAcf4C4mc
X-Received: by 2002:a17:903:1848:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d015c9b78dmr40007835ad.10.1785261102038;
        Tue, 28 Jul 2026 10:51:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:acc0:1306:9d5b:e192:4a0c:2079:ffb7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc63fesm777040eec.15.2026.07.28.10.51.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Jul 2026 10:51:41 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: samitolvanen@google.com,
	kees@kernel.org
Cc: nathan@kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] cfi: Ignore non-allocated module trap sections
Date: Tue, 28 Jul 2026 23:36:34 +0545
Message-ID: <20260728175135.65578-1-acharyalaxman8848@gmail.com>
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
index 4dad04ead..3ee67b723 100644
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

