Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57799B668
	for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 21:01:15 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6c4d625da40so7640112a34.1
        for <llvm@lists.linux.dev>; Sat, 30 Sep 2023 14:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696107674; x=1696712474; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27IFQu1p2zMt99rhR1KNh/9hYoodXsLNJNCuaLad3CU=;
        b=AS8bAnrue4wSoQwN969VR6MKD8ha1G/9X5ZIRluyz7B8SgPE2gbfZme9zpZpDZ6Aw1
         /2MKXqvXFCXk/2igH24OZIRXGvGBvHvyRjkryNBn0Rp7FPp2NwBW28qEyry8I9y1CTNW
         EWtkkiqdwmbhfwRjOHe4tL2/vyZXjS0fwsuqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696107674; x=1696712474;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27IFQu1p2zMt99rhR1KNh/9hYoodXsLNJNCuaLad3CU=;
        b=G4Q9Xjkegrv/eW6yHVyVGeqOaNjWFanmQuQqWQfBLeIJE2Jf1cOw1KSIHWsRph7iUe
         FyXQNEoZZfA4MQnAiiH5ZQOjapgzXwTyOV9eZCQiB548wx7QvpNbsUr7zXpe1E2chCNM
         3Xs4Ri9SK1slnGmu7dJ2jLI9SPyM52yGrHZnmhMuGXq2PHu1WL/wnUuotUMCqSdHSGz1
         9zaqEyRLIZSDKrVS8QdTAkjFLrzPgoHClyzFpBbFzs0XcPfr5NssqYWqdqClFfxXH6Z3
         +fG0wvrLz/LptNcAHxBvCs0G8pcymK5tjb5oqrO4uj+8sZyoXzh0R+idAqsK/mqc73R6
         1uhQ==
X-Gm-Message-State: AOJu0YzVmalhnIQVI8vdOgVO+qZLh8iVy70UJo45AnzEAmYPXuPnt6Cs
	5G0OnTPeFz9MDWepKUyybC4FpQ==
X-Google-Smtp-Source: AGHT+IFeOcxaHIbtr3OOPjBvPc8vpAIKWTbtjxf4uBFCfxJieFURN+yasje/os/U6MRlxkFgpLgoBg==
X-Received: by 2002:a05:6830:2091:b0:6c4:c607:7346 with SMTP id y17-20020a056830209100b006c4c6077346mr8189210otq.23.1696107674143;
        Sat, 30 Sep 2023 14:01:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ey1-20020a056a0038c100b0068a13b0b300sm17483758pfb.11.2023.09.30.14.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 14:01:13 -0700 (PDT)
Date: Sat, 30 Sep 2023 14:01:11 -0700
From: Kees Cook <keescook@chromium.org>
To: Conor Dooley <conor@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
Message-ID: <202309301400.4E1AD87@keescook>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com>
 <202309291452.66ED9B4D83@keescook>
 <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
 <20230930-emporium-share-2bbdf7074e54@spud>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230930-emporium-share-2bbdf7074e54@spud>

On Sat, Sep 30, 2023 at 10:02:35AM +0100, Conor Dooley wrote:
> On Fri, Sep 29, 2023 at 03:52:22PM -0700, Sami Tolvanen wrote:
> > On Fri, Sep 29, 2023 at 2:54 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Fri, Sep 29, 2023 at 09:11:58PM +0000, Sami Tolvanen wrote:
> > > > ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
> > > > potential bits of mmap randomness on the table if we end up enabling
> > > > 4/5-level paging. Update mmap_rnd_bits_max to take the final address
> > > > space size into account. This increases mmap_rnd_bits_max from 24 to
> > > > 33 with Sv48/57.
> > > >
> > > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > >
> > > I like this. Is RISCV the only arch where the paging level can be chosen
> > > at boot time?
> > 
> > I haven't seen this elsewhere, but I also haven't looked at all the
> > other architectures that closely. arm64 does something interesting
> > with ARM64_VA_BITS_52, but I think we can still handle that in
> > Kconfig.
> 
> AFAIU, x86-64 can do this also:
> 
> 	no4lvl		[RISCV] Disable 4-level and 5-level paging modes. Forces
> 			kernel to use 3-level paging instead.
> 
> 	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
> 			kernel to use 4-level paging instead.

Ah-ha! Okay, well, then let's track this idea:
https://github.com/KSPP/linux/issues/346


-- 
Kees Cook
