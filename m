Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5357326D63
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 18:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292067; cv=none; b=uNDdYZs+9LMJveSaIdqolhruRfOkF7zWN3rbbyZnQbN6bVJvyr3Tti0lHk7HHJcu2qdbhICXNCu4/XhKkMxcdfdLLeQuWYjxfDgRHFQYutlJyuIdpBg3iCBRH87lZO2Thn/1Ur9rDhxbkCz2CDkH4yJHww+YGEWpVaPl5iIVQmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292067; c=relaxed/simple;
	bh=xzNhZ3CusPSO1J1Znrn+UVizVz7JUvH/VJLig13VWCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tPAGXvoF3K0DfF/k0MMdE4YDfb1q9Cp+r1rNui/VmJiZbwMUHYonZnWAIH9TzDAWkddwC/NOrqqbBX+ho8JIacpxoayLIs4VgZUTy1IHVzNEwsT7o0sFjT76+b2zgBvD0LcTUzNtA/5hXZ76u8hsSE65EiQaPHQkR8we7wzvR8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RxAXQb0C; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RxAXQb0C"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35b95e21ccaso2324925a91.0
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 11:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774292065; x=1774896865; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=R/LIDRHoOR5nh8Q3fCWPthR73ZHHv9nmxljWeuQGw2A=;
        b=RxAXQb0CDkdiz9t6Nvx7QCH2w7ERzsAlGU46JREHFkYslYqzmNi5nzgW/H0x/pEQ1Q
         CDQXQqvrIDiUrlStkP+rPGk4Yw4gwgUbsnyE3ZBAqgMcuMmiKc44SeBJs9N6n/oANDXV
         j8WurydCBMa1mkL4hm2OyLqRjp5zeEx/BnJg1JpYTR63VaqA6GVsOo4mEeB9PGZzS6XB
         q529aQwDmfPkTzFK5PeeWW6IwvbsFCvO2FEN64yL5q7UoWIkuAoHHClguhhq6VDR/Xly
         mm9fF38kP8AzgS6HTyOZEhrJDi7CtUT8LNp+DhOuGIDg/aKOs+4yRUCPCjqz9GOTphwk
         cbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292065; x=1774896865;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/LIDRHoOR5nh8Q3fCWPthR73ZHHv9nmxljWeuQGw2A=;
        b=n4mi0E7l895iyBxDnh+zoGpCS/laotGumyF0ROGdZwvyAJr5a9ftfXwFNXO2uBaV4X
         zGXuUHRdXRImG/8ajsIwp7RR6T0oF53A7Oi+/NPGQOiSxurNOiDqEh9nr4Q7gW+d0nDB
         Kf6w/+bBjdYDtu41uyHimVoTHaRD/Fo7UXZgZRsd/Ou0hig+k5hCvtoE+RZW4man3LSI
         Y4orzZtQHZdJ7K7ZDmJLtZoy6UFAroOyRgrLVX/Ix4xsZTb2VhEGKXbaPgc7y2OzPTe6
         CeRlxcTDUx/qQWPjr9aHTohwR4M6FZH8GenUiCm6ATlkL3tzAAcKcjdI21boKp3f9zZd
         +FKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWg/rUzwQSzyhSlJlNg+O3mwnw52RBXvOFNsHBURqlp/n4j7e+7Yy5r8Tx5zOz2qLKbt5w@lists.linux.dev
X-Gm-Message-State: AOJu0YzPgkLwawD+0ULbV59O+cgOm7MwDiwV4rqxd2QXtwhVrn1hGLSd
	BFrFbYrjHGOIpz3DVcAs6WaDPAhpegW/RRwclI3R06GMzBLIi7/nZ5q5yNRM1w==
X-Gm-Gg: ATEYQzx2zVN7laeOn8S10ET9RctznotbMHtlMC5wpAGXPW5qE6+6QRkrezW634j7eI9
	4NEKs6XV+MddTxJUd0qfWc6qu/t3lyN5uhcYSRy9sKSzN4HS5nmG5OCFPXd5uaGYEZWAa95eeRO
	WHXEhXTgnJClHg/TwwvC9LQmKb2V9v8Ut/3gNQ3yBXvLNh+fyOuPGXKO0RY/EaDgLXrI3MbdryR
	AsYc0fEID/6bn014ZO4+1y1WPnOIOqMG7uSo32OhzBbQMBzoN1Hnlp8msEGyJwSPv0pSS2WbdvC
	uinNMYENG/f7wLk3yJvi2eAhF9aWu7QFcFNvDshy32f2Kr1+7DS42bUC2I649TkBbPe22vgAp/n
	uaR84Suyyf8JcFR98+HLukIRz48TAQ4K6WqNA0zswsY6mXU0v+jFjnIIbxYksI+3HMDpLEnaMwP
	gjUGky/oS6pbYc/bixSy2xLP9dsV7xceCfjnoWObIRHk4/8Avnc1esMDYQNd5yVSvXWKzp+kTd
X-Received: by 2002:a17:90b:3dcf:b0:359:8957:7285 with SMTP id 98e67ed59e1d1-35c007be70dmr432915a91.3.1774292065020;
        Mon, 23 Mar 2026 11:54:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd3eb46e3sm9800649a91.1.2026.03.23.11.54.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 11:54:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6cef4665-1678-41f4-9199-8e226f26e6b9@roeck-us.net>
Date: Mon, 23 Mar 2026 11:54:22 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
To: Akhil R <akhilrajeev@nvidia.com>, lkp@intel.com
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, fredrik.markstrom@est.tech,
 jonathanh@nvidia.com, krzk@kernel.org, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
 miquel.raynal@bootlin.com, oe-kbuild-all@lists.linux.dev,
 p.zabel@pengutronix.de, rafael@kernel.org, robert.moore@intel.com,
 robh@kernel.org, smangipudi@nvidia.com, thierry.reding@kernel.org
References: <202603230124.VFt6CPBe-lkp@intel.com>
 <20260323184207.68515-1-akhilrajeev@nvidia.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323184207.68515-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 11:42, Akhil R wrote:
> On Mon, 23 Mar 2026 01:47:20 +0800, kernel test robot wrote:
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on next-20260320]
>> [also build test ERROR on linus/master v7.0-rc4]
>> [cannot apply to i3c/i3c/next rafael-pm/linux-next rafael-pm/bleeding-edge groeck-staging/hwmon-next v7.0-rc4 v7.0-rc3 v7.0-rc2]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-i3c-Add-mipi-i3c-static-method-to-support-SETAASA/20260322-174037
>> base:   next-20260320
>> patch link:    https://lore.kernel.org/r/20260318172820.13771-5-akhilrajeev%40nvidia.com
>> patch subject: [PATCH 04/12] i3c: master: Support ACPI enumeration
>> config: sparc-randconfig-002-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/config)
>> compiler: sparc-linux-gcc (GCC) 15.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202603230007.WOMwklQ6-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     drivers/i3c/master.c: In function 'i3c_master_add_i2c_boardinfo':
>>>> drivers/i3c/master.c:2449:23: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Wimplicit-function-declaration]
>>      2449 |                 ret = acpi_dev_get_resources(adev, &resources,
>>           |                       ^~~~~~~~~~~~~~~~~~~~~~
>>           |                       acpi_get_event_resources
>>>> drivers/i3c/master.c:2455:17: error: implicit declaration of function 'acpi_dev_free_resource_list' [-Wimplicit-function-declaration]
>>      2455 |                 acpi_dev_free_resource_list(&resources);
>>           |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>>     drivers/i3c/master.c: In function 'i3c_master_add_acpi_dev':
>>>> drivers/i3c/master.c:2556:9: error: unknown type name 'acpi_bus_address'; did you mean 'acpi_io_address'?
>>      2556 |         acpi_bus_address adr;
>>           |         ^~~~~~~~~~~~~~~~
>>           |         acpi_io_address
>>>> drivers/i3c/master.c:2563:14: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Wimplicit-function-declaration]
>>      2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
>>           |              ^~~~~~~~~~~~~~~
>>           |              acpi_has_watchdog
>>>> drivers/i3c/master.c:2563:34: error: invalid use of undefined type 'struct acpi_device'
>>      2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
>>           |                                  ^~
>>>> drivers/i3c/master.c:2566:15: error: implicit declaration of function 'acpi_device_adr'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
>>      2566 |         adr = acpi_device_adr(adev);
>>           |               ^~~~~~~~~~~~~~~
>>           |               acpi_device_handle
> 
> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
> are present in acpi.h. I think the bot checked this patch individually,
> or did I miss something?
> 

Did you try to build this code with a sparc cross-compiler ?
Because, as far as I can see, the functions are not declared or available
if ACPI is not enabled (or available, as with sparc).

Guenter

