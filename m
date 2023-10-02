Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFAD1E524
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 18:22:25 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-278fde50024so2397191a91.1
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 11:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696270944; x=1696875744; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6vMwsjYrlAei3Hxc6ZjjNt+EO9kZEbPnxPSvxjTe6qw=;
        b=G1i6IbeqZ2KZXaMWBL2sLsHVfF3RTjsdirH599DrdEJm+TWWqqVshQYgblm7Y4sxXo
         e/kWK+m8O80Oc/Qz4Y4gYBcsHM7mKZC+P5qx9Eqp72Sv+cDQi3jhuEQlg7ZRDkoAGC+P
         TxR8u/IrpIZttReKkiZHCQsTC6wUbmo0SUyug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696270944; x=1696875744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6vMwsjYrlAei3Hxc6ZjjNt+EO9kZEbPnxPSvxjTe6qw=;
        b=R+NH+yfms8CgUGtA4+qNaxzphdWl0V11NKVPq1Bqn6J4GbHCI6U26LgKpdHybBQk8c
         t70J6HdipAvv27kZzxYKDLx6zw38mUdQ1A53VGaJQunDlijU0IyuiglT/mJ80tDO43Iu
         XS7Cw6Y/OXN5W8je1bQgETjeSaQDk3wvJbjCCQyJEYzNhjjzKCFwQz26+sjwPM50FudP
         p8axuNYAJBu9YD05BsaMTxDlEQMaefjd1lep6q6k+xlioW/6rsPVLkQECIISEpbKtEva
         7+GiTTgy889tsUVF4AQ7syM4rzqMTxiRnCbu/E2b/qGvnuYfqmteFWek4EaCJXgllW0g
         JL1Q==
X-Gm-Message-State: AOJu0YykChWyNmHkwBd2YVXjZi3L/yHtINxGPcoGIm/HWY4yeIcvvbwD
	TUtOvmRyztN7x4qGOY6tzjOaHg==
X-Google-Smtp-Source: AGHT+IFu7XIuUCGOlcsyNLly9unt/oHCJHSK53R4jpfqHFz2qYx70ADEn6oBAlKq5k57qw3fzv2Kwg==
X-Received: by 2002:a17:90b:4a42:b0:277:3afc:f27 with SMTP id lb2-20020a17090b4a4200b002773afc0f27mr561738pjb.1.1696270944558;
        Mon, 02 Oct 2023 11:22:24 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id d12-20020a17090a498c00b0026b3ed37ddcsm6358499pjh.32.2023.10.02.11.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:22:23 -0700 (PDT)
Date: Mon, 2 Oct 2023 11:22:22 -0700
From: Kees Cook <keescook@chromium.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Alex Deucher <alexdeucher@gmail.com>,
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
	Zack Rusin <zackr@vmware.com>, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Message-ID: <202310021122.B6DA850FB0@keescook>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
 <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
 <CADnq5_Ma2CrLYggJHKFEObsNmUoqJwb2p1xai5DfL=m43U6zEA@mail.gmail.com>
 <202310020952.E7DE0948C0@keescook>
 <10644b5f-b0a7-85ef-0658-2353ee14df0d@gmail.com>
 <202310021107.9BB46FB8E@keescook>
 <0be2dfa4-b6c1-f62a-66e1-615da7aa3c76@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0be2dfa4-b6c1-f62a-66e1-615da7aa3c76@amd.com>

On Mon, Oct 02, 2023 at 08:11:41PM +0200, Christian König wrote:
> Am 02.10.23 um 20:08 schrieb Kees Cook:
> > On Mon, Oct 02, 2023 at 08:01:57PM +0200, Christian König wrote:
> > > Am 02.10.23 um 18:53 schrieb Kees Cook:
> > > > On Mon, Oct 02, 2023 at 11:06:19AM -0400, Alex Deucher wrote:
> > > > > On Mon, Oct 2, 2023 at 5:20 AM Christian König
> > > > > <ckoenig.leichtzumerken@gmail.com> wrote:
> > > > > > Am 29.09.23 um 21:33 schrieb Kees Cook:
> > > > > > > On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
> > > > > > > > This is a batch of patches touching drm for preparing for the coming
> > > > > > > > implementation by GCC and Clang of the __counted_by attribute. Flexible
> > > > > > > > array members annotated with __counted_by can have their accesses
> > > > > > > > bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
> > > > > > > > indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
> > > > > > > > 
> > > > > > > > As found with Coccinelle[1], add __counted_by to structs that would
> > > > > > > > benefit from the annotation.
> > > > > > > > 
> > > > > > > > [...]
> > > > > > > Since this got Acks, I figure I should carry it in my tree. Let me know
> > > > > > > if this should go via drm instead.
> > > > > > > 
> > > > > > > Applied to for-next/hardening, thanks!
> > > > > > > 
> > > > > > > [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
> > > > > > >          https://git.kernel.org/kees/c/a6046ac659d6
> > > > > > STOP! In a follow up discussion Alex and I figured out that this won't work.
> > > > I'm so confused; from the discussion I saw that Alex said both instances
> > > > were false positives?
> > > > 
> > > > > > The value in the structure is byte swapped based on some firmware
> > > > > > endianness which not necessary matches the CPU endianness.
> > > > > SMU10 is APU only so the endianess of the SMU firmware and the CPU
> > > > > will always match.
> > > > Which I think is what is being said here?
> > > > 
> > > > > > Please revert that one from going upstream if it's already on it's way.
> > > > > > 
> > > > > > And because of those reasons I strongly think that patches like this
> > > > > > should go through the DRM tree :)
> > > > Sure, that's fine -- please let me know. It was others Acked/etc. Who
> > > > should carry these patches?
> > > Probably best if the relevant maintainer pick them up individually.
> > > 
> > > Some of those structures are filled in by firmware/hardware and only the
> > > maintainers can judge if that value actually matches what the compiler
> > > needs.
> > > 
> > > We have cases where individual bits are used as flags or when the size is
> > > byte swapped etc...
> > > 
> > > Even Alex and I didn't immediately say how and where that field is actually
> > > used and had to dig that up. That's where the confusion came from.
> > Okay, I've dropped them all from my tree. Several had Acks/Reviews, so
> > hopefully those can get picked up for the DRM tree?
> 
> I will pick those up to go through drm-misc-next.
> 
> Going to ping maintainers once more when I'm not sure if stuff is correct or
> not.

Sounds great; thanks!

-Kees

-- 
Kees Cook
