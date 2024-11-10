Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A8013AA38
	for <llvm@lists.linux.dev>; Sun, 10 Nov 2024 23:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731280660; cv=none; b=aTEWr6NgixMn7XFhUHJUaD9YHkS86ToOGUWkoBh19U2Yvntm4UljIrwlaaF2zzN8ZKK/Gw0jnYl9B7XL9jnbDC6g+AFBv2jOZveYzgRV6d4oHkRMEQyhBCoMZxE+RU3GKrtD+eyNtdBqu1kxAu+nxY9F5G/SqT50uNoPqtgl+1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731280660; c=relaxed/simple;
	bh=RUFXILVcRL5dH5y0Ihu2hvUs7pMYlPM0BSJjf7eAZJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkVaZaxpXyTPVN84nW5j021mC4CI3A7l2o7mqjcz6xefmdCyjJeGqiglv+VKUoHSAdevzZnsJLGyCUFEIlqivgG6h3oEAwhe9iyTqfdEPBdZl906tMonfxxDb65fzYRkt945DVJ+FAUYZcVYeklszBTQk6bTB463YGESpZ23xIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hQuTv4AW; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQuTv4AW"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53a0c160b94so4697434e87.2
        for <llvm@lists.linux.dev>; Sun, 10 Nov 2024 15:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731280657; x=1731885457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUFXILVcRL5dH5y0Ihu2hvUs7pMYlPM0BSJjf7eAZJk=;
        b=hQuTv4AWiyfcndla5Zu5xv64xnMymNqtnP6GiCidW+WnbVMejg9qrxU8TSRCtBC3in
         QGwhzp1l1tidGr/qjCqr6oCCjf/WJmxkNQWM/VrNnNl8x51W/PJCq7m64QTJDOhtA/St
         DRXYmgdMDLMWDp2r/V7crYwE9UyWxEqzLhOYN67Y59QE4rKFMlnqRXhQC/WlJJg7GGkP
         hp5PM0/LpIhupg/ept6dyD49SkA/qE7EXfuk4WgV3S9PlYEQErCiXuc7KarzzGGG/MIY
         gzRpyz++NgJp69vnyzjHVBuavgve0pjde4Iym/ofCR6F08tcbZCG4KF+/ZYLg7pXqxBD
         IkRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731280657; x=1731885457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUFXILVcRL5dH5y0Ihu2hvUs7pMYlPM0BSJjf7eAZJk=;
        b=mZseoryjFUmaX9+ewVo9n1ggyeu4Bi78vDUas/PztzlD5Jg/YIO3fSp5PJYf19WW9s
         SaN2/of/fRrOn3RI5s8Xmjzc7IFnvUc98Hpl+A4HN1z7aMa0EfubXbD5WguAPHARtqGC
         PQHcepkRmV46uqdwmsgqHwzZPfYruz9tW6DWjdWs1g73xorU4KEVNtHzZepPWwQAQRjm
         CZrFrADJsNNBJdlg/3cnB0z1B0mJnCvM0YBqHWT/uNHZ4oHg65QTK4QN3pJE+Knh4L3C
         V5vjduljFyqccLVJgf8yXAs6via0IYk7ilc31XM+nxSbiOTRX5nrO4x1nnNayr56hE3k
         Jvaw==
X-Forwarded-Encrypted: i=1; AJvYcCXaq+azODNauTtmtB++z5g/nuJ9SgNknfdeVYNyQoHd3u01iQyL8qlX8xYcOb6fyY89QfLa@lists.linux.dev
X-Gm-Message-State: AOJu0YxXLJ+dqj5NpoaDyFlkfancYFL0M0AypJT1MMzBLzPyZSuMl9wI
	BzOI+483cUHNcCU+jEj5J1hP/DqLmSYX3oUNyXXcbra19V3pMWlfqgnuPtHWdkz123ECMN35HqL
	eMUNhDzXI9dweFsMqTruA+0T57PaRqYDXQPEXBg==
X-Google-Smtp-Source: AGHT+IF91VKcTlaDZ/IlEkHiUobN6Q91eUFpAI0Oz/DTPRczlHHFK0uOIyphMgpgrxVRx+pP8vFbImKcEfUD64jrngE=
X-Received: by 2002:a2e:a98c:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2ff2016dabfmr39330571fa.22.1731280656618; Sun, 10 Nov 2024
 15:17:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241108-fix-kcfi-bug-v1-1-f8497c4bccae@linaro.org> <20241109043138.GA1649953@thelio-3990X>
In-Reply-To: <20241109043138.GA1649953@thelio-3990X>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Nov 2024 00:17:25 +0100
Message-ID: <CACRpkdbBJsRQB3mhN4hqjFpa1S2YP6Eou+jS-BCfzL0OvQPsPg@mail.gmail.com>
Subject: Re: [PATCH] ARM: cfi: Fix compilation corner case
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 9, 2024 at 5:31=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:

> Regardless of the commit message nits, this seems like the right thing
> to do.
>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thanks Nathan, I dropped all the annoying complaints about
pickiness in the commit message (after all, compilers should be picky,
it's a defining trait...) and put the patch into Russell's arfmlpatch track=
er.

Yours,
Linus Walleij
