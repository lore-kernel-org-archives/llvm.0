Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F1A4C74
	for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 22:04:43 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id x10so3018558ljq.4
        for <llvm@lists.linux.dev>; Thu, 11 Aug 2022 15:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ClZkoO2gn+DuUwd5gSUHUhC51CqF9F+Etb4xaf+Veuw=;
        b=ECo/2V/B4Jxi39vXhbgAVoVni5Tl4lyXTJNAbps09XA4bYPzvhGFjOKvONZm7PPno9
         Vm9jA1szyjrbyO/z2+hFDQDt26sb2UM5FbHYOwuWbVm7fRYl1rDxnoJeah8VdQdiNF5I
         WYn5UCPS6aaPj+h8JTcPaxzffePTgkkFV5C8rPfUBgA4aiv1Ef+Zj2+din/8of1nxhG8
         4ZsW0bjoqKS0LHrwifjKx+2dMYV19bb6d48eURgEzHM1vMgiessUYX8m+7gv7Y/1vz6c
         c9cZCB8Agjs6rqOon1Vka2Mh2nXDbuKvYgMXPQ/zbLG2VaJYHOLt/zjUuk5I6msuwlfv
         0rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ClZkoO2gn+DuUwd5gSUHUhC51CqF9F+Etb4xaf+Veuw=;
        b=j0bXv+vxhUDaj+e9bdNBtLqyR7gH1Bf9NtQb6ous0bgM3vGydW0ZCEoc+cvCKhQRTn
         9dciZpYw/RcMjsfb9nyHjJOd+HbaBG5jZ7zuGjsX7G7MnIoFADxq59htbCAp2X/aRt1F
         kwxorEJQGnKCwRiyRCJiYLitS80U+dl5G75TRGsItIXq9wB2GYegR94s5eU/GrmFRW40
         elg4xkynJnp7yCRyJjoVjzLgPHhZC81gAL4KkXSl2VdhLtpMwggEWjSH9wUN4Brf5Oz2
         zQRjNXoWrZ7fLp48GX59eC4BEaZ5T+IZstv0wk+QmmNsRBsxp739nEBuLP2MlNF8x8N8
         EJgA==
X-Gm-Message-State: ACgBeo0QcacVWV6LjdO/RcnttOqJhgnbfkOuwFlRM1Af+5V04b+w3v8n
	+buL/pbv6IBADP3Fy5xmFiPHNUkhkNzQnDx+8NJV0A==
X-Google-Smtp-Source: AA6agR4vdLsL/8BbE8c/lUrun/dyty7m/tzj2+iJcItMzwC2sdqfehgEsYupuwaPy9xzYjaCyDdFP8XXiAFGjr4s3eM=
X-Received: by 2002:a05:651c:98f:b0:25f:e61c:c12 with SMTP id
 b15-20020a05651c098f00b0025fe61c0c12mr327173ljq.26.1660255481412; Thu, 11 Aug
 2022 15:04:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YvSxeDkmwxcJL+Z0@debian> <YvUZ+9kJ/AvUMxzO@dev-arch.thelio-3990X>
 <CAHk-=wivP4zipYnwNWCLF5cd24GLs3m8=Sp7M-CmmPva_UC+3Q@mail.gmail.com>
 <CAKwvOdnQjgtwqFXLv+QtWPfpHosM5fxE5oqbX0VUD53F8L6bRg@mail.gmail.com> <CAHk-=wgJA=e-CLcvU5LRKu0bMLeAewXtOM6as1hFVeQAVkMPbg@mail.gmail.com>
In-Reply-To: <CAHk-=wgJA=e-CLcvU5LRKu0bMLeAewXtOM6as1hFVeQAVkMPbg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 11 Aug 2022 15:04:29 -0700
Message-ID: <CAKwvOdkUc=8DD938in5PMeGYAn3PEWp4E_W8qEHq_y7Smy8+mQ@mail.gmail.com>
Subject: Re: mainline build failure for arm64 allmodconfig with clang
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Joe Perches <joe@perches.com>, Nathan Chancellor <nathan@kernel.org>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, clang-built-linux <llvm@lists.linux.dev>, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 11, 2022 at 12:35 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Thu, Aug 11, 2022 at 11:39 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Generally, printing an int with %hhu may truncate depending on the
> > value of the int.
>
> Yes.
>
> HOWEVER.
>
> That truncation is *LITERALLY THE MAIN REASON TO EVER USE %hhu IN THE
> FIRST PLACE*.
>
> See the issue?
>
> Warning about "this may truncate bits" when the main reason to use
> that format string in the first place is said bit truncation is kind
> of stupid, isn't it?

Yeah, I guess adding a truncate to the caller is kind of unnecessary
if you're still going to use %hhd anyways.  What are your thoughts on
this bug I've filed?
https://github.com/llvm/llvm-project/issues/57102

-- 
Thanks,
~Nick Desaulniers
