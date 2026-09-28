Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE53DCD9C
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 19:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790622985; cv=none; b=LDpNwNJJIeovjJnGtThqdonuWS0N+WqltuIoPv6Ck3VFgKx8CRptbavKC2g1EJX7fVenpN/inIZsYvbX8tF2fWnqlhtnJ3dBQbu+r7PrN2+cdHIjXDQ/BnWSgPBNQ+W5VAzlbUf77Mg2InRBVNdCbIIKltT63qAahLcDTyIUGBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790622985; c=relaxed/simple;
	bh=8o86JjkAcKW1SQ3YiOijQtpyWtLRAZA8fJZvP/xH5d4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h26ME2ZYfdKshdiSauHuakqTxarBlXMJSIrmI+GgPTAcCvZLObVRwT/Gpb1TdUsQEJSy01SR2Iamv2G/yonn/puOGwIkGyp6nHLuaCI+4OZN+N6Catg0aImyCupJ3/ShYaU8O8zv10HikaH84lIDEEDTxICBvHvdNrnm9WsQXbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rLJ7hvF7; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rLJ7hvF7"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cca96ec1feso972882e0c.1
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790622983; x=1791227783; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQ/QxsaYA9sPy0Rq4QivZtNIQwREX4bWNN8dGL2Ve94=;
        b=rLJ7hvF7xepaRO7q9pNtpTDPrFyVlxKNO9+9aJ/4Mvr9MJXk84t4U6R+j5od+anenn
         qJpaNGTL3PFhswlcCaQ/lL0XKR7TTFzT0ysCBqYRbyoXPWnAzq7w0GA/8pPgExL2QtPY
         Z9Ir/6K42sgoukVIDoQ9QsxiVWNC69j3BCmapQ5d937eEXxB2Zfgvtco7azS5tT3rAxk
         Fb8KxVQcza8s/Sf2M6HuQkClDVd3ZGlAUZmxLzXo376lw7mBSJZVQooXvpHcOGyxONGe
         yA50mS0xUZy6xtCcDWXeNFw/Pj9R8yGsGGd74ivjVksgKTsLVl7c+pqjX+7MAddBSPTV
         b1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790622983; x=1791227783;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BQ/QxsaYA9sPy0Rq4QivZtNIQwREX4bWNN8dGL2Ve94=;
        b=NpUmWX4gqpgDAv8ZGtKVxcXv1rUBLr3aDKLefadF1RuryydKnZN65sPAGJaBPfdgWg
         L5o8V30YqAvWvIT1pDZn52ZP/CHBiWjYux9ufO2emRLQPAuSEwig23nthMNUYrQxPTl0
         j7PyrOwOo9M7FIORjvZ+Jtjtu+zp3nplV7FMLq8XYZaj2USOB9vpsgJ4ifJNoqFi14BC
         M1Hp6Gus5rh8rse+3oGodU15Fo1VEZv/gErkQQ7mkrLA+CDwv5FSG5QGZc0lZoZc+Rjm
         hCdGg3lOIGM0h03F5YIPCHi4CKQPlL9Fhk+RUevkWSopq5017QpB87Stp4bZW/+MvuP6
         maxg==
X-Forwarded-Encrypted: i=1; AKwUvBy8XouHJsXyrxrw+ioNczm+XyR6Ei4q5JZBgZG0Jceees/ENPW6G1jtrZVIIDa0uHkmA/aB@lists.linux.dev
X-Gm-Message-State: AFq9FYKV9XSOeeMh4nYxKmoCZoCUBEhXFj36azvKgDOuSq5w8L0NUJDn
	PN3EBCihQer9MdXbrkoKtBhGzbBg17jEpuYuVRCA3DlWNjMbQaM/liGfObr+LpPl09Y=
X-Gm-Gg: AYBFou0D0ztHSLtTDmfv06HwvuLbQSNERCyRziQjDjKzfWCSZi6RcfVt5xDJNk9igeW
	5e6ZLvDBkGckCol+Y8WMWrqiXvutQn8CIAYOeJ5EThheRy6sTiEc406/HH6/gbEbmOJU6LmKVbP
	wK2jiR+1ypg+KAvP/Sk3eA8agIwWujcbt92aggocxnwnUzVo374aDcHgpQPHNaTwJvE/2q9GynN
	dJXcXVAqHrp+LYpLnU9iecIl9ypqc+fC5ER9WsIPbz/58JGhYZq3uZvh5MitA1lJ5ljT/QPM637
	5AURk7Nj6YiybCdJWREI9rdH9T4COanU+7tQenrNNjH/MoT6XNwjz3UOzzlQoK9is7YwYLzvIt9
	6vHFH/e8AOuo6eIq/1KI8tLs0hcOVdU11uhg6rK7zr4I7J8ikN08TliisI3dKlw3JbDmQ/u4c3n
	lBl1JzVRhtwNz2iohyuqsx3/o7XyXDHOe/fqeTC437OGJV9Z+hAuxuJ+v7gwqvaALoV6LPPcLcf
	2laIi2FSCYJpxtN9caaNP9ilbc+D6fWrVUdUN97VfiSAB6y8SoashoaH2F36EsoPoBiDsOs/TU1
	v/YeTvs=
X-Received: by 2002:a05:6122:1313:b0:5c9:a60b:e5d5 with SMTP id 71dfb90a1353d-5cb0b67e6bbmr5760667e0c.15.1790622982793;
        Mon, 28 Sep 2026 12:16:22 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cde4f969b9sm10052205e0c.3.2026.09.28.12.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:16:22 -0700 (PDT)
Message-ID: <8fa0c826-9d4a-487c-b7db-5412118364d5@linaro.org>
Date: Mon, 28 Sep 2026 21:16:20 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/6] dt-bindings: display: Add panel-mipi-dsi-bpf generic
 panel binding
To: Maxime Ripard <mripard@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Albert Esteve
 <aesteve@redhat.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Benjamin Tissoires <bentiss@kernel.org>
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260928-drm-mipi-dsi-panel-ebpf-v1-1-5244926aace4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/26 18:22, Maxime Ripard wrote:
> Most MIPI-DSI panel drivers follow an identical pattern: acquire
> regulators and GPIOs, perform a reset pulse with specific timing,
> send a vendor-supplied sequence of DSI commands, then enable the
> display. The only truly panel-specific part is the init sequence
> and power-on/off timing.
> 
> The panel-mipi-dsi-bpf driver replaces per-panel kernel modules
> with a single generic driver whose panel-specific behavior is
> provided by BPF programs loaded from userspace at runtime,
> following the HID-BPF model. This enables new panel support
> without kernel patches.
> 
> Panel DT nodes use a two-entry compatible with the panel-specific
> string first and "panel-mipi-dsi-bpf" as fallback. The generic
> driver matches on the fallback, while the first compatible is used
> to identify which BPF program to load.
> 
> Six normalized optional regulator supplies cover ~95% of existing
> MIPI-DSI panels: vcc (IC core), iovcc (I/O interface), avdd/avee
> (positive/negative analog), and elvdd/elvss (OLED EL driver).
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>   .../bindings/display/panel/panel-mipi-dsi-bpf.yaml | 184 +++++++++++++++++++++
>   1 file changed, 184 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml
> new file mode 100644
> index 000000000000..9a20a21cf70e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/panel-mipi-dsi-bpf.yaml
> @@ -0,0 +1,184 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/panel-mipi-dsi-bpf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic MIPI-DSI panel with BPF init sequences
> +
> +maintainers:
> +  - Maxime Ripard <mripard@kernel.org>
> +
> +description: |
> +  A generic MIPI-DSI panel driver where the panel-specific power sequencing
> +  and DSI init commands are provided by BPF programs.
> +
> +  Panel DT nodes use a fallback compatible so the generic driver matches on
> +  "panel-mipi-dsi-bpf" while the first compatible identifies the specific
> +  panel for BPF program matching.
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - description: Panel-specific compatible string
> +      - const: panel-mipi-dsi-bpf

I don't see how this can be a valid hardware description, bfp is a software
implementation and has nothing to do in the bindings.

Neil
