Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D42612E
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 23:31:39 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-335420c7bfeso190439867b3.16
        for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 16:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date;
        bh=V3t6t7JIbAvSA8Tk+dwJ0EP+zKfoVcWxCLBhZzDbf1s=;
        b=BJZRO63b+6qTZ95mYkmggV5gs8KD4EmwXqxKHDYQCmIwLDm3YgniZ/250yz/gIN1o1
         UDhgouP28HoSfLMlxUzyUrie3RqWCd1jAJOvkD9cnYfXcC653F8P+perCbezg0NqrJNk
         fMkszVMmG821mLizP9xbJci3/UVQzvsFSAjQusVLzxh/dfx2EtyYJL4EkRKZB8oJo5BX
         YIgzdRMqwTd/pdX/aPujuGXBfS+1cow9p06p/eOjzy5gj+RcIfTa6TkVDGBQaIaT8OMp
         TFBlAR0jRBgRhyDixp6R7SlS1vciR3OouPWVAX03TeXSLEtbzJZVJS5goMVzv3JfQDBu
         ZFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=V3t6t7JIbAvSA8Tk+dwJ0EP+zKfoVcWxCLBhZzDbf1s=;
        b=fc2CrEoZYPeVZCVgA8DmUD7y1OclKm1Y78q8tI7g7D9Khyzpw3JY6tDnVkFxdDEBTQ
         CuzDIGOFb5bZHe93WgYGrKOTij4An20zKDXu+xt2+2tX/15br86e9+xNUaKulc9GKtHi
         9DjeZUlRlRhVhtNzEPcxxZi7ayf+FE6Sv1gBwngli0U5rI8M64AysNpCTl2HeJZnyP9f
         pWK3pwn6K8XFGKvVEa6Dl2/27VU291JIbXeZwtpfJ0/jzxwfjIY8AAhJG9zFvmxdJV48
         dXKuBtcr+PjY+emno9LR5GjZXXSPhgLBj93n/tor6XjiBMDF7mfRLFDv71kKXOLamcwt
         Pfxw==
X-Gm-Message-State: ACgBeo397ORXOOwdczggUFL1hQHXa4dD5B9jU1o0Nc56rXIU8h3wjFEc
	2gWjTiGHelIcOduiRFUobxqaifEbJMqpdVxqj/s=
X-Google-Smtp-Source: AA6agR6LXRk/vsm3io9GudAaANlg3qlqmbPfZYO/5+9wavftY3qTlNqavlUs2mptfr8JHyP3G7J0i2tYgLtM61K8Nyw=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:54d9:7143:6a7d:91d])
 (user=samitolvanen job=sendgmr) by 2002:a5b:3ca:0:b0:676:e468:2879 with SMTP
 id t10-20020a5b03ca000000b00676e4682879mr14158623ybp.239.1661902298407; Tue,
 30 Aug 2022 16:31:38 -0700 (PDT)
Date: Tue, 30 Aug 2022 16:31:10 -0700
In-Reply-To: <20220830233129.30610-1-samitolvanen@google.com>
Message-Id: <20220830233129.30610-3-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220830233129.30610-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=samitolvanen@google.com;
 h=from:subject; bh=ZsdbFV1rDPVMEEnz8gpkcJ4SEVi2nPPUZtGW8C9VlOE=;
 b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBjDp3LuiRNOIXF6iWJdViGqd3zv5mS4LojAiJ+2zw1
 RBe4TiiJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYw6dywAKCRBMtfaEi7xW7hbdC/
 9dH+eF9FLRfbAZmIKkZfKGLDEV4GpzyFt3DC0T+XPYawpv8d4hIHcmWOewSokNp8/RlQxEqhucG9Zn
 axIaqhwCi2QhLKvRZcwmhKgvB25LWwrp6pMh94YrnGXvlD4ZGovDQk7afANRYpvaJuBWvNDjJMfcM9
 IMHPn/dIoby0cmKnGFT9OKty5s0M6RvrxxqzZZEVxwms885iZiHHnH1gSB2c5RlKNgSxrpvfzr6gB5
 VgzIUn3LcrpQ9eYEcaYRquZJotPXSZwdymKNF+l7zsSqZZzMkyXcLEY8JSPcDyhYBdFlHyA9oq+hqf
 FOCm74Um/Gr8A1LV7ognHe7JEPGjOh7sx3AJcXUtyPCn7FtdZU2V/f+thDRCL7FfgnF9UDZs0DMpqq
 PT0C1GB58hHVS0/Y/twOGM7f//NBSc140Y0yOTXRWtQuwHvAzfA6mSE55KlboU2m6pMC8JKeSW7PsL
 +uWT5s6GcBEfGDclqFu6GC1EpRCfJ/6w0iOUYXTCADGSE=
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Subject: [PATCH v4 02/21] scripts/kallsyms: Ignore __kcfi_typeid_
From: Sami Tolvanen <samitolvanen@google.com>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

The compiler generates __kcfi_typeid_ symbols for annotating assembly
functions with type information. These are constants that can be
referenced in assembly code and are resolved by the linker. Ignore
them in kallsyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 scripts/kallsyms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index f18e6dfc68c5..ccdf0c897f31 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -119,6 +119,7 @@ static bool is_ignored_symbol(const char *name, char type)
 		"__ThumbV7PILongThunk_",
 		"__LA25Thunk_",		/* mips lld */
 		"__microLA25Thunk_",
+		"__kcfi_typeid_",	/* CFI type identifiers */
 		NULL
 	};
 
-- 
2.37.2.672.g94769d06f0-goog

