Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B776745BEB
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 11:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515349; cv=none; b=YDdcno9BXve7fw8EjjMpAlLIGCHFrCLGfF2DGiKHi/MAOISAPfgpTtJTloYFVZX+PZ92aPHrOBbOTMsg3YfX8J9o2rkaY857c9rK7UCQfX+UhahNysC5J4FeCC4/c0hUtq1hEUR0uan0m8dYJt8jc+CZcrB8PGchSfnqDAdqObM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515349; c=relaxed/simple;
	bh=GAlPtq8JkQJ3A2WVw8c46QbR1WtxNjQfx1w8AVpPTjc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kzMTYKZnkG+1bJho1PtFODPzrkZvK7v8IqtjjpoVROoba2R9VDyLoqDe+Za0DG4ZGA1Zprecyc/POp2uXgeoaCRZMW5y1shI65L0Kc3ZUeLO8Vlkkd2AMaNNx6nqHqBiUuOzzgTHx7W8gA3hVcWbOJhFN7xZUEj+4T+N4VeI4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uy0MXehQ; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uy0MXehQ"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6082ad43ca1so52451637b3.2
        for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708515347; x=1709120147; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mh8YQtdjDFBeR5IIfvtfOkH3iYneTElPPQWzRP3dQ5U=;
        b=Uy0MXehQJMKihn33j7NEqn6VEI8/DzzeAkGj5oiZT7sGhchGKW4FYfJb5l+MidZTC5
         7zGHM5XMW0UP9Jc9I0j4/J7wDSjNoBfTzWU/Ha6zotvoMuRItG48n+KpFhDeFXHu3lpv
         tgvEJZ+fYqPr4yEwQnGJhdfZtifAWWbGu9D6TkOW3Tl0t0zToiACaMEMBTq1aUvQS3dj
         uebRloRl3ukj6I6WPAXpLDxUQegt7qx7yOWmkrp/POoNueZv3qpP56R1cyDlAZfVPlkR
         Wpb+kpwuYagJEXo+KDJwXzE9r19cbB0rkphzI+cV7tuzc0uLlaKEQoRb2HFhJw3EuZsi
         LeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515347; x=1709120147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mh8YQtdjDFBeR5IIfvtfOkH3iYneTElPPQWzRP3dQ5U=;
        b=pEXqL2mzYkEBp2rPUCpKN2Bxtysg5vLXUQsBuTRJvu5xf497lMly+H22a79oFYhlPi
         5BTaRuE3sv+MxOp87KFxFJiezGpLRe1ZSKJKZVa6voVisx4NwNS5F4CZjXNA+bQdCO2a
         /NEILlIUWFpvM/xNABCUMxeY0saL5IOmLTyYSKlGVpLOBuG7VvBEkdn87GprIzfdWYnH
         CRMmYLg2WdbBy+XVP4T6Dv2g0VHkvNP0X5fkV+KBIswc1pSY6Wn8hpDhEBZX5PJ9Yv9T
         hWcIinlRNAsGdVNbr0ngqLQIY0bHc+Fh/3e5my696dyaAZKwnsj9X4DdBoYMqpFROain
         23Ww==
X-Forwarded-Encrypted: i=1; AJvYcCXRfnifHgWGflt43fQaoIz/QvYtp65bgOqShGrY6FpjWVSl3TzEszNADZdDzCXuRtgdyvpaNE140rZjP4t0NQT9EgTp4Q==
X-Gm-Message-State: AOJu0Yzwx5/tmq1iDJksrk2L7s+do1waPClD7LZhFrw/adWtYAmR9jyw
	PsjNrJ6JZw6nW7z82cxxp4QKeqlMb/MszARfxzAwnWKjAaRAR7+hxvItWM4VadgPYRT03A==
X-Google-Smtp-Source: AGHT+IG0fEnqGUG8+oiRHZDhntx0M4FmHH2tN93YTFeHU2r24HPHbQJjdVqv46rLLzginl6PjhXpfFFp
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a0d:e6c5:0:b0:608:801a:e66e with SMTP id
 p188-20020a0de6c5000000b00608801ae66emr232627ywe.3.1708515346559; Wed, 21 Feb
 2024 03:35:46 -0800 (PST)
Date: Wed, 21 Feb 2024 12:35:12 +0100
In-Reply-To: <20240221113506.2565718-18-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221113506.2565718-18-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1582; i=ardb@kernel.org;
 h=from:subject; bh=cvzedKkAgUYV71bwW+wRLG9NvEsRD1LqBxLDjio6avo=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfXq/XcfP02y/sG1PGlJDc9qpSi1Q69MXf6u41urqrbMb
 sH7yR81OkpZGMQ4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEJmxi+B/G7rLguUZMl3+R
 0vtNEibBlX9ZVJt10g8o/TM9Ily2zY2RYZFpSYf4SxEfXrMP20O46g6+2tbuk+T93lr0pKL5u+8 PGQA=
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221113506.2565718-23-ardb+git@google.com>
Subject: [PATCH v5 05/16] x86/startup_64: Use RIP_REL_REF() to access early
 page tables
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Kevin Loughlin <kevinloughlin@google.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Dionna Glaze <dionnaglaze@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <keescook@chromium.org>, Brian Gerst <brgerst@gmail.com>, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The early statically allocated page tables are populated from code that
executes from a 1:1 mapping so it cannot use plain accesses from C.
Replace the use of fixup_pointer() with RIP_REL_REF(), which is better
and simpler.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head64.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index e2573ddae32f..7e2c9b581d58 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -215,13 +215,11 @@ unsigned long __head __startup_64(unsigned long physaddr,
 		p4d[511] += load_delta;
 	}
 
-	pud = fixup_pointer(level3_kernel_pgt, physaddr);
-	pud[510] += load_delta;
-	pud[511] += load_delta;
+	RIP_REL_REF(level3_kernel_pgt)[PTRS_PER_PUD - 2].pud += load_delta;
+	RIP_REL_REF(level3_kernel_pgt)[PTRS_PER_PUD - 1].pud += load_delta;
 
-	pmd = fixup_pointer(level2_fixmap_pgt, physaddr);
 	for (i = FIXMAP_PMD_TOP; i > FIXMAP_PMD_TOP - FIXMAP_PMD_NUM; i--)
-		pmd[i] += load_delta;
+		RIP_REL_REF(level2_fixmap_pgt)[i].pmd += load_delta;
 
 	/*
 	 * Set up the identity mapping for the switchover.  These
@@ -284,7 +282,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	 * error, causing the BIOS to halt the system.
 	 */
 
-	pmd = fixup_pointer(level2_kernel_pgt, physaddr);
+	pmd = &RIP_REL_REF(level2_kernel_pgt)->pmd;
 
 	/* invalidate pages before the kernel image */
 	for (i = 0; i < pmd_index((unsigned long)_text); i++)
-- 
2.44.0.rc0.258.g7320e95886-goog

