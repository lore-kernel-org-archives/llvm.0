Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEDF107BF
	for <llvm@lists.linux.dev>; Thu, 25 May 2023 16:42:17 +0000 (UTC)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-54f92ee633bso395302eaf.0
        for <llvm@lists.linux.dev>; Thu, 25 May 2023 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685032936; x=1687624936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cztSLLsRKGwDZeD/uPpQK8WqJ5ggb0ypQoE8LNY5phE=;
        b=YadvJoCfrSHPg59ZDzIylqQ/KAx/luhWZ82SqK1vkz2DbXsh0RtpqxOeQAv6Z+u8iI
         SBKYncg0fDibyUg0B1WYrmnXokPpRShshDGQmkwf6PS6ZggDQx0wh82MCtpjks2SeWVA
         fzwqZ7CUs0Sdlr0JAzn4sOrhDL6cOEGGbeSWwyVD+tClwws/oWNhcnAbWUFxxFxFh4hH
         JuUcKXlYFB5kwA9guNBVRNUszsZXiK0CRIlN4np1hFFGbEbhhKpb8dHRndQd8ImatYE6
         6H1S+EiNFXOQrHg/uY1n0lHuNhPB72MfJqwJkIU34g1CAgSPeMDONqbCWNL4cTv33G6g
         bKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685032936; x=1687624936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cztSLLsRKGwDZeD/uPpQK8WqJ5ggb0ypQoE8LNY5phE=;
        b=h7Yz1gEOvXNQr6OlXP9c/J7K53/WBa/EZ62J0BXMIXvFoN7TBAodMsvNCp703foB0l
         hHjOOLztjpz25uMDBe7Z2N43fbSfJvHHyVvwlXUKL7Pcz51DlKD6oqJJSfa0DIwF+Elx
         9Ir9NZ3/AWRDCuKuPqU3HQHwDzlojof1fir7J3hoBCKz8kaqGp7V97xjWJD/F8v/ftEw
         jcQXN00B3cdJ6k2628eB9xvuyBuqObvcSOBycQ9jGw3Tau2E+VkbEGLa/R2GzXXfguAX
         LpQ/R1t2pSyw0UeX59NSA14unCyOrZjLW4k+tu6V263zUm9ZWOIKnZRYHbXQt5TDMCA6
         6OAw==
X-Gm-Message-State: AC+VfDxCvrauDdmoDrI8RMGhdswHCd02vLauLkcadW0MENAmjxmKAVAN
	IoO1RavW5gl5jt+HzVl8JHzyUoo1nGUeKbNFTv8=
X-Google-Smtp-Source: ACHHUZ5e5uUXVPQhAKFISbYHRSFolK957VuRYu4ojEdLKfVvbighLDKW7jrgRW9g+7RmEeQpXFAa5USagEo5eRU2izY=
X-Received: by 2002:a4a:340a:0:b0:555:422a:38e9 with SMTP id
 b10-20020a4a340a000000b00555422a38e9mr6593717ooa.9.1685032936415; Thu, 25 May
 2023 09:42:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230519124438.365184-1-srinivasan.shanmugam@amd.com>
 <20230525152247.GA187374@dev-arch.thelio-3990X> <c25b9e4b-535e-801b-12c3-8d4415c321ff@amd.com>
 <20230525162911.GA552113@dev-arch.thelio-3990X>
In-Reply-To: <20230525162911.GA552113@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 May 2023 12:42:05 -0400
Message-ID: <CADnq5_Ndax1krkonfeBt4=iW5Kfh-nW+M_UhqVJV9gUQC2JEBw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Mark mmhub_v1_8_mmea_err_status_reg as __maybe_unused
To: Nathan Chancellor <nathan@kernel.org>
Cc: Luben Tuikov <luben.tuikov@amd.com>, Lijo Lazar <lijo.lazar@amd.com>, 
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, llvm@lists.linux.dev, 
	amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 12:29=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Thu, May 25, 2023 at 12:26:56PM -0400, Luben Tuikov wrote:
> > On 2023-05-25 11:22, Nathan Chancellor wrote:
> > > On Fri, May 19, 2023 at 06:14:38PM +0530, Srinivasan Shanmugam wrote:
> > >> Silencing the compiler from below compilation error:
> > >>
> > >> drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c:704:23: error: variable 'mmh=
ub_v1_8_mmea_err_status_reg' is not needed and will not be emitted [-Werror=
,-Wunneeded-internal-declaration]
> > >> static const uint32_t mmhub_v1_8_mmea_err_status_reg[] =3D {
> > >>                       ^
> > >> 1 error generated.
> > >>
> > >> Mark the variable as __maybe_unused to make it clear to clang that t=
his
> > >> is expected, so there is no more warning.
> > >>
> > >> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >> Cc: Lijo Lazar <lijo.lazar@amd.com>
> > >> Cc: Luben Tuikov <luben.tuikov@amd.com>
> > >> Cc: Alex Deucher <alexander.deucher@amd.com>
> > >> Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
> > >
> > > Traditionally, this attribute would go between the [] and =3D, but th=
at is
> > > a nit. Can someone please pick this up to unblock our builds on -next=
?
> > >
> > > Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> >
> > I'll pick this up, fix it, and submit to amd-staging-drm-next.
>
> Thanks a lot :)
>
> > Which -next are you referring to, Nathan?
>
> linux-next, this warning breaks the build when -Werror is enabled, such
> as with allmodconfig:
>
> https://storage.tuxsuite.com/public/clangbuiltlinux/continuous-integratio=
n2/builds/2QHtlCTz2JL0yXNpRB5hVmiP9lq/build.log
>

Srinivasan has already pushed it.  I'll push it out once CI has
completed.  We are trying to figure out the best way to enable -WERROR
in our CI system as it is almost always broken depending on what
compiler you are using.  Also, I'm not sure fixing these is always
better.  A lot of these warnings seem spurious and in a lot of cases
the "fix" doesn't really improve the code, it just silences a warning.
As one of my coworkers put it, there is a reason warnings are not
errors.

Alex


> Cheers,
> Nathan
>
> > >> ---
> > >>  drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c | 1 +
> > >>  1 file changed, 1 insertion(+)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c b/drivers/gpu/d=
rm/amd/amdgpu/mmhub_v1_8.c
> > >> index 3648994724c2..cba087e529c0 100644
> > >> --- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
> > >> +++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_8.c
> > >> @@ -701,6 +701,7 @@ static void mmhub_v1_8_reset_ras_error_count(str=
uct amdgpu_device *adev)
> > >>            mmhub_v1_8_inst_reset_ras_error_count(adev, i);
> > >>  }
> > >>
> > >> +__maybe_unused
> > >>  static const uint32_t mmhub_v1_8_mmea_err_status_reg[] =3D {
> > >>    regMMEA0_ERR_STATUS,
> > >>    regMMEA1_ERR_STATUS,
> > >> --
> > >> 2.25.1
> > >>
> >
