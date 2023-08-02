Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361856FD9
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 17:38:03 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-522ab301692so7682487a12.2
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 10:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1690997882; x=1691602682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WyQdxgtNMG4RTFo6glKNGilpjeAOgHu/v44MBJ5lr6g=;
        b=FdGjw6HXHhZ6+Vw2hxfQAMrStQiiadvB/SsztWB+Hfj84Tz9a8e6TDptPNV8ihiSnl
         yZIQWFAs0/daQGqP59TJy+VoE7dMwfj3h/DxzVCR8pbqJY9pllhuUbq/kjebn38H5GAv
         zuFWmAEuAcogVpDQ4n1F3tMwwoQYRfOQzigX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690997882; x=1691602682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyQdxgtNMG4RTFo6glKNGilpjeAOgHu/v44MBJ5lr6g=;
        b=NPiZ5XaIuIqIffcnHdZsm/uASXmQ9+lCzQo7OiTRVRHphSH/Y8dMkSXXzk6D1oftwu
         9TfKOovW1w/fuKCBt+L8RLUIJkQwbwQBADxtRojVHDxqulnrINXNDmauIvHBwmQaA+9U
         8zxYQF/22DM2WpJvGE/oQmyKnv1CUnyUszXIm9xHvFIO8WGRzR9sI9fGkwgrFFGKJYAT
         Dfyq5npcw08SA0ATc0PJHbKw4N7FAls8QDD3e0JROpFxhZusUbD744tr7tpVXDf7kBl5
         TA2xR2dj4bwNP4EVPPzo6L+/K325dQKo3ruFIcf3XzoneZXxLuwd3rFkMnho53BKgy4+
         q0wQ==
X-Gm-Message-State: ABy/qLa8JOFc9UvbY8bzrRzYRGzEY37TFDQ6CMw4ky9nzM8wFa61quT7
	HBr/8Pgcab449Xr1I04RtFp2YKeDD7kB9L8vgAHsRs0h
X-Google-Smtp-Source: APBJJlHOH5K+clgCdTrvvk3WHiSh0WPutW8REg1OXBkjsjFw1Ju3XAwMTDdIPFJAWFXNV8sX3r9+qg==
X-Received: by 2002:aa7:dcc3:0:b0:522:31d5:ee8e with SMTP id w3-20020aa7dcc3000000b0052231d5ee8emr6113669edu.8.1690997882006;
        Wed, 02 Aug 2023 10:38:02 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id b26-20020aa7d49a000000b0051dfa2e30b2sm8860832edr.9.2023.08.02.10.38.01
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 10:38:01 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-317744867a6so57931f8f.1
        for <llvm@lists.linux.dev>; Wed, 02 Aug 2023 10:38:01 -0700 (PDT)
X-Received: by 2002:a5d:608c:0:b0:315:9021:6dc3 with SMTP id
 w12-20020a5d608c000000b0031590216dc3mr4961506wrt.27.1690997880674; Wed, 02
 Aug 2023 10:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230801-bitwise-v1-1-799bec468dc4@google.com>
 <CAHk-=wgkC80Ey0Wyi3zHYexUmteeDL3hvZrp=EpMrDccRGmMwA@mail.gmail.com> <20230802161553.GA2108867@dev-arch.thelio-3990X>
In-Reply-To: <20230802161553.GA2108867@dev-arch.thelio-3990X>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 2 Aug 2023 10:37:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjmWjd+xe88cf14hFGkSK7fYJBSixK8Ym0DLYCa+dTxtg@mail.gmail.com>
Message-ID: <CAHk-=wjmWjd+xe88cf14hFGkSK7fYJBSixK8Ym0DLYCa+dTxtg@mail.gmail.com>
Subject: Re: [PATCH] word-at-a-time: use the same return type for has_zero
 regardless of endianness
To: Nathan Chancellor <nathan@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Will Deacon <will.deacon@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: ndesaulniers@google.com, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Aug 2023 at 09:16, Nathan Chancellor <nathan@kernel.org> wrote:
>
> We see this warning with ARCH=arm64 defconfig + CONFIG_CPU_BIG_ENDIAN=y.

Oh Christ. I didn't even realize that arm64 allowed a BE config.

The config option goes back to 2013 - are there actually BE user space
implementations around?

People, why do we do that? That's positively crazy. BE is dead and
should be relegated to legacy platforms. There are no advantages to
being different just for the sake of being different - any "security
by obscurity" argument would be far outweighed by the inconvenience to
actual users.

Yes, yes, I know the aarch64 architecture technically allows BE
implementations - and apparently you can even do it by exception
level, which I had to look up. But do any actually exist?

Does the kernel even work right in BE mode? It's really easy to miss
some endianness check when all the actual hardware and use is LE, and
when (for example) instruction encoding and IO is then always LE
anyway.

> With both clang 18.0.0 (tip of tree) and GCC 13.1.0, I don't see any
> actual code generation changes in fs/namei.o with this configuration.

Ok, since the main legacy platform confirmed that, I'll just apply
that patch directly.

I'll also do the powerpc version that Arnd pointed to at the same
time, since it seems silly to pick these off one at a time. It too
should just be 'unsigned long', so that the two values can be bitwise
or'ed together without any questions.

              Linus
