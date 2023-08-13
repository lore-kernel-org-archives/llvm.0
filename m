Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259021FCC
	for <llvm@lists.linux.dev>; Sun, 13 Aug 2023 12:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1691931597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xx6IS/2QmZwgaFnutuM14/dSOdQ9YI2iAsu/U1we0B4=;
	b=YPPZZwanZX+8uOYhZmR2PkvtgIJx4z6o8n5+aWlkEC1D0bAOe+yrlIA6DbtVbYwJ1w70Uv
	ICvpakexG1W6/ETMGLJ6+IPorP8R/qdsmZ0kdmukNy84R7e2+X4F6CIuYgCUiJBXaRsOSx
	v0KXCKu8+S2NXUkMQGjA7rR19r7QmwY=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-RCXk5kuRPBezhiw3yOCcFQ-1; Sun, 13 Aug 2023 08:59:55 -0400
X-MC-Unique: RCXk5kuRPBezhiw3yOCcFQ-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4fe32cab9b7so3260209e87.1
        for <llvm@lists.linux.dev>; Sun, 13 Aug 2023 05:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691931593; x=1692536393;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xx6IS/2QmZwgaFnutuM14/dSOdQ9YI2iAsu/U1we0B4=;
        b=QEQGM6cEf0OeCB4qjqU4p11h1uwD9PLmbrQH8v8MQNrQJ+mzGn1pwLRqc8JiGz8GJH
         6wlFV8YIEu9Z7OoN4BrTr+2l2eF/c2yHv+58eMSAh3w3fHjaaj9Qw2vznCK5LlHeCPEa
         1jRYr4AY6qBIrVBgbEvf2zXUjhDzjiCTXEQDgObr6KHNa6nSKs8Qpd7+cKP88/QroBRK
         2e4QEAzkApzty5UZMe2fPTNndYAjirqn301wvKVhILVX8oegzNAigW1lme8OZFiy0RKw
         5g8TxaQC1qkWgbWCgtOc3zjhA6lndjSXQ2fO+vfXZQbSqJt0wA35LqmHf0QkkFLnNBgs
         Vggg==
X-Gm-Message-State: AOJu0YwP9CJShziiLDdSSCZ+5L3EmEAJdwh6Koc/rxM8ow5ffWRpZOk5
	hsXo8m1e5TLydJ8hSYHofY2AwFiNEShL1aqYEFL3n1qk4cMs0evRuCuW42fV+F7HC94H/HvM02r
	PHotXgL7hm5ypUQ==
X-Received: by 2002:a05:6512:703:b0:4f8:49a7:2deb with SMTP id b3-20020a056512070300b004f849a72debmr3342617lfs.8.1691931593760;
        Sun, 13 Aug 2023 05:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYOgMTF9w4RxpDr/YwX5EdgnQ8YlkvmBjUKO1Nsu7whTwP2ooxmuiYVX4g2c/9uHKGSebWBg==
X-Received: by 2002:a05:6512:703:b0:4f8:49a7:2deb with SMTP id b3-20020a056512070300b004f849a72debmr3342608lfs.8.1691931593439;
        Sun, 13 Aug 2023 05:59:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i23-20020a1709061cd700b0099293cdbc98sm4595094ejh.145.2023.08.13.05.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Aug 2023 05:59:52 -0700 (PDT)
Message-ID: <68b690bd-f232-0637-a621-9126a189dd0d@redhat.com>
Date: Sun, 13 Aug 2023 14:59:52 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] platform/x86/siemens: simatic-ipc: fix nonsensical
 condition
To: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>
Cc: Mark Gross <markgross@kernel.org>, "xingtong.wu"
 <xingtong.wu@siemens.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 Henning Schild <henning.schild@siemens.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee@kernel.org>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20230811130948.2211800-1-arnd@kernel.org>
 <97764bad-7091-e9ed-6f49-d31861fc622f@linux.intel.com>
 <ef7d94a4-9f65-47fb-906a-4fed4480d020@app.fastmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ef7d94a4-9f65-47fb-906a-4fed4480d020@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8/11/23 17:02, Arnd Bergmann wrote:
> On Fri, Aug 11, 2023, at 15:17, Ilpo Järvinen wrote:
>> On Fri, 11 Aug 2023, Arnd Bergmann wrote:
>>
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> The condition checking for a constant SIMATIC_IPC_DEVICE_BX_59A value
>>> clearly makes no sense, as clang warns:
>>>
>>> drivers/platform/x86/siemens/simatic-ipc.c:132:42: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
>>>                 if (ledmode == SIMATIC_IPC_DEVICE_227G || SIMATIC_IPC_DEVICE_BX_59A)
>>>                                                        ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
>>> drivers/platform/x86/siemens/simatic-ipc-batt.c:197:49: error: use of logical '||' with constant operand [-Werror,-Wconstant-logical-operand]
>>>                 if (priv.devmode == SIMATIC_IPC_DEVICE_BX_21A || SIMATIC_IPC_DEVICE_BX_59A)
>>>                                                               ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Most likely, this was meant to check ledmode to be one of the two values,
>>> so change it to that.
>>>
>>> Fixes: b8af77951941e ("platform/x86/siemens: simatic-ipc: add new models BX-56A/BX-59A")
>>> Fixes: c56beff203754 ("platform/x86/siemens: simatic-ipc-batt: add support for module BX-59A")
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Ok, I see. I missed those as there is hasn't been a new linux-next in
> a few days.
> 
> I suppose this one is also fixed then?
> 
> WARNING: unmet direct dependencies detected for P2SB
>   Depends on [n]: PCI [=n] && X86 [=y]
>   Selected by [m]:
>   - SIEMENS_SIMATIC_IPC_WDT [=m] && WATCHDOG [=y] && SIEMENS_SIMATIC_IPC [=y]
> drivers/platform/x86/p2sb.c:68:9: error: call to undeclared function 'pci_scan_single_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]

No that one has not been fixed yet. This is the first time I've heard of this one. It seems to not have been caught by the LKP bot.

Regards,

Hans


