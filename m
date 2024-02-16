Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329A7130AD5
	for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 18:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708108057; cv=none; b=esA2rwKZknaWTTDUOZvZkC3Z1E361nRvcJ+31xZ95ysc1v659ma8UVLKYK09tTdsa2t0qzH0m+eE6vByzkbtSNGsPaeN7v5Q5iSb+gNA5JFtmu76z0BLUcK6gWjtA8CGlN/GoWvm74F5rzKdnPru2bLzuEIsWRIxY++dpW7sMv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708108057; c=relaxed/simple;
	bh=UnShZ8EdBWD5I7RRNruBpEbtffINfrd97Kk9hac9+lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJL2+CEA3P851Uj8Znx2BLB/KL7wFaPTRd4Zwwl6sVn5h6bQlUjeEKbXz4ZGu+W15AccFi/QfWkci0sWJwBN619OhKCAHMHUJx6L95pqpesT4kb2a1odkKrJooSPSQznFk+vfnN8ZtUdVvlUDEgbomF9DSAuoZz0EVWiqCrhuRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b7G1oYpE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7G1oYpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708108054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3pAxnKiY0v6Unt1MeteP4zhCiQHYAe7S4qrGIbBvNAI=;
	b=b7G1oYpE/YgSTfOcsSCobBMlXADGINEKcigntHlhFWa1FXuf+ZasoN4B1Eo38x66uE3TvU
	lQnlr2l93l/31xJuqvH+ZUpvwJ3G/3sTUeiMbDeeuTWnW2LQK4Vhq80htFQS6lVecE84V5
	Yj8w2ev+7WCNJ447CjTFfb0G6EqS/nM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-4fRacCqYO-KaUWALy7UJHw-1; Fri, 16 Feb 2024 13:27:33 -0500
X-MC-Unique: 4fRacCqYO-KaUWALy7UJHw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-56261857d31so1295938a12.2
        for <llvm@lists.linux.dev>; Fri, 16 Feb 2024 10:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708108052; x=1708712852;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pAxnKiY0v6Unt1MeteP4zhCiQHYAe7S4qrGIbBvNAI=;
        b=f2h2sirM0Bj28kObq9NHGhDSGptH0qYWMSqsw+2ykMt9pKOIzoC1JMEBGahQ+94hSA
         MxNTXecD6wbp8VwmrhAwfsBrsnk3WeEd6Ifuo7wUAYQ72ceOGApvqL7ragCZwjwW9Wqc
         yz/oJS70QT8Z4gHbCZSU7DZQ0aJ2PPMozh/UW1qF1znY42awv8NF7KLew4Y3iJE+Z/WD
         ZBvxRnSE2U3uEm2nAlBKzXcN2rgb2VXieG7BxYV8G9q8rLdsxeXSa3E1ZxqRbvQkFYYT
         qAWhhD8yWq6Bnzwo2mgKViaNT+kKVMuZQx7Ob2mnrWjz0tp9YGGDC7ukjuDYuSp2BylQ
         cM/w==
X-Forwarded-Encrypted: i=1; AJvYcCUYcefnbpu9uJookac44OeIIp/BCPkZvmS3MAyG+EOnIiGlELORwBgUX5iazDvaYZuDQaD3EqH+yjL19gaR7kEVuy8kuQ==
X-Gm-Message-State: AOJu0YwimN08qpn5RtIOoKHoUJdx0Dludqz879iLnI/JNsBtyUzaaMhu
	ZqftxOVlD4fWA2UfgEPu2LxYbwxc3Po287kYsnoVV3Xcu1B2IzF4O559yRtYCMcZyHZWrgtRLpw
	isQeAo3hdWZi9WRopf5tmCgOzZtK42uuecpZ26SK17JzzXo0JS4I=
X-Received: by 2002:aa7:de0e:0:b0:564:7b9:8c18 with SMTP id h14-20020aa7de0e000000b0056407b98c18mr1164597edv.22.1708108052538;
        Fri, 16 Feb 2024 10:27:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc7HnCrb8Q59cHQe9Z/g3oIfkHjAxB+9md3uAcAJ23mrUVRozwXdVXewL5xF6l4JirE/riHw==
X-Received: by 2002:aa7:de0e:0:b0:564:7b9:8c18 with SMTP id h14-20020aa7de0e000000b0056407b98c18mr1164581edv.22.1708108052264;
        Fri, 16 Feb 2024 10:27:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id p27-20020a056402501b00b00562d908daf4sm224163eda.84.2024.02.16.10.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 10:27:31 -0800 (PST)
Message-ID: <9d9fcdeb-4d0c-4371-b871-ad1fb8055033@redhat.com>
Date: Fri, 16 Feb 2024 19:27:29 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nouveau: fix function cast warnings
To: Arnd Bergmann <arnd@kernel.org>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20240213095753.455062-1-arnd@kernel.org>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240213095753.455062-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/13/24 10:57, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-16 warns about casting between incompatible function types:
> 
> drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c:161:10: error: cast from 'void (*)(const struct firmware *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>    161 |         .fini = (void(*)(void *))release_firmware,
> 
> This one was done to use the generic shadow_fw_release() function as a
> callback for struct nvbios_source. Change it to use the same prototype
> as the other five instances, with a trivial helper function that actually
> calls release_firmware.
> 
> Fixes: 70c0f263cc2e ("drm/nouveau/bios: pull in basic vbios subdev, more to come later")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied to drm-misc-fixes, thanks!

> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> index 19188683c8fc..8c2bf1c16f2a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadow.c
> @@ -154,11 +154,17 @@ shadow_fw_init(struct nvkm_bios *bios, const char *name)
>   	return (void *)fw;
>   }
>   
> +static void
> +shadow_fw_release(void *fw)
> +{
> +	release_firmware(fw);
> +}
> +
>   static const struct nvbios_source
>   shadow_fw = {
>   	.name = "firmware",
>   	.init = shadow_fw_init,
> -	.fini = (void(*)(void *))release_firmware,
> +	.fini = shadow_fw_release,
>   	.read = shadow_fw_read,
>   	.rw = false,
>   };

