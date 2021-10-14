Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE0672
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 00:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634172280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jFv5OLM8EkJT7hF4OqXauqHE4zCaE1+d14pWIYx+RA0=;
	b=bXhf/vco5QWw5NUYxvHUBDjBxj5Gtc4sA0g0IFKXpUX2X7cHIyPYIn9YdXEVVLozSYJCX5
	xX9yfAstL23C56XU/SnUitySnv7oy5wOxxsgVLUkzsBLuVpww+dsO96uzyQnBHIHgVbuf2
	RY3OXufB9gjzs2Zvz2dx5Ch7hS42wb4=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-v5w659QuP3K4udtIn8pCUQ-1; Wed, 13 Oct 2021 20:44:38 -0400
X-MC-Unique: v5w659QuP3K4udtIn8pCUQ-1
Received: by mail-qk1-f198.google.com with SMTP id v14-20020a05620a0f0e00b0043355ed67d1so3246668qkl.7
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 17:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jFv5OLM8EkJT7hF4OqXauqHE4zCaE1+d14pWIYx+RA0=;
        b=H4wr8o8V+AK3h1WlIM8b2G29YePRyMOlbHwdKLuyvcqfl15R/7VAJLcUfWcl0ISXc5
         kzUASxWHc2A8/gSDxCy3O1UrRPG5glMyo21GCBSZhdVRwXrFD4C14EoidxFWrOW7NpVu
         TL1/klihbxncodQzkvX0SQ0ZnyzELTdHd/iPsVZ/asWNDsmIMr12BXR4wi4UYC4WpIBW
         1TiY9ppzLCuZRkwVV130wA6qHgljORYvnZGts0x51sCOQx1K+iQ7peEtCrDIlLJE5jcT
         Wl0F5KAk25o6djUf4tp25qtRTUefxzZ8WMK993wjGMVxUN2TnW4+1vBD7JkU48vdP3+g
         2/rw==
X-Gm-Message-State: AOAM533fN/TsJJLWJhcDYMuUqjgdrr7bboUKD3dPnWRqDqngZQx+7G3q
	TSwza6RVvVK57QTiZGjcJYjbd19Lja4atx+Zn+0E9dHMfvB9l2YaNvx9Riy+MFu3pjSnxvp9NYQ
	GQUF5v9Q2PXF62g==
X-Received: by 2002:a37:b742:: with SMTP id h63mr2191209qkf.204.1634172278101;
        Wed, 13 Oct 2021 17:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN7hRCKU/SKDN5he5DTJoX8aHISMFYBLbyiwc6It64vOfVpkP2EJr4BFnCIqPmfMZ5NSu/ig==
X-Received: by 2002:a37:b742:: with SMTP id h63mr2191187qkf.204.1634172277891;
        Wed, 13 Oct 2021 17:44:37 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id z19sm701005qts.96.2021.10.13.17.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 17:44:37 -0700 (PDT)
Date: Wed, 13 Oct 2021 17:44:34 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: x86@kernel.org, Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 01/15] objtool: Add CONFIG_CFI_CLANG support
Message-ID: <20211014004434.vjbpkd4ykn7upvsw@treble>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211013181658.1020262-2-samitolvanen@google.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Oct 13, 2021 at 11:16:44AM -0700, Sami Tolvanen wrote:
> The upcoming CONFIG_CFI_CLANG support uses -fsanitize=cfi, the
> non-canonical version of which hijacks function entry by changing
> function relocation references to point to an intermediary jump table.
> 
> For example:
> 
>   Relocation section '.rela.discard.func_stack_frame_non_standard' at offset 0x37e018 contains 6 entries:
>       Offset             Info             Type               Symbol's Value  Symbol's Name + Addend
>   0000000000000000  0002944700000002 R_X86_64_PC32          00000000000023f0 do_suspend_lowlevel + 0
>   0000000000000008  0003c11900000001 R_X86_64_64            0000000000000008 xen_cpuid$e69bc59f4fade3b6f2b579b3934137df.cfi_jt + 0
>   0000000000000010  0003980900000001 R_X86_64_64            0000000000000060 machine_real_restart.cfi_jt + 0
>   0000000000000018  0003962b00000001 R_X86_64_64            0000000000000e18 kretprobe_trampoline.cfi_jt + 0
>   0000000000000020  000028f300000001 R_X86_64_64            0000000000000000 .rodata + 12
>   0000000000000028  000349f400000001 R_X86_64_64            0000000000000018 __crash_kexec.cfi_jt + 0
> 
>   0000000000000060 <machine_real_restart.cfi_jt>:
>     60: e9 00 00 00 00          jmpq   65 <machine_real_restart.cfi_jt+0x5>
>                         61: R_X86_64_PLT32      machine_real_restart-0x4
>     65: cc                      int3
>     66: cc                      int3
>     67: cc                      int3
> 
> This breaks objtool vmlinux validation in many ways, including static
> call site detection and the STACK_FRAME_NON_STANDARD() macro.
> 
> Fix it by converting those relocations' symbol references back to their
> original non-jump-table versions.  Note this doesn't change the actual
> relocations in the object itself, it just changes objtool's view of
> them. This change is based on Josh's initial patch:
> 
> https://lore.kernel.org/r/d743f4b36e120c06506567a9f87a062ae03da47f.1611263462.git.jpoimboe@redhat.com/
> 
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Suggested-by: Josh Poimboeuf <jpoimboe@redhat.com>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>

-- 
Josh

