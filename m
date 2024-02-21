Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945C4C626
	for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 11:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708515346; cv=none; b=swT083VYcj4Bwg3Xmfn0b/wLHUG6O7t7ewMbbibB33ienf0uN3HoBvIdkjI3xZW+Vxdscx9DHm8ii6KoXlU7C1qLDbvDntDqY68+CSLPO8NBhlNNMaN4t9GeR05wEZeW32v6ulluoOMEfBGjzGSV1oWgVBMTGeMxPLh/PtJoYCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708515346; c=relaxed/simple;
	bh=6Y7B3eAU7WFGxIfJIx2em1X2j1KbkoJBGgvBRFQVJuk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c8LD3EkkvkdXMLxkwDH47Po0yzrl4zGUIjF6Sj2bL2wsY4ymC/xF/Ggna5A4xjdNX1dkYg0JgXUi1cD5vBkf2qBv4g6/nLRtVMZmHVDfAOcNrjFKgqmnhBOfV2cGFt+uJkN6ITWLkOr8uYnKcBDaipmyInbGSPjxOtKnrAuEqjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xWkv3PH7; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xWkv3PH7"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6088a755299so4077297b3.1
        for <llvm@lists.linux.dev>; Wed, 21 Feb 2024 03:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708515344; x=1709120144; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0rqzUwS6BdxGjI3H1JUFmWLh2DB/nlQLPYKogLCLbB8=;
        b=xWkv3PH7LLo6qR3zxEGImkoAXlkdjxaVKS1ybz27cQXEe26HdQpQFdnWn2iFoi2Hgm
         iKsq7/8d12cTf0iBZyMaqMG+CLzYnV9ig+4xmCqKU7AFCLXg2esh+GrFOQm75WHTHvPd
         bRnLEV+DLTpSAlDVB5dGczhY5jYsVsX8tDkj5ADQel8vIc7Rdbhm5FVJGjFp29c2T3Pf
         C10nObFqmo3Xref3OOsXzKcbMq8H4rahmAoLQhdnOQvvdk+fuZwIJFceP7Wif/p2DTU5
         YK7C0ttFmxdupr7uocKE6l6j0fwvIYH3N7A4EGh5888+2h0HZP5WUufn/4BWcoWVBBmI
         YM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708515344; x=1709120144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0rqzUwS6BdxGjI3H1JUFmWLh2DB/nlQLPYKogLCLbB8=;
        b=Glnc8fpevrRLVbJ4qgxfQKpgJ+II2LyHgbGlVsZHeeJWEa0zKdp2rLI8euRipqfDdy
         +zmduZS3bggzHgG+5H/c/q7cxltHabYUoEXCfk/VRSC0N0l+6zHxJt5hHSU4KsIpoepc
         h2eOFmHmfG91kvK/Ih5jmx5coV5NWQI4sayxmoUYFVGswjbfugHwkyeLfq/VQWSQoQvs
         JGECAWMa3Ml2rqyrS3TkgWhaNIU3vO7rhOb2Mfl6tW82OCPJrTmMWwt947l9h8v++3uF
         t/dz0zNb8qLf64kUJjVfpREHY1YaGeM1JHzBlxGzalZeRfcT4kk1awBcC0pOrBs9ygkT
         Z7pA==
X-Forwarded-Encrypted: i=1; AJvYcCX7u9d52vMx3nk5pioBaD2oO95LJ6/sUSYBp18oeE243ScTiVEdAPjJqxV8yRODrbtEq04xR1mMRsaSkSLg1ffjDScNQg==
X-Gm-Message-State: AOJu0YxDbP7yy/9pAlhGom9OT4Jw+VsvWmXShIC7Qmqh09A0nnehK759
	sDrZuoul6BnYmnpClYgD4tQ8V0diXCjEZ6DUKtpKifGlGHoMuzpYjFJ/MR1WTETl7wZPmg==
X-Google-Smtp-Source: AGHT+IEwHju/X9vIeqhihYIRGISY1cX5Xt88mGLo3fj9jImWuJGJ1FfqScqrj4iTyDBujg+MUcvlGxTW
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a81:5748:0:b0:607:c418:33ba with SMTP id
 l69-20020a815748000000b00607c41833bamr4147129ywb.8.1708515344377; Wed, 21 Feb
 2024 03:35:44 -0800 (PST)
Date: Wed, 21 Feb 2024 12:35:11 +0100
In-Reply-To: <20240221113506.2565718-18-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240221113506.2565718-18-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=ardb@kernel.org;
 h=from:subject; bh=e7Puh3E2XK1VJqqP8geKZexKLK94zY042KFjfKEULUs=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIfXq/bd/VsVJTi+bPPmYuH9fB1t473PjspnToo1YUsxUq
 2rZ/8p1lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIlcn8fwP59By9ztn+WWpIp/
 Ox3ZZ2pacQjfWxM61eabxvsZwdx2xxj+2ZrtjxF+psy/dvm6zgKZQ2ypEpVS2Y8L2oKWh7RmbCt kBgA=
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221113506.2565718-22-ardb+git@google.com>
Subject: [PATCH v5 04/16] x86/startup_64: Use RIP_REL_REF() to access __supported_pte_mask
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

__supported_pte_mask is accessed from code that executes from a 1:1
mapping so it cannot use a plain access from C. Replace the use of
fixup_pointer() with RIP_REL_REF(), which is better and simpler.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/head64.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 2ac904110f6a..e2573ddae32f 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -177,7 +177,6 @@ unsigned long __head __startup_64(unsigned long physaddr,
 	p4dval_t *p4d;
 	pudval_t *pud;
 	pmdval_t *pmd, pmd_entry;
-	pteval_t *mask_ptr;
 	bool la57;
 	int i;
 
@@ -259,8 +258,7 @@ unsigned long __head __startup_64(unsigned long physaddr,
 
 	pmd_entry = __PAGE_KERNEL_LARGE_EXEC & ~_PAGE_GLOBAL;
 	/* Filter out unsupported __PAGE_KERNEL_* bits: */
-	mask_ptr = fixup_pointer(&__supported_pte_mask, physaddr);
-	pmd_entry &= *mask_ptr;
+	pmd_entry &= RIP_REL_REF(__supported_pte_mask);
 	pmd_entry += sme_get_me_mask();
 	pmd_entry +=  physaddr;
 
-- 
2.44.0.rc0.258.g7320e95886-goog

