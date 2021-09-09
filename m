Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF2B3FE1
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 10:53:15 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id v2so1941371oie.6
        for <llvm@lists.linux.dev>; Thu, 09 Sep 2021 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fU5ufvRRjTtfwnNvK13MR5zMOLz3I8fk1OzlUMqINLQ=;
        b=svEsGSMujFvTtR4UMtARJNXuZvz+U/550aXRIc+7UMzXzxYASPNNCNz75C6NHgXQGg
         dVJIPTelpAL58scaurL0kBQOQTMznlEy8QRnyHQfYxdvgW794LiM1IeQsfZLCEJ22GDQ
         qeYJDSw9yib0rswsAY4EiMIpR09/rniDzcmwUBU47L1cdLS7q206vZncbq5ddz/unqpR
         JjT6q7GZ3YxYt0F0WB2frZxiJ2+sILr+1ax6Ri2HSHO4/nyZOnqbiOVisCjJQDDu6QAo
         hcv1jpLE7VOWgiP2TLIVuvoIKnrgb/YQjoBfw63Ub7F4cpzR210zw6O/4AgWl9NTv+i7
         YCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fU5ufvRRjTtfwnNvK13MR5zMOLz3I8fk1OzlUMqINLQ=;
        b=knL3T/1uDH6nlNtdTlA5rkMkv1GaOKoh5eP88gXMS+HlRlCF+QRohr7gelt2EIqpcZ
         XqESsogHJHvpVzkB1D+bQUOpS3aAhGrveFGVbWjIRwBxfey3d2RWvJ7kSwtMymQotPw2
         0ZTm446994dNi0X3WSZiQouvG+d/y/nQgW0rq3wT+pMK70Ty+gTQ53hCcoxWu3/0aVPz
         MOCmdd4/fjwmB32yfWvKpHbKwwxL7TuE/dvLjR+Rz4g6SAL4A9O1tr6Ty1vsrWdxmvFF
         pD7Q98b4fqWnEXGvj/NgQhA1tn4ed+rL40wxu08+VoppGq3IPNIk9/gFWbP0uMba60Qb
         4b7Q==
X-Gm-Message-State: AOAM531TVq/KuBODgagQSehiBcMRU2wBQuISgrX4jAr0gIp+o7lZGlZN
	jF5M/HYCDDAt9ic0qR+hNePMy882PklJWrvFmJZvkg==
X-Google-Smtp-Source: ABdhPJypirAM1jjdo9XWTXuE1r/IYJFmD049z7WphsmfidtaQM2qvedJJrF7FPI9vKRmcHUWVT9heQSyJAVB96uljac=
X-Received: by 2002:a05:6808:21a5:: with SMTP id be37mr1443831oib.172.1631184794726;
 Thu, 09 Sep 2021 03:53:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net> <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain> <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161> <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
In-Reply-To: <YTmidYBdchAv/vpS@infradead.org>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Sep 2021 12:53:03 +0200
Message-ID: <CANpmjNNCVu8uyn=8=5_8rLeKM5t3h7-KzVg1aCJASxF8u_6tEQ@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Christoph Hellwig <hch@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Nathan Chancellor <nathan@kernel.org>, 
	Arnd Bergmann <arnd@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	Nick Desaulniers <ndesaulniers@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	"Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Sept 2021 at 07:59, Christoph Hellwig <hch@infradead.org> wrote:
> On Wed, Sep 08, 2021 at 11:58:56PM +0200, Marco Elver wrote:
> > It'd be good to avoid. It has helped uncover build issues with KASAN in
> > the past. Or at least make it dependent on the problematic architecture=
.
> > For example if arm is a problem, something like this:
>
> I'm also seeing quite a few stack size warnings with KASAN on x86_64
> without COMPILT_TEST using gcc 10.2.1 from Debian.  In fact there are a
> few warnings without KASAN, but with KASAN there are a lot more.
> I'll try to find some time to dig into them.

Right, this reminded me that we actually at least double the real
stack size for KASAN builds, because it inherently requires more stack
space. I think we need Wframe-larger-than to match that, otherwise
we'll just keep having this problem:

https://lkml.kernel.org/r/20210909104925.809674-1-elver@google.com

> While we're at it, with -Werror something like this is really futile:
>
> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c: In function =E2=80=98amdgpu_b=
o_support_uswc=E2=80=99:
> drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:493:2: warning: #warning
> Please enable CONFIG_MTRR and CONFIG_X86_PAT for better performance thank=
s to write-combining [-Wcpp
>   493 | #warning Please enable CONFIG_MTRR and CONFIG_X86_PAT for better =
performance \
>       |  ^~~~~~~
