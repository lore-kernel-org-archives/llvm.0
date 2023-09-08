Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BA630FB5
	for <llvm@lists.linux.dev>; Fri,  8 Sep 2023 21:52:23 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4935f2d6815so1509976e0c.1
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 14:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694209942; x=1694814742; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m43PrEMsLZP2EQdS/bT6AbnWiwNqqhpPB/h3QciEWyw=;
        b=Iyb27LtcoKIx/tTzJw0YVgmkQL27PLxBSUrNXvRLsfFNAu5VoHtDlP96d3OqDAw5W8
         q47RfKQff57lswbY4LtAQm7JTN2dLBSrN/ZWpt4uD8gYjC2/1hzmx0fL4YWVGG/kZWQ5
         R5smgHlh5L0q/Kz+Z/8nApbuOctvHUYfTwfUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694209942; x=1694814742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m43PrEMsLZP2EQdS/bT6AbnWiwNqqhpPB/h3QciEWyw=;
        b=hjN8EPslLmts6nsCF0XOEWZrmFMnOsQ05XtBL2SGg37SHp7QTEepX2IRr8GAOsNC14
         Vun/yX2dk9BLD0/SiEcP0+YfHR05scdMTENy7c4Bji7RiRK1xXmr+0RBBjCcg6judtH/
         cZSPesrzyEh9f9bC2/w6NhAZDm9IToN/4XpIV6QJUSuaufvQUz3Ce1YWiNR8JzVEhHmr
         ZEacRr00wo/hXP442fbMS+BQ1DmWK5Ai1AOsZObKHHV4cpD9+puaoU/AhELC3q5c/REc
         tWw4WICkqcf9pXtjZ7SdjWwIEoHldd3e3yRp8mYvgR/EzvkAa6kanVzrCqPM1F3p0Of9
         ObNw==
X-Gm-Message-State: AOJu0YyeX/RXUZaciHJzpdvqlSz4+VwfX0KqriBs0VmBicSWhIC63Tcx
	ccqqmK5DyVxCxnXi8D+LsO4V9oFWAZxwFHC/Y/c=
X-Google-Smtp-Source: AGHT+IGNoHdAv3a43Q+PsYMqm1lClSQSuKmmh7uNiE74Qcc3jE3AKsHeIFPk/7OAAp2F3slwIucVNQ==
X-Received: by 2002:a05:6122:368e:b0:48f:f026:27e7 with SMTP id ec14-20020a056122368e00b0048ff02627e7mr2499288vkb.3.1694209942681;
        Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id m2-20020a05612210e200b0048fc30bf520sm496105vko.10.2023.09.08.14.52.22
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-44e8984b724so1491015137.1
        for <llvm@lists.linux.dev>; Fri, 08 Sep 2023 14:52:22 -0700 (PDT)
X-Received: by 2002:ad4:5f0d:0:b0:651:6604:bee6 with SMTP id
 fo13-20020ad45f0d000000b006516604bee6mr9638376qvb.30.1694209920738; Fri, 08
 Sep 2023 14:52:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230321-kexec_clang16-v7-0-b05c520b7296@chromium.org>
 <CAPhsuW5_qAvV0N3o+hOiAnb1=buJ1pLzqYW9D+Bwft6hxJvAeQ@mail.gmail.com>
 <CANiDSCu2YLaXv2DkfzN0GbTF1b79HnqPG=GWqodDr4X9krGjUA@mail.gmail.com> <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
In-Reply-To: <CAPhsuW5JDPk7ZEthu7cowqp6emQOXsWgSvPM+kvnERPq4RR83w@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 8 Sep 2023 23:51:47 +0200
X-Gmail-Original-Message-ID: <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
Message-ID: <CANiDSCtbo1ws7hTgeha8+V8g198GN1_NAdWV+9Hi5UZgk0cfUA@mail.gmail.com>
Subject: Re: [PATCH v7 0/4] kexec: Fix kexec_file_load for llvm16 with PGO
To: Song Liu <song@kernel.org>
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
	Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	stable@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Song

On Fri, 8 Sept 2023 at 23:48, Song Liu <song@kernel.org> wrote:
>
> Hi Ricardo,
>
> Thanks for your kind reply.
>
> On Fri, Sep 8, 2023 at 2:18=E2=80=AFPM Ricardo Ribalda <ribalda@chromium.=
org> wrote:
> >
> > Hi Song
> >
> > On Fri, 8 Sept 2023 at 01:08, Song Liu <song@kernel.org> wrote:
> > >
> > > Hi Ricardo and folks,
> > >
> > > On Fri, May 19, 2023 at 7:48=E2=80=AFAM Ricardo Ribalda <ribalda@chro=
mium.org> wrote:
> > > >
> > > > When upreving llvm I realised that kexec stopped working on my test
> > > > platform.
> > > >
> > > > The reason seems to be that due to PGO there are multiple .text sec=
tions
> > > > on the purgatory, and kexec does not supports that.
> > > >
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > >
> > > We are seeing WARNINGs like the following while kexec'ing a PGO and
> > > LTO enabled kernel:
> > >
> > > WARNING: CPU: 26 PID: 110894 at kernel/kexec_file.c:919
> > > kexec_load_purgatory+0x37f/0x390
> > >
> > > AFAICT, the warning was added by this set, and it was triggered when
> > > we have many .text sections
> > > in purgatory.ro. The kexec was actually successful. So I wonder
> > > whether we really need the
> > > WARNING here. If we disable LTO (PGO is still enabled), we don't see
> > > the WARNING any more.
> > >
> > > I also tested an older kernel (5.19 based), where we also see many
> > > .text sections with LTO. It
> > > kexec()'ed fine. (It doesn't have the WARN_ON() in
> > > kexec_purgatory_setup_sechdrs).
> >
> > You have been "lucky" that the code has chosen the correct start
> > address, you need to modify the linker script of your kernel to
> > disable PGO.
> > You need to backport a patch like this:
> > https://lore.kernel.org/lkml/CAPhsuW5_qAvV0N3o+hOiAnb1=3DbuJ1pLzqYW9D+B=
wft6hxJvAeQ@mail.gmail.com/T/#md68b7f832216b0c56bbec0c9b07332e180b9ba2b
>
> We already have this commit in our branch. AFAICT, the issue was
> triggered by LTO. So something like the following seems fixes it
> (I haven't finished the end-to-end test yet). Does this change make
> sense to you?

if the end-to-end works, please send it as a patch to the mailing list.

Thanks! :)

>
> Thanks again,
> Song
>
> diff --git i/arch/x86/purgatory/Makefile w/arch/x86/purgatory/Makefile
> index 8f71aaa04cc2..dc306fa7197d 100644
> --- i/arch/x86/purgatory/Makefile
> +++ w/arch/x86/purgatory/Makefile
> @@ -19,6 +19,10 @@ CFLAGS_sha256.o :=3D -D__DISABLE_EXPORTS
>  # optimization flags.
>  KBUILD_CFLAGS :=3D $(filter-out -fprofile-sample-use=3D%
> -fprofile-use=3D%,$(KBUILD_CFLAGS))
>
> +# When LTO is enabled, llvm emits many text sections, which is not suppo=
rted
> +# by kexec. Remove -flto=3D* flags.
> +KBUILD_CFLAGS :=3D $(filter-out -flto=3D%,$(KBUILD_CFLAGS))
> +
>  # When linking purgatory.ro with -r unresolved symbols are not checked,
>  # also link a purgatory.chk binary without -r to check for unresolved sy=
mbols.
>  PURGATORY_LDFLAGS :=3D -e purgatory_start -z nodefaultlib



--=20
Ricardo Ribalda
