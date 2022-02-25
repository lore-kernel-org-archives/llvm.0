Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA27C
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 16:23:40 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id u17-20020a056830231100b005ad13358af9so3924395ote.11
        for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 08:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wR/eoNNXBj1/My2CpHa5GPCtjCjqHRpXOZvwkOgYW9w=;
        b=EcyjzPZs9kbSzl+d2LBUySEw7Ulmassdt6Hh8IuhHTLAjFK8LAnbRNuhMjYtBURuh7
         U7PUdfm+Nkp0qFhqzg1Ssk5rv1jeROeHDT3B/Is+J9tVvn/HlyFYUEwmU1gySUuSDRnW
         KhjooY1BXTbxKsc2U7OKjXGvpb3oTkPdCkJ8JwhN1CJCTCn3eDDP6P7tBmPpKPaUKdxz
         LWkFNyBxpuCT6w5i7QQxQBxuD74obmTKjekinxfe5gHfP5xsvdu3ncX302OFGRB7X9xe
         IhOwETkKItOo8RFeRy77h4kQjtFMCklL7r7EtlhMWxZuhDmlN65X33dxeZ6vmdNc6rPT
         xK5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wR/eoNNXBj1/My2CpHa5GPCtjCjqHRpXOZvwkOgYW9w=;
        b=y8MQqw1co04WSpItWuZGguCqMt+ElEhXSWY2bwytbclwN8/CgxtH/y1CY9+UF2ay1m
         Lj5cS5KfQ05MjvYqZcZzDb9w4cZHQSP5BYRvxFWIMzJRorQFk1mBK/BJy3WJ4qjSkDYu
         UNhgBPnfJMbFmY4IGAl6fpkEmpIX27TSzXmTQ5xUaSU+oG2jbvflCO0rXa4gZM/Z++nB
         aUNQbi+T7sclOiItU+GtMf6iCB3LeVuCGzUqQ9KN76tU3mu/tbi2XvD8E8to5Jkom1mF
         z/sUxbc6+d2O5bQDVRDYNJTAxz+6OfFWXj9cKib/XzkBr05XqbipogOn8rhcT43QW2s8
         hdtA==
X-Gm-Message-State: AOAM530VToWDcN9GlBHX2tAtTyoVqKkH7DqDm7E6U9RDkiSiaGKk6SXK
	ZS8v7ZlJqAYVR6ws9K+OkFQgijfdW+4nbDsvFQY=
X-Google-Smtp-Source: ABdhPJy4YvYnuTW9nQ3arrHphuxc2EfNmJj4uEoJL2y6biBbvt5LPVxOadtYIjKArwwfIlgX/RiklDzSSXL8j5CHjGs=
X-Received: by 2002:a9d:5a06:0:b0:5af:b5fd:5b72 with SMTP id
 v6-20020a9d5a06000000b005afb5fd5b72mr2906065oth.200.1645806220062; Fri, 25
 Feb 2022 08:23:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220224224316.149704-1-colin.i.king@gmail.com>
In-Reply-To: <20220224224316.149704-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 25 Feb 2022 11:23:28 -0500
Message-ID: <CADnq5_Ot37zJGv8+JPNHd5OfPy94Ek2xXnNQxbCbzUPXDofwzw@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: Fix missing assignment to variable r
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	xinhui pan <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>, llvm@lists.linux.dev, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Already fixed.  Thanks for the patch.

Alex

On Thu, Feb 24, 2022 at 5:43 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> Currently the call to function amdgpu_benchmark_move should be
> assigning the return value to variable r as this is checked in
> the next statement, however, this assignment is missing. Fix
> this by adding in the missing assignment.
>
> Addresses clang scan warning:
> drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:168:7: warning:
> variable 'r' is uninitialized when used here [-Wuninitialized]
>
> Fixes: 9645c9c9fb15 ("drm/amdgpu: plumb error handling though amdgpu_benchmark()")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> index 3136a9ad2d54..bb293a5c6fd5 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c
> @@ -163,7 +163,7 @@ int amdgpu_benchmark(struct amdgpu_device *adev, int test_number)
>                          "benchmark test: %d (simple test, VRAM to VRAM)\n",
>                          test_number);
>                 /* simple test, VRAM to VRAM */
> -               amdgpu_benchmark_move(adev, 1024*1024, AMDGPU_GEM_DOMAIN_VRAM,
> +               r = amdgpu_benchmark_move(adev, 1024*1024, AMDGPU_GEM_DOMAIN_VRAM,
>                                       AMDGPU_GEM_DOMAIN_VRAM);
>                 if (r)
>                         goto done;
> --
> 2.34.1
>
