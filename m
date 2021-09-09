Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B958772
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 06:08:00 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id i8-20020a056830402800b0051afc3e373aso1145049ots.5
        for <llvm@lists.linux.dev>; Wed, 08 Sep 2021 23:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=5IZhKmYjWyUNxqS/JWropfkc5GoYoPNRqG2FrnyCWSw=;
        b=Uby1UFSqv+tObg8zy1Qt9JfEE0z4OOZS1mZrQSbWDi0jjncQe48BLUiEkCBnIT0OEH
         XZEM6zsVARUlXeVJksyht7d1Gib8J5mY4X0cwD8cLeV3nlJJKTPKqo6WI+mrt82lFgq8
         FApkveOpRQYKUP/1FEkXoO8h21Ow3ja9KPCw6IFjzKNNfU+7+afhnR/akfRpZdNGlp0T
         lcEBTEqvbbJdbdGUGw6Y+vIhtwvqzpYx3iPXFHBJw7axVEtjK/5LyF7fYiUNP8a9DCEk
         Bj0kX4U3FzIu5lmRVwoJ1aWhneyWpViN7s5hOqA/z7SRBwEVs51RxSVvIohhBbGaAJHq
         5h9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5IZhKmYjWyUNxqS/JWropfkc5GoYoPNRqG2FrnyCWSw=;
        b=ap176weusjayAFK1jICJFrkGIx81BKWnHrYa8C5th9EsQdMvvqoL+rEH/qo1Kj9xq8
         nx0rY9e4Q+MtOfjwNsOVqdJ+cOzLxoLN+sVxpZ636t/W++17pxkEakhYJFlkvAEGbdgh
         meYZoVDuWL2huB9FS07IkspIUaPVOurkXRc8Qz2AikirVJtSh3jZYR4tjcgZdkfCPlFf
         o8CQr2TimhmCDXRpXkVHWHr8GB/vbEUqrqtdwIjuigKMKQ8uBQDRDjrcAVexOCtXshGz
         uZfKU/8FV4poa+Q+T6DvXWbZJqDdLXPmhHscoucvxIt4843g2NZX7l3fE6PSSeQZScm4
         RKRw==
X-Gm-Message-State: AOAM533ZYuRKM6bPAyTgqhpqexpvM56D4t75r18tXYdKXb5h9MYKo3Vp
	YAqxLuoNmez7f5SCCKJAKYE=
X-Google-Smtp-Source: ABdhPJz2e0pQIKzbERrP4yOrC1kq1zJGwp23agv3qtyCHWfk+VzWPFR9D44RgTj57Sc8MlD8s8FyJg==
X-Received: by 2002:a05:6830:4084:: with SMTP id x4mr1039349ott.280.1631167679964;
        Wed, 08 Sep 2021 23:07:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y7sm180455oov.36.2021.09.08.23.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 23:07:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Christoph Hellwig <hch@infradead.org>, Marco Elver <elver@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com,
 Christian =?unknown-8bit?B?S8O2bmln?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a04c4c37-7151-ef7e-09ce-a61ac7b12106@roeck-us.net>
Date: Wed, 8 Sep 2021 23:07:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <YTmidYBdchAv/vpS@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/8/21 10:58 PM, Christoph Hellwig wrote:
> On Wed, Sep 08, 2021 at 11:58:56PM +0200, Marco Elver wrote:
>> It'd be good to avoid. It has helped uncover build issues with KASAN in
>> the past. Or at least make it dependent on the problematic architecture.
>> For example if arm is a problem, something like this:
> 
> I'm also seeing quite a few stack size warnings with KASAN on x86_64
> without COMPILT_TEST using gcc 10.2.1 from Debian.  In fact there are a
> few warnings without KASAN, but with KASAN there are a lot more.
> I'll try to find some time to dig into them.
> 
> While we're at it, with -Werror something like this is really futile:
> 
> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function ‘amdgpu_bo_support_uswc’:
> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:493:2: warning: #warning
> Please enable CONFIG_MTRR and CONFIG_X86_PAT for better performance thanks to write-combining [-Wcpp
>    493 | #warning Please enable CONFIG_MTRR and CONFIG_X86_PAT for better performance \
>        |  ^~~~~~~
> 

I have been wondering if all those #warning "errors" should either
be removed or be replaced with "#pragma message".

Guenter
