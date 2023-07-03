Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD8625
	for <llvm@lists.linux.dev>; Mon,  3 Jul 2023 03:26:22 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-55b83ae9be2so1111597a12.2
        for <llvm@lists.linux.dev>; Sun, 02 Jul 2023 20:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688354782; x=1690946782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCi3ZCOZhIqN8THX4Cv7Gf6ERaKKyYbnckBRgSco/C8=;
        b=kLPMwCJh2lACt6x+Ws1CsYzva7mogGOICoRypPaYJzbnBTFQekzbrrvBNhBpcwEs2i
         fA1DyvU6+MupKyIoEH/sj1QmNiXs0T8AuvJz7xGJelpdazQ9EIx+x4paj2Ih8lb1iaSX
         mFx9Lep3p9cH+85ROuUFetEqoOjBj8PLh0guqg34fu+kjNFjFA+1LDpuZW13Zdotc8J2
         vlFivZXYAcBhOtSxpPdj7QpnYmQS+3Ew5/N3ZHZvIAX9HCX0ewtGzZUgnddAd72X8eRP
         2fj6TFUR+3f9SjyM7sxjWhCNtpDMTAhMIM8F11HLhAwsOjDik6ZtQjBd0lmbBwi4pdzS
         29sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688354782; x=1690946782;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCi3ZCOZhIqN8THX4Cv7Gf6ERaKKyYbnckBRgSco/C8=;
        b=EBb4Nm+azk5c3BwpAwbAC+GbkB52ASyzQhDTJ9QQjqUdYMXLoc2Cmbd8LJWgEX+K5J
         yPBraoXqrQPpNaeg1WEMHQVb1q//WiNSw0PjeVZDUBeMwvBjpNPn/P657O95BHno+nhl
         CLiRRh+BVkF2ghS/7HHntsynr4EYfVL2S4Z9QYMzTwjySStHl3dAEq1uNjMGzABoQVob
         75+77XOFDV40kagdJqzfIIpu6dWr7D1QGuUc81P/nBniQTclVrYtGsXPIfOnbqhbdxqP
         JZkjq2k+tcXQm8OZmOHtnL8grXmVo6niZsWzW/7tjQp962Q4B1wZns6a39+ENlMQzFk1
         DUZg==
X-Gm-Message-State: AC+VfDxXS0+ACNimzgWhOluruuk52Ume0WECqE7/RW7blHTCr+OtKIhh
	TbbRsThvYVEqtYdJSKjzumA=
X-Google-Smtp-Source: ACHHUZ5f/bCVghu86OfCakjiGA/ZSpGBrHATshxdcN6yxU/LfPFOg5wbnXGLxvZl3bYVCB9sTjyXXg==
X-Received: by 2002:a05:6a20:3d89:b0:12b:e9a0:f015 with SMTP id s9-20020a056a203d8900b0012be9a0f015mr12599264pzi.17.1688354782374;
        Sun, 02 Jul 2023 20:26:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w26-20020aa7859a000000b00672ea40b8a9sm12174017pfn.170.2023.07.02.20.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 20:26:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
Date: Sun, 2 Jul 2023 20:26:20 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux LLVM <llvm@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 Linux Regressions <regressions@list.linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me> <202307022018.B26F5795@keescook>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <202307022018.B26F5795@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/23 20:20, Kees Cook wrote:
> On Mon, Jul 03, 2023 at 08:44:37AM +0700, Bagas Sanjaya wrote:
>> On Sun, Jul 02, 2023 at 06:36:12PM +0200, Mirsad Goran Todorovac wrote:
>>> Hi,
>>>
>>> After new git pull the kernel in Torvalds tree with default debug config
>>> failed to boot with error that occurs prior to mounting filesystems, so there
>>> is no log safe for the screenshot(s) here:
>>>
>>> [1] https://domac.alu.unizg.hr/~mtodorov/linux/crashes/2023-07-02/
>>>
>>> Bisect shows the first bad commit is 2d47c6956ab3 (v6.4-rc2-1-g2d47c6956ab3):
>>>
>>> # good: [98be618ad03010b1173fc3c35f6cbb4447ee2b07] Merge tag 'Smack-for-6.5' of https://github.com/cschaufler/smack-next
>>> git bisect good 98be618ad03010b1173fc3c35f6cbb4447ee2b07
>>> # bad: [f4a0659f823e5a828ea2f45b4849ea8e2dd2984c] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
>>> git bisect bad f4a0659f823e5a828ea2f45b4849ea8e2dd2984c
>>> .
>>> .
>>> .
>>> # bad: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>> git bisect bad 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c
>>> # first bad commit: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>>
>>> The architecture is Ubuntu 22.04 with lshw and config give in the attachment.
>>
>> Can you show early kernel log (something like dmesg)?
>>
>> Anyway, I'm adding it to regzbot:
>>
>> #regzbot ^introduced: 2d47c6956ab3c8
>> #regzbot title: Linux kernel fails to boot due to UBSAN_BOUNDS tightening
> 
> I'm confused. Commit 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c isn't in the v6.4
> tree... it's only in Linus's ToT.
> 

In ToT:

$ git describe 2d47c6956ab3
v6.4-rc2-1-g2d47c6956ab3

$ git describe --contains 2d47c6956ab3
next-20230616~2^2~51
$ git describe --contains --match 'v*' 2d47c6956ab3
fatal: cannot describe '2d47c6956ab3c8b580a59d7704aab3e2a4882b6c'

"git describe" always shows the parent tree, which I guess was based on
v6.4-rc2.

Guenter


> Also, the config you included does not show CONFIG_UBSAN_BOUNDS_STRICT
> as even being available, much less present. Something seems very wrong
> with this report...
> 
> -Kees
> 

