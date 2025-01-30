Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6458C19DF60
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225290; cv=none; b=smFRptYE6ntxWIjhhZvgTEJXJze5fsFfNfopf93tzrXRzmKvev+mdWwhKEHBoUUckAb4Z1rPJqXcMfMsTv1vgCKN+N6CpbiHFuPsoTuXlUEPYs8/xncelMHWIqLOjcez4QViV1VOff0L21mShIFT4OtFHzzzNniN0c9slUUojyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225290; c=relaxed/simple;
	bh=DM9D4FDbGNU5mWpG91VU/qPeDc9li7yVy2LWC1+OY8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eFHNOIbZ8tQE0xWKggp38cx0Qvh9ZqeLussItKLPalpJrTIk5aB/eYu2Jdk53xNcANtIsBFheJ+E5DSRSxuLLkvBh5FQAfF4iXdRRmRRDxzx7AL48q9uXAaZGo4GcFFh7KDNHfF/MXtTBv0SAHzIEHsqaaMWHgR4gupFGsSTQm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-518ae5060d4so168252e0c.0
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 00:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738225285; x=1738830085;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaD/E6PXTaDQ2QuYo/3qqTDpp2nzD7hhPFRo29uLk0A=;
        b=aiyqUHgSJaDWvFwT5LR4i9TVFLCaGuILWDVqzKOLh0dS4ouL9qiCn518EbouFDgshK
         lJnMA8rOy7yr8w4CFOTLCKxMe6LbHAucYws8pevfMapjz1atG2ii2B3LukKZHwCrkhHY
         5jF0KZKiSRdTwM7QNZRRiUn5hJdOKww/BYc7bbTRvUzU+tysadDh7iOiPCFHktiXWNxi
         LzK/PS59G60DTrKoxpqCc/m3ely/4BP9+jpw4sQVIRynMLfaF4JBgmEeaZrkV3bHDyFm
         FlwsN3HwjWVUC1yt9x8/YuqDLWuXQN2q098K64BQXmbmAj9K+oBD43b5xX5K2JvPT2ra
         kDJg==
X-Forwarded-Encrypted: i=1; AJvYcCVOoHG3RNXSUITNmPnaQXWJDV+dLedS3HtrRPFjUJ9gbunfERok6+dkYQuV7W3tuTGAXQSR@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1XVMDgNd6UblGQzoxYn5ihOv2i6z4msQgx8zoTXVzqUi0ukEw
	Ep3BmqRBcidpY4ijQ+y7THp8+nhUKlaM+rd20dd7LIL5tHia6gcPYWuIWoxo
X-Gm-Gg: ASbGncsvfy4+PuT4WsJXX9EuUOjii3j2RCPcdjXjzfldNmUVPnkvAb2ASIu7s2aTTUc
	kx+vUdfLqnov6N9YHT4dGe3Kj5m7na9mlNKZrQOkzNXO7AlPlha1Mrj15OXvzDcH3NiVCeb/1vC
	7imLuxuqg6o6Lc7Szvn8L1Mls6WSOn00+u1XpNIJq60BOrfZErFfGd6ymmWpf95/P4yiznstOAG
	ueI7+ofTE3CstDyofKwPttxzBQn1Na3qVfqwLjbHx++Gzj83WDKCGlGYGeLSXqzWFEdr3FN4X14
	uHVI2my80t+95K5A3X2aANkSwjnuqlVOvF1Fys38fPTASSmldiAd4EFFIg==
X-Google-Smtp-Source: AGHT+IEKpm8ErjYZ8G5SGcHO4la13CA/64SnIkB421LpRePv+9M/AH3RzAdgd2e9lK0ePzeSRmhaGw==
X-Received: by 2002:a05:6122:348a:b0:517:4fb0:74bc with SMTP id 71dfb90a1353d-51e9e3fd1b3mr6641479e0c.3.1738225285321;
        Thu, 30 Jan 2025 00:21:25 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1d62eedsm136964e0c.33.2025.01.30.00.21.24
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:21:24 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-51eb18130f9so73072e0c.3
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 00:21:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjse7kaGAxtftspS+9xwhzNrw+d6MnJ3dhhYs+PfJVMbXuo14LmOTABBLoT5AEG4Go1B3K@lists.linux.dev
X-Received: by 2002:a05:6102:a52:b0:4b2:7996:6ba4 with SMTP id
 ada2fe7eead31-4b9a5266e7amr5391829137.25.1738225284361; Thu, 30 Jan 2025
 00:21:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com> <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
In-Reply-To: <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:21:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
X-Gm-Features: AWEUYZniYx50uUBB4BKLzCpQ-mS0oONl2y__yoxAs6c6zYEzharbM-CAzfEZmbQ
Message-ID: <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>, akpm@linux-foundation.org, 
	christophe.leroy@csgroup.eu, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, maddy@linux.ibm.com, 
	morbo@google.com, mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Liam,

On Wed, 29 Jan 2025 at 23:26, Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> I've never used the kunit testing of xarray and have used the userspace
> testing instead, so I can't speak to the obscure invocation as both
> commands seem insanely long and obscure to me.

The long and obscure command line is a red herring: a simple
"modprobe test_xarray" is all it takes...

> You should look at the userspace testing (that this broke) as it has
> been really useful in certain scenarios.

BTW, how do I even build tools/testing/radix-tree?
"make tools/help" doesn't show the radix-tree test.
"make tools/all" doesn't seem to try to build it.
Same for "make kselftest-all".
When trying the above, and ignoring failures due to missing packages
on my host:
  - there are several weird build errors,
  - this doesn't play well with O=,
  - lots of scary warnings when building for 32-bit,
  - ...

At least the kunit tests build (and run[1] ;-) most of the time...

[1] test_xarray started failing on m68k recently
    https://lore.kernel.org/all/CAMuHMdU_bfadUO=0OZ=AoQ9EAmQPA4wsLCBqohXR+QCeCKRn4A@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
