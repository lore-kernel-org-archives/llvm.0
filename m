Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A0539CCF9
	for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 18:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658226; cv=pass; b=JOJHj+DQO8P3cqkliGCYyqrb95Q7lKltFH6Ual3GxfsIfsKGRpPaazqlasTb6hwNG7UNBuRYow1etxMf3GrX90jEijPdgPUFZMmmxyyinOMi18o+ptYzKFMoFrO5yREfRB07oqG97a283fBMF6bBmobfw+k30kOlC79EnPLtT34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658226; c=relaxed/simple;
	bh=qr18RvOXBpCqRo15c2cqUJX8bvTpVRYiKMUfReneauE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fyg16mcd2tOKZnPtjor6I+IDwCV7DIGImvv2qTfUzKYpZf+fOzPNYwIN2v/rJJRXQGUg5s2VyMT7kyJ5nGY1moQaPHMD+0VAxCJBbiZcddRfKsuiA1jIKRZbPKPIOvyRQaAiy2eKbGlTxWxFMk0ht+hmhPFniYPH51grpL6y6xU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B2H+ME7T; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B2H+ME7T"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso356a12.0
        for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 11:50:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791658224; cv=none;
        d=google.com; s=arc-20260327;
        b=bwvb+8SMzGgWldWIwf3wVeZmiOFnUVJpVdfYzuv5Uk23F5EqF3h4QrLZJx7+y2dhdV
         hBME1sTXVY6uBuHydW3xeEmJc6wYh8vTQWWc86ZVA7odX8vh1Nb/ykdLsXRXHsrgqWyZ
         8nPg1ej/MpuhrU4ueCXuekQnknmCUtJkWwR0V3qA2aQGpVlS4esRRKDrzB0iR/KzVvY9
         kbfhUuol4OoWnUm1VrR9ib+dxVc5vhdqdkA47w0iPMSQNz+H87gGYCjhT/IUBy+Ew0zt
         QFt/2fhlPo/Nh5Ndx3MZTr9pZPpsKF+G/PfuK/6fHt17Gcn7Q0kBDwANQZ0El9wG92ID
         YL6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RCAct7EWAduPCLZ2QGVMtJLjx5OgSp/kpcoOzmSgPLs=;
        fh=QtiyMnAGXoduGjsKxzL+Xvk/vV3mTBnI1mCSPifX31E=;
        b=OPreK1HxjKejj15LWvA3x26CEWYAO4cDJ4r/2KHGH7xpSyYsTnjnmWREwjyX2/nAYp
         ptra2HjfbncKnKjRffb8l1LP6ylFK0PMJhdVLlPFy4k8HAIqUOvJtPtrS5UNBfChzgal
         p7ToIpMDSQaWvP4HW5wYe/eCCNNqN9qddWjksZWP4OFyVoVTAcgi4pHm5yeI97pudtxe
         UTtiyfGLgO9YnlsoWZQr+IwOXeMWCS4XXiCAS0tShyMl78qg33c6uIeKit18YjPmwVN8
         w5m8guVjFh0d5fnJp+nijOteByObnthqoJJ3imPS6BR/AFE5GgCHSJUmFbM61KGW1djE
         SDeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791658224; x=1792263024; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RCAct7EWAduPCLZ2QGVMtJLjx5OgSp/kpcoOzmSgPLs=;
        b=B2H+ME7TM+Mun//lZk/qmum9nBxcIQ2aPb1bzNp7cFkmH0zQViqpcZ5Ge8eVDl4Neu
         il8ptSC2GC7WE/haOpXuZIj/t9s8A1Ke80WZZrWqNyu9APO6a03649LTyGJijXvgsv30
         ymJonA7d02eOJQ9RAmOK79tZfq3thua/pCIX6eu6kVWgpSliPR5AkPEj9msNOEgT5ZHG
         +xwOrbJYbMFizkfzDiek07lxXjW2++AOkAObrLO97HhJw2fjMQJ2gLAU+8Y1zKKzwipq
         LsPQv8+PYd3KD+KZ2v0yatFgZlJvPb+FzoQv05QrB1gWyUEh+qRhpMXffFoFD1k7I8Fg
         0Bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791658224; x=1792263024;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RCAct7EWAduPCLZ2QGVMtJLjx5OgSp/kpcoOzmSgPLs=;
        b=VY0Coxwsc1seok/J3GejT/cLYQRH5aYVl2X+S66S8/+Q/M+l8OXEeLuHjdc3W6OLIT
         T+S+2zTW6NZsOTM5S2xb/uhE04PUAD5/YRjwFYnmiMaXhum2vPDXgwMsk43Tq0cZY8Pg
         5GRx0Yus0wA3AyMEcai7tT11KU0Vo32rwiiMPY8pWAWmN4iqNGc1jK7lWvy2o67HHeIG
         iYcYREYzudaBmY+nsXWLbWPL7IZRU5g8gxfp7y0XYDX+G+ZzMtM0N2CXPxhALeWUC6Ed
         ZnlBX3ejYYsyYooxVjX4iN9qEjHlhT9td9pg5ElSWfp5//FVgKM/T/67FCzJJJHcszYR
         O1Og==
X-Forwarded-Encrypted: i=1; AKwUvBw3ZSjOmZMVM4VHHBloqtasYLSuXSBjsfnpZLO0p5iKIO6+JH2DzmpDD6BW7myawtrC1UUP@lists.linux.dev
X-Gm-Message-State: AFq9FYIWJWv9sTwJfxHAirGEnAQU8kJgJ4Z4FaUSVuCbf1YAn9vStN1M
	LfWAHL4Trd5JNApL7PXRZDKGbRPzQI0zKj0xzYovL/5HK3t0Wg58wf7ZTaNSA0o6ezDdJcSZrKg
	/7Gb7wVZOoKPnn8axWI0z4d6fGcLEFsiKhOFmVPZ4DjVrbUzyuxzzEQW7QXcVxA==
X-Gm-Gg: AYBFou3YC8sLxBDX8eVQFhDr8vYm9UxL6P62/mC4STJYYlm+FMeB97RMlwqhCoPXPYp
	nVA/UB/seyvFpMTUlyFWsb1SDAMfp9GdjUlGv4dq7uTOPYGD9s8jVlxEq9HHNeetD//7xenEf/b
	ApvWjj+XmziX96UfP6vbcP83zhjc9v2KUBJBqU67agY18J6J4o1jVO0SB2GWP3IkiQuy3UlZmqR
	rR4d48iHh90792ZiyOAnW/EBTWiX/0GHxN+ctE4N9UHUsq3VSpD7XNJ4ukQ1ycLNghVUS/jk+AL
	od+A2ImhuEBberoJLg6MyRR9QDsl3BPZM1pLAfF6fpXulshAzTW/ZA==
X-Received: by 2002:aa7:df8c:0:b0:6a6:8513:7e14 with SMTP id
 4fb4d7f45d1cf-6b1999f0a81mr27065a12.9.1791658223134; Sat, 10 Oct 2026
 11:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009214501.GA905361@ax162> <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
In-Reply-To: <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Sat, 10 Oct 2026 20:50:12 +0200
X-Gm-Features: AclHuK9XW8_fm_qLinjw3mJ_6Xz_X6pL-OrYahnEsVuiKXgP4DpOW6u5trcIM0Y
Message-ID: <CAF1bQ=TGW3VK7LK-d0JeYhEc3WgTjypVhQc22CxxvRq=VqS5YQ@mail.gmail.com>
Subject: Re: Build breakage from renamed '-split-machine-functions' plugin option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Han Shen <shenhan@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nathan,

Thanks for bringing this to our attention. We will need to rename the
option accordingly.

We need this option for ThinLTO (though not distributed ThinLTO).
During a ThinLTO build, LD is called directly when building vmlinux.o,
so the Clang driver change will not apply in this case.

Please note that I am currently on vacation and may be slow to respond.

-Rong

On Sat, Oct 10, 2026 at 8:46=E2=80=AFPM Rong Xu <xur@google.com> wrote:
>
> Hi Nathan,
>
> Thanks for bringing this to our attention. We will need to rename the opt=
ion accordingly.
>
> We need this option for ThinLTO (though not distributed ThinLTO). During =
a ThinLTO build, LD is called directly when building vmlinux.o, so the Clan=
g driver change will not apply in this case.
>
> Please note that I am currently on vacation and may be slow to respond.
>
> Thanks,
>
> -Rong
>
>
> On Fri, Oct 9, 2026 at 11:45=E2=80=AFPM Nathan Chancellor <nathan@kernel.=
org> wrote:
>>
>> Hi Rong and Han,
>>
>> LLVM recently landed a commit renaming the '-split-machine-functions'
>> plugin option to '-function-splitting=3Dall':
>>
>>   https://github.com/llvm/llvm-project/commit/3e6acc87c58843e551d6e8e4bf=
06c26712b04622
>>
>> This breaks builds with CONFIG_AUTOFDO and CONFIG_LTO_CLANG_THIN with:
>>
>>   ld.lld: error: -plugin-opt=3D-: ld.lld: Unknown command line argument =
'-split-machine-functions'.  Try: 'ld.lld --help'
>>
>> Obviously, we can handle this rename but I noticed that the combination
>> of '-flto -fsplit-machine-functions' should add the corresponding
>> '-plugin-opt=3D' since LLVM 15:
>>
>>   https://github.com/llvm/llvm-project/commit/72acd042bad35f78232f17addc=
02196a7af1a6e9
>>
>> So is this even necessary? Should we just remove
>>
>>   KBUILD_LDFLAGS +=3D -plugin-opt=3D-split-machine-functions
>>
>> from scripts/Makefile.autofdo and rely on '-fsplit-machine-functions' to
>> do the right thing or am I missing something here?
>>
>> --
>> Cheers,
>> Nathan
