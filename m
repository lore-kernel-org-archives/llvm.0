Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB7D480952
	for <llvm@lists.linux.dev>; Thu,  6 Aug 2026 17:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786035814; cv=pass; b=FoLpNtr7gxj0a/y7jOvhjoa7kzao+39C78KvgKhn+721bhi0vy/Io5eFS8TV3Ol/1Q50zL2GvPgJRMf6cNx3Wdn0DScH89kCw5oo4c1BGw/uqnPrfcQwiRe3R8OLzq/AlUwWc084HClAAd7iGAIEp3h5/Y74Cl5i3y5PdsN7Vi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786035814; c=relaxed/simple;
	bh=cmCY59s0EpmlLY4IjQTAG1JUORR0FUnZ13qeFXbwCp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gwXLnnLxBsPO6A3YJOjupnwD6FUl6xwFLV8ppeZuDy6L+YjJayVvZ5tr7iNZLfznfMrReVeZLKiQJdKYqUzGl0F+fwTi798kvRGETEbxyQ0UpSfnhCaCbOMNg83do+zIcexlrtCk2Ky31RFjjRhiwSu117HLYX+qqyJ4+xo4vQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vSpbXp1b; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vSpbXp1b"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso1216938a12.1
        for <llvm@lists.linux.dev>; Thu, 06 Aug 2026 10:03:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786035811; cv=none;
        d=google.com; s=arc-20260327;
        b=Y8BF5jwIUp77O/IXDOyMhsEunrCxScR2SjBc7860NmNnyzeCbpUuUduMD1AccfKMHh
         zThYh1074UMdU28hMwMi928I8eUntG3fH5EHzJxdWByWLOOwndGRZOGIXsMR2dc5QueK
         jbFWIpn8MisxaVZsmVn343LIsznYzkysfNtffrFxjZjz9KmRoR7DhWaLwPVvKhvnh1l7
         jJnrFOswiWpYwqLSg5fIS3CeXc1Luz4uRzq0YMT1+pWSn+J0lBjgMBIu6D60fw6lVrF7
         MhdqmNNjE2xpSA8G26Gfu8K+9G3Ox76Gd0N4REC/WKrQLdUN7EuhR3G9AwLORnYdTTsq
         c4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0NCgKJNQYyisOrSyRYo+LoktmWrYev67LGXPZuiSqb8=;
        fh=Rh04CzFcSIqomJwYDS9vm9lycMLfN9HjvNlA+KcJMrg=;
        b=OhQZ1dWiwgINNdkQvniQzwlC2f6ZFXTp4zemRrzHIUYOzRRZHKZGdSz9TaeLZMKQVt
         r2+cL/VdoMyH1wAdYcGXBB+H2Ptwa6U3VLQPeFQ65KTbIoTSNzv8GrkuwcPnS80CknNw
         oVWpXxCfPCt3bB7xEZ0Ng2LfRx9cAq8QjACQM73mmhCtPR4uSlWJCQ7caA9THRnFG8ok
         LcbAehYPq+FegI+d4RNe5MYjzE0wav8JdVj/lvUmJwbHoQ6dC2AFiPF3xWDUy3XY9xaY
         kg5Sf2NJspLaQbF0VzCD3p4GZJv8Fd7IjKp+RcSBYXWysvZ75FDgGxDMMShEKb6eJdQo
         4O2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786035811; x=1786640611; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0NCgKJNQYyisOrSyRYo+LoktmWrYev67LGXPZuiSqb8=;
        b=vSpbXp1bvs3G9jbHwwsrFsCpdANn8RYPXi9pM7vIJslYvqsCimIaDjZIOJzMsqI93e
         phn/GwWinGCjizM0e0+/dn4HG5Vy+9FYq/wEaOvKeoSf1O4sh1OsoKEF+BEQyvOWypAO
         E5+GpGf26wXAn4iuq/MgsuqBlIY/i9rh3VoqDvKH/k4yNOtTQdhOmBiRG3ESP0oCzOXL
         P3PMVb6fgrK2RPfcyMXpLz5TRIG30co+AR79pNuBzWdf7JA84TY8xs52GSGW1cuF48vv
         eOlfCXWgfZwc+rx8KfowFcQ9ey2f0ZAkE2bx+mMDGx7zcVAKHii2QQUr/XJrDvmpjSGT
         YRow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786035811; x=1786640611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NCgKJNQYyisOrSyRYo+LoktmWrYev67LGXPZuiSqb8=;
        b=CVNJg/Ipc5fbI+KADhZ0w+SwxWxEaTxppnbZFcVW8XgyFIIzFXmb+vyy8tVpDvtmA+
         dmmBwb6B5rKMGTRfSCbG3O0c6gjTvw/uhQWhJQWU2bevqpYOCv4ulKCumF7bQ8i0y5SV
         65Yor1MmmvoN11w+JIxh68a6+rSb4t9CoUN9vgUk0/3t/+DUdALfZ0N0esmI8oxQ2+Fm
         eUavUjTz47tNLNE6iaYBT2G2PUdmpffDXvEBtyzt6Mz5Ki/HW7B6r4oEoIAyx4D5ZHEw
         JhE0uh7k7jFXY1nu3OSU7UlDYsPk+VTbDKS07b2BGGat3lU5DhDsKcFkNXfQzAtapkkQ
         kD+w==
X-Forwarded-Encrypted: i=1; AHgh+RrJORK6JuKi7lPx35/tZiIbLGY6hr1VQc+hb+ZCvREjPIoUXRcKD4DHraTS8z5U8eC1EKg6@lists.linux.dev
X-Gm-Message-State: AOJu0Yw03/5oTgTJ4TJsXSKRR1Jnv8An+DoYv+0dej5X26HKKdwBwL1V
	ZYVgV4KNkH1h9s3D/w/CdZaq2Wb9mbuZyfDM4DQtbJuhhO5eCx8GjBclVnGhck5Zv7hhJ9uElJf
	0Jtk6No+jgjGNI609KGVstYX9Zv1/w6AXMoJNQawd
X-Gm-Gg: AR+sD11ZNqkIBwhIukmfs3MfUb48g4OdNhUz0bUteOHk+D6ymMIIJ+phtDk2FgJu7kT
	BvuXTpuNOsBbHKK0siejpAHEbXJxL9rgE7lPEU/2Y47R5CevvAxX/POkQ2PF+8pHpzJJGKB9YN4
	fLkB5c5ghlZA+3vN4BL12iCMjO0zq/9bcAKLU43jTzi9Wz62UbLIrnpnxZcTZxMOLUAZwWE65xf
	f99CfN0TTEDPlzfVasyw/aeDiWeZqFbBFj1R9kviBuKAGCLxjZ6YhGOqzedbv+jNjgm7QfV0Z2O
	eJ3lfaykPJF0chzDp8LKGscqy+FkJ7cZAD9irEmwXXaPjNLAR9g3hV6NJxJFTB+n3mtfVA8vYL4
	GTlEB+4XIChXgSBqL2aHHgLdw9D9B0FIx8Z6Zfvj3QbqX1ZgrNFM7EN8e
X-Received: by 2002:a17:907:7b97:b0:c20:53c7:488d with SMTP id
 a640c23a62f3a-c207324a87amr163705766b.14.1786035810196; Thu, 06 Aug 2026
 10:03:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CGME20260805045522epcas5p39659721ef26a447b71e860c2990a60c0@epcas5p3.samsung.com>
 <20260805045514.1599433-1-maninder1.s@samsung.com>
In-Reply-To: <20260805045514.1599433-1-maninder1.s@samsung.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 6 Aug 2026 10:03:18 -0700
X-Gm-Features: AUfX_mwqECj1UQ2bXhTbYiugJepVhA28sAZJAaRUqvRHhnW-IzM-GwfSkmGLA-A
Message-ID: <CAKwvOdk=ydGGmeDnoYYNLhe0pSmDZ1FgSoB2W_985avY07Ga7g@mail.gmail.com>
Subject: Re: [PATCH v2] arm: backtrace-clang: fix wrong sp usage for unwinding
To: Maninder Singh <maninder1.s@samsung.com>
Cc: ardb@kernel.org, linux@armlinux.org.uk, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	onkarnath.1@samsung.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, r.thapliyal@samsung.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 9:55=E2=80=AFPM Maninder Singh <maninder1.s@samsung.=
com> wrote:
>
> show_stack() can be called for any task, but c_backtrace is always
> unwinding frames based on "sp" register.
>
> Which leads to printing backtrace of current task instead of
> required task.
>
> Try with normal TC:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>        for_each_process(p){
>                sched_show_task(p);
>        }
>
> [7.433271] task:kthreadd        state:S stack:0     pid:2     tgid:2     =
ppid:0      task_flags:0x208040 flags:0x00000000
> [7.433633] Call trace:
> [7.433640] [<80113418>] (dump_backtrace) from [<80113510>] (show_stack+0x=
14/0x18)
> ..
> [7.433676] [<8016749c>] (sched_show_task) from [<803cb324>] (meminfo_proc=
_show+0x6c/0x930)
> [7.434019]  r5:8158e300 r4:8b4882d0
> [7.434024] [<803cb324>] (meminfo_proc_show) from [<80365788>] (seq_read_i=
ter+0x148/0x4bc)
> [7.434045] [<80365788>] (seq_read_iter) from [<803c044c>] (proc_reg_read_=
iter+0xb8/0xc4)
> [7.434060] [<803c044c>] (proc_reg_read_iter) from [<80377104>] (copy_spli=
ce_read+0x228/0x308)
>
> It should unwind frame based on passed "fp".
> (CONFIG_UNWINDER_FRAME_POINTER=3Dy)
>
> Extra sp manipulation is needed only when c_backtrace()
> is called from dump_backtrace() with "frame =3D=3D fp" i.e.
> NULL regs and not current task. (Suggested by Ard Biesheuvel)
>
> Otherwise passed "fp" should be used to unwind backtraces.
>
> With fix:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> [13.933732] task:kthreadd        state:S stack:0     pid:2     tgid:2    =
 ppid:0      task_flags:0x208040 flags:0x00000000
> [13.934165] Call trace:
> [13.934604] [<80afa1a8>] (schedule) from [<8015426c>] (kthreadd+0x124/0x2=
08)
> [13.934654]  r10:8100bbf0 r4:8116f440
> [13.934664] [<8015426c>] (kthreadd) from [<8010010c>] (ret_from_fork+0x14=
/0x28)
> [13.934691] Exception stack(0xf081df9c to 0xf081dfe4)
>
> Signed-off-by: Onkarnath <onkarnath.1@samsung.com>
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

Suggested-by:  Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for reporting the issue and sending a patch. Thanks for Ard for
suggesting a better fix.
I assume you all know how to submit patches to
https://www.arm.linux.org.uk/developer/patches/ ?

> ---
> v1 -> v2: don't ignore sp manipulation completely, instead use it for NUL=
L regs.
>
>  arch/arm/lib/backtrace-clang.S | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/lib/backtrace-clang.S b/arch/arm/lib/backtrace-clan=
g.S
> index 290c52a60fc6..bf9738070af7 100644
> --- a/arch/arm/lib/backtrace-clang.S
> +++ b/arch/arm/lib/backtrace-clang.S
> @@ -107,8 +107,10 @@ ENDPROC(c_backtrace)
>
>  /*
>   * Switches the current frame to be the frame for dump_stack.
> + * (Only in case of current task using current registers)
>   */
> -               add     frame, sp, #24          @ switch to false frame
> +               cmp     frame, fp
> +               addeq   frame, sp, #24          @ switch to false frame
>  for_each_frame:        tst     frame, mask             @ Check for addre=
ss exceptions
>                 bne     no_frame
>
> --
> 2.34.1
>


--=20
Thanks,
~Nick Desaulniers
