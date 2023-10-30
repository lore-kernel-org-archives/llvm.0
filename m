Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1603D299
	for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 15:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Sxl4sGqK"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507adc3381cso6611585e87.3
        for <llvm@lists.linux.dev>; Mon, 30 Oct 2023 08:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698679467; x=1699284267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0KowZ1di5qvK5n+3JJf/2IyXXL5HDQOugqkhoSxid4=;
        b=Sxl4sGqKMIOB/MsN58y/3/0eqJis63XdAW1lbxNUQhg0mfZlHCoTK4jptMiOsmFJPT
         26szfLUCgL9TGgRMLJqFDOSZgSaL4hjucgx4pT/6kW3PqeQxgvkB5qmUvIzZWxcS9x/Z
         2BcBGS2s9J4bHdkeUpS2tg0ANNACnhjeYkFkxbRgn4FLzI3t/3CxkE3Lo28DFTaFj/5L
         F34m5aJJdmKUg7LAcN4hKf5/DCoK/lgwxrrRoNhSJBpXmyA+oaQ4d+zGLHtZupQHiCMe
         XLpKjSuU9DFmzUFfZkZbPtfPGLtwWtoOlEY5+/I+vXAPpbgJZ3oZJh80rS/1uNg60AGC
         Xlsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698679467; x=1699284267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R0KowZ1di5qvK5n+3JJf/2IyXXL5HDQOugqkhoSxid4=;
        b=mF5t0IYelteJ6je2YMt2TD//VkzMDM6+U01gI4lfjdYNgt1qCN+AfraHNZRD9cGQjX
         5vdr4Hnabj4ISGBzgJGFolPhi9gj02O5FdOiJ3kmD2QpPCDVRwC3RXPY7MN8JYarbUAW
         h5necoAKvpzKe6KZGvO+IT+PJ2VMOamVITahG2ZMN7prKksVmapfYs9ddcPmMunqXj+I
         Pa+snsmiqP0XAHEzw7G1Pu/SjiiPvjdPELaateFZZGykhCN4Ra4rvWDKOGLZYGiJ/p+L
         7pfXV7/Tefu7XISVnUitYXo9F/KS2vxHQNJM88Itt3GfvmG6osBMI3zgywn+sSTBpsh7
         2roQ==
X-Gm-Message-State: AOJu0YzoDYN4ySo7X+pWSvSOUJ4vYrD9aKWDfVsuF1Tl+pFSbHn7gzdv
	9R9EBrF/gmT8y3GWSPKP3Lpy+4uRpJY/UOdqZHoS5g==
X-Google-Smtp-Source: AGHT+IGmRgljGaofo/j9ML6PQtvuC7qBg+AsBwPZwNI7Tw42CXdzWGdq/jjJE02sR+y2ZptZG3coS3/XlrPMtirxUkw=
X-Received: by 2002:a05:6512:1103:b0:507:9a05:1aed with SMTP id
 l3-20020a056512110300b005079a051aedmr9887913lfg.4.1698679467390; Mon, 30 Oct
 2023 08:24:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231026160100.195099-6-brgerst@gmail.com> <202310290927.2MuJJdu9-lkp@intel.com>
 <CAMzpN2iUrfnuGQ9eFTr=NTeC6KSUPC37Qji5_g5MWejmXnXO3A@mail.gmail.com> <CAMzpN2jbA=ZCbbFq=gyVAtKBr4kyYcNPLpWaEcAhEAN2J0wwTw@mail.gmail.com>
In-Reply-To: <CAMzpN2jbA=ZCbbFq=gyVAtKBr4kyYcNPLpWaEcAhEAN2J0wwTw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 30 Oct 2023 08:24:16 -0700
Message-ID: <CAKwvOd=+MEv9aQAS91KT-Ov3N8f8XRPE3WTEwvJyom=PTCmUeQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] x86/stackprotector/64: Convert stack protector
 to normal percpu variable
To: Brian Gerst <brgerst@gmail.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 10:01=E2=80=AFAM Brian Gerst <brgerst@gmail.com> wr=
ote:
>
> On Sun, Oct 29, 2023 at 2:56=E2=80=AFAM Brian Gerst <brgerst@gmail.com> w=
rote:
> >
> > On Sat, Oct 28, 2023 at 9:26=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > >
> > > Hi Brian,
> > >
> > > kernel test robot noticed the following build errors:
> > >
> > > [auto build test ERROR on tip/master]
> > > [also build test ERROR on next-20231027]
> > > [cannot apply to tip/x86/core dennis-percpu/for-next linus/master tip=
/auto-latest v6.6-rc7]
> > > [If your patch is applied to the wrong git tree, kindly drop us a not=
e.
> > > And when submitting patch, we suggest to use '--base' as documented i=
n
> > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/x8=
6-stackprotector-32-Remove-stack-protector-test-script/20231027-000533
> > > base:   tip/master
> > > patch link:    https://lore.kernel.org/r/20231026160100.195099-6-brge=
rst%40gmail.com
> > > patch subject: [PATCH v2 05/11] x86/stackprotector/64: Convert stack =
protector to normal percpu variable
> > > config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive=
/20231029/202310290927.2MuJJdu9-lkp@intel.com/config)
> > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.=
git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20231029/202310290927.2MuJJdu9-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202310290927.2MuJJdu9=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > > >> Unsupported relocation type: unknown type rel type name (42)
> >
> > Clang is generating a new relocation type (R_X86_64_REX_GOTPCRELX)
> > that the relocs tool doesn't know about.  This is supposed to allow
> >         movq    __stack_chk_guard@GOTPCREL(%rip), %rax
> >         movq    %gs:(%rax), %rax
> > to be relaxed to
> >         leaq    __stack_chk_guard(%rip), %rax
> >         movq    %gs:(%rax), %rax
> >
> > But why is clang doing this instead of what GCC does?
> >         movq    %gs:__stack_chk_guard(%rip), %rax
>
> Digging a bit deeper, there also appears to be differences in how the
> linkers behave with this new relocation:
>
> make CC=3Dclang LD=3Dld:
> ffffffff81002838:       48 c7 c0 c0 5c 42 83    mov    $0xffffffff83425cc=
0,%rax
>                         ffffffff8100283b: R_X86_64_32S  __stack_chk_guard
> ffffffff8100283f:       65 48 8b 00             mov    %gs:(%rax),%rax
>
> make CC=3Dclang LD=3Dld.lld:
> ffffffff81002838:       48 8d 05 81 34 42 02    lea
> 0x2423481(%rip),%rax        # ffffffff83425cc0 <__stack_chk_guard>
>                         ffffffff8100283b: R_X86_64_REX_GOTPCRELX
>  __stack_chk_guard-0x4
> ffffffff8100283f:       65 48 8b 00             mov    %gs:(%rax),%rax
>
> The LLVM linker keeps the R_X86_64_REX_GOTPCRELX even after performing
> the relaxation.  It should be R_X86_64_32S based on it changing to an
> LEA instruction.  The GNU linker changes it to R_X86_64_32S and a MOV
> immediate.
>
> So I think there are two issues here.  1) clang is producing code
> referencing the GOT for stack protector accesses, despite -fno-PIE on
> the command line and no other GOT references, and 2) ld.lld is using
> the wrong relocation type after the relaxation step is performed.
>
> I think the quick fix here is to teach the relocs tool about this new
> relocation.  It should be able to be safely ignored since it's
> PC-relative.  The code clang produces is functionally correct,
> although not optimal.

Thanks for the report.  + Fangrui for thoughts on relocations against
__stack_chk_guard; clang has similar issues for 32b x86 as well.

>
> Brian Gerst
>


--=20
Thanks,
~Nick Desaulniers
