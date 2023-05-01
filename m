Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721E4567B
	for <llvm@lists.linux.dev>; Mon,  1 May 2023 17:18:46 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-b9246a5f3feso4778506276.1
        for <llvm@lists.linux.dev>; Mon, 01 May 2023 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682961525; x=1685553525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDAy0yw2Hl6Xad3kepfPR0FriSjDMaQH5Y0jnLgi2V4=;
        b=oDAyKLSdxWeDf2Rr539YuGPN8WIpEGf8MZUyaYq5jr+2u5r+cTYAw2jASoneiiCznU
         2SvyyFMMDnvtDUHjWd0FR1VXwxNkJF1Db2fr3bNgMpEqVPMJ7oTUtw4hQgx3+k8EZndj
         FscTv8obyqztv1iAv4Pz/neD2LiCUt46YSdAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682961525; x=1685553525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDAy0yw2Hl6Xad3kepfPR0FriSjDMaQH5Y0jnLgi2V4=;
        b=JZ1wNejwI/p7x8zfIFPI8CHjGaeI+rtpy3K+PC16inMxIkfEow3eEY06uVObHM6yf1
         F3jN+e2+4N8Dyv4o5/4dbD03vZuAqVWOTPffOTS/CcGGWUvQ5iR69e5C1ruCd8H/CpKp
         aruzaP7UZvSEOrBxNxzuVQy4JvuoAJr5THzriUfvuEb43Ziufi18XNF1PsWVq6bh0cLZ
         MCey4ixrxH4YjEuFnysqjOXld1nw+yzcODjXsaNJDZ7rd4rZTNUZqLkLLOPiLwGKvhOD
         GfC8Zy8QjGl8wMH3Z0oBwAwiOOpx1Gma6xqYGUwSKhlhwRQAhLifgIvFlB4Gy/COSXUm
         arYQ==
X-Gm-Message-State: AC+VfDy5uaafpOLiWK8AkwVeRwGt4m2ktH3vNVg4NQoFPOUEZejfdtvb
	esic+WB5b74SZnGw+bcjNsOLNyG9ECidWz7UKOuSCQ==
X-Google-Smtp-Source: ACHHUZ49DuqPozlJ4Toh+0ypEPsnOtwsD74mu38CnVKUHUAT6BfkiYl6rbc3wkEpDkbmjJ/NTxFrGQ==
X-Received: by 2002:a25:4f56:0:b0:b9d:689d:7430 with SMTP id d83-20020a254f56000000b00b9d689d7430mr10056339ybb.49.1682961525210;
        Mon, 01 May 2023 10:18:45 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id a82-20020a251a55000000b00b8f3e224dcesm950211yba.13.2023.05.01.10.18.44
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 10:18:45 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b9dcd91a389so3096343276.2
        for <llvm@lists.linux.dev>; Mon, 01 May 2023 10:18:44 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:1a8:1c9a:f68 with SMTP id
 h15-20020a170902f70f00b001a81c9a0f68mr17818554plo.36.1682961504069; Mon, 01
 May 2023 10:18:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org> <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
In-Reply-To: <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 May 2023 19:18:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
Message-ID: <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Philipp Rudo <prudo@linux.vnet.ibm.com>, 
	Dave Young <dyoung@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Baoquan He <bhe@redhat.com>, 
	Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Simon Horman <horms@kernel.org>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nick

Thanks for catching this. It should have said

risc/purgatory: Remove profile optimization flags

Will fix it on my local branch in case there is a next version of the
series. Otherwise, please the maintainer fix the subject.

Thanks!

On Mon, 1 May 2023 at 18:19, Nick Desaulniers <ndesaulniers@google.com> wro=
te:
>
> On Mon, May 1, 2023 at 5:39=E2=80=AFAM Ricardo Ribalda <ribalda@chromium.=
org> wrote:
> >
> > If PGO is enabled, the purgatory ends up with multiple .text sections.
> > This is not supported by kexec and crashes the system.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 930457057abe ("kernel/kexec_file.c: split up __kexec_load_purago=
ry")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>
> Hi Ricardo,
> Thanks for the series.  Does this patch 4/4 need a new online commit
> description? It's not adding a linker script (maybe an earlier version
> was).
>
> > ---
> >  arch/riscv/purgatory/Makefile | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makef=
ile
> > index 5730797a6b40..cf3a44121a90 100644
> > --- a/arch/riscv/purgatory/Makefile
> > +++ b/arch/riscv/purgatory/Makefile
> > @@ -35,6 +35,11 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
> >  CFLAGS_string.o :=3D -D__DISABLE_EXPORTS
> >  CFLAGS_ctype.o :=3D -D__DISABLE_EXPORTS
> >
> > +# When profile optimization is enabled, llvm emits two different overl=
apping
> > +# text sections, which is not supported by kexec. Remove profile optim=
ization
> > +# flags.
> > +KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D% -fprofile-use=
=3D%,$(KBUILD_CFLAGS))
> > +
> >  # When linking purgatory.ro with -r unresolved symbols are not checked=
,
> >  # also link a purgatory.chk binary without -r to check for unresolved =
symbols.
> >  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib
> >
> > --
> > 2.40.1.495.gc816e09b53d-goog
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Ricardo Ribalda
