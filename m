Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C2D63E
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 17:27:16 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id bt26so25740545lfb.3
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gjlWSgDYCbI3M0HlDfM+vRBeQFnG0r9FgmdbuPnrgqQ=;
        b=aVvx3FDfpN2WfwpjlyxpAb5Fwswxlfi/0LDhMZdxBX1bJ4kqbt7F9JwUIf4M2YGi+A
         +Wnc0mnQTa5PhVU9lA/PnyGKLEnXuH89p3UwUuSoj5zvNzipTCWhi8oYbyzjlZ+P7/bf
         WHY1ioGhcshdkuE1zdzW3HsrHW2LidtQE0aXvGDbh9W0ZBivvNYFkFRbyEaLU1p/PkrR
         YqnjBZe9cWSaE1WsqyzmpquwIAyvR0Y5piDM1O9Gs37X6CSORvAEy7NhCpZsbLwgAXl1
         a9vy260QEtWazFypwCq7q+O33a7nkhm4ra1V5zP6OaPHpRUvrjGs7Xj0WY6U0JMggzFP
         kVVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gjlWSgDYCbI3M0HlDfM+vRBeQFnG0r9FgmdbuPnrgqQ=;
        b=hBMWFQN1NoJPH/eBfrvi9+fK69JuPDoYfOnZbSezSPU6gsR6mz3O9IQlGs/MDEk+E3
         K/jMr66Q8CvdK+Z3Ufd2QVryO6NrvlF1Tt/8Zu9F+5qGu6dRjTwla8q4drmFM3XfM+hy
         urYrnlMjWOP/6MMTyWynJ+EERNyEIkNyz64miSAc4y0vmFTCROi03XUMJ/BF1PraZLvf
         KHkNM4eW+XaUDtNePiQDmPWM2ynG3Q6a2+tQMO3DpJeZVk2KgD0aShfRA6ItKYlZKrM2
         B5NBRtWmLunhu3Q40xXqicFU8Aj+EOoStI3j5OlPlcDRzmWiJTW75Ery0uJwuSZr9vzi
         PYGg==
X-Gm-Message-State: AOAM530S/OTO9WPcPWiuu17A1kqBVsSlOQ7gplnWGitg+gmac2/442fX
	v6S6QgKBxibmY0htUVxSZZd/bQCEroCFr6kDa6FMEw==
X-Google-Smtp-Source: ABdhPJy4rZuO7vtP7+8b/Mnd+Mllf2Xr2hwf83Dz2QNhS8sDUM8I/x5BFB4QCsYPBIVI5J7rSfIgJWZP/6BJmllE6vs=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr15309077lfd.190.1647883634694; Mon, 21
 Mar 2022 10:27:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220320093750.159991-1-ammarfaizi2@gnuweeb.org>
 <20220320093750.159991-3-ammarfaizi2@gnuweeb.org> <20220320191619.GA27312@1wt.eu>
 <9e69af8e-74c1-f35b-98dd-e2a77153ea09@gnuweeb.org>
In-Reply-To: <9e69af8e-74c1-f35b-98dd-e2a77153ea09@gnuweeb.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 21 Mar 2022 10:27:03 -0700
Message-ID: <CAKwvOdmfscdQQvmDmVqX3RvH55_EnqHokC+G9jSjckYqLG-psw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/6] tools/nolibc: Make the entry point not weak
 for clang
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>
Cc: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alviro Iskandar Setiawan <alviro.iskandar@gnuweeb.org>, Nugraha <richiisei@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 21, 2022 at 4:38 AM Ammar Faizi <ammarfaizi2@gnuweeb.org> wrote:
>
> On 3/21/22 2:16 AM, Willy Tarreau wrote:
> > Hi Ammar,
> >
> > I've had a look at this one.
> >
> > On Sun, Mar 20, 2022 at 04:37:46PM +0700, Ammar Faizi wrote:
> >> Budilig with clang yields the following error:
> >    ^^^^^^^
> > BTW please fix the typo in the final commit message.
> >
> >> @@ -183,7 +183,9 @@ struct sys_stat_struct {
> >>
> >>   /* startup code */
> >>   asm(".section .text\n"
> >> +#if !defined(__clang__)
> >>       ".weak _start\n"
> >> +#endif
> >>       ".global _start\n"
> >>       "_start:\n"
> >
> > So it seems that I was wrong and that .weak is an alternate for .global
> > and not a complement. As such, instead of adding all these #if, please
> > simply remove all .global.

See also:
commit 4d6ffa27b8e5 ("x86/lib: Change .weak to SYM_FUNC_START_WEAK for
arch/x86/lib/mem*_64.S")
commit ec9d78070de9 ("arm64: Change .weak to SYM_FUNC_START_WEAK_PI
for arch/arm64/lib/mem*.S")

Also, please note in the commit message that this diagnostic comes
from using clang as the assembler (which is clang's default behavior
unless -fno-integrated-as is passed).

>
> Will fix this in the next version.
>
> --
> Ammar Faizi
>


-- 
Thanks,
~Nick Desaulniers
