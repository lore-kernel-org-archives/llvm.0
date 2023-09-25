Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3337C18E38
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 14:07:39 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1dcedc832d4so1596271fac.3
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 07:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695650859; x=1696255659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOm71FSa/a54JWdPxFTdFQYbsSYB0XKCvLJel7l+Bek=;
        b=Iv+DsLM5ZqdBNST43InPAe38Xd9ekuRi+l84Ea7/o2JUdEzqoSSVtZLfqAB2iTWCsI
         cek9pnIvZXz02aW5ArkC8pYDuoTSxK0/z8ytvAxuU8my3wMv5zqk2oBlTxXxSKRvGoKo
         ixSv6/OEuudiaQyC0Fxhu55tNnU5sAS54OpzcG7eONybTsQyy65RUQ1UzsqBV19mPVgE
         uXzMrjRimVdpwaEOYnjhO97Hr+lneU9TVOd+9QVlfykJYD1G7qEGMEP2ddRcCwYDWZjA
         EE81b6vIDR3k+psw9oVgjXfbkwdZUKkRnO3vVl91V4SsD3r/GxKTP8RDPY95SslRXnqw
         uEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695650859; x=1696255659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOm71FSa/a54JWdPxFTdFQYbsSYB0XKCvLJel7l+Bek=;
        b=QlRSJpNWpUA7omtZY55RUoYBmIqDlMBsYDpuWV5kJH1Qcg6+K3Lnkto7EgRNcZL6W1
         vZKD7IgdftfFTnvdL60iYRYpcvBH2Gij6OZcknroiEmBn9gKonao2ion8kC9pkitaB4o
         dzjXlrxr+slbm55tMPc0BMkN+INbrhxGSHYcSCXg9fWU6/FnljfplecBd+g362Zqwl4p
         yAnl6NyAnK9QjBzf/EHVPjEnEReDJmqtlq0k8pJw/8Tfm8qmchAI8hFOc4JO7vTzpRT0
         g6gNrDOK3KlWyWAxX0DC+ZgJhUtnVFCojt/gps4Yi8ArUXjENdJurrnbYfSopSUw02uo
         EoCg==
X-Gm-Message-State: AOJu0YyT9YC4vMFKm4vd4XWTDV93quYLmWuHIOzf9Qj+RxDjn1TDcMb7
	XAMO+OdghZcGZo4zbuW4TmwfEKR52T6x7z0peao=
X-Google-Smtp-Source: AGHT+IEAGihrK0Fxy+zmQS+jCavrD8i0S0F6RPaTyUWR0Tsr+swWkiWj17Z4gpkbPnpNw9W+uaTcvGPHY2GFxPPQ6jk=
X-Received: by 2002:a05:6870:b68b:b0:19e:fa1f:fc2f with SMTP id
 cy11-20020a056870b68b00b0019efa1ffc2fmr7668945oab.38.1695650859043; Mon, 25
 Sep 2023 07:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org> <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com> <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
In-Reply-To: <2635922e-f52a-4e91-40c6-4f1358972786@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Sep 2023 10:07:27 -0400
Message-ID: <CADnq5_P1tg2-rWUmsRAy3aPJLT7ZmaZORMSOrPa6t6oSc5xS3g@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table
 with __counted_by
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@gmail.com>, 
	Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>, Tom Rix <trix@redhat.com>, 
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Chris Wilson <chris@chris-wilson.co.uk>, Prike Liang <Prike.Liang@amd.com>, 
	Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org, 
	Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor <nathan@kernel.org>, 
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
	Lang Yu <Lang.Yu@amd.com>, John Harrison <john.c.harrison@intel.com>, 
	Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 25, 2023 at 2:30=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.09.23 um 19:41 schrieb Alex Deucher:
> > On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.or=
g> wrote:
> >> Prepare for the coming implementation by GCC and Clang of the __counte=
d_by
> >> attribute. Flexible array members annotated with __counted_by can have
> >> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BO=
UNDS
> >> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-fami=
ly
> >> functions).
> >>
> >> As found with Coccinelle[1], add __counted_by for struct smu10_voltage=
_dependency_table.
> >>
> >> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/example=
s/counted_by.cocci
> >>
> >> Cc: Evan Quan <evan.quan@amd.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> >> Cc: David Airlie <airlied@gmail.com>
> >> Cc: Daniel Vetter <daniel@ffwll.ch>
> >> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> >> Cc: Huang Rui <ray.huang@amd.com>
> >> Cc: Kevin Wang <kevin1.wang@amd.com>
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Cc: dri-devel@lists.freedesktop.org
> >> Signed-off-by: Kees Cook <keescook@chromium.org>
> > Acked-by: Alex Deucher <alexander.deucher@amd.com>
>
> Mhm, I'm not sure if this is a good idea. That is a structure filled in
> by the firmware, isn't it?
>
> That would imply that we might need to byte swap count before it is
> checkable.

True. Good point.  Same for the other amdgpu patch.

Alex

>
> Regards,
> Christian.
>
> >
> >> ---
> >>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/dr=
ivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> >> index 808e0ecbe1f0..42adc2a3dcbc 100644
> >> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> >> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> >> @@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
> >>
> >>   struct smu10_voltage_dependency_table {
> >>          uint32_t count;
> >> -       struct smu10_clock_voltage_dependency_record entries[];
> >> +       struct smu10_clock_voltage_dependency_record entries[] __count=
ed_by(count);
> >>   };
> >>
> >>   struct smu10_clock_voltage_information {
> >> --
> >> 2.34.1
> >>
>
