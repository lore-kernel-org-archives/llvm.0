Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F647374;
	Mon,  3 Jul 2023 04:38:53 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-557790487feso2897052a12.0;
        Sun, 02 Jul 2023 21:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688359132; x=1690951132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=x0S1JkZS9qbPw++EtmvPDulhpZ8OPzh6zrJYaBNGJ5E=;
        b=BZqRMUXyXM2dShSRH3UCrjwxxJ7bJsHRv5B81oEym9Ji4yYm14H3Ym3G3SZbMKCAdT
         +D5WDqfvQEpmpXDyxdWn8gKVAbH88+9tkvYnGWQjpZCAx3FfbYrLjXQChLlqTFiTit+6
         E9u4Fc9SOZn1cEiLjlpJ3aGZL9GGjuuQ/0LH1bRRcmlLze1COQQ7IO5LvJks/EvTePaA
         0A6SXxmcGXJFtTbCDAMt6OwZO7DNfpP+KvCYKsXrb1xT6Asa+b+lQh0kIfl69BIDBlkh
         aBwAbWYZFtWAp0c1zwh39Ps/P72sDyv8pTDiWrNlosnb9SXbEiA9Cme+U0qhBH4GzAe4
         /lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688359132; x=1690951132;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0S1JkZS9qbPw++EtmvPDulhpZ8OPzh6zrJYaBNGJ5E=;
        b=fXz0uFB2r6O0zyHrLNYN5hbdxA5U44YyQmVjk8DI/vIXH9+Flo8uBFi3ELwn1rHwmm
         Ny94F+Ipje0blL0r57SpalMz590TgMVjWkGpZNqoTmGcvHNwg2d2RPUdt5Gcb0ZTCTbe
         rsMExE2U33RvA/OF/oV1e+ph+FPy3hLhqQofn3KZS+yhXuNoER8xPjGfjK/u9WcLA0Sa
         EG5nEzwGC5a3Lmi02qpBIh6oO1TT+MxV0P9UEmtTlihelsUI7Ox6S0SiJPmQECC01sns
         zUP4QeWuYI5+QF1KPv+U4pt/Xlrnyk7RQ4NPuvfqKaGImPDFM9Id7jkap/W38cvWCEV4
         XbBA==
X-Gm-Message-State: AC+VfDwMH/KvU4fJE+JhN+kObDsGq4H/pQ+N6OYvWLRZhB2fcIKc70u7
	wM9yjn4rEY5bR7EMbJdb+xk=
X-Google-Smtp-Source: ACHHUZ4QxPJKcVnTdgGxLR/w7Nx8q7LX8tuuv+hDEgiF3V6OnSmd6JafVd/ilnFNFh2yvFgA2/C5sw==
X-Received: by 2002:a05:6a21:6d98:b0:10b:4539:fa0a with SMTP id wl24-20020a056a216d9800b0010b4539fa0amr14271676pzb.1.1688359132621;
        Sun, 02 Jul 2023 21:38:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e5-20020a62ee05000000b0064f76992905sm12974767pfi.202.2023.07.02.21.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 21:38:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b27f513d-38a5-5422-ba32-f2ccfdfae909@roeck-us.net>
Date: Sun, 2 Jul 2023 21:38:50 -0700
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
To: Kees Cook <keescook@chromium.org>,
 Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux LLVM <llvm@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 Linux Regressions <regressions@lists.linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me> <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
 <4ea9488c-0f98-89b4-7af3-174cfcdaa02c@alu.unizg.hr>
 <202307022115.D96AB033F@keescook>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <202307022115.D96AB033F@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/23 21:30, Kees Cook wrote:
> On Mon, Jul 03, 2023 at 05:53:48AM +0200, Mirsad Goran Todorovac wrote:
>> On 7/3/23 05:26, Guenter Roeck wrote:
>>> On 7/2/23 20:20, Kees Cook wrote:
>>>> On Mon, Jul 03, 2023 at 08:44:37AM +0700, Bagas Sanjaya wrote:
>>>>> On Sun, Jul 02, 2023 at 06:36:12PM +0200, Mirsad Goran Todorovac wrote:
>>>>>> Hi,
>>>>>>
>>>>>> After new git pull the kernel in Torvalds tree with default debug config
>>>>>> failed to boot with error that occurs prior to mounting filesystems, so there
>>>>>> is no log safe for the screenshot(s) here:
>>>>>>
>>>>>> [1] https://domac.alu.unizg.hr/~mtodorov/linux/crashes/2023-07-02/
>>>>>>
>>>>>> Bisect shows the first bad commit is 2d47c6956ab3 (v6.4-rc2-1-g2d47c6956ab3):
>>>>>>
>>>>>> # good: [98be618ad03010b1173fc3c35f6cbb4447ee2b07] Merge tag 'Smack-for-6.5' of https://github.com/cschaufler/smack-next
>>>>>> git bisect good 98be618ad03010b1173fc3c35f6cbb4447ee2b07
>>>>>> # bad: [f4a0659f823e5a828ea2f45b4849ea8e2dd2984c] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
>>>>>> git bisect bad f4a0659f823e5a828ea2f45b4849ea8e2dd2984c
>>>>>> .
>>>>>> .
>>>>>> .
>>>>>> # bad: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>>>>> git bisect bad 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c
>>>>>> # first bad commit: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>>>>>
>>>>>> The architecture is Ubuntu 22.04 with lshw and config give in the attachment.
>>>>>
>>>>> Can you show early kernel log (something like dmesg)?
>>>>>
>>>>> Anyway, I'm adding it to regzbot:
>>>>>
>>>>> #regzbot ^introduced: 2d47c6956ab3c8
>>>>> #regzbot title: Linux kernel fails to boot due to UBSAN_BOUNDS tightening
>>>>
>>>> I'm confused. Commit 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c isn't in the v6.4
>>>> tree... it's only in Linus's ToT.
>>>>
>>>
>>> In ToT:
>>>
>>> $ git describe 2d47c6956ab3
>>> v6.4-rc2-1-g2d47c6956ab3
>>>
>>> $ git describe --contains 2d47c6956ab3
>>> next-20230616~2^2~51
>>> $ git describe --contains --match 'v*' 2d47c6956ab3
>>> fatal: cannot describe '2d47c6956ab3c8b580a59d7704aab3e2a4882b6c'
>>>
>>> "git describe" always shows the parent tree, which I guess was based on
>>> v6.4-rc2.
>>>
>>> Guenter
>>>
>>>
>>>> Also, the config you included does not show CONFIG_UBSAN_BOUNDS_STRICT
>>>> as even being available, much less present. Something seems very wrong
>>>> with this report...
>>>>
>>>> -Kees
>>
>> Anyway, I have double checked and linux-image-6.4.0-rc2-crash boots while
>> linux-image-6.4.0-rc2-crash-00001-g2d47c6956ab3 freezes in early boot.
> 
> I don't understand what tree you're testing. 2d47c6956ab3 is only in
> Linus's latest tree, which is not 6.4-rc2.
> 

Maybe this ?

$ git checkout -b testing 2d47c6956ab3
Updating files: 100% (15501/15501), done.
Switched to a new branch 'testing'
groeck@server:~/src/linux-staging$ git describe
v6.4-rc2-1-g2d47c6956ab3

Guenter

> If you're testing Linus's tree, and you're bisecting to 2d47c6956ab3,
> I don't understand why the .config you sent doesn't include
> CONFIG_UBSAN_BOUNDS_STRICT (which was introduced by that commit) --
> it should be visible whether or not it is selected.
> 
>> Of course, in the next boot dmesg appears overwritten ... I could provide
>> only the first screen screenshots.
> 
> Without CONFIG_UBSAN_TRAP, I would not expect anything other than a
> warning (i.e. boot would continue).
> 
> The only other thing I can think of that seems related (the backtrace
> appears to show usb), might be this:
> https://lore.kernel.org/lkml/20230629190900.never.787-kees@kernel.org/
> which won't appears until after v6.5-rc1.
> 
>> The difference is only one commit.
>>
>> It is a bit strange so I am available for any additional diagnostics.
> 
> Thanks! Can you send "grep UBSAN .config" output for the crashing kernel?
> 
> Are you booting on an EFI-capable machine? If you could configure pstore
> to use the EFI-vars backend, you can capture the crash in EFI and
> pstorefs will show it after the next boot. (If you're using systemd,
> this all may already be happening -- check /var/lib/systemd/pstore/
> or see[1] for more details.)
> 
> -Kees
> 
> [1] https://www.freedesktop.org/software/systemd/man/systemd-pstore.service.html
> 

