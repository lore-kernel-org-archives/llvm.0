Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4CB2F24
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 19:43:13 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id z4so36082533lft.3
        for <llvm@lists.linux.dev>; Tue, 01 Feb 2022 11:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zz0Xmt+zBtk7CUu8XqSyog1XhQotf3FMA2GYjydlfL0=;
        b=Htw1wDOLdqMNCyrnaaITsbOvlAbxwjaEwcX4XYqlgm3Z1LbJ3RYWnOO2iaVRV9G1DI
         jpWXX/sIE5H39nMTY5p0razkshDoBz/F6McO6YAl4cwVeBGrzqrKxlpCylg0X1daUYGM
         pN1+7jnIfqpzP1w/68gLZUxAYx6q5/epW6c8ZzbqTYLBdgBSYEuSIbf4RTYvtgOQqKhn
         6hVoaVpvltyP6VYnAqlza4uDqz2I8UVPlLlizImeDbsYw9ZdcKTRrWPMDYiVd4LnvIfl
         bLMUat+d1svMKOEcMMktaoHDYaIAxYouw3HK/LdxvxHdRjoGqvxMk1UmJZ5DI4v2Q+k6
         /e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zz0Xmt+zBtk7CUu8XqSyog1XhQotf3FMA2GYjydlfL0=;
        b=4SJE26jO8lrisDHgxwxNoiauWjd/8EbVmybbvh6SCtvELfBg2B+PBC1ZtxulpYm5Rh
         PcRLLzfhgUrWOLEQvFD6nIEOKeiVNfyaa9wjMjnbakYGeb/EY+CRi47GjrjAHKPnW7f3
         5GyrRMe9E8rJWAypcTrmOQxGSndsd/MwXwriE4S46FnUIk9J44KRA7KchUJGwt2GXkto
         vwxmUx9uGmIx6fjegeXFHCRwwxy8OY7vlpvTaZPvIaZ/4iQ/rWZPoRDEJkRo2k0iN0V+
         WjrM7AdHMAMUi6LMp2L3C90MzqYQX41B9WrDwZcnrcr+vfIteFIjniXkjKHMzywBj/Id
         T9pw==
X-Gm-Message-State: AOAM5329e/D2UPrQLhRoIntfm4Cx4Uc7aWCWPjlkzisJdl5kBpB+tL2k
	JTMhjGfmBwrHg+j3apGxSjBamb+FtxZR5lomq1j6viZ3YKM=
X-Google-Smtp-Source: ABdhPJzBJdDca+G7ILqunsKdkfH03kHFBWuIxCxfb5qUaZqVHDaeZa+DmsszEC1qJYB5VVzT0+wAjJ7b2e5N+kgFJto=
X-Received: by 2002:a05:6512:3ba5:: with SMTP id g37mr20511313lfv.651.1643744591095;
 Tue, 01 Feb 2022 11:43:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220201013257.17926-1-changbin.du@gmail.com>
In-Reply-To: <20220201013257.17926-1-changbin.du@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 1 Feb 2022 11:42:59 -0800
Message-ID: <CAKwvOd=fCCjSfz6tW3514ifZOMw2PT4AZiFExq1qqG1rxf5fEg@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
To: Changbin Du <changbin.du@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 31, 2022 at 5:33 PM Changbin Du <changbin.du@gmail.com> wrote:

Make sure to mark the version of your patches (this is v2, IIUC). `git
format-patch -v2 HEAD~`

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
> '.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
> And they might overlap with handwritten symbols.
>
> Before this change, a dumpstack shows a local symbol for epc:
> [    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
> [    0.040452][    T0]  ra : restore_all+0x12/0x6e
>
> The simple solution is that we can ignore all local labels prefixed by '.L'.
> For handwritten symbols which need to be preserved should drop the '.L'
> prefix.
>
> After this change, the C defined symbol is shown so we can locate the
> problematical code immediately:
> [    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
> [    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
> [    0.036567][    T0]  ra : restore_all+0x12/0x6e
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  scripts/kallsyms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> index 54ad86d13784..8caabddf817c 100644
> --- a/scripts/kallsyms.c
> +++ b/scripts/kallsyms.c
> @@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
>         /* Symbol names that begin with the following are ignored.*/
>         static const char * const ignored_prefixes[] = {
>                 "$",                    /* local symbols for ARM, MIPS, etc. */
> -               ".LASANPC",             /* s390 kasan local symbols */
> +               ".L",                   /* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
>                 "__crc_",               /* modversions */
>                 "__efistub_",           /* arm64 EFI stub namespace */
>                 "__kvm_nvhe_",          /* arm64 non-VHE KVM namespace */
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
