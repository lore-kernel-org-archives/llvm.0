Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3269E1CFA5
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 16:53:25 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6910ea9cca1so13103226b3a.1
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696265605; x=1696870405; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zPrUH5J+k/nTCuPqHTvyGlvTCCkInD9EOwhmWD637e8=;
        b=QYb8nv+0WQVt0lW/ZbCcwhOcyoru2Vy1y/wch7X47cVX1Ld/o/hRhUMuWvsUeJ90Pu
         hqnqGnA4/6Esa5Ko5EM7W9iN0yv/Rxv6uTz0PUPVt27kuh2GytmfFKU+6N/VESV3XvGV
         f8AhUDSu5b/4SJpAYAQJoEKPUv3mlQIUlJjo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696265605; x=1696870405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPrUH5J+k/nTCuPqHTvyGlvTCCkInD9EOwhmWD637e8=;
        b=p5yqLc7FoMmqWrET+l/I3ju8iqln+pHA6Erj7hrdYbBZ84g5MtltsaoKJFQX+Zkjbj
         oKCQc6VKz1vKgf8euxm2jg1QchQvK6FRcgRvD+ElL9gNGGAE4FL0261he4lCp6jufYR8
         /GnCpGXY1Wcc6F6CTXWb/FOTe4AHIKgUZBaaVOXMEKoqCh5CCzvvWaRtC3tqh/a8wg8E
         CbX1VSF3CAdFA4WfYdx8o1PMpKW4sdQ19LsO1tu9n0wAkIsp5AyUTjVSeXOQvuebgQvS
         iWmzr1vccriaUOsA2uhQNRW3doUg9NnW1ftDb1yGN1iQyDnExO5q3ymwDW8T7ybK8bye
         x/Qg==
X-Gm-Message-State: AOJu0YwIoJPvjAqKug2vqIZl0ftcex3ne6caEhzbDNVKaqvU9nUFWBNj
	NYRl48EqSlKoCGGYYpPrpcnn3A==
X-Google-Smtp-Source: AGHT+IFEV6bmAIpHw+or7unvvp4cwTsozoazziwp2MnJPMacuVlS3tG5VZyJpyiWZTmsINX1q284Ww==
X-Received: by 2002:a05:6a20:9687:b0:15a:836:7239 with SMTP id hp7-20020a056a20968700b0015a08367239mr8898824pzc.11.1696265605341;
        Mon, 02 Oct 2023 09:53:25 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s24-20020aa78d58000000b0068fdb59e9d6sm19485160pfe.78.2023.10.02.09.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 09:53:24 -0700 (PDT)
Date: Mon, 2 Oct 2023 09:53:21 -0700
From: Kees Cook <keescook@chromium.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Karol Herbst <kherbst@redhat.com>, Tom Rix <trix@redhat.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Evan Quan <evan.quan@amd.com>, Emma Anholt <emma@anholt.net>,
	amd-gfx@lists.freedesktop.org,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Chia-I Wu <olvaffe@gmail.com>, llvm@lists.linux.dev,
	Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Nathan Chancellor <nathan@kernel.org>, Le Ma <le.ma@amd.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Maxime Ripard <mripard@kernel.org>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	virtualization@lists.linux-foundation.org,
	Sean Paul <sean@poorly.run>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xiaojian Du <Xiaojian.Du@amd.com>, Lang Yu <Lang.Yu@amd.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-kernel@vger.kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>,
	Rob Clark <robdclark@gmail.com>, Melissa Wen <mwen@igalia.com>,
	John Harrison <john.c.harrison@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Alex Deucher <alexander.deucher@amd.com>,
	Nirmoy Das <nirmoy.das@intel.com>, freedreno@lists.freedesktop.org,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zack Rusin <zackr@vmware.com>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Message-ID: <202310020952.E7DE0948C0@keescook>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
 <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
 <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>

On Mon, Oct 02, 2023 at 11:06:19AM -0400, Alex Deucher wrote:
> On Mon, Oct 2, 2023 at 5:20 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > Am 29.09.23 um 21:33 schrieb Kees Cook:
> > > On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
> > >> This is a batch of patches touching drm for preparing for the coming
> > >> implementation by GCC and Clang of the __counted_by attribute. Flexible
> > >> array members annotated with __counted_by can have their accesses
> > >> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
> > >> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
> > >>
> > >> As found with Coccinelle[1], add __counted_by to structs that would
> > >> benefit from the annotation.
> > >>
> > >> [...]
> > > Since this got Acks, I figure I should carry it in my tree. Let me know
> > > if this should go via drm instead.
> > >
> > > Applied to for-next/hardening, thanks!
> > >
> > > [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
> > >        https://git.kernel.org/kees/c/a6046ac659d6
> >
> > STOP! In a follow up discussion Alex and I figured out that this won't work.

I'm so confused; from the discussion I saw that Alex said both instances
were false positives?

> >
> > The value in the structure is byte swapped based on some firmware
> > endianness which not necessary matches the CPU endianness.
> 
> SMU10 is APU only so the endianess of the SMU firmware and the CPU
> will always match.

Which I think is what is being said here?

> > Please revert that one from going upstream if it's already on it's way.
> >
> > And because of those reasons I strongly think that patches like this
> > should go through the DRM tree :)

Sure, that's fine -- please let me know. It was others Acked/etc. Who
should carry these patches?

Thanks!

-Kees


> >
> > Regards,
> > Christian.
> >
> > > [2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_by
> > >        https://git.kernel.org/kees/c/4df33089b46f
> > > [3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
> > >        https://git.kernel.org/kees/c/ffd3f823bdf6
> > > [4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
> > >        https://git.kernel.org/kees/c/2de35a989b76
> > > [5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
> > >        https://git.kernel.org/kees/c/188aeb08bfaa
> > > [6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
> > >        https://git.kernel.org/kees/c/59a54dc896c3
> > > [7/9] drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
> > >        https://git.kernel.org/kees/c/5cd476de33af
> > > [8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
> > >        https://git.kernel.org/kees/c/b426f2e5356a
> > > [9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
> > >        https://git.kernel.org/kees/c/dc662fa1b0e4
> > >
> > > Take care,
> > >
> >

-- 
Kees Cook
