Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321E02E3E5
	for <llvm@lists.linux.dev>; Sun, 31 Mar 2024 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711918796; cv=none; b=N19x6RaqpuZlO3iI/MmBOgBX/60ar0HFC0LOC4pZQC5J1GHp/sv4p79nohReiODSTK3pMNAxHW+biv5mEWisIgKDhZG76xK1Lv3mTRIvnVJRHyNnFyHhugSWBMayfL4lM9PGUNqmyDWb1sd1IxWGgbzuUAoN2MU9SGMc1xq2wqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711918796; c=relaxed/simple;
	bh=S9I+Dzh80MHnY1OT3f1I/KGqljo+hkE9iQAPevgW43I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBNAcH0obqeGrIemZpkdU1LbPktDTDOuNH4a/aEgfXa458vT5YVJUxUyAd5u2q7g7+7UVYkMxabCgRJsZdODJGC3ynUjT8314mNSP7sizSBQuxZRJvAuflEV1PpzsP0XZoCbxL4XbuId4sYgdrZ6ezZLYYInMd5nmdexkDhXiGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2C6SKaY; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2C6SKaY"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c3f16f9c81so1580838b6e.1
        for <llvm@lists.linux.dev>; Sun, 31 Mar 2024 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711918794; x=1712523594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62r08+vv81bc15gP+QLC+CCLQ9XEz9F5J6/drEN32h0=;
        b=H2C6SKaYEHjlwGO5lf75hAZn90slx4juzm4ddPOb1SfVsFJBllHsX4B5yGFUic2OTB
         M2HYPnOdR7WzaIvtwv5gEm5tnjdis9WOjde2/8MTQE2vzqpi482Y1x9sdz0tAEnmDcnL
         0Uu8fY+ryv3bBjm8pRuKRjXCL5tTJ9vUgGCDDx/tg7D1k+QyT2DZtonmM/5DC76xkEMK
         NkE5mmh12Ve3eoGcywZHGVCbQe3xr/i8XS5DrWnyI7LHgz285nbW102DTALQiaORUuny
         w6psjW/wxaS+QH546Prdm8c8GuwU/p2XZkHllN6i4k0awN7mxUaIUN9gf5ZTIPRG5+BN
         DD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711918794; x=1712523594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62r08+vv81bc15gP+QLC+CCLQ9XEz9F5J6/drEN32h0=;
        b=nnoShf7lxGOdOAru5l+xLRV4jUCINBRbhIDGivyA3HOePwqvNNpaGXXXhqoAMbUg2g
         Mh4XKqF5jW15ioLdY0qnRZqTqQ0Lzv5ruyBL50lLYJq5rqMW/AzYc4FZb0rkDHv7ZAUO
         /xATTN9QiCTbC9u7OipRGCWei5PQuzGPlBM542urPyoteljeT2hrSnMSfx2f9Ji2itQU
         kUfct5id13xiogO6EGKPTn+rU+3kBcaunDKB+jC/nia9veF5rX6meJ6gbu4X5WMtXl6w
         eEXks5RLmgFMbHkJmJaWPgGcIiTUpXu5TwTSRk++MZVoaps6XV/JZ/XCMFbM9J0syaRC
         yF+A==
X-Forwarded-Encrypted: i=1; AJvYcCUBXKFrpOFw7zoiKCmYoQKP/epB4etJ8HtlppnH7V8y6diNXUbD7TdEwxx1Yb3yM/SfNorawxnFn9GVuaJL5+ftLKX6Rg==
X-Gm-Message-State: AOJu0YyBxW1AOhNSFS5eYHNgsyxmK6V2nbKJumoz/42TyFN2dM9cKpfp
	TxSOuuU93ngYnIu0/SFMwxwhPvcvwhKYjmUF8QX6OEUhE6BoOGs6VbbRAkYaIb++pOPXSezfA0i
	iVXpouihD/3RA7HsSV/pOI9mWsFOZi+Ezv+Pq
X-Google-Smtp-Source: AGHT+IEzHUCXtxEs/St9wm+0065V87APlYWHJK73R9BRkcaMBTaQUPw4xUsbBcEWCoGxmFWvQMN0ZyayAufxJn8GKQc=
X-Received: by 2002:a05:6808:2e4c:b0:3c3:d847:7a8f with SMTP id
 gp12-20020a0568082e4c00b003c3d8477a8fmr11313609oib.24.1711918794081; Sun, 31
 Mar 2024 13:59:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202403290334.USWrYrMw-lkp@intel.com> <CAJuCfpEKhhbG45RLFyh5yJ4iZ8NdqWcbj_+rf3=9Kg+hdxTtVg@mail.gmail.com>
 <20240329193714.8e968aad80b39be32b848f82@linux-foundation.org>
In-Reply-To: <20240329193714.8e968aad80b39be32b848f82@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sun, 31 Mar 2024 13:59:41 -0700
Message-ID: <CAJuCfpHHcQStzQ3-XHyR5eyYh-8D8+6MLyknoCHatukquk8aUw@mail.gmail.com>
Subject: Re: [linux-next:master 1076/1266] include/linux/alloc_tag.h:43:2:
 error: "Memory allocation profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 7:37=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Thu, 28 Mar 2024 13:02:44 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > Well, this is what I expected, we do not support this feature for
> > ARCH_NEEDS_WEAK_PER_CPU (alpha and s390 with CONFIG_SMP=3Dy &&
> > CONFIG_MODULE=3Dy).
> > Unfortunately ARCH_NEEDS_WEAK_PER_CPU is not a config option, so I
> > can't add it as a dependency for CONFIG_MEM_ALLOC_PROFILING. Should I
> > handle this differently?
>
> Make it a config option?  That would be a cleanup on its own.

I'll take a stab at it. Thanks!
