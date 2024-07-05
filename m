Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A0E6125
	for <llvm@lists.linux.dev>; Fri,  5 Jul 2024 18:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720203023; cv=none; b=L87msMaMCNPcNxM32zTbmL6+bT1kPPD0vS8oiLBVcT+ODcSkumauT4sP+TZHdW4D2drkqA9WqLl3FOJ8T7fdK6Zoix/ujZU58Erb0wI4CFfu1/7HdyCJbK4cAGvDlqIWsOuEt3VGToGVaF0JuZTTNou4GRbinu015Vdj1inA3Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720203023; c=relaxed/simple;
	bh=7dKVWzFhqcdwTAHOJrZFlh1/32PUtLe6VOINCqyYYYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=glEXHaJ/hGz8OpJjZ8Pm0jkymCJ//4yRrbkOFzNz8j004EY0g9zb7yraRW8XAaeJX1JUIeywmrdMFziai8b99RxcGkcgnBj06UJ6u8jSoP2MYQ012SEyq4BPAucpAUaVUV6g8+h+gEHHzz2lfGgcxfADntaYZ0HDBpxYjkmZQPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BbgMPBWj; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BbgMPBWj"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-380d8ba4548so1247115ab.1
        for <llvm@lists.linux.dev>; Fri, 05 Jul 2024 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720203021; x=1720807821; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gfT5A5m5TRLHFfKNa8cuOS8hGTJVflloANcGwiwozfY=;
        b=BbgMPBWjO+I0IfHgf2F6HTo11nZjAnd5pNkhN5oPxRoNcojydTdPz15dXUfluQAVOe
         ojz3ALNistjV2Zk5mfCJNTjDPSDIpm/dw511aZb/VbjEzmhd0mGvtbccAQu89a8MA1Ag
         /ZCaz6CwAvXANL8U9cl5K0gb2Fg4EKxuhdP/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720203021; x=1720807821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfT5A5m5TRLHFfKNa8cuOS8hGTJVflloANcGwiwozfY=;
        b=ZVOhS7aPhpVEaIo7cnsH3CDPvP+0bIsAdzV9PJDUArbe/Efinb8OPPjpQrI21cShBe
         DAty0DYxRporBmtPdDQjLY2t4sTS8C8nc43srcURPbUo3y/oD3/g8za/NwN86S8cFoGO
         peCbYy1GdED80z/rpgnYhEAcExl/f42c0a2SAiyghS91vVpfjzF73Xk27w6cxWYqcYKq
         Dy/nvq0Fkbc8vIZhv3kxJV4D7LwuVACKeEQWhuIH4m/okCRb2hwqb/yne3ytgNOwS2Wa
         7OEzjW5CQEokv6bFcf9FOwhU1PCMkUmTNQtRPkOL6NFnGguCdocWJFdtMsyTcQ7Pfi7n
         nuAw==
X-Forwarded-Encrypted: i=1; AJvYcCVyj5d8xDf7NBGolP+69CMXcugbSTjCJn0l9SD9Pi98knwdhBCFp2LaJwoj1GJETCbyB5UgtLipSrFl/D/ePR4H10nozw==
X-Gm-Message-State: AOJu0Yzlq3bpi2kGiPMtKZjhy4pT+5yWsrWBnU/qTIrIP8pOOzYPTH8x
	Aw04dp5a9lhfSjpFTMyHFTNVk0qyrsELrWrghIYWLVMRRgXlkhv8hGwHn+CrDBw=
X-Google-Smtp-Source: AGHT+IEmjNDu/+i49etUyMQh25KpJihMcsAHI7NWFylJpgwGEGQ9bSlSjqPT+ZyYcP/4mAxoJLiM4Q==
X-Received: by 2002:a05:6e02:13a9:b0:381:c5f0:20d5 with SMTP id e9e14a558f8ab-383953e23c4mr71729995ab.0.1720203021379;
        Fri, 05 Jul 2024 11:10:21 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-37ad2f41329sm38763435ab.50.2024.07.05.11.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jul 2024 11:10:20 -0700 (PDT)
Message-ID: <38852b52-7ea5-431a-b946-b0dc6bb54e7d@linuxfoundation.org>
Date: Fri, 5 Jul 2024 12:10:20 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] selftests/mm: remove partially duplicated "all:"
 target in Makefile
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Colin Ian King <colin.i.king@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240704023324.83564-1-jhubbard@nvidia.com>
 <20240704023324.83564-3-jhubbard@nvidia.com>
 <9b59fc84-2d78-4304-9f39-3a495e438af8@linuxfoundation.org>
 <da35faba-b6c7-42bd-86a1-57328ebc9ad8@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <da35faba-b6c7-42bd-86a1-57328ebc9ad8@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/24 11:58, John Hubbard wrote:
> On 7/5/24 10:53, Shuah Khan wrote:
>> On 7/3/24 20:33, John Hubbard wrote:
>>> There were a couple of errors here:
>>>
>>> 1. TEST_GEN_PROGS was incorrectly prepending $(OUTPUT) to each program
>>> to be built. However, lib.mk already does that because it assumes "bare"
>>> program names are passed in, so this ended up creating
>>> $(OUTPUT)/$(OUTPUT)/file.c, which of course won't work as intended.
>>>
>>> 2. lib.mk was included before TEST_GEN_PROGS was set, which led to
>>> lib.mk's "all:" target not seeing anything to rebuild.
>>>
>>> So nothing worked, which caused the author to force things by creating
>>> an "all:" target locally--while still including ../lib.mk.
>>>
>>> Fix all of this by including ../lib.mk at the right place, and removing
>>> the $(OUTPUT) prefix to the programs to be built, and removing the
>>> duplicate "all:" target.
>>>
>>> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
>>
>> Why does the summary say mm ?
> 
> This is a mistake. I was also preparing some mm work at the time,
> and typed the wrong thing.
> 
> Could you fix it up to s/mm/vDSO/ for me? Or if it's easier, I can send
> an updated patch, let me know.
> 
> 

Send me updated patch - it will be easier that way. I saw the note
about getting these into 6.10 - As soon as you send the patch I will
apply them and send them for 6.10

thanks,
-- Shuah

