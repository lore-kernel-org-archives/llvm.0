Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9931F37DA
	for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737040695; cv=none; b=tm15AMhkiHISaUuZ8JRFKUcP7ga+NaujXaeHGl9raXfdVdwVuG45MQKd1f5BUyoz001dh+Zh+KjLxRt6zIwRwylT6Ca6YaOdhNgfkZDEvyQsQbtRjkxsidHelxiqMy33dZPWLL6IYc3bdWqkCDTvlJnaRFGRA+FcVbil/m4Ljv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737040695; c=relaxed/simple;
	bh=HFgdcY88Q2gUtspWt70FmZsSDuePgRHEHZWE+tGwqFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J21/QfX/eoWzE5DWYgCWonjOFpu2gjMoCek6K9kAoCiKZKrJOYaoKakTTZQcQWtNP5eUa7TOi2ROUaUDARcOvCRanVT/+fHlMQk2cFoZngwYWJbWAMAgfGPVsJmQhPJ1Y2rIlwrwZeFJTZHojyVEn/4GjQrGuOoxbeXuXQk9GMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLhM6QKZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLhM6QKZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so229366a91.0
        for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 07:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737040693; x=1737645493; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJm0r90NwoqgwUPhDVQmEXd7HO7a18pIi0V5sfq4N7Y=;
        b=nLhM6QKZ1nSu5PmyNIS+w5o0A+j8dJ1uw02npEDW4SiIiQ0rM6SQLszZZhYS6u5oKh
         IkC0FsmonDAWC15YSc2dXiaULdYuueUr7mpKnUrjo6OJtBAaaY7+uqldBfE1ONnwe2Bw
         hUrG7YFVevgUTaQe6WaSgmqKanlpOalH3VMVvFRRCoKrjEzBjDHK4I/kqXG+sTRr0fRa
         DHDCIKfqi7JcFir6eC/Iny8AAHexbx/omqPgN9hCPDMcxvDdx4/w7cpzgEZ4hm5a8PZp
         WCXpHisbBlZcwm8q5So+CAws4C/cBxOw/fqJE0D/ad2fyz9iVHiExtGgVlsOG4B3ppxV
         Zo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737040693; x=1737645493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJm0r90NwoqgwUPhDVQmEXd7HO7a18pIi0V5sfq4N7Y=;
        b=jLHKym/szyzZuec2bkeuJfC6IGh03PDtS9YVa1PqtWPTJiee1v4biB0w90iZS9WZya
         VVKZZusKxdth4SvTNzgfaH0jkeIj4hh+ou+J/kEyxSuGuRxPpE5DKo4lKJgmSb9AVaLd
         NZRJ0Ojo4OjjH44Yh3PU9iG4dAc0hEzHEp+DQCNtwa9vE4K54Zuf1SslaTV6LmyBpNtY
         8juJTE/2UVPhYTm0GYhBWcOoIGzQbfyaF/MNr4zeRjzb2Tc8VL0HdHvAgXr4JjGQf7r0
         +NY2R1LD9mvYKidVO2AxXGCjO0RORASR0yQYs8tAOWcl9rm9p3ZimZEjIsGlXIMaikrM
         YLZg==
X-Forwarded-Encrypted: i=1; AJvYcCUfe9bQNw+Nl1jUDa3n7Ss1TbKft61ef71lvUFPqFbrtk29kZEXmmT2AuN+5tLaFzi/CVDW@lists.linux.dev
X-Gm-Message-State: AOJu0YxPs18Bqf0nrGjUnpqDod/VI1fprxVFz3PxnEsUdbJzlzn4+WFo
	1Hp8h1w2fX7fgd96bQD/Jjeet21noQPeM4yIKnBB0iA/nowKR6KF5p6f0VZaRn2tJSBV7DSEllo
	+QRMA2fWeLeuaqfwJ1/4AogDQcc4=
X-Gm-Gg: ASbGnctU8215ckWcpwtUsPX04z91r0VTE0oxjYbjCuxiHt/qr5VLlqbOTDapS8LsbeH
	3MDxThbWaf7HWkLNTbL4pTH2mBHWuFsF7XjoVrw==
X-Google-Smtp-Source: AGHT+IHeljAcJviN6u9sbzSiGScxHYRkryL9ZA2HNxuad5Avq/5ytEMDjPcHxwrtZcq6xpXdzfrSsti0hwMkG3em5sQ=
X-Received: by 2002:a17:90b:2808:b0:2ea:bb3a:8f09 with SMTP id
 98e67ed59e1d1-2f548db69e5mr17476719a91.0.1737040692693; Thu, 16 Jan 2025
 07:18:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250109053504.2998728-1-tzungbi@kernel.org> <20250116144049.GA1810277@ax162>
In-Reply-To: <20250116144049.GA1810277@ax162>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 16 Jan 2025 10:18:01 -0500
X-Gm-Features: AbW1kvZkSaymwon3Pq9eKEJtpfIVCKqNoRHYFPKs1E90g7MwCjklpIvJPlWoY6k
Message-ID: <CADnq5_MkWwW2B_8jgJJVbj+7pqyePc3cQznwPvwpHUwT2J40nA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: mark static functions noinline_for_stack
To: Nathan Chancellor <nathan@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, chaitanya.dhere@amd.com, jun.lei@amd.com, 
	harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, 
	alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com, 
	airlied@gmail.com, simona@ffwll.ch, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2025 at 9:47=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hi Tzung-Bi,
>
> First of all, thanks for the patch!
>
> On Thu, Jan 09, 2025 at 05:35:04AM +0000, Tzung-Bi Shih wrote:
> > When compiling allmodconfig (CONFIG_WERROR=3Dy) with clang-19, see the
> > following errors:
> >
> > .../display/dc/dml2/display_mode_core.c:6268:13: warning: stack frame s=
ize (3128) exceeds limit (3072) in 'dml_prefetch_check' [-Wframe-larger-tha=
n]
> > .../display/dc/dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:7236:13:=
 warning: stack frame size (3256) exceeds limit (3072) in 'dml_core_mode_su=
pport' [-Wframe-larger-than]
> >
> > Mark static functions called by dml_prefetch_check() and
> > dml_core_mode_support() noinline_for_stack to avoid them become huge
> > functions and thus exceed the frame size limit.
>
> So I fixed these particular instances by hiding them when certain
> sanitizers are enabled:
>
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/e4479aecf6581af81bc09=
08575447878d2a07e01
>
> However, there are still reports of the regular 2048 limit being hit
> with certain configurations such as LTO (the issue number is somewhat
> funny given the situation):
>
> https://github.com/ClangBuiltLinux/linux/issues/2048
>
> So I think it would be a good idea for the AMD folks to consider
> applying this patch as well.

Sure.  Applied.  Thanks.

Alex

>
> > A way to reproduce:
> > $ git checkout next-20250107
> > $ mkdir build_dir
> > $ export PATH=3D/tmp/llvm-19.1.6-x86_64/bin:$PATH
> > $ make LLVM=3D1 O=3Dbuild_dir allmodconfig
> > $ make LLVM=3D1 O=3Dbuild_dir drivers/gpu/drm/ -j
> >
> > The way how it chose static functions to mark:
> > [0] Unset CONFIG_WERROR in build_dir/.config.
> > To get display_mode_core.o without errors.
> >
> > [1] Get a function list called by dml_prefetch_check().
> > $ sed -n '6268,6711p' drivers/gpu/drm/amd/display/dc/dml2/display_mode_=
core.c \
> >   | sed -n -r 's/.*\W(\w+)\(.*/\1/p' | sort -u >/tmp/syms
> >
> > [2] Get the non-inline function list.
> > Objdump won't show the symbols if they are inline functions.
> >
> > $ make LLVM=3D1 O=3Dbuild_dir drivers/gpu/drm/ -j
> > $ objdump -d build_dir/.../display_mode_core.o | \
> >   ./scripts/checkstack.pl x86_64 0 | \
> >   grep -f /tmp/syms | cut -d' ' -f2- >/tmp/orig
> >
> > [3] Get the full function list.
> > Append "-fno-inline" to `CFLAGS_.../display_mode_core.o` in
> > drivers/gpu/drm/amd/display/dc/dml2/Makefile.
> >
> > $ make LLVM=3D1 O=3Dbuild_dir drivers/gpu/drm/ -j
> > $ objdump -d build_dir/.../display_mode_core.o | \
> >   ./scripts/checkstack.pl x86_64 0 | \
> >   grep -f /tmp/syms | cut -d' ' -f2- >/tmp/noinline
> >
> > [4] Get the inline function list.
> > If a symbol only in /tmp/noinline but not in /tmp/orig, it is a good
> > candidate to mark noinline.
> >
> > $ diff /tmp/orig /tmp/noinline
> >
> > Chosen functions and their stack sizes:
> > CalculateBandwidthAvailableForImmediateFlip [display_mode_core.o]:144
> > CalculateExtraLatency [display_mode_core.o]:176
> > CalculateTWait [display_mode_core.o]:64
> > CalculateVActiveBandwithSupport [display_mode_core.o]:112
> > set_calculate_prefetch_schedule_params [display_mode_core.o]:48
> >
> > CheckGlobalPrefetchAdmissibility [dml2_core_dcn4_calcs.o]:544
> > calculate_bandwidth_available [dml2_core_dcn4_calcs.o]:320
> > calculate_vactive_det_fill_latency [dml2_core_dcn4_calcs.o]:272
> > CalculateDCFCLKDeepSleep [dml2_core_dcn4_calcs.o]:208
> > CalculateODMMode [dml2_core_dcn4_calcs.o]:208
> > CalculateOutputLink [dml2_core_dcn4_calcs.o]:176
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> >  .../gpu/drm/amd/display/dc/dml2/display_mode_core.c  | 12 ++++++------
> >  .../dml2/dml21/src/dml2_core/dml2_core_dcn4_calcs.c  | 12 ++++++------
> >  2 files changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c b/=
drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> > index 35bc917631ae..84a2de9a76d4 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/display_mode_core.c
> > @@ -1736,7 +1736,7 @@ static void CalculateBytePerPixelAndBlockSizes(
> >  #endif
> >  } // CalculateBytePerPixelAndBlockSizes
> >
> > -static dml_float_t CalculateTWait(
> > +static noinline_for_stack dml_float_t CalculateTWait(
> >               dml_uint_t PrefetchMode,
> >               enum dml_use_mall_for_pstate_change_mode UseMALLForPState=
Change,
> >               dml_bool_t SynchronizeDRRDisplaysForUCLKPStateChangeFinal=
,
> > @@ -4458,7 +4458,7 @@ static void CalculateSwathWidth(
> >       }
> >  } // CalculateSwathWidth
> >
> > -static  dml_float_t CalculateExtraLatency(
> > +static noinline_for_stack dml_float_t CalculateExtraLatency(
> >               dml_uint_t RoundTripPingLatencyCycles,
> >               dml_uint_t ReorderingBytes,
> >               dml_float_t DCFCLK,
> > @@ -5915,7 +5915,7 @@ static dml_uint_t DSCDelayRequirement(
> >       return DSCDelayRequirement_val;
> >  }
> >
> > -static dml_bool_t CalculateVActiveBandwithSupport(dml_uint_t NumberOfA=
ctiveSurfaces,
> > +static noinline_for_stack dml_bool_t CalculateVActiveBandwithSupport(d=
ml_uint_t NumberOfActiveSurfaces,
> >                                                                        =
       dml_float_t ReturnBW,
> >                                                                        =
       dml_bool_t NotUrgentLatencyHiding[],
> >                                                                        =
       dml_float_t ReadBandwidthLuma[],
> > @@ -6019,7 +6019,7 @@ static void CalculatePrefetchBandwithSupport(
> >  #endif
> >  }
> >
> > -static dml_float_t CalculateBandwidthAvailableForImmediateFlip(
> > +static noinline_for_stack dml_float_t CalculateBandwidthAvailableForIm=
mediateFlip(
> >                                                                        =
                               dml_uint_t NumberOfActiveSurfaces,
> >                                                                        =
                               dml_float_t ReturnBW,
> >                                                                        =
                               dml_float_t ReadBandwidthLuma[],
> > @@ -6213,7 +6213,7 @@ static dml_uint_t CalculateMaxVStartup(
> >       return max_vstartup_lines;
> >  }
> >
> > -static void set_calculate_prefetch_schedule_params(struct display_mode=
_lib_st *mode_lib,
> > +static noinline_for_stack void set_calculate_prefetch_schedule_params(=
struct display_mode_lib_st *mode_lib,
> >                                                  struct CalculatePrefet=
chSchedule_params_st *CalculatePrefetchSchedule_params,
> >                                                  dml_uint_t j,
> >                                                  dml_uint_t k)
> > @@ -6265,7 +6265,7 @@ static void set_calculate_prefetch_schedule_param=
s(struct display_mode_lib_st *m
> >                               CalculatePrefetchSchedule_params->Tno_bw =
=3D &mode_lib->ms.Tno_bw[k];
> >  }
> >
> > -static void dml_prefetch_check(struct display_mode_lib_st *mode_lib)
> > +static noinline_for_stack void dml_prefetch_check(struct display_mode_=
lib_st *mode_lib)
> >  {
> >       struct dml_core_mode_support_locals_st *s =3D &mode_lib->scratch.=
dml_core_mode_support_locals;
> >       struct CalculatePrefetchSchedule_params_st *CalculatePrefetchSche=
dule_params =3D &mode_lib->scratch.CalculatePrefetchSchedule_params;
> > diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dm=
l2_core_dcn4_calcs.c b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_c=
ore/dml2_core_dcn4_calcs.c
> > index b9ec243cf9ba..7fffca67ca9d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_dcn4_calcs.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dml2/dml21/src/dml2_core/dml2_core=
_dcn4_calcs.c
> > @@ -2778,7 +2778,7 @@ static double dml_get_return_bandwidth_available(
> >       return return_bw_mbps;
> >  }
> >
> > -static void calculate_bandwidth_available(
> > +static noinline_for_stack void calculate_bandwidth_available(
> >       double avg_bandwidth_available_min[dml2_core_internal_soc_state_m=
ax],
> >       double avg_bandwidth_available[dml2_core_internal_soc_state_max][=
dml2_core_internal_bw_max],
> >       double urg_bandwidth_available_min[dml2_core_internal_soc_state_m=
ax], // min between SDP and DRAM
> > @@ -3531,7 +3531,7 @@ static void CalculateUrgentBurstFactor(
> >
> >  }
> >
> > -static void CalculateDCFCLKDeepSleep(
> > +static noinline_for_stack void CalculateDCFCLKDeepSleep(
> >       const struct dml2_display_cfg *display_cfg,
> >       unsigned int NumberOfActiveSurfaces,
> >       unsigned int BytePerPixelY[],
> > @@ -4076,7 +4076,7 @@ static bool ValidateODMMode(enum dml2_odm_mode OD=
MMode,
> >       return true;
> >  }
> >
> > -static void CalculateODMMode(
> > +static noinline_for_stack void CalculateODMMode(
> >       unsigned int MaximumPixelsPerLinePerDSCUnit,
> >       unsigned int HActive,
> >       enum dml2_output_format_class OutFormat,
> > @@ -4173,7 +4173,7 @@ static void CalculateODMMode(
> >  #endif
> >  }
> >
> > -static void CalculateOutputLink(
> > +static noinline_for_stack void CalculateOutputLink(
> >       struct dml2_core_internal_scratch *s,
> >       double PHYCLK,
> >       double PHYCLKD18,
> > @@ -5928,7 +5928,7 @@ static double calculate_impacted_Tsw(unsigned int=
 exclude_plane_idx, unsigned in
> >  }
> >
> >  // a global check against the aggregate effect of the per plane prefet=
ch schedule
> > -static bool CheckGlobalPrefetchAdmissibility(struct dml2_core_internal=
_scratch *scratch,
> > +static noinline_for_stack bool CheckGlobalPrefetchAdmissibility(struct=
 dml2_core_internal_scratch *scratch,
> >                                                                        =
                struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_par=
ams *p)
> >  {
> >       struct dml2_core_calcs_CheckGlobalPrefetchAdmissibility_locals *s=
 =3D &scratch->CheckGlobalPrefetchAdmissibility_locals;
> > @@ -6941,7 +6941,7 @@ static void calculate_bytes_to_fetch_required_to_=
hide_latency(
> >       }
> >  }
> >
> > -static void calculate_vactive_det_fill_latency(
> > +static noinline_for_stack void calculate_vactive_det_fill_latency(
> >               const struct dml2_display_cfg *display_cfg,
> >               unsigned int num_active_planes,
> >               unsigned int bytes_required_l[],
> > --
> > 2.47.1.613.gc27f4b7a9f-goog
> >
