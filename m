Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8904FD7AF
	for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 14:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776940; cv=none; b=G7D6sR65QqitrDiEqSs30fICgRa8zZZ7GLXSPLofOeKa0ZSBk5j+by8Mg0qZCZooh172tR74R9Zn2MFKxMT5TwlaRu1CG62wWbohWSHet8dNpSG7cL5eyUfsarbmg63p7jh7Hj4odzL4wCdxcb4zJWvF9xiJISedVG6ji3zgOYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776940; c=relaxed/simple;
	bh=1F1V/rD1y614TqPYCfWDNkmVlHzqqdQCMZ9Th+5moL0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=lcyiZSmiWwV/ZFFxr44finBHJ3LSKHqjB9NTeqB3K2YaLq6Y6cOU8bhCptxqqwM5vL/yYAbaSp8CnEhyCFYgTVmBD4XvDV1+epBfGGYRr1lLONHYI+iBOLsO/dGrWVZSFSNhE+oM7pljKHor8m6GMlppUfktMnnDOH/OYUllOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvnXBX1v; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvnXBX1v"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d882so6090970d50.0
        for <llvm@lists.linux.dev>; Wed, 30 Sep 2026 07:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790776921; x=1791381721; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qs9QTXyZYNRiUfQ+wZvKCopWk12AffrP+uIc+6uA/NY=;
        b=yvnXBX1v84pLHehg8NObsCCN0UuXYB8hNZLSlkKv6Vsk2QBrTkjTQh1pVYkdEmRj73
         JWd/Go6tZAtRq2yM0jhY1aXEIRp8T0LLKlJpXRFeIBgpSL5fGG7mkf4pT/FmP0f75uOc
         TWkL0VBSIasnwvhK2ZJE7tpOu1qr0MeX8edM1JwhuTYg0LmRIe1rdfu9WDjfX7GqCUv+
         YuxQGkfBLOcxyNLpmhdG53PzLwtuZYT1MA4I1O+Fvzl8dN1I+gmXuLuFXBflIV+r7iVJ
         a1l+PLxPvbuzLOZk6KDCi1tp8/CBTgAqc4j27YPgDko6TFACr9obzjXzKUd8he2uvF9L
         Ui6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776921; x=1791381721;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qs9QTXyZYNRiUfQ+wZvKCopWk12AffrP+uIc+6uA/NY=;
        b=09lfp5ewEEDFnyLaBLWRTW/r5lx17OBPITT18yvYo8EVWR/k23QKKdM9FAmeSJl/sj
         VTloMaer5HOGMftMwNPyFtI1BUDaYn/pTSFDXYq8w2JnXTuAdgeI/N27UvlJdHlZNzby
         MQHPLr9sGUouBElYRFwsSlrvARg6LwlioIZIETFsi6ckmczYymZbqfAVyasvRe9Qdngk
         VQbuKBxR5KI0VSGlvUszXsCkxmUgaeRJpS9gkerA07fyhhqqJUvJe5czXtpQNRlySgWm
         yIEL3jIB1bpy8fbjuqU0TbAGKbdCY4+wKcSy7TPYiPsW1jdT3//5h54Dp1h1Tuv8U9GF
         owgg==
X-Forwarded-Encrypted: i=1; AKwUvByAAqnPjNzpHhofhwwnv+8Is52uA7BwPLryOA0mdPEzZOqaSi4udn00hO0Wq7O1gC5zRWLs@lists.linux.dev
X-Gm-Message-State: AFq9FYIzAi3YVaJoYgBBZU/+SsMC60uF41hF8V2BWN/m64bGWVwvY5Ll
	cZO544enC8OpEL9O2Htp+0JYhwqBeO21jhFRwQW2XtKSFhEiLT3LlGBLBh+Tu/yNjkQ=
X-Gm-Gg: AYBFou3rVtooVeU1BKG5S5Zg7/1+Dl8JHA6xaikZW9UwxK8v5UWe2UZHEM2sTZpt24H
	4NjX2dvcLqhBIZR0MOudhNugEdpVulGdKKN2sQshQCC4kVdmBUV0L23T4orPWSO9BDM5JFjwmnB
	e1/x+F+nW4UuVkP5jO2eAe33ry2cLNZAznGB/wifgLfNZUAuZTqaNlhYTHEwcMUBhWRaLRT6xPg
	ZwRKe1oDHxGlhn5Mg8hcAoUbe8XfJDvQz59uM1JvhYYcYhwKhb59p0PO1elnpEP3DIHsHTLKaXD
	2IsIOO++V+G1rW5ZWuaCHBcKYCTaMiYpBVp77RXwkHJldzReb+QPfTYZlpxxAZLTrQ6enpb9XpY
	Ta2F+nOLyYdoOhpddF0LgddzAT2QFo5xT2aVUsLZwhuwKM5WBca6vsKE4msGbelj/pf6mDHPbk0
	tsRV/0fUTJ9WmcHnKEGVZKQ2IKCzp+qjhH7YaEUd2YprkmErASQ5nwwUrCbph+/kSFktlvAZ9yB
	57qI/PU2gRV+uw+rfrJOFbezysfOK/AnH+3SPW83I9ycVMzBsx64zJ/VwQhzfMsbMaNbE9Fh6Dq
	tHGFHn/VjS8akw90hw==
X-Received: by 2002:a05:690e:484d:b0:66f:c238:7657 with SMTP id 956f58d0204a3-67683530372mr445880d50.76.1790776917625;
        Wed, 30 Sep 2026 07:01:57 -0700 (PDT)
Received: from [10.21.51.184] (ipagstaticip-88fc351e-cb28-db3e-3f52-ad13c70f08da.sdsl.bell.ca. [142.127.77.63])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67680ac3521sm764290d50.1.2026.09.30.07.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:01:56 -0700 (PDT)
Message-ID: <6c581ae0-2480-47a2-b46e-97afadbc7c1f@linaro.org>
Date: Wed, 30 Sep 2026 16:01:52 +0200
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
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
 <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
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
In-Reply-To: <054ef52478fc93fc213a9dae23ea77f73094aaf2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/26 11:03, Jani Nikula wrote:
> On Mon, 28 Sep 2026, Maxime Ripard <mripard@kernel.org> wrote:
>> Panels in general, and MIPI-DSI panels in particular, are pretty
>> difficult to support and require pretty much a panel driver for each
>> panel produced. Most of them are pretty simple, and require an opaque
>> initialization sequence that is usually poorly documented.
>>
>> This creates a tension between OEMs and distros because OEMs will
>> typically get a new panel to react to a sourcing issue during
>> production, and thus need some swift turnaround between getting their
>> new panel and it being operational in the OS. Distributions on the other
>> hand can take years to ship a kernel with that new panel driver.
>>
>> To solve this, I followed the example of HID-BPF and wrote a panel
>> driver that will rely on BPF programs to perform the panel
>> initialization. That way, we can ship the programs separately from the
>> kernel, and with a different lifecycle. If this driver is accepted, the
>> plan is to have a userspace component started by udev to identify and
>> load the right BPF program for the panels found on the device.
> 
> I'd think for most panels it would suffice to have a declarative
> language describing what to do at what points in time. For example, at
> poweron, enable this GPIO, wait a little, write this set of DSI
> commands, etc. You rarely need actual programming, or even ability to
> read-modify-write something.

Yes we could have a similar panel-simple but with init tables, but
in reality those panels offers much more features we don't handle because
the DDIC vendors and panel integrators just don't care exposing those
features, but they get handled by vendor implementation like for Phones.

> 
> It could be, say, YAML converted to some binary representation. Maybe
> that could be in the DT, or maybe you could override it with the
> firmware loader. And obviously any vendor "blob" could be trivially
> converted back to YAML and upstreamed.

I don't think we want this, downstream vendors does that and we don't want
to go there.

> 
> Where that falls short, you could always have a dedicated driver, or
> extend the declarative stuff.
> 
> Now, the question is, how much more BPF solves over that, without
> requiring a dedicated driver, and is the added complexity worth it?

This is my global question, and this is what I'm evaluating here, and so
far is created more problem that solutions.

> 
> FWIW, on the Intel platforms that support DSI, all of the
> initialization, poweron/poweroff, backlight on/off etc. sequences like
> that are stored in the BIOS, defined by the OEM. A plethora of DSI
> panels, one driver. Don't look at it for examples how to implement it,
> but I think the basic idea is workable.

For _some_ panels, here, as a general solution no because we really
want to have full support for panel features.

Neil

> 
> 
> BR,
> Jani.
> 
> 

