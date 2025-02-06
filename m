Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAF02B9B9
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853565; cv=none; b=h437rb+UCH3zNGVjQqqg82KCdFPImk+3q9nuTx/LMaG5Ozou7PIHtvFceWKeBQ7LMEYMuAJiv9sOKi6BBP++XZrKuHeVDZc1kdaKPvHOhkVpfYEJ9Hp0zSoE1WvRg3Xb7e2xZuBkZdyG6/KEYzxMe8M//K+6g6HrJ3tXPmHM9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853565; c=relaxed/simple;
	bh=RVIIcMwhcrDBbl7D7USwHDBp+LPSX1ouMmwjzMyDV+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YddOup/pjqThqOerQ2KOIPPTYu/td3wpxdT+gSCVM3qNMjaR5Pk8S+yH/C17nzBUaI+eka0eUrn58uSuAOuUgDVYa+f8lS5CNiwrpGjBuqZUv34aVRszAL906q2EYTKP4mXovejo0D7jXv+udBbvua41/N9Ulf2KrQKwl4NdoBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HtEf3jYe; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HtEf3jYe"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f464b9a27so7247185ad.1
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 06:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738853562; x=1739458362; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GfNoZ5gnbHp02m3QKMK2UDVXbHKjqtLdZhpqGhFuIXk=;
        b=HtEf3jYeZaDAaWb/ivSr1OxrzUOf0qDN5zdhi1eFtSocYBFVAYwOgE2oef/noN1lcV
         ypCW6FVqS08JLek7wDWT+ojApf1y8JG53Jdp6GZlBfftPosDcZhYoWzbwCfol5WGJkxd
         QU6A9uCKhEFRM2L7GFXibDXhIRnueRXrrfXNoXzDB8GZb+8Ls78qo8X2LwbFpdhuIXP+
         0DfYyz4sxjRXGi4ZxykqoHe6w58GPvFFMElTWqJn46fbeBQMbyCisKcELzv3FARV6g9D
         4NqrXLIzgoM499lCjzxFVBK7JgCmC9jjeBxgSPYLfzgYU40ePs+v5VXY7VYuxg8YetDc
         HRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853562; x=1739458362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GfNoZ5gnbHp02m3QKMK2UDVXbHKjqtLdZhpqGhFuIXk=;
        b=HkixzMtgyQ57ey6LT2KiaHip0BEK5Q7GxlaolJkrB/iJpOHoHu29ZNcBbGC8aJL0Cv
         Zxkm1LeNQ8I6RzWd5Z91P+q40cpZ68p3nj4aiVVoNEmiFt+S4tzpsy9h/vEAXQ/Fcx3f
         aAvwJ2vg50H0WD2OtFuElFd9ufDq1HHKqQNPcsungzDNgQV/4w73Eg01jIn6rGaq+2cL
         9/ZDYrrDJLAV9nn+2QQROvl/H/u7s3pKy8vMIuJM4ngCNZGcYN4KyJobkfTSSYhsr8q4
         LSK7UD6MRyEteb73XKPKpL3UhA4vQmOyDTUGxp3Ang0xXDbDapAoE/4NCrT2W0uV4Coy
         1I4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWlDhdRWzPzHI4O7iD/NPeLtbOPNePjA3KxGLrg7YQEPqTlKOiBFrV1D/6UV5E0L/hHJ6es@lists.linux.dev
X-Gm-Message-State: AOJu0YzeaZbkWXxDcNI9hOuhfZsxC+SaNgLe4lxr08KjT2GiiBaywe9z
	8bj1Qg0b/q3p7tcuU054yrOZcDrpLZMXzbQlIJ4lOrqqYIngFyoXvuUXd/7mNanWftcXfNz2x0O
	zDZ13Men12Uc35gmUTXiFWAIAY3aA8u5ZExzr9w==
X-Gm-Gg: ASbGncv7KGVX6DrqXZp/k670TD4M8q7fCDd4hW3CB8TR3qlVGrwv+amR/hYuUtrnG0A
	Go5OoFO3kx1AscUo0bZ+7ryOGOcPh1oJKWUiGBEA3Ixsm5y89nFuc+ckk4Gk7hvLhwHqlbXXixg
	==
X-Google-Smtp-Source: AGHT+IGTcP3GFjrMhTL+UMwNcSS5K4X5G6jWKfgMajmN+VSIFnfNzaJrKEw0rWBzVUwvCyUvqMAN8zeamtgpLyhkozU=
X-Received: by 2002:a05:6a00:10cb:b0:724:f86e:e3d9 with SMTP id
 d2e1a72fcca58-7303511e4fcmr12528960b3a.14.1738853561092; Thu, 06 Feb 2025
 06:52:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1599984364.127113.1738492219737@jenkins.jenkins> <20250204201522.GB3466315@ax162>
In-Reply-To: <20250204201522.GB3466315@ax162>
From: Christophe Lyon <christophe.lyon@linaro.org>
Date: Thu, 6 Feb 2025 15:52:29 +0100
X-Gm-Features: AWEUYZni34ZShlW0vrH5lvalSeh40mZBm1rTvlN-Mlgokk2EuCs5MjPvpv9M3xc
Message-ID: <CAPS5khbyzNwWnBYBs_1jcaTfs9hT_57koKARMJCvi+kXHa3Eww@mail.gmail.com>
Subject: Re: [Linaro-TCWG-CI] llvmorg-21-init-262-gcff0a460ae86: Failure on arm
To: Nathan Chancellor <nathan@kernel.org>
Cc: linaro-toolchain@lists.linaro.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Thanks for your message, indeed the CI status is back to its previous value.

Cheers,

Christophe

On Tue, 4 Feb 2025 at 21:15, Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Sun, Feb 02, 2025 at 10:30:18AM +0000, ci_notify@linaro.org wrote:
> > Dear contributor,
> >
> > Our automatic CI has detected problems related to your patch(es). Please find some details below.
> >
> > In tcwg_kernel/llvm-master-arm-stable-allyesconfig, after:
> >   | commit llvmorg-21-init-262-gcff0a460ae86
> >   | Author: Bill Wendling <morbo@google.com>
> >   | Date:   Thu Jan 30 15:36:13 2025 -0800
> >   |
> >   |     [Clang][counted_by] Refactor __builtin_dynamic_object_size on FAMs (#122198)
> >   |
> >   |     Refactoring of how __builtin_dynamic_object_size() is calculated for
> >   |     flexible array members (in preparation for adding support for the
> >   |     'counted_by' attribute on pointers in structs).
> >   | ... 86 lines of the commit log omitted.
> >
> > Produces Failure:
> >   | Results changed to
> >   | # reset_artifacts:
> >   | -10
> >   | # build_abe binutils:
> >   | -9
> >   | # build_kernel_llvm:
> >   | -5
> >   | # build_abe qemu:
> >   | -2
> >   | # linux_n_obj:
> >   | 22473
> >   |
> >   | From
> >   | # reset_artifacts:
> >   | -10
> >   | # build_abe binutils:
> >   | -9
> >   | # build_kernel_llvm:
> >   | -5
> >   | # build_abe qemu:
> >   | -2
> >   | # linux_n_obj:
> >   | 22474
> >
> > Used configuration :
> >  tcwg_kernel/llvm-master-arm-stable-allyesconfig
> >
> > We track this bug report under https://linaro.atlassian.net/browse/LLVM-1541. Please let us know if you have a fix.
> >
> > If you have any questions regarding this report, please ask on linaro-toolchain@lists.linaro.org mailing list.
> >
> > -----------------8<--------------------------8<--------------------------8<--------------------------
> >
> > The information below contains the details of the failures, and the ways to reproduce a debug environment:
> >
> >
> >
> > Current build   : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allyesconfig-build/233/artifact/artifacts
> > Reference build : https://ci.linaro.org/job/tcwg_kernel--llvm-master-arm-stable-allyesconfig-build/232/artifact/artifacts
> >
> > Instruction to reproduce the build : https://git-us.linaro.org/toolchain/ci/interesting-commits.git/plain/llvm/sha1/cff0a460ae864505bc2a064c269ebe548aa35949/tcwg_kernel/llvm-master-arm-stable-allyesconfig/reproduction_instructions.txt
> >
> > Full commit : https://github.com/llvm/llvm-project/commit/cff0a460ae864505bc2a064c269ebe548aa35949
>
> Thanks, I think Bill fixed this with
> https://github.com/llvm/llvm-project/commit/2eb44aa0a94a8d4230c1c9a0c306af16bfc92925
>
> Cheers,
> Nathan
> _______________________________________________
> linaro-toolchain mailing list -- linaro-toolchain@lists.linaro.org
> To unsubscribe send an email to linaro-toolchain-leave@lists.linaro.org
