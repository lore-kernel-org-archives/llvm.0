Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169F2BE49
	for <llvm@lists.linux.dev>; Tue, 29 Oct 2024 00:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730161309; cv=none; b=uzqqzHGzs9pDp9ybvEubohTKWgCdMRVzfrdDWzHAEZdsLnkeg+2Ew1s1kqCpE8azW+/1lQtabyHGRzwqjUddlJT4IwbeZbZ6UNO6GOAZH5W4KVV7Zv90rzpMbpxuwaWz06A0zm+1n+osjev3TYB3+KxsfOSyDtzONEf3LSsFULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730161309; c=relaxed/simple;
	bh=Spr/9gVQ3ixnPp96IeqLwNnmNbT1srTZhFONFqG2HrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4nVw5nobT3P0oqF15Kzu3ybbHlcTJOrbr5ZvseOUeVluajycczbZ7UuFSfGRcaL00VT0KRwe6datOfVi040voO7SluPPeC8ve3cuc2HcEwlb6BlTWpz8r9CuJHTIib3noWv9NkTcimEHU8cQdKB2drQB1t1mOAs24VmRhQ3+7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KI7BDed/; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KI7BDed/"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4315eeb2601so64759695e9.2
        for <llvm@lists.linux.dev>; Mon, 28 Oct 2024 17:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730161305; x=1730766105; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWbzABAqI/ojBk78q2sv3ilITM+mSGZHAe/vl0Koep8=;
        b=KI7BDed/WWa0qjBoLlOymXCYtNmfEvh0w7kdJ1JO3IqHd29ICA7FgBA1DUFdmTKSNP
         ry+IJTB20mzy90cgigsiRe/R7gOci+i53bQN0hH6ofE1bmP0yp+2iHuXdqKJpNq6ijI7
         VxYKHnmqao27V8x5Kxpu1yssUbLOF+g+HKgqscUIESswXVe/kllqZGdPL/7STXPM4nCr
         eCyrq9CfymDseSo/1bzTZtZMSF0gSlAf6zIEaqYxx6ND8km++tjwqYj1Fq6C8WKC840C
         KKhcIoX7xGjJVJ+rsojX1u6LPLnpE/MRhLjYlbE9lFXafrHDNBQbFhNEDoztCMrSKeBK
         cEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730161305; x=1730766105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWbzABAqI/ojBk78q2sv3ilITM+mSGZHAe/vl0Koep8=;
        b=AWd6nbLbVcCXDN2zJ0VwU7Qs3lFHLrO2ukPbmeUi6guX+HXhysMMEdx2EGJSYRTmQE
         mDn4Tdl7OJ9Q1pnBwTWfI4Ku+Kwxq/kKV9smkbrA3naTuBotFwrIWnzJTukAPreoGWTk
         GATqqCiJS/6T11GCi8mhPUFtBP9gwgZgAZH6wzGMLgfcc7X2tjFANnomOx6f5Pc8pwvR
         yV5zAr6D7HEvnhCyM2pmohIUWWqKeMNz7pAO2E13CP511rMZXGjN6LAd4aBm+Fz4ucMo
         QcMLcVXLpTasKk+DbNdhd1c8+RgY+MAKg/6cDNf+c74NVOPt3WdA54P2RrdVsxaIFJx9
         G0Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXYovxGvppbKmTIktMOanV9cuBUh3OfuenGH7i6ZpvFxMVhpdCxuERULmpDZBbz/MRzx2HD@lists.linux.dev
X-Gm-Message-State: AOJu0YwOBYaDlj0qFZIyTj6HPfarS3eJ7BRQKX3Ms/X94Q4N7qBqMB22
	mZ6h/riMJk+yp9z037s6uyQGZHOi7gSfZ3P+UK8pE0O/BbrMPw4G
X-Google-Smtp-Source: AGHT+IGj0S3WXjl/0uGVzhzJ69zkp3mVZZB6MmaUnIx+ClV50f+D6rqZ1LJKFUWgsLo4MMNYbycKxg==
X-Received: by 2002:a05:600c:4ecb:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-4319ab8cbfbmr107182805e9.0.1730161305160;
        Mon, 28 Oct 2024 17:21:45 -0700 (PDT)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431b4598b8bsm4874735e9.1.2024.10.28.17.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 17:21:43 -0700 (PDT)
Message-ID: <42f19231-dbe3-4fce-8836-75089f280296@gmail.com>
Date: Tue, 29 Oct 2024 02:22:08 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] wwan: core: Pass string literal as format
 argument of dev_set_name()
To: Simon Horman <horms@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, llvm@lists.linux.dev
References: <20241023-wwan-fmt-v1-1-521b39968639@kernel.org>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241023-wwan-fmt-v1-1-521b39968639@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Simon,

On 23.10.2024 15:15, Simon Horman wrote:
> Both gcc-14 and clang-18 report that passing a non-string literal as the
> format argument of dev_set_name() is potentially insecure.
> 
> E.g. clang-18 says:
> 
> drivers/net/wwan/wwan_core.c:442:34: warning: format string is not a string literal (potentially insecure) [-Wformat-security]
>    442 |         return dev_set_name(&port->dev, buf);
>        |                                         ^~~
> drivers/net/wwan/wwan_core.c:442:34: note: treat the string as an argument to avoid this
>    442 |         return dev_set_name(&port->dev, buf);
>        |                                         ^
>        |                                         "%s",
> 
> It is always the case where the contents of mod is safe to pass as the
> format argument. That is, in my understanding, it never contains any
> format escape sequences.
> 
> But, it seems better to be safe than sorry. And, as a bonus, compiler
> output becomes less verbose by addressing this issue as suggested by
> clang-18.
> 
> Compile tested only.
> No functional change intended.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Theoretically, we can pass a string literal there and all the arguments 
required to build a proper device name of multiple elements to save some 
ticks on the format string processing.

But this will require a deep rework still with intermediate string 
formatting. And since the performance of the name allocation is not the 
case here, lets go with your solution as way more simple and clear.

Acked-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>

> ---
>   drivers/net/wwan/wwan_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wwan/wwan_core.c b/drivers/net/wwan/wwan_core.c
> index 17431f1b1a0c..465e2a0d57a3 100644
> --- a/drivers/net/wwan/wwan_core.c
> +++ b/drivers/net/wwan/wwan_core.c
> @@ -431,7 +431,7 @@ static int __wwan_port_dev_assign_name(struct wwan_port *port, const char *fmt)
>   		return -ENFILE;
>   	}
>   
> -	return dev_set_name(&port->dev, buf);
> +	return dev_set_name(&port->dev, "%s", buf);
>   }
>   
>   struct wwan_port *wwan_create_port(struct device *parent,
> 

