Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E65F874
	for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 21:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718139711; cv=none; b=aniMKuRxNqrWZQMnwS3pFF+/jC9evOEJ9g6fFuvAVNdrPvs7kjEcH+2RL6VS3dAtoiyFZq4svwWgnivUeraIWTgxXHuUwRFHpKevg25Mczlgrl2motKXUKWWEaG2NzMgNBOyZkKYEpx0mt5uOFQ1AU6EdU1aRUfK3+hX70M6L0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718139711; c=relaxed/simple;
	bh=khCJ8E7bxMFxUPTxBFiKAS1pgz9jQ6ioSS5uproRVZw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nUe8GOkdaCn3O0No4RhTAmt7NP8B3dyytw9yD3S0N2SYGnXDHXedRqj/eydAzrjLfbJX3UtiZRAzpCqgcvYDq7+O50jmdzzhofSs9Ph2xXzd+kG9H6vbx235E7IL+MfEDK1tDfTK2t4+Wy6vjMQ708j2do4yxnhs/veXS6d1Km8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h0SGJLQa; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h0SGJLQa"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3d1b6b6b2c5so635039b6e.0
        for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 14:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1718139709; x=1718744509; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6zEkzkTuZ7txFA7Ps53axhuBCU7AlYnO5Uonpaq+8Q=;
        b=h0SGJLQanayczl5mj3rE4qf0cA4evWKzhFzIM48GLkgM/yQzQdOMzX8bbmt2XQjOXV
         ztJkahXfU374NkQeEezTlVqnze3KlM/I3E/6c8j4ubDkW8wXffTUyimpbZIjj64x/LFF
         knpnt5GGNNivjMJRBuUgkLH6WVta/CdNeotDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718139709; x=1718744509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6zEkzkTuZ7txFA7Ps53axhuBCU7AlYnO5Uonpaq+8Q=;
        b=NFeFverrD76WtO796gv+DbBdgXgDoovgFWaM7OLNHa8wJcrHOuyu/bLiRPt99ptWVh
         QQXy+HmyP7cLYIioOFaMCh4D+Paruov1dq03+B/yyVTKH/hqf7vDhPtzAe0CAQmgRObY
         fHp/k/qPXRMhIzfmL1RPVtAYfGxmlaaUSwLo8NWt3stGDDKfJQ8ZYOu+98pq/0OzE5R5
         cBRVIOcwH7o+YZRtVKLYhdIGmkImSVTH4RrTlhrPQYcZ+GTajoKFBJ4+8RAsYxA2Rg40
         5KmKafSseOeQU1W8zwEUR2gbUm89v7q8WBEpyXvWPxgUJLRhhcYikUlWyznUgT2zqF4p
         oJbg==
X-Forwarded-Encrypted: i=1; AJvYcCWElpsUr/x7C0NazZba0MQjZUUgNaK8V6o9RwfP9q/x4DsP8+Nv58EquBb7na8afM8flTJ/Dwi+Jm1+wqkPiXsHbt0LAw==
X-Gm-Message-State: AOJu0YzyzDRrN4bc6kNKTLjD/QQTTZ7jfn7sD/M696M/a6v6P9a7Yh7s
	zJZkrj0tIifUf9Jdki8zCVNZ0wm1vMtyVoteiLcpRc/FB5crMVLvgwTQiuQ0Zlg=
X-Google-Smtp-Source: AGHT+IG9GKImwKVUIgK2UrbzevVw6BqUCUpdNFpFowG/8v7VP6WnRqXnqwAjOpC+EOiwOZYSy6EfiQ==
X-Received: by 2002:a05:6870:7812:b0:254:7dbe:1b89 with SMTP id 586e51a60fabf-25514be2464mr2489fac.1.1718139709359;
        Tue, 11 Jun 2024 14:01:49 -0700 (PDT)
Received: from [172.20.14.19] (ool-6c3a3e1d.static.optonline.net. [108.58.62.29])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-795332e1bd0sm540525185a.134.2024.06.11.14.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 14:01:48 -0700 (PDT)
Message-ID: <bdd4d8ff-9399-44c8-8e14-311c0a7a8838@linuxfoundation.org>
Date: Tue, 11 Jun 2024 15:01:47 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] selftests/openat2, fchmodat2: fix clang build
 failures
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Christian Brauner <brauner@kernel.org>,
 Muhammad Usama Anjum <usama.anjum@collabora.com>,
 Alexey Gladkov <legion@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20240601014534.268360-1-jhubbard@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240601014534.268360-1-jhubbard@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/24 19:45, John Hubbard wrote:
> These two subsystems require very similar fixes, so I'm sending them
> out together.
> 
> Changes since the first version:
> 
> 1) Rebased onto Linux 6.10-rc1.
> 
> 2) Added a Reviewed-by tag from Ryan Roberts. See [1] for that.
> 
> Related work: I've sent a separate fix that allows "make CC=clang" to
> work in addition to "make LLVM=1" [2].
> 
> [1] https://lore.kernel.org/518dd1e3-e31a-41c3-b488-9b75a64b6c8a@arm.com
> [2] https://lore.kernel.org/20240531183751.100541-2-jhubbard@nvidia.com
> 
> John Hubbard (2):
>    selftests/openat2: fix clang build failures: -static-libasan,
>      LOCAL_HDRS
>    selftests/fchmodat2: fix clang build failure due to -static-libasan
> 
>   tools/testing/selftests/fchmodat2/Makefile | 11 ++++++++++-
>   tools/testing/selftests/openat2/Makefile   | 14 ++++++++++++--
>   2 files changed, 22 insertions(+), 3 deletions(-)
> 
> 
> base-commit: cc8ed4d0a8486c7472cd72ec3c19957e509dc68c

Applied to linux-kselftest fixes for Linux 6.10 next rc

thanks,
-- Shuah
