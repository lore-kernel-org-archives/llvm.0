Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABDA33CF
	for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 20:36:10 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id i15-20020a17090a4b8f00b0020073b4ac27so11109616pjh.3
        for <llvm@lists.linux.dev>; Tue, 27 Sep 2022 13:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=nyIWb4q49IeRBcTdaBjFbYmydjE1/zTC63oz1D9JAPw=;
        b=D9gQBmNQxGxcJOTmKOJ6kVMZFCat4w9oz+/TgZOTgP6RLidu+QNs96yw4wo1nU9LIZ
         MwgougQ2dAsE432LNtdp5lTY9XjiD3QB9TsieStF5Z47LwLvjJzCGuHkABhr4fmKRMFa
         +1RATpr78eb95vQbWQFgjhqPh5bgKqaUdfOEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=nyIWb4q49IeRBcTdaBjFbYmydjE1/zTC63oz1D9JAPw=;
        b=aoBKKL3bLK4vpUU7Lw49gIf5r9NeZmUw8kM94Fyti0zkVi2YRdi1F8eWTEqzOSL8L7
         uX/FlmQ2dOrzaGSqsGSbdKsPfn7r+FOIqO5CMALK4E+l+/OMD3NdbbQoIuSxrX7BGlPu
         XUg/BlZfvsTXZ2i7pNIXU5sLYmbCizHS0z7LY5mFFO6Vd/LUi77eK71ge+OFhinvDWaZ
         ZMKYWnzVsL8xFw4jLxb4BZhVlQy3/yoiGeRTTFu4VwemXWcymlIQHfKciKNjvvvf/P4G
         r8sy4sc/cg1812bXnHsXgQxgYi5OdBkTQX5eb6iRIC2bRUL6YPP/L5d66HtxmzfY7Sa4
         Xudw==
X-Gm-Message-State: ACrzQf1G9rR4ufh4XuNstbgDw+JUfuZm1qvr8pl07W/Pa5VVSm0aIwZt
	Y0y9euUfscWkfd/CSNzA3p68CQ==
X-Google-Smtp-Source: AMsMyM4/besCCSzwpapZhfgCreYILpz2wG59A5E6/aSquAbWLFKw/y3HhPXq4IFXjBsBBepUb0cQTQ==
X-Received: by 2002:a17:90a:e513:b0:200:2275:2d27 with SMTP id t19-20020a17090ae51300b0020022752d27mr6483019pjy.162.1664310970338;
        Tue, 27 Sep 2022 13:36:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902f38900b001783f964fe3sm1941280ple.113.2022.09.27.13.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 13:36:09 -0700 (PDT)
Date: Tue, 27 Sep 2022 13:36:08 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	llvm@lists.linux.dev, Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH v2] x86, mem: move memmove to out of line assembler
Message-ID: <202209271333.10AE3E1D@keescook>
References: <CAKwvOd=a+0VNP-d=mHnbM4ujdtPrujru4dxHtfDo+EEM+b6deg@mail.gmail.com>
 <20220927172839.3708280-1-ndesaulniers@google.com>
 <202209271143.7B7D15D@keescook>
 <CAKwvOdk1QM4iZqEVj5MzTW3jMr1FiD_0C065Kub=EHKnH+xNaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdk1QM4iZqEVj5MzTW3jMr1FiD_0C065Kub=EHKnH+xNaw@mail.gmail.com>

On Tue, Sep 27, 2022 at 01:01:35PM -0700, Nick Desaulniers wrote:
> > Found it (need to use %di instead of %dx). With this changed, the kunit
> > test passes again:
> >
> 
> That was stupid of me, I updated the scratch register operand in the
> instruction 2 before the one at issue and forgot to update the operand
> for the register in question, breaking the swap.

No worries! It meant I got to do a very careful review of the port. :)

> Off thread, can you show me how to run the kunit tests, please?

It's literally just what I put in the original email. KUnit is super
easy to use. In the root of the kernel source tree, just run:

	./tools/testing/kunit/kunit.py run --arch=i386 memcpy

Without --arch, it'll default to um.

-- 
Kees Cook
