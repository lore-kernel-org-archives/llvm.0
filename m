Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E41E14601D
	for <llvm@lists.linux.dev>; Mon,  8 Apr 2024 20:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712608515; cv=none; b=k4DBnB1+maCsbslaqG2VRCagtRyT1qPdpePvW2xS9gtmlHBm0yDTRdkvb/QKjrcD71oe7Ii5aQqL+1oYMCy76Logq4lgnOIQ1mtSxO8R8IbI8+66eKiW7/2lZHNq6Ez8hvCCHE7xuxup5OqSc1gw/vdZitJ5JSe9dZ47AhYeKbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712608515; c=relaxed/simple;
	bh=OcEhbhHITIrHOZAIdPPlDfaPIGAgz7UAoS2jk9MSk8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAk8puOtr2QXASYxl+InVCiAeyGfUAQR/sieGFNxxED0GNnoJHcY2zA88s2C7a1nBz7W/pRNJf5dXbWhTIR/UaDKwXeUZldSbEeN+aKu8qlybFLQWQLB2LOAgFSXYWbcy81S/LH0d+HOEIrnr+6+wi972Trbiw1YwvGQHX2fqGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1H73/lmh; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1H73/lmh"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-36a260208e4so4817635ab.2
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 13:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712608512; x=1713213312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZHkRhGYH9MwQZSzDBZ5+pjbW/9T1NNKYEiPQeECsdM=;
        b=1H73/lmhHYtvqf1+ZHUiASMxiesX3lAISY60vNAz8XhS2Ysu8kYubYyBWvESDHons3
         tc3JF4wyPMUgEBCYAAo8upsq65P9f8tKl0Ockvu6rfx6cgfPGbh5KWh7pi0rETKcOGlh
         gqbM9jcc3d4Ga0z2EC5Vf9/JsEX546+KnqtcuYVsFEkXFfjVJAsMDGHFM2wCqIneiMYx
         Ad2+EFTLxSiWYvhUGatX19r7xfXl++gVZEPse5mANyZvwqA3pdG26zF8V0a0aKFwqk3r
         8bdc3zjiIZJFSJPP9957zezO3CHZh62JQt8ApBL9Vekg3hCzHcP8sa9CDhYASeLqrxzp
         f0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712608512; x=1713213312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZHkRhGYH9MwQZSzDBZ5+pjbW/9T1NNKYEiPQeECsdM=;
        b=FIuxFvHaht5ED/tCVf6LZXjC+CvPQ6jfRX2/ZkRO2hywCTY4Ov/TIKlRkYhh3Ua9JU
         lc80xJ01V4ehye+1rWU5WgoKSLAi9O3ZwB6znwH52P5E5NsFRPMzhLisOBcIrsJzXUMp
         Ky15VASlQY7p5jnrN/jYzvjDfGDmCRubBNDyg8GMCF3MPd1kPoHxeNHi3YLbOA713hRj
         +rmglANqpJvylpD8jipG20tewf0vlYJu3Im+jIFoJ3gMar1AyOCfbSH9TZ6xgxHUNrai
         K+JRB7yJnSaHrpjsZQKCvI9I9ehXM1u1LwAbjFHe79hq95kyORD2BFbBCrZ07JkCyXF0
         0pKA==
X-Forwarded-Encrypted: i=1; AJvYcCUoAE7b6/KqLHcvSF9qbeo1FhqMlbI5xKXjE/ll+u5eS8lAt7Co+X+7jnkLWrIcbvfQ3jVyiJmrhgCxEh49dTZQWx3Emw==
X-Gm-Message-State: AOJu0Yw1NsBn7LEUtuTXZOGLfPsnyVkoip1BM+xqgILLZaJYkJ+jXgDb
	/COnN48UiRkI4kNfarRRNkUBmyNcVP/XyDVHEwnDth70wdgiPQrB33lrVAqKLw==
X-Google-Smtp-Source: AGHT+IGOzQ90wEzQVaj79jiCZtAwqyU686xC2bmO8snxJyhVXZL9zo3Xh37CLodsWqK2+hCyUPT+9A==
X-Received: by 2002:a05:6e02:18cf:b0:36a:1725:e123 with SMTP id s15-20020a056e0218cf00b0036a1725e123mr9252317ilu.14.1712608512197;
        Mon, 08 Apr 2024 13:35:12 -0700 (PDT)
Received: from google.com (30.64.135.34.bc.googleusercontent.com. [34.135.64.30])
        by smtp.gmail.com with ESMTPSA id r10-20020a92d44a000000b0036a2855e238sm525616ilm.78.2024.04.08.13.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 13:35:11 -0700 (PDT)
Date: Mon, 8 Apr 2024 20:35:09 +0000
From: Justin Stitt <justinstitt@google.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Franziska Naepelt <franziska.naepelt@googlemail.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Aloka Dixit <quic_alokad@quicinc.com>, Erick Archer <erick.archer@gmx.com>, 
	Yang Yingliang <yangyingliang@huawei.com>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 2/3] [v2] staging: rtl8723bs: convert strncpy to strscpy
Message-ID: <5tivf4xqef52ivneq6ucs2au2ld62ruwmjddhrhrgnltr3q3vj@iykmv323noqq>
References: <20240408194821.3183462-1-arnd@kernel.org>
 <20240408194821.3183462-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240408194821.3183462-2-arnd@kernel.org>

Hi,

On Mon, Apr 08, 2024 at 09:48:10PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-9 complains about a possibly unterminated string in the strncpy() destination:
> 
> In function 'rtw_cfg80211_add_monitor_if',
>     inlined from 'cfg80211_rtw_add_virtual_intf' at drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2209:9:
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2146:2: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]
>  2146 |  strncpy(mon_ndev->name, name, IFNAMSIZ);
>       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This one is a false-positive because of the explicit termination in the following
> line, and recent versions of clang and gcc no longer warn about this.
> 
> Interestingly, the other strncpy() in this file is missing a termination but
> does not produce a warning, possibly because of the type confusion and the
> cast between u8 and char.
> 
> Change both strncpy() instances to strscpy(), which avoids the warning as well
> as the possibly missing termination. No additional padding is needed here.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Helps with: https://github.com/KSPP/linux/issues/90

and for the bots...
Link: https://github.com/KSPP/linux/issues/90

Reviewed-by: Justin Stitt <justinstitt@google.com>

> ---
> v2:
>   use the two-argument version of strscpy(), which is simpler for the constant
>   size destination. Add the third instance in this driver as well.
> ---
>  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 5 ++---
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c       | 2 +-
>  2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> index 65a450fcdce7..3fe27ee75b47 100644
> --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> @@ -884,7 +884,7 @@ static int cfg80211_rtw_add_key(struct wiphy *wiphy, struct net_device *ndev,
>  		goto addkey_end;
>  	}
>  
> -	strncpy((char *)param->u.crypt.alg, alg_name, IEEE_CRYPT_ALG_NAME_LEN);
> +	strscpy(param->u.crypt.alg, alg_name);
>  
>  	if (!mac_addr || is_broadcast_ether_addr(mac_addr))
>  		param->u.crypt.set_tx = 0; /* for wpa/wpa2 group key */
> @@ -2143,8 +2143,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
>  	}
>  
>  	mon_ndev->type = ARPHRD_IEEE80211_RADIOTAP;
> -	strncpy(mon_ndev->name, name, IFNAMSIZ);
> -	mon_ndev->name[IFNAMSIZ - 1] = 0;
> +	strscpy(mon_ndev->name, name);
>  	mon_ndev->needs_free_netdev = true;
>  	mon_ndev->priv_destructor = rtw_ndev_destructor;
>  
> diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> index 68bba3c0e757..55d0140cd543 100644
> --- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> +++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
> @@ -415,7 +415,7 @@ static int rtw_ndev_init(struct net_device *dev)
>  	struct adapter *adapter = rtw_netdev_priv(dev);
>  
>  	netdev_dbg(dev, FUNC_ADPT_FMT "\n", FUNC_ADPT_ARG(adapter));
> -	strncpy(adapter->old_ifname, dev->name, IFNAMSIZ);
> +	strscpy(adapter->old_ifname, dev->name);
>  
>  	return 0;
>  }
> -- 
> 2.39.2
> 
>

Thanks
Justin
