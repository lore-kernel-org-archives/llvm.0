Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFC44A37
	for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 18:28:37 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id j5so11026455plj.5
        for <llvm@lists.linux.dev>; Wed, 31 Aug 2022 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=DKqOreZ0IgrWRiSDcLbaBnxAeNHDFdxNZO+CnCRvPwc=;
        b=W8KAgLyjkNUHAFpMwYF/wvokZ8fdC3RDGm9I/qeGHY0ggAXIaFURxudkLxKkVA9Mgy
         1mRayAWr8dNDbIGHYpXdjXutEEm9uMgfYQzwMPwyi0tv5TWZAu/HRC/DuT5Fsn4pfq13
         W/ukaCsatuUL99leXMPFydGRXOIXJYtWUfKOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=DKqOreZ0IgrWRiSDcLbaBnxAeNHDFdxNZO+CnCRvPwc=;
        b=sglV8/xl8FMRc2Gscew6cLojOuE8bp4SsmV3FTVXOJ+zTNUCc9CfmOKcj8oKorAlNs
         Ra572zSyTe+BzYRb2v/J6zp8RvWcVHPFvcCxLV7MCvBSzs+NHNAKUiSPaCcfWM8wiT0h
         uGE08USa26sTtdqvomkHYzY7bP5qzGeO7LgKjqnVoDh1KUPU3o8A8x0xvxoLCGiEDNG+
         rONYPzfcFmeOBVaLyMVBVgXgpt0BZ1uDAcoqS6m9nEbI2dZ+f8ciaD5bF+w+IAEk/3Fh
         iuTrusk9KhyO5YN3zOGlk4WFUdGvjA4Xk9MBDOl6kTxQnh8xzn54sqn7v7qCCgI06IcA
         tn7w==
X-Gm-Message-State: ACgBeo0uLHd5C81tlqBWXS8wvhnCXWL0YT3JBenBodI1vcY/xMPmijjp
	c3Qw3UnbHgDbq9IWVeGVERYQhQ==
X-Google-Smtp-Source: AA6agR6OlwRU5wclOlZmixT8IdkrnbM3k8VzZUs+HpxdDpO2AjevToFIOsjaP6IotcHzEgkDsgVrEw==
X-Received: by 2002:a17:90a:e586:b0:1fa:d28b:ab9b with SMTP id g6-20020a17090ae58600b001fad28bab9bmr4614074pjz.47.1661970516578;
        Wed, 31 Aug 2022 11:28:36 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r9-20020aa79ec9000000b0053659f296a0sm11656371pfq.8.2022.08.31.11.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 11:28:36 -0700 (PDT)
Date: Wed, 31 Aug 2022 11:28:35 -0700
From: Kees Cook <keescook@chromium.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Joao Moreira <joao@overdrivepizza.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH v4 21/21] x86: Add support for CONFIG_CFI_CLANG
Message-ID: <202208311126.B662F4722@keescook>
References: <20220830233129.30610-1-samitolvanen@google.com>
 <20220830233129.30610-22-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830233129.30610-22-samitolvanen@google.com>

On Tue, Aug 30, 2022 at 04:31:29PM -0700, Sami Tolvanen wrote:
> With CONFIG_CFI_CLANG, the compiler injects a type preamble immediately
> before each function and a check to validate the target function type
> before indirect calls:
> 
>   ; type preamble
>   __cfi_function:
>     mov <id>, %eax
>   function:
>     ...
>   ; indirect call check
>     mov     -<id>,%r10d
>     add     -0x4(%r11),%r10d
>     je      .Ltmp1
>     ud2
>   .Ltmp1:
>     call    __x86_indirect_thunk_r11
> 
> Define the __CFI_TYPE helper macro for manually annotating indirectly
> called assembly function with the identical premable, add error handling
> code for the ud2 traps emitted for indirect call checks, and allow
> CONFIG_CFI_CLANG to be selected on x86_64.
> 
> This produces the following oops on CFI failure (generated using lkdtm):
> 
> [   21.441706] CFI failure at lkdtm_indirect_call+0x16/0x20 [lkdtm]
> (target: lkdtm_increment_int+0x0/0x10 [lkdtm]; expected type: 0x7e0c52a)
> [   21.444579] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> [   21.445296] CPU: 0 PID: 132 Comm: sh Not tainted
> 5.19.0-rc8-00020-g9f27360e674c #1
> [   21.445296] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> BIOS rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
> [   21.445296] RIP: 0010:lkdtm_indirect_call+0x16/0x20 [lkdtm]
> [   21.445296] Code: 52 1c c0 48 c7 c1 c5 50 1c c0 e9 25 48 2a cc 0f 1f
> 44 00 00 49 89 fb 48 c7 c7 50 b4 1c c0 41 ba 5b ad f3 81 45 03 53 f8
> [   21.445296] RSP: 0018:ffffa9f9c02ffdc0 EFLAGS: 00000292
> [   21.445296] RAX: 0000000000000027 RBX: ffffffffc01cb300 RCX: 385cbbd2e070a700
> [   21.445296] RDX: 0000000000000000 RSI: c0000000ffffdfff RDI: ffffffffc01cb450
> [   21.445296] RBP: 0000000000000006 R08: 0000000000000000 R09: ffffffff8d081610
> [   21.445296] R10: 00000000bcc90825 R11: ffffffffc01c2fc0 R12: 0000000000000000
> [   21.445296] R13: ffffa31b827a6000 R14: 0000000000000000 R15: 0000000000000002
> [   21.445296] FS:  00007f08b42216a0(0000) GS:ffffa31b9f400000(0000)
> knlGS:0000000000000000
> [   21.445296] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   21.445296] CR2: 0000000000c76678 CR3: 0000000001940000 CR4: 00000000000006f0
> [   21.445296] Call Trace:
> [   21.445296]  <TASK>
> [   21.445296]  lkdtm_CFI_FORWARD_PROTO+0x30/0x50 [lkdtm]
> [   21.445296]  direct_entry+0x12d/0x140 [lkdtm]
> [   21.445296]  full_proxy_write+0x5d/0xb0
> [   21.445296]  vfs_write+0x144/0x460
> [   21.445296]  ? __x64_sys_wait4+0x5a/0xc0
> [   21.445296]  ksys_write+0x69/0xd0
> [   21.445296]  do_syscall_64+0x51/0xa0
> [   21.445296]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [   21.445296] RIP: 0033:0x7f08b41a6fe1
> [   21.445296] Code: be 07 00 00 00 41 89 c0 e8 7e ff ff ff 44 89 c7 89
> 04 24 e8 91 c6 02 00 8b 04 24 48 83 c4 68 c3 48 63 ff b8 01 00 00 03
> [   21.445296] RSP: 002b:00007ffcdf65c2e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [   21.445296] RAX: ffffffffffffffda RBX: 00007f08b4221690 RCX: 00007f08b41a6fe1
> [   21.445296] RDX: 0000000000000012 RSI: 0000000000c738f0 RDI: 0000000000000001
> [   21.445296] RBP: 0000000000000001 R08: fefefefefefefeff R09: fefefefeffc5ff4e
> [   21.445296] R10: 00007f08b42222b0 R11: 0000000000000246 R12: 0000000000c738f0
> [   21.445296] R13: 0000000000000012 R14: 00007ffcdf65c401 R15: 0000000000c70450
> [   21.445296]  </TASK>
> [   21.445296] Modules linked in: lkdtm
> [   21.445296] Dumping ftrace buffer:
> [   21.445296]    (ftrace buffer empty)
> [   21.471442] ---[ end trace 0000000000000000 ]---
> [   21.471811] RIP: 0010:lkdtm_indirect_call+0x16/0x20 [lkdtm]
> [   21.472467] Code: 52 1c c0 48 c7 c1 c5 50 1c c0 e9 25 48 2a cc 0f 1f
> 44 00 00 49 89 fb 48 c7 c7 50 b4 1c c0 41 ba 5b ad f3 81 45 03 53 f8
> [   21.474400] RSP: 0018:ffffa9f9c02ffdc0 EFLAGS: 00000292
> [   21.474735] RAX: 0000000000000027 RBX: ffffffffc01cb300 RCX: 385cbbd2e070a700
> [   21.475664] RDX: 0000000000000000 RSI: c0000000ffffdfff RDI: ffffffffc01cb450
> [   21.476471] RBP: 0000000000000006 R08: 0000000000000000 R09: ffffffff8d081610
> [   21.477127] R10: 00000000bcc90825 R11: ffffffffc01c2fc0 R12: 0000000000000000
> [   21.477959] R13: ffffa31b827a6000 R14: 0000000000000000 R15: 0000000000000002
> [   21.478657] FS:  00007f08b42216a0(0000) GS:ffffa31b9f400000(0000)
> knlGS:0000000000000000
> [   21.479577] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   21.480307] CR2: 0000000000c76678 CR3: 0000000001940000 CR4: 00000000000006f0
> [   21.481460] Kernel panic - not syncing: Fatal exception
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

This looks great!

Reviewed-by: Kees Cook <keescook@chromium.org>

Peter, do you want to take this via -tip, or should I carry this in my
kernel hardening tree? (It touches arm64 and x86, so hardening might be
less weird, but it also touches things -tip might want to be building on
top of, etc...)

-- 
Kees Cook
