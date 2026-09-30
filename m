Received: from mail-oo2-f36.google.com (mail-oo2-f36.google.com [74.125.231.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DFF46D2B5
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 13:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776170; cv=none; b=PrRuFum7yhBGcs1pUS96IiXQFjNdahwCfNEcxmRoHe+UYnixKIp37I6SXPGhahh9C7mQ7qKOOnNHj1eREaqBPgwFfBoYZdpMd5DJHoUNHi7thbwnswxlfd01kXd0w8RF+A9Hh6eyfenyLe97oz+vT4zdCsBZUymsA50X9BzW5pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776170; c=relaxed/simple;
	bh=vns+8oesrCaNm7+0DgAsIp383/EmirBpC6z8L/AgF7M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=i9PbJG+eXb3Z/IIMlq9Ow4r4JMs/wAcPaikz5EUsDpwUdfh/Qg/o8wxSiR0mhjXGRu5oyhWg8WBiiH3zMKeG4u25hNcAr8vn865jORFk5iAVYo5XI4DjeUAaYPrg/OlxBk4kLFRftHREluDqYFsQFr0Z6vRnNXGcvvmgjVNLpFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjfURBlR; arc=none smtp.client-ip=74.125.231.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjfURBlR"
Received: by mail-oo2-f36.google.com with SMTP id 006d021491bc7-6d77aa5735aso2365378eaf.1
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790776157; x=1791380957; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9WE422/LqnhCl3fPXNYCzqJOoTlv5wcGeIDmvarusck=;
        b=fjfURBlR9E/iKxLfhuj+u9/P6l1PrHLb7mKLFRMdNtLFDalTQCxU+V+M4nP89lRIy0
         jNjjvizOX+5z62a5tvRJhZ5jhPtBlKmGlWcRwwF5PHUuJL02O0WUWe9P8Ahrt2rGXgpG
         Z453KnywLCly80Hy1CVViza/hFVh5TOlfbknz3YDzxWuZHt2hqIOlkDE8IejVRzuv0JZ
         chIUZ2axAh+tpcDxuA/WGZYFqUBuURlgLuP/2IziDsKYV2nVuNHZjEU3ZxcNMRUHjd7z
         w2STz0OOlkMEcCHK03MqvUV0sl0rqxcg7S5d+TNOzB+4yq7C/dAJ9S2yoklXrk9XKdmc
         GFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776157; x=1791380957;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9WE422/LqnhCl3fPXNYCzqJOoTlv5wcGeIDmvarusck=;
        b=xabfNBkJM+EQ5MwBss2FiyXUZ4nWThnDX+a7seE+edxaKZSNd4X4VS0jFgut0J24x3
         gs73vA15CIPuLDHn0lIp0C25NEIz3NJJou6HdBPMw7lwuzyNgFfsoSrsB4KR2d8ojQRm
         BaL8GI0zMKP5Xkt9/yTqlgik4Upv2IMpuGLta+jWSEiowk1RNiMdsqSF3mmYeKTslSps
         Gzu61vWjqM2rAst1UH5th0BihK9OpzAJniQ8MekvwaGCnKst13IZgwxzwR/BNDoJLck+
         HJfYCnIdrHP16bvTD7qDtCwddHY0TfMpFAetXMAhZCAjHFqO0MWH8bHqGZNEdBqVjNhB
         DSGw==
X-Forwarded-Encrypted: i=1; AKwUvBwH/8li9MDm7JpHtT0amN87lcNWfOXo4CW2JL7bLVQm7gNcotJpPdIpDSGqErPuKgJklfS1@lists.linux.dev
X-Gm-Message-State: AFuF++m62xxaHRpLfVfUx9Pjb92veUA9hb+7/1zDX9941l+p5kMLalO8
	4seLN5wgF6VfJfl/xeIwo+qJe+5WJrasp5Ik3jkYi2wveFnheE5Jm3W6drslNHTfYyI=
X-Gm-Gg: AYBFou0ecsV6cZnVNlrLLiLag70PZh0gHp4nrnWQXIvAVi9tmBwUBKtG1ZchHKceTR6
	+WQZrGp1peAOcqrzepBmOpLcKQADonINVEFI6sfc/mZLhgaLTK0X95EHS3TCNVEI/1a4455sMuw
	f6Mr01ZvOaOTvB7T5y5pZHrVfrEjSASC0qD5w4dVi6iyCmf0D7xsqTmIk6t1bNKCeGfAWHhgBwx
	XjJpfyo8e4cXn2ScTNz7U7QNRlG9GxkE1MItLPizk6HjaZ4ZxjBhU2JIznnydDOJ3WzzBid+Lw4
	0bMgWWiissbQzIKUJKfrhPMcZx4SDDf/q71gQm2/JD6+R3mC88x6gFlDsMVK45VD5LTMX4hiXP4
	OBbMWyyNFOyE2InDiihtZ5ks8apw9hzEspRoGWftze26EqX8LNIq+yrnzmmloKKzwlU7eNsNsaq
	HJ+6Q9/tjV5zS5jcyBl5NiGGZ2sHE8jeja/ZPG6fr5l2co21GOedamN7pctuR3dJaOewUi+Vyai
	6ls3LQ6u+pzuC+S/4VndEsmCicORSPWycQ6GcgS00vl8F6wwVrHC64kyo7gERT9DYC/NhddNxVk
	DAerXgU=
X-Received: by 2002:a05:6820:1c98:b0:6dc:e1c3:b2c1 with SMTP id 006d021491bc7-6dcf5b2761cmr1487919eaf.56.1790776156586;
        Wed, 30 Sep 2026 06:49:16 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6dd98ccc807sm52578eaf.15.2026.09.30.06.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:49:15 -0700 (PDT)
Message-ID: <27bc999f-ef3a-450d-a4ea-57ac45508705@linaro.org>
Date: Wed, 30 Sep 2026 15:49:12 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/6] drm/bridge: Add a BPF-based MIPI-DSI panel driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
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
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org> <artlIYhgbskRJXDQ@houat>
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
In-Reply-To: <artlIYhgbskRJXDQ@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/26 09:27, Maxime Ripard wrote:
> On Mon, Sep 28, 2026 at 09:20:12PM +0200, Neil Armstrong wrote:
>> On 9/28/26 19:24, Benjamin Tissoires wrote:
>>> On Sep 28 2026, Neil Armstrong wrote:
>>>> Hi,
>>>>
>>>> On 9/28/26 18:22, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>>>> difficult to support and require pretty much a panel driver for each
>>>>> panel produced. Most of them are pretty simple, and require an opaque
>>>>> initialization sequence that is usually poorly documented.
>>>>>
>>>>> This creates a tension between OEMs and distros because OEMs will
>>>>> typically get a new panel to react to a sourcing issue during
>>>>> production, and thus need some swift turnaround between getting their
>>>>> new panel and it being operational in the OS. Distributions on the other
>>>>> hand can take years to ship a kernel with that new panel driver.
>>>>>
>>>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>>>> driver that will rely on BPF programs to perform the panel
>>>>> initialization. That way, we can ship the programs separately from the
>>>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>>>> plan is to have a userspace component started by udev to identify and
>>>>> load the right BPF program for the panels found on the device.
>>>>
>>>> This is kind of late for serious applications except if we manage to
>>>> solve the bootloader to Linux display engine transition.
>>>>
>>>>>
>>>>> This driver is fully functional and works with both 5" and 7" Touch
>>>>> Display 2 panels for the RaspberryPi. However, it breaks away from the
>>>>> typical panel driver in multiple ways:
>>>>>
>>>>> - BPF programs can only be loaded by userspace. This leaves us with two
>>>>>      choices:
>>>>>
>>>>>      * We prevent the driver from loading until the script itself is
>>>>>        loaded. This has the side effect of preventing any other output to
>>>>>        be used until the initramfs is ran at the earliest, and possibly
>>>>>        ever if the loader isn't installed for example.
>>>>
>>>> This adds a dependency on user-space behavior and if somehow the
>>>> initramfs doesn't load for a reason we won't have a way to display
>>>> an error.
>>>>
>>>>>
>>>>>      * Or we probe the driver all the time, but only report it as connected
>>>>>        once a program has been registered. This is somewhat unconventional,
>>>>>        but allows the other outputs to be functional, *and* allows the user
>>>>>        to force the output if their panel doesn't require any
>>>>>        initialization or during debugging. I chose this solution.
>>>>
>>>> Both options are not really great...
>>>>
>>>>>
>>>>> - It's not a panel driver, but a bridge one, which is also pretty
>>>>>      unconventional. This is required because panel drivers don't have
>>>>>      access to a detect callback that is required for the above, but I also
>>>>>      think that the recent work from Luca blurs the line from panels and
>>>>>      bridges and we'll end up going that road anyway.
>>>>
>>>> On this point, DDIC _are_ bridges, but in the current panel API we blur the line between
>>>> the panel and the DDIC. So being a bridge is fine, but in a general way we lack
>>>> a proper way to describe the display/panel/monitor independently of the DDIC.
>>>>
>>>> At first glance it's a nice driver, but moving the timings into a blob moves something
>>>> into possible proprietary binaries with possible closed licence and distribution
>>>> restriction so it's a downgrade for the same of bringing up a panel faster.
>>>
>>> Quick answer on this, because I had the very same questions regarding
>>> HID-BPF:
>>> - in BPF, you can require (and by default it does) that only GPL
>>> 	compatible BPF programs are loaded, closing the argument of "closed
>>> 	licence and distribution restriction"
>>> - also, a BPF program can be disassembled much easier than a binary
>>> 	blob, and I remember Alexei showing me an example where you get almost
>>> 	the source code from the BPF object in just one pass.
>>
>> Right, it "solve" one of my question, but doesn't really solve the issue
>> of vendors providing "GPL" bpf programs with source available "somewhere".
> 
> Would you be ok if I was to make a tool to decompile a BPF program into its
> source file equivalent?

Not really, I don't see the point TBH.

> 
>> Another big issue is the API, I don't want to keep the current API as-is,
>> we plan to support more advanced panel features and use try to use the
>> atomic states to support rate switching for example, and I'm not confident
>> it's a good idea since there's no "simple" and "forever valid" API
>> to initialize panels...
> 
> So, a couple of things here. First, I really don't think we should
> extend the panel API, like at all. But let's discuss that at Plumbers, I
> don't think it's very relevant to this discussion anyway.

It is, and I'll expose why we need to get out of this deprecated API
as soon as possible, we are seriously keeping the ability to provide
support for advanced panel features which are implemented in vendor
kernels.

The API was ok when DSI was added and we didn't have generalized atomic
modesetting, why would you not want panels to embrace atomic ?

I don't understand, please elaborate.

> 
> Second, you don't have to use this driver, like, at all. For anything
> more complicated than what this driver can provide, I totally expect to
> still merge dedicated panel drivers if it makes sense. I also expect
> that this driver would be enough for 90% of our panel drivers and
> would allow us to support most of the cruft.
> 
> Finally, the BPF API is flexible. You can extend it later on and old
> programs would still work. The verifier would fail only if a program
> uses a new function in a kernel that doesn't support it. I was kind of
> expecting to put drm_display_mode in there at some point, if the state
> makes sense then why not.
> 
> Maxime

