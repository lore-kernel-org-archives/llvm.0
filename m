Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED4B2E7198
	for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 08:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145010; cv=none; b=BXo/oyIyoj3ZM3QOFgb2mD58CD6HVRc8idcQmOvmtCaKkXTZQLFrIOiuMYKlmbN8IHYGHSq552qr73wxI4o8cS3wQrwOiFoTuAvLQg0U3zbk49JnceNi3Sogkukb9edwqdMbJyzNlDVpnOx/dv/ihUG2vAxP6G925VTR3y/gc6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145010; c=relaxed/simple;
	bh=a4R5utwOxhqF51n2TJ39WizmznuZrWsPT687TxSYO5I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Q3HCedJIR4eeMaQSB322R15lVY1KoKyr26dyXfJg9YRI0cgiTQUubbxzZKb5dD7NSXU4EGWUZiniVxXLqZXL/Nk3YGtXnAAzTkUerIJ6TS/ck9+69TKk9UYBOtaVizmtbr8VLlNdqF0XSkEn2w7DFeOoxTFKGO0MrF7PCK5aGL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HBNj+yz5; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HBNj+yz5"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42b31c610fcso5463910f8f.0
        for <llvm@lists.linux.dev>; Wed, 26 Nov 2025 00:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764145005; x=1764749805; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp9MLuEnCAUFdYVbUXEufH3fIXvI9LKM5pxdbbBUQjc=;
        b=HBNj+yz5ePeteJQtTe2rV5UhK061BnRV+LJoXn3OwqZ70n2L1FEz0NUIwyhmCgqYdF
         PdzJObwJJ3XGe8AgUd9AxEBCWaIhRcm5aKpUh+QxCwkzl4W1UqKu0USKHyNr/G/vmbQI
         wSRm0doEfHo92TisZnjEn/iTWb508k/fx62oKhHPRMF7WyQaqxstlh2b7okd8H+VER2D
         SpQD/iVH3mKGqBBpFlKc4cKLuVgKfv/0wSSeUY2yac0XMWgCK4+WE5sNIAj3fGJ1qrqB
         qcKH3DMmv9FcVzyXiYsghkZ0E+IEvGyylbBMUm+kwzBnb/7sYbTpig6aNRSadJ7NP0mj
         0M0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764145005; x=1764749805;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bp9MLuEnCAUFdYVbUXEufH3fIXvI9LKM5pxdbbBUQjc=;
        b=rTqL+gP1uvNWK+iow4d65L4YB5PV0+udcXykLAxo/ExBNQb8y/63Uji33luXFK+L4T
         w0EXi/TMuKNMZAcwmny4KMZt/jAPGpk4M1HKQ43x10JVac7fFfzoE+q34zyyDScBnhWL
         qLTXbuciF0uau3RfAMpl1gKXbyuMrGag+mfjmWEyV2NVjr+pSF+tFqjiXmtEWzEp9ksR
         hh8fSCIp4M0DMyaNHvNjT/V0edy/aG8sQHK23Jx1e8jtOFK+syA1HxicJCe6tphXGZi/
         vAJONlceUnziYE3xmfjmup7I7IUXOGVaGfmIhlA1zIpzraiUQr1VteGp3e2ntslxMbb9
         LKlg==
X-Gm-Message-State: AOJu0Yw1bP2IQHNKhkkzqUXMZjuWi1JLUArBjainTziiMWf56rA93zBJ
	gm5uPmyOLg6wzHS57cmK9+36B6gGXUN4pO0et1HwQw1H3VJFL7QycvJEX8w7WcBIikA=
X-Gm-Gg: ASbGncuPJ2pxqIp3pK2r8eOCz5a+ecuoOB3IYlmKmVsKEaSiqkVgte7O6aDRn0avvoI
	zF9793QetaTQsnHIVUTTmBBPgs3Lf/1nhnx9QiXYp/inA71yBa/Ht5MYPf4Ox4WQhU7ejiCoFim
	v2JUqwq2drWuaLPtuTwbtD2ZiEeke8tHzE2OfbN9ZJaPjIYYzq6ewQnV6clTD4vx3Mie9AljFjS
	rG2qRZCbX/NWmoHmHS7xyQQIMiHjv02orMdIId92vJaf4Bu83YRmz105Up4JlZmZ6muMjkVsoDF
	N2jCna9NARWam9ZsLYexFnVT16D8dY3akamcuO9ADa9l05cZoq3HWtla+xeoKGBLpiZlKmAJsWR
	xj0GXNUkWGWDdzpFRAGlDNdzQJyFoL5g5oP3wVBdMxqH8aY+bvKhGTVb9vOG+cJBqBPcgmuh4S4
	uKsq0vLOXOT3Xz6E1x1wIIMlpGyL2P2rqfF/BmjKZ3+Hxaq00RN059cdqFFbFc41ptIM8fdCU=
X-Google-Smtp-Source: AGHT+IHPPfQKrVboPz1++lYiC4EA1oPm3zhA5dF9BHMldPdu8tlp/OGFZ0pC6pgoFDldMkA1lJlt8g==
X-Received: by 2002:a05:6000:430d:b0:429:ba48:4d6 with SMTP id ffacd0b85a97d-42e0f1fc42dmr5591695f8f.10.1764145005002;
        Wed, 26 Nov 2025 00:16:45 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:91ba:3a5e:334:4534? ([2a01:e0a:3d9:2080:91ba:3a5e:334:4534])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f3635bsm39543011f8f.17.2025.11.26.00.16.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 00:16:44 -0800 (PST)
Message-ID: <f41cb5f2-1702-499e-81d9-8ce74537bf3f@linaro.org>
Date: Wed, 26 Nov 2025 09:16:43 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH REGRESSION] drm/panel: simple: restore connector_type
 fallback
To: kernel test robot <lkp@intel.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Anusha Srivatsa <asrivats@redhat.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4@microchip.com>
 <202511230354.nHRvfjDz-lkp@intel.com>
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
In-Reply-To: <202511230354.nHRvfjDz-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/22/25 21:26, kernel test robot wrote:
> Hi Ludovic,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on 88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ludovic-Desroches/drm-panel-simple-restore-connector_type-fallback/20251121-212613
> base:   88cbd8ac379cf5ce68b7efcfd4d1484a6871ee0b
> patch link:    https://lore.kernel.org/r/20251121-lcd_panel_connector_type_fix-v1-1-fdbbef34a1a4%40microchip.com
> patch subject: [PATCH REGRESSION] drm/panel: simple: restore connector_type fallback
> config: arm-randconfig-002-20251123 (https://download.01.org/0day-ci/archive/20251123/202511230354.nHRvfjDz-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230354.nHRvfjDz-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511230354.nHRvfjDz-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/gpu/drm/panel/panel-simple.c:648:7: warning: variable 'panel' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>       648 |         case DRM_MODE_CONNECTOR_eDP:
>           |              ^~~~~~~~~~~~~~~~~~~~~~
>     include/uapi/drm/drm_mode.h:417:33: note: expanded from macro 'DRM_MODE_CONNECTOR_eDP'
>       417 | #define DRM_MODE_CONNECTOR_eDP          14
>           |                                         ^~
>     drivers/gpu/drm/panel/panel-simple.c:749:6: note: uninitialized use occurs here
>       749 |         if (panel->ddc)
>           |             ^~~~~
>     drivers/gpu/drm/panel/panel-simple.c:615:28: note: initialize the variable 'panel' to silence this warning
>       615 |         struct panel_simple *panel;
>           |                                   ^
>           |                                    = NULL
>     1 warning generated.
> 
> 
> vim +/panel +648 drivers/gpu/drm/panel/panel-simple.c
> 
> 47c08262f34e1c Maxime Ripard     2025-06-26  611
> 47c08262f34e1c Maxime Ripard     2025-06-26  612  static struct panel_simple *panel_simple_probe(struct device *dev)
> 280921de7241ee Thierry Reding    2013-08-30  613  {
> 47c08262f34e1c Maxime Ripard     2025-06-26  614  	const struct panel_desc *desc;
> 280921de7241ee Thierry Reding    2013-08-30  615  	struct panel_simple *panel;
> b8a2948fa2b3a5 Sean Paul         2019-07-11  616  	struct display_timing dt;
> 0fe1564bd61642 Sam Ravnborg      2019-12-07  617  	struct device_node *ddc;
> 9f069c6fbc7266 Sam Ravnborg      2020-07-26  618  	int connector_type;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  619  	u32 bus_flags;
> 280921de7241ee Thierry Reding    2013-08-30  620  	int err;
> 280921de7241ee Thierry Reding    2013-08-30  621
> 47c08262f34e1c Maxime Ripard     2025-06-26  622  	desc = panel_simple_get_desc(dev);
> 47c08262f34e1c Maxime Ripard     2025-06-26  623  	if (IS_ERR(desc))
> 47c08262f34e1c Maxime Ripard     2025-06-26  624  		return ERR_CAST(desc);
> 47c08262f34e1c Maxime Ripard     2025-06-26  625
> 9f069c6fbc7266 Sam Ravnborg      2020-07-26  626  	connector_type = desc->connector_type;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  627  	/* Catch common mistakes for panels. */
> 9f069c6fbc7266 Sam Ravnborg      2020-07-26  628  	switch (connector_type) {
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  629  	case 0:
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  630  		dev_warn(dev, "Specify missing connector_type\n");
> 9f069c6fbc7266 Sam Ravnborg      2020-07-26  631  		connector_type = DRM_MODE_CONNECTOR_DPI;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  632  		break;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  633  	case DRM_MODE_CONNECTOR_LVDS:
> c4715837b02393 Laurent Pinchart  2020-06-30  634  		WARN_ON(desc->bus_flags &
> c4715837b02393 Laurent Pinchart  2020-06-30  635  			~(DRM_BUS_FLAG_DE_LOW |
> c4715837b02393 Laurent Pinchart  2020-06-30  636  			  DRM_BUS_FLAG_DE_HIGH |
> c4715837b02393 Laurent Pinchart  2020-06-30  637  			  DRM_BUS_FLAG_DATA_MSB_TO_LSB |
> c4715837b02393 Laurent Pinchart  2020-06-30  638  			  DRM_BUS_FLAG_DATA_LSB_TO_MSB));
> 1185c406f11a49 Laurent Pinchart  2020-06-30  639  		WARN_ON(desc->bus_format != MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
> 1185c406f11a49 Laurent Pinchart  2020-06-30  640  			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_SPWG &&
> 1185c406f11a49 Laurent Pinchart  2020-06-30  641  			desc->bus_format != MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA);
> 1185c406f11a49 Laurent Pinchart  2020-06-30  642  		WARN_ON(desc->bus_format == MEDIA_BUS_FMT_RGB666_1X7X3_SPWG &&
> 1185c406f11a49 Laurent Pinchart  2020-06-30  643  			desc->bpc != 6);
> 1185c406f11a49 Laurent Pinchart  2020-06-30  644  		WARN_ON((desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_SPWG ||
> 1185c406f11a49 Laurent Pinchart  2020-06-30  645  			 desc->bus_format == MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA) &&
> 1185c406f11a49 Laurent Pinchart  2020-06-30  646  			desc->bpc != 8);
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  647  		break;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26 @648  	case DRM_MODE_CONNECTOR_eDP:
> 5f04e7ce392db9 Douglas Anderson  2021-09-14  649  		dev_warn(dev, "eDP panels moved to panel-edp\n");
> 5f04e7ce392db9 Douglas Anderson  2021-09-14  650  		err = -EINVAL;
> 5f04e7ce392db9 Douglas Anderson  2021-09-14  651  		goto free_ddc;

The error is legitimate, here we'll try to access panel->ddc, but the panel isn't allocated.

Please fix this.

Neil

> ddb8e853dc8507 Sam Ravnborg      2020-07-26  652  	case DRM_MODE_CONNECTOR_DSI:
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  653  		if (desc->bpc != 6 && desc->bpc != 8)
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  654  			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  655  		break;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  656  	case DRM_MODE_CONNECTOR_DPI:
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  657  		bus_flags = DRM_BUS_FLAG_DE_LOW |
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  658  			    DRM_BUS_FLAG_DE_HIGH |
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  659  			    DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE |
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  660  			    DRM_BUS_FLAG_PIXDATA_SAMPLE_NEGEDGE |
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  661  			    DRM_BUS_FLAG_DATA_MSB_TO_LSB |
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  662  			    DRM_BUS_FLAG_DATA_LSB_TO_MSB |
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  663  			    DRM_BUS_FLAG_SYNC_SAMPLE_POSEDGE |
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  664  			    DRM_BUS_FLAG_SYNC_SAMPLE_NEGEDGE;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  665  		if (desc->bus_flags & ~bus_flags)
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  666  			dev_warn(dev, "Unexpected bus_flags(%d)\n", desc->bus_flags & ~bus_flags);
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  667  		if (!(desc->bus_flags & bus_flags))
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  668  			dev_warn(dev, "Specify missing bus_flags\n");
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  669  		if (desc->bus_format == 0)
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  670  			dev_warn(dev, "Specify missing bus_format\n");
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  671  		if (desc->bpc != 6 && desc->bpc != 8)
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  672  			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  673  		break;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  674  	default:
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  675  		dev_warn(dev, "Specify a valid connector_type: %d\n", desc->connector_type);
> 9f069c6fbc7266 Sam Ravnborg      2020-07-26  676  		connector_type = DRM_MODE_CONNECTOR_DPI;
> ddb8e853dc8507 Sam Ravnborg      2020-07-26  677  		break;
> 1185c406f11a49 Laurent Pinchart  2020-06-30  678  	}
> c4715837b02393 Laurent Pinchart  2020-06-30  679
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  680  	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  681  				     &panel_simple_funcs, connector_type);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  682  	if (IS_ERR(panel))
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  683  		return ERR_CAST(panel);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  684
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  685  	panel->desc = desc;
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  686
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  687  	panel->supply = devm_regulator_get(dev, "power");
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  688  	if (IS_ERR(panel->supply))
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  689  		return ERR_CAST(panel->supply);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  690
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  691  	panel->enable_gpio = devm_gpiod_get_optional(dev, "enable",
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  692  						     GPIOD_OUT_LOW);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  693  	if (IS_ERR(panel->enable_gpio))
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  694  		return dev_err_cast_probe(dev, panel->enable_gpio,
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  695  					  "failed to request GPIO\n");
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  696
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  697  	err = of_drm_get_panel_orientation(dev->of_node, &panel->orientation);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  698  	if (err) {
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  699  		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, err);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  700  		return ERR_PTR(err);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  701  	}
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  702
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  703  	ddc = of_parse_phandle(dev->of_node, "ddc-i2c-bus", 0);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  704  	if (ddc) {
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  705  		panel->ddc = of_find_i2c_adapter_by_node(ddc);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  706  		of_node_put(ddc);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  707
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  708  		if (!panel->ddc)
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  709  			return ERR_PTR(-EPROBE_DEFER);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  710  	}
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  711
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  712  	if (!of_device_is_compatible(dev->of_node, "panel-dpi") &&
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  713  	    !of_get_display_timing(dev->of_node, "panel-timing", &dt))
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  714  		panel_simple_parse_panel_timing_node(dev, panel, &dt);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  715
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  716  	if (desc->connector_type == DRM_MODE_CONNECTOR_LVDS) {
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  717  		/* Optional data-mapping property for overriding bus format */
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  718  		err = panel_simple_override_nondefault_lvds_datamapping(dev, panel);
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  719  		if (err)
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  720  			goto free_ddc;
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  721  	}
> 2803eb4aeb2702 Ludovic Desroches 2025-11-21  722
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  723  	dev_set_drvdata(dev, panel);
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  724
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  725  	/*
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  726  	 * We use runtime PM for prepare / unprepare since those power the panel
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  727  	 * on and off and those can be very slow operations. This is important
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  728  	 * to optimize powering the panel on briefly to read the EDID before
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  729  	 * fully enabling the panel.
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  730  	 */
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  731  	pm_runtime_enable(dev);
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  732  	pm_runtime_set_autosuspend_delay(dev, 1000);
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  733  	pm_runtime_use_autosuspend(dev);
> 3235b0f20a0a41 Douglas Anderson  2021-04-16  734
> 0fe1564bd61642 Sam Ravnborg      2019-12-07  735  	err = drm_panel_of_backlight(&panel->base);
> d9e74da2f1fc42 Alexander Stein   2022-06-21  736  	if (err) {
> d9e74da2f1fc42 Alexander Stein   2022-06-21  737  		dev_err_probe(dev, err, "Could not find backlight\n");
> 70e12560126685 Douglas Anderson  2021-04-23  738  		goto disable_pm_runtime;
> d9e74da2f1fc42 Alexander Stein   2022-06-21  739  	}
> 0fe1564bd61642 Sam Ravnborg      2019-12-07  740
> c3ee8c65f63799 Bernard Zhao      2020-08-01  741  	drm_panel_add(&panel->base);
> 280921de7241ee Thierry Reding    2013-08-30  742
> 921c41e509746a Maxime Ripard     2025-06-26  743  	return panel;
> 280921de7241ee Thierry Reding    2013-08-30  744
> 70e12560126685 Douglas Anderson  2021-04-23  745  disable_pm_runtime:
> a596fcd9cbc781 Douglas Anderson  2021-05-17  746  	pm_runtime_dont_use_autosuspend(dev);
> 70e12560126685 Douglas Anderson  2021-04-23  747  	pm_runtime_disable(dev);
> 280921de7241ee Thierry Reding    2013-08-30  748  free_ddc:
> 5f04e7ce392db9 Douglas Anderson  2021-09-14  749  	if (panel->ddc)
> 280921de7241ee Thierry Reding    2013-08-30  750  		put_device(&panel->ddc->dev);
> 280921de7241ee Thierry Reding    2013-08-30  751
> 921c41e509746a Maxime Ripard     2025-06-26  752  	return ERR_PTR(err);
> 280921de7241ee Thierry Reding    2013-08-30  753  }
> 280921de7241ee Thierry Reding    2013-08-30  754
> 

