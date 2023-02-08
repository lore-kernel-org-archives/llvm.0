Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11642C80
	for <llvm@lists.linux.dev>; Wed,  8 Feb 2023 15:36:21 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso1783167wms.3
        for <llvm@lists.linux.dev>; Wed, 08 Feb 2023 07:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKePDO+31IJoF0FsJfvZs9DXqYakl2KGMty92CUWxZs=;
        b=lDp/yheLhCJ14mwi5JBbSR5uvR8nLzGG2T2sjS6t2m0ytjQq9ZGUFLYlagTEssKD6T
         MGqhy+s3OC3RZUi8kOaE+kVadJ4FwdA58rbaDYPOEZor3ALf/C5ZzArNJ9mBtorSCuWL
         QYL+GvvCNqQXt4IVlpy7027J045UU/qqB8tyKYG1RU5Kr533K/dWShfQzdV89wWEUll8
         oGb0Cysx+ENxAvIJPI7ByaLXC3JFA8K6I9Pu0dLT5CNJrgW8hc1oU5XNnPxnhf+GGT9O
         OLWtJFCAWlzLVkfMltuQq3V8rD5PePxe2RG7hBwCXbIf90WRJzdIoqbisb4hKzjP8iH1
         uEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKePDO+31IJoF0FsJfvZs9DXqYakl2KGMty92CUWxZs=;
        b=m1N57BH0nsMfHqAPmHqW+5cyu8dukcqUnVxRWklUroM0KnxLvKU3NwOGDytv+Nipcs
         YALiLBDrSdcv4WoSbSMRdQSw+ioMo4TgPEKob5m2cldGb9PTvumVE3qpWEAKhf0F8uBZ
         l1NB7WAhQg0TO8HYTBkPeuUqMJJu1xDIDJK1WtmW9Ox0/4mg29Fw2nVonbcLFGewNihH
         w1MjQAHhB479jmhdpxOgWrM+q2YmqL4Gs5EsZ20NhRmwh3ureqDB1xO+VaEKb81Hf2ry
         hJJ/qlPX6u8/kK3iqAgalp4QeYL2zyv8MTIPVZt4tdYNCZSSZsjG/QtD+rDdaG3JyTjR
         FsCw==
X-Gm-Message-State: AO0yUKVxTFktqR6NxOACiFiwXcwe4572APwN96LgFtgu4/o4Pcj6gJFe
	2eEMpphNhg6CnKX9xUd9grsc0w==
X-Google-Smtp-Source: AK7set/jWb3OUhPaWjMNeoBplH44S4cuJjQOgCubl22jNIytV6Ym7ExQyw2dq1UJvSvr5xZQTqqhTw==
X-Received: by 2002:a05:600c:4d09:b0:3df:e549:bd27 with SMTP id u9-20020a05600c4d0900b003dfe549bd27mr7766617wmp.6.1675870580177;
        Wed, 08 Feb 2023 07:36:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm2459945wmc.13.2023.02.08.07.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 07:36:19 -0800 (PST)
Message-ID: <2b45b511-33d5-c6b0-ad4d-78e8c15392d0@linaro.org>
Date: Wed, 8 Feb 2023 16:36:17 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 6/6] Driver: VMBus: Add device tree support
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>,
 Saurabh Sengar <ssengar@linux.microsoft.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 daniel.lezcano@linaro.org, tglx@linutronix.de,
 virtualization@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org,
 mikelley@microsoft.com, ssengar@microsoft.com, dphadke@linux.microsoft.com,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
References: <1675756199-5917-7-git-send-email-ssengar@linux.microsoft.com>
 <202302081621.odizDzHG-lkp@intel.com>
 <39350ee9-c899-ba88-2e4e-103f93dcd722@linaro.org>
 <Y+O0FtUkLyvJLSrR@dev-arch.thelio-3990X>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y+O0FtUkLyvJLSrR@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/02/2023 15:39, Nathan Chancellor wrote:
> On Wed, Feb 08, 2023 at 11:25:57AM +0100, Krzysztof Kozlowski wrote:
>> On 08/02/2023 09:22, kernel test robot wrote:
>>> Hi Saurabh,
>>>
>>> Thank you for the patch! Perhaps something to improve:
>>>
>>> [auto build test WARNING on next-20230207]
>>> [cannot apply to robh/for-next tip/timers/core brgl/gpio/for-next wsa/i2c/for-next linus/master v6.2-rc7 v6.2-rc6 v6.2-rc5 v6.2-rc7]
>>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>>> And when submitting patch, we suggest to use '--base' as documented in
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>
>> All of your recent patches have build errors. Can you at least build
>> test them before sending? It's a unnecessary noise in our mailboxes to
>> get non-buildable patches, just to trigger compilation which you can
>> easily do by your own. GCC is a free software...
> 
> For what it's worth, GCC does not have a warning like this, it just
> accepts the incorrect location of the attribute, which has gotten others
> in trouble before:
> 
> https://lore.kernel.org/CAHk-=wgf+kHeSZbpkZumWcTXUD7ordqTMvPRNL6aQVG1DSBDnQ@mail.gmail.com/
> 
> So the patch probably did build clean with GCC but that is one of the
> reasons that there is no longer a compiler monopoly for the kernel ;)

OK then the patchset is reasonable/built enough.

Best regards,
Krzysztof

