Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174F42BF8
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:42:03 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1d71102a35bso1273830fac.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695404522; x=1696009322; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XekgGSaX3ptkpR/7Vl4AaE79EkIJG3ApSeSAmfaaNYY=;
        b=Rz9GQFXnFGoHw/tON6ejd2klYaoGWLBxLSr5+anISVCRuKqwKnjqsDzRgj0OZYS0id
         +6b4OaktTYZpcpmQgWJUiCxajPBkokUcURfRk6Rshnc8UC/Ods5mnOTacfjcMoPlJH2z
         vn51e6+Ax6AOWfHB9hQ3Q+0d/mv0rarDf1ycn4n1UJLy6iWE0qSIE8PGQCmt9l2WI6J/
         YkO0gUffyEIS6s70v7eiubg5C3H7Uvn32UAXqXIGqKvBFCNHPMQqDtSth+jbrE5BDJSw
         dJ3AmHslOuqbHqchoLJt+/WwILMR+y3E+mvGLfQ3706DoCozmQXUywO8vSVFXBnrQmPD
         OEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695404522; x=1696009322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XekgGSaX3ptkpR/7Vl4AaE79EkIJG3ApSeSAmfaaNYY=;
        b=Ev4WSh6ceKsQWc4iASLIKwhvWukQzK+jinnK7yxekN4zdh/Uwq2lUiCF6DPmXWUPB2
         K8ICbBIS7PzckGpw4icjYixNl54zs+60nL22aWIxLkmeggQ+HE08i3cW3nXCmsQIvcgG
         CkyMd+djFlsu8FutFFQo26lgN1VEmonQPjs5ofxKdcv8ECZsNLHJEHl3LmHOQe0u2nWf
         884pue7eYs0lrayy9ace8EH91RIeRUlmqwuDj3wOOKhiyeflkZ8kKtoLvpGgj0d2DmO3
         0N1Q+PEIV6IyagSA/F+NfYIkDEc3gVbLsyGs1khALd2a9B6q5RKxhbygTyyosVs5hm1v
         JvIw==
X-Gm-Message-State: AOJu0YxtzTAdM++27S12+gZFaWb+C2Lcrs3gYNTYhkzEF6PLVnx2e8DK
	v5sNM0XCoy1ujvjkAaB+IgioU9fg53wtNqH+8UY=
X-Google-Smtp-Source: AGHT+IG39K8OoDMaCogRuGeRtHy4kPLjYTbpmj4vuvYl6iT+u3RXeJQ2kVCIXH4X5mx+L+1FvNpYYUZbI2a21sY0YAA=
X-Received: by 2002:a05:6870:f689:b0:1d5:b9e1:d35e with SMTP id
 el9-20020a056870f68900b001d5b9e1d35emr103462oab.41.1695404522615; Fri, 22 Sep
 2023 10:42:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org> <20230922173216.3823169-1-keescook@chromium.org>
In-Reply-To: <20230922173216.3823169-1-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Sep 2023 13:41:51 -0400
Message-ID: <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table
 with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: David Airlie <airlied@gmail.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>, 
	Emma Anholt <emma@anholt.net>, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, 
	Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthew Brost <matthew.brost@intel.com>, 
	Karol Herbst <kherbst@redhat.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	amd-gfx@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, 
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>, Ben Skeggs <bskeggs@redhat.com>, 
	Andi Shyti <andi.shyti@linux.intel.com>, nouveau@lists.freedesktop.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux-foundation.org, 
	linux-hardening@vger.kernel.org, Lijo Lazar <lijo.lazar@amd.com>, 
	Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Melissa Wen <mwen@igalia.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xiaojian Du <Xiaojian.Du@amd.com>, 
	Le Ma <le.ma@amd.com>, freedreno@lists.freedesktop.org, 
	Bjorn Andersson <andersson@kernel.org>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	Alex Deucher <alexander.deucher@amd.com>, Nirmoy Das <nirmoy.das@intel.com>, 
	Lang Yu <Lang.Yu@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	John Harrison <john.c.harrison@intel.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_b=
y
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUND=
S
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct smu10_voltage_de=
pendency_table.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Evan Quan <evan.quan@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Kevin Wang <kevin1.wang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/drive=
rs/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> index 808e0ecbe1f0..42adc2a3dcbc 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> @@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
>
>  struct smu10_voltage_dependency_table {
>         uint32_t count;
> -       struct smu10_clock_voltage_dependency_record entries[];
> +       struct smu10_clock_voltage_dependency_record entries[] __counted_=
by(count);
>  };
>
>  struct smu10_clock_voltage_information {
> --
> 2.34.1
>
