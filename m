Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6520718DB1B
	for <llvm@lists.linux.dev>; Tue, 25 Feb 2025 21:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740519472; cv=none; b=ixylH14JYWCM4Z+RafvrAvQO9eQY0LZwdAFVwotdPvKIswy+nOSqbm5mYUkdD81BuilcAAap+5spID4ah9oyuotQ4Q5cZixJnUc/Hi2qA5a2k/O56jHN2XnX3BUiiwGpFPZGV/xrk6ZDp53dcP8pi4a5d9ZxDD0+Ps1SBMHiUfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740519472; c=relaxed/simple;
	bh=NMGyldH7G/zx0ROFy4tu+R4sBPI1pjzg+05ivupOIcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuhqF+FDdGmkVUjgcoXzUym4j9kqOrlPBNgaUMBq4XTI2RqdDkg6E3X6vB3yeEJLgSgj3uB6iaH8QYA13kioMjQszZGxedpa49ijEAsSPjhTxRbSNIc1cWqe9CFBmYj19zQZ4xzNiN3U1Uptok5pYtcUE8fYG4o3DMFMOfQhsWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHRV+/La; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RHRV+/La"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f488f3161so3373891f8f.3
        for <llvm@lists.linux.dev>; Tue, 25 Feb 2025 13:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740519469; x=1741124269; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QCyp1JUlv9qVfn+zUKpBjTnHTrPkzYz/kl8dlHJcy0=;
        b=RHRV+/La+lqrSIZVd0RirmMAnoi4MbK8F7hiJhPV44/ZDQAQ+nXfp0LLmodqJDTQR+
         gonsYeEIj9eW1px1aSlLzNsG6StSS+/iUNnZHkE3F0vWUhWEFoRNNL+Wi4vf7FwHvmk7
         acZMQcMKbACYzgHnuIyag4+8cyZIsq/jBg9nh+jtk6FjUPZfZEwhH/hgTem/POBOOcYv
         GvP21si2WSyDYq0r0XtKy7RSMDdBbPJArTOnrqgRTnIRodK5Uu27jLfkXXHM9xDaaJK4
         yK3OZmsVJjdwZuc5Yfy0b3m03I/NbR3BGn8YBqZnw8B+KRAftPU1hAoCGWT3yynqpRxj
         nmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740519469; x=1741124269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QCyp1JUlv9qVfn+zUKpBjTnHTrPkzYz/kl8dlHJcy0=;
        b=m7HeemIpCJQseMj4CjbSlil70B5O2LHNpYiCcJ3p7SIdAGLxj4X99UrkVvWwc6lHyX
         SO3pCf3mJil2OnAkN7olIh9y6PmQz9RnOqQW3I0yQw5hd3opnlvSvxQJOO2lH3K0GRAr
         BxFwBBQzM/LW9gLO/lSYspBiE4PhpHCR0cSzgfQhJ4Ozf6h4WuGdy7o4xCHvTUPER5Pu
         lugKU0K5qWasD5FeA4jRgRNFNv5Xzp1OS/gosT2v/XMst9V3I2j26qdrNBPp0D0+QrsV
         el2nhHA/So7zYrrXqpVEMeSI2vxL8k/gZKQIRGS07Rqq2GVshDK7YjlVp5GwL+0fUOLy
         hPww==
X-Forwarded-Encrypted: i=1; AJvYcCVwvR7w20HAI2HiaSdVV8yXr7SYSAmo0VqfHNJyH2PjARgCHE28uSDS+lb+UbrDlDinBjn6@lists.linux.dev
X-Gm-Message-State: AOJu0YybRYmQVyA09WfuS6LG51we1xyPVR8npAnZLbqiH4SRDc06Ku+5
	xXOjL2y1V6Ff3FZ3NfBtZmfK/nkHUJrksiZySI597W7PKBBdaoP/BtaVIui5yXP/DjwKgAxmvMp
	2GYkVSsch7DETcDfr0FEqZV+D/3o=
X-Gm-Gg: ASbGncu+1GKPmMzC3Du/44O1LjPniE10HS+5zlUzU8Epkt83u8DNivwZRjy2OGPno+B
	lvkspoMuQWUSErxD7LpK/b7daRgIIEYR1yLQj8ukPUwV/Dsf0xLN5oT8FXGjXnkfOucdMbdAqZN
	+eDzJfKG84
X-Google-Smtp-Source: AGHT+IH6S2mULqjQWrRVzKEgduMFAsvTkEdFQj+0CWyfGyaXp1XuShoVeKk5ny9pZxUEWkF4gZEny+EdppWtMZZUjmk=
X-Received: by 2002:a5d:588d:0:b0:390:d5f1:de9f with SMTP id
 ffacd0b85a97d-390d5f1e3dcmr106316f8f.18.1740519468347; Tue, 25 Feb 2025
 13:37:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <2a2f08bc8118b369610d34e4d190a879d44f76b8.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZdtJj7VcEJfsjkjr3UhmkcKS25SEPTs=dB9k3cEFvfX2g@mail.gmail.com>
 <lcbigfjrgkckybimqx6cjoogon7nwyztv2tbet62wxbkm7hsyr@nyssicid3kwb>
 <CA+fCnZcOjyFrT7HKeSEvAEW05h8dFPMJKMB=PC_11h2W6g5eMw@mail.gmail.com> <uov3nar7yt7p3gb76mrmtw6fjfbxm5nmurn3hl72bkz6qwsfmv@ztvxz235oggw>
In-Reply-To: <uov3nar7yt7p3gb76mrmtw6fjfbxm5nmurn3hl72bkz6qwsfmv@ztvxz235oggw>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 25 Feb 2025 22:37:37 +0100
X-Gm-Features: AWEUYZnhs_dCGf3N8iOL4s8huRdd6HbG8f2NLaDJFhsXr34i64LAvkBz9QgjSAQ
Message-ID: <CA+fCnZcsg13eoaDJpueZ=erWjosgLDeTrjXVaifA305qAFEYDQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] x86: runtime_const used for KASAN_SHADOW_END
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: kees@kernel.org, julian.stecklina@cyberus-technology.de, 
	kevinloughlin@google.com, peterz@infradead.org, tglx@linutronix.de, 
	justinstitt@google.com, catalin.marinas@arm.com, wangkefeng.wang@huawei.com, 
	bhe@redhat.com, ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, 
	will@kernel.org, ardb@kernel.org, jason.andryuk@amd.com, 
	dave.hansen@linux.intel.com, pasha.tatashin@soleen.com, 
	ndesaulniers@google.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
	mark.rutland@arm.com, broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, 
	rppt@kernel.org, kaleshsingh@google.com, richard.weiyang@gmail.com, 
	luto@kernel.org, glider@google.com, pankaj.gupta@amd.com, 
	pawan.kumar.gupta@linux.intel.com, kuan-ying.lee@canonical.com, 
	tony.luck@intel.com, tj@kernel.org, jgross@suse.com, dvyukov@google.com, 
	baohua@kernel.org, samuel.holland@sifive.com, dennis@kernel.org, 
	akpm@linux-foundation.org, thomas.weissschuh@linutronix.de, surenb@google.com, 
	kbingham@kernel.org, ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, 
	xin@zytor.com, rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, 
	cl@linux.com, jhubbard@nvidia.com, hpa@zytor.com, 
	scott@os.amperecomputing.com, david@redhat.com, jan.kiszka@siemens.com, 
	vincenzo.frascino@arm.com, corbet@lwn.net, maz@kernel.org, mingo@redhat.com, 
	arnd@arndb.de, ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 6:16=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> I mean in my tests, with setting offset in runtime, everything works corr=
ectly
> in inline mode. Even though hwasan-mapping-offset ends up empty and doesn=
't end
> up in CFLAGS_KASAN. I assume this means that the inline mode is pretty mu=
ch the
> same as outline mode with the runtime offset setting?
>
> I also tested if hwasan-mapping-offset does anything if I passed random v=
alues
> to it by hardcoding them in the makefile and still everything seemed to w=
ork
> just fine. Therefore I assumed that this option doesn't have any effect o=
n x86.

Hm that's weird. I wonder if inline instrumentation somehow gets auto-disab=
led.

> Hmm indeed it does. Then I'm not sure why I didn't crash when I started p=
utting
> in random variables. I'll dive into assembly and see what's up in there.

Please do, I'm curious what's going on there.

> But anyway I have an idea how to setup the x86 offset for tag-based mode =
so it
> works for both paging modes. I did some testing and value
>         0xffeffc0000000000
> seems to work fine and has at least some of the benefits I was hoping for=
 when
> doing the runtime_const thing. It works in both paging modes because in 5=
 levels
> it's just a little bit below the 0xffe0000000000000 that I was thinking a=
bout
> first and in 4 levels, because of LAM, it becomes 0xfffffc0000000000 (bec=
ause in
> 4 level paging bits 62:48 are masked from address translation. So it's th=
e same
> as the end of generic mode shadow memory space.
>
> The alignment doesn't fit the shadow memory size so it's not optimal but =
I'm not
> sure it can be if we want to have the inline mode and python scripts work=
ing at
> the same time. At the very least I think the KASAN_SHADOW_END won't colli=
de with
> other things in the tab-based mode in 5 level paging mode, so no extra st=
eps are
> needed (arch/x86/mm/kasan_init_64.c in kasan_init()).

What do you mean by "The alignment doesn't fit the shadow memory size"?

> Do you see any problems with this offset for x86 tag-based mode?

I don't, but I think someone who understands the x86 memory layout
better needs to look at this.

> Btw I think kasan_check_range() can be optimized on x86 if we use
> addr_has_metadata() that doesn't use KASAN_SHADOW_START. Getting rid of i=
t from
> the implementation will remove pgtable_l5_enabled() which is pretty slow =
so
> kasan_check_range() which is called a lot would probably work much faster=
.
> Do you see any way in which addr_has_metadata() will make sense but won't=
 use
> KASAN_SHADOW_START? Every one of my ideas ends up using pgtable_l5_enable=
d()
> because the metadata can have 6 or 15 bits depending on paging level.

What if we turn pgtable_l5_enabled() into using a read-only static key
(DEFINE_STATIC_KEY_FALSE_RO) instead of a bool variable? Or if that is
not acceptable, we could cache its value in a KASAN-specific static
key.
