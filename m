Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7F11989D
	for <llvm@lists.linux.dev>; Fri,  4 Aug 2023 16:11:22 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-63cfa3e564eso13649576d6.0
        for <llvm@lists.linux.dev>; Fri, 04 Aug 2023 09:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691165481; x=1691770281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUz/F00xT7ugkiSWf6rX95nllWRBNhd9+1A0dvrpdTo=;
        b=2HDrihAGdJ7MfG1+8dsPUespfe5jeI5JTAKbQMm7RUu3pT7znehTtJYlI2HEIZMoEW
         80hUqnVlxpk3GzGqz9b8/pacgiHlKPzFqMkDCJpA+i8S2SoIQmzAkKvIAg0R3LLah3jN
         +2D3LfDn7kQ86X0ZFAH3Vug0De+inxrPJE1Ie/Kqm0mFSo8ixETdQ3SNF8agLwkAug3m
         RGzzQJH6XAJuarzhBB+WL2aLlOkcYKk8ncxPyNGHgwpHHRNYje4BcBFAE2uDvXibZW8L
         IQiLxa3yayHJFOHOOA22uu2jSL9oZjI1f4eMNs5AyXil+0Z3do7AgyLUTHE5QEmxmpgv
         RjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691165481; x=1691770281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUz/F00xT7ugkiSWf6rX95nllWRBNhd9+1A0dvrpdTo=;
        b=dDHoSg2U0jHkdNAOsBx1LM2/1YNEVl2QTX9gN+EMgM/7BKq479fIPWbFodUYC4pzyc
         joxyHu8OvAg8dqzu/2DDiVN/mwAwNS5sM6mfYmd8CLIXCekeSfcI37jL8vEGaDL3fyUy
         yUwJcaC/iyPY5dlQ3UyMJm5Cr8PzxSsvEkx2mPfcQ6Njv0tkromKA3naSNVgG3VoFEga
         WIodLNI9ofD4bhepEs6GoZ8QzWfvXShajTciHP6mp0oDOvChi1I1bqUnExgr033Zd3VT
         M5qdgYsJ6tz9KGuKovBKmfMPXiMOIivpUudAWzGOI+8/6CekgUNy615HVF76HIWc1yfn
         F+Ag==
X-Gm-Message-State: AOJu0YwWBrSiqELHwvCH8FqjBqc/bffc8KYBatoNiSy5IryvZj+3E5x/
	mAnfeqX7RBGvC+v0u0BwlNYWAjXJVaraIKFu+YJuiw==
X-Google-Smtp-Source: AGHT+IFlHVI/xT5Mi4eYkWwoZ2wzHeDhtUCEOZDCwUnOxvTK/WFNztLQP67jQfTZt0Wwru0rT3bCBpGJQb5XDgkLXfI=
X-Received: by 2002:a0c:e587:0:b0:636:6205:fb01 with SMTP id
 t7-20020a0ce587000000b006366205fb01mr2062984qvm.34.1691165480664; Fri, 04 Aug
 2023 09:11:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdm9PqNBLSZa_t5b=15cdtKvKq4q8WZr3i77W66m4FRAAQ@mail.gmail.com>
 <ZMwQivemlha+fU5i@kernel.org> <CAKwvOd=w3PFMDyZ1WL1DDx0Gyt-+sh7hYP_+8b9zEFu3uZpVXQ@mail.gmail.com>
 <afe71df3-48e4-837a-e85d-b6a6764eee62@oracle.com>
In-Reply-To: <afe71df3-48e4-837a-e85d-b6a6764eee62@oracle.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 4 Aug 2023 09:11:09 -0700
Message-ID: <CAKwvOdn93Zpdkk3faNNdDw=tnMQ6Mxo5tTVCDmrqStU95MVQqA@mail.gmail.com>
Subject: Re: FAILED: load BTF from vmlinux: Invalid argument
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, martin.lau@linux.dev, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc?= <tpgxyz@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, m.seyfarth@gmail.com, 
	Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

+ Marcus (who also just reported seeing this
https://github.com/ClangBuiltLinux/linux/issues/1825#issuecomment-166467102=
7
and might be able to help reproduce).
+ Fangrui (because seeing dd used as a result of 90ceddcb4950 makes me shud=
der)

On Thu, Aug 3, 2023 at 3:10=E2=80=AFPM Alan Maguire <alan.maguire@oracle.co=
m> wrote:
>
> On 03/08/2023 21:50, Nick Desaulniers wrote:
> > On Thu, Aug 3, 2023 at 1:39=E2=80=AFPM Arnaldo Carvalho de Melo <acme@k=
ernel.org> wrote:
> >>
> >> Em Thu, Aug 03, 2023 at 11:02:46AM -0700, Nick Desaulniers escreveu:
> >>> Hi Martin (and BTF/BPF team),
> >>> I've observed 2 user reports with the error from the subject of this =
email.
> >>> https://github.com/ClangBuiltLinux/linux/issues/1825
> >>> https://bbs.archlinux.org/viewtopic.php?id=3D284177
> >>>
> >>> Any chance you could take a look at these reports and help us figure
> >>> out what's going wrong here?  Nathan and I haven't been able to
> >>> reproduce, but this seems to be affecting OpenMandriva (and Tomasz).
> >>>
> >>> Sounds like perhaps llvm-objcopy vs gnu objcopy might be a relevant d=
etail?
> >>
> >> Masami had a problem with new versions of compilers that was solved
> >> with:
> >>
> >> ------------------------ 8< ------------------------------------------=
--
> >>> To check that please tweak:
> >>>
> >>> =E2=AC=A2[acme@toolbox perf-tools-next]$ grep DWARF ../build/v6.2-rc5=
+/.config
> >>> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> >>> # CONFIG_DEBUG_INFO_DWARF4 is not set
> >>> # CONFIG_DEBUG_INFO_DWARF5 is not set
> >>> =E2=AC=A2[acme@toolbox perf-tools-next]$
> >>>
> >>> i.e. disable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and enable
> >>> CONFIG_DEBUG_INFO_DWARF4.
> >>
> >> Hm, with CONFIG_DEBUG_INFO_DWARF4, no warning were shown.
> >
> > Downgrading from the now-6-year-old DWARFv5 to now-13-year-old DWARFv4
> > is not what I'd consider a fix. Someday we can move to
> > DWARFv5...someday...
> >
> > What you describe sounds like build success, but reduction in debug inf=
o.
> >
> > The reports I'm referring to seem to result in a build failure.
> >
>
> This is a strange one. The error in question
>
> CC .vmlinux.export.o
> UPD include/generated/utsversion.h
> CC init/version-timestamp.o
> LD .tmp_vmlinux.btf
> BTF .btf.vmlinux.bin.o
> libbpf: BTF header not found
> pahole: .tmp_vmlinux.btf: Invalid argument

That's slightly different from Tomasz and Marcus' report (not sure if
that's relevant):

FAILED: load BTF from vmlinux: Invalid argument

That seems to come from
tools/bpf/resolve_btfids/main.c:529
Which seems like some failed call to btf_parse().
EINVAL is getting propagated up from btf_parse(), but that's not super
descriptive...

The hard part is that I suspect OpenMandriva (Tomasz) and Marcus are
both setting additional flags in their toolchains, which can make
reproducing tricky.

>
> ...occurs during BTF parsing when the raw size of the BTF is smaller
> than the BTF header size, which should never happen unless BTF
> is corrupted. Thing is, at that stage we shouldn't be parsing BTF,
> we should be generating it from DWARF. The only time pahole parses BTF
> is when it's creating split BTF for modules (it parses the base BTF), or
> when it's reading existing BTF, neither of which it should be doing at
> this stage.
>
> But I suspect the issue is in gen_btf() in scripts/link-vmlinux.sh.
> Prior to running pahole, we call "vmlinux_link .tmp_vmlinux.btf".
> If that went awry somehow and .tmp_vmlinux.btf wasn't created, it

Wouldn't we expect some kind of linker error though in that case?

> would explain the "Invalid argument" error:
>
> $ pahole -J nosuchfile
> pahole: nosuchfile: Invalid argument
>
> I see some clang specifics in vmlinux_link(), so I think a good
> first step would be to check if .tmp_vlinux.btf exists prior
> to running pahole. The submitter mentioned swapping linkers seems to
> help, so that seems a promising angle. If there's a kernel .config
> available I can try and reproduce the failure too. Thanks!
>
> Alan
>
> >>
> >>   LD      .tmp_vmlinux.btf
> >>   BTF     .btf.vmlinux.bin.o
> >>   LD      .tmp_vmlinux.kallsyms1
> >>
> >> And
> >>
> >> / # strings /sys/kernel/btf/vmlinux | wc -l
> >> 89921
> >> / # strings /sys/kernel/btf/vmlinux | grep -w kfree
> >> kfree
> >>
> >> It seems the BTF is correctly generated. (with DWARF5, the number of s=
ymbols
> >> are about 30000.)
> >
> >
> >



--=20
Thanks,
~Nick Desaulniers
