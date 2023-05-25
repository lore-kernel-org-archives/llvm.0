Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE771D2B8
	for <llvm@lists.linux.dev>; Thu, 25 May 2023 17:09:22 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-62384e391e3so5834806d6.3
        for <llvm@lists.linux.dev>; Thu, 25 May 2023 10:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685034561; x=1687626561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfujOA2A6hf65ZBmor9A5NjncmlddgUps/gM/fGPmmw=;
        b=u5JVWmnm+syyUkpME6Rsqvob45yWWUQsGfJKmU/pXAKrwQZl+T9k8XmCLTHKpxsx33
         Ul9rgymUGpn8o2QPq77XwJNueYkRMeCjvwfT9RcbdDHHtD259aGr3k0ZMr1ZlfRpTJT7
         673/FJYWxi0dEX9d9pJtUF8Vad8lAGBgMvg0UsyRKO+e3L4Tlxnb5W9K0htP9LZwf5N+
         3ko7w0kQ2cw3iI2JEKhOR7KACW9rvsqgnwUALVFjCvJUj517CUfk6/TP9Wol2HM2jAxI
         uUpRJlPyEopXZ1qKYTHAs6kcK0LMLHaBTu7IxGOgKaTd4J+kgAxv7m0tNRBEO1NXq3M/
         f4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685034561; x=1687626561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfujOA2A6hf65ZBmor9A5NjncmlddgUps/gM/fGPmmw=;
        b=LSJjf8Aaar8aIXgo0rfafCKfPKC/RSVmJIzq8T04RGnvBBxEgTxZNlCx+MPiz4b7xT
         fun6dSRpYeafyy64j/FGRaECvvZH18yvZiDCpClOKtm4Dh8Mv/PJJ5fvfWVe1I3EiX/Y
         M6GXZzP9szYuNegYRXmxubWxbeV9QmhUvc3zqWk/NYdvI/Dx9erbVcwd8oa+KGQRBevH
         OXoi/F7qC7w6UKuPPQxsMk5raViNeHvbW9CSPn+JhzeZb+rrUAyh04y/ediXGRG4Smcd
         1GUrKwKnk9ZLtsmqPFuBQBTqAKvmiW4E0yfJSPPa9YW2cXs1gKsyN+iKpEUO/l29Ce/9
         UeuA==
X-Gm-Message-State: AC+VfDwAgqOU2hOkNDgqjhGWMsBowbt6cikyng9+XbghQ3pe50+o1fu9
	9CmuESC48EfZ35FZywM/deMPUvPSS1FZPzKqAa3/zsHPPm8ej8iXLFbzrw==
X-Google-Smtp-Source: ACHHUZ52CNu/Tjq79XCrD2JlDivOqzgbcFUCBV3XBgtDyaC3DaWMMVwQJMD2wHZ3Rqd1sfXTIh+ACcfD8lPZjGD6rOw=
X-Received: by 2002:a05:6214:5089:b0:621:564a:27a0 with SMTP id
 kk9-20020a056214508900b00621564a27a0mr1961807qvb.34.1685034561279; Thu, 25
 May 2023 10:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>
 <20230525152247.GA187374@dev-arch.thelio-3990X> <c25b9e4b-535e-801b-12c3-8d4415c321ff@amd.com>
 <20230525162911.GA552113@dev-arch.thelio-3990X> <CADnq5_Ndax1krkonfeBt4=iW5Kfh-nW+M_UhqVJV9gUQC2JEBw@mail.gmail.com>
In-Reply-To: <CADnq5_Ndax1krkonfeBt4=iW5Kfh-nW+M_UhqVJV9gUQC2JEBw@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 25 May 2023 10:09:10 -0700
Message-ID: <CAKwvOdkb0QtVKTOZXNp6n74XwqTmoT4aHRaEfpvfNd5ja9aNJg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as __maybe_unused
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, llvm@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 9:42=E2=80=AFAM Alex Deucher <alexdeucher@gmail.com=
> wrote:
>
> On Thu, May 25, 2023 at 12:29=E2=80=AFPM Nathan Chancellor <nathan@kernel=
.org> wrote:
> >
> > On Thu, May 25, 2023 at 12:26:56PM -0400, Luben Tuikov wrote:
> > > On 2023-05-25 11:22, Nathan Chancellor wrote:
> > > > On Fri, May 19, 2023 at 06:14:38PM +0530, Srinivasan Shanmugam wrot=
e:
> > > >> Silencing the compiler from below compilation error:
> > > >>
> > > >> drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:704:23: error: variable 'm=
mhub_v1_8_mmea_err_status_reg' is not needed and will not be emitted [-Werr=
or,-Wunneeded-internal-declaration]
> > > >> static const uint32_t mmhub_v1_8_mmea_err_status_reg[] =3D {
> > > >>                       ^
> > > >> 1 error generated.
> > > >>
> > > >> Mark the variable as __maybe_unused to make it clear to clang that=
 this
> > > >> is expected, so there is no more warning.
> > > >>
> > > >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > >> Cc: Lijo Lazar <lijo.lazar@amd.com>
> > > >> Cc: Luben Tuikov <luben.tuikov@amd.com>
> > > >> Cc: Alex Deucher <alexander.deucher@amd.com>
> > > >> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> > > >
> > > > Traditionally, this attribute would go between the [] and =3D, but =
that is
> > > > a nit. Can someone please pick this up to unblock our builds on -ne=
xt?
> > > >
> > > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> > >
> > > I'll pick this up, fix it, and submit to amd-staging-drm-next.
> >
> > Thanks a lot :)
> >
> > > Which -next are you referring to, Nathan?
> >
> > linux-next, this warning breaks the build when -Werror is enabled, such
> > as with allmodconfig:
> >
> > https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integrat=
ion2/builds/2QHtlCTz2JL0yXNpRB5hVmiP9lq/build.log
> >
>
> Srinivasan has already pushed it.  I'll push it out once CI has
> completed.  We are trying to figure out the best way to enable -WERROR
> in our CI system as it is almost always broken depending on what
> compiler you are using.  Also, I'm not sure fixing these is always
> better.  A lot of these warnings seem spurious and in a lot of cases
> the "fix" doesn't really improve the code, it just silences a warning.
> As one of my coworkers put it, there is a reason warnings are not
> errors.

https://www.theregister.com/2021/09/08/compromise_linux_kernel_compiler_war=
nings/

>
> Alex
>
>
> > Cheers,
> > Nathan
> >
> > > >> ---
> > > >>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 1 +
> > > >>  1 file changed, 1 insertion(+)
> > > >>
> > > >> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu=
/drm/amd/amdgpu/mmhub_v1_8.c
> > > >> index 3648994724c2..cba087e529c0 100644
> > > >> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
> > > >> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
> > > >> @@ -701,6 +701,7 @@ static void mmhub_v1_8_reset_ras_error_count(s=
truct amdgpu_device *adev)
> > > >>            mmhub_v1_8_inst_reset_ras_error_count(adev, i);
> > > >>  }
> > > >>
> > > >> +__maybe_unused
> > > >>  static const uint32_t mmhub_v1_8_mmea_err_status_reg[] =3D {
> > > >>    regMMEA0_ERR_STATUS,
> > > >>    regMMEA1_ERR_STATUS,
> > > >> --
> > > >> 2.25.1
> > > >>
> > >
>


--=20
Thanks,
~Nick Desaulniers
