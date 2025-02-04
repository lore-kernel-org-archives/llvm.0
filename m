Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202DC215F6E
	for <llvm@lists.linux.dev>; Tue,  4 Feb 2025 23:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738712199; cv=none; b=ggNs+XOAj59p6E0lP+85EWuooSHqS9ltzKgV5+cmJxJUlxWcMB1btaBWbZ2jrVwG4USWgzhAWzlrfoW+Wbk8TASfaGeslo39Xp2gskc+4oqrlVrnpVTJQ8R5LLkW/rwXY/auccf6IIcnrN5UTkTHlJ3UuuuzXkWlsR46Fn8k8gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738712199; c=relaxed/simple;
	bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mByg9/mOFZaSzS0IyY3YbdTDr0px/oIEFLS70oN+5uOhHVh0tvIsAyAh3gMXIvThhvccB8B5A7wVCl8DMoXQMA7EGV2iRDYI7s2ie9uCbNkXgd9cJUveWxW658zg8jpEJ7K03USqe6ISYUJCwTQOGt3K1YJ5MabymJDAtjfawfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com; spf=pass smtp.mailfrom=jrtc27.com; dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b=Yb+3iPu+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jrtc27.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrtc27.com header.i=@jrtc27.com header.b="Yb+3iPu+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3863494591bso3153052f8f.1
        for <llvm@lists.linux.dev>; Tue, 04 Feb 2025 15:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1738712196; x=1739316996; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=Yb+3iPu+8EQ4EM19p+8wXslJxh4MV0oQ1/fgSMMMp9bLu6Zedjnn8F/U953Z32L7t9
         DPHmgOjTi9OJ2R+6xPhz1IaVcHMK/LkFqfShCWkAK+JoNYR1hl+8/8PiigTjjYXhD80D
         OCMdPe9au0lnZZYuTRsyhNVK9pLZEE7sGdNGhRBSIjUYaQ7eTgcVcPxHNB2Kmgycce4C
         PX6tjshTx3/Gd7L9T98KttC5poCjJf/umjjc59qc6kfsrnid9on01GtPj4C1PXr5VDXT
         xi1ih3miEnFV6+R4ds7+ILpO/H7r06U8EPuffCVOgXl6Az172ab4l9UoseB6iCREsvxe
         VEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738712196; x=1739316996;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QjEre/G3BLqcrCF5wreFajQVoRGv9unmtvDg4S23UQU=;
        b=WEj/u5wyk4Q/2CyKmLtB+fRtPMnX82F9UzPcypRHOYmN+LOEEU43d3o16deRoTdYsU
         uJqFPJ8NzGh39mPsx2hl0/sZ5cy3grBKBsweNLcfIJPDSJ3XfItPHeBHxY0cymx2Tgyi
         fENf4JVqMSVaZe3FGc8kJaYwpCb+wK4tX8xdca0nL6p1Fc106wz8itiddYnqQEGDEmVW
         aUD7aT86ZSpeX0laTNNkUa431VmQNrMlOLP/s1L8rIdL6UCKvRvtLzOep7S13IGhR1Q2
         XAiChJRGRyVoXhqeUiq94wGCrd0tvGbzgscL4QyvzhsGw+NOuamXIKGaoSRjAe5s3b6T
         qCKA==
X-Forwarded-Encrypted: i=1; AJvYcCUuA+XhiW4XGP4jxQGAisX6Oqy69uVD69PhzZ6gAeYw8cfu6JOcgseH7v8rsrxCkyJAe6+t@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ2TFwGzfLYmzOKT3eWmpQ4qtYfVKcQO18useNMebqLalPGhGb
	lVHfvvbg3mx6TR/lLy9C+S8P72TKmVBXjGzQyPcXY7ac71qVFDSpuYPgXCBVsrA=
X-Gm-Gg: ASbGnctfNl3q7utFa4sXRswTLKv/z2ljKc/NC8tHO1b3/kXp9n7O4Ivtw15TcXwmjI7
	Mf+eJqRBssCVOH1M61cxzsOSUuFd3t9BJx2egRTl2n0a0vY8jrMfNhdXklJc8A9GcuPDzfgqjQK
	TLLFVIC2BtgeF/8VK6od5+tYeiQiMIP4tY8akiFsBHhA9w4YiLR52ZPDZ2VbuBeqZeAT/8UPumv
	btKPXeupGLzcv2k5nuEIPwEMiFVRmEPE1VWM8YpRHJy2MOcoMr1K3OAlpJbf1SnB8Fih3TDP5vV
	qCE+6Qa8k1ECgUJEAHpvquGK7+eU
X-Google-Smtp-Source: AGHT+IEbYs1SnazTxli1ivvCCDO1Cn9LUrxieFBceKbd6w0ve1uSZrVLlYscY7LZ+tYIHGaLpjoemg==
X-Received: by 2002:a5d:4c47:0:b0:38b:dc3d:e4be with SMTP id ffacd0b85a97d-38db49214e3mr355994f8f.51.1738712196024;
        Tue, 04 Feb 2025 15:36:36 -0800 (PST)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec369sm16900115f8f.8.2025.02.04.15.36.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2025 15:36:35 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
Date: Tue, 4 Feb 2025 23:36:23 +0000
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
 luto@kernel.org,
 xin@zytor.com,
 kirill.shutemov@linux.intel.com,
 palmer@dabbelt.com,
 tj@kernel.org,
 andreyknvl@gmail.com,
 brgerst@gmail.com,
 ardb@kernel.org,
 dave.hansen@linux.intel.com,
 jgross@suse.com,
 will@kernel.org,
 akpm@linux-foundation.org,
 arnd@arndb.de,
 corbet@lwn.net,
 dvyukov@google.com,
 richard.weiyang@gmail.com,
 ytcoode@gmail.com,
 tglx@linutronix.de,
 hpa@zytor.com,
 seanjc@google.com,
 paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu,
 justinstitt@google.com,
 jason.andryuk@amd.com,
 glider@google.com,
 ubizjak@gmail.com,
 jannh@google.com,
 bhe@redhat.com,
 vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com,
 ndesaulniers@google.com,
 mingo@redhat.com,
 catalin.marinas@arm.com,
 junichi.nomura@nec.com,
 nathan@kernel.org,
 ryabinin.a.a@gmail.com,
 dennis@kernel.org,
 bp@alien8.de,
 kevinloughlin@google.com,
 morbo@google.com,
 dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de,
 peterz@infradead.org,
 kees@kernel.org,
 kasan-dev@googlegroups.com,
 x86@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 llvm@lists.linux.dev,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0BDD645A-3BBE-4A85-9098-257B281A3BA0@jrtc27.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
X-Mailer: Apple Mail (2.3826.300.87.4.3)

On 4 Feb 2025, at 18:58, Christoph Lameter (Ampere) <cl@gentwo.org> =
wrote:
> ARM64 supports MTE which is hardware support for tagging 16 byte =
granules
> and verification of tags in pointers all in hardware and on some =
platforms
> with *no* performance penalty since the tag is stored in the ECC areas =
of
> DRAM and verified at the same time as the ECC.
>=20
> Could we get support for that? This would allow us to enable tag =
checking
> in production systems without performance penalty and no memory =
overhead.

It=E2=80=99s not =E2=80=9Cno performance penalty=E2=80=9D, there is a =
cost to tracking the MTE
tags for checking. In asynchronous (or asymmetric) mode that=E2=80=99s =
not too
bad, but in synchronous mode there is a significant overhead even with
ECC. Normally on a store, once you=E2=80=99ve translated it and have the =
data,
you can buffer it up and defer the actual write until some time later.
If you hit in the L1 cache then that will probably be quite soon, but
if you miss then you have to wait for the data to come back from lower
levels of the hierarchy, potentially all the way out to DRAM. Or if you
have a write-around cache then you just send it out to the next level
when it=E2=80=99s ready. But now, if you have synchronous MTE, you =
cannot
retire your store instruction until you know what the tag for the
location you=E2=80=99re storing to is; effectively you have to wait =
until you
can do the full cache lookup, and potentially miss, until it can
retire. This puts pressure on the various microarchitectural structures
that track instructions as they get executed, as instructions are now
in flight for longer. Yes, it may well be that it is quicker for the
memory controller to get the tags from ECC bits than via some other
means, but you=E2=80=99re already paying many many cycles at that point, =
with
the relevant store being stuck unable to retire (and thus every
instruction after it in the instruction stream) that whole time, and no
write allocate or write around schemes can help you, because you
fundamentally have to wait for the tags to be read before you know if
the instruction is going to trap.

Now, you can choose to not use synchronous mode due to that overhead,
but that=E2=80=99s nuance that isn=E2=80=99t considered by your reply =
here and has some
consequences.

Jess

