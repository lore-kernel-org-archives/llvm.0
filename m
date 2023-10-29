Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3DFB67F;
	Sun, 29 Oct 2023 17:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2hYC96y"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-507b9408c61so5115888e87.0;
        Sun, 29 Oct 2023 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698598861; x=1699203661; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehjbeH+jxTChtsEDDNVmACmNRPnSY/WOnY7rPP35b9Y=;
        b=e2hYC96yd1EFVHvep7cjMduqkLVR531ZVYJPGdfi0+oC5qyoxImY+HjljhVBIqqtgR
         mrGacUpL2NTueYFrblrEjMsUJSHaGoB6LlnEf6f8LRpefuhDMwYnFVfNW5+wIKzL2XEb
         TF7wM5Ih30c1crSApmCZoENkl674VYguufFceBQuIuRC2KYO3hIJA9fIp9RbrpWtZlU2
         EE8MvUD2sskl1YQKVlIqRyC4x2SGOFwuOD3EXUqgYAZFG23+26qOWAYU4JypIs67Jxyg
         8C1y2JLHeLXKK3QEIAnQVXTIxgPPHIn7ze/Qvp3hzruDto3gJQa9ioQ/mNDY9wFXDP6M
         wVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698598861; x=1699203661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehjbeH+jxTChtsEDDNVmACmNRPnSY/WOnY7rPP35b9Y=;
        b=l8OIr2pU2vnN4pDI+wFID0k8Ic/Y0oUO+3/683oKUt9ah3rWRPuadffTXzEfTboJFD
         r8wsOk0JUJrCAQipy1p/0ggenbdg9pXnRFuPPrhl6i8343jz0Xc7oFn6n0qzFh0CLCuC
         aUGTY7JvJ8c6Zx0ogXPeiZ6Aofuu7TUZQT4fkVonSP0OvFou7jvjKUMMeB5Pi5t0DJ+U
         kah2/gbEhP31YrvgfhEQ7r2OYGcaanXdUlRFOGbEAtKWL6NijoLywPzjmsM83EtgOZe5
         8O4LoFFtOYZrnL00COqmcmlhQlhmSkfRXTmamIW/SgIpyOPBJtARs+Dj5BLSa+lYsMWd
         hmqQ==
X-Gm-Message-State: AOJu0YwRX2/uybum2WKdQvanwLSt4We0cdnCD85JZliM1hdMDTNypEe7
	zQcdNCpBcPUvMuvy0QzY9FgwYvLwAPylAI3hdA==
X-Google-Smtp-Source: AGHT+IFKCpOGLZM3vnrbaQNLC02/9n872COebcZttUxqu3qsZgdz3ReGjJKaiOKOb1YwcsyY+uu298DRgw3zKzReggA=
X-Received: by 2002:a05:6512:159f:b0:507:ce49:81bd with SMTP id
 bp31-20020a056512159f00b00507ce4981bdmr6417655lfb.61.1698598860373; Sun, 29
 Oct 2023 10:01:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231026160100.195099-6-brgerst@gmail.com> <202310290927.2MuJJdu9-lkp@intel.com>
 <CAMzpN2iUrfnuGQ9eFTr=NTeC6KSUPC37Qji5_g5MWejmXnXO3A@mail.gmail.com>
In-Reply-To: <CAMzpN2iUrfnuGQ9eFTr=NTeC6KSUPC37Qji5_g5MWejmXnXO3A@mail.gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Sun, 29 Oct 2023 13:00:49 -0400
Message-ID: <CAMzpN2jbA=ZCbbFq=gyVAtKBr4kyYcNPLpWaEcAhEAN2J0wwTw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] x86/stackprotector/64: Convert stack protector
 to normal percpu variable
To: kernel test robot <lkp@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 2:56=E2=80=AFAM Brian Gerst <brgerst@gmail.com> wro=
te:
>
> On Sat, Oct 28, 2023 at 9:26=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Brian,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on tip/master]
> > [also build test ERROR on next-20231027]
> > [cannot apply to tip/x86/core dennis-percpu/for-next linus/master tip/a=
uto-latest v6.6-rc7]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/x86-=
stackprotector-32-Remove-stack-protector-test-script/20231027-000533
> > base:   tip/master
> > patch link:    https://lore.kernel.org/r/20231026160100.195099-6-brgers=
t%40gmail.com
> > patch subject: [PATCH v2 05/11] x86/stackprotector/64: Convert stack pr=
otector to normal percpu variable
> > config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/2=
0231029/202310290927.2MuJJdu9-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.gi=
t ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20231029/202310290927.2MuJJdu9-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202310290927.2MuJJdu9-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> Unsupported relocation type: unknown type rel type name (42)
>
> Clang is generating a new relocation type (R_X86_64_REX_GOTPCRELX)
> that the relocs tool doesn't know about.  This is supposed to allow
>         movq    __stack_chk_guard@GOTPCREL(%rip), %rax
>         movq    %gs:(%rax), %rax
> to be relaxed to
>         leaq    __stack_chk_guard(%rip), %rax
>         movq    %gs:(%rax), %rax
>
> But why is clang doing this instead of what GCC does?
>         movq    %gs:__stack_chk_guard(%rip), %rax

Digging a bit deeper, there also appears to be differences in how the
linkers behave with this new relocation:

make CC=3Dclang LD=3Dld:
ffffffff81002838:       48 c7 c0 c0 5c 42 83    mov    $0xffffffff83425cc0,=
%rax
                        ffffffff8100283b: R_X86_64_32S  __stack_chk_guard
ffffffff8100283f:       65 48 8b 00             mov    %gs:(%rax),%rax

make CC=3Dclang LD=3Dld.lld:
ffffffff81002838:       48 8d 05 81 34 42 02    lea
0x2423481(%rip),%rax        # ffffffff83425cc0 <__stack_chk_guard>
                        ffffffff8100283b: R_X86_64_REX_GOTPCRELX
 __stack_chk_guard-0x4
ffffffff8100283f:       65 48 8b 00             mov    %gs:(%rax),%rax

The LLVM linker keeps the R_X86_64_REX_GOTPCRELX even after performing
the relaxation.  It should be R_X86_64_32S based on it changing to an
LEA instruction.  The GNU linker changes it to R_X86_64_32S and a MOV
immediate.

So I think there are two issues here.  1) clang is producing code
referencing the GOT for stack protector accesses, despite -fno-PIE on
the command line and no other GOT references, and 2) ld.lld is using
the wrong relocation type after the relaxation step is performed.

I think the quick fix here is to teach the relocs tool about this new
relocation.  It should be able to be safely ignored since it's
PC-relative.  The code clang produces is functionally correct,
although not optimal.

Brian Gerst
