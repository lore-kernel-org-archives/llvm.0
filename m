Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528E34B434
	for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761146848; cv=none; b=d16L1CG1dkKbSne5QJ19TtEsy2f4wRQ8HFVhZhvIywBqpC+AlH0qmj/HmsCr8OIh64csMgmzz5kDxTYdkwudSx5HHkfahlSuhPjvqQThVcaOewfJ/RaUWRR7RScaMY8CBkdsYYap1XV1tArzQM/v2uq7dOTZRPtq1luI2a2RU7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761146848; c=relaxed/simple;
	bh=kNgL40BudYWuJuAsmdNvcDtZ0OwcI9RxNTByNbcVNcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lw94q/DMSzFncx2J9G+lbx0EAW43+qcQj5/RbGN8YtxEsbk0sMfFn3Hb6oAZVMLCtwHcd93PwIUBXZgfUvgNVcjjE3NR7h1rgsoTA9hsS9DdaH4H70sVC/GpzodX9o9z0oBLLOk7wkDrDc485TYvyKT/6F0LpVc1AkoQuS2h6IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fjSQRwvM; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fjSQRwvM"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-430c97cbe0eso45347775ab.2
        for <llvm@lists.linux.dev>; Wed, 22 Oct 2025 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1761146845; x=1761751645; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zoALVDG9RnT7BAOdsnJMe54/Tt3GRwf2SgNb0DV4KSQ=;
        b=fjSQRwvMrk18k90FRWxOCUwiD9uU3nEiRSt91kGzwdB412yb7JZV35PbglcahDHEUe
         U3l71/50/zVBDDmYj6rng7I4GDtdzSjf4FMyC6XWSnxUDOV0iNMhcjpNRaRU+yPlICpD
         gU7Cx84ur2UWS0Tc3boxkj+XPYietckB/JKXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761146845; x=1761751645;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zoALVDG9RnT7BAOdsnJMe54/Tt3GRwf2SgNb0DV4KSQ=;
        b=C1GBqAdhS+Q4/PE9mOkr1/VW5BCZvQYaA3UtreHIlYZP4eE8L0UEByrIIPUPofJ92h
         0u5PrTx6YW6H0RuuODh+HRnQRhVwrZOIXGiSyXYXGRP+hilyiAOgzmNPKnUgb16R0UrA
         USRK0s8fbeWchK4IfO2AFBALVAp2AlcpM/d4o4SQ7HBvQe4iHQ1uNFmhSbX8FXEuBQ/6
         lmc1fITTmrLSl77XWIbWmlmGP0lVHo/59W1sebXeI0t1snE7QGwVxw9Wi3OdMPGHpB+4
         04DNKsudMO1Y9f9vWpPDVMd8mBvl3VS1Ewr1ZBhG/W3jtSwtuEo5oTVB8jmhgKEYRk0+
         zn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMjvU37qATnb3vS1PIkQD32BSmSdpxmJAsXOCeUAUN9nlIP2FWjHMRuAopDGlFzeDWf1yq@lists.linux.dev
X-Gm-Message-State: AOJu0YwvFgxMFAosYwPuah8OLWc41E32PTyVQXC/juDBSyXBoCNQYWpU
	4PBj7Mr09fL5LGH5SAgDWOlRCJs+MJZsd+MKWDERCM8peD98gHjHQIEKu+xWGK4VT0k=
X-Gm-Gg: ASbGncvPB+zPqGNt6Ao6ILXD80DbcaafB/xIAlpNX2U0mwbjuW0C9pcXtChe9K8+SXN
	WMwvj1KXo22qUSz0vNGFtZvkfW+XrkA56dPgm/aqn3QQXMg34qRlnlev3ceGFy6bVnbt9H0cM0b
	eHUsnLqzTzO4t7n2evTRIp2Dnce2FkaObp41UBWPZFKAPo55BhBsStiG73xjGzO2Csp8Fg1pEnu
	wSvswNsPWVMRq6lz4G/naWi2GeQCsTghfYRMHDpv+mP2t2PNFV1hKAwaomGNnH4qoeL011h5qNF
	UVv9+z8A9QNJVcbqfilejxbGEd02NmGlcokbTIVGAg0VB8dp8BW5xcoX3OSFzjTxjR7v0MRBl4v
	qZ2Cpa33KzElpoqpQPc3jOb7hWysVEFTxaosIAaJc1MtroGyR3pEJJWfel1Dz34qE7lCM5wU5mG
	PoT5CMqOZH/lOz
X-Google-Smtp-Source: AGHT+IFHrNAgETUq7iHXWj4LaXPG7j1qD4lSrv4wnohCO6eo9eW67OevdQz1fzSz9sygsvW/JqehtA==
X-Received: by 2002:a05:6e02:3101:b0:431:d76b:d133 with SMTP id e9e14a558f8ab-431d76bd17cmr27048295ab.12.1761146845007;
        Wed, 22 Oct 2025 08:27:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a964a8a8sm5288976173.29.2025.10.22.08.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 08:27:24 -0700 (PDT)
Message-ID: <cb30af9e-c22b-485a-a83c-f395880cd799@linuxfoundation.org>
Date: Wed, 22 Oct 2025 09:27:23 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] selftests: cachestat: Fix warning on declaration under
 label
To: Dev Jain <dev.jain@arm.com>, Sidharth Seela <sidharthseela@gmail.com>,
 nphamcs@gmail.com, hannes@cmpxchg.org, nathan@kernel.org, shuah@kernel.org,
 morbo@google.com, justinstitt@google.com, nick.desaulniers+lkml@gmail.com
Cc: linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 david.hunter.linux@gmail.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20250929115405.25695-2-sidharthseela@gmail.com>
 <486e0d6b-799e-4fec-9e6d-3ddfdd64418c@arm.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <486e0d6b-799e-4fec-9e6d-3ddfdd64418c@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/25 22:52, Dev Jain wrote:
> 
> On 29/09/25 5:24 pm, Sidharth Seela wrote:
>> Fix warning caused from declaration under a case label. The proper way
>> is to declare variable at the beginning of the function. The warning
>> came from running clang using LLVM=1; and is as follows:
>> -- 

Sidharth,

Make sure to not use "---" in your commit logs. Everything after
this line gets thrown away. I had to go fix it manually.

>> -test_cachestat.c:260:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
>>    260 |                 char *map = mmap(NULL, filesize, PROT_READ | PROT_WRITE,
>>        |
>>
>> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
>> ---
>>
> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> 
Applied to linux-kselftest fixes branch for next rc.

thanks,
-- Shuah
