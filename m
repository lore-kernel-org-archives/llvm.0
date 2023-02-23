Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3E29A2
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 16:18:11 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id e10so5492974ilu.4
        for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7ieouCKWdhpuzaMjYjba2gKOz+Qqhrfpk7U3BSTOec=;
        b=No6oKmfN4x6eJuUxjeg+awuo12e0WHfh/o+SY7h8nvNY5mihD6tx+PByXEq8TXcUFv
         p/AQtsWPFO1Oh5/nYjJwspByaFBaXrGOHX0OZp+LYGXypYnHP/KOkJG0YnALaVzOp5O8
         /aqh6TC0HgBkV5syOKaGqznjtsV73tEHk9eb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7ieouCKWdhpuzaMjYjba2gKOz+Qqhrfpk7U3BSTOec=;
        b=WvSh2xBn8IxaEIffKF8nK4YG2FkMNHKtcGKAC2OiTF6dfz542o1FnSvvjN6GKbVRx7
         G2017PIwG3FuOguUwaPU7fdq673h+hAL2LNkY2l96SRS1ELQ1YcCISlTbhlHw2IHYrID
         7uYbuBeUJrsMDtNDA7rYb3SptuuFi7xK2YoZarZC+y2r2NWW2KLfMONaL8pw8khzR8Zi
         1NlQPvAaWipu3OF7sou+ET959Vr1H00AhxYv5UoKkluONOcRrt6S0Yt0qSktYPHJ18cQ
         RpweKvpbCjjLgo6CRY0AMV75s5BIhp+pEvA+LFjt2+C+Heh85FGoIYYP+Eh7JVTo4utV
         MBaw==
X-Gm-Message-State: AO0yUKXWb0oZ7x851MXVqFg5r7bzqFOsR/f45Ucyg1mYkUOcSbS0GSKQ
	XaT5OKp+1hBYb/rK7q5i6LziMg==
X-Google-Smtp-Source: AK7set8qhFbJuco+MFTgNVRUaFsTJ95/BcGOdXwLieY1yZ/ZZdlBgdiqTnYID406G66YejOhPIBrcA==
X-Received: by 2002:a05:6e02:1051:b0:317:4fc:a70c with SMTP id p17-20020a056e02105100b0031704fca70cmr862681ilj.0.1677169090588;
        Thu, 23 Feb 2023 08:18:10 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id m18-20020a056e020df200b00315785bfabfsm3546590ilj.47.2023.02.23.08.18.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Feb 2023 08:18:10 -0800 (PST)
Message-ID: <b1552656-7af0-42cf-017e-df919b0d0585@linuxfoundation.org>
Date: Thu, 23 Feb 2023 09:18:09 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5.15 00/37] 5.15.96-rc2 review
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
 patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
 jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
 srw@sladewatkins.net, rwarsow@gmx.de, llvm@lists.linux.dev,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20230223141542.672463796@linuxfoundation.org>
 <CA+G9fYuhcaYO1m29-9vQr-HK7_xJYouAAkM=ouMYzOBk+otCVg@mail.gmail.com>
 <d8032a63-64e2-0769-55d7-60f9b2f46a01@linuxfoundation.org>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <d8032a63-64e2-0769-55d7-60f9b2f46a01@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/23/23 08:45, Shuah Khan wrote:
> On 2/23/23 08:40, Naresh Kamboju wrote:
>> On Thu, 23 Feb 2023 at 19:46, Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>>>
>>> This is the start of the stable review cycle for the 5.15.96 release.
>>> There are 37 patches in this series, all will be posted as a response
>>> to this one.  If anyone has any issues with these being applied, please
>>> let me know.
>>>
>>> Responses should be made by Sat, 25 Feb 2023 14:15:30 +0000.
>>> Anything received after that time might be too late.
>>>
>>> The whole patch series can be found in one patch at:
>>>          https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.15.96-rc2.gz
>>> or in the git tree and branch at:
>>>          git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.15.y
>>> and the diffstat can be found below.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Following build warnings / error notices on 5.15-rc2
>> anyone see these build issues ?
>>
>> scripts/pahole-flags.sh: 10: scripts/pahole-version.sh: Permission denied
>> scripts/pahole-flags.sh: 12: [: Illegal number:
>> scripts/pahole-flags.sh: 16: [: Illegal number:
>> scripts/pahole-flags.sh: 20: [: Illegal number:
>> scripts/pahole-flags.sh: 10: scripts/pahole-version.sh: Permission denied
>> scripts/pahole-flags.sh: 12: [: Illegal number:
>> scripts/pahole-flags.sh: 16: [: Illegal number:
>> scripts/pahole-flags.sh: 20: [: Illegal number:
>> scripts/pahole-flags.sh: 10: scripts/pahole-version.sh: Permission denied
>> scripts/pahole-flags.sh: 12: [: Illegal number:
>> scripts/pahole-flags.sh: 16: [: Illegal number:
>> scripts/pahole-flags.sh: 20: [: Illegal number:
>> sh: 1: scripts/pahole-version.sh: Permission denied
>> init/Kconfig:97: syntax error
>> init/Kconfig:96: invalid statement
>> make[2]: *** [scripts/kconfig/Makefile:87: defconfig] Error 1
>>
>>
>> Need to bisect
>> -- 
>>
>> commit 54fab3cc806aec70d7ce8440e511d56bd53a4081
>> Author: Nathan Chancellor <nathan@kernel.org>
>> Date:   Tue Feb 1 13:56:21 2022 -0700
>>
>>      kbuild: Add CONFIG_PAHOLE_VERSION
>>
>>      commit 613fe169237785a4bb1d06397b52606b2967da53 upstream.
>>
>>      There are a few different places where pahole's version is turned into a
>>      three digit form with the exact same command. Move this command into
>>      scripts/pahole-version.sh to reduce the amount of duplication across the
>>      tree.
>>
>>      Create CONFIG_PAHOLE_VERSION so the version code can be used in Kconfig
>>      to enable and disable configuration options based on the pahole version,
>>      which is already done in a couple of places.
>>
>>      Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>>
>> -- 
>> ls -l   scripts/pahole*.sh
>> -rwxr-xr-x 1 naresh naresh 610 Feb 23 21:03 scripts/pahole-flags.sh
>> -rw-r--r-- 1 naresh naresh 269 Feb 23 21:03 scripts/pahole-version.sh
>>
>>
>>
>> -- 
>> Linaro LKFT
>> https://lkft.linaro.org
>>
> +1 seeing the same:
> 
> ./scripts/pahole-flags.sh: 10: ./scripts/pahole-version.sh: Permission denied
> ./scripts/pahole-flags.sh: 12: [: Illegal number:
> ./scripts/pahole-flags.sh: 16: [: Illegal number:
> ./scripts/pahole-flags.sh: 20: [: Illegal number:
> 
> 

Okay figured out problem now. scripts/pahole-version.sh isn't executable.
Once I made that change make is working now:

chmod +x scripts/pahole-version.sh

thanks,
-- Shuah
