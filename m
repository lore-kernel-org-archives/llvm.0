Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E929625
	for <llvm@lists.linux.dev>; Mon,  3 Jul 2023 03:58:57 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-55bac17b442so328214a12.3
        for <llvm@lists.linux.dev>; Sun, 02 Jul 2023 20:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688356737; x=1690948737;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B/PQXjkL+Ql9ozRL2pZj1FoItwIuuU1/FoM+PWBLQ0c=;
        b=bisdXdMB4kJWYFdP44MjynQlmsPMqRTKuCIHvEsf99IH14GTNQU4PIHsB3zhEhkdtZ
         dds0STQzdT4k0sh/ANI0ef7sfBS3CeFvVHJQiGac1cX3qLxc3v3guJ1wO+N9SIth+yjS
         caBUE3uPYHOzNhIJPgTUfigb8ONO4YXEyGVggrZKIWEJE5X+vNQLLWe0vuCp7VmhniUO
         P5NYwbN4+MrrS8t8ukoFwTSrQd3AnLSw7JiQckI0urh0+cmPPnOGbUysRQ+fPxzcyns3
         t6uSKt2cL9a5dy5hJHZ/uLsB1Hi7M73OUTQL3An9VJwfC3zG+Swjx9kyYMkKrXYS75Kk
         Dtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688356737; x=1690948737;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/PQXjkL+Ql9ozRL2pZj1FoItwIuuU1/FoM+PWBLQ0c=;
        b=cfUq2JF1muW/iT65y64Iy6/ildA0DMmonLYvKHw/FD245yGRW5lASKO4rihyOXutHl
         addjqvyCPETa+aqlBZAvjGcBjyu7IHukM82SkbX96M0z/jmCJUnfqyvWnCCeAYmmgBlp
         g+K8T3B3yAv2b5vGvRyu+DEeyNNBJ5OeQcusQ/w/6ve0DTQgAH5SELItrYOZn172t+n6
         zUOVDbEzwW1hMZdTw8V3/+DxfK4Xs7Z4QFTG8twzCF94OJxOWQRnn9NgOHU/91lLgzqo
         2357tHq1o2+kz2sd9kmj76iDpM0+f8KkElZ9kXfWjzyply9j1Pkv6/dNHFivKNcNML37
         dZ5Q==
X-Gm-Message-State: ABy/qLY4ugyFJd1Y8OVkWYBSjDL0BHXAlMqJGd2A22W4ePY6LonOBuKl
	li0pMO94ssSD5QX4vKf9fnI=
X-Google-Smtp-Source: APBJJlHDG2peAa+bdtQ2zpwU+zP/GyrC6Ad84+kw3JlYBIiRBiesEntfQ3PLoBApiezbXkXINLO0RQ==
X-Received: by 2002:a05:6a20:1043:b0:123:3f03:68f9 with SMTP id gt3-20020a056a20104300b001233f0368f9mr9215812pzc.61.1688356737282;
        Sun, 02 Jul 2023 20:58:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902848300b001b53d3d8f3dsm14258612plo.299.2023.07.02.20.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 20:58:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4fa56264-f188-46f9-cc77-117b469b3328@roeck-us.net>
Date: Sun, 2 Jul 2023 20:58:55 -0700
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
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <keescook@chromium.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux LLVM <llvm@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 Linux Regressions <regressions@list.linux.dev>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me> <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
In-Reply-To: <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/23 20:26, Guenter Roeck wrote:
> On 7/2/23 20:20, Kees Cook wrote:
>> On Mon, Jul 03, 2023 at 08:44:37AM +0700, Bagas Sanjaya wrote:
>>> On Sun, Jul 02, 2023 at 06:36:12PM +0200, Mirsad Goran Todorovac wrote:
>>>> Hi,
>>>>
>>>> After new git pull the kernel in Torvalds tree with default debug config
>>>> failed to boot with error that occurs prior to mounting filesystems, so there
>>>> is no log safe for the screenshot(s) here:
>>>>
>>>> [1] https://domac.alu.unizg.hr/~mtodorov/linux/crashes/2023-07-02/
>>>>
>>>> Bisect shows the first bad commit is 2d47c6956ab3 (v6.4-rc2-1-g2d47c6956ab3):
>>>>
>>>> # good: [98be618ad03010b1173fc3c35f6cbb4447ee2b07] Merge tag 'Smack-for-6.5' of https://github.com/cschaufler/smack-next
>>>> git bisect good 98be618ad03010b1173fc3c35f6cbb4447ee2b07
>>>> # bad: [f4a0659f823e5a828ea2f45b4849ea8e2dd2984c] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
>>>> git bisect bad f4a0659f823e5a828ea2f45b4849ea8e2dd2984c
>>>> .
>>>> .
>>>> .
>>>> # bad: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>>> git bisect bad 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c
>>>> # first bad commit: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>>>
>>>> The architecture is Ubuntu 22.04 with lshw and config give in the attachment.
>>>
>>> Can you show early kernel log (something like dmesg)?
>>>
>>> Anyway, I'm adding it to regzbot:
>>>
>>> #regzbot ^introduced: 2d47c6956ab3c8
>>> #regzbot title: Linux kernel fails to boot due to UBSAN_BOUNDS tightening
>>
>> I'm confused. Commit 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c isn't in the v6.4
>> tree... it's only in Linus's ToT.
>>
> 
> In ToT:
> 
> $ git describe 2d47c6956ab3
> v6.4-rc2-1-g2d47c6956ab3
> 
> $ git describe --contains 2d47c6956ab3
> next-20230616~2^2~51
> $ git describe --contains --match 'v*' 2d47c6956ab3
> fatal: cannot describe '2d47c6956ab3c8b580a59d7704aab3e2a4882b6c'
> 
> "git describe" always shows the parent tree, which I guess was based on
> v6.4-rc2.
> 

Ah, sorry, I didn't realize that the subject claims that the problem
would be in 6.4.1. That indeed does not match the bisect results.

Guenter

> Guenter
> 
> 
>> Also, the config you included does not show CONFIG_UBSAN_BOUNDS_STRICT
>> as even being available, much less present. Something seems very wrong
>> with this report...
>>
>> -Kees
>>
> 

