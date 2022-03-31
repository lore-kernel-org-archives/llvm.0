Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D54EA2D
	for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 17:31:16 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id s13so718102ljd.5
        for <llvm@lists.linux.dev>; Thu, 31 Mar 2022 10:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=37DeCDWlzdqkrXbAxfAuhXVMiTsGHz0hz+oO3LlsSAk=;
        b=OpXbfuoWXGtoVCxlYREjKa12nC/ZS5c6WIcrnkI8eccbmu5/uLBWGYimttqpYS8VW3
         +7YGiaqEFrS3FpnuX2EDtUfr5SLVwwJS16vOz9O1xs7VQoRsqwXQVyTm2DHS+HBbUKJW
         JcnKmGiKnrrFpcQsKy0swpAqSluMvhVusfDjp7x4US+WiiiWR7htYGSSYN9BMjK+PNzB
         3bDKkdDzBq8iD1v2ploXFNsOGBgurGnmJmFODojEuOx7h5IJv9a3ZyGps5XW+zm3ZwP3
         IyNp8IubOAJdKp98Y8byqVMwum46U2PVLc0kWpI3Dx2X+rTq5WlWvdzZTZ10/09brYbh
         5/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=37DeCDWlzdqkrXbAxfAuhXVMiTsGHz0hz+oO3LlsSAk=;
        b=Z62G5YVNettq6ntzvaKDBuD2+vMvmr8hEsn/kYATBKg+EdT983bltL8R65hGrt1UN6
         mKiFOPKqaiZbN3+i7U/wGuzHTA7ZNNQKvD2jYZr1rEPNixOwlwIzsx2pyCo07H42glgI
         nMshAi1TE62Brh6bLfdR3pSh8SU9cZ9XDJ7tAsgtkU5qYugm7oi/G4FquY1zBb35Jj5r
         Ld9uu9IoebCmk9AsjX5em/DSfc/fPCxOvonFb2WunSDYAtgtVEbx4wBU851wEsNe9oi+
         G1r6qPp/bSAorTNUlninXYBJNxWN4+7ICTJTmmTYl/TOzn4m40NpnIqyZE+pBLf62+Cg
         mTzg==
X-Gm-Message-State: AOAM531+62Z8jpRA0Z9eh0HA/6cFyZovTp4KrG3wyaMC5/DdIDEX6WAK
	IdjwPvhNpzwPRNlxrb2c5XCPpVccFmxZiAnTEMgzRA==
X-Google-Smtp-Source: ABdhPJyIrADojlxnjoJbjHABCl+RY1oRMepIxM5nb9mo2vXqxPk9ksIqJg+9gS8ogRsiwQgdyPv54GWhmXZP85nX5oI=
X-Received: by 2002:a05:651c:1508:b0:249:b843:208f with SMTP id
 e8-20020a05651c150800b00249b843208fmr11115015ljf.239.1648747874376; Thu, 31
 Mar 2022 10:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <164847778869.3060675.8115416881394543419.stgit@devnote2>
 <CAKwvOdmAYQZtzGudBjmiRZNjT+VixTdNbJmYmxc7-gQNCsHfrA@mail.gmail.com> <20220331104531.81d0edf9a85a4f69020a9f13@kernel.org>
In-Reply-To: <20220331104531.81d0edf9a85a4f69020a9f13@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 31 Mar 2022 10:31:02 -0700
Message-ID: <CAKwvOdmbMPBOGvcZNURK6qMx8gm7dGFiWmtX_yXheEqQ8CNLsA@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] bootconfig: Support embedding a bootconfig in
 kernel for non initrd boot
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Padmanabha Srinivasaiah <treasure4paddy@gmail.com>, 
	LKML <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Randy Dunlap <rdunlap@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 30, 2022 at 6:45 PM Masami Hiramatsu <mhiramat@kernel.org> wrote:
>
> Hi Nick,
>
> On Wed, 30 Mar 2022 11:04:50 -0700
> Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> >
> > Any chance we can use
> >
> > CFLAGS_REMOVE_<file>.o := $(CC_FLAGS_LTO)
> >
> > a la
> > commit d2dcd3e37475 ("x86, cpu: disable LTO for cpu.c")
>
> Hm, this looks good to me. Let me confirm that works.
> (Does this mean the bootconfig.o will be compiled to elf binary?)

I know we went with Masahiro's suggestion, which is clever and better,
but to answer this question; yes, under LTO, the linker can link
together inputs that are a mix of ELF object files (basically, no LTO
optimizations) with LLVM IR (w/ LTO optimizations between such files).
-- 
Thanks,
~Nick Desaulniers
