Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69E93EC827
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775161; cv=none; b=V43naEwH5C8J28R4W415a/A6/8qByQENAim5NYmyfjnMmagjVScke7tiVKQnBBR9V/l4HAArfxl/3bHCT1xP0GbvSrcbnkc6ZS43+qVTNHzxEr6knmUCaENsG2mE5P64iD3EoEFjuSPHMIOjsPa3kNUaHwYJbNSG3jqSNayj2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775161; c=relaxed/simple;
	bh=pHXw0MikKlSjhAl5g1YIS1edZ6sL8rQqfb+BPcqQ2lc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=m+OdjslXLcKxdZ4m81yjfJv1OZukGdsqbSQTAaXgdYdJGo0xQVEv7s7gGuXDBzbC+nsFJKULgS2XBk83LE3g3hbsLAz2ZMMjxAboPxjoSqazgZ3jpgqyXT+9xZVQTNqmIKVmQQORvSr+SJhLCbYgXxgMjii3Ti55OJSCi6T3vlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VBRYgPQk; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VBRYgPQk"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ecca9f3fso4114584e87.2
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790775146; x=1791379946; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=00vEEH7L1j3RTeCAPOrHPZHBxJBgpO2ITSxaC+oPgZQ=;
        b=VBRYgPQkyYGucVR7YPqWNB1QIgujypESFSykNvzuccrkSmzrvSApH+eFIr5zoqpMrN
         F27GpNi0iwDLH2G3bALaN+D97PxI0lhV4ure3EOeCfoqCkhzweHhHFbhZ9wh9bAxJY3d
         CQfza36+kdKO10V8qH/ucRCtDs0zhqbFbCarQknTI6rQUxnS0MjwurscZk56BUShf24Y
         kiOBoO1quZybKBvWoH3k4xIDjek1WY8frsLqGMdlYDNGd/bKGyatU8cURQbHp6amdKKQ
         CSCnzMsbLuE9V1PpjSSEmrd8UArNHeQskS7GR4xnlPMgy0rBdNzVctdyDW2Q1LS5aCFW
         XJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775146; x=1791379946;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=00vEEH7L1j3RTeCAPOrHPZHBxJBgpO2ITSxaC+oPgZQ=;
        b=m3ARZjBwHyV1wkcoW30xTkj+wOG/9yZP0sy82yujzj2659HWY3CkccxPnPhiuLTzjE
         0dfWiPJzEKbXGO+5bmHLkXJ8o85mzYyQihtbg/etpPS+zSqzvOYjNg0NQhQ/lv3Q7u+9
         gDxTSHBcqLYEloAMvYgkE16u34FDHPitSNDJM+Exo1w5fJKStfxTnfhI6IV0/ElAGMG1
         Nz7LpaVu9NwufQj11r0JyYyUYbdrfyFn56HjdrCA4bSZtanNCGE1mEDPp/6DmSbdXPDu
         OxCmZptr/Em3l/r+0t9hYPtn/F2BkNM5jNejbaoFn0dilxBKh2b4Y48u+9MJGXibf/N+
         n6+g==
X-Forwarded-Encrypted: i=1; AKwUvBxBubun3FxreUy2jkod42XowIqA4emQDV6n1OPzzajwhjc7ApTJdcTCQVjIHwYgAOcALUzh@lists.linux.dev
X-Gm-Message-State: AFq9FYJIjKSz7TZ6jP+2VzfYEPgDYrnsUr9uB6HAIbOMi2quVoHq66S/
	1CG+VRijj8IQ2xnTS4N6a5WNXH2MRuI4ZdO7zhAAQ8ry1rGanxbTpopc/g4/za20c0k=
X-Gm-Gg: AYBFou1C3zkHGB43ZW3O+gZnufbuTTu3jfs+tQVUCTJQA2YK5yffXHXFlP1h9dVikhB
	NzZSZRlCV+mbLzwTcQtvTGjuXkgvg9tP3P8OiZMc0Ur/bX6fR5ICQCo3VK+KsOpOYXaWk45zeSB
	ELrynJLJm+apHjOI2up3iSHo5+5R0raUH7K97mVySCrnd6R/hoHUGnOksY1J2/bTkPzLQeaEbdM
	Y0+ok70R7YglbLrqu1ccdQ8XoNT2F17MS9pHptymFaaQrDy0kZHd3kjC+Uf9kcZF8ft1upsPmVI
	6yTVB7LaKRrKZglMzrN8w4Vpwok1IutYCVGPoYPweLAPyc4N04Cf81hsIU4OuROLTGngOFLQM6v
	2Hvl5qEgzuMBfmuY62Q9+xxZ3XzYMJrInjejh6bm3H0R0TM0EySrJQ6Q10ftGxGEBvsGzn/jbw6
	fYJzCB374O9K0tWKkJdQ4tc2U8tTBuy6o+18l67uosPPx55a37Vdjxjv7UaZI+icHQNzZMcD5tf
	LbfD/DBidX852Ha6pUAfOwlSUGPrtjXnNRP3n94Op240wUoq+QDrvGQPS2+zgBIv7WZSqamxzJ6
	WAdgHLk=
X-Received: by 2002:a05:6512:290b:b0:5b8:ea1d:ce0f with SMTP id 2adb3069b0e04-5ba40600866mr515249e87.67.1790775146114;
        Wed, 30 Sep 2026 06:32:26 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba3fbbc003sm357173e87.12.2026.09.30.06.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:32:25 -0700 (PDT)
Message-ID: <742d5bab-51cc-49f0-825a-f299a055bb1e@linaro.org>
Date: Wed, 30 Sep 2026 15:32:19 +0200
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
To: Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
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
 <20260928204059.GA515872-robh@kernel.org> <artyl8fD3zzng8Uh@houat>
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
In-Reply-To: <artyl8fD3zzng8Uh@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/26 10:39, Maxime Ripard wrote:
> Hi,
> 
>
<snip>

> 
> panel-mipi-dsi-spi is a generic panel that will load a firmware, and
> quite similar to this one. google,android-pipe and qcom,fastrpc don't
> attach to anything and will just open a tunnel to userspace, which is
> somewhat equivalent but more dramatic than what this driver is doing.
> simple-card or its variations will just instantiate a kernel driver from
> the DT and is used pretty much everywhere.
> 
> I reused the binding from panel-mipi-dsi-spi for this. It was reviewed
> by rob, and acked by a panel maintainer, and 4 years ago, so we're way
> past the "oh but we didn't know what we were doing back then" argument.
> 
> So, let's phrase this differently: what's different about the
> description than panel-mipi-dsi-spi, or any other binding already in
> tree?

The panel-mipi-dsi-spi still describes a class of H/W control interface,
not a pure software driver implementation type.

"panel-mipi-dsi-bpf" or "panel-mipi-dsi-rust" or "panel-mipi-dsi-cplusplus"
would be the same problem.

> 
> If it's the BPF part, BPF is not Linux-only, and there's hardware with
> direct BPF support these days, so it can be considered OS-agnostic and
> not an implementation detail.

If somehow panels used a standardized MIPI firmware we could define this
in DT, but here we're basically inventing our own type of firmware from
thin air.

Neil

> 
> Maxime

