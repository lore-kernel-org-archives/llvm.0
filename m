Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347B74C63
	for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 18:09:44 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id u6so14002235eda.12
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 11:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=z1E8GnokuPUf7Vf8jyRFI0tVUIIyZ4+J29LO62NqtGs=;
        b=f7YWVinSY8ScIRzGU6IKFd1NVHvyN+OHFUCMQySl/7XI8jTIEO/r5Oc2amLrrPyIkb
         Yq9Lodmd2qHYkOGWQqVBFQjnzkuEXv8IPwvbOGA62FnA7BVt9ACIGyIOBNMA6u9tDI+A
         VgeBPNnVKcOJxRAdEckzFxiEJNdYLTy0qPiT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=z1E8GnokuPUf7Vf8jyRFI0tVUIIyZ4+J29LO62NqtGs=;
        b=KxIpKZcu6r+zun4dcC7vUSF02sswgyXh/D9Q7kUw01Lx2L5BICL6tSY16HVnVgjaJY
         uQnIkt3XNiCQ4Tnm10ExJa57L1TEvYEL5jCuoUX13U4G4Mn2M5k+R0ETgWoEkdPoGMPR
         blQJxlpPLapV9B6UizEbOw6TzQmfxnbO4Pb5sipI2jSw1ld4feGZq8RDvYTl2tGXCh0Y
         7Als2K0vNVQs/d1W/z4qjaBEboPBPTo1uKt3pKu1MIS3CTEP5dWmBE0ZJDgpwyk6ykXC
         ftvXaS8H8n78EhoHa1rAqqgtv2iWdKuaedl2bqGz87R6B5H/gjRvOXgq8Q7WdeTVvrPL
         RTuw==
X-Gm-Message-State: ACgBeo0tKLxOjgRlUO4Y+WvWGrEEavX7Zd4Z49J3kLt7Vjisez3hrc9S
	sZ6ibFNctQLzVQH5w4kkxFTvzDz+5ZSp90Tv
X-Google-Smtp-Source: AA6agR7fLWkGco4no2104vInudrdqUjKYcIdkXH0k/4OXwYOaBUeC3O9PA6KWkpe7MLiJ69e4i5HOg==
X-Received: by 2002:aa7:ccd5:0:b0:445:cede:7936 with SMTP id y21-20020aa7ccd5000000b00445cede7936mr4625159edt.223.1661278182154;
        Tue, 23 Aug 2022 11:09:42 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id kx1-20020a170907774100b0072ffbbc3341sm128184ejc.204.2022.08.23.11.09.38
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 11:09:39 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id h24so17949457wrb.8
        for <llvm@lists.linux.dev>; Tue, 23 Aug 2022 11:09:38 -0700 (PDT)
X-Received: by 2002:adf:b343:0:b0:225:1a75:2a9a with SMTP id
 k3-20020adfb343000000b002251a752a9amr13812698wrd.281.1661278178479; Tue, 23
 Aug 2022 11:09:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YwSRFzQQKAXP2ncp@debian>
In-Reply-To: <YwSRFzQQKAXP2ncp@debian>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 23 Aug 2022 11:09:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjn1=Gyi3Jxw4V0A=fXpOu5e1StPoyu52A6DHmbT+auzA@mail.gmail.com>
Message-ID: <CAHk-=wjn1=Gyi3Jxw4V0A=fXpOu5e1StPoyu52A6DHmbT+auzA@mail.gmail.com>
Subject: Re: mainline build failure for loongarch allmodconfig with gcc-12
To: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Tom Rix <trix@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 23, 2022 at 1:34 AM Sudip Mukherjee (Codethink)
<sudipm.mukherjee@gmail.com> wrote:
>
> I have been trying to build loongarch as part of my nightly builds, and
> I can build loongson3_defconfig without any error. But allmodconfig fails
> with the error:
>
> In function '__cmpxchg',
>     inlined from 'ssh_seq_next' at drivers/platform/surface/aggregator/controller.c:61:9,

Looks like ssh_seq_next() wants to do an atomic cmpxchg() on a single
byte value, and the Loongarch implementation only does 4- and 8-byte
versions.

It looks like loongarch - from its MIPS heritage - inherited the "we
can't do atomics on byte variables", so that it needs the same strange
"do bytes as word accesses with mask-and-shifts".

For MIPS, the code is in __xchg_small() in arch/mips/kernel/cmpxchg.c.

Alpha has something similar, except it's all done in inline asm in
arch/alpha/include/asm/xchg.h (look for "____cmpxchg(_u8," in there.

Of course, we could just add a Kconfig variable like
"ARCH_LACKS_BYTE_ATOMICS" and make that driver depend on it not being
true, and just have Loongarch set it.

But I think loongarch should just implement the byte masking stuff.
Particularly since I suspect it can just copy the MIPS code as-is.

                  Linus
