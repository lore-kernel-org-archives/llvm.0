Received: from mail-qk1-f202.google.com (mail-qk1-f202.google.com [209.85.222.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737C872
	for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 18:06:11 +0000 (UTC)
Received: by mail-qk1-f202.google.com with SMTP id w2-20020a3794020000b02903b54f40b442so14390133qkd.0
        for <llvm@lists.linux.dev>; Thu, 30 Sep 2021 11:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=YTs3o+Lcv5DCr2QuauAOS05kw4e75hGm1Ap6LaNmDuQ=;
        b=X2H89x2ZY/Vpdf/BQvunK6wfPqMyb4DEDk9pbiFs6nK3/2FbhHHbrE6V4xLhMLMO72
         drYHTD2/KCJ6G99TSY9C0aO1sKa6Of2qEhogYWv2HQTGYu0JWgUpAaLMIJzwMu+or7pa
         iHk0oBTabObWMRZMT4JZN8w06cBqyUEON9DOp1KFYQGQ3SL+tbs7p/0CMzwj/JX+J6Bv
         wWym0ky/0NAtPtaaqTZBHkMxxafKQWsjUiZH+m2pu8IQRQNs99qH5Pfj/TWo3mDJ7327
         NFrnHKXLRwYMI9ciPDGRpaNES499YGFq66cYMWgu6ugJqzdhsfWL/THEpUxc1niccano
         aXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=YTs3o+Lcv5DCr2QuauAOS05kw4e75hGm1Ap6LaNmDuQ=;
        b=Zzo+shvGj5hLaglncACUixzFcLFsFjF7DjfqETVhqQRDsU9lLOtWdp+moUCc7bPZxF
         wqaE1PXWUi5wvti0dkDpLGQS7Dh5mvpYlkZiAJF0dLU5QJ5abPrJKlMsEVZ4H/1sLgTQ
         eYT3Caj8eQFR7BbuTyR/JLaSsJmfSQ1iOeUMGLeRW0LgnBF/jeNZoW03UFlVsmUXo1vm
         TO8u6sMNhyNFmwxystOnRukPp0EQZC/blblaYYDAWXFLdJvOJ3q4ODerPo8dmU/zN4rO
         B/RdcbD++8Cgx+N5vjjGc04dAPl2PkAYyXGdyml9AOqrgNxieMm+lplZ2938fCNdseFb
         n/UQ==
X-Gm-Message-State: AOAM5309BlDA5rYJujsnB7taSgmQ0USW05rd3n0ZNp8ATr4ev5TC3pYi
	W9hDTj4Y/joVJ1DLcMgP1kpliOE8q+azcUNAOwk=
X-Google-Smtp-Source: ABdhPJxQHjdB5w0u1pGsQKGQzmTIef8NLz4brDiegqDKDUQgvgv1vEwzWyrPFnKCP//0W8Pt+jlJdM7oOGX+dho9Rwo=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:ce43:4366:95ca:d6e9])
 (user=samitolvanen job=sendgmr) by 2002:a0c:8e8e:: with SMTP id
 x14mr5086772qvb.67.1633025170495; Thu, 30 Sep 2021 11:06:10 -0700 (PDT)
Date: Thu, 30 Sep 2021 11:05:31 -0700
In-Reply-To: <20210930180531.1190642-1-samitolvanen@google.com>
Message-Id: <20210930180531.1190642-16-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
Subject: [PATCH v4 15/15] x86, build: Allow CONFIG_CFI_CLANG to be selected
From: Sami Tolvanen <samitolvanen@google.com>
To: x86@kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Select ARCH_SUPPORTS_CFI_CLANG to allow CFI to be enabled with
Clang >= 13.

Link: https://bugs.llvm.org/show_bug.cgi?id=51588
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 16e216b57863..ea6d255a125f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -107,6 +107,7 @@ config X86
 	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
 	select ARCH_SUPPORTS_LTO_CLANG
 	select ARCH_SUPPORTS_LTO_CLANG_THIN
+	select ARCH_SUPPORTS_CFI_CLANG		if X86_64 && CLANG_VERSION >= 130000
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
-- 
2.33.0.800.g4c38ced690-goog

