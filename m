Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063584B1B42
	for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 18:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791658163; cv=pass; b=PUJRzyD9EPnHfEoIyTB09AMJWPSFW3yO1ANe67lL8CI+9wEkvXVmnyNe1dYUDFc16YgvlsSuZE86TR4KB0LVA2MHh6WeOhOBg3+Zt4EbSCBuUmET8yMs9EogZASPwcOyCrnhuANyE3cVRu84E7xnzNIT0FnoKZ5Dfl8mj2Y4t+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791658163; c=relaxed/simple;
	bh=oQPmF2vNcsU+aqyGKsT8E36dPC78v/n+IE9l6gTjd8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IsHXKQltBmPqp6wGuYZKnadF5OKnsUQCAkD1u4LJTmTDRSKnEScRFAmm2ag0d140Dd+RwGjx/4iiBlyMBCsxV/qyhCWdJc1BfSS3ZJ7Q4ChxRfpFpCaIgLuiq10fFS6XOtr0KV/V+AMkWU+iBOop6wy7nz9eHbQxxuOS4Ok0+kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LsyWF/GF; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LsyWF/GF"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6aae147ef9dso3376a12.0
        for <llvm@lists.linux.dev>; Sat, 10 Oct 2026 11:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791658160; cv=none;
        d=google.com; s=arc-20260327;
        b=Yn0Zp9kvNo5WYMXEWeDeoJEWNiB4yTECC9XLqgFizvYDJbT624Kj0QnvZUbfHzASDP
         cwyIVgYzIE1Bx+Nv0d3Z0dSFVmSHP325jlrCJY2T8rccE5xHDU+quxg1zWKp9+r4/sDd
         6FwwwkW1HbYTXgKRf3y2mIXiBRyjAh4nUBUc5WRGe1fxuJ67oURT1/lfD1bUZfe8riIJ
         t3fFI7hdKYABmJaUgI6YOH+51C3hQl/saB6cKzZzbfuSf/zzQFCL8ttXX+g/uezOeRfd
         4tCn3fa9N/rHF0nceberBCLvlXYXei9XhNTLKEnnKUL4dDN0n3pB7QqnmB3suWm4+l/B
         lsgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xzViJlfng9ygGmV1Zx8fkcrOlZMfym9liXR+dzM/BZk=;
        fh=qf++hCxo0Tl5OA+emDqd7ONRXh2gRftC1uwM5jygRTc=;
        b=THwY0mOnWxFyBmVdEnIKfYrBILcD6CiwCs6ejmil8VG5/oItpMLmW5UiSKWF7r32SA
         mTUBDbiA+3y6BdZnpdBTBvgXzimHYM7omx3aB+3QfIXoAdG97wncDXukseoSapuZyBPx
         tbDNRO34jQZRa6I0yMfKT3N798bidUm67xOoamIhH/9vpW41eL2TJANBa21vqXOXGzAR
         MgroSzNTVpbH5mqGi2y5ZjyYtKtySgRmMzn6F6Ldj6Duj5mbtzHpu+KZ3VrPp6CFT2zz
         qTRaQzWwW9QmOizu2Vi96ClEbPhqXGwO4NolYSA/Di4EWuL5i5FutodiqR2dTooXLudM
         ejHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791658160; x=1792262960; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xzViJlfng9ygGmV1Zx8fkcrOlZMfym9liXR+dzM/BZk=;
        b=LsyWF/GFQNg3loBNl9dCOdCl9C+tBuzluQ7wMuab5kme2PTTiMCnTWKOaNUQkpPsFc
         bT/WOYGt/orevRQLgUeDoYNURTpt7pvwuRsYB3PE89Wsmw0RwD37aYyn7Rsg/D8PF4np
         PTi9NhHJq7rmUxjTnXseS/BTXYCurwQt+asx7NBoYxWiLAHs2M6VnNXVdDW6vhQaIB6B
         WCjSkR/2jf5uQWdgmGSG9Tp1tq/kEE+I6WfVtIyISiMEt8u0RQhL2vanIh/fpfCaET5U
         RQkUotVrjLZuIMCDlHSeGxbGxRLquvvG99zE8d5QeATy+9pLDaQg2/19x0d/HGyYSma3
         7TUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791658160; x=1792262960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzViJlfng9ygGmV1Zx8fkcrOlZMfym9liXR+dzM/BZk=;
        b=aIlZ3OI5zCIB50i/wCnb6xO/Qczn7MhJLg0CYgRJ6brF1l/LpWg7sNuFToqBZEXkAW
         nXyRzP3g32m+KAOH7ZpXsQ18QrvAEamzi+xTMfszPrT63fe+YtHQTQWGt9bYQWzRBufD
         oy+myjFeW7Eve9Dq4dVBSf8ZBTPA5fZ1wk+JF4EbHdrU3sRrezCdDMV+TB5JPkx4GDPi
         e9aOFDFNPJOC0lthnJIybjCaRdscwzezAWtuHtRbbox7PxsIvxx8a6BX754+uKYbUldc
         f2XkBElMSwI+jl8tBJxAbjPAyi8my/GU0NF08cNASqaCEqs/CajaC06YBKzhIBtohhq7
         8lmg==
X-Forwarded-Encrypted: i=1; AKwUvBy1glv0dne1Lfk1Y7lBFrkssNL2A+vlaxHEljdDyQBg+qpGBM8LLR+Vd+zR3VJTJqdVGR0O@lists.linux.dev
X-Gm-Message-State: AFq9FYI33qpYRQ1Ma5dIldoMBvZRZmiW1QRgADGuuIzr1OJKiDnITDeV
	ZxYeN8puyrJBS66Yvc3pLBEVfv6qVs+X/SDJ+u6TxpHM+AAxY90TWXON/ebRh/EXnxuozAs5Dwg
	fGU2BfNDdaRSRXj9YZjgrVH7Y2B1y7T/jnFY/6w3fO5Tv+NjX8Jge9RqQGutf0A==
X-Gm-Gg: AYBFou38iQSwQ1lH8Qufxy6mrGH/KuFg6iZYR4svdxfFp5h8wVW+bu1nLGqSrMhmrHC
	7zY+nTJ/BIwb7mWagEmkRNPAAuNUKeHRvlK0FXoJMCW4i17ZIwDOAniAEyj4fuukFd2XGO0qOV1
	Ekg5YoM8SD+gardw4gi8IyMGQRmVO+GPC0+JTD5Vl4DkSO/NrVZSXXJ59yXD71GCpGu9jM4k4Lg
	H4k7dyt02iv/D7FDGqD4eIYOpdVbcxvi5ovP2Xf/3aWF4KFAASM6h9Vtk/RMZXaw38g2GhlW24P
	96nL2YUSrf9E9s4faxGwuhNEJnJgmhilh7TnGjCZO7Uxl29zrD6eWA==
X-Received: by 2002:a05:6402:2082:10b0:69c:39f5:7e36 with SMTP id
 4fb4d7f45d1cf-6b19876fb1dmr15796a12.0.1791658159479; Sat, 10 Oct 2026
 11:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261009214501.GA905361@ax162> <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
In-Reply-To: <CAF1bQ=Qq66JuvYrbR-7GgegZuWPSjxDOgerUSD2NOp9W0BauZw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Sat, 10 Oct 2026 20:49:08 +0200
X-Gm-Features: AclHuK-ozuuUaiksMjkRlpS60NF8BtTRb-Oo-GWjNU3407m-ON6-M4dsU8PWDMA
Message-ID: <CAF1bQ=TcBqvu7v5fXK0xkf=ak=APt_i0aXCtTSM1MZiOvQqoQw@mail.gmail.com>
Subject: Re: Build breakage from renamed '-split-machine-functions' plugin option
To: Nathan Chancellor <nathan@kernel.org>
Cc: Han Shen <shenhan@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry that if you receive duplicated email.



Thanks,

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
