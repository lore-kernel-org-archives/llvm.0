Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14263EB10F;
	Tue,  9 Jun 2026 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781030999; cv=none; b=k2ErATC6f+34BNZMts5070yCsrhkfDUbCvBZrF+TSqB1KXjWpktyV8YSqUS+h8Tq3uQoC0vNtIiDwWSuxTGJI9unlgG88TdQjBTn/Y2PYH8J+zUm0kNNI4FO/U7u6mSwUbtslU8xSWH/idu+UVw4hga7TYSqF8GNF7nfVhFp5eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781030999; c=relaxed/simple;
	bh=1kWclfQWihZfP7ocpWrt7UTNPH3RmKdAvfJVJeuQA4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVeP9iMFAWFrW93sZHbjNPFYi/Ap54eEbt30sMO7sUaZhvIlzRZMjo+bq5Ce52oMcgIpk0MDjdCxZqS7E9OWft07pPCEncgp/F3Tm26J6u9NUWOEp6DzAMaFYcjOT3KaQN/JU10BFaSsOJRpdjgUYf9ijTUu7RhwrYH8AQkJ10A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Hk4APPUn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Hk4APPUn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EKsU8E40vMrvi4AKUKlpp9MCCO5Br5bIKwTrrkOzNuU=; b=Hk4APPUnwMhH3wyFgPGZevjlj6
	awlynywUxG+AiWwO3gsa91/2mQlke1toZ95vC3B7EDeIVOOqG9dvh0+ki4wU91IuicPIIEraEVwsq
	P9jh02I+Fv9BtLuypYRdb818XL3H/qIirUDDbumIjRtaTxYsAgW0N2WX/r4aCHwmgtDmT5vuKAnC6
	/0vlMTA5Y7NJnUcaIjTYfRLE9JY8GAS7mIgQ4kPKftiUQqZw4Mr/OqZ8UQ36EQhxM+XCllTZ5EkeP
	+fnViD3MeUV5Yk1V4u0zqI2yptpyKw4ZvPwnGOFy4xma0ykeMCEY7uwTvXTMLm9kiNFO9ihx5Na/A
	zdwWJFrQ==;
Received: from [189.7.87.67] (helo=[192.168.0.2])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1wX1W8-00F6ze-DV; Tue, 09 Jun 2026 20:49:40 +0200
Message-ID: <08b3c484-f198-45eb-adc7-a0e27f5b66f7@igalia.com>
Date: Tue, 9 Jun 2026 15:49:31 -0300
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/vc4: fix krealloc() memory leak
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Eric Anholt <eric@anholt.net>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <e1edeadb7c161580a5cd5c7e642dc1b28db8ee86.camel@perches.com>
 <20260606123817.37222-1-grandmaster@al2klimov.de>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260606123817.37222-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Alexander,

On 06/06/26 09:38, Alexander A. Klimov wrote:
> Don't just overwrite the original pointer passed to krealloc()
> with its return value without checking latter:
> 
>      MEM = krealloc(MEM, SZ, GFP);
> 
> If krealloc() returns NULL, that erases the pointer
> to the still allocated memory, hence leaks this memory.
> Instead, use a temporary variable, check it's not NULL
> and only then assign it to the original pointer:
> 
>      TMP = krealloc(MEM, SZ, GFP);
>      if (!TMP) return;
>      MEM = TMP;
> 
> While on it, use krealloc_array().
> 
> Fixes: 6d45c81d229d ("drm/vc4: Add support for branching in shader validation.")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Applied to drm/misc/kernel (drm-misc-fixes).

Best Regards,
- Maíra

> ---
>   v2: Declare the variable explicitly
>   v2: Instead of void *, use u32 *
>   v2: While on it, enhance variable name
>   v3: Use krealloc_array()
> 
>   [✓] scripts/checkpatch.pl --strict
>   [✓] allmodconfig compiled (i686, LLVM)
>   [✓] localyesconfig booted (IBM T43)
> 
>   Note to myself: use --in-reply-to=e1edeadb7c161580a5cd5c7e642dc1b28db8ee86.camel@perches.com
> 
>   drivers/gpu/drm/vc4/vc4_validate_shaders.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
> index d48cf76983c0..66502a6a4a8e 100644
> --- a/drivers/gpu/drm/vc4/vc4_validate_shaders.c
> +++ b/drivers/gpu/drm/vc4/vc4_validate_shaders.c
> @@ -290,15 +290,16 @@ static bool require_uniform_address_uniform(struct vc4_validated_shader_info *va
>   {
>   	uint32_t o = validated_shader->num_uniform_addr_offsets;
>   	uint32_t num_uniforms = validated_shader->uniforms_size / 4;
> +	u32 *offsets;
>   
> -	validated_shader->uniform_addr_offsets =
> -		krealloc(validated_shader->uniform_addr_offsets,
> -			 (o + 1) *
> -			 sizeof(*validated_shader->uniform_addr_offsets),
> -			 GFP_KERNEL);
> -	if (!validated_shader->uniform_addr_offsets)
> +	offsets = krealloc_array(validated_shader->uniform_addr_offsets,
> +				 o + 1,
> +				 sizeof(*validated_shader->uniform_addr_offsets),
> +				 GFP_KERNEL);
> +	if (!offsets)
>   		return false;
>   
> +	validated_shader->uniform_addr_offsets = offsets;
>   	validated_shader->uniform_addr_offsets[o] = num_uniforms;
>   	validated_shader->num_uniform_addr_offsets++;
>   

