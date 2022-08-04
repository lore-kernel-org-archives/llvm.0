Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AB36AA4
	for <llvm@lists.linux.dev>; Thu,  4 Aug 2022 21:59:20 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id y13so1631546ejp.13
        for <llvm@lists.linux.dev>; Thu, 04 Aug 2022 14:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=IcNrO1+0hMqd184OyaCGXcplDsRzgmMXiA2NSTUXMiA=;
        b=DgUfEmbFi+7iccqebXv/ZmxHK9r9RdQFXNZ8Dr8nUqVqSFRu1k1i4dkyHQybTDWbVO
         sp+j5Hqj+Tzo+GWbTEgXuKCuNQljNQ9hMiFfoJp1J9Mgms1GKmSOP/+HzKIHuHs4qy4O
         3hYvbGIWtatQX31kWhmvlVBT2gIyBbOi9AxB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=IcNrO1+0hMqd184OyaCGXcplDsRzgmMXiA2NSTUXMiA=;
        b=OmT9X9pXhexlgqPPz5PHSIwBqZ+Fm7QvtK6aHnlpsBdRFo0JXKZpsIZnMLJ47QrslT
         h0poPNFMxQM1rB3Q0lNIMf8nkCZ/nY0KVRw+Pw3XjX2rY32ZtnKngr2wmMtsvuq5LocB
         75Sv7hmmca7nRpMNImaOYfEolkj9bz4YYAYdnP5AAli50fDBn4QJ1u040jasB562kz4A
         jNHrcz/xtMCiPqRdhrBXZd7OVBCBE+KTHjsxthWEXfdUrJq4t95asVawxzCgwoolTZ7o
         dBIEe7qxxHeTeiP26kQ9mYiWV8rtQRrjyiowMppbxtohd0omwfTkpjpB1tmKByCvTMg8
         F2Fg==
X-Gm-Message-State: ACgBeo2WNMHlrOVUdocVUaOEBlzpclgpdoAUG0KYzszz6sDisTdVmJmk
	B7LEPE/wYr1e0PH/IeoeDzE973NOCGIDKffn
X-Google-Smtp-Source: AA6agR6+S6Zb7Nw8L8n76bz7y5js2Px9zkLkCeZWn2+HvkHrGG61kfedG6y1U2hsA1H6TYITlZS0CA==
X-Received: by 2002:a17:907:2cc8:b0:72b:52b3:68e with SMTP id hg8-20020a1709072cc800b0072b52b3068emr2823834ejc.298.1659650358833;
        Thu, 04 Aug 2022 14:59:18 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id n16-20020a05640206d000b0043d18a875d1sm1210207edy.79.2022.08.04.14.59.17
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 14:59:18 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id h13so1249786wrf.6
        for <llvm@lists.linux.dev>; Thu, 04 Aug 2022 14:59:17 -0700 (PDT)
X-Received: by 2002:a5d:638b:0:b0:220:6e1a:8794 with SMTP id
 p11-20020a5d638b000000b002206e1a8794mr2534090wru.193.1659650357549; Thu, 04
 Aug 2022 14:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YuwRyQYPCb1FD+mr@debian> <CAHk-=whptVSSZL=wSUQJdRBeVfS+Xy_K4anQ7eQOky7XUrXhUQ@mail.gmail.com>
 <CAK8P3a2bEaExue0OtNeLa2CVzBx-1dE9w2HZ2PAV5N8Ct9G=JQ@mail.gmail.com> <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
In-Reply-To: <YuwvfsztWaHvquwC@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 4 Aug 2022 14:59:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=whpa_FJjvzWdWdSzecTbVtndbQqg35=_o+ohM3X1_xKTA@mail.gmail.com>
Message-ID: <CAHk-=whpa_FJjvzWdWdSzecTbVtndbQqg35=_o+ohM3X1_xKTA@mail.gmail.com>
Subject: Re: mainline build failure for x86_64 allmodconfig with clang
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, 
	"Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>, clang-built-linux <llvm@lists.linux.dev>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 4, 2022 at 1:43 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> I do note that commit 1b54a0121dba ("drm/amd/display: Reduce stack size
> in the mode support function") did have a workaround for GCC. It appears
> clang will still inline mode_support_configuration(). If I mark it as
> 'noinline', the warning disappears in that file.

That sounds like probably the best option for now. Gcc does not inline
that function (at least for allmodconfig builds in my testing), so if
that makes clang match what gcc does, it seems a reasonable thing to
do.

            Linus
