Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69604241E3
	for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707820031; cv=none; b=PCoVzlfy4yKeAPAsXtpzdnq/EMJmIiPZWveRBCVmW3PnBJpkMakS2kuR3LKFbGBzKC/rHcJ6diy9IBhTF+ZjG4Fg+mD9Ce2zR6jsP8HpspzhzXbHSXr6mwELCyMkN7VHmtZZG1aJMyHYYmiirM3lqQQNxmDfX/Lcl5K6j+dvmf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707820031; c=relaxed/simple;
	bh=uT0vnan64Rg/+aXspOFR/5FOSzvW9CRoJZ50y2WDSyE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KdYafh6w4oJzd71uqgDOxnFTXW3lh3etsRCfznJbowH79pX9jGvERvtaVBdcWH0JWB3239XHzCVRi/cYiiOOulbYY4WYMz2ArMzrwRzh8vmucXLET+AqzjAzVTSvC8Ztaw2o9NS8ztUs93BdP/QypZxGnuf2CwWKXXmafXmR5go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WPx48Bck; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WPx48Bck"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33cdd1d732dso257074f8f.1
        for <llvm@lists.linux.dev>; Tue, 13 Feb 2024 02:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707820028; x=1708424828; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tyTZUfKxgXBwWopHYb3LgscDsLO34lDgWMz659lp7mo=;
        b=WPx48BckCmzFDsW4s1libHhqxMQqF3S9Glr2BThzwH41KvqOk7L7mHVTU0py38KK8k
         vnXyhBIXo+eGphZJd2JdIqsGApgbJetsnMeNngvzqmGPqio1vOs75bXkR8O5PxJX9DEW
         PxhxuB4rbYveGse4Z7kLz2QvB0a6CK9aYWfHo3MNT4uJ/hRbZQU2G5ea6tmLOBeehZHs
         OKq83dTHr4FZ6CILK1XklvD3pMko74I9KPWpoD6frMcBpnUsm1qXCnMBJx+QcXazfVX6
         zTcmOq2RYvzSq6qn3LnmkN3L2wtRHDJoZPuqvrofXXQ4dCUqMzSZIg3fqzPuQr+lglTj
         Bcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820028; x=1708424828;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :references:cc:to:content-language:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tyTZUfKxgXBwWopHYb3LgscDsLO34lDgWMz659lp7mo=;
        b=FhjbClOsaTs6vNWjmXL9NIk7FfeaWzE4rTtIj8Nd89vxpO8mqjVIoH7B/9FGh1ERa1
         nfMs/kPjilixwuZkOrqub9N4lbBok/A3geneXsypfDiEqgglLiMDripzgsDK5NzEGByx
         Nv7RFOq90xYUeTEb2onhfCC1Khr/kGG93VDyfzZEUKb1N5rlbShZV/BIDLlxb00rGYhq
         Kagb0vqhRNYyyIfQVJjha0rYZGopAAsxTwg+oti+82HN5WgmDdlDAgLP3GlR06Ui1tEU
         Z/4A8mcG/UoCCKnCQSP2qNFsWPPAesNKVAKKgCdwak0ZlLFTyK8hvwIOn8INh71u7FC9
         gZ5Q==
X-Gm-Message-State: AOJu0YweK0LmMNPVFAADZj5cIbPc5P+VasfndnXWFsmnFAnUc/JqdmZC
	11nmqDFg2tVOqz/lpK2wV64LKKfWX1wM2F7fAxM1b0LdvRmIoA9gQ6GRzyAN2xk=
X-Google-Smtp-Source: AGHT+IGWMhj0KLJWYR4q7Tu0F5Jf5C6g7wLmViMX9LHHF66KDjADA0qXn6Mq9uVuMDq3lCear/joWg==
X-Received: by 2002:a5d:6785:0:b0:33b:7d9b:4592 with SMTP id v5-20020a5d6785000000b0033b7d9b4592mr4917512wru.5.1707820027605;
        Tue, 13 Feb 2024 02:27:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXyXuwiUGeFI8zrVCbLtGqd06swkX06JnaokQfykh2lTXXhB3tIEqMiraG3YqDgDjH5MYBF4csqDHvxBXIMAHxWA1mFu4xFhLTIP5fOCZnDTkVr0a3lKAXwDFUuBjBERon1Th2M9KB83d4qJ/n3q2yacuvBHKi8L3jHXO08tB4H2Ry8+MPbmDGzNKS3Bdfykupqi5HIFbFOHBkRZ4D4zhzhWbqazeIzgchVTzIrs7++j1LTGEPRdmPgRfcx8tDSvANtZVE2RBdVc2OX6j5apnNKpyw1hofebP71JWVaD9Rryoi806Qn66amejnfBBUS1UXzPPSOb2lJ8SI9rs3l9PMAsFW/J2WPq2gpcEppd6ou43t2T9PtFOQrQ8XnQpohx+n2xwaKWCXb4DhuC8cS8xHFFDWE4sYIzQ1aK3n1m4D5tmp9td/O+TbcEn2bKL3ZZCc+m3clUKQgoFVNfCRzR0E3lPLkvNf3xSh0q8speVlpDVWLIFO7l3xyoCzdWob5IANexY7XVMQMf6VbzA==
Received: from ?IPV6:2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b? ([2a01:e0a:982:cbb0:6dfb:5e62:c51f:304b])
        by smtp.gmail.com with ESMTPSA id m10-20020adff38a000000b0033b0d2ba3a1sm9161150wro.63.2024.02.13.02.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 02:27:07 -0800 (PST)
Message-ID: <19dc040e-e023-4a17-a6bb-8aca156088d0@linaro.org>
Date: Tue, 13 Feb 2024 11:27:06 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] nvmem: meson-efuse: fix function pointer type mismatch
Content-Language: en-US, fr
To: Arnd Bergmann <arnd@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20240213101607.460930-1-arnd@kernel.org>
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
Organization: Linaro Developer Services
In-Reply-To: <20240213101607.460930-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/02/2024 11:15, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-16 warns about casting functions to incompatible types, as is done
> here to call clk_disable_unprepare:
> 
> drivers/nvmem/meson-efuse.c:78:12: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>     78 |                                        (void(*)(void *))clk_disable_unprepare,
> 
> Address this with a trivial helper function that adjusts the return code.
> 
> Fixes: 611fbca1c861 ("nvmem: meson-efuse: add peripheral clock")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/nvmem/meson-efuse.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
> index b922df99f9bc..3b9e31d7d073 100644
> --- a/drivers/nvmem/meson-efuse.c
> +++ b/drivers/nvmem/meson-efuse.c
> @@ -38,6 +38,11 @@ static const struct of_device_id meson_efuse_match[] = {
>   };
>   MODULE_DEVICE_TABLE(of, meson_efuse_match);
>   
> +static void meson_efuse_clk_disable(void *clk)
> +{
> +	clk_disable_unprepare(clk);
> +}
> +
>   static int meson_efuse_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -74,9 +79,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	ret = devm_add_action_or_reset(dev,
> -				       (void(*)(void *))clk_disable_unprepare,
> -				       clk);
> +	ret = devm_add_action_or_reset(dev, meson_efuse_clk_disable, clk);
>   	if (ret) {
>   		dev_err(dev, "failed to add disable callback");
>   		return ret;

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
