Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FCA31A83F8
	for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 21:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742853515; cv=none; b=NAkHHGPNawT1SjIHeQqAmRlkQEzK93uc4MQWYgL1bo4GQu1EO2h/xamxQN8tqoCYgiciS2kWRSbMAtSNMn3CffgSA9rzQpTJJPlXy9vccHTaOoA9odbA0wxKHcFbRF6nsQX86fP2pe+YjCmYsK4FohHv2x2uJ3oxLeWAI2xfE0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742853515; c=relaxed/simple;
	bh=Ot1DfOQiy27nUyF1DlyhAcVDQgk2TuJxclhmeyMz1OM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlyggU3qLSi4E2sB9NrNqJt+BheyaxJ8SOERTvBqkBF0P3Z0Zk20bGokjKqD8Abfpe3Fx7Bh5+YaH9lL7ZuINnLO2545ufMWhK7AP0CKLFBTLwBjBYyFwFhL09IxYD/08ubJw0luJ0Ig6jeh9BP1GskS94mif9p3fySn+/S8xkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwr8d/7S; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwr8d/7S"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso52330425e9.3
        for <llvm@lists.linux.dev>; Mon, 24 Mar 2025 14:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742853512; x=1743458312; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ot1DfOQiy27nUyF1DlyhAcVDQgk2TuJxclhmeyMz1OM=;
        b=bwr8d/7SEbAWRJDAjwaiV7sE9EmdWx/2vWwiGLANCUyE/pBMIXW2bN3PUmPDG2qTTE
         VnI8No7/l1ICrfV5DllUHxoK+Amf7HKnNOjBIjiEfJtEIUd0elAnfsGO+Udt8ItDDNAs
         4X9Lf9o0v5mpREZ9yAPhwev4IUpsieQfM2sTl83XmfCsKAaotbExn13qfpBqk8TMH9od
         SK7qfCYSTxr4xgDPp6Ve+AE4WuXQu99udIwcTQ8Py1EehwcLNCgXQAKZ7B3ojl2lECL8
         71lQBOeRrDgLAYNoB1Wk1u0XG87He79oaRwBIrIWa8kM27EgQy14FqeNwoJbBM1yi0oq
         hFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742853512; x=1743458312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ot1DfOQiy27nUyF1DlyhAcVDQgk2TuJxclhmeyMz1OM=;
        b=jpt+QC5ciJ5R7hzcEZM0uvEeI5YvBacgMZfBDFOKILnXpcOZ+xKVKqDp/3XvDvLAo7
         nVFDbKqwwK1o1jd85STQV7uR5zK+3f6RUHGNgSb9YdBvVxtkiOq9peGj2S/e5KDE5cIf
         IRMWsAXhuaIPuxOW4B5GeOYneB5sS92Pu3UlXR5p0UCQfbJc/wyTKXFGyT1OX/mbZBZs
         2BsgEI90qLckb9JojAc4L/s+XtQ2LM26Wlbp5c5ZKn/QHzcWfhCeG2J3ABKoaJ4Q3YHb
         d66SFmZNxj+wffYIbshC5g+tyuFFs1r79BuGuzm+tszsZCrXz0gNRSOuPHi1PKeVEM7h
         HU8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIOWVtqBvNJE5a7aRTrDJ1nbmaHOR03/jy+zTDPp5kUolnA+1LAINHtH41XFbL0pLffhAV@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4bhfMPe8/zcl2tl37K/CcdV8SBP0ddFiWIe3sR93we6ZmD0hf
	8/rYPMyk5ixaJZlOqbkDEa07663GIj20sIUzTiNddgg+WppyoaoH5TBCLThUH0qiQhD3xjLgoMs
	ekWh8cTSew0j7bbYW48FSlH/2VJw=
X-Gm-Gg: ASbGncv6LqW7GpcxBw95JoZ40wEVsebHy0jJ1Q+BrwgX4TI2BeYggNQjnbgfX4kt1GQ
	aYijakp4CXyI1B6cxgYtQcxmhFGh8QjH/mPCaitEjBWu2tRqjzgX3nTt5OiIjFTeSWB1U0c+mry
	/0neQfopO0p1Y0zc7FrIlnWAiejZ8=
X-Google-Smtp-Source: AGHT+IEUUuY2Db0h5BkUCKLvsIxKl8NZK1oeGSqYQqEHhk5l2ar/r7SKmTR9x8h91YsnG4+AUcp+k3SBeke2mv0hzmY=
X-Received: by 2002:a05:600c:4ed3:b0:43d:db5:7b21 with SMTP id
 5b1f17b1804b1-43d5dc40c1dmr56681635e9.28.1742853511979; Mon, 24 Mar 2025
 14:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+fCnZdtJj7VcEJfsjkjr3UhmkcKS25SEPTs=dB9k3cEFvfX2g@mail.gmail.com>
 <lcbigfjrgkckybimqx6cjoogon7nwyztv2tbet62wxbkm7hsyr@nyssicid3kwb>
 <CA+fCnZcOjyFrT7HKeSEvAEW05h8dFPMJKMB=PC_11h2W6g5eMw@mail.gmail.com>
 <uov3nar7yt7p3gb76mrmtw6fjfbxm5nmurn3hl72bkz6qwsfmv@ztvxz235oggw>
 <CA+fCnZcsg13eoaDJpueZ=erWjosgLDeTrjXVaifA305qAFEYDQ@mail.gmail.com>
 <ffr673gcremzfvcmjnt5qigfjfkrgchipgungjgnzqnf6kc7y6@n4kdu7nxoaw4>
 <CA+fCnZejp4YKT0-9Ak_8kauXDg5MsTLy0CVNQzzvtP29rqQ6Bw@mail.gmail.com>
 <t5bgb7eiyfc2ufsljsrdcinaqtzsnpyyorh2tqww2x35mg6tbt@sexrvo55uxfi>
 <CA+fCnZdunJhoNgsQMm4cPyephj9L7sMq-YF9sE7ANk0e7h7d=Q@mail.gmail.com>
 <s7wo5gqrvqfiq3k5wf2pwdurtdrzixlubmck5xgrr4eoj33hi4@vjexcwpp7g4g> <zmebaukzqlem7qrskdbqyzdsqcgpp6533vvfbo4vh3vtyeh4iu@yghuqyloverw>
In-Reply-To: <zmebaukzqlem7qrskdbqyzdsqcgpp6533vvfbo4vh3vtyeh4iu@yghuqyloverw>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 24 Mar 2025 22:58:21 +0100
X-Gm-Features: AQ5f1JqkwSi0yThMsOGpogsoWYqU98B_Blb_P24sQK5qkQMRfsxA3HC1ACSj060
Message-ID: <CA+fCnZfzA8f2rjq0CAYBvGtQLxZKOWk+3BWwjrdP-T-ncdeLpg@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] x86: runtime_const used for KASAN_SHADOW_END
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: Florian Mayer <fmayer@google.com>, Vitaly Buka <vitalybuka@google.com>, kees@kernel.org, 
	julian.stecklina@cyberus-technology.de, kevinloughlin@google.com, 
	peterz@infradead.org, tglx@linutronix.de, justinstitt@google.com, 
	catalin.marinas@arm.com, wangkefeng.wang@huawei.com, bhe@redhat.com, 
	ryabinin.a.a@gmail.com, kirill.shutemov@linux.intel.com, will@kernel.org, 
	ardb@kernel.org, jason.andryuk@amd.com, dave.hansen@linux.intel.com, 
	pasha.tatashin@soleen.com, guoweikang.kernel@gmail.com, dwmw@amazon.co.uk, 
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

On Mon, Mar 24, 2025 at 11:50=E2=80=AFAM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >So I assume that if outline mode works, inline mode should be fine as fa=
r as
> >kernel is concerned? If so perhaps it will be more time efficient to pos=
t v3 of
> >this series (once I'm done with kasan_non_canonical_hook() edge cases an=
d
> >unpoisoning per-cpu vms[areas] with the same tag) and work on the clang =
side
> >later / in the meantime.

Generally, yes.

The inline mode also might require adding some __no_sanitize_address
annotations. Typically for lower-level function that get messed up by
the inline instrumentation. But the annotations previously added for
the Generic mode would work for SW_TAGS as well, unless SW_TAGS
instrumentation touches some other low-level code.

> Oh, I guess I also need to add a patch to handle the int3 (X86_TRAP_BP) s=
o
> kasan reports show up in inline mode.

Ah, yes, for SW_TAGS, need an appropriate handler here.
