Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0107479E4
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 09:20:17 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3226b8de467so14269738f8f.3
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 02:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696238416; x=1696843216; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vNiEun8BJgZFmuZelXrrpN/XVazT12AxKny5brwsu7w=;
        b=aaFnDaXVE/B5KjoSfJiHsZvGqk94a2l9qe9VTxfeSzNkaifNn6uOc77gcbs8ck22MZ
         0bIiculVbSIFFuWM+14RFlQKdUsvKmxx/4WkZtHpwJnJDwCrmdMBN+jq2boGNv1B4XWz
         M/NESU+Pnwr7kd/xcr6ojvEK9P/NMz/+rEUBJEK9Z3qMTTiKauPcLXzwRiG5LXLpTGGW
         d7/LJrsbvzgwAx0DOQOaxD7frWy42rqRvhHK5kfg0xbGUdciVMg/lJ5oztNJNIDKuTw/
         FoW6/54ikgJEgbJCVO9n7iPulhk3kXU/21rijScmY8OdZdnsq3c07g99ZH5NNvZFrsSR
         1V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696238416; x=1696843216;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vNiEun8BJgZFmuZelXrrpN/XVazT12AxKny5brwsu7w=;
        b=Oli8hrtMCJIgL1SfJy3k0q1myYuOv7ZFotVxsngn7o2IZBXwKSbkagqdTMhuM5djKY
         49n+yFLMxo67+MIW8IrpzTk8j4TDcmXz58iTJ/jbDqagRCd7yXznj5wP/+L6atisOh1l
         Yd2giQSMEjcs711EMoIM03vcVJbNh0I5TeK28yIe8XAokU2mF/cnn9+rJYkUcR7suC4E
         hFMDCZwHOzd1+lbpvsvl35KOc3IU9u4YJtyOj3ZdB982dB2I2lChhhrB+T2FXjA/nI4c
         kUZtKATwc3uRAb0KTCoUKLUawgjjnXR/6T76gb4l5OOG8fpbrpA81kIdWgecA4azbAjz
         6VTg==
X-Gm-Message-State: AOJu0YyO2aSTtGzHFEBlhk0NCMet0v7dzzurYam+9Rqn85ZqhgZGBvOc
	4ncl+Lfd243n4gPtZwPxOIE=
X-Google-Smtp-Source: AGHT+IHbGguNFjowt/WUg4Hv4Wpy0nhMxW4/Lz37ilFeyba8QPT16aUDMsJeXvW8elMT4DQ7Chc9QA==
X-Received: by 2002:adf:ee10:0:b0:319:71be:9248 with SMTP id y16-20020adfee10000000b0031971be9248mr9703358wrn.19.1696238415942;
        Mon, 02 Oct 2023 02:20:15 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id t3-20020a5d5343000000b0030ae53550f5sm27500038wrv.51.2023.10.02.02.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:20:15 -0700 (PDT)
Message-ID: <83cd056c-52ae-01dd-7576-42d41da64c26@gmail.com>
Date: Mon, 2 Oct 2023 11:20:09 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 0/9] drm: Annotate structs with __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, David Airlie <airlied@gmail.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>, Emma Anholt <emma@anholt.net>,
 Tom Rix <trix@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Prike Liang <Prike.Liang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Matthew Brost <matthew.brost@intel.com>, Karol Herbst <kherbst@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, amd-gfx@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Nathan Chancellor
 <nathan@kernel.org>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 nouveau@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>,
 linux-hardening@vger.kernel.org, Lijo Lazar <lijo.lazar@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Kevin Wang <kevin1.wang@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Melissa Wen <mwen@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Evan Quan <evan.quan@amd.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Xiaojian Du <Xiaojian.Du@amd.com>, Le Ma <le.ma@amd.com>,
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Zack Rusin <zackr@vmware.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Nirmoy Das <nirmoy.das@intel.com>, Lang Yu <Lang.Yu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 John Harrison <john.c.harrison@Intel.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
References: <20230922173110.work.084-kees@kernel.org>
 <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <169601600138.3014939.8511343741428844249.b4-ty@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 29.09.23 um 21:33 schrieb Kees Cook:
> On Fri, 22 Sep 2023 10:32:05 -0700, Kees Cook wrote:
>> This is a batch of patches touching drm for preparing for the coming
>> implementation by GCC and Clang of the __counted_by attribute. Flexible
>> array members annotated with __counted_by can have their accesses
>> bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS (for array
>> indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family functions).
>>
>> As found with Coccinelle[1], add __counted_by to structs that would
>> benefit from the annotation.
>>
>> [...]
> Since this got Acks, I figure I should carry it in my tree. Let me know
> if this should go via drm instead.
>
> Applied to for-next/hardening, thanks!
>
> [1/9] drm/amd/pm: Annotate struct smu10_voltage_dependency_table with __counted_by
>        https://git.kernel.org/kees/c/a6046ac659d6

STOP! In a follow up discussion Alex and I figured out that this won't work.

The value in the structure is byte swapped based on some firmware 
endianness which not necessary matches the CPU endianness.

Please revert that one from going upstream if it's already on it's way.

And because of those reasons I strongly think that patches like this 
should go through the DRM tree :)

Regards,
Christian.

> [2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance with __counted_by
>        https://git.kernel.org/kees/c/4df33089b46f
> [3/9] drm/i915/selftests: Annotate struct perf_series with __counted_by
>        https://git.kernel.org/kees/c/ffd3f823bdf6
> [4/9] drm/msm/dpu: Annotate struct dpu_hw_intr with __counted_by
>        https://git.kernel.org/kees/c/2de35a989b76
> [5/9] drm/nouveau/pm: Annotate struct nvkm_perfdom with __counted_by
>        https://git.kernel.org/kees/c/188aeb08bfaa
> [6/9] drm/vc4: Annotate struct vc4_perfmon with __counted_by
>        https://git.kernel.org/kees/c/59a54dc896c3
> [7/9] drm/virtio: Annotate struct virtio_gpu_object_array with __counted_by
>        https://git.kernel.org/kees/c/5cd476de33af
> [8/9] drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
>        https://git.kernel.org/kees/c/b426f2e5356a
> [9/9] drm/v3d: Annotate struct v3d_perfmon with __counted_by
>        https://git.kernel.org/kees/c/dc662fa1b0e4
>
> Take care,
>

