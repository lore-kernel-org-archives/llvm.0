Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4AF2C87
	for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 20:11:58 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id r19so16569362lfe.10
        for <llvm@lists.linux.dev>; Wed, 13 Oct 2021 13:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eTnL5kNpHunSoH20hdsr5IOYGrMPB41KKgAoQoY3zuI=;
        b=MQhlfteEnWjVjWjOHOuy0NnGGHr6nufVPwI24OBAERHQITRaLKGcAua02cSG8Te9+i
         qUxWvDNiMl1Fl8afGUmOu63cf0DlJBCUqBoFrmrkAAQ6x22QLrXn5rby8g+mZKNbkKIq
         0ryWAAfhcsRE+9zo2niQbNt2063xntPcOZNWtwa60v+U9/AiMbcCwD9BqGUzsA/4xgYi
         dUJqpkpjSF0Jbk/RQ6cl9iwenNxiIniHMHni1lAj3TVz+NjkVXgmWRRHsOgrrkkUtaFv
         ZkkkIXTSyILah5NaLqYqYvsIUpoyJ+Sv6jfEkxRuDhsanCXMuUBwdhzMzBnVfmed7qkh
         EZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eTnL5kNpHunSoH20hdsr5IOYGrMPB41KKgAoQoY3zuI=;
        b=TZWEQB7gEp/jio3UK5kgceSKxUq+VjPJEV96w+bmFCJjf297lAIHRTMx/J0N8bBb02
         U+MxeQAPwHw7xCWbmmbbWN8fvYDP///klVo+o1pJkT2zSptHkBemm1XTvsplOBS1OznF
         C/WteNGcSqlqvDeFqGwskUokLqLq3pb9Y87tCxYje7RlwG9ciEr3VG67gb9uZasDHQLw
         bCPOzHzS88gsTETvHtDmKVKuo3OkzVTp8YXkBGbbS5cXlvQPXXy7i8Y1myFA4CBjxJ69
         GurnYeWLf8x3G5alWCxg9aHOoggPF50wmHbsIIKKx5n3Fdz5V8riY+Ah33s39nhKzA3e
         N1+A==
X-Gm-Message-State: AOAM532GOMmZTGLMSiubmxvc4/zsudlrXF+9U3SJLE4wWkl279Q9TdTA
	qndUdYsFyKPObW/vNfnko1EFxru/JDFEah8YuMujmw==
X-Google-Smtp-Source: ABdhPJw5KzKgdLCPfSyjlf4rWFXZ4VuxWJfrG5u3EefAaZAL6aFkHAR2YfTWw9wo9nTJLw9ngVCyTGDCQj9rL+Gcr0k=
X-Received: by 2002:a05:651c:1108:: with SMTP id d8mr1554950ljo.220.1634155916648;
 Wed, 13 Oct 2021 13:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211013122217.304265366@infradead.org> <20211013123645.119101107@infradead.org>
In-Reply-To: <20211013123645.119101107@infradead.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 13 Oct 2021 13:11:45 -0700
Message-ID: <CAKwvOd=4s70S9irWGV94u2AoyQyo67XZ9tU12cdhf=6879gA+w@mail.gmail.com>
Subject: Re: [PATCH 5/9] x86/alternative: Handle Jcc __x86_indirect_thunk_\reg
To: Peter Zijlstra <peterz@infradead.org>
Cc: x86@kernel.org, jpoimboe@redhat.com, andrew.cooper3@citrix.com, 
	linux-kernel@vger.kernel.org, alexei.starovoitov@gmail.com, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 13, 2021 at 5:41 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Handle the rare cases where the compiler (clang) does an indirect
> conditional tail-call using:
>
>   Jcc __x86_indirect_thunk_\reg

`Jcc.d32 __x86_indirect_thunk_\reg` might be clearer; otherwise
putting that in an assembler and assembling/disassembling produces the
2B instructions, which makes the below patch confusing. Ah, it is
stated in the comment added below.

>
> For the !RETPOLINE case this can be rewritten to fit the original (6
> byte) instruction like:
>
>   Jncc.d8       1f
>   JMP           *%\reg
>   NOP
> 1:
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  arch/x86/kernel/alternative.c |   38 ++++++++++++++++++++++++++++++++++----
>  1 file changed, 34 insertions(+), 4 deletions(-)
>
> --- a/arch/x86/kernel/alternative.c
> +++ b/arch/x86/kernel/alternative.c
> @@ -378,7 +378,8 @@ static int emit_indirect(int op, int reg
>  static int patch_retpoline(void *addr, struct insn *insn, u8 *bytes)
>  {
>         void (*target)(void);
> -       int reg, i = 0;
> +       int reg, ret, i = 0;
> +       u8 op, cc;
>
>         if (cpu_feature_enabled(X86_FEATURE_RETPOLINE))
>                 return -1;
> @@ -390,9 +391,34 @@ static int patch_retpoline(void *addr, s
>         if (WARN_ON_ONCE(reg & ~0xf))
>                 return -1;
>
> -       i = emit_indirect(insn->opcode.bytes[0], reg, bytes);
> -       if (i < 0)
> -               return i;
> +       op = insn->opcode.bytes[0];
> +
> +       /*
> +        * Convert:
> +        *
> +        *   Jcc.d32 __x86_indirect_thunk_\reg
> +        *
> +        * into:
> +        *
> +        *   Jncc.d8 1f
> +        *   jmp *%\reg
> +        *   nop
> +        * 1:
> +        */
> +       if (op == 0x0f && (insn->opcode.bytes[1] & 0xf0) == 0x80) {
> +               cc = insn->opcode.bytes[1] & 0xf;
> +               cc ^= 1; /* invert condition */
> +
> +               bytes[i++] = 0x70 + cc; /* Jcc.d8 */
> +               bytes[i++] = insn->length - 2;

Isn't `insn->length - 2` always 4 (in this case)? We could avoid
computing that at runtime I suspect if we just hardcoded it.

Either way, I've looked at the disassembly enough that this LGTM.
Thanks for the patch.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +
> +               op = JMP32_INSN_OPCODE;
> +       }
> +
> +       ret = emit_indirect(op, reg, bytes + i);
> +       if (ret < 0)
> +               return ret;
> +       i += ret;
>
>         for (; i < insn->length;)
>                 bytes[i++] = BYTES_NOP1;
> @@ -423,6 +449,10 @@ void __init_or_module noinline apply_ret
>                 case JMP32_INSN_OPCODE:
>                         break;
>
> +               case 0x0f: /* escape */
> +                       if (op2 >= 0x80 && op2 <= 0x8f)
> +                               break;
> +                       fallthrough;
>                 default:
>                         WARN_ON_ONCE(1);
>                         continue;
>
>


-- 
Thanks,
~Nick Desaulniers
