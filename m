Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401B78F32
	for <llvm@lists.linux.dev>; Sat, 22 Feb 2025 15:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740236809; cv=none; b=ga1Nkv85Nxn7uY8CI4sJHBFhmx2fc3B1cu+DAxOurrBr7FDSXVEmB6pUEo3uFTfuxJ3Qu9bQGRQOCnyqwG1C/Eoof5ml0vIVeeR0sdR8iNgtky5hkjGASREAvLKBfwha3lhbfACuMPD0fg0zHxpQUN0yZ8h226+iV10duxA1+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740236809; c=relaxed/simple;
	bh=eSFmtCqKXwiBd5cPElHZFwNs8nFGgz73jeZp/oGxJMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bBywgVRNmVRvGBuVLrYlW2Xx5cnvuLA9eP09vy9elfkklg0KEz7ehfX1tfu+BlhmXfg0B/M39IzVPqKVVt+tWEL686hNRWo/p4DKLL8C1mernMozKXz8wBsnMmcouQKCncxOK6RbrYuxaZYiQzN2iEej5HlCNTJdrsryliOklxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Or3LNwjM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Or3LNwjM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-439846bc7eeso19071035e9.3
        for <llvm@lists.linux.dev>; Sat, 22 Feb 2025 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740236805; x=1740841605; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6IG2omqZBIGpvuNs0TcKEamdR0fZsdINqF9gR0Bnm8=;
        b=Or3LNwjMbuG6mIzDneL+ziug52PKEJmXaGpjgN9CAn4xsSG7auJhYbC1YnONPDIIzC
         JZ0xAPeuNidE7d1uO4AbBCNTB+FlXCtxhCjllIHaYPO3FkWK0aXl6cJYdycMNCEnFYmP
         Nqgd4C/hMtbfwuDEEpz13hF6QJz/Ns3A3H3Xy52zfq02LLLScq3pznvM+sdcwECXOZYk
         9/GVrrf9Nj5Bn8rgKehHjqcaBkLdaX6jxagWDNGhnaW3mJkFOlbbWc19+pHpOr9VugNE
         7vns5HJ9IRfBqx3QIjVNQVlgGV3hss7HfG/5VWGBPLaGTKQOheEFjPAqoWkZ0ieOqe+L
         ueHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740236805; x=1740841605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q6IG2omqZBIGpvuNs0TcKEamdR0fZsdINqF9gR0Bnm8=;
        b=NR3Uv6oO/afdzAh8VHxcJ5uvs2os96oHkrkmGltmKQb0pyRAYBdvcv2a2E7+h4woYa
         jbKsogusq+/JIuhsfBUq6HJxdqqL4c38EfO+5Axhq79c6SoqcM/AMRxfo6qzW/wVnbDc
         j8n4UJrW9mMJD6TzsmFHYFL4iJwnIcpPm0ISEt+DddvNUo/cve6WNFawZuTHDOqzp9hU
         O5djgP6z6Lbv7pHlt46KjRcfAdBOMMe3YP51NGrr10ZyDatuVZbDotOyhV+x5PjxejsI
         pPLjd0Topff3u+p/sKNmhyI5pTh5GDlCVhMHqMVYjA+wzbHtThfqELiPygyGIwDADB5L
         4qsg==
X-Forwarded-Encrypted: i=1; AJvYcCVrGjThvVveslU9tCtuujllMYhYMV9Gp91QXleQP+CzG4v0OpYkVueeFFLHdRbHDBKDHraj@lists.linux.dev
X-Gm-Message-State: AOJu0YxSHDHdyb7o2Ztd4C5ykuk20AspvzzIKx2O12pcw63RQKR3cpkx
	LC71Q/4SOYW1cMkLozhZBwUXNOf1V0aDPDpV5zwm9VMP5E8dA4kxKaxOND6ZV9mPiFC9F2WwgqP
	0VRtzfPoagHxqA706rUea5K81y/E=
X-Gm-Gg: ASbGncteCBffMyo3RSOntmg6G452GJ6Rb4hmLa2u9IHsCFBAhjRTz9FzRJpbutgf+cU
	vMCFv/MWBour7LREV3Rrw+PAuilxKMpTqFzAus8EOXr07Q7CElosxGZZK1BINJ3ZtntptFwlwRq
	LZ/F4/RRXg5g==
X-Google-Smtp-Source: AGHT+IFhBor5hXQC6yXs5rQbDEYWqY637k84AiaOxakK1n2TCAdD18dj1iMeYWx6NSuEDyn2ixcmbQJTjD6rrfjw4gQ=
X-Received: by 2002:a5d:6d85:0:b0:38f:3d74:9af with SMTP id
 ffacd0b85a97d-38f6f0d0806mr6580744f8f.45.1740236805307; Sat, 22 Feb 2025
 07:06:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <d266338a0eae1f673802e41d7230c4c92c3532b3.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZezPtE+xaZpsf3B5MwhpfdQV+5b4EgAa9PX0FR1+iawfA@mail.gmail.com> <afc4db6mt3uuimj4lokfeglhqc22u5ckgvunqtiwecjan5vjj2@lvphketnxhhr>
In-Reply-To: <afc4db6mt3uuimj4lokfeglhqc22u5ckgvunqtiwecjan5vjj2@lvphketnxhhr>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 22 Feb 2025 16:06:34 +0100
X-Gm-Features: AWEUYZkJMUGTJnf0tyUt8lWwOa_mEt-qqEj8jwlDkAHHUkPqAhs2iK4gMtYGacQ
Message-ID: <CA+fCnZdhvzUs6NWxCz+PcxBf=tz5xcsHOraKT5+y+vNJb2b-Lg@mail.gmail.com>
Subject: Re: [PATCH v2 14/14] x86: Make software tag-based kasan available
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

On Fri, Feb 21, 2025 at 3:45=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >What's the purpose of this config option? I think we can just change
> >the value of the KASAN_SHADOW_SCALE_SHIFT define when KASAN_SW_TAGS is
> >enabled.
>
> Well, I was aiming at later adding the "default 5 if KASAN_SW_TAGS_DENSE"=
, and
> this way it would look much cleaner than the:
>
> if KASAN_SW_TAGS
>         if KASAN_SW_TAGS_DENSE
>                 KASAN_SHADOW_SCALE_SHIFT =3D 5
>         else
>                 KASAN_SHADOW_SCALE_SHIFT =3D 4
> else
>         KASAN_SHADOW_SCALE_SHIFT =3D 3

I think this is fine. It's still better than adding a non-configurable
config option.

> But now that I think of it, it should be possible to overwrite the
> KASAN_SHADOW_SCALE_SHIFT from non-arch code if dense mode is enabled.

This should also work. Especially since the dense mode will probably
work for arm64 as well.

But let's keep this series self-contained.

> That's a topic for the next series but I'd imagine all architectures woul=
d
> normally use the 16 memory bytes / shadow byte and if they'd care for the=
 dense
> mode they'd go for 32 memory bytes / shadow byte. Or do you think that's =
a
> faulty assumption?

Probably, but for sure I don't know, not that many architectures that
care about memory tagging yet :)
