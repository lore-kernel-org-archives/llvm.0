Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7C51C7B67
	for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 12:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728563305; cv=none; b=HyXp2GfVXGbsp2BTyzaPB/9p9cLPyMOeG54srCM25Xpg1yx0BCHjzRkRdQivE/o9gDtmXqlicSfKxjq7LzeLdkgsWizTAeyb+VMgBE+whL88wiPP1ZNObXvyLtcuZCDFxG4/KqhX/VBZyNRoZ5ZJwrzC9jpzRp+zUpyWDdMVW94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728563305; c=relaxed/simple;
	bh=MRo6HjQ15aNR0eJ50gt5+sfVcqyhO/6KpFlpqqECZJs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ck57bd0FlKvXZEZ82lleudyhmlsTiD89NeUaE7qIPZIvJGnL5/rSt+NdUYnKkL1I+Zol5j5HcwHyGLUmF5NwLM0BJee3c4IpnMIPefqnB2m2YYtVzua78EdzGLWSMypGfDyhU1dN75B/S3VUyDuy/Oydghbm6lHzB3r/Eleu9Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+zWkxAs; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+zWkxAs"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e29142c79d6so207840276.3
        for <llvm@lists.linux.dev>; Thu, 10 Oct 2024 05:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728563303; x=1729168103; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GuP8Dw+VpWRcprLt/X+HiKdbyXuiqtG6Iu2yHIJSWwU=;
        b=S+zWkxAsFF+/9eieYLPOwWOzqcRCn0pEaGlixBJj9wt5y8qZDLljQj98K/UAnTEbRN
         59+2vPGrHsD2jbvyKsETKb/3ecpj+yAjJWl4+SvRSsYgHWctQpIjI2SC9VRR/jd7I/Ib
         V7xcbMJw6QPUpMArMHYW8Xczg13C7RZBBdnBHxM6Ocka8477UY2uc5Fokss5dVNBeGeE
         F+2frlCb9Drjnfy81Gt3XDM6exPsWrrRu6vVwWTHedqbGy8n0Zsr/RAeFCCOH5imkBfy
         WpzmYY+9Rvrs4fmZ9R8cIvnBon6NNptyJDMkvW6bMM/jFym8uoN5n9wH1rxx/nSRyB0f
         3e+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728563303; x=1729168103;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GuP8Dw+VpWRcprLt/X+HiKdbyXuiqtG6Iu2yHIJSWwU=;
        b=tSQuRWQNx+IXSa5xFJUUTA+SbjY6FvX7DR8Bnbyy802g2uk9kvSoL76RR7ln1JeGSJ
         T/MyM+YyWliizUbEEy65nxBndkx3LDghBuWOnewafFyLd5Ug2Kbpkx/+6ZOjatiizA3b
         +kNTB/BMVO5jV7ciktxYOwD5ohAYFaUeBjob3uO7YtFmjGYdw7ztuUccpLT/tmOoJJFD
         cVAt8a7IpP7rm4ZRlcrLox6NexuxS7i+IAhnKfkyuR7xCGWSawgQTXSkwMArDAsDPtOu
         St1eU5jUgD75RAq9U6CLpB1FXV8sLLge1LZQ728Kya/M50I5NNLw62Y/Epkev3jJJ0z+
         hWPQ==
X-Gm-Message-State: AOJu0Yyv/CYpyOu+we3KaLfyFYGIR0RiipgNSdVoIs2HNtGDLaFbirct
	688JZXXdA+R+hIi6NFreZnwnn5DtX9F2k1+qVR5Wwq+TSJZ35WKJMnHo5ynaAhXgXPTPEQ==
X-Google-Smtp-Source: AGHT+IHL+aSBpZQ8XgGYGpH0O9CURph9tagSzDdjdDu89XN4DeeMFZXywYndZAwf/GPPkkHqRxOiKyoU
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a5b:312:0:b0:e28:e97f:5394 with SMTP id
 3f1490d57ef6-e28fe33aed1mr4678276.4.1728563303096; Thu, 10 Oct 2024 05:28:23
 -0700 (PDT)
Date: Thu, 10 Oct 2024 14:28:06 +0200
In-Reply-To: <20241010122801.1321976-7-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20241010122801.1321976-7-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=ardb@kernel.org;
 h=from:subject; bh=NRgY3UMAuDIJTAcx2+Y8d13RXHmPxwHdPW9+1ltPrDw=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIZ39RMS9+3HyUVxz3N6rFic4/86um9+3/smqyr/zTgncZ
 Zo+yetsRykLgxgHg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZjIqxUM/wPfJZ9NNS48fad3
 z8LWxz+ElmpIu7zdPqu+Zt7CeZ/qNXsYGV4nxAswx5UceSYy9bxb+me/sxyZ5Rs5/+us4FRYvUT 7Ez8A
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241010122801.1321976-11-ardb+git@google.com>
Subject: [PATCH v2 4/5] crypto: x86/crc32c - Use idiomatic relative jump table
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, keescook@chromium.org, 
	linux-hardening@vger.kernel.org, nathan@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Jan Beulich <jbeulich@suse.com>, 
	"Jose E. Marchesi" <jemarch@gnu.org>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The original crc32c code used a place-relative jump table but with a
slightly awkward use of two separate symbols. To help objtool, this was
replaced with a bog-standard position dependent jump table call, which
was subsequently tweaked to use a RIP-relative reference to the table,
but still populate it with absolute 64-bit references.

Given that objtool will need to be taught about the jump table idiom
that compilers use when running with -fpie enabled, let's update the
jump table in the crc32c code once again to use this standard idiom,
where the jump table carries 32-bit references relative to the start of
the table, and the destination address can be obtained by adding the
two.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/crypto/crc32c-pcl-intel-asm_64.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
index bbcff1fb78cb..45b005935194 100644
--- a/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
+++ b/arch/x86/crypto/crc32c-pcl-intel-asm_64.S
@@ -53,7 +53,7 @@
 .endm
 
 .macro JMPTBL_ENTRY i
-.quad .Lcrc_\i
+.long .Lcrc_\i - jump_table
 .endm
 
 .macro JNC_LESS_THAN j
@@ -169,7 +169,8 @@ SYM_FUNC_START(crc_pcl)
 
 	## branch into array
 	leaq	jump_table(%rip), %bufp
-	mov	(%bufp,%rax,8), %bufp
+	movslq	(%bufp,%rax,4), len
+	addq	len, %bufp
 	JMP_NOSPEC bufp
 
 	################################################################
-- 
2.47.0.rc0.187.ge670bccf7e-goog

