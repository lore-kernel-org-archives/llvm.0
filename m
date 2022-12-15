Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAB02F35
	for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 18:45:29 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1443a16b71cso343967fac.13
        for <llvm@lists.linux.dev>; Thu, 15 Dec 2022 10:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WEfPevdP7TJjnOIQtPsy+AcNppPJSiCKzyrt/O+WxJM=;
        b=j6kGh3ykV4NImJgI7b18PBsKNjvgGeK3aR+cZp5W/GhzrtxBO4uxn9oFBS+5IJn7hC
         wDNGjiaLz1b7Rb9LOEtYldzbpWAwEENBtSkknMRlSYdwkgZ547nKZtuDweUyNOMNtYAx
         TFfkpCycfKp9sikmP2gSadcGfBzp4dsBms2+HZ/AM1FiG7hrZLZt4olXVuDyM8uFh2Z5
         h7jkjX7L52UMfE2UCBQjC7vZfi66ulCitQ2yl1EoFvWj4xJe/06p1QRLzMXpbtfUUY2R
         psSQf5Kw5OQcgvWLswPDD+wUZNb4Oia5qqHjFN97IZuH2BOjDKQdtAXynDfNmD8oxxry
         Usww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEfPevdP7TJjnOIQtPsy+AcNppPJSiCKzyrt/O+WxJM=;
        b=0YNEyXkTMSdkht1vuEBUQOOl1vxA0d4W8XgfxmAOvz7cGjXr/L65ozRSnppwtaNaNf
         jvfupDYp3+VFi7uozQScbQ2jxS3gSnIrd7tCD1T9V3xBhTOKfGd90+TAiqmxAfeOPU9w
         HU1gfjnbG2ZwSp/zhF0Fo0o/4ogdkI2qmzwxri9N+cdNGiBkBxTCkI5nkbujFWHoFmiB
         uYgBf9+W0qkDqHO9WTJ9SCBknu/tS8L6eLzr3ymZiXLidIUFXePOzB3vwUe44ziuWiDw
         +H2P9GcOqUtTi0jLxIvFphUYWvsN+jZIMZ9BvNmU1d0/E1ymi6U4hqvX3WA421ojhdZc
         6WPQ==
X-Gm-Message-State: AFqh2kr8t/NhT3UlamhaUoIMH+TTuin5KEHnjeYKlp4aq2Hsl0BtE7BV
	WJ6zChkV9PjHa8yCjYODHalb6XeHyQZZ9dzd2oM=
X-Google-Smtp-Source: AMrXdXv8rSwR8qAQ1zJL/wkH8q0sS2srKc8zr4Ipi/FlQ13g+Lo7yphFOfIVlXGX86Y1SMSSxP5pUbKDL4g4sLXPdFA=
X-Received: by 2002:a05:6870:8091:b0:148:3c8f:15ab with SMTP id
 q17-20020a056870809100b001483c8f15abmr360847oab.46.1671129928331; Thu, 15 Dec
 2022 10:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221215163649.386750-1-arnd@kernel.org>
In-Reply-To: <20221215163649.386750-1-arnd@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Dec 2022 13:45:16 -0500
Message-ID: <CADnq5_P0M5fYCbqt+PwLSGzdeMy3YCvkaRW9sm+z7rC0Ra8_mw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: avoid large variable on kernel stack
To: Arnd Bergmann <arnd@kernel.org>
Cc: Evan Quan <evan.quan@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, Kenneth Feng <kenneth.feng@amd.com>, 
	Yang Wang <KevinYang.Wang@amd.com>, Arnd Bergmann <arnd@arndb.de>, Chengming Gui <Jack.Gui@amd.com>, 
	Tom Rix <trix@redhat.com>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>, 
	dri-devel@lists.freedesktop.org, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="UTF-8"

Applied.  Thanks!

Alex

On Thu, Dec 15, 2022 at 11:37 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The activity_monitor_external[] array is too big to fit on the
> kernel stack, resulting in this warning with clang:
>
> drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_7_ppt.c:1438:12: error: stack frame size (1040) exceeds limit (1024) in 'smu_v13_0_7_get_power_profile_mode' [-Werror,-Wframe-larger-than]
>
> Use dynamic allocation instead. It should also be possible to
> have single element here instead of the array, but this seems
> easier.
>
> Fixes: 334682ae8151 ("drm/amd/pm: enable workload type change on smu_v13_0_7")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  .../drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c  | 21 ++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> index c270f94a1b86..7eba854e09ec 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_7_ppt.c
> @@ -1439,7 +1439,7 @@ static int smu_v13_0_7_get_power_limit(struct smu_context *smu,
>
>  static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf)
>  {
> -       DpmActivityMonitorCoeffIntExternal_t activity_monitor_external[PP_SMC_POWER_PROFILE_COUNT];
> +       DpmActivityMonitorCoeffIntExternal_t *activity_monitor_external;
>         uint32_t i, j, size = 0;
>         int16_t workload_type = 0;
>         int result = 0;
> @@ -1447,6 +1447,12 @@ static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf
>         if (!buf)
>                 return -EINVAL;
>
> +       activity_monitor_external = kcalloc(sizeof(activity_monitor_external),
> +                                           PP_SMC_POWER_PROFILE_COUNT,
> +                                           GFP_KERNEL);
> +       if (!activity_monitor_external)
> +               return -ENOMEM;
> +
>         size += sysfs_emit_at(buf, size, "                              ");
>         for (i = 0; i <= PP_SMC_POWER_PROFILE_WINDOW3D; i++)
>                 size += sysfs_emit_at(buf, size, "%-14s%s", amdgpu_pp_profile_name[i],
> @@ -1459,15 +1465,17 @@ static int smu_v13_0_7_get_power_profile_mode(struct smu_context *smu, char *buf
>                 workload_type = smu_cmn_to_asic_specific_index(smu,
>                                                                CMN2ASIC_MAPPING_WORKLOAD,
>                                                                i);
> -               if (workload_type < 0)
> -                       return -EINVAL;
> +               if (workload_type < 0) {
> +                       result = -EINVAL;
> +                       goto out;
> +               }
>
>                 result = smu_cmn_update_table(smu,
>                                           SMU_TABLE_ACTIVITY_MONITOR_COEFF, workload_type,
>                                           (void *)(&activity_monitor_external[i]), false);
>                 if (result) {
>                         dev_err(smu->adev->dev, "[%s] Failed to get activity monitor!", __func__);
> -                       return result;
> +                       goto out;
>                 }
>         }
>
> @@ -1495,7 +1503,10 @@ do {                                                                                                     \
>         PRINT_DPM_MONITOR(Fclk_BoosterFreq);
>  #undef PRINT_DPM_MONITOR
>
> -       return size;
> +       result = size;
> +out:
> +       kfree(activity_monitor_external);
> +       return result;
>  }
>
>  static int smu_v13_0_7_set_power_profile_mode(struct smu_context *smu, long *input, uint32_t size)
> --
> 2.35.1
>
