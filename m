Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9375542C0B
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 19:34:02 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c60a514f3aso98486425ad.3
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 12:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696016042; x=1696620842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ym+ucW6MHQZimVVr4/aWJAbaMhbjuFeNaLImS0cTOp0=;
        b=UflmKeSkrd8tnRSF8EaEGYnxhGjSnKXSn+UxVi+HT1/+qOAscT5WcBFkIZbsnUGzgo
         7GuQ5k0YumaA4woMqfDY8N0RmFo1UB7+YyFgKMqhYGBW1+G7bB8ylu1Ks6DsJcZf9HWv
         w8WLxTQor6yTi/nYHl4hKqfc6sEv3yRJS69Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696016042; x=1696620842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ym+ucW6MHQZimVVr4/aWJAbaMhbjuFeNaLImS0cTOp0=;
        b=pYLJ6x+KjpijKEpw4mjTQcgv0bx0R+Xu3ROgJC6a0t9FUlSK7iSt8Vc+BW1r30hrBC
         Zetqu51TZEVWf4Hi36WDgzLjKg+SfvGXVyh0hLDENKq5ulvwdcUuRp75jMSNZySRWOLT
         aNo6yRjaWVXlU+3IsyzEaoXgeWTP13RX/167AdgKse5O5pVzRuUbNCoovG6HQCUsrnnx
         RHEAXM6n1EU9UR8YZl5oDfbK+KxKtIzCdzhUUI415SNfsw+Iua/ugTX4LRd7jYzHJxeB
         bV+YSAMWv2kaKtfv+/R7GhVM48o3WiO7Z8hsCCgzzCCMLfOZeodlQxwRhRDvlQIo8qig
         XSHw==
X-Gm-Message-State: AOJu0YwWBoZ+kNbJOjL6ujr1NlyA3UApNFnBXwtpSkipt9P7cRRgyUSq
	FLnu5UQ7OQnXJpBOwJkJnX4fhQ==
X-Google-Smtp-Source: AGHT+IGQWTdEpdWeBEvd5foAb6HBvD/EqemA8SP9BycZ81OPm2PcYAndv1e0P5bQalrHP7ERsAZdBw==
X-Received: by 2002:a17:902:720a:b0:1c1:dbd6:9bf6 with SMTP id ba10-20020a170902720a00b001c1dbd69bf6mr4494391plb.41.1696016042045;
        Fri, 29 Sep 2023 12:34:02 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jg6-20020a17090326c600b001c61df93afdsm10225856plb.59.2023.09.29.12.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 12:34:01 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: David Airlie <airlied@gmail.com>,
	Kees Cook <keescook@chromium.org>
Cc: Emma Anholt <emma@anholt.net>,
	Evan Quan <evan.quan@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Xiaojian Du <Xiaojian.Du@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Kevin Wang <kevin1.wang@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	John Harrison <john.c.harrison@Intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Zack Rusin <zackr@vmware.com>,
	VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
	Melissa Wen <mwen@igalia.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Le Ma <le.ma@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Yifan Zhang <yifan1.zhang@amd.com>,
	Prike Liang <Prike.Liang@amd.com>,
	Lang Yu <Lang.Yu@amd.com>,
	Tejas Upadhyay <tejas.upadhyay@intel.com>,
	Nirmoy Das <nirmoy.das@intel.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Date: Fri, 29 Sep 2023 12:33:24 -0700
Message-Id: <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230922173110.work.084-kees@kernel.org>
References: <20230922173110.work.084-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
> This is a batch of patches touching drm for preparing for the coming
> implementation by GCC and Clang of the __counted_by attribute. Flexible
> array members annotated with __counted_by can have their accesses
> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
> 
> As found with Coccinelle[1], add __counted_by to structs that would
> benefit from the annotation.
> 
> [...]

Since this got Acks, I figure I should carry it in my tree. Let me know
if this should go via drm instead.

Applied to for-next/hardening, thanks!

[1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
      https://git.kernel.org/kees/c/a6046ac659d6
[2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_by
      https://git.kernel.org/kees/c/4df33089b46f
[3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
      https://git.kernel.org/kees/c/ffd3f823bdf6
[4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
      https://git.kernel.org/kees/c/2de35a989b76
[5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
      https://git.kernel.org/kees/c/188aeb08bfaa
[6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
      https://git.kernel.org/kees/c/59a54dc896c3
[7/9] drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
      https://git.kernel.org/kees/c/5cd476de33af
[8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
      https://git.kernel.org/kees/c/b426f2e5356a
[9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
      https://git.kernel.org/kees/c/dc662fa1b0e4

Take care,

-- 
Kees Cook

