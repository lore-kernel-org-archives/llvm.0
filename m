Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8B4EA395
	for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 19:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623218; cv=none; b=CtZHEb+6vR8uNxcgSbqpkhX7Oj6gpb1LEZ9nABcylKfQTXKmRIJ2u5TOIte1ZmBycP3vV1SunupAU1DqavDp6YgxLu/twIpBkqx+OETzQcoRSNQJ1gKFLjjQL7dMuYHvQ+9baA2/RwjG8ZPh5/E3/SwZTVwyLBEgyuYapGEzULY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623218; c=relaxed/simple;
	bh=+IdK2muCFRO0CVjwWieNJcwFsMXfEeJbRjc+FinzqwI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SpK4/XHz20sqWYEkbz8GiQ8cneVhwGCNSJze2PcUTj4RhBt/axXpSuk65nrzXvc3Nmm+gmHw/2qd6EwB4g/5ZxyF5ny0p+nWjPp0oMxFB2Ar/yYWXNSk7wrBXUhof48dNHjK64JA4gJDovyiog4LAxWCvcW67k23MAJp3/8YHmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q53CpqpA; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q53CpqpA"
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3a6aa1050so1133912137.3
        for <llvm@lists.linux.dev>; Mon, 28 Sep 2026 12:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790623215; x=1791228015; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3EOtyWnpj6H2JKh2l6IAWizW9Kgj+njv8aMgbCxIvr4=;
        b=Q53CpqpAzydBB0Z5e/EU3Im2rtU7XW74EyRNOo2Sp+BgfKlU3d96lVq0IY5fKvzeqy
         16Q/7Y2Q6/UVlHZtjrZq4X766Lhr6g3xqk0tTz2+y/CD+YS9TW+KqNSqZJM5qfGHjbsT
         6dABRFNuYwn4+kJYbmW79ojNF0VefHXcAyB7fRYZuuv7YMKz1KmP8y+hrz6ya2g7Sr2C
         +pI4xwB32Q/DuOYTfJOsFcj0yjL2yHbJto3VpA0H2S26tuhfWAOkpi0B2L2xhXY5LHl8
         RxgrpgRH2/xpStqD2zsPxqIuuXdS4w/kHWqRgXAyx7uQE1rsbwSiDlx28NXfKw4MH1vZ
         fq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623215; x=1791228015;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3EOtyWnpj6H2JKh2l6IAWizW9Kgj+njv8aMgbCxIvr4=;
        b=grq566w/x/hiEYchTT1nRZdMECWYNEty/wCcZHjeSb1UBAK9bCmWBVhyDPmdQMSlAX
         ym1jmpba6ltcswB3HszKzbhhTBvnPvWW6cg0P2/fctgjrV8mT37EZgcfv2EJeE2fMimv
         Bq8iJ6Xr56AARFmlCgEpI5h1G5uAYHA5vxO1X+e3Jw//iziDpC7HC41ZTvIqE28ptu/O
         pZLW4tVXG6rX7khyHa4u/JNqom48OzDc890CH5PtQKybDoVqYM2AVqGa+9GmHlSTHGvD
         QXdhQU//AwfzQ9GAPpKNorjU6gh/HaQjLdt530CYwikbTjaYojo7ForEXXlRflxdnwPq
         S3ZA==
X-Forwarded-Encrypted: i=1; AKwUvBy+9BrMsohVN6ZFrj6+SDrZSFUffWz3pbB3Usg3LCzIcqM5Sm3jjWmUfQgdT7tm+NfTgNYN@lists.linux.dev
X-Gm-Message-State: AFq9FYJqmS4Uy+yV3RHUHQH1tEQaid3yLnVoq7OXi+I5XLGbv3cZnbeu
	VThHojTwIl2p/TP1htdKxcn6q8Y56Ea8DwgwRYQmIZJoaj+Nor/3NKoLXg3oUTiOUZc=
X-Gm-Gg: AYBFou1bWH86fcaliGmGKlFv0bRDN1KxzmXD0rcBt1MqzES10h4ckbhbXgR9G50Xe6Z
	8k+KEXCH67HfdJjvcIHABVjhfi7FyzCHkG2O2krXHhelC9VGLUwIuWUkCV3ZcLXnKeLQWNoFjyx
	fYRNnwB2Ax6MmfdQrsJJpFSGt5DIuqbxwmHKjXG0kauK0A/aK3XwKunF1DoLmR+7VGYkwwCX6BJ
	Yx/mFb9B4RlQkc4xsWg4XLf/w5caExs5RRIDRYhA4qWlDlHOoMDM6PL9BnKbve1Ea1m6/TD7EmE
	na0X6f+17P+37DDZ9oZ3YulId0bVfS3SlpFa0aycIHT8KtJ/7R6MTDTRiJmaLMdpdyF7ph60lwz
	XnJoLgABMRjbY3yv47EeK9bzVh4AqmMWNf/t8RNFmNNlbgrFUCTdDR2eMXAER1NLAGvIsGcCzAG
	+TEEARjIehM2KOcjYZlheiXhEOu++OYmEqV0AmZwe++7ZVkq4xn+yJWgmMvHzP2utfDa8xhS/hL
	X3OCJWyuJa77NeeuIT9V8PkQ5/5Evv1Lql8qfeLL8a0TF80gQyJjGXpYBuhpDwHMwhxmKUxH+U0
	H1K05LAMPqGweeLXIQ==
X-Received: by 2002:a05:6102:3f8b:b0:7a6:bc69:5a32 with SMTP id ada2fe7eead31-7af1e6f3640mr5363208137.23.1790623214949;
        Mon, 28 Sep 2026 12:20:14 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889afc5c7csm8124301241.2.2026.09.28.12.20.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 12:20:14 -0700 (PDT)
Message-ID: <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org>
Date: Mon, 28 Sep 2026 21:20:12 +0200
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
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, Jessica Zhang
 <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>,
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
In-Reply-To: <arqhwHiVf00j94J7@beelink>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/28/26 19:24, Benjamin Tissoires wrote:
> On Sep 28 2026, Neil Armstrong wrote:
>> Hi,
>>
>> On 9/28/26 18:22, Maxime Ripard wrote:
>>> Hi,
>>>
>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>> difficult to support and require pretty much a panel driver for each
>>> panel produced. Most of them are pretty simple, and require an opaque
>>> initialization sequence that is usually poorly documented.
>>>
>>> This creates a tension between OEMs and distros because OEMs will
>>> typically get a new panel to react to a sourcing issue during
>>> production, and thus need some swift turnaround between getting their
>>> new panel and it being operational in the OS. Distributions on the other
>>> hand can take years to ship a kernel with that new panel driver.
>>>
>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>> driver that will rely on BPF programs to perform the panel
>>> initialization. That way, we can ship the programs separately from the
>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>> plan is to have a userspace component started by udev to identify and
>>> load the right BPF program for the panels found on the device.
>>
>> This is kind of late for serious applications except if we manage to
>> solve the bootloader to Linux display engine transition.
>>
>>>
>>> This driver is fully functional and works with both 5" and 7" Touch
>>> Display 2 panels for the RaspberryPi. However, it breaks away from the
>>> typical panel driver in multiple ways:
>>>
>>> - BPF programs can only be loaded by userspace. This leaves us with two
>>>     choices:
>>>
>>>     * We prevent the driver from loading until the script itself is
>>>       loaded. This has the side effect of preventing any other output to
>>>       be used until the initramfs is ran at the earliest, and possibly
>>>       ever if the loader isn't installed for example.
>>
>> This adds a dependency on user-space behavior and if somehow the
>> initramfs doesn't load for a reason we won't have a way to display
>> an error.
>>
>>>
>>>     * Or we probe the driver all the time, but only report it as connected
>>>       once a program has been registered. This is somewhat unconventional,
>>>       but allows the other outputs to be functional, *and* allows the user
>>>       to force the output if their panel doesn't require any
>>>       initialization or during debugging. I chose this solution.
>>
>> Both options are not really great...
>>
>>>
>>> - It's not a panel driver, but a bridge one, which is also pretty
>>>     unconventional. This is required because panel drivers don't have
>>>     access to a detect callback that is required for the above, but I also
>>>     think that the recent work from Luca blurs the line from panels and
>>>     bridges and we'll end up going that road anyway.
>>
>> On this point, DDIC _are_ bridges, but in the current panel API we blur the line between
>> the panel and the DDIC. So being a bridge is fine, but in a general way we lack
>> a proper way to describe the display/panel/monitor independently of the DDIC.
>>
>> At first glance it's a nice driver, but moving the timings into a blob moves something
>> into possible proprietary binaries with possible closed licence and distribution
>> restriction so it's a downgrade for the same of bringing up a panel faster.
> 
> Quick answer on this, because I had the very same questions regarding
> HID-BPF:
> - in BPF, you can require (and by default it does) that only GPL
> 	compatible BPF programs are loaded, closing the argument of "closed
> 	licence and distribution restriction"
> - also, a BPF program can be disassembled much easier than a binary
> 	blob, and I remember Alexei showing me an example where you get almost
> 	the source code from the BPF object in just one pass.

Right, it "solve" one of my question, but doesn't really solve the issue
of vendors providing "GPL" bpf programs with source available "somewhere".

Another big issue is the API, I don't want to keep the current API as-is,
we plan to support more advanced panel features and use try to use the
atomic states to support rate switching for example, and I'm not confident
it's a good idea since there's no "simple" and "forever valid" API
to initialize panels...

Neil

> 
> Cheers,
> Benjamin

