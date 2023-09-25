Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7634F63D6
	for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 14:14:40 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6bf038b8f87so3960297a34.1
        for <llvm@lists.linux.dev>; Mon, 25 Sep 2023 07:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695651279; x=1696256079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJfyUt1ShfjZl6t8cnVtNZYV0Rqi3aBl3H7mr80x/Gw=;
        b=UQtrE2qylqTJGflSXzG6SRTZnac07cZDw33hZN+ryP3Sa7NatGykFvpNV5Dd/4nhNN
         ID6z7Hh1Rks+N9PkA/pwD9fI9mMSK+Crvn7SKZTRh5LJfSKqjn0HRun7iecwGH9r2l16
         Hf01rSdshRdcPQ49Em5/e1JHnqOYqJadX5oMnpoYuV+YhoIN1jurZ0FmfCNoZE9GDDUC
         jI08gSrJWOwND1tDP8yZeJIPLdayQ9UXNm7NyYOTChNOVLHNvyojrVuWTHBph3f77aku
         B2MvPLBAB3/NNBBssoTSemkDH8LQxoLcugoO9pLfzHIKx4rHMz34DLjWNkyaFtyKrE5M
         I+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695651279; x=1696256079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJfyUt1ShfjZl6t8cnVtNZYV0Rqi3aBl3H7mr80x/Gw=;
        b=WCmI5RbTU6w9ovgvOMD2604qQueHZOufEGeobHU7EdiXHHuqqrFbTU3ts7wlZz/cLa
         g1Mi1/0xZWQt/Acsr9FXb9Gb7u+G8L4sOjMWIMA2ahuZMj3zHRFVGGAR6eVhNBGLSXek
         es8jWBE3prDZvLHYhlZNTYpp4WYChIKovErjAJhszs/afz/XJNdY4Z8V6mF0kqimGtb+
         n7ocyJ4GHU234/b/Utcf7GqgWn/9SCwwM+3/7Ldac53bR1zWdNlexHUZVzZY1/PpNLl0
         jjFA/c/ghoIayYlUH4ydhD7qmDJ9SorhzX2T6lddvro06mfCSXyaJvXBQoW1omWUn8S7
         k1CQ==
X-Gm-Message-State: AOJu0YwiwHxtN80ebkB4CZ2UNPNxQZmyUyiOIH1uxad9ec1aLu4gB+E9
	1XEmg8MmkPzt2xwecHvq7JoAfJPu3G1BPxrfVpg=
X-Google-Smtp-Source: AGHT+IGzozeIAKQxxu15vnXC4O0U2/wFx2Ttdhu1Ykj7GBRveGIst2ctDf9dvYvaREsBKdttLh7p7tRIuZBiTVLnOX8=
X-Received: by 2002:a05:6871:c10:b0:1dc:dcf9:18d8 with SMTP id
 ve16-20020a0568710c1000b001dcdcf918d8mr4061353oab.24.1695651279489; Mon, 25
 Sep 2023 07:14:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org> <20230922173216.3823169-1-keescook@chromium.org>
 <CADnq5_P2p3bmczci=pU+pG6f9+hqn=-xp1EynP2345CJZRW08w@mail.gmail.com>
 <2635922e-f52a-4e91-40c6-4f1358972786@amd.com> <CADnq5_P1tg2-rWUmsRAy3aPJLT7ZmaZORMSOrPa6t6oSc5xS3g@mail.gmail.com>
In-Reply-To: <CADnq5_P1tg2-rWUmsRAy3aPJLT7ZmaZORMSOrPa6t6oSc5xS3g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 25 Sep 2023 10:14:28 -0400
Message-ID: <CADnq5_P3xDDi-MS2PkAA7paAOQ3f7DQ8+sL6W7O5HcWTFQ0BSg@mail.gmail.com>
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

On Mon, Sep 25, 2023 at 10:07=E2=80=AFAM Alex Deucher <alexdeucher@gmail.co=
m> wrote:
>
> On Mon, Sep 25, 2023 at 2:30=E2=80=AFAM Christian K=C3=B6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 22.09.23 um 19:41 schrieb Alex Deucher:
> > > On Fri, Sep 22, 2023 at 1:32=E2=80=AFPM Kees Cook <keescook@chromium.=
org> wrote:
> > >> Prepare for the coming implementation by GCC and Clang of the __coun=
ted_by
> > >> attribute. Flexible array members annotated with __counted_by can ha=
ve
> > >> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_=
BOUNDS
> > >> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-fa=
mily
> > >> functions).
> > >>
> > >> As found with Coccinelle[1], add __counted_by for struct smu10_volta=
ge_dependency_table.
> > >>
> > >> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examp=
les/counted_by.cocci
> > >>
> > >> Cc: Evan Quan <evan.quan@amd.com>
> > >> Cc: Alex Deucher <alexander.deucher@amd.com>
> > >> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > >> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> > >> Cc: David Airlie <airlied@gmail.com>
> > >> Cc: Daniel Vetter <daniel@ffwll.ch>
> > >> Cc: Xiaojian Du <Xiaojian.Du@amd.com>
> > >> Cc: Huang Rui <ray.huang@amd.com>
> > >> Cc: Kevin Wang <kevin1.wang@amd.com>
> > >> Cc: amd-gfx@lists.freedesktop.org
> > >> Cc: dri-devel@lists.freedesktop.org
> > >> Signed-off-by: Kees Cook <keescook@chromium.org>
> > > Acked-by: Alex Deucher <alexander.deucher@amd.com>
> >
> > Mhm, I'm not sure if this is a good idea. That is a structure filled in
> > by the firmware, isn't it?
> >
> > That would imply that we might need to byte swap count before it is
> > checkable.
>
> True. Good point.  Same for the other amdgpu patch.

Actually the other patch is fine.  That's just a local structure.

Alex

>
> Alex
>
> >
> > Regards,
> > Christian.
> >
> > >
> > >> ---
> > >>   drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h | 2 +-
> > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h b/=
drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > >> index 808e0ecbe1f0..42adc2a3dcbc 100644
> > >> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > >> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/smu10_hwmgr.h
> > >> @@ -192,7 +192,7 @@ struct smu10_clock_voltage_dependency_record {
> > >>
> > >>   struct smu10_voltage_dependency_table {
> > >>          uint32_t count;
> > >> -       struct smu10_clock_voltage_dependency_record entries[];
> > >> +       struct smu10_clock_voltage_dependency_record entries[] __cou=
nted_by(count);
> > >>   };
> > >>
> > >>   struct smu10_clock_voltage_information {
> > >> --
> > >> 2.34.1
> > >>
> >
