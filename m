Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895756FA7
	for <llvm@lists.linux.dev>; Thu,  3 Aug 2023 20:50:14 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-63d30b90197so8397276d6.0
        for <llvm@lists.linux.dev>; Thu, 03 Aug 2023 13:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691095813; x=1691700613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXEBAyFJFbYeh0GfNg35wWnEZbFECcO5ZYIOzORkkp0=;
        b=2lzRkoN3T98wTMebW/2Qq42a7bMP88a8JdxhWr9S2uN8aa5XW4HKJ49SmbYwRnvC9L
         Iy/GgOi0bdIZtrdCSDZEffaAwJ1tiMWXNd/p5tQ3aPm2r7/XYXxBCAVVG4H2oUjv5GHQ
         E/vBMomX2egESgjpYIk5y1dy4NKRLeTSKX2Slbb63Y19wXZBz2l4drVZFunV/GMgsNIL
         w2NycADenBYqkYH/EjZlhHZHqEd1HGRG1PoWhodJieSXT+BmrS79+yF+FOnkeIpzcfvc
         jEoM8gzXKXcYzjWoAdcXNMRFmgXUyTqmoSB1kSTTA0V6m+rnzVMVOR4yeqCkulaKmJhK
         CPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691095813; x=1691700613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yXEBAyFJFbYeh0GfNg35wWnEZbFECcO5ZYIOzORkkp0=;
        b=iENG6EKsCq/VElsdqKi3buUq8OLZViHI7X2RLQstWvDoT34VaIPU1Ve1IxEsvU7+AW
         XEbPauWiG+jlWv3TEy+wNbAyqBaW5Bm37xmvHKA58g8zOZqh2GXj3sCdrTii5ca5IOQO
         i/GfdnWDpfsfyb7/ygNo475kMgfQxmOo+1bKngqVDnTglX2FoKmOSGPk1QWNVDNk1Ept
         sFERJsIOvNo6oNVHgUJyHqD6hkHcn5Rjg/898qRoKW9mSt1Jut2BWS2AzVffdW7UlhER
         729otCQTn/kP3sxQr+26IGChxCdEwEj5N5P8QnOY/xYR3RorXFKToKMgI6mH6STWidBf
         wNhg==
X-Gm-Message-State: ABy/qLbRZFGOyseiFobB3b2+9YYT4rpmeZa4vUlYRtACR/rwW9aW3jEY
	QQKg+XORbdEPiOhCZu6WuqTgX92FKsB+2kPUYuuxf4f4gxDX1ScX6Nc88g==
X-Google-Smtp-Source: APBJJlEi+U0yRbR0xEFEgBiTrvPcZqH73Ed2f0Qner5SKRDMXME9DMZGWe7025604sPpX6v4/jfihlkQxm4FFQfngPs=
X-Received: by 2002:ad4:5226:0:b0:62b:49e1:4946 with SMTP id
 r6-20020ad45226000000b0062b49e14946mr19387212qvq.21.1691095813103; Thu, 03
 Aug 2023 13:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdm9PqNBLSZa_t5b=15cdtKvKq4q8WZr3i77W66m4FRAAQ@mail.gmail.com>
 <ZMwQivemlha+fU5i@kernel.org>
In-Reply-To: <ZMwQivemlha+fU5i@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 13:50:02 -0700
Message-ID: <CAKwvOd=w3PFMDyZ1WL1DDx0Gyt-+sh7hYP_+8b9zEFu3uZpVXQ@mail.gmail.com>
Subject: Re: FAILED: load BTF from vmlinux: Invalid argument
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: martin.lau@linux.dev, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc?= <tpgxyz@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 1:39=E2=80=AFPM Arnaldo Carvalho de Melo <acme@kerne=
l.org> wrote:
>
> Em Thu, Aug 03, 2023 at 11:02:46AM -0700, Nick Desaulniers escreveu:
> > Hi Martin (and BTF/BPF team),
> > I've observed 2 user reports with the error from the subject of this em=
ail.
> > https://github.com/ClangBuiltLinux/linux/issues/1825
> > https://bbs.archlinux.org/viewtopic.php?id=3D284177
> >
> > Any chance you could take a look at these reports and help us figure
> > out what's going wrong here?  Nathan and I haven't been able to
> > reproduce, but this seems to be affecting OpenMandriva (and Tomasz).
> >
> > Sounds like perhaps llvm-objcopy vs gnu objcopy might be a relevant det=
ail?
>
> Masami had a problem with new versions of compilers that was solved
> with:
>
> ------------------------ 8< --------------------------------------------
> > To check that please tweak:
> >
> > =E2=AC=A2[acme@toolbox perf-tools-next]$ grep DWARF ../build/v6.2-rc5+/=
.config
> > CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > # CONFIG_DEBUG_INFO_DWARF4 is not set
> > # CONFIG_DEBUG_INFO_DWARF5 is not set
> > =E2=AC=A2[acme@toolbox perf-tools-next]$
> >
> > i.e. disable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and enable
> > CONFIG_DEBUG_INFO_DWARF4.
>
> Hm, with CONFIG_DEBUG_INFO_DWARF4, no warning were shown.

Downgrading from the now-6-year-old DWARFv5 to now-13-year-old DWARFv4
is not what I'd consider a fix. Someday we can move to
DWARFv5...someday...

What you describe sounds like build success, but reduction in debug info.

The reports I'm referring to seem to result in a build failure.

>
>   LD      .tmp_vmlinux.btf
>   BTF     .btf.vmlinux.bin.o
>   LD      .tmp_vmlinux.kallsyms1
>
> And
>
> / # strings /sys/kernel/btf/vmlinux | wc -l
> 89921
> / # strings /sys/kernel/btf/vmlinux | grep -w kfree
> kfree
>
> It seems the BTF is correctly generated. (with DWARF5, the number of symb=
ols
> are about 30000.)



--=20
Thanks,
~Nick Desaulniers
