Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6232168
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 12:17:35 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id l25so5583548wrb.13
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 04:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ohcfovccatjc30lDRcB2IuIrGBvRWfvjPU9QBrd0eXE=;
        b=V9c8dDmXSfsabiD2MId/xdQkhc1ypm2tNSgpNroSiTuvYZW7U0dsWTyMIa6VL4QJ1F
         O6GRDav6qCi+i8OSKsQ0jmxN5EbpY9uNnqR8f0IKwpU9uaLbxCYm4AJWVoT3hHa05fKk
         4nPOtZqigrHY1mYoB7dt143fFsnf86znEcxoDlmFc5UNocVCF+zAzp501U1sPVA5mmww
         Be6jNLeRq2aOjZ9zLEVtqLUN4Zc0jQlww+aFa/9Ds+HSwWp6mC5Dz1SwgqoIcVTjfYnK
         2ciGkMqXxnI4C/WJLSQs+zfnlRSP1N5gL9zzYbroiQqAOSIylcboQPyJ1rw16hQAYfHx
         7MPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Ohcfovccatjc30lDRcB2IuIrGBvRWfvjPU9QBrd0eXE=;
        b=hmvy+CPOO+D4kAyBC2XZhEQEvYrFnj3CYP4/3aUaKlwinq3U0emwlNlH1TrGNATybS
         4duNuIEhpCr9D3DTAsjH08mTKHdnZelTP2XZEOIYfITq7uE+lo1t09DOD0mK0sZxUxqM
         lEZ1slwRbVHjpxPSRbRjLu9KorTFA41G5ekd2v/nFNXgEM/Uxge4DJKynOQ38wJKAjja
         i6/HBxw4LC/WGPek4q24dEHtZA/ttFqOJjPEesx3MHh1NEXYIuWUap14QONxM/1U9ldV
         +mT+Es1R5RDA/15PcuFZeA4iTRds2zxq4qF0NqSKz9kNuQhV1eqAM7WCiXSjSm4/6nBu
         bAEA==
X-Gm-Message-State: AOAM5314Y0XracQQNdwRlzKHk2/sp6bm0kTw/3Hb2Xq1RkWY1TtoqrBu
	T5b+WnPFOzTCq7g4s+lfQyY=
X-Google-Smtp-Source: ABdhPJwFDk2SLOyQmmgllC7CCS/eqLk9g3liE0EfOLpUi0/bBgkUryOYqauZ+Sh2FV7K6fL/YJREkQ==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr56773031wrr.465.1641644254049;
        Sat, 08 Jan 2022 04:17:34 -0800 (PST)
Received: from gmail.com (84-236-113-171.pool.digikabel.hu. [84.236.113.171])
        by smtp.gmail.com with ESMTPSA id o8sm1637297wry.20.2022.01.08.04.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 04:17:33 -0800 (PST)
Sender: Ingo Molnar <mingo.kernel.org@gmail.com>
Date: Sat, 8 Jan 2022 13:17:31 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S. Miller" <davem@davemloft.net>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Al Viro <viro@zeniv.linux.org.uk>,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0000/2297] [ANNOUNCE, RFC] "Fast Kernel Headers" Tree
 -v1: Eliminate the Linux kernel's "Dependency Hell"
Message-ID: <YdmA2/BJPK7m3d7d@gmail.com>
References: <YdIfz+LMewetSaEB@gmail.com>
 <YdM4Z5a+SWV53yol@archlinux-ax161>
 <YdQlwnDs2N9a5Reh@gmail.com>
 <YdSI9LmZE+FZAi1K@archlinux-ax161>
 <YdTpAJxgI+s9Wwgi@gmail.com>
 <YdTvXkKFzA0pOjFf@gmail.com>
 <YdYQu9YxNw0CxJRn@archlinux-ax161>
 <Ydl6MATrfA1GA0G+@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydl6MATrfA1GA0G+@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> * Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > 5. Build error in arch/arm64/kvm/hyp/nvhe with LTO
> > 
> > With arm64 + CONFIG_LTO_CLANG_THIN=y, I see:
> > 
> > $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 defconfig
> > 
> > $ scripts/config -e LTO_CLANG_THIN
> > 
> > $ make -skj"$(nproc)" ARCH=arm64 LLVM=1 olddefconfig arch/arm64/kvm/hyp/nvhe/
> > ld.lld: error: arch/arm64/kvm/hyp/nvhe/hyp.lds:2: unknown directive: .macro
> > >>> .macro __put, val, name
> > >>> ^
> > make[5]: *** [arch/arm64/kvm/hyp/nvhe/Makefile:51: arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o] Error 1
> > 
> > I was not able to figure out the exact include chain but CONFIG_LTO
> > causes asm/alternative-macros.h to be included in asm/rwonce.h, which
> > eventually gets included in either asm/cache.h or asm/memory.h.
> > 
> > I managed to solve this with the following diff but I am not sure if
> > there is a better or cleaner way to do that.
> > 
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index 1bce62fa908a..e19572a205d0 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -5,7 +5,7 @@
> >  #ifndef __ASM_RWONCE_H
> >  #define __ASM_RWONCE_H
> >  
> > -#ifdef CONFIG_LTO
> > +#if defined(CONFIG_LTO) && !defined(LINKER_SCRIPT)
> >  
> >  #include <linux/compiler_types.h>
> >  #include <asm/alternative-macros.h>
> > @@ -66,7 +66,7 @@
> >  })
> >  
> >  #endif	/* !BUILD_VDSO */
> > -#endif	/* CONFIG_LTO */
> > +#endif	/* CONFIG_LTO && !LINKER_SCRIPT */

In any case I've added your fix to the fast-headers tree, with a comment 
that this might just be a workaround.

Thanks,

	Ingo
