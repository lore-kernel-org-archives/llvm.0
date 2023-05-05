Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7ED2F33
	for <llvm@lists.linux.dev>; Fri,  5 May 2023 18:02:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6436dfa15b3so1459233b3a.1
        for <llvm@lists.linux.dev>; Fri, 05 May 2023 11:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683309758; x=1685901758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+y7orr2WYnU2wxLyQBDVL7NcQ3meJkrWwS+TlRo/5k=;
        b=59JTMX7SoHpxLlJllIJYKo4oaclguiHkyXzwm6YydSXIs4chAUJZ+3USTS+2XEm1Ws
         PJM7tdJf6Gqt2rTiQC4zwu0F1dI4ITzgIROuqFN5UjEzsbcI+DUrCe/JYWhG2qG7K7rX
         iEO9qWOJPMeQtH+MQEADgryvJpSSqx+MkuDMUXkbNeJXh7GgcF4rThiuMbyuUiIupKlQ
         DZygiac4UcrIhGuhwaBMsboTVDVOX76zGuZnC6vpDpy7faNVezd9jhmCrQn397UTYVBq
         ZqxZnvi5ZZExEFr1VLSXgMBTHd3Xysyind8f2rY+GPaQgyruLWUsI8okgMKtqs8Mo/he
         XHow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683309758; x=1685901758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i+y7orr2WYnU2wxLyQBDVL7NcQ3meJkrWwS+TlRo/5k=;
        b=cuKpbgU7dXDyUmokNB1wf4Lyl/ZqphTwoiFu81R73WKKs5ekuh9fyX/rD07yvTW73O
         D/msMvfqmb7MDcR01CL4/bDOz0bQld7KjX69nR/1JdfH57jmK0ILFcTDRf+3ApRyt9Sz
         JVLAj5g30kUweCLPRMUO3RD8FwDAHeLBVRGfmOl9vnT/YufiHuL1cLvSHnK5Nf0SpsaA
         b06QvffbFsojI5cbbusdrgARbbNd+EhU914yZJpiPxmeft2AEK0hjr4GSXp1lljGL/p5
         JkOz1ejQTB3XD819YZm6kLU9W42ud53gPuoD7V5EXVnfxNcABh2fBG7aRGk4+rpDdNtY
         8w7A==
X-Gm-Message-State: AC+VfDyk/OTXanWu7oF47ivT0cX1uC3zRulYOjsgFNNVuCArNCopQPRu
	bXi/RijaH5G4h1ePlUh1vsWRWu8/+RUvxE2lyiXyWQ==
X-Google-Smtp-Source: ACHHUZ562fRZ16BrsqpqruSW/hQByJUNF3Cf2ITXtNN/LXEqvSo1HkZpSrlm3dOU3erF18a65YShp1Q5ks9EwTFBXoM=
X-Received: by 2002:a05:6a00:181d:b0:640:f220:d16e with SMTP id
 y29-20020a056a00181d00b00640f220d16emr4005185pfa.11.1683309757324; Fri, 05
 May 2023 11:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1682673542.git.houwenlong.hwl@antgroup.com>
 <7cee0c83225ffd8cf8fd0065bea9348f6db3b12a.1682673543.git.houwenlong.hwl@antgroup.com>
 <CAKwvOd=zgjWdg2+_bg3QByh_2hve8yoKzCfEBZ5md+k8ytkqcQ@mail.gmail.com> <20230505061420.GB103506@k08j02272.eu95sqa>
In-Reply-To: <20230505061420.GB103506@k08j02272.eu95sqa>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 5 May 2023 11:02:25 -0700
Message-ID: <CAKwvOdkWt8FpqegyaGRNdF067dwwFEGze-nqR+yF=TA1FnTozg@mail.gmail.com>
Subject: Re: [PATCH RFC 16/43] x86-64: Use per-cpu stack canary if supported
 by compiler
To: Hou Wenlong <houwenlong.hwl@antgroup.com>
Cc: Brian Gerst <brgerst@gmail.com>, linux-kernel@vger.kernel.org, 
	Kees Cook <keescook@chromium.org>, x86@kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 4, 2023 at 11:14=E2=80=AFPM Hou Wenlong <houwenlong.hwl@antgrou=
p.com> wrote:
>
> On Tue, May 02, 2023 at 01:27:53AM +0800, Nick Desaulniers wrote:
> > On Fri, Apr 28, 2023 at 2:52=E2=80=AFAM Hou Wenlong <houwenlong.hwl@ant=
group.com> wrote:
> > >
> > > +config CC_HAS_CUSTOMIZED_STACKPROTECTOR
> > > +       bool
> > > +       # Although clang supports -mstack-protector-guard-reg option,=
 it
> > > +       # would generate GOT reference for __stack_chk_guard even wit=
h
> > > +       # -fno-PIE flag.
> > > +       default y if (!CC_IS_CLANG && $(cc-option,-mstack-protector-g=
uard-reg=3Dgs))
> >
> > Hi Hou,
> > I've filed this bug against LLVM and will work with LLVM folks at
> > Intel to resolve:
> > https://github.com/llvm/llvm-project/issues/62481
> > Can you please review that report and let me know here or there if I
> > missed anything? Would you also mind including a link to that in the
> > comments in the next version of this patch?
> >
> Hi Nick,
>
> Thanks for your help, I'll include the link in the next version.
> Actually, I had post an issue on github too when I test the patch on
> LLVM. But no replies. :(.

Ah, sorry about that.  The issue tracker is pretty high volume and
stuff gets missed.  With many users comes many bug reports.  We could
be better about triage though.  If it's specific to the Linux kernel,
https://github.com/ClangBuiltLinux/linux/issues is a better issue
tracker to use; we can move bug reports upstream to
https://github.com/llvm/llvm-project/issues/ when necessary. It's
linked off of clangbuiltlinux.github.io if you lose it.

> https://github.com/llvm/llvm-project/issues/60116
>
> There is another problem I met for this patch, some unexpected code
> are generated:
>
> do_one_initcall: (init/main.o)
> ......
> movq    __stack_chk_guard(%rip), %rax
> movq    %rax,0x2b0(%rsp)
>
> The complier generates wrong instruction, no GOT reference and gs
> register. I only see it in init/main.c file. I have tried to move the
> function into another file and compiled it with same cflags. It could
> generate right instruction for the function in another file.

The wrong instruction or the wrong operand?  This is loading the
canary into the stack slot in the fn prolog.  Perhaps the expected
cflag is not getting set (or being removed) from init/main.c? You
should be able to do:

$ make LLVM=3D1 init/main.o V=3D1

to see how clang was invoked to see if the expected flag was there, or not.

>
> The LLVM chain toolsare built by myself:
> clang version 15.0.7 (https://github.com/llvm/llvm-project.git
> 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)

Perhaps worth rebuilding with top of tree, which is clang 17.

>
> > Less relevant issues I filed looking at some related codegen:
> > https://github.com/llvm/llvm-project/issues/62482
> > https://github.com/llvm/llvm-project/issues/62480
> >
> > And we should probably look into:
> > https://github.com/llvm/llvm-project/issues/22476
> >
> >
>
> Except for per-cpu stack canary patch, there is another issue I post on
> github: https://github.com/llvm/llvm-project/issues/60096

Thanks, I'll bring that up with Intel, too.

>
> The related patch is:
> https://lore.kernel.org/lkml/175116f75c38c15d8d73a03301eab805fea13a0a.168=
2673543.git.houwenlong.hwl@antgroup.com/
>
> I couldn't find the related documentation about that, hope you can help
> me too.
>
> One more problem that I didn't post is:
> https://lore.kernel.org/lkml/8d6bbaf66b90cf1a8fd2c5da98f5e094b9ffcb27.168=
2673543.git.houwenlong.hwl@antgroup.com/

Mind filing another bug for this in llvm's issue tracker? We can
discuss there if LLD needs to be doing something different.

Thanks for uncovering these and helping us get them fixed up!
--=20
Thanks,
~Nick Desaulniers
