Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B011318FDC8
	for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 15:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276548; cv=none; b=J/gmF4sQPMwEKZ+/4rvykdOBfrmTA2sUohFBtwUdC41QXW/5+ApwcPPbyD4j1IgLdvXKb8C3hJANdXDxacPnzWni+6h9dTapDTdeOLyjF7Kw1S40NsKw0nw1C3Uc6DIJu9Gohqq1jYy4lPHqaLI5u/v/oQSYHGTluLPMtmt6UyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276548; c=relaxed/simple;
	bh=vuy2srbwlGWCNhjJ429H+XQTUepQW5BfwFX52st1yXg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J+A9kjD+lRv381W8pFV1yUKfho4AZkUY0EQ5+USCdyTCFpA6WtlX2OkMEmEYz867rnTxGNFH3WbiXfaos9RxZNpTclknB0//auGlOIAvFnpdQG+N5tYsTDABUou6MzA4Tca1oF49Vi5WjgVoq7Hpw2fCMkgXVbW2EQkrKL3bNK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HlxgH4zl; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HlxgH4zl"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6db7a8c6910so102659307b3.0
        for <llvm@lists.linux.dev>; Wed, 25 Sep 2024 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276546; x=1727881346; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TEh1/zkt2ebfm60sAnflL74oR8UqJJcIMQFWRvgC+dE=;
        b=HlxgH4zl2K7jDuIhwjGz5rr3UgJEsDaLWuc1Utopis8ZdMqzxsO4ULGJNRW/nYA2S5
         bI18UMNyTRixF8yN6rmaWI649yAGpLEPB3pDOF6XKWFc3mHfjoz1gwVIZRAPFPxmO1aO
         gAqecJyNgwGTnZjv8KXqKp6FzdxDNtCPJf0WecMjJt93VBspN2LRAM2RdsDyzrmstnxd
         Egdnx7Vz26g/afJ2wjg/JeaqDv8VahJSeFbhEr2iDUN/ITrXPPg24RohXe66jfqF5W3j
         M7LR35gKbzy4nD5ND6Z+jhmmjdQ88Fx4BqE2JDhGzBO2yyHbyNRDm9uB34CfXIoWTLON
         /UTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276546; x=1727881346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEh1/zkt2ebfm60sAnflL74oR8UqJJcIMQFWRvgC+dE=;
        b=YdEhFi3dpBsYwlPj0nitlG8zNUw/7xG51LcMFWlMN1/nmik/jbAQtFw4GO+ZD2c3D9
         DIvX2W3zKxBw6La98wJpsgjIE/3X3e/CRdK6RjjgAQG1pFm2jsId4Y09mZ9TF+UzulWr
         qJbl+o5ej8nWWZZUVjIwBhNWnn9XUDzg4XXG990yjhidMzlgXppYrbyt8hY4jNf9FlUt
         5iT/dtpXzjN5UxIl2zrSaq2Tx019bRcwmYTRqflBSk8DIMQC9PCW4TZthU4DHqQqrQEt
         A0EfsCFBftxDGTlKCysmGyelLvAERG9IWv2CzQhSnCOi++DXc8JwJedbnrPvXrPkWxxW
         eKsA==
X-Forwarded-Encrypted: i=1; AJvYcCU3nyzPteIhJ+AobXLDOmZ/OD4S7VVy9sLn5fShp15cepGrXJE6+SO8OuKilWtixbbdPSge@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4bta+hSvGX/aeqTZOLLlShidc7Wu30R/4ISf1gLXmhlckYBjE
	LupNw61HebHX+GIcT340GLpk7cC2tvWmklgfOHpVWvYqFhOvL1vlWdg8vRrnjchGGNwCOQ==
X-Google-Smtp-Source: AGHT+IGW5+6XYu5evov+Dvb+HROZj8E6YTyxVVP1a7XWDg5djajQJxqHbA/Whb8+5/ewCu11GBBmm/SO
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:438d:b0:6b1:8b74:978a with SMTP id
 00721157ae682-6e21d9d4ae9mr51697b3.4.1727276545723; Wed, 25 Sep 2024 08:02:25
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:14 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=ardb@kernel.org;
 h=from:subject; bh=DJZDFnSYvzXqQFYRPN/gizuDfobz3ccWU866DGFdU/U=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6v7XV9cI3q9cJcJR8+Vf2+Fz2Wk/Dh/Y/X1ToOXyt
 a351cxsHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiXdsZGZaErou6cPCEcv22
 Prcpp+bqHWznepHA8X6Z9Zn/83etFNBlZOg9+zlgLqMlq/AX9n2rM647K2+Mmvyn9GzNS4f81qf fJ/EAAA==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-44-ardb+git@google.com>
Subject: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for return address
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Instead of pushing an immediate absolute address, which is incompatible
with PIE codegen or linking, use a LEA instruction to take the address
into a register.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/rethook.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/rethook.c b/arch/x86/kernel/rethook.c
index 8a1c0111ae79..3b3c17ba3cd5 100644
--- a/arch/x86/kernel/rethook.c
+++ b/arch/x86/kernel/rethook.c
@@ -27,7 +27,8 @@ asm(
 #ifdef CONFIG_X86_64
 	ANNOTATE_NOENDBR	/* This is only jumped from ret instruction */
 	/* Push a fake return address to tell the unwinder it's a rethook. */
-	"	pushq $arch_rethook_trampoline\n"
+	"	leaq arch_rethook_trampoline(%rip), %rdi\n"
+	"	pushq %rdi\n"
 	UNWIND_HINT_FUNC
 	"       pushq $" __stringify(__KERNEL_DS) "\n"
 	/* Save the 'sp - 16', this will be fixed later. */
-- 
2.46.0.792.g87dc391469-goog

