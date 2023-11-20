Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCAF101F8;
	Mon, 20 Nov 2023 17:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHPRGmh0"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6c34e87b571so3667526b3a.3;
        Mon, 20 Nov 2023 09:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700500541; x=1701105341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7DEu9wGBaGGvq5Zs36Kjr8D14NYaMEEFG2vzc4iuoYI=;
        b=RHPRGmh0vrkYe7or33uESHNTS78rSLtWIpWnGFP3T2IP91BdvTT0tWjxyUyPb16LXs
         RmmXHjPe1xLCIBmzu75lO/S83BwHUPhnBAGHJRhjMyv6A5yzdLHyRMebRc29UuGN17+J
         QXp1gzhsVhf7/AHw5LxoW3/nNsepiGVl9xj4C8/cKJajmw0aYWM0pgpJkhBKnBfRefwg
         6iDVqx2EMe7ErMR65hPL0go99L/yvFJxlvlokt9gdx3u3f9K7CqlJ1po93xkjKAgfWCk
         OjtJEAHyXup2MDZOQ9XJVUmOOxxQPZc196PK9H/EE93gFuBAcBiKZNWxJi3vfNuTFPcR
         sN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500541; x=1701105341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DEu9wGBaGGvq5Zs36Kjr8D14NYaMEEFG2vzc4iuoYI=;
        b=K0WERPt9RyBU2AiVbamsn6BVgGnGKSZYGhFGQ8ows5LxuhL5JTd5mTC1lRXnKvaDLp
         1lioXDqghy1vX4Bki8+mZxtz8xQkcV4hEqEOBkmMfZv49ezLky97E0uPwEsO41QHhgPk
         aPFWG/4qRr9NeZ17bzMgi+kJIcJBK1CUrt1rnnVraXJl9HClg+3y5gTWULL3Ok0IqkJi
         pHVtnZRmIFrh0HPWAPMNhMi2NiDUuaHje0mVoaZa1wsqya+HXIPzN1wDH9uzH2SV2wv1
         6H6nUOBllAI6/bnL0/xvDObAKwv7XzJIjmJlFuBRp4hahpyxzrBFrR8LAXihMRHFkNQ0
         MzcA==
X-Gm-Message-State: AOJu0YwBN+7W+eMte6RH1+P9EfEtrnFNaR9m7xDeSICfNG3N1Dgqdd+2
	EHmpoSccEPMQoWaCf5HI3KM=
X-Google-Smtp-Source: AGHT+IHOu+aOgetiapYiSNi1W28GOFxsKTQik7+0DqE34u1BOScAggdNgyaqhHQzGYDCjOH4ZX5tEg==
X-Received: by 2002:a05:6a20:9f89:b0:187:f549:e2e7 with SMTP id mm9-20020a056a209f8900b00187f549e2e7mr7887732pzb.7.1700500541208;
        Mon, 20 Nov 2023 09:15:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a11-20020a634d0b000000b0059d6f5196fasm6292057pgb.78.2023.11.20.09.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Nov 2023 09:15:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b2c6726c-f8ee-4512-a4c0-4cb8ccab37dc@roeck-us.net>
Date: Mon, 20 Nov 2023 09:15:39 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 1467/1905] drivers/hwmon/nct6775-i2c.c:164:15:
 warning: cast to smaller integer type 'enum kinds' from 'const void *'
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202311191205.EDRfQlJF-lkp@intel.com>
 <CAL_JsqJvUXhXNsHp20V_baeRhKjvsqmiMB9w99p6j167ZViRcQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAL_JsqJvUXhXNsHp20V_baeRhKjvsqmiMB9w99p6j167ZViRcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/20/23 08:40, Rob Herring wrote:
> On Sat, Nov 18, 2023 at 9:10 PM kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
>> head:   eff99d8edbed7918317331ebd1e365d8e955d65e
>> commit: 0a7093e69c1eb508d699d6076013706b0c523597 [1467/1905] hwmon: nct6775-i2c: Use i2c_get_match_data()
>> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20231119/202311191205.EDRfQlJF-lkp@intel.com/config)
>> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231119/202311191205.EDRfQlJF-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202311191205.EDRfQlJF-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> drivers/hwmon/nct6775-i2c.c:164:15: warning: cast to smaller integer type 'enum kinds' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>>             data->kind = (enum kinds)i2c_get_match_data(client);
>>                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     1 warning generated.
> 
> I thought I had fixed all these...
> 
> However, there's also been discussion[1] to turn this warning off.
> 

This one is only seen with gcc-12+ (the exchange you cited is wrong in that
regard) and with clang. I agree that it is just noise - after all, there _is_
a type cast. Not worth arguing about, though, so I just changed it to use
a double type cast.

Guenter

