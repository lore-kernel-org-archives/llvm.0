Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1B81A7AF7
	for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733931523; cv=none; b=sC+Xthdntyl6BTVG7t6PN3NhMsxFh078jGzbef0uy+4F3bOIm9+Hdw545UOuLNCfLazEbZlW/39Kyy9CkqkVfAugicj0XT03cirB0LfTZY2GQN9iL/MfsIvcowBQQcQP3DbWOJInVmpSixMs8JlpLmd8EsjRdQKnH7UmvFNhqNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733931523; c=relaxed/simple;
	bh=9rg3aqLlSI0eKt0CZdNbjCfE+IwjwdCxW3GhWjYdHoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gd0TzJBr+Al8fR/kH3n5xuDWowQt2Uh4gAMNkgxZrT/DwLy3c0oQjzXKz/18KNkIxz5YLqeelSCdN9Vl/q7TRxxdvHlqC7ZAsM4jpra/rFVJOQzmwpo/2qTygjnQK07aU/Tzv6urXQR4o1CM1nmKu7sj5cQAK2+Fxz1PGIrtZb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgbWMrR+; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgbWMrR+"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ef6af22ea8so4960948a91.0
        for <llvm@lists.linux.dev>; Wed, 11 Dec 2024 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733931521; x=1734536321; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18e2v39B/bPfaKlPN/TzoeLdxl2IwZlzeUqyUF3qyhY=;
        b=DgbWMrR+OWRD+PYfMcBlOcoWIj9oTtp1rChLpbVxH/iUZGQHmndlXz+P/8O91Zpwk6
         GSxe/tDzb8XD5VfxUx3Q7JxCxvjnbP16+0nEUUh30BpwgLJyYnPK2edt9vY/SYK2iMmk
         DjLQwEBZbMcTAWyzc5sB1q0NOJxJICaDs2GJPHmCkmndljWYj4Q0KWlKhkWBhlpE64jK
         E7s9R5C1EDMeygvM54NagdjMMGFksixDJ5MRPSDPbzpk2PHQu4p/7OaeRnGcckaFTQs5
         ywin001EZTUFgvm/8Ey59nQgQDIEsAyL21yrfuQiTLG0mW3QCWA+0l6xqEVxAOGz45QQ
         tZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733931521; x=1734536321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18e2v39B/bPfaKlPN/TzoeLdxl2IwZlzeUqyUF3qyhY=;
        b=bhltDDtyRjILkumgYCQiyORvw2+A6WEWAWtD6EN2gHdoiKwemoPvB3DBD7tgTJlyQv
         N07CBus+HAg23FpsFY2Vc2M4FZjAF33pezbRR+Z7Yll/RZc/A08LlhKg3p/PfMAdKd5q
         Gf6luFz+g/+xsopa0iRngVUCH3Rt2VRsJ4epIRFOeFjelYMAMw8c6sz+73SoZ+v28uqW
         5Qg83dTt0LLUUy5J40/huSegY8WyqDHJ91MPxpvIfI6FKueQczA9S8YQc9mxRQDVWcWR
         +YsUYj2W/PQHLo8rk5SKRLSOVepX95XZ9ghLV8Wdtz2syDdrQdIyZs6WO0HCfiK/jf0r
         VQFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMExzNtSJk2KjhJoV6BCQtit04ddlFg/UndmdvjexwxE6QUPsfaB4amuWec4huiuwcxEZ6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6KqbOOI0yO8rbBI5HInRw23KmcdBymnvBh4ZTo0VfAvSJ2fVB
	jz+Ca3NV9kcWIMyAVY7DwcG0O9rhDQurTs9mIDzxA8EnCh+yEiPwYIe4Ipl9BH8slxRy0D3+Szt
	lLPDJk+Pa6EYpLitOYuwpRDIxbuY=
X-Gm-Gg: ASbGnctJQbZmrXdofCSEfwnYvXekRmySGykIvopwdgFpXU9FoDO2qualnqlJ4LQ8Gj8
	Ni3cbVLLI3TCsceeq2lz7uLg4zEEfTlRf
X-Google-Smtp-Source: AGHT+IEq0jYPTX3+n9BZVBCd0Bm5hwAq42ViV4hXY2XE8GFJW3Hbww3znuQj55n/BAPeP3l9fyVPrbBKc676oLk7KyI=
X-Received: by 2002:a17:90b:3b49:b0:2ee:8a5d:d520 with SMTP id
 98e67ed59e1d1-2f12802cf76mr4200747a91.23.1733931521209; Wed, 11 Dec 2024
 07:38:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127172908.17149-1-andybnac@gmail.com> <62f06687-a20d-4f55-b22d-52af707b528a@yadro.com>
In-Reply-To: <62f06687-a20d-4f55-b22d-52af707b528a@yadro.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 11 Dec 2024 23:38:30 +0800
Message-ID: <CAFTtA3OLkteZq1G0bi7La3r1RDc7K9fZvnApYdwqcs+9pMfs4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] riscv: ftrace: atmoic patching and preempt improvements
To: Evgenii Shatokhin <e.shatokhin@yadro.com>
Cc: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, bjorn@rivosinc.com, 
	puranjay12@gmail.com, alexghiti@rivosinc.com, yongxuan.wang@sifive.com, 
	greentime.hu@sifive.com, nick.hu@sifive.com, nylon.chen@sifive.com, 
	tommy.wu@sifive.com, eric.lin@sifive.com, viccent.chen@sifive.com, 
	zong.li@sifive.com, samuel.holland@sifive.com, linux@yadro.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Evgenii,

Evgenii Shatokhin <e.shatokhin@yadro.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=
=882=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=883:58=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> Hi,
>
> On 27.11.2024 20:29, Andy Chiu wrote:
> > This series makes atmoic code patching possible in riscv ftrace. A
> > direct benefit of this is that we can get rid of stop_machine() when
> > patching function entries. This also makes it possible to run ftrace
> > with full kernel preemption. Before this series, the kernel initializes
> > patchable function entries to NOP4 + NOP4. To start tracing, it updates
> > entries to AUIPC + JALR while holding other cores in stop_machine.
> > stop_machine() is required because it is impossible to update 2
> > instructions, and be seen atomically. And preemption must have to be
> > prevented, as kernel preemption allows process to be scheduled out whil=
e
> > executing on one of these instruction pairs.
> >
> > This series addresses the problem by initializing the first NOP4 to
> > AUIPC. So, atmoic patching is possible because the kernel only has to
> > update one instruction. As long as the instruction is naturally aligned=
,
> > then it is expected to be updated atomically.
> >
> > However, the address range of the ftrace trampoline is limited to +-2K
> > from ftrace_caller after appplying this series. This issue is expected
> > to be solved by Puranjay's CALL_OPS, where it adds 8B naturally align
> > data in front of pacthable functions and can  use it to direct executio=
n
> > out to any custom trampolines.
> >
> > The series is composed by three parts. The first part cleans up the
> > existing issues when the kernel is compiled with clang.The second part
> > modifies the ftrace code patching mechanism (2-4) as mentioned above.
> > Then prepare ftrace to be able to run with kernel preemption (5,6)
> >
> > An ongoing fix:
> >
> > Since there is no room for marking *kernel_text_address as notrace[1] a=
t
> > source code level, there is a significant performance regression when
> > using function_graph with TRACE_IRQFLAGS enabled. There can be as much =
as
> > 8 graph handler being called in each function-entry. The current
> > workaround requires us echo "*kernel_text_address" into
> > set_ftrace_notrace before starting the trace. However, we observed that
> > the kernel still enables the patch site in some cases even with
> > *kernel_text_address properly added in the file While the root cause is
> > still under investagtion, we consider that it should not be the reason
> > for holding back the code patching, in order to unblock the call_ops
> > part.
> >
> > [1]: https://lore.kernel.org/linux-riscv/20240613093233.0b349ed0@rorsch=
ach.local.home/
> >
> > Changes in v3:
> > - Add a fix tag for patch 1
> > - Add a data fence before sending out remote fence.i (6)
> > - Link to v2: https://lore.kernel.org/all/20240628-dev-andyc-dyn-ftrace=
-v4-v2-0-1e5f4cb1f049@sifive.com/
> >
> > Changes in v2:
> > - Drop patch 1 as it is merged through fixes.
> > - Drop patch 2, which converts kernel_text_address into notrace. As
> >    users can prevent tracing it by configuring the tracefs.
> > - Use a more generic way in kconfig to align functions.
> > - Link to v1: https://lore.kernel.org/r/20240613-dev-andyc-dyn-ftrace-v=
4-v1-0-1a538e12c01e@sifive.com
> >
> >
> > Andy Chiu (7):
> >    riscv: ftrace: support fastcc in Clang for WITH_ARGS
> >    riscv: ftrace: align patchable functions to 4 Byte boundary
> >    riscv: ftrace: prepare ftrace for atomic code patching
> >    riscv: ftrace: do not use stop_machine to update code
> >    riscv: vector: Support calling schedule() for preemptible Vector
> >    riscv: add a data fence for CMODX in the kernel mode
> >    riscv: ftrace: support PREEMPT
> >
> >   arch/riscv/Kconfig                 |   4 +-
> >   arch/riscv/include/asm/ftrace.h    |  11 +++
> >   arch/riscv/include/asm/processor.h |   5 ++
> >   arch/riscv/include/asm/vector.h    |  22 ++++-
> >   arch/riscv/kernel/asm-offsets.c    |   7 ++
> >   arch/riscv/kernel/ftrace.c         | 133 ++++++++++++----------------=
-
> >   arch/riscv/kernel/mcount-dyn.S     |  25 ++++--
> >   arch/riscv/mm/cacheflush.c         |  15 +++-
> >   8 files changed, 135 insertions(+), 87 deletions(-)
> > ---
> > base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
> > --
> > 2.39.3 (Apple Git-145)
>
> I have tested this series in a QEMU VM (-machine virt) with the
> preemptible kernels, CONFIG_PREEMPT=3Dy.
>
> No issues have been revealed so far.
>
> One of the kernels was built by GCC 13.2.0 (with the patch for minimum
> alignment added on top of it), the other - with LLVM 17.0.6.
>
> In both cases, the basic boottime tests for Ftrace passed.
>
> Switching tracers between nop, function, function_graph and blk in a
> loop in parallel with stress-ng and with network load for several hours
> did not reveal any problems either. Kernel crashes happened in this
> scenario a year ago, but now it runs clean, good!
>
> Function redirection via Ftrace seems to work OK too.
>
> The size of .text section increased slightly after this series, by 0.35%
> - 0.38%, probably because of function alignment:
> * 12075 KB =3D> 12121 KB (GCC)
> * 12167 KB =3D> 12209 KB (LLVM/clang)
>
> Not sure, how to test the vector-related part though, "[PATCH v3 5/7]
> riscv: vector: Support calling schedule() for preemptible Vector"

This should be tested as long as both the kernel is compiled with
RISCV_ISA_V and PREEMPT, and the hardware supports v.

And thanks for the extensive testing

>
> For all other patches in the series:
> Tested-by: Evgenii Shatokhin <e.shatokhin@yadro.com>
>
> Regards,
> Evgenii
