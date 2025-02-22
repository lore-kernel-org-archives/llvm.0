Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E561411EB
	for <llvm@lists.linux.dev>; Sat, 22 Feb 2025 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740236856; cv=none; b=EpDlC1yzOhzgZ+xi1t1hO2pN2rKl7UL+FNjVZy7suRCqBGE1dZFeLjwgUtV4Pm6bYVJZcMz1w9X4N3pI7C5Gg7oMco15cmRvmWvJlD/Ffn7T+IJ226JF+UAKJdduutKkgQJyaOUHy8hvAUVIuSbysD6hVWS9R09MzC9GkhwxMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740236856; c=relaxed/simple;
	bh=70pD9gnFNEV46q1yL+XWGZJhvCSgCKDZIGACepg3f1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eo0UeM5EX/ZOGuTW8SFyebj18v+OAROWrqVP7i3/B1RgOVplZSeNWvucG180+BkQdVpgbyW7JBMsjwtfDr0mIObbx7aAxbhl1voD9qYneuTY0TAywsxWHI7k1Ddfybug9N7a9iTJz1j2G5vyekY7uFuMJpXcnKavn3YaCECpkdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dpy8U3bh; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dpy8U3bh"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e67ce516efso25072746d6.3
        for <llvm@lists.linux.dev>; Sat, 22 Feb 2025 07:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740236854; x=1740841654; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70pD9gnFNEV46q1yL+XWGZJhvCSgCKDZIGACepg3f1I=;
        b=Dpy8U3bhBnnjdb6nn4MqfI8XGScR3oMbfKDqHjwdavsjx69gOSJuqJ90IWX78aMDgT
         W1RSKKxMY8FTeVYWTxxE8kvsp4aAuX1hFk2uigqXsuCNQxlZRs+0dI9p/ybcqRthb1LF
         TFE0rNb1YX8o6BRT5EiiRFV8ApvN7R90icWkvdMAmYFFel2XHllQmyDBZgRn95eOlpqI
         ccwBuRn8AzIs5UpmKsXU+hcnWRHXNOeGJmG1Md/eP4n8BbYfzBBPP7b2rzRdxrVaNMEB
         OA3JLmiNggGNddaD3MXqVLkWd+l56w4L31qRbFiIsoR0RRMB84tAmeLz8DM6lvFp1gWT
         9+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740236854; x=1740841654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=70pD9gnFNEV46q1yL+XWGZJhvCSgCKDZIGACepg3f1I=;
        b=VMBYFzNegJTMPvrg4GsYTSkAen91HMbNwIVBUXI46zkeLC1XKBCHoADz4MMYeGHnm4
         mCOq85qdrYHajigljBnKOldyAXN02okegAz5w97Z3QzPdM4eZyTsRWRs7KYdBddSpTpJ
         fgNbzlyC87vBe2AyE1Zk6GvMqUGdZUvxqdqCXB8RGLyU0Zt5uXVL0CZ+b9kXhM9N6y22
         9tH52axfxke+OmB9LV3jqaq+KQtTvMNLgGe38+LMYbraCn7IfishilErgAIJ5IwBp02x
         0vniWYWSsvuw7HpR/xr3NQuSJ9hjwrTPEZx2DaPLvVRBTNkHf2bYUvJPrcdbii4RMrEI
         OQQw==
X-Forwarded-Encrypted: i=1; AJvYcCUX/xJsrkN54R3bdCkpHMQGDXmzkgQAfZB8dAmTDJJ6CkIGsVHegEQuMy+3zZDsdq8KEf5o@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxp1j9orKl8dE6NpNU7wp+z+07gafwp7DeP7E8kXuDjmUR7/LK
	B+J09iYWMH2ysxpfpsW/5lXlugYY3d6rOcbNpwGa7oQbIikYSXUmx61Cd84JNiHvWaEKXnysROz
	6+cvfi0owLvh0c+0XUQKvOkX6N9c=
X-Gm-Gg: ASbGncv0hBT5f8knLaetTjABGdBHlyNZk/Qvvhs44O8oPujRnsYX4pmGt6WNz2PUY2t
	rhlb8qUVazDHQnVLYm61iTXRX+ydPDV/KbSPcZTp9L1r3Vcu9HuYYT/5gR6NolFYRsUITtHeoJx
	3uw1SC3v+WpA==
X-Google-Smtp-Source: AGHT+IGzaUBBYsZPN6nwYD9SKzKfluRv9+knK4LuyyydKSabCwcaxgNi9q2iHeK7D9X3awEI3Ddvi+fItxaGI+EwcEo=
X-Received: by 2002:a05:6214:daa:b0:6e6:5cad:5ce6 with SMTP id
 6a1803df08f44-6e6ae7c9f82mr95965996d6.9.1740236853223; Sat, 22 Feb 2025
 07:07:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1739866028.git.maciej.wieczor-retman@intel.com>
 <2a2f08bc8118b369610d34e4d190a879d44f76b8.1739866028.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZdtJj7VcEJfsjkjr3UhmkcKS25SEPTs=dB9k3cEFvfX2g@mail.gmail.com> <lcbigfjrgkckybimqx6cjoogon7nwyztv2tbet62wxbkm7hsyr@nyssicid3kwb>
In-Reply-To: <lcbigfjrgkckybimqx6cjoogon7nwyztv2tbet62wxbkm7hsyr@nyssicid3kwb>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Sat, 22 Feb 2025 16:07:20 +0100
X-Gm-Features: AWEUYZlkmxeF6xgXCl21B3APEThb1gNkBITR5DJujsdnWalnykrR9HY2cVqQu30
Message-ID: <CA+fCnZcOjyFrT7HKeSEvAEW05h8dFPMJKMB=PC_11h2W6g5eMw@mail.gmail.com>
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

On Fri, Feb 21, 2025 at 4:11=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> On 2025-02-20 at 00:31:08 +0100, Andrey Konovalov wrote:
> >On Tue, Feb 18, 2025 at 9:20=E2=80=AFAM Maciej Wieczor-Retman
> ><maciej.wieczor-retman@intel.com> wrote:
> >>
> >> On x86, generic KASAN is setup in a way that needs a single
> >> KASAN_SHADOW_OFFSET value for both 4 and 5 level paging. It's required
> >> to facilitate boot time switching and it's a compiler ABI so it can't =
be
> >> changed during runtime.
> >>
> >> Software tag-based mode doesn't tie shadow start and end to any linear
> >> addresses as part of the compiler ABI so it can be changed during
> >> runtime.
> >
> >KASAN_SHADOW_OFFSET is passed to the compiler via
> >hwasan-mapping-offset, see scripts/Makefile.kasan (for the INLINE
> >mode). So while we can change its value, it has to be known at compile
> >time. So I don't think using a runtime constant would work.
>
> I don't know about arm64, but this doesn't seem to work right now on x86.

You mean it _does_ seem to work? Or otherwise if runtime constant
doesn't work on x86, then we shouldn't use it?

> I
> think I recall that hwasan-mapping-offset isn't implemented on the x86 LL=
VM or
> something like that? I'm sure I saw some note about it a while ago on the
> internet but I couldn't find it today.

In LLVM sources, ShadowBase gets calculated [1] based on
Mapping.Offset [2], which is in turn taken [3] from
hwasan-mapping-offset [4]. And then ShadowBase is used to calculate
[5] the shadow memory address.

All of this happens in the common code, so this should affect both x86
and arm64.

[1] https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tran=
sforms/Instrumentation/HWAddressSanitizer.cpp#L1305
[2] https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tran=
sforms/Instrumentation/HWAddressSanitizer.cpp#L761
[3] https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tran=
sforms/Instrumentation/HWAddressSanitizer.cpp#L1863
[4] https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tran=
sforms/Instrumentation/HWAddressSanitizer.cpp#L171
[5] https://github.com/llvm/llvm-project/blob/llvmorg-20-init/llvm/lib/Tran=
sforms/Instrumentation/HWAddressSanitizer.cpp#L899

>
> Anyway if KASAN_SHADOW_OFFSET is not set at compile time it defaults to n=
othing
> and just doesn't get passed into kasan-params a few lines below. I assume=
 that
> result seems a little too makeshift for runtime const to make sense here?

Sorry, I don't understand this question.

If hwasan-mapping-offset is not set properly, then in the inline
instrumentation mode, the compiler won't generate the right
instructions to calculate the shadow memory address.
