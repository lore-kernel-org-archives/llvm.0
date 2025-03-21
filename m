Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576F1EBFFC
	for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 20:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742588187; cv=none; b=CC20nhsVpROyWMXfUwmafXZX+i20wxqzdlVvT5fvR+hVyhefBB7qwg8I5waNSPvoo6GKIr3GACGO9sVIv0UyLKi023HONr1wyfSPyI6dpV8x6cRyafDlFQ0H3RoiLyO74qK9CcELGmenhGWB+4WfEZ0jTIjbF6wY6YGgnVizxBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742588187; c=relaxed/simple;
	bh=C0+RouyfLpsQW5xvPju9cRpnBiU/H1OG+89X01tDYOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3rzu9sLhIkk+hGWYc3MCEZszOmFVKPZx9T43+N6P5PpzMCA7AggFJ18rdkS8dmsNK9/GPEyyHutjSPVnDX0dNcLc3075InrqQ5sRFM4lYvkXRbro5V9rH3dfhng6qKaACsAYq7zYFR4xA2y1E7jtbLOnZDxD5TBLR0SsOdDtu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7UlbbBU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7UlbbBU"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-399744f74e9so1557429f8f.1
        for <llvm@lists.linux.dev>; Fri, 21 Mar 2025 13:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742588184; x=1743192984; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0+RouyfLpsQW5xvPju9cRpnBiU/H1OG+89X01tDYOY=;
        b=b7UlbbBUnS6R/W9zvuQFaLYDHljBPwvx8HFYLexfE537fEd20q3Zb50jnBTntM9OnG
         ZgoHtLU7JXR8nqS0njRi2Xk++Dno8JugnjHZIGbBVIdQQzv0P+c81R0lKM3sB80IV6JJ
         ZqKF4dqgE6HTo+uUi3VCql7klRW/GYNLlpOBgOn06ZiK6iNie1Op7fUVZ6St5P2UpFPi
         1jU4asuFNwx20BkNKDdCcP4G1ZPGOUAJJ6UcG2QyZd4rwqqlHrjE4mzOOR8KQfN/ntsO
         Pm02NV4AYqP/RA0BkuR4IsJMI4s1F7L5xfJr18el+VaU7Kp+3DFHm86KpumC5dCpHZpJ
         jCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742588184; x=1743192984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0+RouyfLpsQW5xvPju9cRpnBiU/H1OG+89X01tDYOY=;
        b=m8emu5OyTyxsBDA8UJItgWxbCIFXd39v9gvDam2o5P6aJnoXBOTmDLZJALyTSxwJLB
         yChR2U8acbeJclN9BVaBLj+fBN0P3kZXM5vbsODG3ysDUA/PwIGlM61Fa5XWedl3iUKy
         NJVamxcIwmr/hHD8tJVc5vPECdmFHMVrOugED1+I2N+4Y1TMRfKEcHl/rydnibQBZOEF
         0TXlH88Mg9dqzRObMumfMhin2+AE25Kuvu7GDMDkjCO4nEOPo5yoMIEcBJlr/5NwEuaE
         ZneY3oa0YXZk8fwvwJXucpgsWTjSl7gS2X9hglTRjyKLhLDSyWwyCv7+01U2SdD0iWcJ
         n/gA==
X-Forwarded-Encrypted: i=1; AJvYcCXigmgyP7E/Ihzl0x0z3ngKmvPAumbYMSJEvk0FA0+OZYNQOuishgtH30SIUiMZaIRgQZOE@lists.linux.dev
X-Gm-Message-State: AOJu0YzLYNWbkNlAqXlk4M68RZP2kpVn/a6m3K18HpZXrlKK6b/LJOh7
	hbDN0up4aFCZGgDwoe8vaiN6uUE8lOZZVA3z4RguHt1DPXql8FG9WHs5P1N2ynirbVPbNKD90/p
	np7LzMQpYKwDThscaiTBCuHm7lvo=
X-Gm-Gg: ASbGncsexorgEHE1KbpBOxw2aYWiA1j3OzgSd+H7zThIqCLVS/tMzbQ8a660IZfV3Ts
	i8UVqRCCT0nhSVbl6Q0yRLlJfl/4dSsA08+/nugp8xHfpyzwrlZG80w1DucHyTr9EyCPfzid+v1
	LV19U+KsD2KqqXTUb+D80lSR1a3IE=
X-Google-Smtp-Source: AGHT+IG96TW62bsJhBDZbnfMPxfAxceG/bIkR9QnkTX8HFU26Hzcqf/Z/0wc9M9c7myGqdnMqBXKa2D8CUSlfaQ28eQ=
X-Received: by 2002:a5d:5846:0:b0:391:4559:8761 with SMTP id
 ffacd0b85a97d-3997f94da30mr4175995f8f.36.1742588183868; Fri, 21 Mar 2025
 13:16:23 -0700 (PDT)
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
 <CA+fCnZcOjyFrT7HKeSEvAEW05h8dFPMJKMB=PC_11h2W6g5eMw@mail.gmail.com>
 <uov3nar7yt7p3gb76mrmtw6fjfbxm5nmurn3hl72bkz6qwsfmv@ztvxz235oggw>
 <CA+fCnZcsg13eoaDJpueZ=erWjosgLDeTrjXVaifA305qAFEYDQ@mail.gmail.com>
 <ffr673gcremzfvcmjnt5qigfjfkrgchipgungjgnzqnf6kc7y6@n4kdu7nxoaw4>
 <CA+fCnZejp4YKT0-9Ak_8kauXDg5MsTLy0CVNQzzvtP29rqQ6Bw@mail.gmail.com> <t5bgb7eiyfc2ufsljsrdcinaqtzsnpyyorh2tqww2x35mg6tbt@sexrvo55uxfi>
In-Reply-To: <t5bgb7eiyfc2ufsljsrdcinaqtzsnpyyorh2tqww2x35mg6tbt@sexrvo55uxfi>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Fri, 21 Mar 2025 21:16:12 +0100
X-Gm-Features: AQ5f1Jrn_9IapCqgYgSltS6n-7mZrLrWLtgtTd5C1mwQlaSaD5HTlmPhaoggwwM
Message-ID: <CA+fCnZdunJhoNgsQMm4cPyephj9L7sMq-YF9sE7ANk0e7h7d=Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] x86: runtime_const used for KASAN_SHADOW_END
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Florian Mayer <fmayer@google.com>, Vitaly Buka <vitalybuka@google.com>, kees@kernel.org, 
	julian.stecklina@cyberus-technology.de, kevinloughlin@google.com, 
	peterz@infradead.org, tglx@linutronix.de, justinstitt@google.com, 
	catalin.marinas@arm.com, wangkefeng.wang@huawei.com, bhe@redhat.com, 
	ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, will@kernel.org, 
	ardb@kernel.org, jason.andryuk@amd.com, dave.hansen@linux.intel.com, 
	pasha.tatashin@soleen.com, ndesaulniers@google.com, 
	guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, mark.rutland@arm.com, 
	broonie@kernel.org, apopple@nvidia.com, bp@alien8.de, rppt@kernel.org, 
	kaleshsingh@google.com, richard.weiyang@gmail.com, luto@kernel.org, 
	glider@google.com, pankaj.gupta@amd.com, pawan.kumar.gupta@linux.intel.com, 
	kuan-ying.lee@canonical.com, tony.luck@intel.com, tj@kernel.org, 
	jgross@suse.com, dvyukov@google.com, baohua@kernel.org, 
	samuel.holland@sifive.com, dennis@kernel.org, akpm@linux-foundation.org, 
	thomas.weissschuh@linutronix.de, surenb@google.com, kbingham@kernel.org, 
	ankita@nvidia.com, nathan@kernel.org, ziy@nvidia.com, xin@zytor.com, 
	rafael.j.wysocki@intel.com, andriy.shevchenko@linux.intel.com, cl@linux.com, 
	jhubbard@nvidia.com, hpa@zytor.com, scott@os.amperecomputing.com, 
	david@redhat.com, jan.kiszka@siemens.com, vincenzo.frascino@arm.com, 
	corbet@lwn.net, maz@kernel.org, mingo@redhat.com, arnd@arndb.de, 
	ytcoode@gmail.com, xur@google.com, morbo@google.com, 
	thiago.bauermann@linaro.org, linux-doc@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 8:21=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >To account for this, let's then set hwasan-instrument-with-calls=3D0
> >when CONFIG_KASAN_INLINE is enabled. And also please add a comment
> >explaining why this is done.
>
> After adding this option the kernel doesn't want to boot past uncompressi=
ng :b
>
> I went into Samuel's clang PR [1] and found there might be one more LShr =
that
> needs changing into AShr [2]? But I'm not very good at clang code. Do you=
 maybe
> know if anything else in the clang code could be messing things up?
>
> After changing that LShr to AShr it moves a little further and hangs on s=
ome
> initmem setup code. Then I thought my KASAN_SHADOW_OFFSET is an issue so =
I
> changed to 4-level paging and the offset to 0xfffffc0000000000 and it mov=
es a
> little further and panics on kmem_cache_init. I'll be debugging that furt=
her but
> just thought I'd ask if you know about something missing from the compile=
r side?
>
> [1] https://github.com/llvm/llvm-project/pull/103727
> [2] https://github.com/SiFiveHolland/llvm-project/blob/up/hwasan-opt/llvm=
/lib/Transforms/Instrumentation/HWAddressSanitizer.cpp#L995

Hm, I only recall looking at the compiler code when investigating [1].
But as this series points out, [1] can be considered a feature and not
a bug. Other than that, nothing comes to mind.

Thanks!

[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D218043
