Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D286E39AEC
	for <llvm@lists.linux.dev>; Fri, 31 May 2024 14:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717165831; cv=none; b=YVda3jC5R6YWx1ljblphIlrhmgCj4zQKBN1xWnjMqUXVNB8uTdURme0+8NoQyaoav0ScJtnzIJHWEqrratxyIOxpCx97wWw9N4oGc1cVIc6AT2k81dalAV7wICxMnQsKdCaN4euYkjYD4AeZCcFgq6e5dm0YnpaNk0kkCwhxvXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717165831; c=relaxed/simple;
	bh=Mstlf+YHhXo7luLr0yWqsRsb7jFizjn94L8piso2cDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KZAuysYWBJTqAv7lvbqjsLNrIpQOnq2GW2MmxQAq1fSLBUVtqq9iaVqJFWi1mU74TyCypVDaXfmRPoHjHJC/TTDE1vnjZoigw8veWj+6nIvghIICn5VEoDduy+8VRDPdNwEV87s0ukTni0vhbTfnJcIaDDMqNBMFXi3vfJWzKRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eYhQ7+y+; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eYhQ7+y+"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7e24aa659abso10435739f.3
        for <llvm@lists.linux.dev>; Fri, 31 May 2024 07:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717165829; x=1717770629; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3MGoSLns1wisPZvs6NHvJiVrP0w2UVFcddDT3uXZgnQ=;
        b=eYhQ7+y+b+SuBHzhMkYmQVUara/gOaPXW5S3V2JenUhPQTJWPP9A4LnJa253gpGFbZ
         vAi6NJ1yr1MSm60myFy9itJ0YpK30kxvnAOBUt0yYUQTqkacvZjOv2PZ26C3O7nEIxDy
         JXFKaIbGWldiGe2/ZFXXoJxMfWc8q0RtOa0b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717165829; x=1717770629;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MGoSLns1wisPZvs6NHvJiVrP0w2UVFcddDT3uXZgnQ=;
        b=d3H01Pk9Oye3kDRAvS+JO1OquF42gFX8zjHNTlNa20CljzWRQ9kEX5/Od46J/8srhx
         GtSCPlu6RRTLvFlIFUcOS1sanJaw6+GJp3htWWgJeqjkt2fMgjnyfH4MkVhjAsLsC3eL
         5Askzw/CiUyzaYhyTSeXhlfIOciC68QznxWpK2oULiosMJrmSCkuQW2E+iM8WcDIgs7Z
         +ZyPeHcl8JDCbZbZR85xX1UmQziRHej+73ySvniJ6cfiW7le+2NnPBhccMhbOtEeL03s
         NtwBamOtD5oaA861cemUgyKCCBGM2Xprge7W6CIBn2qcGcbkVsjm98ZmkIBPY3sKF3Uy
         V7/g==
X-Forwarded-Encrypted: i=1; AJvYcCWu7dGoEvyOcG3/8aE8S/IRndiW9nO5KVzc+od23PC0fAHXwwArc4a0JJtfOJCfCoAW3qpKjyJheXgmQPaB1hfxYtGTPw==
X-Gm-Message-State: AOJu0YwxL1ZDblw9USvJOYtl1O/sE73cuIL2WpYHjrv73VToddK5mKLz
	32jbmxs+tuxU1uMwMstkHt9HHGbTTxrZvfO3WBWnSWWQKBdUCRe2ALmSFHT1Jjs=
X-Google-Smtp-Source: AGHT+IHczcdb2EbS2U/zWmYn9oiBLgIRgPJ888h24oBdfKt520toNKLvs1PL7yQp/2Ht6WoSuPpkMg==
X-Received: by 2002:a05:6602:e59:b0:7de:b279:fb3e with SMTP id ca18e2360f4ac-7eafff09f0emr251963439f.1.1717165828911;
        Fri, 31 May 2024 07:30:28 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b5568ed9aasm246775173.45.2024.05.31.07.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 07:30:28 -0700 (PDT)
Message-ID: <e9597e75-948b-4ddc-8ca3-e9b188099f8f@linuxfoundation.org>
Date: Fri, 31 May 2024 08:30:27 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] selftests/lib.mk: silence some clang warnings that
 gcc already ignores
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Beau Belgrave <beaub@linux.microsoft.com>,
 Steven Rostedt <rostedt@goodmis.org>, Mark Brown <broonie@kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
 sunliming <sunliming@kylinos.cn>, Masami Hiramatsu <mhiramat@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Nathan Chancellor <nathan@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20240529020842.127275-1-jhubbard@nvidia.com>
 <20240529020842.127275-3-jhubbard@nvidia.com>
 <88c64f5e-4586-4b38-b3c8-0c3af93a71ae@linuxfoundation.org>
 <e0f3563b-5cd7-4f3c-ae7c-4478c25d527c@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e0f3563b-5cd7-4f3c-ae7c-4478c25d527c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/30/24 13:28, John Hubbard wrote:
> On 5/30/24 7:25 AM, Shuah Khan wrote:
>> On 5/28/24 20:08, John Hubbard wrote:
>>> gcc defaults to silence (off) for the following warnings, but clang
>>> defaults to the opposite. These warnings are not useful for kselftests,
>>> so silence them for the clang builds as well:
>>
>> Please you add more information on why they aren't useful
>> for kselftests.
> 
> Ah OK. My wording is a little misleading. The warnings are not useful
> for the *kernel*, as previous decided by the gcc settings when building
> the kernel. And it is only only due to including kernel data structures
> in the selftests, that we get the warnings on clang.
> 
> So it is not something unique to the selftests. There is nothing that
> the selftests' code does that triggers these warnings, other than the
> act of including the kernel's data structures.
> 
> I can post a v2 to update both the comment and the commit description.
> 
  
Yes please.

thanks,
-- Shuah

