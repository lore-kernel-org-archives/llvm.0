Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462BAD39
	for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 21:54:16 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 188-20020a250ac5000000b00b9265c9a5e9so1786689ybk.11
        for <llvm@lists.linux.dev>; Mon, 17 Apr 2023 14:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1681768456; x=1684360456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqlZpSOgvA1JLW3vzN7VqdCnxfAnggXybW0yzcDiFj0=;
        b=6Ok0UESUh26svpEt209uFygSyHBhPKwjJP2i5VUax6EplbX8ZR4r9D+qJgxeekR4XK
         6Dh99p7UoZMrY3HwK2wWp4r3Bw6dkbzaFd9ThydtwbIN2I3+eDfYB5ErJoEPmfqghLf0
         rwtmeBkQ+ySc7U5Zs5VZCi/MQrPDjJ84A1VrKMUWBhaBy1lMeMxtLLmbL0QV1WOG1GQf
         cyZNgAai2c6reZrcZzBnC0h2wPIRGVQPX0MliftBNYVAYJnVgnjziz8xTWOMY7e73FNW
         zL8UYzWheabjgDuIuJb6aSMdJR5XSkg3iac6BI0BIPTPysgkzR9ci86tf45CX2FT0U0x
         mfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681768456; x=1684360456;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TqlZpSOgvA1JLW3vzN7VqdCnxfAnggXybW0yzcDiFj0=;
        b=lF5BPVzcSvAn1x2nDAe73aUMl+mQjxuEF3T59GSW+znL2Tc6U8arcWX8RQoqn/SwKS
         66QEQx5OHWeyTwndjX9aTc7wH/9ANzHYMS+T3PbXzz2yc8ulUKTyRGFPnIqL380jpMe+
         2pUTPD6mpvCaKkrz8nHJo+cn0uuBiEY4h8eA0ege9r5my8SyZzReNfi6OK7SI8cms5+j
         6ebrQEhtWz0BgtANzO5Xh014j6YGeXfvsKAzh7oRT86VQz8g5fGFVYXbfsPFdVvKtfLF
         tQWS/r5SFu7B6B/9KQATEjUecOMjSKJ9kBoD3fJNGo/+NW4/PhHPl0v/VhS2aP3ARybJ
         jJ/w==
X-Gm-Message-State: AAQBX9ceLC+d7rM/a9aTinouovuD7hvFV3KXBVJIFmxlB1YpAQRISmZB
	MqeEs7m6AtXUyoD7Lhe8OyZgnB3kGRbbuh5ZKfk=
X-Google-Smtp-Source: AKy350ba6ZSdzfrXwGQ5fmWTSwEW508zmjFzpnm3zgJ1VAgvkc67q/5rJe5ITrn8QQW6az8rdP0cUFYN1wNh9cRxrW0=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:15c:2d1:203:e8f1:df30:2fb2:cf8a])
 (user=ndesaulniers job=sendgmr) by 2002:a25:df41:0:b0:b8b:eea7:525e with SMTP
 id w62-20020a25df41000000b00b8beea7525emr10639174ybg.5.1681768455963; Mon, 17
 Apr 2023 14:54:15 -0700 (PDT)
Date: Mon, 17 Apr 2023 14:54:08 -0700
In-Reply-To: <20230412-no_stackp-v1-0-86d2034a4d06@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230412-no_stackp-v1-0-86d2034a4d06@google.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681768450; l=1232;
 i=ndesaulniers@google.com; s=20220923; h=from:subject:message-id;
 bh=on2xOURJ9HOGHwPlBJaraE3eCNVECjunAe4jXLZvvs4=; b=BdjqNu+UYyKvhEjP5f6/uO90m0HacK6S31UoWPhMwomn/HE4zn7R//ZaCa1pvzN25cywrCbexalz
 5UZfSBkAD7ZLc+b4TJLKllZ9RD0Vlu6PiiUP8nAw6AhebQv03M0f
X-Mailer: b4 0.12.2
Message-ID: <20230412-no_stackp-v1-2-86d2034a4d06@google.com>
Subject: [PATCH 2/2] start_kernel: omit prevent_tail_call_optimization for
 newer toolchains
From: ndesaulniers@google.com
To: "Borislav Petkov (AMD)" <bp@alien8.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, x86@kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

prevent_tail_call_optimization was added in
commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")
to work around stack canaries getting inserted into functions that would
initialize the stack canary in the first place.

Now that we have no_stack_protector function attribute (gcc-11+,
clang-7+) and use it on start_kernel, remove the call to
prevent_tail_call_optimization such that we may one day remove it
outright.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 init/main.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/init/main.c b/init/main.c
index 1265c8d11052..c6eef497c8c9 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1152,7 +1152,13 @@ void start_kernel(void)
 	/* Do the rest non-__init'ed, we're now alive */
 	arch_call_rest_init();
 
+	/*
+	 * Avoid stack canaries in callers of boot_init_stack_canary for gcc-10
+	 * and older.
+	 */
+#if !__has_attribute(__no_stack_protector__)
 	prevent_tail_call_optimization();
+#endif
 }
 
 /* Call all constructor functions linked into the kernel. */

-- 
2.40.0.634.g4ca3ef3211-goog

