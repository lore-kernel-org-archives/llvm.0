Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE47EA469
	for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 23:19:37 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id h14so2980982pjv.4
        for <llvm@lists.linux.dev>; Thu, 17 Nov 2022 15:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=frRGyhd06BA0sT9V1te6Y27oPr5UUtPbm1Vdh4PKLPI=;
        b=I9mQosvOSNUTsXk3Ihb1NPWa/DBnfs3VVFtxJOdYIu6VbGaLgAF+fu/GAyzE6TAYKi
         e8vUcaSjrQIHd9jXGto+xLj5tgBP3qhM/+ia+qgxTRtGUy5clI/fQUj+Zbx93U4e+iQn
         7KHnhExWer6coYCsyjk2i7u/jM//mGTEqk128=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=frRGyhd06BA0sT9V1te6Y27oPr5UUtPbm1Vdh4PKLPI=;
        b=ystsWiqf0A2I833sOllyeVw50fgLXoJhstOgOLKSduC3W05qalwawdG5PVsFjdKkYQ
         LWRmUaTIMHhjY/spTKhMZdxBiomNYzV12Ld4lYOFm/RXQAZVLCmyEPlVJCLAkVVA9mhI
         pkfHOYsmYE/ZuQY7x4GLlBhFlgJHxFaEtb93VF2KjZ7ihcEsN3ZX6pGnlA6g1SbbL1Uf
         /kUsXc6K3dI3VQSICTY8Uaogo5SOcv+sB6zsI13xjl6UZY3GET+OTfeeoMNWD3dIHOrq
         PvYCJjEpzVay7eitRw/i8RVCpLos11qiFds21GD9Pk2plniOvXm7xZLOxToO1lsbEP1f
         UMag==
X-Gm-Message-State: ANoB5plgCK1PmiGyfOBfV3TIyKk0n0FyaZSEz2jBQJVVh4IWpQm0bEZG
	f/KbH2LCm+GUjsW6VmP6t5krDQ==
X-Google-Smtp-Source: AA0mqf5CB85xvWodoprxPuUKnKGg4SCX5kW9coDM85v87l/hrB5VpRQ0WgZ4DDS37omvhRZ6Q5NxCA==
X-Received: by 2002:a17:902:c40d:b0:17f:5810:e9e3 with SMTP id k13-20020a170902c40d00b0017f5810e9e3mr4925697plk.11.1668727177283;
        Thu, 17 Nov 2022 15:19:37 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id n16-20020a170903111000b00188fc6766d6sm337573plh.219.2022.11.17.15.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 15:19:36 -0800 (PST)
Date: Thu, 17 Nov 2022 15:19:36 -0800
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	dri-devel@lists.freedesktop.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Sami Tolvanen <samitolvanen@google.com>,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: Re: [PATCH] drm/sti: Fix return type of
 sti_{dvo,hda,hdmi}_connector_mode_valid()
Message-ID: <202211171519.F10A612B33@keescook>
References: <20221102155623.3042869-1-nathan@kernel.org>
 <Y3K7QxuaXUm9C8pL@distrobox-ZFeO0pwFho.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3K7QxuaXUm9C8pL@distrobox-ZFeO0pwFho.thelio-3990X>

On Mon, Nov 14, 2022 at 03:03:47PM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> On Wed, Nov 02, 2022 at 08:56:23AM -0700, Nathan Chancellor wrote:
> > With clang's kernel control flow integrity (kCFI, CONFIG_CFI_CLANG),
> > indirect call targets are validated against the expected function
> > pointer prototype to make sure the call target is valid to help mitigate
> > ROP attacks. If they are not identical, there is a failure at run time,
> > which manifests as either a kernel panic or thread getting killed. A
> > proposed warning in clang aims to catch these at compile time, which
> > reveals:
> > 
> >   drivers/gpu/drm/sti/sti_hda.c:637:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
> >           .mode_valid = sti_hda_connector_mode_valid,
> >                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   drivers/gpu/drm/sti/sti_dvo.c:376:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
> >           .mode_valid = sti_dvo_connector_mode_valid,
> >                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >   drivers/gpu/drm/sti/sti_hdmi.c:1035:16: error: incompatible function pointer types initializing 'enum drm_mode_status (*)(struct drm_connector *, struct drm_display_mode *)' with an expression of type 'int (struct drm_connector *, struct drm_display_mode *)' [-Werror,-Wincompatible-function-pointer-types-strict]
> >           .mode_valid = sti_hdmi_connector_mode_valid,
> >                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > 
> > ->mode_valid() in 'struct drm_connector_helper_funcs' expects a return
> > type of 'enum drm_mode_status', not 'int'. Adjust the return type of
> > sti_{dvo,hda,hdmi}_connector_mode_valid() to match the prototype's to
> > resolve the warning and CFI failure.
> > 
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1750
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > ---
> >  drivers/gpu/drm/sti/sti_dvo.c  | 5 +++--
> >  drivers/gpu/drm/sti/sti_hda.c  | 5 +++--
> >  drivers/gpu/drm/sti/sti_hdmi.c | 5 +++--
> >  3 files changed, 9 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/sti/sti_dvo.c b/drivers/gpu/drm/sti/sti_dvo.c
> > index b6ee8a82e656..076d5f30a09c 100644
> > --- a/drivers/gpu/drm/sti/sti_dvo.c
> > +++ b/drivers/gpu/drm/sti/sti_dvo.c
> > @@ -346,8 +346,9 @@ static int sti_dvo_connector_get_modes(struct drm_connector *connector)
> >  
> >  #define CLK_TOLERANCE_HZ 50
> >  
> > -static int sti_dvo_connector_mode_valid(struct drm_connector *connector,
> > -					struct drm_display_mode *mode)
> > +static enum drm_mode_status
> > +sti_dvo_connector_mode_valid(struct drm_connector *connector,
> > +			     struct drm_display_mode *mode)
> >  {
> >  	int target = mode->clock * 1000;
> >  	int target_min = target - CLK_TOLERANCE_HZ;
> > diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> > index 03cc401ed593..a53b5a15c2a9 100644
> > --- a/drivers/gpu/drm/sti/sti_hda.c
> > +++ b/drivers/gpu/drm/sti/sti_hda.c
> > @@ -601,8 +601,9 @@ static int sti_hda_connector_get_modes(struct drm_connector *connector)
> >  
> >  #define CLK_TOLERANCE_HZ 50
> >  
> > -static int sti_hda_connector_mode_valid(struct drm_connector *connector,
> > -					struct drm_display_mode *mode)
> > +static enum drm_mode_status
> > +sti_hda_connector_mode_valid(struct drm_connector *connector,
> > +			     struct drm_display_mode *mode)
> >  {
> >  	int target = mode->clock * 1000;
> >  	int target_min = target - CLK_TOLERANCE_HZ;
> > diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> > index cb82622877d2..09e0cadb6368 100644
> > --- a/drivers/gpu/drm/sti/sti_hdmi.c
> > +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> > @@ -1004,8 +1004,9 @@ static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
> >  
> >  #define CLK_TOLERANCE_HZ 50
> >  
> > -static int sti_hdmi_connector_mode_valid(struct drm_connector *connector,
> > -					struct drm_display_mode *mode)
> > +static enum drm_mode_status
> > +sti_hdmi_connector_mode_valid(struct drm_connector *connector,
> > +			      struct drm_display_mode *mode)
> >  {
> >  	int target = mode->clock * 1000;
> >  	int target_min = target - CLK_TOLERANCE_HZ;
> > 
> > base-commit: 9abf2313adc1ca1b6180c508c25f22f9395cc780
> > -- 
> > 2.38.1
> > 
> > 
> 
> Could someone please pick this up so that it makes 6.2? We would like
> to try and get this warning turned on so that it can catch more
> potential run time issues at compile time but that can only happen when
> all the warnings are fixed.

Same here; I'll pick this up tomorrow if no one else snags it.

-- 
Kees Cook
