Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2611C5F13
	for <llvm@lists.linux.dev>; Mon,  1 Jun 2026 03:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780284900; cv=none; b=nTvm4xBS9k6ThFRwOvGlNh0zcumw3QaLeMIPMKoF37aIFBnUmHbnmJJjHWqTsjj/vgwROfSoy6XJQB4BWBQfaZ3dGHkoBADk5DzdO+uj/gO2PBsupDzhlvLK73bAa0LS/S98flQ3sxoNsPTbJ4pRMfS4rJmeqMANjF9jqmQwW88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780284900; c=relaxed/simple;
	bh=sYquHSgTLJ+zkz9TJpT23a8cxr45ERtndHkW3VDxnfo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dCZ9NYf86pOcJaI9uRRGL5zTORwINCmRjWrixv20SWkHtwAlOCEdsaHbT+hoveGMyvi7OiLgEMHRvoeWM65XIlvkEan1X3eH9PJDXUX7xlV3eoY0qHak3TxZYd/tWjrjkvF5eBL3TC4PI9Ephnbc8CUP2MzC6Mqv+RELHM8A/xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf20.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay08.hostedemail.com (Postfix) with ESMTP id 91CF51405B1;
	Mon,  1 Jun 2026 03:34:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf20.hostedemail.com (Postfix) with ESMTPA id 90F7520026;
	Mon,  1 Jun 2026 03:34:46 +0000 (UTC)
Message-ID: <e1edeadb7c161580a5cd5c7e642dc1b28db8ee86.camel@perches.com>
Subject: Re: [PATCH v2] drm/vc4: fix krealloc() memory leak
From: Joe Perches <joe@perches.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Maxime Ripard <mripard@kernel.org>, Dave Stevenson	
 <dave.stevenson@raspberrypi.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal	
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>,  David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,  Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt	 <justinstitt@google.com>, Eric Anholt <eric@anholt.net>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:CLANG/LLVM BUILD
 SUPPORT:Keyword:\\b(?i:clang|llvm)\\b"	 <llvm@lists.linux.dev>
Date: Sun, 31 May 2026 20:34:45 -0700
In-Reply-To: <20260531195515.99623-1-grandmaster@al2klimov.de>
References: <2b602ec6-d563-4fa0-a0c5-89b97a46abf9@igalia.com>
	 <20260531195515.99623-1-grandmaster@al2klimov.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: s3tueba6mpemg6ptygsf1s7eqcx8ccbt
X-Rspamd-Server: rspamout08
X-Rspamd-Queue-Id: 90F7520026
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+Q2oULM8UsNYGRaxrwu/jXm/F4A1kFcbk=
X-HE-Tag: 1780284886-417576
X-HE-Meta: U2FsdGVkX1+/SbIWiZFZbo75VNQ5ZrzfRoYT4QcS/41G9MqPSn81oHjTJRtmbZYBgnWap3+XKdMPBkfdEnhwrU8y/flaiEgd5TVVEo901nE6czf2+DIpNf0TK2PW0IqBW8c0BNjwHZYYIlgD8OgbGgPGRYY2RwBouK4o621ab8EABCy1v+8U/4+tKcY9sKxqx1oVExF08OB/tDl68UeIqJqb0HgjxK3YHzzDMWMer0eGcDPBoDbddQQDFEnDizpn4ScdbShkMRdEn876DilZOJQsKMMV5zFeGHR8dgcWklK0kZgAkBYRTeyO6GBsnB2i

On Sun, 2026-05-31 at 21:55 +0200, Alexander A. Klimov wrote:
> Don't just overwrite the original pointer passed to krealloc()
> with its return value without checking latter:
[]
> diff --git a/drivers/gpu/drm/vc4/vc4_validate_shaders.c b/drivers/gpu/drm=
/vc4/vc4_validate_shaders.c
[]
> @@ -290,15 +290,16 @@ static bool require_uniform_address_uniform(struct =
vc4_validated_shader_info *va
>  {
>  	uint32_t o =3D validated_shader->num_uniform_addr_offsets;
>  	uint32_t num_uniforms =3D validated_shader->uniforms_size / 4;
> +	u32 *offsets;
> =20
> -	validated_shader->uniform_addr_offsets =3D
> -		krealloc(validated_shader->uniform_addr_offsets,
> -			 (o + 1) *
> -			 sizeof(*validated_shader->uniform_addr_offsets),
> -			 GFP_KERNEL);
> -	if (!validated_shader->uniform_addr_offsets)
> +	offsets =3D krealloc(validated_shader->uniform_addr_offsets,
> +			   (o + 1) *
> +			   sizeof(*validated_shader->uniform_addr_offsets),
> +			   GFP_KERNEL);

krealloc_array ?

> +	if (!offsets)
>  		return false;
> =20
> +	validated_shader->uniform_addr_offsets =3D offsets;
>  	validated_shader->uniform_addr_offsets[o] =3D num_uniforms;
>  	validated_shader->num_uniform_addr_offsets++;
