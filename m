Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779FF1A5B8A
	for <llvm@lists.linux.dev>; Tue,  9 Sep 2025 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429184; cv=none; b=Y2Ops+eRkIuT+9SoiCzl0C2Gk2Q4ZQ4DpLWISQWcVqZ+gO6fpEP+0cCVFeqqvzY7R5exHx7ieaS4Dfkcui3qcPMDfWRy19b4bwa+FjliEJD/qv+hLudPLbiy5FU7+QQ3dCZuY0K8vVTeGXeZRjWajGGZSR4//XVpQDE9hAHb+l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429184; c=relaxed/simple;
	bh=8Dkc/G5/ZxR10KU8r6Kq+n//YpEPGdweuWGyN3lNIao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxyrJXY9CEUOnwZgY/fv2HSXyyPGaIiaaX0okXIklXd60zIMR/zbJXIIXy00dW9MwfuqRwVOW7BQXp952FMJv/PARkdug0qB5qjU2sCzjiA8iPFb3m+y0z8Pk5R9BPnvsXDwlXDBKXdt9Aok1KYIjIi7pr+bWQFdf19sKovhfAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pcp1LWPs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pcp1LWPs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso4886636f8f.3
        for <llvm@lists.linux.dev>; Tue, 09 Sep 2025 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757429181; x=1758033981; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQ6pjHDMM+suXT8naiE9csEpW818jUZBYVFNTfCYGno=;
        b=Pcp1LWPsk9SmYYlHoIvB9DdMymRxtVAiKvxbkWH1uAjoFqFxqiN7W2g1srSMQFLROh
         AXS6e+3NNgTJc2gUtZcvKmUCV+zvSeAUCc4NofF6XOZRZs6OfvMr/vhVIsT2kZ3hVaF0
         f7fQHPzU/ZFfxbt+XlO6f3XmCEZVFQb5gnV0PI/IqfZ0DzgPLGWRDWP5TYbmqoGL6rKa
         HM7vMQEcm8gCz8ZH+hSYB4MvYmv4+F5Z0n50KIH1pjmZYN0DG1bFtUbXUv4snRkb7xmF
         IQEBYQ3HQc6xVUoo3oJvUwfSZgBcg/1t/R256efbwEKcXzamsOyl1v+Zcr9j7gf4sFiM
         v/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429181; x=1758033981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQ6pjHDMM+suXT8naiE9csEpW818jUZBYVFNTfCYGno=;
        b=i0i1KRm0Ux/QjUBLDww3zhXYwyx9xfZ1uKN/x5VOKIY8InfaU5qSmMK9gVR3dXO89d
         8vNsG4zhlhmolNoMrpQfcnVUAAe4tfgBPcL8wKlAAr3dGIwJZ5kKxHzEI/8HMXpXGJ+0
         jRk2UWIuG9AKY1WX8gp1LHOkGEemut3kVnfSrQMhnKVa3Ro54/nhftpTuXOaRwK3wGIn
         McsJx5yEgkV52RzveHw/ILzmMM6pUf7PTCfr+MOPAIjOwzXPKrebLRWwu+TJIoc7Oso1
         9udrCb85G7DkTcr4kBeEsiy+VCqxD43GiQXSbSR23NEMTofCNws/Ha07b0VyHxlOAR9F
         64xw==
X-Forwarded-Encrypted: i=1; AJvYcCVl3uvfH+wi+5Y+QM+ida4fZNQ5tz2pgtU2zHnaohRXE0y2QZoUbB+04lhBHsnClt0oa6vB@lists.linux.dev
X-Gm-Message-State: AOJu0YxrGwFEHdzmh5ZvTeT2kL4EtmiKRUCM0AbGBxntXZOfKwhY8RjL
	3GzvdKsIcpzCkIzE5qTmDtDKnj3JOCOyLNuj8a9T62niiijqIICB0U803CADMezr0/+lCQBNj6X
	nS10zqAMaYEA1nhxY0vIn5fIGRSpHzZw=
X-Gm-Gg: ASbGncvGbSCR23Orq3VnRzsS49/k8aPyRcHrRayqQmkUfmbIb48WzVg4z1bzjo4TFNV
	TghMbhyWrZQBIF+00QFHlo4QkhiAyItZDTLeYh2mfcqlP+U+/WoFvWeitN/8eysxMMhRMLXJqbU
	OpDOwlKdmMU+qjDIGk7kCHjlcPcl48jG6eTFVzGL/vZDboC+FyvNs9Gpu0WIXkkoF83/wi0i/hs
	cMeCKLMCW4i+c5fSUA=
X-Google-Smtp-Source: AGHT+IHb1KmB6lnjW41yclSEzy+oVUecoVoO4XyT9rv1AyycY2cmZP7ch9LbWppf7fa3h/2TrIKAOfOqCRnTeUq53aA=
X-Received: by 2002:a05:6000:401f:b0:3e7:4991:87c4 with SMTP id
 ffacd0b85a97d-3e749918b76mr5400755f8f.61.1757429180544; Tue, 09 Sep 2025
 07:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <2f8115faaca5f79062542f930320cbfc6981863d.1756151769.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf1YeWzf38XjkXPjTH3dqSCeZ2_XaK0AGUeG05UuXPAbw@mail.gmail.com>
 <cfz7zprwfird7gf5fl36zdpmv3lmht2ibcfwkeulqocw3kokpl@u6snlpuqcc5k>
 <CA+fCnZe52tKCuGUP0LzbAsxqiukOXyLFT4Zc6_c0K1mFCXJ=dQ@mail.gmail.com>
 <m7sliogcv2ggy2m7inkzy5p6fkpinic7hqtjoo22ewycancs64@dnfcl2khgfur> <CA+fCnZc3ZY43KeQcWSw4kgcCqJpAvNj6gKd+x0AkjhuE2R8Hdw@mail.gmail.com>
In-Reply-To: <CA+fCnZc3ZY43KeQcWSw4kgcCqJpAvNj6gKd+x0AkjhuE2R8Hdw@mail.gmail.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Tue, 9 Sep 2025 16:46:09 +0200
X-Gm-Features: AS18NWDf03t8X97flQzZHTvir2nukoTD6nPxpyweIbo71u3mhN5KV1t_32mprjc
Message-ID: <CA+fCnZd6qJRcSukbCuvH5n0KcGYxmrLi=_9vRA7HvRpSbYJNmA@mail.gmail.com>
Subject: Re: [PATCH v5 15/19] kasan: x86: Apply multishot to the inline report handler
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: sohil.mehta@intel.com, baohua@kernel.org, david@redhat.com, 
	kbingham@kernel.org, weixugc@google.com, Liam.Howlett@oracle.com, 
	alexandre.chartre@oracle.com, kas@kernel.org, mark.rutland@arm.com, 
	trintaeoitogc@gmail.com, axelrasmussen@google.com, yuanchu@google.com, 
	joey.gouly@arm.com, samitolvanen@google.com, joel.granados@kernel.org, 
	graf@amazon.com, vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org, 
	thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com, 
	kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com, 
	nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com, 
	justinstitt@google.com, catalin.marinas@arm.com, 
	alexander.shishkin@linux.intel.com, samuel.holland@sifive.com, 
	dave.hansen@linux.intel.com, corbet@lwn.net, xin@zytor.com, 
	dvyukov@google.com, tglx@linutronix.de, scott@os.amperecomputing.com, 
	jason.andryuk@amd.com, morbo@google.com, nathan@kernel.org, 
	lorenzo.stoakes@oracle.com, mingo@redhat.com, brgerst@gmail.com, 
	kristina.martsenko@arm.com, bigeasy@linutronix.de, luto@kernel.org, 
	jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com, mhocko@suse.com, 
	ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org, 
	peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com, 
	ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com, 
	ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org, 
	akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org, 
	pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev, 
	will@kernel.org, jhubbard@nvidia.com, bp@alien8.de, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 4:45=E2=80=AFPM Andrey Konovalov <andreyknvl@gmail.c=
om> wrote:
>
> On Tue, Sep 9, 2025 at 10:42=E2=80=AFAM Maciej Wieczor-Retman
> <maciej.wieczor-retman@intel.com> wrote:
> >
> > On 2025-09-08 at 22:19:11 +0200, Andrey Konovalov wrote:
> > >On Mon, Sep 8, 2025 at 3:04=E2=80=AFPM Maciej Wieczor-Retman
> > ><maciej.wieczor-retman@intel.com> wrote:
> > >>
> > >> >> +       if (kasan_multi_shot_enabled())
> > >> >> +               return true;
> > >> >
> > >> >It's odd this this is required on x86 but not on arm64, see my comm=
ent
> > >> >on the patch that adds kasan_inline_handler().
> > >> >
> > >>
> > >> I think this is needed if we want to keep the kasan_inline_recover b=
elow.
> > >> Because without this patch, kasan_report() will report a mismatch, a=
n then die()
> > >> will be called. So the multishot gets ignored.
> > >
> > >But die() should be called only when recovery is disabled. And
> > >recovery should always be enabled.
> >
> > Hmm I thought when I was testing inline mode last time, that recovery w=
as always
> > disabled. I'll recheck later.
> >
> > But just looking at llvm code, hwasan-recover has init(false). And the =
kernel
> > doesn't do anything to this value in Makefile.kasan. Perhaps it just ne=
eds to be
> > corrected in the Makefile.kasan?
>
> Recovery should be disabled as the default when

Eh, enabled, not disabled.

> -fsanitize=3Dkernel-hwaddress is used (unless something was
> broken/changed); see this patch:
>
> https://github.com/llvm/llvm-project/commit/1ba9d9c6ca1ffeef7e833261ebca4=
63a92adf82f
