Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F6E43690
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:42:32 +0000 (UTC)
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5733d431209so1358181eaf.0
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695404551; x=1696009351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1mscbgmaMFCH+sggQx7YqczyCptW8ney4CIT5DP64U=;
        b=l27yJmohIQjR5PxyiTqf4/J8uTf/wuZ8kJS07DNQI/WedL7h6Go+GFfUiKbvkbZ3Sv
         OUo+ERtjg4oyBDJhEM7yhCGaqLwtaK3Y57nlgxE6kbOmPxe8CmPzRJYiYgIHakA7nJlf
         VrVv2bmEYJ575EUBUwtr+A4ybBh4MZrkk/Ro0RUbFfsQIEXC5XvVLujhNhn4IeypkGCb
         NKq2RHYgD01Az8FwJC09ZtsTw7yQIbSffdaPvXGJ0F/C32a2i0ixTN9Eq7JG2TNjVeIn
         UJQmexaQ4hdfH9ND2AEaxPcPAKdFnX8JPUtx64eY4UaGbpyiCgxlqbZaXEu4XIranJsH
         bQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695404551; x=1696009351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1mscbgmaMFCH+sggQx7YqczyCptW8ney4CIT5DP64U=;
        b=UuBwx+d8rslOhLQTsNEZ42GLznyyL5YL/7pTDSt5ALeX1PjwlEcJNqncD6LoUpReBt
         WFu/sMa75mKrKoLUvXD6YEFTbqpj2UJnCDLDx6gsWj7AKVuWo2on31ssVdiyQAvhPDGQ
         h0v6/jPe9KFC4qWzOzWrFhf5Uyf1hu819ixUAqaCxK118vJzhRpe918hb7KyRNoznmn6
         tBWs3GLWlu1/LpPIa7XIQk8JwqTpvk7REcqbu+mabQqry3HK4cZbGEDMxoJRYoNrJV6f
         l5QPlkei/HK3zG0moeb9FlCS+TtBm8LehnOnzNftTsqFp+VxmUTNnMGh+sHEf6tHCHQL
         inrg==
X-Gm-Message-State: AOJu0YxWwBrVHOJp9Ao0nEoIADeqKD3j1t9WtypH4HzX7qnvQITdKbTN
	GHXpxLm3zu/a/DeeJQuI1OxInflgV/aaZcn379Y=
X-Google-Smtp-Source: AGHT+IFPsM3Hdk+pcYqT5bpsUWbwTA0MpnAJeoAQZ6o66BtolUGO//OpOOgoyvfV1ya4MzJTleibWsMBwKq26jjzaO8=
X-Received: by 2002:a05:6870:2383:b0:1dc:33a:40d8 with SMTP id
 e3-20020a056870238300b001dc033a40d8mr162032oap.4.1695404551639; Fri, 22 Sep
 2023 10:42:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922173110.work.084-kees@kernel.org> <20230922173216.3823169-2-keescook@chromium.org>
In-Reply-To: <20230922173216.3823169-2-keescook@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 22 Sep 2023 13:42:20 -0400
Message-ID: <CADnq5_OV7L4_z5mhAq8x8nV4+yp_wGhyVeg1MrKAVoSbMVV1uw@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/amdgpu/discovery: Annotate struct ip_hw_instance
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

On Fri, Sep 22, 2023 at 1:33=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
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
> As found with Coccinelle[1], add __counted_by for struct ip_hw_instance.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/c=
ounted_by.cocci
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Hawking Zhang <Hawking.Zhang@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_discovery.c
> index d1bc7b212520..be4c97a3d7bf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
> @@ -662,7 +662,7 @@ struct ip_hw_instance {
>         u8  harvest;
>
>         int num_base_addresses;
> -       u32 base_addr[];
> +       u32 base_addr[] __counted_by(num_base_addresses);
>  };
>
>  struct ip_hw_id {
> --
> 2.34.1
>
