Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47BC33ED;
	Mon, 30 Oct 2023 17:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+r6maMm"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507973f3b65so7174418e87.3;
        Mon, 30 Oct 2023 10:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698686373; x=1699291173; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GRMXxApF/An45tZq4VBzGl9yCBCUVcLn3beloShJvA=;
        b=W+r6maMmChI6m/FDZrPvEiu7bs03BRkyXF35/R3X4UV6RqYuClJzdcKXRYg584ea0R
         7OwDUJIfIokW1KMU0GH9FsH28nATHpwKTatzwdil8BmEDxVWNJ2v01O6Zl5bDFx8GQf7
         dBZU6iclcrVEnL7rJVBAw/n8TnbloZhbgBkw12QAowWaJ4HYIwV0ji6C6KV0CrXJ4NPp
         yT03Qq26hBLoYCmNIi5K1icYpiwmeNlqWEWDxF4xBAeAru1Zf019n84cGMCGInmguz2H
         C0t9q7pzByz+MCB3Sg8ezqJazIiXFDiJmSMNszS2WfOw+s+VkJ8jL+hXR5kIZn18fqdz
         aejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698686373; x=1699291173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GRMXxApF/An45tZq4VBzGl9yCBCUVcLn3beloShJvA=;
        b=ZZo+1W27PyUIurDcXHpJeFiib1dmks6hqTNT5EBl7MtcPgLEr+s5ivYRdRV6d58tiG
         Ch7ynNj588BPI4eGgGJp61HUGRwtsy5PiHpYGrL/8sdDu0BaIsw6Q+pmmqyV5paXwnog
         PnbWWIixynCSG/opiNIv1cM3XfSfXqBhTo9hHv1pMP35+GSis/gG9Y0HbG+hEoJ90VeX
         VbJxtGxr2sfgtlF0CaTiaJCfiRlRP3wa/LAX6EmRmply1J3OyhcRl7k1D3b+PxEFh2DG
         pDw8VCphyJ8pOW3KlDLkzku60dFqwTQxuseNLs77c9xaNabBdSWhg7iRPfwQ3gpGgwhb
         BVuw==
X-Gm-Message-State: AOJu0YzmSLbRlwX3NEU38tzjLui4WcjsVq+G0kU5DpXK92A7GlRREv9H
	s5JRIaFVz/gbx6WI/ql5l9ECCD6tYHD5+wIzKw==
X-Google-Smtp-Source: AGHT+IF2tTn+JqKkEfodOwQcMmPITwMkR2cADN506i0wAFFRZOEuQmX8m9kettU5+FPhybobULmposrVepIw5TJoM38=
X-Received: by 2002:ac2:5a02:0:b0:504:31a0:f9e2 with SMTP id
 q2-20020ac25a02000000b0050431a0f9e2mr7931982lfn.58.1698686372360; Mon, 30 Oct
 2023 10:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231026160100.195099-6-brgerst@gmail.com> <202310290927.2MuJJdu9-lkp@intel.com>
 <CAMzpN2iUrfnuGQ9eFTr=NTeC6KSUPC37Qji5_g5MWejmXnXO3A@mail.gmail.com>
 <CAMzpN2jbA=ZCbbFq=gyVAtKBr4kyYcNPLpWaEcAhEAN2J0wwTw@mail.gmail.com> <CAKwvOd=+MEv9aQAS91KT-Ov3N8f8XRPE3WTEwvJyom=PTCmUeQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=+MEv9aQAS91KT-Ov3N8f8XRPE3WTEwvJyom=PTCmUeQ@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Mon, 30 Oct 2023 13:19:21 -0400
Message-ID: <CAMzpN2iF9-AdEcpkGOVooAn_6XTYaOb6gM+GYqy2SOc0S+dRqQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] x86/stackprotector/64: Convert stack protector
 to normal percpu variable
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 11:24=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Sun, Oct 29, 2023 at 10:01=E2=80=AFAM Brian Gerst <brgerst@gmail.com> =
wrote:
> >
> > On Sun, Oct 29, 2023 at 2:56=E2=80=AFAM Brian Gerst <brgerst@gmail.com>=
 wrote:
> > >
> > > On Sat, Oct 28, 2023 at 9:26=E2=80=AFPM kernel test robot <lkp@intel.=
com> wrote:
> > > >
> > > > Hi Brian,
> > > >
> > > > kernel test robot noticed the following build errors:
> > > >
> > > > [auto build test ERROR on tip/master]
> > > > [also build test ERROR on next-20231027]
> > > > [cannot apply to tip/x86/core dennis-percpu/for-next linus/master t=
ip/auto-latest v6.6-rc7]
> > > > [If your patch is applied to the wrong git tree, kindly drop us a n=
ote.
> > > > And when submitting patch, we suggest to use '--base' as documented=
 in
> > > > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/=
x86-stackprotector-32-Remove-stack-protector-test-script/20231027-000533
> > > > base:   tip/master
> > > > patch link:    https://lore.kernel.org/r/20231026160100.195099-6-br=
gerst%40gmail.com
> > > > patch subject: [PATCH v2 05/11] x86/stackprotector/64: Convert stac=
k protector to normal percpu variable
> > > > config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archi=
ve/20231029/202310290927.2MuJJdu9-lkp@intel.com/config)
> > > > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-projec=
t.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20231029/202310290927.2MuJJdu9-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202310290927.2MuJJd=
u9-lkp@intel.com/
> > > >
> > > > All errors (new ones prefixed by >>):
> > > >
> > > > >> Unsupported relocation type: unknown type rel type name (42)
> > >
> > > Clang is generating a new relocation type (R_X86_64_REX_GOTPCRELX)
> > > that the relocs tool doesn't know about.  This is supposed to allow
> > >         movq    __stack_chk_guard@GOTPCREL(%rip), %rax
> > >         movq    %gs:(%rax), %rax
> > > to be relaxed to
> > >         leaq    __stack_chk_guard(%rip), %rax
> > >         movq    %gs:(%rax), %rax
> > >
> > > But why is clang doing this instead of what GCC does?
> > >         movq    %gs:__stack_chk_guard(%rip), %rax
> >
> > Digging a bit deeper, there also appears to be differences in how the
> > linkers behave with this new relocation:
> >
> > make CC=3Dclang LD=3Dld:
> > ffffffff81002838:       48 c7 c0 c0 5c 42 83    mov    $0xffffffff83425=
cc0,%rax
> >                         ffffffff8100283b: R_X86_64_32S  __stack_chk_gua=
rd
> > ffffffff8100283f:       65 48 8b 00             mov    %gs:(%rax),%rax
> >
> > make CC=3Dclang LD=3Dld.lld:
> > ffffffff81002838:       48 8d 05 81 34 42 02    lea
> > 0x2423481(%rip),%rax        # ffffffff83425cc0 <__stack_chk_guard>
> >                         ffffffff8100283b: R_X86_64_REX_GOTPCRELX
> >  __stack_chk_guard-0x4
> > ffffffff8100283f:       65 48 8b 00             mov    %gs:(%rax),%rax
> >
> > The LLVM linker keeps the R_X86_64_REX_GOTPCRELX even after performing
> > the relaxation.  It should be R_X86_64_32S based on it changing to an
> > LEA instruction.  The GNU linker changes it to R_X86_64_32S and a MOV
> > immediate.

Correction:  It should be R_X86_64_PC32 for the LEA instruction.

Brian Gerst
