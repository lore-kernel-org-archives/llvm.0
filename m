Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C376D47DD76
	for <llvm@lists.linux.dev>; Mon,  5 Oct 2026 16:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791217926; cv=none; b=Ub5fo+tiTJ8exiIABdAsgZPYJm19sA+C4a2h03YbMiE5ZlwZ7xzB43UjwySzc0Sg/OS9QElp89CMqIH3WEJzMC/D4S8vfSYwciM5JPAUXgAhMRhIHgw9RCASWOSqBblUNJU7t4ZymV6Qa7s3ZAteRMUKbOsh9U9o0oiZH6qRW20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791217926; c=relaxed/simple;
	bh=t1p8IXQWCe6JXrYhb1ZRToxX1eE/YXZFtPZX/xQ9J6g=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=sqicLL6ZihmYSMYkOA1DwD98fCp9CPWeuzVYZeZu7qNDpS17xkkPwofKseMnHLUAjD0/lOjriOJy6OTBnA8TTLCSCdaIY0p2UPtNHEJ4n6GrXSLcAeN2IlPZc1ODGoG70epNYGZDy0Bv9PZUuQ7mt2DIz5hOFPEOIVRa5y6bIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=a3hczQrF; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="a3hczQrF"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3a80e169311so98382a91.1
        for <llvm@lists.linux.dev>; Mon, 05 Oct 2026 09:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791217924; x=1791822724;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ajrYDjtgXCfiLi8lpPhx25OD/gxlpMH/zqd4lkGdZpI=;
        b=QEy4XTZQ1gmzVZAOV2DJkbrNg20N+bUdwojEzCRoGg70vTFvQJH2WYgYY2HIUTQ1kv
         2S3x9YURrTyzWPQ6r10y46IGOogFNs06L70NisdVWLBjx384078G9nf+UHr/BqNlaxnb
         iw0PfU+SvUdUwJU3uQoLs5LUf/BFnYHAA5mFLw3AzqgTSwm2njzQPdTRqHAMZTzN1eZK
         tcvrxD9M+3vch/fnW2ijCrfZjpi5OcqPTliDYN2FnlMNfv6Gab0+X9j/S07frzQR586I
         Urt62fuYSttblYTDT8MWtDw/wvo8VwtKNC5fWgYzgSXhS5ce3WMR8k3wPhQJMyrQj0o7
         TZBA==
X-Forwarded-Encrypted: i=1; AKwUvBzRhDkrk7ocvSGNtxrpXHNWmROMWJTKsTka6aIMLRcFJsvSSp3EQQGmlU6Kj+Dfo+h0Yb7+@lists.linux.dev
X-Gm-Message-State: AFq9FYIvWZF1EbE4GZHN7CqMokvca5Z9uAMeh74o5xjGq+0pQBJsLhcM
	PQuNdkICzlD3xMqYhO2Q/DlEn6NxNp2un8j/VL6X0LMsDR+dc/jYF0wAscVIH0q2a+rqRBMxCfm
	eBUbmQNAARuiSkPBVIbZ2VgIfNo9gHZP+Ogpc5Mjz5kM86dSRSOR8U/xzSagOFtzdCUyfRFTZYu
	HtmYhywKUrWOCAHcFkom+l6PjbjJvnXeoi3VcHrBTgcytXOtgyQ2ocY0xZLEjy/UKQW/D7Chylc
	c0grwTjRZG4
X-Gm-Gg: AYBFou0+9tSxHhokKFLLAI++xYHIokxBB8CwzIHEs+PtQIz3Kqiv1ZB06MsnZQVjft7
	5GezzNT5PqTWOOyL6BF1CSG7HkfnZfdPbv9zms8Ec6KvBcDij/o8OjRGbkCC9rcHbfZ2jUrQv3s
	lico+ylIzl+SDzohF9SP2RRp8SmquVS5soM2ErUHojwzrSDhRkMEg1o0HjmVR2oOk/M8+UxvvI+
	mdJr2cjDs39ZT7L4Ms7XA4kXG5OzM/Gn74xuMg1fBMcV8fNAi2NxLVZHj1kF0j/3QwTOoAMnjcR
	BZ3lF1jXODkKwlZrzxkoNKa/Mt2WAOlILKn7MPXQMbQS6uxL+3sLjbr4vkE3EO0w1FYcHkq4wYS
	jEd65LXg8P4QEbTMqbUQM+zvTIGvJwOHuZgwNpnmsiyBQn31RUNFQvMBvPIOGpRfJQHk7vbkC4l
	f2ENipM39OEfaGHlCvEMlqwzZDUI5AdzPBzWsWXvZv3A==
X-Received: by 2002:a17:90b:3846:b0:3a0:c717:2db with SMTP id 98e67ed59e1d1-3a6ce7913eamr5205787a91.27.1791217924066;
        Mon, 05 Oct 2026 09:32:04 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a6dcd2753esm2117536a91.1.2026.10.05.09.32.03
        for <llvm@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:32:04 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c29bc25836fso238565766b.3
        for <llvm@lists.linux.dev>; Mon, 05 Oct 2026 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791217922; x=1791822722; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:subject
         :user-agent:references:in-reply-to:message-id:date:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ajrYDjtgXCfiLi8lpPhx25OD/gxlpMH/zqd4lkGdZpI=;
        b=a3hczQrFnkYyBwBj+4MmKqYUYSM8mTNwMvpoQBYmG26/v7fYT1WVhgDyhiIU9roxzs
         h8R5Y7WnRgqPU3w4V2huaDDaSizhct753mw9p0AUxMbNQf78ToeO/o9mwia5VuFq9ysI
         k8FIMKWhWfQnso1atIsv+mf+eRahOMQJFv/bw=
X-Forwarded-Encrypted: i=1; AKwUvBzx3n87MCSuBM4JhvQBgECBsZ8Net7gY/2gN5yjmAvnOYWFdSFfzKgqB5eyOOq6OlZ4FHmR@lists.linux.dev
X-Received: by 2002:a17:907:720d:b0:c2d:d202:d1ee with SMTP id a640c23a62f3a-c2e4adaee21mr972821666b.36.1791217921820;
        Mon, 05 Oct 2026 09:32:01 -0700 (PDT)
X-Received: by 2002:a17:907:720d:b0:c2d:d202:d1ee with SMTP id a640c23a62f3a-c2e4adaee21mr972819066b.36.1791217921362;
        Mon, 05 Oct 2026 09:32:01 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31563018d8sm99716966b.51.2026.10.05.09.32.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 09:32:00 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Nathan Chancellor <nathan@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, <stable@vger.kernel.org>
Date: Mon, 05 Oct 2026 18:31:59 +0200
Message-ID: <1a10ce86418.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20261005-brcmsmac-clang-24-constant-conversion-v1-1-a30c5692d582@kernel.org>
References: <20261005-brcmsmac-clang-24-constant-conversion-v1-1-a30c5692d582@kernel.org>
User-Agent: AquaMail/2.7.0 (build: 200700061)
Subject: Re: [PATCH] wifi: brcmsmac: Adjust txpwrindex value in nphy_ipa_rxcal_gaintbl_2GHz
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 5 oktober 2026 12:33:07 schreef Nathan Chancellor <nathan@kernel.org>:

> After a recent change in clang to warn on signed char conversions within
> array initializers [1], there is a warning (or error with
> CONFIG_WERROR=y / W=e) from nphy_ipa_rxcal_gaintbl_2GHz:
>
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c:224:18: error: 
>  implicit conversion from 'int' to 's8' (aka 'signed char') changes value 
>  from 128 to -128 [-Werror,-Wconstant-conversion]
>    224 |         {0, 0, 0, 0, 0, 128},
>        |         ~               ^~~
>  1 error generated.

[...]

> Cc: stable@vger.kernel.org
> Fixes: a9533e7ea3c4 ("Staging: Add initial release of brcm80211 - Broadcom 
> 802.11n wireless LAN driver.")
> Link: 
> https://github.com/llvm/llvm-project/commit/a5ef934a8d295dc03be3960f2b3744ec2e53238e 
> [1]
> Link: 
> https://lore.kernel.org/1a107e21b08.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com/ 
> [2]

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmsmac/phy/phy_n.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)



