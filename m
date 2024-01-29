Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77D15B101
	for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551570; cv=none; b=LPRZ+cU2rXJh/QcTx+EwJiq/jIs/WtIqxLl4VzJK9i2TZBCrcMSXeHsfgF2MpkhQGvJiCUHzKaJ3BXFjoEL39SIEnR+lA1TceASESV4g6/Fi6YVGafdLtzDkuudp373t2oJMOVdwxJ6nLqoZYh+iIZCEsX5MkicOcuWYQ3BvdaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551570; c=relaxed/simple;
	bh=hGhdgMicSLDQ/VaHKkAj5Vre9mOZCJGZnI0ycPa0ctU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J3FtkDgtyL8ziuPTzbJIOGE1uaDsdrKdbNE2pLIDw+wiN8U1fKkqqX7/2l6vCMpG0xd6gf3sTwt56Axp4rWKln2iXhPfllQ3u5BA9V3FTnBhaOdpfmrqzE24miIjaZqnSP+cLzEQA/g0Z7SlHybS058v7yq7qDWFNxK8Q+yq//8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tdQoY00y; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tdQoY00y"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5f0fd486b9aso44775097b3.2
        for <llvm@lists.linux.dev>; Mon, 29 Jan 2024 10:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706551567; x=1707156367; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OvmdeW4/5l6h8clue2msSF5I8s+RaqVbElGLLzTfnIk=;
        b=tdQoY00yBkyZ4PQm8+u9b9Wz3OmuA6IRMqqd+Gh7ToLbivEyND3VaObdhkIfWTtIxX
         vybi5w/Vc03xFdr28xV0N1Sb6n5WT5JnglwBovOltER9G+rFpwYVd4BaXjD0i+E+4xqk
         AbTHtEO1zuSu1gpd7bV11WQnw0ajeX9jowUBjxeXknOqdjTwXjA2oypzw4LAbTx4MQCf
         pdBXqUdLT3q6TZQkixAQE5QO4kt9So96uez5dZ2np21qO9jE/eN7Fi3HbYxuvEQrY5BR
         3vF7x/UoNeO0PDHERQ4NGlRQHiwPShHGdSEWmFQtWuMEwc/VMzDoTRcnSImIYUZ7SX3B
         dl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706551567; x=1707156367;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvmdeW4/5l6h8clue2msSF5I8s+RaqVbElGLLzTfnIk=;
        b=pXY4cblU2y0pWAQytbCs5hJbvd7rJ37ZDt6u6jcPEql+8tYFnwuYM6wQCKsDP8vVlF
         3azaQZ9oRq+T86vCpI9cHT2A/qBdWNyFxt1PaCz/RmGc0Q++h6KJmLzmOJ6dIyWw2riA
         dYDisQqaQJfe6bD2THCREVan8UFH9vNgXhlIVN4bJXbLlWVMF9WBzsQ3eNi2k/EAzrUK
         qzjK6FbKkeEmcSczTwob7cLMdquo0dMz2t1vssuITaUURMrX7dsugYV6WcZx5RFyp3im
         iwoy+GPWKf+tdPLbDX3FZKH8jtX2EDYi5jAOsx07U52USmmv7W1S5Rli6ok2blkgFLzA
         1iWA==
X-Gm-Message-State: AOJu0YzHN0jcLFlxkA3NmR5D6roKgAOCBoL4+GhNO1cJwaX9mqD/5W3W
	/1+1JfeKWXFdFsNN+BdI8Y9NvmZugtg9CxGfMVCEZHWwCosZg8Wn11dChgGVPmUqL5hFqw==
X-Google-Smtp-Source: AGHT+IEvm5tXIhZK0iVzSFxmZq0xz25L/Fykdz68esiBebN0gmjK2KT5a1HMeCysY/4pBr4f9cq1K466
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6902:2206:b0:dc2:42fc:1366 with SMTP id
 dm6-20020a056902220600b00dc242fc1366mr424438ybb.9.1706551567626; Mon, 29 Jan
 2024 10:06:07 -0800 (PST)
Date: Mon, 29 Jan 2024 19:05:19 +0100
In-Reply-To: <20240129180502.4069817-21-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240129180502.4069817-21-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1898; i=ardb@kernel.org;
 h=from:subject; bh=BAMQXD8G5KJ2RAZEnRCY7V9ynmVKgA6YQxKkMkZhfsc=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIXX7iwd2nB82KC89l5dabni8zdb++Mqo/SUlzOIzelh7A
 tI2J/Z2lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgImckGb4Z9S36tFe1cvVWzbu
 ayl98UOoXKWc18nAMa1us+c8oyMr0xn++2XGVlQoGddc37R5goyOv+bk+2UVzxwrL7hu8HNk3C/ PAwA=
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Message-ID: <20240129180502.4069817-37-ardb+git@google.com>
Subject: [PATCH v3 16/19] x86/sev: Avoid WARN() in early code
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

Drop uses of WARN() from code that is reachable from the early primary
boot path which executes via the initial 1:1 mapping before the kernel
page tables are populated. This is unsafe and mostly pointless, given
that printk() does not actually work yet at this point.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/sev.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/sev.c b/arch/x86/kernel/sev.c
index 62981b463b76..94bf054bbde3 100644
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -698,7 +698,7 @@ static void __pitext early_set_pages_state(unsigned long vaddr, unsigned long pa
 		if (op == SNP_PAGE_STATE_SHARED) {
 			/* Page validation must be rescinded before changing to shared */
 			ret = pvalidate(vaddr, RMP_PG_SIZE_4K, false);
-			if (WARN(ret, "Failed to validate address 0x%lx ret %d", paddr, ret))
+			if (ret)
 				goto e_term;
 		}
 
@@ -711,21 +711,16 @@ static void __pitext early_set_pages_state(unsigned long vaddr, unsigned long pa
 
 		val = sev_es_rd_ghcb_msr();
 
-		if (WARN(GHCB_RESP_CODE(val) != GHCB_MSR_PSC_RESP,
-			 "Wrong PSC response code: 0x%x\n",
-			 (unsigned int)GHCB_RESP_CODE(val)))
+		if (GHCB_RESP_CODE(val) != GHCB_MSR_PSC_RESP)
 			goto e_term;
 
-		if (WARN(GHCB_MSR_PSC_RESP_VAL(val),
-			 "Failed to change page state to '%s' paddr 0x%lx error 0x%llx\n",
-			 op == SNP_PAGE_STATE_PRIVATE ? "private" : "shared",
-			 paddr, GHCB_MSR_PSC_RESP_VAL(val)))
+		if (GHCB_MSR_PSC_RESP_VAL(val))
 			goto e_term;
 
 		if (op == SNP_PAGE_STATE_PRIVATE) {
 			/* Page validation must be performed after changing to private */
 			ret = pvalidate(vaddr, RMP_PG_SIZE_4K, true);
-			if (WARN(ret, "Failed to validate address 0x%lx ret %d", paddr, ret))
+			if (ret)
 				goto e_term;
 		}
 
-- 
2.43.0.429.g432eaa2c6b-goog

