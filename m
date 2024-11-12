Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70023204932
	for <llvm@lists.linux.dev>; Tue, 12 Nov 2024 05:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731389952; cv=none; b=L3TN1WORF79eSGCMeidUuS1MNx35vvm7c+QgKSTgGiOzBE7dIdNI0EDp/dWTUqLy+WlULDjdMcWi4OEFEaZcZI69zo3JDgmypsiWDa0XjfJoiGVhP9tAVACY9lh5nnef2OF6bbyeiwljSaJlIpw2rrygu2SoUieJo6Qhc4bu51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731389952; c=relaxed/simple;
	bh=uPqiSb8byFUHmsowxYv/8nM0c5ourBGwRMRpZWMY6HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V1seALFjnh//LTLyM0wqRi7r9RoEv7ErqK8uaZwz03Cbd9IODBotTYDGID5I4Jj3uObl5xO8hu1kEIRqxmJ/vfxnUhj7oFoIYsfPSy4cv41TrJcQ3V1+sYqvO+z9dVAAnBF3AyNs/LKgHFXgqoLOLAuOYRjDZL/vY6UIZdVg/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k1k9/PVy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k1k9/PVy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20c87b0332cso76665ad.1
        for <llvm@lists.linux.dev>; Mon, 11 Nov 2024 21:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731389950; x=1731994750; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55eFBaAwUzqb5NuE4EUBIHlElwP7vcU1g64jX0opSSs=;
        b=k1k9/PVy4T+Owm/UGt82Bw6cge7y9mxdDkhcaEDXPi2OnoYe4GqW7mU5n0O81h4F84
         zPKzgKDa+Yh1Cm7yHk8XeEzZJYfAMAr/jf32yR8FnPnSWuN9GR9nq3UtiAPU3G7jERIn
         zXAEvfBaXzFIh2uYIgdD+YzK6DrpXWh+GgAGT/dCqfGae5JHhUO6Mfz/TZSkheqU71f5
         9E2XbBAD8ORCLdyLlBuIFK7YYb6uOfSrBI4kpt9bPDeUD1MR9laM3bLWegDcJCh96TmE
         8Y3iaKyI+EJaIBkNm/0+ZMbLsVlVqdp3jdgzuXSAblWiUtOd09D5yqrRV9kz7Xfv3imE
         GraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731389950; x=1731994750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55eFBaAwUzqb5NuE4EUBIHlElwP7vcU1g64jX0opSSs=;
        b=T+fdKFBEH3q55wnlzmbTs2KCQb85/leoJuU3XO65K+dDzCtUotozNfEG4qhKGGSxqT
         SzVFSXMfsFuyrXdx4WH7jTwnSR3UHvo7CCaSo86ytwIFMvO6GoC213LOSiUaFSxzF47I
         EWb3GWWwDkCth53YMg72Y5Ihs4zoC2bbuRfbhcEBx3IcBHD42b0No2K7bndgp16kQyLK
         MY8tQ0X4BppYl5HjDTHc9EWfLJQULidlQtpNB4vYFKJ6R6qELaCrHQoaM+pW8IA9pUhH
         dHYrSL7RXZQLiGmYTPEvbFHiBXJmq1FAKyOc0fXebEJHZolb/bvvmg+xwaJhEZOMSiDi
         UsGg==
X-Forwarded-Encrypted: i=1; AJvYcCV4SOHD1cKfWm466BUnYHzYHOKn2/RWboTleG+p6M+u7acf4IxWTOclxkAbnCfINezfFqFt@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr0Rh8FTUvshAMPgVuElP6k7II6BDAuhNifkbOZMdHR6BSOCta
	PXRNOmahaRJcdlkziZUr53nfGZ2PVUnPVPYCP2axh2kXjwcJY0NBGPvdJkfinSXHfBSwj9CXI19
	Y7B1ihLk5xuY6GKcaKgZpyfKgIH49E+M6LNaH
X-Gm-Gg: ASbGncuXlPQpKb7zcYVgOYhB89x1eFIFphZ+WYZRi98CtOdtewTS/8ROweTFukmIRGv
	iq1ZRc5kNpnaT2PGsU6TtAKSoS+4CSazckX00p84lDrfWeehy/QwSupg6/rA=
X-Google-Smtp-Source: AGHT+IFsphJ8eFdvWIvqWQJAgfm/UGMVMERlMSqtsqzVfe10VnOKJwtxRF+0T1N3Dqc2Vm4wT9mbQhx6mGE7tRGz4Fc=
X-Received: by 2002:a17:902:d2cc:b0:1fc:548f:6533 with SMTP id
 d9443c01a7336-211ace77d55mr809315ad.3.1731389949340; Mon, 11 Nov 2024
 21:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com> <20241026051410.2819338-4-xur@google.com>
 <44193ca7-9d31-4b58-99cc-3300a6ad5289@gmail.com> <CAF1bQ=ShjoEQZGPjDoy_B6wZdD_jr-RevVXwEDPA_-o-Ba0Omg@mail.gmail.com>
 <e7cd2746-0ad8-452f-aa12-e3a37e8a9288@gmail.com> <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
In-Reply-To: <CAF1bQ=SYeeKLUTfbqw-KH1rHJCj_CfJBuk+mZUrnnb7aDjRV2A@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 11 Nov 2024 21:38:57 -0800
Message-ID: <CAF1bQ=R18HLC2vjCGj+M=VYidrVzz3RT=U8cckXgpgrxc0kG0Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] Adjust symbol ordering in text output section
To: Klara Modin <klarasmodin@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Wei Yang <richard.weiyang@gmail.com>, 
	workflows@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Maksim Panchenko <max4bolt@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Yabin Cui <yabinc@google.com>, Krzysztof Pszeniczny <kpszeniczny@google.com>, 
	Sriraman Tallam <tmsriram@google.com>, Stephane Eranian <eranian@google.com>, x86@kernel.org, 
	linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I compared the System.map files from Klara Modin. The linker script is
doing what I expected: relocating the unlikely executed functions to the
beginning of the .text section.

However, the problem is with the _stext symbol. It belongs to the
.text section, so
it is positioned after the unlikely (or hot) functions. But it really
needs to be
the start of the text section.

I checked all vmlinux.lds.S in arch/, I found that most archs
explicitly assign _stext to the same address as _text, with the
following 3 exceptions:
  arch/sh/kernel/vmlinux.lds.S
  arch/mips/kernel/vmlinux.lds.S
  arch/sparc/kernel/vmlinux.lds.S

Note that we already partially handled arch/sparc/kernel/vmlinux.lds.S
for sparc64.
But we need to handle sparc32 also.

Additionally, the boot/compressed/vmlinux.lds.S also the TEXT_TEXT
template. However,
I presume these files do not generate the .text.unlikely. or
.text.hot.* sections.

I sent the following patch to Klara because I don't have an
environment to build and test.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.=
S
index 9ff55cb80a64..5f130af44247 100644
--- a/arch/mips/kernel/vmlinux.lds.S
+++ b/arch/mips/kernel/vmlinux.lds.S
@@ -61,6 +61,7 @@ SECTIONS
        /* read-only */
        _text =3D .;      /* Text and read-only data */
        .text : {
+               _stext =3D .;
                TEXT_TEXT
                SCHED_TEXT
                LOCK_TEXT
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If Klara confirms the fix, I will send the patch for review.

Thanks,

-Rong


On Mon, Nov 11, 2024 at 2:39=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> In the new System.map, we have:
> ffffffff81112400 T _stext
>
> This looks wrong. It should point to the beginning of the text, like
> ffffffff81100400 T _stext
>
> I'll do some debugging on this.
>
> -Rong
>
> On Mon, Nov 11, 2024 at 1:32=E2=80=AFPM Klara Modin <klarasmodin@gmail.co=
m> wrote:
> >
> > On 2024-11-11 21:43, Rong Xu wrote:
> > > Thanks for reporting this issue!
> > >
> > > I'm assuming your kernel build enables dead code elimination and
> > > uses the --ffunction-sections compiler flag. Without this patch, all
> > > the functions
> > > -- I think there are only .text.unlikely.* and .text.* are grouped
> > > together in the
> > > final vmlinux. This patch modifies the linker script to place
> > > .text.unlikely.* functions
> > >   before .text.* functions. I've examined arch/mips/kernel/vmlinux.ld=
s.S, and
> > > haven't found any obvious issue.
> > >
> > > Can you send me the following?
> > > (1) the kernel build command
> > > (2) System.map without the patch
> > > (3) System.map with the patch
> > >
> > > Best regards,
> > >
> > > -Rong
> > >
> > I don't set -ffunction-sections explicitly but it seems to be used when
> > I look at the .cmd files. The build command is nothing fancy, I just se=
t
> > ARCH=3Dmips CROSS_COMPILE=3Dmips64-unknown-linux-gnuabin32- and build w=
ith
> > make -j24.
> >
> > I've attached the System.map, built on next-20241111 as well as it with
> > this series reverted.
> >
> > Regards,
> > Klara Modin
