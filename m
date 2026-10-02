Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACE7412C0F
	for <llvm@lists.linux.dev>; Fri,  2 Oct 2026 07:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790926216; cv=none; b=a1dsd+TTGfyWrtVqaBpPhhHcc0IKEnTXIP9GEJBxqkQ1yve1Eim+FAI2ud2FECFNHzYzrpr2HqAuw1R4R7SVB5se7QY2YP2Bj4dDL9/jjkR3YxwFHw/0znb5uhO1afxErTcvdGsZkXBhxe7Rs/RUNOs40FA6QuxVL3hboDrHOlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790926216; c=relaxed/simple;
	bh=wMMtCDXpiqei1jhiGiPdThCggE5+d/NY6xuXJoVy9Pk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hCbldK8TZh0nIHMPbj6vLYuoc3Wdj4yYFEL+1GR3B2uYzO3fVepT07ryMdHDoLwjqghAWKx4wor0sUbxZo0bcvxznYspJV+ELVW6hsI1MM6ZKwLy5GKkiyQkZ58tX7w8jQJpP43V2LBKYwsgT2X0bruM2Dx9D84oXFk0qIjr2tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hw4/RHO3; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hw4/RHO3"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so55538595e9.2
        for <llvm@lists.linux.dev>; Fri, 02 Oct 2026 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790926212; x=1791531012; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pk49vmsIM+yCxOu67mrioHkagQNao6fvAH0GFEMFZCU=;
        b=Hw4/RHO3drfWtMwOjcNgOIFZ8AKZRSsi1g46sVkttSJ6MRcBASvd2tSk0wy4cBsWj0
         B8WOerPpwWW4yInBbdnnSZUlbqnFdGn5b3MRj+Z5P7mPzxQ9j+oBXHU7+9cCuvpM6jWA
         4hvAC46hEcTwm0yzL5V0bCYKM0p6G0cps35TEmVt9h0UYZdH6hTdiCmhthTsMesdXOo4
         OM9Ea2vaCcbyH/oRLMYob85NFkqtmMHdSHRYnu1ArVTC9Y3wM+2wKRzb5Am2FcWKjnYo
         mIA57gBSUyP1GnmwrAen0J+ey6uC5uSiMEUnLiuSaiHkxnXSHINQW8oz9oSalMzIUtSi
         T/8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790926212; x=1791531012;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pk49vmsIM+yCxOu67mrioHkagQNao6fvAH0GFEMFZCU=;
        b=1mW2iMsKhu/WuRpWG6AkccoRX8jou5v7XeFeOPiJarf3WxRxcxqnzdgeT0ljGaTxNX
         kgNJb+l0IHDZZcAh/4jeWizSY95R9X2CI1uZBArsdDckPy28PzQfhRaTkE06exeTId6l
         FGDKbF1IqJQqJF5ZIZkbEdb7CLZ/VHW6K4g7WKCAl3vmgp0OIXnc6BrJpOksOgmk5pf2
         IKYM+x/vfYyaTkIAAjiAOSsS0B+vEyJOWX3ULnNfum11+/431JnNQ0TGJXoMQ4S36UJE
         LY5qJj5iZWIRNi4VmZt1DjRzzcTLctKQxR68dacAkDrYoeI6puJkmY0aF/mUFgqtTOCW
         7OvQ==
X-Forwarded-Encrypted: i=1; AKwUvByUBcmaOigoa+RnQWLXwaaQuF/rba9s1FfapbbTYDtX1lvQMB7r6kFP6ee3spJwOFyYFy82@lists.linux.dev
X-Gm-Message-State: AFuF++k88BZ1TmKyEjrYi2FPK92mpAaeEhZETLepK/MiBg1BL+chrDO/
	hBp7YDIPFxtmxXMwgYI4wOFChEqDBg2ZVZixODcDsDte4gHWyuoqiiBVH/shipM2cJQ=
X-Gm-Gg: AYBFou1TgdDdHLmjdOf3y7cGHKIcCOUuE3vUFqsSKO+fgAQkxbsdrmQUouEZuDmo7IE
	hMlDsD3kZltUrND5Mn7XA1DPgi6WWWpSJLqLQkzyWkX7OcTpQFv+J+/zTI24Yg7O9l24on999O+
	+CEhArDfLntTtcIs5J/qLKPvILIUbiqIG6g5qPVUnA/KPmv1ne4kA2XbXoJafleACMni+WnqWsU
	2T/FFN/PgzgpEjKpcVE3QpyUzSdKeKSqRi2rboe/6/h/RCLaYQ46xhRErtLkNNDMh+tkRsFZdV9
	4O+i2hXMzpJd9AOq3NJUObkTn7ybzyNn0EISEHjF5kqq846OuNe33Im9dn0dteJE/cmHwq+1glN
	QY2+A2Lb45fMebnLp8MROxj04y1Qnrq4MVY8pgjAf/yutnHFE93EvxDqRQCKLeuux6ZlRuk5EeW
	tocqejm2bzzxe8srNzm4pEo6o8KQqErArgQz8H1hcoLnPBPvdScObKJ1YaoBYUyunSh+wpr9w5m
	o+9ftslR5rSCRVr6eXU96RoZK5c0VUEKcAp0MhnBwVj0FkxrS1P
X-Received: by 2002:a05:600c:1911:b0:49c:ffab:551f with SMTP id 5b1f17b1804b1-4a0275657a1mr32220045e9.22.1790926211263;
        Fri, 02 Oct 2026 00:30:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:2f62:6d3:721b:8c9e? ([2a01:e0a:106d:1080:2f62:6d3:721b:8c9e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm3611058f8f.31.2026.10.02.00.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 00:30:10 -0700 (PDT)
Message-ID: <2bd17843-4a65-49b0-9e10-7b73afb206b6@linaro.org>
Date: Fri, 2 Oct 2026 09:30:09 +0200
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
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
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, llvm@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20260928-drm-mipi-dsi-panel-ebpf-v1-0-5244926aace4@kernel.org>
 <6b80cb97-6706-412a-b013-9423f6f75153@linaro.org> <arqhwHiVf00j94J7@beelink>
 <0259fe4b-3118-4ab0-9b62-55101bfd7f33@linaro.org> <arrAqg5n87INTHE6@beelink>
 <674314b4-6b80-4b3a-ac15-eefd31cea607@linaro.org> <artpBMeM13Dd0lLy@houat>
 <xlv1wls4ebjq.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
 <828c9108-2db1-45a6-9301-19159a094301@linaro.org> <ar4CRTMQGs5_nGKY@houat>
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
In-Reply-To: <ar4CRTMQGs5_nGKY@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/1/26 08:50, Maxime Ripard wrote:
> On Wed, Sep 30, 2026 at 03:37:58PM +0200, Neil Armstrong wrote:
>> On 9/29/26 09:55, Javier Martinez Canillas wrote:
>>> Maxime Ripard <mripard@kernel.org> writes:
>>>
>>>> On Mon, Sep 28, 2026 at 10:36:18PM +0200, Neil Armstrong wrote:
>>>>> On 9/28/26 21:48, Benjamin Tissoires wrote:
>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>> On 9/28/26 19:24, Benjamin Tissoires wrote:
>>>>>>>> On Sep 28 2026, Neil Armstrong wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> On 9/28/26 18:22, Maxime Ripard wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> Panels in general, and MIPI-DSI panels in particular, are pretty
>>>>>>>>>> difficult to support and require pretty much a panel driver for each
>>>>>>>>>> panel produced. Most of them are pretty simple, and require an opaque
>>>>>>>>>> initialization sequence that is usually poorly documented.
>>>>>>>>>>
>>>>>>>>>> This creates a tension between OEMs and distros because OEMs will
>>>>>>>>>> typically get a new panel to react to a sourcing issue during
>>>>>>>>>> production, and thus need some swift turnaround between getting their
>>>>>>>>>> new panel and it being operational in the OS. Distributions on the other
>>>>>>>>>> hand can take years to ship a kernel with that new panel driver.
>>>>>>>>>>
>>>>>>>>>> To solve this, I followed the example of HID-BPF and wrote a panel
>>>>>>>>>> driver that will rely on BPF programs to perform the panel
>>>>>>>>>> initialization. That way, we can ship the programs separately from the
>>>>>>>>>> kernel, and with a different lifecycle. If this driver is accepted, the
>>>>>>>>>> plan is to have a userspace component started by udev to identify and
>>>>>>>>>> load the right BPF program for the panels found on the device.
>>>>>>>>>
>>>>>>>>> This is kind of late for serious applications except if we manage to
>>>>>>>>> solve the bootloader to Linux display engine transition.
>>>>>>>>>
>>>
>>> Besides what Maxime already mentioned (that most general purpose Linux distributions
>>> built the drivers as modules anyways), it doesn't have to be mutually exclusive.
>>>
>>> A simple panel could be supported using this BPF-based driver and then a panel driver
>>> added to the kernel, if is found that some applications need to have it built-in and
>>> earlier in the boot path.
>>>
>>> I don't see why this would be any different than HDI-BPF or other BPF-based infra,
>>> such as sched_ext.
>>
>> I don't want to add a supplementary maintenance burden for the sake of using a cool
>> technology which has serious drawbacks and dependencies on user-space even if looks
>> really cool.
> 
> Spoiler alert: v2 won't. I've got the in-kernel loader to work and thus
> you can have a built-in panel driver that works without user-space
> intervention. So this is not a topic of discussion anymore.

It will still have users-space dependency, meaning the BPF files will need to
exist in the fs when drivers probes.

Neil

> 
> Maxime
> 
> 
> will work

