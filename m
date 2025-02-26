Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5CE2236F7
	for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583483; cv=none; b=llne1O3eXhSKVZEGlL0oWjH6qntlRltJuEBcn9bLyNv++nmBVjlDPjCdnoHeLvEHke+brqmA1Poa9hDv62dy59sH2ewC3damZK0n7yKE7ycd/HKDd4DBG40/cWiKdtAFGjHMKJi43HeDMUshwPxkQG/16gfaLdestb0whgrS0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583483; c=relaxed/simple;
	bh=3/PfVD/S0beWYFNeAotOPd40DSLrT6WAE68cwuy4Z/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dDFCM0tcVkoXbonjZ8YcebWXz1xTqnuzLQ2hQvRDj6g7HcNeKkmOzOMXAskwD3k1PMLtKusfP4krYB+QcqVL+0VFM2Hmlf2bMVQpHgwT+Crha+6TetFXTCdryO/WEESiO1xyEe6toZ5KKjNXwOZsbrxbrhS9HrlH8QrcQJtcH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmck3+MZ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmck3+MZ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4399d14334aso61126435e9.0
        for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 07:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740583479; x=1741188279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsuCvPIYOZxMSn5nKFFEtm5mHOuqFxBxK/9CbbLtirI=;
        b=bmck3+MZvw8oVPVSQZB+xSroZIuErD30C5B9Z1HhtGgr8n7C/BYKzTnwjwliYEWoru
         0t5OJwuRQiB+qpWatpkvUWYEuBQcKT2vjaEYCcNui2/WVtrifbwxRJPZlwVKfKKZDdAP
         e+L5J/NtXDmyN3uPCsrLWwj2AL31PLc+MAtY3moogGo2PlgwGzN7fAyxL8dfEvsy70W7
         3SEGJhJbNwbp80loD9c3eb1QTkHXHwnZfXttBrDXYBOA0qC6mM+FcbfYN6nDpvkewYfq
         h+SCPylsZFg8V96COr42btWJZST6iWQkVMRF2WpCTYa/IO82e4K80aoXJi9opfVccTiG
         5FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740583479; x=1741188279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsuCvPIYOZxMSn5nKFFEtm5mHOuqFxBxK/9CbbLtirI=;
        b=JkoILUyBsCtjYLZ8r+bNZfKs0CA9mPiqpI5vuXXbIg1I7NCvb12gDqhMl46IGG2Yuw
         rMukTuw8OymQsbaGxZ8oZgj9cAWSgEROcyP0X0cCB4TwQgRqG1K6f6xOj2Y5UW+5drcS
         DspVK89vpVVLca0UpasHMJWIwukN5s8e52mpgrvmUvkQYdUD3J/CTYhChCOm4GJhS/nW
         0dxucLRafsx7WLUSvQvghOkMcp4olYL6aj1KnDFIaP3xdYVrjeutWq6JEhl0b0DjwLgB
         vaIduJc1qXck5rJhh09s8uRd0aJVlMrLNWOsbx/Oq8JBfRaTbspntueDMF8UqxBg7ux/
         KhaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIvFUEQqvkdHeQzN2TzxZgiBcFvVUcq85vnC09DlIIHkf9bamwBck9yvn6oCaDxGCZpQHz@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb11eP77rrwRQddXIg+QjwmE9I0XITr/Ngq6122YyioXB/dBiK
	J2Dtn0zTDX56XQrvAmHIY9A35nOHheDkT1CHBXjGJ+irz8cK0obeVzVzLfzqt3WTGco1DuCeRd4
	T7iv06LBJE2HGPq/Yfj3WkczLxqk=
X-Gm-Gg: ASbGncteRelRIUXs7cc1InqKdCQseqwUwQrgW5KPXbXf9LNDU7H6p67p8t12CRNdY5k
	5b+7m10lEoGQAckezpr20GLciizDlsTrnWkj+P4m1MItPwyE76ovPH8U6fYfDvwsyTDOwF5sBUT
	b7FR/rWOYizQ==
X-Google-Smtp-Source: AGHT+IHrvicEAjuDRUywYtjbdluORS9DbtcVPJQWBJkKvDDRVQNrfEoh71Lo3le8ngVV4cTzym1PeNRSV0ffNMSQYUc=
X-Received: by 2002:a05:600c:3548:b0:439:8a44:1e68 with SMTP id
 5b1f17b1804b1-43ab9046de3mr32060425e9.28.1740583479193; Wed, 26 Feb 2025
 07:24:39 -0800 (PST)
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
 <CA+fCnZcsg13eoaDJpueZ=erWjosgLDeTrjXVaifA305qAFEYDQ@mail.gmail.com> <ffr673gcremzfvcmjnt5qigfjfkrgchipgungjgnzqnf6kc7y6@n4kdu7nxoaw4>
In-Reply-To: <ffr673gcremzfvcmjnt5qigfjfkrgchipgungjgnzqnf6kc7y6@n4kdu7nxoaw4>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 26 Feb 2025 16:24:28 +0100
X-Gm-Features: AQ5f1Jpqwg1oQbqitjHoWgohREHEbfWOkzeGk2nGzOh9RmhEEI44EKvWgfDP0bM
Message-ID: <CA+fCnZejp4YKT0-9Ak_8kauXDg5MsTLy0CVNQzzvtP29rqQ6Bw@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] x86: runtime_const used for KASAN_SHADOW_END
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Florian Mayer <fmayer@google.com>, 
	Vitaly Buka <vitalybuka@google.com>
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

On Wed, Feb 26, 2025 at 12:53=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> After adding
>         kasan_params +=3D hwasan-instrument-with-calls=3D0
> to Makefile.kasan just under
>         kasan_params +=3D hwasan-mapping-offset=3D$(KASAN_SHADOW_OFFSET)
> inline works properly in x86. I looked into assembly and before there wer=
e just
> calls to __hwasan_load/store. After adding the the
> hwasan-instrument-with-calls=3D0 I can see no calls and the KASAN offset =
is now
> inlined, plus all functions that were previously instrumented now have th=
e
> kasan_check_range inlined in them.
>
> My LLVM investigation lead me to
>         bool shouldInstrumentWithCalls(const Triple &TargetTriple) {
>           return optOr(ClInstrumentWithCalls, TargetTriple.getArch() =3D=
=3D Triple::x86_64);
>         }
> which I assume defaults to "1" on x86? So even with inline mode it doesn'=
t care
> and still does an outline version.

Ah, indeed. Weird discrepancy between x86 and arm.

Florian, Vitaly, do you recall why this was implemented like this?

To account for this, let's then set hwasan-instrument-with-calls=3D0
when CONFIG_KASAN_INLINE is enabled. And also please add a comment
explaining why this is done.

[...]

> >What do you mean by "The alignment doesn't fit the shadow memory size"?
>
> Maybe that's the wrong way to put it. I meant that KASAN_SHADOW_END and
> KASAN_SHADOW_END aren't aligned to the size of shadow memory.

I see. And the negative side-effect of this would be that we'll need
extra page table entries to describe the shadow region?

[...]

> I think this was a false alarm, sorry. I asked Kirill about turning
> pgtable_l5_enabled() into a runtime_const value but it turns out it's alr=
eady
> patched by alternative code during boot. I just saw a bunch more stuff th=
ere
> because I was looking at the assembly output and the code isn't patched t=
here
> yet.

Great!
