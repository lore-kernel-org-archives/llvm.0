Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC6183977
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 21:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717103623; cv=none; b=QWVI69yyBir1KzMXuYJT/k1gJW5gTm4+7W+C03D++MGat+dxSoNK9olxUhPPS19CNr7M4dAmYV4HSXv4vBBgyPOLz2SV2XAO7L7ix8FEoChHIlX02CddzZLqzOdJpK10N4w3eNP3aLjmztmoKRekAIUBXt6Ya+iQ0Z10xoCCwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717103623; c=relaxed/simple;
	bh=KF2KZFt7KqXZHK0uvHeIz9ZPa10L9lrpUZ+5YMf1XCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXPbGmBYi3tjCC9BAgwVIGZHJx13pjrE8BMvjjM94TrerM3YSw+8XWm4oaSLyMl4sfFZArOIj6yf3tXuF76aimDEVPqUGTkyHvtgBmlGnPQGwZ1Oemc00WFVF/Ix5zdDU1O9YfQ/CGRi7hQP2qvkkVGaAC56EyQd/G04LpRnOLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KBy2nEZp; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KBy2nEZp"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-36dd6cbad62so783485ab.3
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 14:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717103621; x=1717708421; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cc22q3I70MPueAnmKsTkHjW1R6pGbLRcvceT5HSMS2c=;
        b=KBy2nEZp7Q+LF7ocogWo13unoqKMOhbvbGQUfUb3TFguvZpSBcsdb8i83y/oC/Gjb5
         VJZXpcAMzKea11DNoUoyyNN4mbAehQaEdU8HyRkAJuoavuhXjQ5+c0G9wWKgGsgYQNn0
         TH9zutcXLEcboZK7z9iYNdjVBw9GmDBxrA9tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717103621; x=1717708421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cc22q3I70MPueAnmKsTkHjW1R6pGbLRcvceT5HSMS2c=;
        b=cEs6kWddwPWrM47vrKFe9cfvqg8oBqDo+FJ3OgBjkUsVDZjdQ3dsjiJ3RguEqZQKW4
         iBxv1LC7e976PzfLSZy0rJuaPR+LWr5dAeaZxmk5zHqKUZ53YGpK1GU2IINDHOxJADVz
         sQG3B1ZpQuw8PzixRx2eLimUcjRzin7O1H+RXPALWCj0foOAjzFzvys/vBBwEiNROgrh
         pKG3IrHfJae53Kn7cnuub/pmCnPSSU+BpV0UR8AEc85lzA0wx3pwWuQfq0KYzYk3zcqc
         Ch5XRTLyck70aum6hCmTJE8z+NBxEs1eG0gWndHFyCZFqdlqt1hL/xA4+feAUGGUW6EZ
         Pkww==
X-Forwarded-Encrypted: i=1; AJvYcCVeRxyj+QQVFqWvmqlAw9o/yyCURbBdgzOd92jvMvY9oaNXAFDJLcEVIxg46PEecvlvOJDvGX6O6UVUR+Y38wqMQjhV3Q==
X-Gm-Message-State: AOJu0YyFh0cZYGewO97sUOruNzN6U8lWlUVAt0IbKxD9yLn9e5Oc/8fo
	qjxptyscq9tz92JXY0YOurolWamfa/36FTbdhrNDWRATplLcdWf/blsr9xbXemQ=
X-Google-Smtp-Source: AGHT+IEpQILx8LWmHPHqM2sy4iJv5pqIjurHEv49PTQSqq85xRqucuPLELtBfibS3cv3oIO0UwlOVQ==
X-Received: by 2002:a05:6e02:1d07:b0:374:88c6:385b with SMTP id e9e14a558f8ab-3748b9d096bmr894325ab.2.1717103621456;
        Thu, 30 May 2024 14:13:41 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b48cd014dcsm115065173.157.2024.05.30.14.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 14:13:41 -0700 (PDT)
Message-ID: <b245cd0a-8a87-4169-b0de-e4f6ce6984c6@linuxfoundation.org>
Date: Thu, 30 May 2024 15:13:40 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] selftests/futex: don't pass a const char* to
 asprintf(3)
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Edward Liaw <edliaw@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Nysal Jan K . A" <nysal@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240529022938.129624-1-jhubbard@nvidia.com>
 <20240529022938.129624-3-jhubbard@nvidia.com>
 <94fe2649-8def-4f2a-ba5f-19ae8a4226bf@linuxfoundation.org>
 <f0a1ca78-f94e-4f02-a5e0-ef9d610fac07@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <f0a1ca78-f94e-4f02-a5e0-ef9d610fac07@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/24 13:16, John Hubbard wrote:
> On 5/30/24 12:04 PM, Shuah Khan wrote:
>> On 5/28/24 20:29, John Hubbard wrote:
>>> When building with clang, via:
>>>
>>>      make LLVM=1 -C tools/testing/selftests
>>>
>>> ...clang issues a warning, because test_name is passed into asprintf(3),
>>> which then changes it.
>>
>> Please include the warning in the commit log.
> 
> Ah, OK, the warning is:
> 
> futex_requeue_pi.c:403:17: warning: passing 'const char **' to parameter
> of type 'char **' discards qualifiers in nested pointer types
> [-Wincompatible-pointer-types-discards-qualifiers]
> 
> 
> Please let me know if you'd prefer a v3, or if you'd rather fix it
> up, whatever seems easiest for you.
> 

Yes please send me v3.

thanks,
-- Shuah

