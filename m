Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4EFC15
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 16:05:19 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76c93abeb83so375237985a.0
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691424318; x=1692029118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GQIy5EgSpeD83t8VSo5wZtpSKHfGTkYa7FtaZQItjA=;
        b=cRpyWJ4mkUZJ7O8jGDtCjtpANWKRp1k7YdWnNxLYX8ItNnC8qculSjeMbzOYSVSjrm
         IBsebdjvnFPn6FU0t99XURmLh7x6ZQ2eFZtTNGEzuO42flZQU4lczy1oFQyKSoAwdwo7
         Z03/2h1eSQNzpmDdpjjndfYz0GqsMsPV9Gi1b3bsSU9hRDNT1t8rqjwHM6hbP8ewDiLZ
         daMA50rGf/7JuSuOZiqu1kBiN83IsFdM1TZbmoxwklC67ThRr5kgML8PkTQo9pT6j212
         owqCD7aOdKBClS6U7IJOL6pKkL6bABSMHOB5rYJ6RlEW7zJJDDgIKA4rvsiBLKVi3YR+
         TWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691424318; x=1692029118;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GQIy5EgSpeD83t8VSo5wZtpSKHfGTkYa7FtaZQItjA=;
        b=HCI8yLudsWgttBBT1qFi+fF+D5LOm/TVsaY3sh6IJBhHz0GczJ2Ruzfkaov5hWgSA0
         YWyTXOT1sqMNmDXjDA3NES2PRcWRULUEi9/ZfEnUFOpWz1NN2O7ZJU3dWprMSn/YOcwB
         CfEl+qjeMHVO2aEFtMZftMb1IkJTVnkr5Gdd2RZ20l2SyiGpM93yHcwAZTeMiHKSm21J
         0ptjjfdyp1rjgdHvuHs3NELmfxaW8xvWFOpjKQB8C7JSMF/l92C/iAwZZlF7TN5h0d1p
         K0/+TRusMwbNh2Dv5GwUi/4Fy2eVRlc54CgMlAO3DAsUFaMVUnInmnuDHqMkVIUWRicm
         8aOA==
X-Gm-Message-State: AOJu0YwNdtuwx+fEBeVBLvvDmYP9KlIT4CijXMhPJSgh4qHSIfzOCSSz
	6qTmuqdb2vXS+sX14X75eqboI1CxSn08BIQaEVFSIA==
X-Google-Smtp-Source: AGHT+IHvLZvJTCl9VMxxRUoHcnxpdhgMC3N9B3+7rs2Ox8Gbo7ZcNBmWBshJm50nE1Kary/13iiu4DVO+Rlut0UpJJs=
X-Received: by 2002:ad4:5496:0:b0:630:463:3650 with SMTP id
 pv22-20020ad45496000000b0063004633650mr9287030qvb.39.1691424318354; Mon, 07
 Aug 2023 09:05:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKwvOdm9PqNBLSZa_t5b=15cdtKvKq4q8WZr3i77W66m4FRAAQ@mail.gmail.com>
 <ZMwQivemlha+fU5i@kernel.org> <CAKwvOd=w3PFMDyZ1WL1DDx0Gyt-+sh7hYP_+8b9zEFu3uZpVXQ@mail.gmail.com>
 <afe71df3-48e4-837a-e85d-b6a6764eee62@oracle.com> <CAKwvOdn93Zpdkk3faNNdDw=tnMQ6Mxo5tTVCDmrqStU95MVQqA@mail.gmail.com>
 <7eea26c2-e3c9-d212-1688-21d448649e07@oracle.com> <ZM5t0mMODRtvpi1c@krava>
In-Reply-To: <ZM5t0mMODRtvpi1c@krava>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Aug 2023 09:05:07 -0700
Message-ID: <CAKwvOdntq_3NHuGir8J77ofR7acFQHc2sog0p1bObQEz_rQAnA@mail.gmail.com>
Subject: Re: FAILED: load BTF from vmlinux: Invalid argument
To: Jiri Olsa <olsajiri@gmail.com>, =?UTF-8?Q?Tomasz_Pawe=C5=82_Gajc?= <tpgxyz@gmail.com>, 
	m.seyfarth@gmail.com
Cc: Alan Maguire <alan.maguire@oracle.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, martin.lau@linux.dev, 
	bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 5, 2023 at 8:42=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrote=
:
>
> On Fri, Aug 04, 2023 at 11:03:03PM +0100, Alan Maguire wrote:
> > On 04/08/2023 17:11, Nick Desaulniers wrote:
> > > + Marcus (who also just reported seeing this
> > > https://github.com/ClangBuiltLinux/linux/issues/1825#issuecomment-166=
4671027
> > > and might be able to help reproduce).
> > > + Fangrui (because seeing dd used as a result of 90ceddcb4950 makes m=
e shudder)
> > >
> > > On Thu, Aug 3, 2023 at 3:10=E2=80=AFPM Alan Maguire <alan.maguire@ora=
cle.com> wrote:
> > >>
> > >> On 03/08/2023 21:50, Nick Desaulniers wrote:
> > >>> On Thu, Aug 3, 2023 at 1:39=E2=80=AFPM Arnaldo Carvalho de Melo <ac=
me@kernel.org> wrote:
> > >>>>
> > >>>> Em Thu, Aug 03, 2023 at 11:02:46AM -0700, Nick Desaulniers escreve=
u:
> > >>>>> Hi Martin (and BTF/BPF team),
> > >>>>> I've observed 2 user reports with the error from the subject of t=
his email.
> > >>>>> https://github.com/ClangBuiltLinux/linux/issues/1825
> > >>>>> https://bbs.archlinux.org/viewtopic.php?id=3D284177
> > >>>>>
> > >>>>> Any chance you could take a look at these reports and help us fig=
ure
> > >>>>> out what's going wrong here?  Nathan and I haven't been able to
> > >>>>> reproduce, but this seems to be affecting OpenMandriva (and Tomas=
z).
> > >>>>>
> > >>>>> Sounds like perhaps llvm-objcopy vs gnu objcopy might be a releva=
nt detail?
> > >>>>
> > >>>> Masami had a problem with new versions of compilers that was solve=
d
> > >>>> with:
> > >>>>
> > >>>> ------------------------ 8< --------------------------------------=
------
> > >>>>> To check that please tweak:
> > >>>>>
> > >>>>> =E2=AC=A2[acme@toolbox perf-tools-next]$ grep DWARF ../build/v6.2=
-rc5+/.config
> > >>>>> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=3Dy
> > >>>>> # CONFIG_DEBUG_INFO_DWARF4 is not set
> > >>>>> # CONFIG_DEBUG_INFO_DWARF5 is not set
> > >>>>> =E2=AC=A2[acme@toolbox perf-tools-next]$
> > >>>>>
> > >>>>> i.e. disable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT and enable
> > >>>>> CONFIG_DEBUG_INFO_DWARF4.
> > >>>>
> > >>>> Hm, with CONFIG_DEBUG_INFO_DWARF4, no warning were shown.
> > >>>
> > >>> Downgrading from the now-6-year-old DWARFv5 to now-13-year-old DWAR=
Fv4
> > >>> is not what I'd consider a fix. Someday we can move to
> > >>> DWARFv5...someday...
> > >>>
> > >>> What you describe sounds like build success, but reduction in debug=
 info.
> > >>>
> > >>> The reports I'm referring to seem to result in a build failure.
> > >>>
> > >>
> > >> This is a strange one. The error in question
> > >>
> > >> CC .vmlinux.export.o
> > >> UPD include/generated/utsversion.h
> > >> CC init/version-timestamp.o
> > >> LD .tmp_vmlinux.btf
> > >> BTF .btf.vmlinux.bin.o
> > >> libbpf: BTF header not found
> > >> pahole: .tmp_vmlinux.btf: Invalid argument
> > >
> > > That's slightly different from Tomasz and Marcus' report (not sure if
> > > that's relevant):
> > >
> > > FAILED: load BTF from vmlinux: Invalid argument
> > >
> > > That seems to come from
> > > tools/bpf/resolve_btfids/main.c:529
> > > Which seems like some failed call to btf_parse().
> > > EINVAL is getting propagated up from btf_parse(), but that's not supe=
r
> > > descriptive...
> > >
> > Okay, that makes more sense. Basically the stage where we read vmlinux
> > BTF to do BTF id resolution (BTFIDS) is finding an empty BTF section.
>
> +1, looks like pahole failed to generate the BTF section, the BTFIDS
> is just follow up error.. we might want to consider special error
> output for missing BTF data ;-)
>
> I can't reproduce this on my setup with either gcc or clang and trying
> DWARF4/5 config options and latest and 1.24 pahole version

Is it possible to link pahole against an older version of libbpf and
perhaps encounter some of the observed errors?
https://github.com/ClangBuiltLinux/linux/issues/1825#issuecomment-149162990=
4
mentions a specific revision of libbpf.

Tomasz and Marcus,
If you can still reproduce, please provide the versions of pahole AND
libbpf you're using. If you can no longer reproduce, let's close out
the github issue as obsolete.

>
> >
> > > The hard part is that I suspect OpenMandriva (Tomasz) and Marcus are
> > > both setting additional flags in their toolchains, which can make
> > > reproducing tricky.
> > >
> >
> > I tried falling back to the config referenced in the earlier bug report
> >
> > https://github.com/ClangBuiltLinux/linux/files/10050200/config_bpf.txt
>
> hum, I did not find this in the report.. are there more kernel configs
> related to this issue? seems like more people hit this
>
> thanks,
> jirka
>
> >
> > ...but still couldn't reproduce it with LLVM 17 + pahole v1.24. That
> > config did specify DWARF5; if we can reproduce this, it would probably
> > be good to vary between forcing DWARF4 and DWARF5 to see if that is a
> > contributing factor as Arnaldo suggested.
> >
> > Alan
> >
> > >>
> > >> ...occurs during BTF parsing when the raw size of the BTF is smaller
> > >> than the BTF header size, which should never happen unless BTF
> > >> is corrupted. Thing is, at that stage we shouldn't be parsing BTF,
> > >> we should be generating it from DWARF. The only time pahole parses B=
TF
> > >> is when it's creating split BTF for modules (it parses the base BTF)=
, or
> > >> when it's reading existing BTF, neither of which it should be doing =
at
> > >> this stage.
> > >>
> > >> But I suspect the issue is in gen_btf() in scripts/link-vmlinux.sh.
> > >> Prior to running pahole, we call "vmlinux_link .tmp_vmlinux.btf".
> > >> If that went awry somehow and .tmp_vmlinux.btf wasn't created, it
> > >
> > > Wouldn't we expect some kind of linker error though in that case?
> > >
> > >> would explain the "Invalid argument" error:
> > >>
> > >> $ pahole -J nosuchfile
> > >> pahole: nosuchfile: Invalid argument
> > >>
> > >> I see some clang specifics in vmlinux_link(), so I think a good
> > >> first step would be to check if .tmp_vlinux.btf exists prior
> > >> to running pahole. The submitter mentioned swapping linkers seems to
> > >> help, so that seems a promising angle. If there's a kernel .config
> > >> available I can try and reproduce the failure too. Thanks!
> > >>
> > >> Alan
> > >>
> > >>>>
> > >>>>   LD      .tmp_vmlinux.btf
> > >>>>   BTF     .btf.vmlinux.bin.o
> > >>>>   LD      .tmp_vmlinux.kallsyms1
> > >>>>
> > >>>> And
> > >>>>
> > >>>> / # strings /sys/kernel/btf/vmlinux | wc -l
> > >>>> 89921
> > >>>> / # strings /sys/kernel/btf/vmlinux | grep -w kfree
> > >>>> kfree
> > >>>>
> > >>>> It seems the BTF is correctly generated. (with DWARF5, the number =
of symbols
> > >>>> are about 30000.)
> > >>>
> > >>>
> > >>>
> > >
> > >
> > >
> >



--=20
Thanks,
~Nick Desaulniers
