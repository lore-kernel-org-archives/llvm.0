Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A2EC8
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 17:09:32 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id p15so20172777lfk.8
        for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 10:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CU0h57ixsJaNn7CmDoDJ3QxhAmlE3j6WvVuArIM9L+Y=;
        b=YJqmenmhOu3dyz1TZSzdMTWBurYvNX5FVzJSgwpuQhtv/tRrlehFQS32BblNEEX/5s
         0ttFfA3+rc12taCLby6NEls81KI0LAOgd9Fj3z7cPD7yaEi+tybav9v3foweVEAjn4u7
         wJv6pJl3ggexklkDRHq/kLcHMXEUBEo+fDFken9EB99/sO7+vXfXh/vri4QWq+UdH3Cp
         ygdRclgFkERAo4houDtQrOrBpoyvJtX5Pbt8KrnZINiOiBLMhm6Wdh/r+AfPeay5BNXZ
         urWvvfqyyl8YeHrADXAlz16QNR+JGEzA4mYH6dMBnE5wv/irc1pPSFMzmfGMpqBVmIHg
         4EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CU0h57ixsJaNn7CmDoDJ3QxhAmlE3j6WvVuArIM9L+Y=;
        b=h+nOkpG4SMmrwIJJ+DYlHXNHVHqOcTuQb3bUlsBKPPaqE67R6FTKOjli0tz1HIGXr5
         Ev5C/p4oerrdqf6TefbTRt8S6vX64ihk8VkSwRXDobsysel8djrdkGkd3icmoFp97l/I
         xbULczAM3eDfaxMIwoNNDKoKwTvayZETRfTxY4xixnFuu/T4NtGDu440z8Pfr8M7vcp+
         N2aMLPl/xQqCezeUQf4u1yVrOQcuX253ck8CqNOu5qkzIfNzta7HObfnhte/hZNUijzk
         uqjeAWkGO9i6u3NldA1V0zUpJg9FdXRH7yuMeI95CkytxgF8GA41XYrhZss+HTpRw+iF
         hJxA==
X-Gm-Message-State: AOAM530G+cjTnV5F1JrEf5KVpG3knmoeIyJc6KWL3U6oZ+1VG0QsmrTe
	nJgoVfSV0SJvQgloIYsjzwhes23UFCu3dAvTPB9sqA==
X-Google-Smtp-Source: ABdhPJwaDDLcbBydGEpc0aHpEu+biSIFTRbFf0a/cNU+963FH9m973Lokuwmwuo+LqUIes7nFCfessx4/wAXxIWtckw=
X-Received: by 2002:a05:6512:308e:b0:448:3826:6d68 with SMTP id
 z14-20020a056512308e00b0044838266d68mr19043569lfd.184.1647968970052; Tue, 22
 Mar 2022 10:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220322102115.186179-1-ammarfaizi2@gnuweeb.org> <20220322102115.186179-3-ammarfaizi2@gnuweeb.org>
In-Reply-To: <20220322102115.186179-3-ammarfaizi2@gnuweeb.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 22 Mar 2022 10:09:18 -0700
Message-ID: <CAKwvOdkEwkzT0uf9a5SokCScDTY4gbhNFZ+fLxsti9innaEZRQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/8] tools/nolibc: Remove .global _start from the
 entry point code
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Nugraha <richiisei@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 22, 2022 at 3:21 AM Ammar Faizi <ammarfaizi2@gnuweeb.org> wrote:
>
> Building with clang yields the following error:
> ```
>   <inline asm>:3:1: error: _start changed binding to STB_GLOBAL
>   .global _start
>   ^
>   1 error generated.
> ```
> Make sure only specify one between `.global _start` and `.weak _start`.
> Removing `.global _start`.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Yes, symbols should either be `.weak` or `.global`. The warning from
Clang's integrated assembler is meant to flush out funny business.

I assume there's a good reason _why_ _start is weak and not strong?
Then again, I'm not familiar with nolibc.

>
> Cc: llvm@lists.linux.dev
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Ammar Faizi <ammarfaizi2@gnuweeb.org>
> ---
>
> @@ Changelog:
>
>    Link RFC v1: https://lore.kernel.org/llvm/20220320093750.159991-3-ammarfaizi2@gnuweeb.org
>    RFC v1 -> RFC v2:
>     - Remove all `.global _start` for all build (GCC and Clang) instead of
>       removing all `.weak _start` for clang build (Comment from Willy).
> ---
>  tools/include/nolibc/arch-aarch64.h | 1 -
>  tools/include/nolibc/arch-arm.h     | 1 -
>  tools/include/nolibc/arch-i386.h    | 1 -
>  tools/include/nolibc/arch-mips.h    | 1 -
>  tools/include/nolibc/arch-riscv.h   | 1 -
>  tools/include/nolibc/arch-x86_64.h  | 1 -
>  6 files changed, 6 deletions(-)
>
> diff --git a/tools/include/nolibc/arch-aarch64.h b/tools/include/nolibc/arch-aarch64.h
> index 87d9e434820c..2dbd80d633cb 100644
> --- a/tools/include/nolibc/arch-aarch64.h
> +++ b/tools/include/nolibc/arch-aarch64.h
> @@ -184,7 +184,6 @@ struct sys_stat_struct {
>  /* startup code */
>  asm(".section .text\n"
>      ".weak _start\n"
> -    ".global _start\n"
>      "_start:\n"
>      "ldr x0, [sp]\n"              // argc (x0) was in the stack
>      "add x1, sp, 8\n"             // argv (x1) = sp
> diff --git a/tools/include/nolibc/arch-arm.h b/tools/include/nolibc/arch-arm.h
> index 001a3c8c9ad5..1191395b5acd 100644
> --- a/tools/include/nolibc/arch-arm.h
> +++ b/tools/include/nolibc/arch-arm.h
> @@ -177,7 +177,6 @@ struct sys_stat_struct {
>  /* startup code */
>  asm(".section .text\n"
>      ".weak _start\n"
> -    ".global _start\n"
>      "_start:\n"
>  #if defined(__THUMBEB__) || defined(__THUMBEL__)
>      /* We enter here in 32-bit mode but if some previous functions were in
> diff --git a/tools/include/nolibc/arch-i386.h b/tools/include/nolibc/arch-i386.h
> index d7e4d53325a3..125a691fc631 100644
> --- a/tools/include/nolibc/arch-i386.h
> +++ b/tools/include/nolibc/arch-i386.h
> @@ -176,7 +176,6 @@ struct sys_stat_struct {
>   */
>  asm(".section .text\n"
>      ".weak _start\n"
> -    ".global _start\n"
>      "_start:\n"
>      "pop %eax\n"                // argc   (first arg, %eax)
>      "mov %esp, %ebx\n"          // argv[] (second arg, %ebx)
> diff --git a/tools/include/nolibc/arch-mips.h b/tools/include/nolibc/arch-mips.h
> index c9a6aac87c6d..1a124790c99f 100644
> --- a/tools/include/nolibc/arch-mips.h
> +++ b/tools/include/nolibc/arch-mips.h
> @@ -192,7 +192,6 @@ struct sys_stat_struct {
>  asm(".section .text\n"
>      ".weak __start\n"
>      ".set nomips16\n"
> -    ".global __start\n"
>      ".set    noreorder\n"
>      ".option pic0\n"
>      ".ent __start\n"
> diff --git a/tools/include/nolibc/arch-riscv.h b/tools/include/nolibc/arch-riscv.h
> index bc10b7b5706d..511d67fc534e 100644
> --- a/tools/include/nolibc/arch-riscv.h
> +++ b/tools/include/nolibc/arch-riscv.h
> @@ -185,7 +185,6 @@ struct sys_stat_struct {
>  /* startup code */
>  asm(".section .text\n"
>      ".weak _start\n"
> -    ".global _start\n"
>      "_start:\n"
>      ".option push\n"
>      ".option norelax\n"
> diff --git a/tools/include/nolibc/arch-x86_64.h b/tools/include/nolibc/arch-x86_64.h
> index a7b70ea51b68..84c174181425 100644
> --- a/tools/include/nolibc/arch-x86_64.h
> +++ b/tools/include/nolibc/arch-x86_64.h
> @@ -199,7 +199,6 @@ struct sys_stat_struct {
>   */
>  asm(".section .text\n"
>      ".weak _start\n"
> -    ".global _start\n"
>      "_start:\n"
>      "pop %rdi\n"                // argc   (first arg, %rdi)
>      "mov %rsp, %rsi\n"          // argv[] (second arg, %rsi)
> --
> Ammar Faizi
>


-- 
Thanks,
~Nick Desaulniers
