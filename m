Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFD43EA8B
	for <llvm@lists.linux.dev>; Mon, 22 Jan 2024 19:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705952102; cv=none; b=X6sfiiKj3msflmc3I6Spg5HjRk9EtwFmlIfg+y+65czH884lmpYZJJ03ykyLvAqB3+hFKLAZsDNuPMCQO59dB2eVuWCtlglHjKB1FEtQ1wLZ9vlpnKQWw2gVotGGEwGBMn/j/qZBTUgqwAx2C31T90/Mjb0TLKfjbiN1auJl8WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705952102; c=relaxed/simple;
	bh=vdvpcTidybzQ1RK072QFzF5p8j2Hvk8YbCbq1G5RlCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gx8Vxc6IpSUUS9A+HsvOHbWbf0/ltTFuRXHwPyL2SbqixnQD/NWx5q0trPy4HG4FyxGfLmG3Xw8YAl77NVo3e1Mx0gw70cSRBc/MIyVU2fh2qdXF1B8xih6vgKjNwXON1S5jDJ/CQGqUaUs7zkVWdhgDBeSYXgEWhakCuJE3+as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDJAQYsz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDJAQYsz"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5100409e31eso190057e87.1
        for <llvm@lists.linux.dev>; Mon, 22 Jan 2024 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705952099; x=1706556899; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dsyX6o96ll0tborqmT2tH2D5yYkTiItob646Hhae/V0=;
        b=UDJAQYsza3DCIxZt5j0vFyW5UDFz7tgwXinEY9i4r01bAzbCukYK90sKpo1Y3FAzjY
         avaCsuqPY+ob0JVd7ZFGsPtwbV4e1W5yhLIH95F/vOkHUSMu5QS6OpD6NPjk16JNhM/l
         Tt/Dq2IkT+k8d/UYLkRTu5QbnyJ4huo3P42y1Mvi7ug+CxFbwTR0q/ClVLmRRApH5fq4
         pWPvqR4e80DXGkwfZvezZnc2EpiTRvpFSRRHMucLTx6IDTDNg5HYw7czo3oxtKipZD+5
         GR88pjcy1rm7E4pn7MRdh3DHZ7Ul8WRmnhDeyGiY5R4ZlTyIReXb/TPj5L6bpvZwBnKr
         6VAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705952099; x=1706556899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dsyX6o96ll0tborqmT2tH2D5yYkTiItob646Hhae/V0=;
        b=wSrTqlbRJ5IctsmAEnoeAGB1R4GfhDB1ZNnCMRzJAFH2AK1kH3wYHp0nOBiTQl+3D+
         DuhyzEmnknYkNcQcEK95x+jMVDnNleH+/Yu08JkKW6H/4lFHfKUJ+GwCi6ss3wgM9mLw
         WbjlHVbgpehRBaJbRG44xOJWCKjkUUUCCQu5FUN8PWZ8uIqGpmv3jxC34iUcE29Kz+CP
         mRIZn1A8jkhqqxw8UXN4VBmsIDadXHFc4/4yOZ2+YRmSRs2Yjy4tD3kYbbPJRmJgeryo
         ooxnvqIIMXzosaR+kSyvtBZAbftSnW5PZ3WpGR9gaof+OalGZDyZWVPu0J+obkxKI3iM
         Ieww==
X-Gm-Message-State: AOJu0YxAa6KLwZXI4gQf87rAz5dwLlECivMcEWYUVRunQC1GLSOK3FiP
	Q4GdK1FZpxt+7texdAoTcMLou4+Yq6JO3OBQs8ybFjdztv7EhBYdoReuBNKidf80PwdFV3bOBYR
	GFq92pUxXRVqMtGsAcqwPbRPXig==
X-Google-Smtp-Source: AGHT+IFitbZJ/8g2IdDBY826s8oZ0mtT6w1M0vukl8ff9CMkxM1Ayl6tSHcD4WdNXux41i0H/QurAc2g/9qBGoSonow=
X-Received: by 2002:ac2:5471:0:b0:50e:67c5:9854 with SMTP id
 e17-20020ac25471000000b0050e67c59854mr1869713lfn.123.1705952098697; Mon, 22
 Jan 2024 11:34:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240122090851.851120-7-ardb+git@google.com> <20240122090851.851120-11-ardb+git@google.com>
In-Reply-To: <20240122090851.851120-11-ardb+git@google.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Mon, 22 Jan 2024 14:34:46 -0500
Message-ID: <CAMzpN2jcWxCy=H-1uvS7kN8gVohee2_cMwyC0SbSEwEoedo3WQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] x86/head64: Replace pointer fixups with PIE codegen
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Kevin Loughlin <kevinloughlin@google.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Dionna Glaze <dionnaglaze@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arch@vger.kernel.org, bpf@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 22, 2024 at 4:14=E2=80=AFAM Ard Biesheuvel <ardb+git@google.com=
> wrote:
>
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Some of the C code in head64.c may be called from a different virtual
> address than it was linked at. Currently, we deal with this by using
> ordinary, position dependent codegen, and fixing up all symbol
> references on the fly. This is fragile and tricky to maintain. It is
> also unnecessary: we can use position independent codegen (with hidden
> visibility) to ensure that all compiler generated symbol references are
> RIP-relative, removing the need for fixups entirely.
>
> It does mean we need explicit references to kernel virtual addresses to
> be generated by hand, so generate those using a movabs instruction in
> inline asm in the handful places where we actually need this.
>
> While at it, move these routines to .inittext where they belong.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  arch/x86/Makefile                 |  11 ++
>  arch/x86/boot/compressed/Makefile |   2 +-
>  arch/x86/include/asm/init.h       |   2 -
>  arch/x86/include/asm/setup.h      |   2 +-
>  arch/x86/kernel/Makefile          |   4 +
>  arch/x86/kernel/head64.c          | 117 +++++++-------------
>  6 files changed, 60 insertions(+), 78 deletions(-)
>
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 1a068de12a56..bed0850d91b0 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -168,6 +168,17 @@ else
>          KBUILD_CFLAGS +=3D -mcmodel=3Dkernel
>          KBUILD_RUSTFLAGS +=3D -Cno-redzone=3Dy
>          KBUILD_RUSTFLAGS +=3D -Ccode-model=3Dkernel
> +
> +       PIE_CFLAGS :=3D -fpie -mcmodel=3Dsmall \
> +                     -include $(srctree)/include/linux/hidden.h
> +
> +       ifeq ($(CONFIG_STACKPROTECTOR),y)
> +               ifeq ($(CONFIG_SMP),y)
> +                       PIE_CFLAGS +=3D -mstack-protector-guard-reg=3Dgs
> +               endif

This compiler flag requires GCC 8.1 or later.  When I posted a patch
series[1] to convert the stack protector to a normal percpu variable
instead of the fixed offset, there was pushback over requiring GCC 8.1
to keep stack protector support.  I added code to objtool to convert
code from older compilers, but there hasn't been any feedback since.
Similar conversion code would be needed in objtool for this unless the
decision is made to require GCC 8.1 for stack protector support going
forward.

Brian Gerst

[1] https://lore.kernel.org/lkml/20231115173708.108316-1-brgerst@gmail.com/
