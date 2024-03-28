Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED1612DDB2
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 14:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711637641; cv=none; b=fEdhRq+DQ2F52toxYtbJPQLQlVMlCxCcEbQo3+656B8nioVMXVguJNGrXJCNk85YAVckhI9Fkwuc41BVMqobicGCX40HzTmLNsZcaiFEKsJ4B7tFXymxsa2ZonU9GgDxmmXshFAv/NVU+iTnmgTy5LCUewppQq8bXej0aKu64TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711637641; c=relaxed/simple;
	bh=iZIfvRAXPiN1hUOqhcrIgulJC/h0qg4G0zbfy7UTFog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvGWTMetdUOlhLh/2FsAt633gMZEkJLcINo1dwfQ2UswLce9RSu1P5fBwVJun5jWrsnyNoMa8edC/L6stjgJJz5K4T8Tso+Bw6QzrnKVn7a5SNhrxQRUL39GiLdcX/Ac7Yrn7+8zHKiWD1BkaUkS0rdEl4Fo8bp8S7FCd5QV/Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=HlMNb2X+; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="HlMNb2X+"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-695df25699fso7541416d6.2
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 07:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1711637638; x=1712242438; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ch1rSN60qRNe5jZReHI5Y78NslDtRUbpHN7Kv6Yk4Rs=;
        b=HlMNb2X+mKxgwfUicU3F0Li53AF8/WQfDOYVbwZsmrHMWl2ganLo8YCPkxfc5O1Px7
         U3Kj/AbEn24Iw/5BLawIIt/M5jMgqcD0A/BA1G/lgmQZFPPiCtnbaMEpMiHGYLSiJpN4
         lC6rgRmspSJH4mqJz+QkNCMSQXsY+cMhpEMhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711637638; x=1712242438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ch1rSN60qRNe5jZReHI5Y78NslDtRUbpHN7Kv6Yk4Rs=;
        b=vMIlpYgG7+mKKe1cef36T/9W2Yirmd3HCmjahL3PnO6tHv8FLvYH+wZHdrJwF/tO51
         /OWnjJjcxUVQqTvQA+xJFeXKB0YNLrsiEcY1+Xackv0G64gb0xyrPL6cQZyqjaSFGy0m
         aa8kK8oWKUffr10p4tSd2cJVlxbrVXxatP6yb82yYHBkffp1Wlz5R/pFiRnloFZ4iAzq
         jfG5aQjyIy3gcmsyNcbXdbH7VvMK5Zuo4zCSVq+PnuWL0wl0PeOTdG98Z4nxUK87QGfC
         AYGx2r5KQEi1RPoFhzUhkWnrPw6RuBFjB3fa52aeM2NAlbs0e9zc9LFGlekM3LddEG1S
         YkbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpkdnk/TlpHJmqtblP2lFKe7834jahkK2urp53zDQsYCuWvldMsdRXCx9SXiYU5QPHxSsG/2VpgJ7s3054TmHR/3evCw==
X-Gm-Message-State: AOJu0YzygmnHnVkPJzx9mDcIdNks7twMRbQkSBXLkyhPMDPpR8+ZJwvk
	65dJ9WuVr5ncQvzIs3YwF7RYcf+wnuStauYpvPxILV0K3mJE+ZwYayF3AWCOFg==
X-Google-Smtp-Source: AGHT+IEnRGCY/sQi9y+ccYFEbyJVObyHWpdhYti3ZYxnNsR7GFx/Tq+iuzOTlBR8697MpFQbDAmQmg==
X-Received: by 2002:ad4:5507:0:b0:696:990b:dfeb with SMTP id pz7-20020ad45507000000b00696990bdfebmr2685430qvb.16.1711637638145;
        Thu, 28 Mar 2024 07:53:58 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id jf11-20020a0562142a4b00b006987272f5cbsm399690qvb.71.2024.03.28.07.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Mar 2024 07:53:57 -0700 (PDT)
Message-ID: <b8e848fe-96d8-4f75-a2e9-2ed5c11a2fd7@ieee.org>
Date: Thu, 28 Mar 2024 09:53:55 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] rbd: avoid out-of-range warning
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
 Ilya Dryomov <idryomov@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Nathan Chancellor <nathan@kernel.org>, Alex Elder <elder@inktank.com>,
 Josh Durgin <josh.durgin@inktank.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Hannes Reinecke <hare@suse.de>, Christian Brauner <brauner@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Ricardo B. Marliere" <ricardo@marliere.net>,
 Jinjie Ruan <ruanjinjie@huawei.com>, Alex Elder <elder@linaro.org>,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org, llvm@lists.linux.dev
References: <20240328143051.1069575-1-arnd@kernel.org>
 <20240328143051.1069575-4-arnd@kernel.org>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20240328143051.1069575-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/28/24 9:30 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang-14 points out that the range check is always true on 64-bit
> architectures since a u32 is not greater than the allowed size:
> 
> drivers/block/rbd.c:6079:17: error: result of comparison of constant 2305843009213693948 with expression of type 'u32' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
w
>              ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> This is harmless, so just change the type of the temporary to size_t
> to shut up that warning.

This fixes the warning, but then the now size_t value is passed
to ceph_decode_32_safe(), which implies a different type conversion.
That too is not harmful, but...

Could we just cast the value in the comparison instead?

   if ((size_t)snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))

You could drop the space between sizeof and ( while
you're at it (I always used the space back then).

					-Alex

> 
> Fixes: bb23e37acb2a ("rbd: refactor rbd_header_from_disk()")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   drivers/block/rbd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 26ff5cd2bf0a..cb25ee513ada 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -6062,7 +6062,7 @@ static int rbd_dev_v2_snap_context(struct rbd_device *rbd_dev,
>   	void *p;
>   	void *end;
>   	u64 seq;
> -	u32 snap_count;
> +	size_t snap_count;
>   	struct ceph_snap_context *snapc;
>   	u32 i;
>   

