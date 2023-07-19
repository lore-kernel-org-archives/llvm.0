Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E11C12B79
	for <llvm@lists.linux.dev>; Wed, 19 Jul 2023 12:54:47 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-565a8d74daeso505587eaf.1
        for <llvm@lists.linux.dev>; Wed, 19 Jul 2023 05:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689771286; x=1692363286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ob33aJpEVflG5uQou9d1IRsAjTkbB0H29vIYmLFG+w=;
        b=Jj+8Q1YBMe8h479/EM5nnl3jJ5xPG0W7eLhHi2H+mcna+HquVrBIJMcD/smzGOmwM7
         ie3LZItQUxdSI0xMbCo1PJjzDdJsrHuwnNUU348rCV5T9FRW3dOxXa5K77hFvFKwyzF0
         Xq74ZvO0+Y76KYqOHLFf5E3TvLisnIgXaGCUG52Etj+JSehbCfm0tEAOhpnSBjemzxMs
         JM+cjERlRLPRT/vP1esVY1YcA0z4kcagF5bL9o/6aiG4wmsSXPHtJ5b3tdsJoJl3G0DK
         QVpC8kqCRTiFy2GtMCWsSON9lNGw1oPeFjUGcthkClYhI01n+UjS3kZGu/eshF8aq5MQ
         OlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689771286; x=1692363286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ob33aJpEVflG5uQou9d1IRsAjTkbB0H29vIYmLFG+w=;
        b=IfPTGc/z9pUpdywOqA5AuxCmkUDxQQ0r2yYgC/WXYmQyprTLjb4EePnWpQgSQGuvDC
         Hkal1czQWuYfooDylYAGQesEor7+poD2DdnLhLI98qLvq1/nJzgeb92OMAQY+IhnMHzw
         slQQ3YMTar8EdC0Ttsl3dHUC9ZGsFABd17gYQ8DD5vpzdUOIRyGTWqvhct2ULPwkZki2
         E82lTWgLBCto4yeWp90ao1C3lF1q5Nhv82asDUZl2xoMijW6VWgHi+miShMu77sTf3Yu
         JjyZ5pR73Lllif3AMj8laqBSMRLHKz7RLmV0xaSazt39W6knYlTcub3dL40+u9RrlDPH
         PR8g==
X-Gm-Message-State: ABy/qLZ8jMELCchsamWX9ThoTtlkQeVYrANSfMYgsXTg2A6NTEyCFqpF
	1h3YCYMpDfWNhmfvUTpPw4V/c68PsddW30Nz69Y=
X-Google-Smtp-Source: APBJJlG6aZQXLfAUUa0d6UG0g2dC9Dy/0j5uRWDotnm031YoGltAGMBIqdyjCFS8p1vLbNoKJB5F8RQkl2HtXjmJDJA=
X-Received: by 2002:a4a:3350:0:b0:564:e465:5d5c with SMTP id
 q77-20020a4a3350000000b00564e4655d5cmr1635961ooq.2.1689771286177; Wed, 19 Jul
 2023 05:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230717222923.3026018-1-samuel.holland@sifive.com> <20230718163953.GA1279879@dev-arch.thelio-3990X>
In-Reply-To: <20230718163953.GA1279879@dev-arch.thelio-3990X>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Jul 2023 08:54:34 -0400
Message-ID: <CADnq5_N5raOvG+seU7MK2jXT5HVk1Wfp+m6yswQiOqdMpnVHAg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Allow building DC with clang on RISC-V
To: Nathan Chancellor <nathan@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	llvm@lists.linux.dev, Leo Li <sunpeng.li@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Tom Rix <trix@redhat.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Tue, Jul 18, 2023 at 12:40=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Mon, Jul 17, 2023 at 03:29:23PM -0700, Samuel Holland wrote:
> > clang on RISC-V appears to be unaffected by the bug causing excessive
> > stack usage in calculate_bandwidth(). clang 16 with -fstack-usage
> > reports a 304 byte stack frame size with CONFIG_ARCH_RV32I, and 512
> > bytes with CONFIG_ARCH_RV64I.
> >
> > Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>
> I built ARCH=3Driscv allmodconfig drivers/gpu/drm/amd/amdgpu/ (confirming
> that CONFIG_DRM_AMD_DC gets enabled) with LLVM 11 through 17 with and
> without CONFIG_KASAN=3Dy and I never saw the -Wframe-larger-than instance
> that this was disabled for, so I agree.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
>
> >
> >  drivers/gpu/drm/amd/display/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/=
display/Kconfig
> > index bf0a655d009e..901d1961b739 100644
> > --- a/drivers/gpu/drm/amd/display/Kconfig
> > +++ b/drivers/gpu/drm/amd/display/Kconfig
> > @@ -5,7 +5,7 @@ menu "Display Engine Configuration"
> >  config DRM_AMD_DC
> >       bool "AMD DC - Enable new display engine"
> >       default y
> > -     depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
> > +     depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 ||=
 X86_64
> >       select SND_HDA_COMPONENT if SND_HDA_CORE
> >       # !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1=
752
> >       select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) |=
| (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
> > --
> > 2.40.1
> >
