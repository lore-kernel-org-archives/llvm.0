Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE061D698
	for <llvm@lists.linux.dev>; Thu,  5 Oct 2023 14:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrFEqSJN"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-327b7e08456so1070761f8f.2
        for <llvm@lists.linux.dev>; Thu, 05 Oct 2023 07:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696516323; x=1697121123; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7lZZZ4/1+PKPxfykJQx+K5x1JSysyKZLvsajzTAsxdk=;
        b=TrFEqSJNoB+wquUmG5hUbsskyb3CqHg+J8qUa99p0vRSVc7qYeo8J20MNvqvP6nSLr
         DI804rRXe/tVdnR1cfuhQ9d6DasxssI+1KJ5garTG9bxaLwj7eLVMRfz5tAPwrv0W4Cv
         B15L6C1hFxfepxPLSwHEdeTsUpfc7WxqcGN5B6g7iVKeCIbeAJR8YgFZGZc3dR4age3X
         fliMeq8FBgJqVNWFRAO7S84POrlmn+5qgNl0m3qfxGXPkBUikHrCh3rXOZ0+XQpHgxDP
         X42BDRSBxvBSwVFFCxUiDLGPZrZ6XUC19cKIhMNnow3BcWQjMtwchFjn3TwkWnFufIzP
         +hfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696516323; x=1697121123;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7lZZZ4/1+PKPxfykJQx+K5x1JSysyKZLvsajzTAsxdk=;
        b=DQhSknSX3bP5bt9mikqNqK/nsnC4nXchM/gNNcLRkQ43jmeU5zH2mTSzCXCk9W87fJ
         L9Lxx9bFFOplxl/E0rsazPgLk3C8uCoQsqCqqoseueEDfihGy7xJFsxT8BH404Y9YpBJ
         qp8dscttXbqYB2C/bXudzVBOomwHjkSZqvLzrotX79kaXihEygh9CGrFkgK8aPPayfim
         oJN1vJT3PKybnNwC1F8Ym5ov5i0HoNOdFVuTbNrxKqk3tX1r1dlzcpck+LamrwC8zU3T
         w+kbW0/urw6JAbezLRmK/2jfo+IvZZkmnd6njgTK4/RcFelE6eH3UDn1wGddMzoVcHvr
         j0PA==
X-Gm-Message-State: AOJu0Yw5b92fiZIIKFL6PZ5taEc1hvlivXyQN8GtQQqtp1/OX26n8tNY
	vICoN6tpOe7WUPMZUOSKThDIutrAGw4=
X-Google-Smtp-Source: AGHT+IGeNwFRiaR2N0eH2gDEphyHTycBq3NZEolG4ZYAdI003Zqp47OEBzOniXtW8LVUM2/Bd1MTnw==
X-Received: by 2002:a05:6000:1946:b0:327:e073:d604 with SMTP id e6-20020a056000194600b00327e073d604mr4536663wry.45.1696516322757;
        Thu, 05 Oct 2023 07:32:02 -0700 (PDT)
Received: from [10.254.108.106] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id b18-20020a5d4d92000000b00327cd5e5ac1sm1954639wru.1.2023.10.05.07.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 07:32:02 -0700 (PDT)
Message-ID: <ca2006f4-a038-460d-a9ca-d14dca8e4a8b@gmail.com>
Date: Thu, 5 Oct 2023 16:31:59 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: Annotate struct amdgpu_bo_list with
 __counted_by
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: llvm@lists.linux.dev,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Tom Rix <trix@redhat.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Luben Tuikov <luben.tuikov@amd.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, linux-hardening@vger.kernel.org
References: <20231003232952.work.158-kees@kernel.org>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20231003232952.work.158-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 04.10.23 um 01:29 schrieb Kees Cook:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
> array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct amdgpu_bo_list.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-hardening@vger.kernel.org
> Link: https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci [1]
> Signed-off-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c | 2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> index 6f5b641b631e..781e5c5ce04d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.c
> @@ -84,6 +84,7 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>   
>   	kref_init(&list->refcount);
>   
> +	list->num_entries = num_entries;
>   	array = list->entries;
>   
>   	for (i = 0; i < num_entries; ++i) {
> @@ -129,7 +130,6 @@ int amdgpu_bo_list_create(struct amdgpu_device *adev, struct drm_file *filp,
>   	}
>   
>   	list->first_userptr = first_userptr;
> -	list->num_entries = num_entries;
>   	sort(array, last_entry, sizeof(struct amdgpu_bo_list_entry),
>   	     amdgpu_bo_list_entry_cmp, NULL);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> index 6a703be45d04..555cd6d877c3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_bo_list.h
> @@ -56,7 +56,7 @@ struct amdgpu_bo_list {
>   	 */
>   	struct mutex bo_list_mutex;
>   
> -	struct amdgpu_bo_list_entry entries[];
> +	struct amdgpu_bo_list_entry entries[] __counted_by(num_entries);
>   };
>   
>   int amdgpu_bo_list_get(struct amdgpu_fpriv *fpriv, int id,

