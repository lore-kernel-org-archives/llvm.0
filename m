Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.92.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940510;
	b=o92Q06e5mhZn7vwQ8O+ZtpDr4J34c++wJKkJTuodzwH7sjDyIetbG/Vg5/fB8nGKC7Km
	 HVDavzv5gGV/lhFED3DCLBRD0fpxwKKBcSlaB55gKTRtytvVNkV3clklr9hMDXoapxKvf
	 efXkR6g9tE+sHI3O14CUUyLKaHIDmcS9Bojd/1FgDDYVcrgmV5Mw1zgEfaFHeCSm4sTzF
	 lBtKLfFQs/TgMKwBFYInKRJrVw9mUAJqUvyzKRFmr71kXmejDANH6+f6pfkFp7ldGM+FB
	 bnS8DW5LgpOxQNCkdTeYF2p6EBpNyH8mIo9hJE+0bI9sozReEu6gCtRh/Ldlixlu5Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940510;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=uexNMGpxUY9OOBDnfN+FganeasLxdCgYq2rQnF6AVfQ=;
	b=TdrFgRp6x6jpa+fOuru4CEmX7T3lTOEcbPM+r8Dx9A+wxMFkZw0yVyeN1lf0DViPAeHt
	 Qdo+pM0LiomyIUXrLWUqFrapNNLiXvq4Zn8eRcPO7V/6dNSRD6/Bwx4ZzjB6HXRxXVgy6
	 5EdMM7DucCx7S5mlT/cd4LUU/wqBgVSEEbUw80eKLXnU7asNO8ttV8JGbRmoHtH60o8en
	 o7AYqzgbLk2jADGeXIg8QS9tZ/Y94eM6j9omdomBd/YUyneJedXG+/tB85AGWxn4VuFSM
	 J1QZ5WD8fZGV+DcEJLJEPQkqKNRtgHslg6UXqWAJrg6aakZTz1OcXgLm9zyXipNtRNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TPrXIgoW;
	arc=none smtp.remote-ip=90.155.92.199
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73411606A886;
	Tue, 17 Nov 2026 18:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73411606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TPrXIgoW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uexNMGpxUY9OOBDnfN+FganeasLxdCgYq2rQnF6AVfQ=; b=TPrXIgoWCC4gHzComIOd+EOReG
	MLYqaaYpa9M9ELdQQ18R88rAHEWNnALZku4jwNmmYX0Rwp0lDo9EvhMVKFWzSy2CW4Zp1HDRipNZl
	mMuizWCB4KUG1ldsL17fvvAjQ89wIC679O/TKI0IUHtaXNmtBGj1jXLMR8Pk6r+VSFx9ZtHUsmwNY
	ohTxP7qcFBhZYYiueKqgX0Rc3fUkNVJ4oWtOESfUNw9bxw1p38OER6359GIy+es6JZdApkGGo+s57
	tXocYidbk5Iml0oVS7hzG7cl2gcfyc7an+l1oSvbxW09YiU/ETKp+klJr8gMnJV+FsdmAbSDxpqN+
	KCSCrUCg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTO1K-0000000FIqE-1sdF;
	Tue, 17 Nov 2026 18:35:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4F215300708; Tue, 17 Nov 2026 19:35:05 +0100 (CET)
Date: Tue, 17 Nov 2026 19:35:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ali Nasrollahi <a.nasrolahi01@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kees@kernel.org, nathan@kernel.org
Subject: Re: [PATCH] x86/cfi: mark cfi_debug as __maybe_unused
Message-ID: <20261117183505.GL1813469@noisy.programming.kicks-ass.net>
References: <20261116173027.229752-1-A.Nasrolahi01@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116173027.229752-1-A.Nasrolahi01@gmail.com>

On Mon, Nov 16, 2026 at 09:00:27PM +0330, Ali Nasrollahi wrote:
>     When CONFIG_FINEIBT is disabled, cfi_debug is never read, but
>     alternative_instructions() still resets it after calling
>     __apply_fineibt(). Clang 23 diagnoses this as -Wunused-but-set-global
>     with W=1, causing a build failure when CONFIG_WERROR=y. Mark cfi_debug
>     as __maybe_unused to account for configurations without FineIBT.
> 
> Signed-off-by: Ali Nasrollahi <A.Nasrolahi01@gmail.com>

Does something like so also work?

---
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index efbc11f8c336..9bfc36566e17 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -1195,9 +1195,9 @@ void __init_or_module apply_seal_endbr(s32 *start, s32 *end) { }
 #endif
 
 enum cfi_mode cfi_mode __ro_after_init = __CFI_DEFAULT;
-static bool cfi_debug __ro_after_init;
 
 #ifdef CONFIG_FINEIBT_BHI
+static bool cfi_debug __ro_after_init;
 bool cfi_bhi __ro_after_init = false;
 #endif
 
@@ -1894,6 +1894,7 @@ static void __init_or_module __apply_fineibt(s32 *start_retpoline, s32 *end_retp
 		break;
 	}
 
+	cfi_debug = false;
 err:
 	pr_err("Something went horribly wrong trying to rewrite the CFI implementation.\n");
 }
@@ -2281,7 +2282,6 @@ void __init alternative_instructions(void)
 
 	__apply_fineibt(__retpoline_sites, __retpoline_sites_end,
 			__cfi_sites, __cfi_sites_end, true);
-	cfi_debug = false;
 
 	/*
 	 * Rewrite the retpolines, must be done before alternatives since
