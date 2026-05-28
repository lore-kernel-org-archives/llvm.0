Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4275D34389C
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 20:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780001113; cv=none; b=KTFGELUqfjcy4EVvWNfw2ZKiJ1xq3lCmcRAZvYReOTldGS29D3715fRCoCcLM8WUVvJLvM10qTK7zJXKFs6F0+axXCIsdsNkcGAK4lRVj0T56fdUM1wNivA3nXGr4vC7oA43sgf+gTZ1DB7UaH4rhVmIXY7Oses4zy2M8YtRqVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780001113; c=relaxed/simple;
	bh=WCRjE7WHRkFro0JCIsNd1W7TNugW+KjsoPfkadQQcWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXEiGb1zRLAM1INw3tRoWfjD8REEa7fguIIAZurgv/Yf/b0j1a1Vf6ql3g+rAHD1H0yqrEQ07EnDR9fGTnSToLLQeOA8vok1P/Ko6j6hKf28tV1UT002qrz8nxi24+c0OfGLhyYezhjU0PxQ8+OIjZVZIgCxc1oHViJhKa3fiAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=GEIH4BDZ; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="GEIH4BDZ"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-91080895355so1469583585a.3
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 13:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1780001109; x=1780605909; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=forDyt6db+I9z32GZdeZGHTlTQE/tr87Pw4gHRWCrZI=;
        b=GEIH4BDZYXZDQsJVenTRm8EKTG3QczDbua3MovMeeOpW6m/1HECvBgeVPXcuPLgn9v
         MQUzHLU9FQnm7eZ3dBw/uq7RKU6jc+KoAfCPR8TuBjeI18v77jZxdOlhLZ0F0IBcG/8i
         qAvuy9DTa3g/i6lqWDzi1gP+GbZLDODhQYY8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780001109; x=1780605909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=forDyt6db+I9z32GZdeZGHTlTQE/tr87Pw4gHRWCrZI=;
        b=XTxQqgb5QN4NlVIC4CK9eacjZhoQYV4pKV45bsIpRuKjrIRaYjHyng6JqjtewO8lJq
         3ftl490AzSAo2/Wydi2ghcOGnlMEwvHKt4F2+R5CeZORfjwTT4GBe02AEaXb4dG1XDT4
         SyC1Rs1c6rXIdL1eTN9onzSric2iK97tVfO5hFhmUXqpob4/TLWz3VmbQkRbxsA1bIR4
         cn9kBD2x0Y8bv3qevtwppb1P459qbEtWlLvJ/ygW+XZRGlrAjcl+CihBDe9J2TxvZ6DG
         UBYz7bDGpN51ZHvbv5iM2tQ8NY5b62ncCOnDSccPYp4L5UMaPq3UYblz3Rp8XB/Aa5Rk
         6a0g==
X-Forwarded-Encrypted: i=1; AFNElJ/Zsy07830dPJ7Q1nvHhDqo7seI57KUVVhoLJ9IVXj1XegJzgJQDUez1iq+QJsQs6nhWjl2@lists.linux.dev
X-Gm-Message-State: AOJu0YzEcqHn9tV+fS87ZeOEQdew1atUKV9nY0iZJLqrerjrXIy2CyFz
	GyTojM2T/mS166zhNGQe9hyMIOlpAzly5mTdjon72mC7kStcVAjva8oK5ASriaw8gA==
X-Gm-Gg: Acq92OELP0wv6qbJVcEoWpVsspWMfjIaWYXOc3qVast3oBpYiHhdF1gv9OQamY/0NlB
	xTDIQmfs/DPwXpCmw6tyHTUXqj4ba+JP8trRa50iWdgtdge5cjX8BolTKYKvbnf3gm3UY57nW8m
	6F2/SJW1ooC5bbD8AcnMTb974G82/gv5nmmrWTt5F6oaCd+sKGCU30Td0r3dx/5fzROE2E6ytLt
	50OLb94tLcRkumqgCbmK4mIjTN7CYh0s1AiCxq/XYqltM0QGLJG3s2Gf6Rn7vsLOlTYPGr7zpKs
	w9TnKJOFNOWPdJaiu590jHLSg4WZgPsWR4GeeilwKf4XtubdWj5EDsyR/hzGrsPc76bYH9htJlA
	pJMjm7138tSUZ7tBJa75nkSyyYqqdbU/WLtMuoDr6QAxUg2C4/aM5ZR923G3iqalNxy4fYouG7Q
	bBaimuen42P6o+VfJIy1InUxKr5vGitadQhqUsoxY=
X-Received: by 2002:a05:620a:8012:b0:8fc:5ae9:7743 with SMTP id af79cd13be357-9152cf55ce4mr101633785a.43.1780001109080;
        Thu, 28 May 2026 13:45:09 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-914f870c37dsm933031285a.19.2026.05.28.13.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 13:45:08 -0700 (PDT)
Message-ID: <703f52e1-f31b-4683-95ad-14694797c2c9@ieee.org>
Date: Thu, 28 May 2026 15:45:06 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rbd: cast snap_count to size_t to avoid tautological
 comparison warning
To: Rosen Penev <rosenp@gmail.com>, linux-block@vger.kernel.org
Cc: Ilya Dryomov <idryomov@gmail.com>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Jens Axboe <axboe@kernel.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 "open list:RADOS BLOCK DEVICE (RBD)" <ceph-devel@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b"
 <llvm@lists.linux.dev>
References: <20260528202151.136274-1-rosenp@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20260528202151.136274-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/26 3:21 PM, Rosen Penev wrote:
> snap_count is u32 but the comparison is against a SIZE_MAX-derived value
> (~2^61 on 64-bit), which clang flags as always false with
> -Wtautological-constant-out-of-range-compare. Cast to size_t so the
> comparison is done in the correct width.
> 
> Assisted-by: Opencode:Big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

This is a simple fix.

You might consider doing something similar for this code in
rbd_dev_ondisk_valid():

         snap_count = le32_to_cpu(ondisk->snap_count);
         size = SIZE_MAX - sizeof (struct ceph_snap_context);
         if (snap_count > size / sizeof (__le64))
                 return false;

Reviewed-by: Alex Elder <elder@riscstar.com>


> ---
>   drivers/block/rbd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
> index 94709466ad19..b4ba51db9a28 100644
> --- a/drivers/block/rbd.c
> +++ b/drivers/block/rbd.c
> @@ -6079,7 +6079,7 @@ static int rbd_dev_v2_snap_context(struct rbd_device *rbd_dev,
>   	 * make sure the computed size of the snapshot context we
>   	 * allocate is representable in a size_t.
>   	 */
> -	if (snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
> +	if ((size_t)snap_count > (SIZE_MAX - sizeof (struct ceph_snap_context))
>   				 / sizeof (u64)) {
>   		ret = -EINVAL;
>   		goto out;

