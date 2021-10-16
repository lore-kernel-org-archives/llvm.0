Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7A62C81
	for <llvm@lists.linux.dev>; Sat, 16 Oct 2021 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634419010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vuVl/Lm9y3LUoPVRoQC3DsmftxQZFqWY4bGxbzZzkc4=;
	b=iasP3ZHPuOytZ6xlRgMHw/JkUZvnbGKn/k64wW5DQp8LvjPCvKEqhKrQ3ibOPHhiVA+C3b
	OuZz+bKp+Gbu6+GKhd93ig6BLL2IVdJQqdBbtYGq0fGB5+7oGjnMkFs+ZmwXS1gk587qpk
	KreiS7TepxMvl5CR1sqYYz7jT38ti10=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-xguQglGOPNmGkmWvhuMAUw-1; Sat, 16 Oct 2021 17:16:47 -0400
X-MC-Unique: xguQglGOPNmGkmWvhuMAUw-1
Received: by mail-oo1-f72.google.com with SMTP id o8-20020a4aabc8000000b002b601d1fb33so5751365oon.23
        for <llvm@lists.linux.dev>; Sat, 16 Oct 2021 14:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vuVl/Lm9y3LUoPVRoQC3DsmftxQZFqWY4bGxbzZzkc4=;
        b=SYojOSCWtFafUNKM5UfakFoU+0g6QoJBgHrQRfpxXTYamsQyT8yt8vX77xEFuhCvZi
         Wwcm8fWxyz7Bxv6oAbsSxiWS+JJ74s1sG2TViHcbcZHD0SFgMfbF1GJlXYQq2XJqNpjR
         Rvo6NAr28CIh82UHLlmFktU66gnh6+BotGCoKwcXgJTb07VQFMazo7OrBK9X8EsEtTEd
         H4+CMmaIdPSnVbA/7Nvyoo37sD8Ci0xFcMU/mSEX1zAeEi+v6zeEfBtjsGayOKrLLf43
         mrEU+TsW1W/K+qm6zvdeybg/dDyIM4vDbaL/VwODOiyILDOFjVeGvov0bzwiUtT2V+rO
         JsvA==
X-Gm-Message-State: AOAM532jy2+LzREGN/mm4f7K5xS6QhtEoFkdJyq6S+vK4EB+G14VsFHF
	ztm8vifvQplVcKJ4b44UYIiqGVDwGfpXP1B+ElpsRxYLbTihfKjYufLght2+3l2U6w4vuiGeigq
	wZ/ZlA2tPmmC/Hg==
X-Received: by 2002:aca:60c5:: with SMTP id u188mr17386271oib.87.1634419006554;
        Sat, 16 Oct 2021 14:16:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBX20oEuac4tZkLH0fjEqXPtWWEkbBGKJ/9HICffJyOCrhjoT616RBoDQWmMMJitU2vuhYxg==
X-Received: by 2002:aca:60c5:: with SMTP id u188mr17386265oib.87.1634419006377;
        Sat, 16 Oct 2021 14:16:46 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id f8sm2040834otp.63.2021.10.16.14.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 14:16:45 -0700 (PDT)
Date: Sat, 16 Oct 2021 14:16:43 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Andy Lutomirski <luto@kernel.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-hardening@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 03/15] linkage: Add DECLARE_NOT_CALLED_FROM_C
Message-ID: <20211016211643.h5ylg3hlhnzbee2u@treble>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-4-samitolvanen@google.com>
 <7377e6b9-7130-4c20-a0c8-16de4620c995@www.fastmail.com>
 <8735p25llh.ffs@tglx>
 <87zgra41dh.ffs@tglx>
 <CABCJKuc+mN4vw_sanZQKcb1=SyfT4h3JK2wpBuaB2qZH3Croxg@mail.gmail.com>
 <87wnme3pbv.ffs@tglx>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <87wnme3pbv.ffs@tglx>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sat, Oct 16, 2021 at 12:17:40AM +0200, Thomas Gleixner wrote:
> For actually callable functions, by some definition of callable,
> e.g. the clear_page_*() variants a proper attribute would be definitely
> preferred.

See my last email, clear_page_*() has nothing to do with CFI in the
first place.

> That attribute should tell the compiler that the function is using the
> register arguments correctly but is not suitable for direct invocation
> because it clobbers registers.
> 
> So the compiler can just refuse to call such a function if used directly
> without an inline asm wrapper which describes the clobbers, right?
> 
> But thinking more about clobbers. The only "annotation" of clobbers we
> have today are the clobbers in the inline asm, which is fragile too.
> 
> Something like
> 
>  __attribute__ ((clobbers ("rcx", "rax")))
> 
> might be useful by itself because it allows validation of the clobbers
> in the inline asm wrappers and also allows a analysis tool to look at
> the ASM code and check whether the above list is correct.
> 
> Hmm?

Functions are allowed to clobber rcx and rax anyway.

The clear_page_*() functions follow the C ABI, like (almost) every other
asm function in the kernel.  I think there's a misunderstanding here, as
most of this doesn't have anything to do with CFI anyway.

-- 
Josh

