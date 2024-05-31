Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B481779BD
	for <llvm@lists.linux.dev>; Fri, 31 May 2024 20:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717187799; cv=none; b=AlHB2qxSQgxcDa0+CKsZ1JuLm54r/4VZ2LuEUIKJwawsF7oS/Qno1X7TkyG1N6m+GAJ1HuVq+lU1QXb25DxArMxR6mRw5TcPlonD/DuWRHfZaDN0Aq9hLYZB2HgaE9e6LmvmPgto3JZJDqLMiPS+K4ov0sQ/BzQodZo3sooYop0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717187799; c=relaxed/simple;
	bh=QT8jsy9BjKZNv8X9KAnXUdxKec2WrNfhYs2tkh8Z9n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UXoMovl4Ehg27opqD3k3GPgHQY4ALUCVsQcGGK2CTTv85AUJbrBfMr5aHY1hRLY5bh/T2DogMXJyH6s6PXZU2rtPf7V3XUGMe05SiHpkPy1LXGtjC8dK7dGsznQ1tCJFI0dU2LYxCSeQBGNYEtzIFwDJ7mJcXlnmrXZoJeOFqmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QaS/YEuV; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QaS/YEuV"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f480624d10so20525255ad.1
        for <llvm@lists.linux.dev>; Fri, 31 May 2024 13:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717187798; x=1717792598; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=twLijwTOj4W6ARqqInAp+sh1XdnAFooJeHYSV2DKonw=;
        b=QaS/YEuVsHa6xp8FcCO2T1ogmUniyrPGwlTvtLPxxo3Ubk3VOG07HbCJ0BkXMugi5H
         GBmolaxv53a54qiqiIMdigtyZB6ZUe1X+9XQx9ggeiLOXSvolwUeDMvUK3JGshC/fgYs
         XyETwcjO/qgXNa25SboYTA7fqpHfSLX7052LKadXEKRxv8Mem2inHx7hNRLdBheOqETX
         znWJ5sr5crcTG3VxhXQnSle6l6bbMz17OxirV3RTM2lMAzeZvnl7WYaefb0JJo6ZvxJ8
         E9dCAKFg1hNQ5HPDxf6gwj84tKhIy5K+6mtRHT6zuKtOyGGkZabEs/HBkk3TXEKy+RAd
         XemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717187798; x=1717792598;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twLijwTOj4W6ARqqInAp+sh1XdnAFooJeHYSV2DKonw=;
        b=wKu8uw0/WXpclsgu7bXOAsFhJRZc/Zo+SSYLzAzpjE8ph5RWbhTYhGoMdrcQPdKVX7
         CaRkcPuorYikfHCR17AH/IDMYVKkkCTJfG7/LAm5rFKPLphNRkY5ogB3t82N5I72w+GO
         pmOqYweAeNje1MEMFs1eM9kIEJNSM/bPTgudiRjl0X1hb3jM+32zdh5Igapxlm3VKsgS
         4Bq+UqTiohWCmmzoBAFrpeQoppUa2Lh7jV7cyeFS9FtaT23OL2xwnspDW4oi7NjrjdQI
         h2HwjWATr3K+MhJhDoxBjnOJpTAVRENp2zwYJzqxR3xs2CoF/XCC1GrmnaoSBm2Cw1w3
         uicg==
X-Forwarded-Encrypted: i=1; AJvYcCX4tSAfPvXisF/yUaCUgq4ATAUQKjr9qOs4SftUp5Fj3R3YdH+nBVd4RxmyvlejzQ4T8DzsbvlQUYH2PSoLHx9/GAA0Vw==
X-Gm-Message-State: AOJu0YzTUdD5VdJqcYOwedLiZm/OG+CMOomP92hfSkAfaLBdIIKn2SP+
	zmcEPoJ1jnOMU7u+aLxXkDLDhrgdx4Yum4EzbAYqx5NmnFILGaAW
X-Google-Smtp-Source: AGHT+IHHP8QAg76F7jjbJT2bI58nRgcqFgYuv5Qk4QfOSBQI34clBHl68Uk4KCQNaiw4SFdV18/XsA==
X-Received: by 2002:a17:902:ed54:b0:1f3:ea4:7ed6 with SMTP id d9443c01a7336-1f6370e66fdmr27847175ad.61.1717187797708;
        Fri, 31 May 2024 13:36:37 -0700 (PDT)
Received: from Gatlins-MBP.lan ([2001:558:6025:79:9460:fb03:8dbb:8b69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f632413e63sm20862525ad.276.2024.05.31.13.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 13:36:37 -0700 (PDT)
Date: Fri, 31 May 2024 13:36:35 -0700
From: Gatlin Newhouse <gatlin.newhouse@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <bhe@redhat.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Changbin Du <changbin.du@huawei.com>, Pengfei Xu <pengfei.xu@intel.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Xin Li <xin3.li@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] x86/traps: Enable UBSAN traps on x86
Message-ID: <5yx5aykf77x2gufpaf4nlrdhiqh6ioiqicazp4wq6dosu6d62g@xmj62qw7xa7q>
References: <20240529022043.3661757-1-gatlin.newhouse@gmail.com>
 <c068193b-75fb-49d2-9104-775051ffd941@citrix.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c068193b-75fb-49d2-9104-775051ffd941@citrix.com>

On Thu, May 30, 2024 at 01:24:56AM UTC, Andrew Cooper wrote:
> On 29/05/2024 3:20 am, Gatlin Newhouse wrote:
> > diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> > index a3ec87d198ac..e3fbed9073f8 100644
> > --- a/arch/x86/include/asm/bug.h
> > +++ b/arch/x86/include/asm/bug.h
> > @@ -13,6 +13,14 @@
> >  #define INSN_UD2	0x0b0f
> >  #define LEN_UD2		2
> >  
> > +/*
> > + * In clang we have UD1s reporting UBSAN failures on X86, 64 and 32bit.
> > + */
> > +#define INSN_UD1	0xb90f
> > +#define LEN_UD1		2
> > +#define INSN_REX	0x67
> > +#define LEN_REX		1
> 
> That's an address size override prefix, not a REX prefix.

Good to know, thanks.

> What information is actually encoded in this UD1 instruction?  I can't
> find anything any documentation which actually discusses how the ModRM
> byte is encoded.

lib/ubsan.h has a comment before the ubsan_checks enum which links to line 113
in LLVM's clang/lib/CodeGen/CodeGenFunction.h which defines the values for the
ModRM byte. I think the Undefined Behavior Sanitizer pass does the actual
encoding of UB type to values but I'm not an expert in LLVM.

> ~Andrew
