Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529538;
	b=zQg4g+79KnPr/G+cAhKU38tVNq+G6MX0jpw7JGtp0z57+tXi1gH7tYTi+0KmauQKeLe+
	 oPoe3pV/bM24Amod31QoEI1ny3htG/WEkDq9j0jSdOIy8I70Pqj2FXrok6OhI06GhThPG
	 RJsKLbiZWnHrVk3PkNJGasDlmCTwkcvR0BJ6xhjfZhNRKUtP0pvCG6JhgSB1BGTZU6tFR
	 y7SqxsMA+XKix+GgF9qdhHod83zlba079+iaDM3eS757f2SALC/v/lHYKhF4cR37aW+Br
	 Xd5Ls53L5qx4VcoZDoPSB2OBIDVpP7Ss9+K9EKwesLeUDKu3nbxeA7/npoxsDpVWH7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
	b=VJzcTGIC5AEUpz8eXo4e9ovaB02m9kw5XNv1wZoXj87L7cdX8LoW2Q+CI8sI2dEKaijI
	 9mMoYdHXs6pbNCV8dtvYHp0Kmrs9e1X7mhSWUqn9d7QCQvd8WVOXlu4j3l61O5P6DAPOb
	 puZaGCXH1QyzB8YI8eLx1RvWv43EQYYwD9zL1dJEDS3r93Q/iMIx8nGTvoR6+SEcyxxBt
	 p4KkxVSx795QG5FC+iE6KFELXJ+UcMwaExP/ZRHqBLPbqh83ePbRCDxwmutFjwS4Id5Jz
	 10fqkJQdl+mLVvld9JmazmeGxjFM8H9X8+SJido7bJ4K3TsLPJlx80/PsgLue5zoUdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eung7fSa;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77647606A321
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 14:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77647606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eung7fSa
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c506a231b88so628336066b.3
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 06:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529537; x=1796134337; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
        b=eung7fSa7TX7DfThSkMWR2ddmvn3H266kEfwC/5kFTW1y1gpkP77sJ1BVQVL9CsJZj
         rHavCYsEyuzqZEhuh4VikQUlyxGvxZBLaLXfUUa5iD6AOkHj+1arYOuiR3dA9R2LI2xE
         mMhcDoM3I4a7oPpIhwpFMYH26arUg2aNSlR03TLpjFRQPHHUiK5WByQgGKSv6sRhFaR9
         CCmOjjDGROi46v3wdsFypeZqZU7h+IsANKuA6NAg8VZNa2F5ZlKtedwOJuer5frhMLQ+
         Warl2rBKQTAPfnWz9qsRcS3E72ktgK5Wei+tL4tHqTWUdVD8bmMFDkr9YCYOWdUegacG
         GZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529537; x=1796134337;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a2jTjAttfP/k6A0fA1FgjeitHCs9Uab3ZxcInWTSuWk=;
        b=tKzetSSuk/j5/yOVa/86ilosMJ/LpujKpJopSK6dklKcSnX+w+9NH2Ajzzfe8+XJWu
         Eif5G1O3cqa4NRp+DdCMFZpKZ6wzHdLoEpx8pm4SnVASQNz9yRMvOUO/RmaSfyPX8yME
         R9iVN9oI1DVrj1t0CHcsdwNiVKt1W67QatZS1Z3MypYsyQ376Lya9juiVylVPYsgfyIU
         sFio+GScSMkWmX655nd2azXHiFaNgIKuKNHo1K58hrNyj0DptO7X7dhzvW2a2hwZsyL5
         w3i8HBD7q4TpG//TkVFmTi/TNfv7eOVLxNUNFW3MJHdpdqVCJ9+JtvNO3btqAtoYXwg5
         pdnw==
X-Forwarded-Encrypted: i=1; AL+hErHMQOEOUKf7sH2ZFv0WLaGUENfT3wTIB0XdrLoedYgh6WrSJQefCIudcqO1nh11RcN1C58g@lists.linux.dev
X-Gm-Message-State: APuU4Z+JHOntoLLUVhwFWOa0EEw3tMokTUdEF6iN4ZmEVSAHVZz7pKAL
	jrxr3ADRj7KIHYk5aW8w757Hvvu5HiRxCR9mcF6p6KlsxBuixCWziGAE
X-Gm-Gg: AZFdTZfU5hSDBDjed74WPtQb5ngrrM64hxg/PHGvJHUtNy5vmxTJN+YH8yFiICDj4tc
	gacW/MOe5BXrDzsyPUyCQR3L9jr+ODoKCa1nokRGgkJYetK0L/FJU5bbXMwSY2MbsGc92NttrfE
	hCB0y9O6CorKigzjKWDGZ8fpBFcNvOKZT7jFKzQrTMW3TbGW6tN+eiQaQRGMRI3fZgEdYwtdb+U
	PVxR/5E9t9ZP4KQ2WBt8bY/yj2jqsVqgL56qtWB+JP4B6nzrplbruvRug9hKnqZEGzh9KoQT3th
	YLMnO2ibQEzLJ+rGwjqYZK/wUsOMEDVZiwD141a8pAf8XYeVui7YMAMpkGqKSO7E4giPifij3cx
	T2+UdBL8+K3py1IeHn06k6N/9APgMI+ClwgMBteQnzPNsT7bpVMRoXzE8ypbQKwy9i9Pz2v1y2A
	Bpn6Jo5hjhvu7zN/r/uWVMThUZxgHwgiqmk4mXREokgYeXdxlxojm+r4NJkdcXiUymkEgsBeLJX
	eQgKaaycxb7pUgAoRBeF9YRk6EDnICe38CbXsx7jf23sBafd5ghfqBYTlq21mzJlJVQPbiYBw1Y
	hR9QHNKe3RO1TstanTuaO4Nh33kqtVk=
X-Received: by 2002:a17:906:26cd:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c513a5db1d6mr934692166b.10.1795529536866;
        Tue, 24 Nov 2026 06:12:16 -0800 (PST)
Received: from ArchOarora ([95.179.249.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8db37sm520054266b.35.2026.11.24.06.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:12:16 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>,
	Harry Wentland <harry.wentland@amd.com>,
	Lucas De Marchi <demarchi@kernel.org>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Kory Maincent <kory.maincent@bootlin.com>,
	sebastian.wick@redhat.com,
	victoria@system76.com,
	thomas.petazzoni@bootlin.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v6 10/43] drm/drm_atomic_state_helper: Properly load default value for rotation
Date: Tue, 24 Nov 2026 15:11:59 +0100
Message-ID: <awWbIh471dkjKGII@Oarora>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120-vkms-all-config-v6-10-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com> <20261120-vkms-all-config-v6-10-78ace90f4fc1@bootlin.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 20, 2026 at 06:58:52PM +0100, Louis Chauvet wrote:
> Currently, the default rotation is always DRM_MODE_ROTATE_0 for all planes.
> Some planes may have a rotation property, and the property may specify a
> different default value and supported values.
> 
> This is not an issue for "fixed" configurations, but with the introduction
> of VKMS configuration, some plane may only support 90° and 180°
> rotations, so the reset state of the plane was wrong (forced to 0°).
> 
> Fixes: ab2dd990f4ab ("drm: Add __drm_atomic_helper_crtc_state_reset() & co.")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> index 267f44330629..13e848abb33c 100644
> --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> @@ -32,6 +32,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_mode_object.h>
>  #include <drm/drm_plane.h>
>  #include <drm/drm_print.h>
>  #include <drm/drm_vblank.h>
> @@ -231,6 +232,11 @@ void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
>  
>  	plane_state->plane = plane;
>  	plane_state->rotation = DRM_MODE_ROTATE_0;
> +	if (plane->rotation_property &&
> +	    !drm_object_property_get_default_value(&plane->base,
> +						   plane->rotation_property,
> +						   &val))
> +		plane_state->rotation = val;
>  
>  	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
>  
> 
> -- 
> 2.56.0
> 

Reviewed-by: Oarora Etimis <oaroraetimis@gmail.com>
