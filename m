Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060FDEBE
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MYyJ7bcn"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-457c19ebb3aso1886015137.1
        for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 08:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697556433; x=1698161233; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8cg6jGLFG7A51F+ARcwLcIxkWY8BQUYMBYpLmYj4Ek=;
        b=MYyJ7bcnoT+ciqjbsWxSR5YqyqfLZlNhlprE2oE/E3oBPB/UIR5/8AAtCc+oM2KrbY
         XQHbv44ZxnlChs93ZDA1Hrd7C9xUGkwFgxIngPfolEDJsnNRPHc0JDyXK/TVgYJYKB2H
         QSOUw9CmorVLBqd2htHrd2N3OXghJd2shY31Q6NE3STqMLtcYqeO3wklCM0ePLXTxSGr
         83rFth99GP5yF673liBPVUkGo9uY88fc8Wqgfa21DcPcCLGxQBneIBvW1sg2DUtnVLmA
         rFCoTF1E2UaY+fX4Yafg/nK7CX33oc4SJ6MNijxF+spIMv6uUtqlfiR5n7rvJIkOqfzr
         0Q6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697556433; x=1698161233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8cg6jGLFG7A51F+ARcwLcIxkWY8BQUYMBYpLmYj4Ek=;
        b=VAolnCTIO2dtUJ7wnUsdfJVWy5puzSw+rnBm2ayFki9t7OBj7411H8NYElirSoStxp
         YSNgt5ku2OLyiovut3hCEGLK7z9BbgH52Gc2csiZvyzLuOd1zjyZHhHvhRQTfKLZ8n3T
         mx0J0O35B//7xdaeDKPN5fFy/p8HXAD9lJrl969ti6tpwvR4j1MCDQjctTEEjdu7rFqB
         ywOxOfuynGKhVCyw96Mu8m7z908QpWfKKjf3T2RtU5sEClpwte3nzgkB3VAbzPGK+Dlg
         l1b6eaKLdZqussiubiAHKX+IUe+rG+ORGV7vuUG8r3MrSXJ3xr27puSFjhiuVmZ4Vrj6
         D77A==
X-Gm-Message-State: AOJu0Yz6KZXke20NXVR9P3L6ucJGonnmd9TlUY2BTGxMMVTppqqDUDV4
	kq9azrj/HhFFTc6cW4hr1h88kfA/lEyVK2qTm91epg==
X-Google-Smtp-Source: AGHT+IEUOzsOIcQs2Itnk6BUDIEZuj0yvkvLTTMSnmIp8yWNGVYs2Zsqc2xNe0nLP+5/1uvEJRJpVEm0fE4anbp1rMk=
X-Received: by 2002:a67:c10f:0:b0:454:701c:7717 with SMTP id
 d15-20020a67c10f000000b00454701c7717mr2625620vsj.5.1697556432713; Tue, 17 Oct
 2023 08:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231012141031.GHZSf+V1NjjUJTc9a9@fat_crate.local>
 <169713303534.3135.10558074245117750218.tip-bot2@tip-bot2>
 <20231016211040.GA3789555@dev-arch.thelio-3990X> <20231016212944.GGZS2rSCbIsViqZBDe@fat_crate.local>
 <20231016214810.GA3942238@dev-arch.thelio-3990X> <SN6PR12MB270273A7D1AF5D59B920C94194D6A@SN6PR12MB2702.namprd12.prod.outlook.com>
 <20231017052834.v53regh66hspv45n@treble> <CAKwvOd=pA_gpxC9ZP-woRm2-+eSCSHtwvG3vsz9xugs-u3kAMQ@mail.gmail.com>
In-Reply-To: <CAKwvOd=pA_gpxC9ZP-woRm2-+eSCSHtwvG3vsz9xugs-u3kAMQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 17 Oct 2023 17:26:36 +0200
Message-ID: <CANpmjNPnP2_4oHSnhEO89ZhpqNfUg51XzL0awWVkYGNhxUayhw@mail.gmail.com>
Subject: Re: [tip: x86/bugs] x86/retpoline: Ensure default return thunk isn't
 used at runtime
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, "Kaplan, David" <David.Kaplan@amd.com>, 
	Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tip-commits@vger.kernel.org" <linux-tip-commits@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, "x86@kernel.org" <x86@kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Dmitry Vyukov <dvyukov@google.com>, 
	kasan-dev <kasan-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Oct 2023 at 17:24, Nick Desaulniers <ndesaulniers@google.com> wr=
ote:
>
> + Marco, Dmitry
>
> On Mon, Oct 16, 2023 at 10:28=E2=80=AFPM Josh Poimboeuf <jpoimboe@kernel.=
org> wrote:
> >
> > On Tue, Oct 17, 2023 at 04:31:09AM +0000, Kaplan, David wrote:
> > > Perhaps another option would be to not compile these two files with K=
CSAN, as they are already excluded from KASAN and GCOV it looks like.
> >
> > I think the latter would be the easy fix, does this make it go away?
>
> Yeah, usually when I see the other sanitizers being disabled on a per
> object basis, I think "where there's smoke, there's fire."
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/lkml/20231016214810.GA3942238@dev-arch.th=
elio-3990X/

Acked-by: Marco Elver <elver@google.com>

Instrumenting these files really doesn't make sense. Thanks for
catching this and the fix!

> >
> > diff --git a/init/Makefile b/init/Makefile
> > index ec557ada3c12..cbac576c57d6 100644
> > --- a/init/Makefile
> > +++ b/init/Makefile
> > @@ -60,4 +60,5 @@ include/generated/utsversion.h: FORCE
> >  $(obj)/version-timestamp.o: include/generated/utsversion.h
> >  CFLAGS_version-timestamp.o :=3D -include include/generated/utsversion.=
h
> >  KASAN_SANITIZE_version-timestamp.o :=3D n
> > +KCSAN_SANITIZE_version-timestamp.o :=3D n
> >  GCOV_PROFILE_version-timestamp.o :=3D n
> > diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
> > index 3cd6ca15f390..c9f3e03124d7 100644
> > --- a/scripts/Makefile.vmlinux
> > +++ b/scripts/Makefile.vmlinux
> > @@ -19,6 +19,7 @@ quiet_cmd_cc_o_c =3D CC      $@
> >
> >  ifdef CONFIG_MODULES
> >  KASAN_SANITIZE_.vmlinux.export.o :=3D n
> > +KCSAN_SANITIZE_.vmlinux.export.o :=3D n
> >  GCOV_PROFILE_.vmlinux.export.o :=3D n
> >  targets +=3D .vmlinux.export.o
> >  vmlinux: .vmlinux.export.o
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
