Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E962D784
	for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 18:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqjEuo+Y"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e58a522e41so3512986fac.2
        for <llvm@lists.linux.dev>; Tue, 17 Oct 2023 11:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697565746; x=1698170546; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4411VFYng8a8HDyhdYjQJ87gKPXTNmusC5D18lXs6s=;
        b=EqjEuo+YasOY3RDlAeu/9DVk6f3aSdTQY3lwVpnJ9VZsTij9egHHUApohvHlhkbq2a
         SY3Nh3iL29RLZoYtLRgg8BSlgOFdZYrDAkzuKcfIkewksSiq0jFNhzP6tnciaZ+mJn2n
         hkb4Tas7uddBFyDIpGEkjmzgIBwSVPBxAFAbwq186ud3vVWZvu242CSUqluOITV3ggCa
         bfYLnSR+oRZdp3acqslDGjpmPcoaTEpEbnRvnmn6mc3WZxwhq3BrkQCOkT9FvuFlzNeJ
         zbjhJqxkWxi8y+tD4ZsrF+hNneLPLBnrkCWYlwMkkUG12bKpLaJ5xB9DjsMcAzM/ckJT
         kOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697565746; x=1698170546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N4411VFYng8a8HDyhdYjQJ87gKPXTNmusC5D18lXs6s=;
        b=YUl5ngOpN0Y6D/wvaosdasTXQkET5C8OJSF2J2KflZzdIiseipBDkhJR9ef+vGAkLo
         DCTr0oqiPi42J9BMckG9I3AfXvGYDKGUg8WMafQzP2fSniHLMjdNAw7GCrnrFO68nToO
         vwS+eSqmh7q4JBwWlAf4EtlQ2oiIuTU7JZJr6mwZiKMTsVfx6SNnH1HKAbji+7Vx5BI9
         HfpCE7np4wqX+znwtY8IK8a9XW6csYJMwMcuCL3VRLXtjPZeonQwjJC9NEabHyE384J2
         RQ4Hid/OqkJahhjRz8ZmvirbtFnWMg8U1q3KUkwb16vr5nceAWIwIPb+RtA60TZ3PIpc
         h2pg==
X-Gm-Message-State: AOJu0Yw7yRGYlKvUIAixWnT9teKLQaYqtcpTkP0GQ//UyV1RNWuVAMN7
	eSLGzuJzDy3G2M65AKgu5tW60g3hXIG3C6TjQ1A=
X-Google-Smtp-Source: AGHT+IEWhwy7nMPvdqBQrj3XNb2/fzLnp9F8pJjwtxWOPLaUknBvhhMta1zuQbN9r9f9Gn6rFIioHJiegVhhEqh0GS4=
X-Received: by 2002:a05:6871:2206:b0:1e9:bd5c:ae8b with SMTP id
 sc6-20020a056871220600b001e9bd5cae8bmr2686071oab.5.1697565745825; Tue, 17 Oct
 2023 11:02:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231016142031.241912-1-Rodrigo.Siqueira@amd.com> <20231017172231.GA2348194@dev-arch.thelio-3990X>
In-Reply-To: <20231017172231.GA2348194@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 17 Oct 2023 14:02:14 -0400
Message-ID: <CADnq5_OyO9CHqahFvdnx7-8s9654udgdfhUntyxfjae+iHey0Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Reduce stack size for DML2
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev, 
	Roman Li <roman.li@amd.com>, amd-gfx@lists.freedesktop.org, 
	linux-next@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	Chaitanya Dhere <chaitanya.dhere@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2023 at 1:22=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Rodrigo,
>
> On Mon, Oct 16, 2023 at 08:19:16AM -0600, Rodrigo Siqueira wrote:
> > Stephen discovers a stack size issue when compiling the latest amdgpu
> > code with allmodconfig. This patchset addresses that issue by splitting
> > a large function into two smaller parts.
> >
> > Thanks
> > Siqueira
> >
> > Rodrigo Siqueira (2):
> >   drm/amd/display: Reduce stack size by splitting function
> >   drm/amd/display: Fix stack size issue on DML2
> >
> >  .../amd/display/dc/dml2/display_mode_core.c   | 3289 +++++++++--------
> >  1 file changed, 1653 insertions(+), 1636 deletions(-)
> >
> > --
> > 2.42.0
> >
>
> This series appears in -next as commit c587ee30f376 ("drm/amd/display:
> Reduce stack size by splitting function"); while it may help stack usage
> for GCC, clang still suffers. All clang versions that the kernel
> supports show a warning for dml_prefetch_check(), the following is with
> LLVM 17.0.2 from kernel.org [1].
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6263:=
13: error: stack frame size (2520) exceeds limit (2048) in 'dml_prefetch_ch=
eck' [-Werror,-Wframe-larger-than]
>    6263 | static void dml_prefetch_check(struct display_mode_lib_st *mode=
_lib)
>         |             ^
>
> With clang 18.0.0 (tip of tree) and 15.0.7, I see:
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:8277:=
6: error: stack frame size (2056) exceeds limit (2048) in 'dml_core_mode_pr=
ogramming' [-Werror,-Wframe-larger-than]
>    8277 | void dml_core_mode_programming(struct display_mode_lib_st *mode=
_lib, const struct dml_clk_cfg_st *clk_cfg)
>         |      ^
>
> For what it's worth, building with GCC 13.2.0 with a slighly lower
> -Wframe-larger-than value reveals that dml_prefetch_check() is right at
> the current limit and the stack usage of dml_core_mode_programming()
> when built with GCC is not too far of clang's, so it seems like there
> should be a more robust set of fixes, such as the ones that I have
> already done for older generations of this code.
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In f=
unction 'dml_prefetch_check':
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:6705:=
1: error: the frame size of 2048 bytes is larger than 1800 bytes [-Werror=
=3Dframe-larger-than=3D]
>    6705 | }
>         | ^
>
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c: In f=
unction 'dml_core_mode_programming':
>   drivers/gpu/drm/amd/amdgpu/../display/dc/dml2/display_mode_core.c:9893:=
1: error: the frame size of 1880 bytes is larger than 1800 bytes [-Werror=
=3Dframe-larger-than=3D]
>    9893 | } // dml_core_mode_programming
>         | ^
>
> 41012d715d5d drm/amd/display: Mark dml30's UseMinimumDCFCLK() as noinline=
 for stack usage
> 21485d3da659 drm/amd/display: Reduce number of arguments of dml31's Calcu=
lateFlipSchedule()
> 37934d4118e2 drm/amd/display: Reduce number of arguments of dml31's Calcu=
lateWatermarksAndDRAMSpeedChangeSupport()
> a3fef74b1d48 drm/amd/display: Reduce number of arguments of dml32_Calcula=
tePrefetchSchedule()
> c4be0ac987f2 drm/amd/display: Reduce number of arguments of dml32_Calcula=
teWatermarksMALLUseAndDRAMSpeedChangeSupport()
> 25ea501ed85d drm/amd/display: Reduce number of arguments of dml314's Calc=
ulateFlipSchedule()
> ca07f4f5a98b drm/amd/display: Reduce number of arguments of dml314's Calc=
ulateWatermarksAndDRAMSpeedChangeSupport()
>
> It would be really nice if these would somehow make it back to the
> original sources so that we stop going through this every time a new
> version of this code shows up. I thought that AMD has started testing
> with clang, how were these warnings not caught before the code was
> merged? If you are unable to look into these warnings, I can try to
> double back to this once I look into the other fires in -next...

Our clang CI builds are passing just fine.  It seems to be specific to
certain kernel configs.  I guess it depends on how different functions
get inlined.  This issue was reported by Stephen originally which is
how we discovered it.

Alex


Alex
