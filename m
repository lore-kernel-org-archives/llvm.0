Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363541869
	for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 20:36:56 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-2d7eaa730d9so84813437b3.13
        for <llvm@lists.linux.dev>; Fri, 29 Apr 2022 13:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=mNJyMVnIlguT1rUilClQ07jGJwBfREePO+0SEXQazuU=;
        b=SbPzWHz94PkiMgXJJgKeWVHyDbGKW0iDGndnpCpHSSnGy0udUUlBjtpN0J1quzFzj6
         9DNm9Bc3j3kVnXgb5WawLcDyFQd04kIbtQGi1DPmqk1xDQVxu0qIpcBAxx/d6ejw5h49
         KT14vLiZFTxcJrqYL4GVD3dvIF1Fv8ZgUnBDLOgTvQr5SYM7PWI8gAxJ1oq0ZHm80ihD
         EWjK+FxhDoerz3ciebN4rXM84mTDWRZyheZGg7EhS5aWE9aJqx3EyOAjZOUEGrgxQVMm
         WiRwj5rN0xhl95Qy5z18BBET4b5MLZM3cRbUhOAOvSictxqNCKkfnrg7fXhpvLyH149+
         sl2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mNJyMVnIlguT1rUilClQ07jGJwBfREePO+0SEXQazuU=;
        b=JOxi/8PiM3xBA5pmha1nhmR3nmEXSFHdEXvRXLrKNSvx1YH5INyJ5htLCEh5Dm8KBr
         Yk0cuS0pfDyp4DU5hZexgcrhUCEQLjR3gb0fmE2jnP2cjrSEmtLjxX3k6ACohes2VX6T
         2VQhHIxRpjtLbxsXI2Yl2iYPMJO+O37j6RMxDvbitEynusMCPBdPM+CikqodBZIppMau
         JaAjBTMwvgUXrJHo2LTB4sjm79pcpp00SjAXM8vgOCqgpOEXcvutTwuOU5wn/RsmzMah
         LmcghuIxSlM5xY9maNRJBNmjZ67GxyJ9pQI7HpMGuqaXTqRyPmhRqLwriHVmWMqKezRd
         ei+A==
X-Gm-Message-State: AOAM531OQLUx9Ut8dYcqBX7gOD77g7dmDo+KLkkaw09fU55fEFZDlGlE
	9DslQ5qy3qfmJel4WtZAriKDaCbPylDdK2IZODU=
X-Google-Smtp-Source: ABdhPJyayjsqoZ9MAE/d6QWDpfC4MBpe6t087Wq8ydOs9sA1lE9zrm0OkbjlaqzE1YyNGhiVhX9WmrSBQYStbxUZJck=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:351:bea9:f158:1021])
 (user=samitolvanen job=sendgmr) by 2002:a81:5085:0:b0:2f4:d6fb:f76f with SMTP
 id e127-20020a815085000000b002f4d6fbf76fmr1289650ywb.190.1651264615259; Fri,
 29 Apr 2022 13:36:55 -0700 (PDT)
Date: Fri, 29 Apr 2022 13:36:26 -0700
In-Reply-To: <20220429203644.2868448-1-samitolvanen@google.com>
Message-Id: <20220429203644.2868448-4-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20220429203644.2868448-1-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=669; h=from:subject;
 bh=o0oSO6A7dgHXw3JXyfs3kpLOQ31qQjhpc3pVMXlQeFk=; b=owEB7QES/pANAwAKAUy19oSLvFbuAcsmYgBibExVconqZfKUU7vtSg68iLeto5MMy78pevg9vXBt
 ZBfrWfiJAbMEAAEKAB0WIQQ1zPtjsoPW0663g5RMtfaEi7xW7gUCYmxMVQAKCRBMtfaEi7xW7sdRC/
 4rfcaIe+IT88EzfaYojaN8Sm+K4SATmfqAiUgwPtEJr2MID9IqKsrAZ9k2RjrSDq6w4bhs0A8V4B0G
 xeVCMT4W1+zvdWXlHb0A00gQOmvQ1vQyWI56OKIo9NiJti+CgLpYubN2ZUJOjoGlgeg1gLbJO66pDw
 icjIr0tUfuqNt27ID7vosvM2t0dLvewBveN5xF39aBc335pIruuGBF+43BjkceurX4nUyMuyRQKyuC
 C53Q0gRzSGtojQq0oZgtUt5bNOXehc7Bl3Y49D251QXr9mC5mhzdgMstIidEmNouXNfULHiTCOP+JZ
 EQXw/jX3KI7Q/9i8Rhjf+MJb6HiZMqWNHAz0Cxs32KU9fFjs5mCqmaXOcuKypUxZf8Bl1rRbOJ6N0P
 828GLh6ViZaJwR3qKRUm4OMT2qNKAA5RQww1KQsFt1rvpUpLxfm3f4Y4aHj9Gzwtf2CnUqUpg4EAY3
 OYhC9Lm3NuP0XGZvhb3CJ0qnvicQJW7kr29sr8vDYrhkI=
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
Subject: [RFC PATCH 03/21] kallsyms: Ignore __kcfi_typeid_
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

The compiler generates CFI type identifier symbols for annotating
assembly functions at link time. Ignore them in kallsyms.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 scripts/kallsyms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 8caabddf817c..eebd02e4b832 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -118,6 +118,7 @@ static bool is_ignored_symbol(const char *name, char type)
 		"__ThumbV7PILongThunk_",
 		"__LA25Thunk_",		/* mips lld */
 		"__microLA25Thunk_",
+		"__kcfi_typeid_",	/* CFI type identifiers */
 		NULL
 	};
 
-- 
2.36.0.464.gb9c8b46e94-goog

