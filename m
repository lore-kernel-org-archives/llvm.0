Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EF7176251
	for <llvm@lists.linux.dev>; Thu, 30 May 2024 21:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717103580; cv=none; b=hUtsDc78SkU7ya5REcus3q30Y4ELD4kUoeR5Tw7WjTSHZWONeE0hR4FFCbFwAXvHahqbzx9y3sb3gEpYkDiU3nIjxHVtUEsBorIEKcJwqVXqwsH5hfj15LzJt6JtYRvDD4zPuynrXorw8Ow7156JaDItdfCcOp5pK17d7t8vFME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717103580; c=relaxed/simple;
	bh=nyif9nV5MZxEv61ZzzS4YP56t1CRAFYYagtsWILkqWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMNgQjmC7erh5Vg9JpiscN0G0ETr62GXHewnTUO66F23QvfiJ1xpdAsAe96eAx9d2sGPPgJ4J8iFLJRBLDHCUu06NrueOo9CqMgoSs9Mb23kKxPt7IhH14lbPY8cPPZhfDm+Oz+oJ9EgD+Ui0ckkJw8588vIoojaecCrpPecQlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J946szNA; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J946szNA"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-36dd6cbad62so782905ab.3
        for <llvm@lists.linux.dev>; Thu, 30 May 2024 14:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1717103578; x=1717708378; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bnFlTPs2pgPgYgNKGfWbxk0F5NtAH0V5NFqN7FXOABc=;
        b=J946szNASCS0piNhBlleF0uKa0IvmYCOjBeyOrZqgjfnegHp84mGiCfJhURL/OTpX2
         83d4WfKBsf6RCSMgXKRNFodAkrD0M1X0jIfOu4YfTUmQfUH8+zq8N6/FpuylX6BstvB9
         UWFVpf21937loW46R+vAsBfhklyn81/XA69PI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717103578; x=1717708378;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bnFlTPs2pgPgYgNKGfWbxk0F5NtAH0V5NFqN7FXOABc=;
        b=N7ZIxElKv923BvNAS9T5I4G7gBqMR7cagktk4d3JbqEgKSgCddJ5GEpTU6iW2fym2c
         QBOUUm1yDj9oss4S4mBCgOe+hW1g3Thw8V96t2wSPV1gnDQMHgm71jolJCK/DVAWuufE
         sDVvsd4D046zcLuR0R/5Ig/YG/1YwXUV8ENOdT69+8U/5207z/JQJKl5V3S8Qx8IrAqX
         UielugiAOf3XZepdVKTQw1qTKasXBLNhyUVznFua0F4H97/MC/YCadMskC1jH2bzWCMa
         tYxyi3b5zPOl0ktrDxgnd0QZqM2WFRcj+aGQIQXrpVBG5i7Z0hfkn6qnvIKZYn6OtaV5
         JWNw==
X-Forwarded-Encrypted: i=1; AJvYcCXcYxC1vN60z5WW/Q1Mc1l+THfB6hx3xc/A4PbqTorsVX3pUx+Qgl1d+ZZ7+D+9QK4ZXhlSmlzQazz8Zxtn7BsUlA3veg==
X-Gm-Message-State: AOJu0YyTDvgoDTWgUFQETlmv8Yy3TMqtTqbDZUTckx1xEYzZkGLdnouD
	HQPltvBPHyhfiL8Rdim6KtAzyQFlp5wAFY9/t3IDpBxGaf5WzW83LQVEMEdPrdQ=
X-Google-Smtp-Source: AGHT+IGdrW7VRbsLHIIM7gzHL5CfKiNx8Q+kkXA5ZXqU7ioxsuz8AxYlMvZPYH9q+VjuZBtG61SjrA==
X-Received: by 2002:a05:6e02:1a0a:b0:374:60da:64dd with SMTP id e9e14a558f8ab-3748b96e509mr906225ab.1.1717103577901;
        Thu, 30 May 2024 14:12:57 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3748a27a27bsm1084115ab.87.2024.05.30.14.12.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 14:12:57 -0700 (PDT)
Message-ID: <3db9068e-9f95-4ad9-86fa-e24b06da8828@linuxfoundation.org>
Date: Thu, 30 May 2024 15:12:56 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] selftests/futex: don't redefine .PHONY targets
 (all, clean)
To: John Hubbard <jhubbard@nvidia.com>, Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Edward Liaw <edliaw@google.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 "Nysal Jan K . A" <nysal@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Valentin Obst <kernel@valentinobst.de>, linux-kselftest@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
References: <20240529022938.129624-1-jhubbard@nvidia.com>
 <20240529022938.129624-2-jhubbard@nvidia.com>
 <ceb9182e-b6d4-4f6d-bb53-87efe5337230@linuxfoundation.org>
 <20ebb3a6-cdbb-4ffc-9ba2-c9eaa4d6ec74@nvidia.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20ebb3a6-cdbb-4ffc-9ba2-c9eaa4d6ec74@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/24 13:13, John Hubbard wrote:
> On 5/30/24 12:03 PM, Shuah Khan wrote:
>> On 5/28/24 20:29, John Hubbard wrote:
>>> The .PHONY targets "all" and "clean"  are both defined in the file that
>>> is included in the very next line: ../lib.mk.
>>>
>>
>> What problems are you seeing without this patch?
> 
> Code duplication. It's a sin. :)

Please mention that you are removing duplicate code.

futex Makefile overrides CLEAN - just making sure it
does the cleanup correctly.

thanks,
-- Shuah
