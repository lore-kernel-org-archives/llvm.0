Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C427331A53
	for <llvm@lists.linux.dev>; Mon, 20 Oct 2025 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980403; cv=none; b=u9foT+XB/QmEh+C93MEvy98sskx/lBtbtBmKpBelWx+5vbNI20eG5VKdDDEwceaAruqcX3YD9JVCy6N64OpLMfLTlkym14LSadJuoV6UukPndjUtlJUkS0yJgQXb71nSu7TE/Mcol5tHrZO68KxwZBIlP6pgbYdxIh+q89l+lng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980403; c=relaxed/simple;
	bh=qdhd4fAQohIjlG3EgHDubuZx3bxc7SthTqZLWrGkZjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upyycFURd4ITeUJ35ljU5rbZvBX4+ozILLSVhzBgXdWguusIG00vJ5ZCvh1Jp6nM9gkt6dKFNED7wcGvJRfU/tzoox9R5gdXCo/3X5R0ds0LuwNsC8FVkpj/N6Ybj2o/K8eCwARez7cuRkiDYoQFGVPAFnbt1ksPzVRxWuXL5eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LF9T4pRm; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LF9T4pRm"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-421851bca51so3743896f8f.1
        for <llvm@lists.linux.dev>; Mon, 20 Oct 2025 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760980398; x=1761585198; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGI6Q7BTAs/HMJAhH5ug/+5JV+NNvoV5bQjyt72+yc0=;
        b=LF9T4pRmdP7F8QjeQzqIn0WCllrfzb+DIPNyrvkFvvuvI3kVLC03C1wyZ/kmfKgpUZ
         7Lu8bzzpRxTcW5cbWC4vtnIuo8zB/hIe0gQQSZfyrE8HLKA97ejOmx3foMKvvNac4rH0
         +4gsyeQRm7frZx3Pb9ZWGDBmD2LkFtev5MWR2CHPxX21LEybzuMRaWiywuN8upR6CRRm
         6WdZAqY4zDRGeDgADnGfu2f5pZzheo13fq/lx3L0jBFm3xMJ3Sgnv1Iuje9eiGRGBx5x
         5i4pcEBBH/k68eXsmIe9zhsojoE2kYjq88zsbakMGd1TCp4QxIxU+qVkZAms0WWCEh1k
         jfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760980398; x=1761585198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGI6Q7BTAs/HMJAhH5ug/+5JV+NNvoV5bQjyt72+yc0=;
        b=Ge9yHvZgQmUqkJ1OpJ3Z/tjb0VZJ7qMU4B/TOc2Qj8CIymGRiW/VNODO0ZUMTEscuG
         IgEfRscGUKe4GnMK6MgcgBpsjzQcoo+sF/njQCLseDjX+Vko97AcnbNSC+jISRjr4zxM
         ZB6Onm0Wk7lRPsh9MwylNVA6hAbJxiDdBZTZBGzmvP357Aa3ctOgBWDp+s7jf8uppcvo
         3dUtNJJK2MtrOUSw79A+OHaWoW2pKKI2J45yvLhnPHAYl1G+rW2Q3O1r2J2BBzkPQ2Rp
         bt6v0nx59coeqsP09RPXwZQsUVnH8aq2FUnXBOwEbkC1LWlrKNcaNP28mLWTyfOUATIX
         4K5w==
X-Forwarded-Encrypted: i=1; AJvYcCVW2GFxbeu3NtKA6Azgmez5Si0J/lH8YmlRpdB+a0KhVWqDvOCboPTVZN/OUbzPEihnCU6X@lists.linux.dev
X-Gm-Message-State: AOJu0YxTS28enVVIlBwQ//PfGUZU5G8ZWnPzxoQMiiGr338vaCOhjxBm
	TE/IiJNvHwCE2cvoSbwmcxsfUtg4lJs9gOY8DSlalg1bhPk2VAeeiCourtcX0KXEVpazkVSfI6D
	TeUdzRffjAZvOA37w0Hp2gwwVI+C1rGU=
X-Gm-Gg: ASbGnctYjYLNGSvwklNrfZt2caPDfYUNgg2He+7rFhiV2YmPmp+BxxNh75q7fTu2sa1
	Nvp/xpooaVXuBsS9miTNqgZ5JV/hdz6ouVOzIxxeOLPEsNVGKIBodtZ8ZU3IXe/1XXT0u3Qtj5F
	l/r6Ggyyo3dZWR/TcbPTR8dXfeWKzcSIGT7K7coLZo2IaoN2lDCIV3MfWDfCroHa7eJursKJ2ZR
	48uGW3H+pf91YfcGHJkIMiln6iThQe4YA+ezRuPvMaZ/HRDWR097uVN/Q==
X-Google-Smtp-Source: AGHT+IEodoyCQ4s3ezeiwvbSuedTGQrnQgPdmuDQggu8D72dLZWaeRuVepbyTu1eDOJWleQ/3mxUOhbhAORfmNTXRPQ=
X-Received: by 2002:a05:6000:2f84:b0:425:7179:16eb with SMTP id
 ffacd0b85a97d-42704d87ee4mr8625832f8f.17.1760980398375; Mon, 20 Oct 2025
 10:13:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250929172724.75108-1-sj@kernel.org> <75584276-6d30-4e35-9e59-e084c60d1c5f@linuxfoundation.org>
In-Reply-To: <75584276-6d30-4e35-9e59-e084c60d1c5f@linuxfoundation.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 20 Oct 2025 10:13:07 -0700
X-Gm-Features: AS18NWD-XcABY9AYH26aivrP7s7U2VJn_xaY3Jej0bnRhuMSCHP69gzanE8702w
Message-ID: <CAKEwX=PBrcPnEkEhWQn_CTtT04qaKY2WsWXjDSSyPUGX4yY-sw@mail.gmail.com>
Subject: Re: [PATCH v1] selftests: cachestat: Fix warning on declaration under label
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: hannes@cmpxchg.org, nathan@kernel.org, shuah@kernel.org, morbo@google.com, 
	justinstitt@google.com, nick.desaulniers+lkml@gmail.com, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, david.hunter.linux@gmail.com, 
	Sidharth Seela <sidharthseela@gmail.com>, SeongJae Park <sj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 1:07=E2=80=AFPM Shuah Khan <skhan@linuxfoundation.o=
rg> wrote:
>
> On 9/29/25 11:27, SeongJae Park wrote:
> > On Mon, 29 Sep 2025 17:24:06 +0530 Sidharth Seela <sidharthseela@gmail.=
com> wrote:
> >
> >> Fix warning caused from declaration under a case label. The proper way
> >> is to declare variable at the beginning of the function. The warning
> >> came from running clang using LLVM=3D1; and is as follows:
> >> --
> >> -test_cachestat.c:260:3: warning: label followed by a declaration is a=
 C23 extension [-Wc23-extensions]
> >>    260 |                 char *map =3D mmap(NULL, filesize, PROT_READ =
| PROT_WRITE,
> >>        |
> >>
> >> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> >
> > Reviewed-by: SeongJae Park <sj@kernel.org>
> >
> >
>
> Johannes and Nhat,
>
> Assuming this will go through cachestat tree
>
> Acked-by: Shuah Khan <skhan@linuxfoundation.org>
>

Hi Shuah.

LGTM:
Acked-by: Nhat Pham <nphamcs@gmail.com>
