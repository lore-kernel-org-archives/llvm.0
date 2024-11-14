Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737731F26DF
	for <llvm@lists.linux.dev>; Thu, 14 Nov 2024 07:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731570027; cv=none; b=s/VqmF9K4BlrHS00wOsjdV3jG5MiUZ/j9Pgp9vS93/e/pQ4wfbaGiaTgDHTSstoEWKnEwRfbOcfi0m5k65kF0pcJ/oAzX0TFbVDNfR2W4fP61Mgc8Rg7z/XhDTI9eifQvO6TSdiYSHmj7QBnmv4Im+of7seBnhFaq/flkF79NJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731570027; c=relaxed/simple;
	bh=Fl/odM5F+aCAqNT2I99hqJtZ1nhfTbsQV2C1i2L/K2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QFM/2cXSdjP9oCbBLTOE+2BvKiYpW0yDy8p/wzaKtzLXtA1bd6V02D0wCjf+OsHwz6ag6mQCOlXLA1mMsMHhCdSPOGc2MuEX/erNxg0cs2QBptuiXcwgYfbprne9Spjzj46rQN3al4ncFQzu4eP2UoXPG6QrgUQxzgmAkMY7mcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wDfDo25p; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wDfDo25p"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb6110c8faso2230101fa.1
        for <llvm@lists.linux.dev>; Wed, 13 Nov 2024 23:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731570024; x=1732174824; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl/odM5F+aCAqNT2I99hqJtZ1nhfTbsQV2C1i2L/K2w=;
        b=wDfDo25p38FApEitaD8bXUC1ggWAiPdL3faudMUieKUuA3US6tnjG/gxLvuQuBG0mq
         L3nuLI/AgWCgUwBjjKU49dtJsfkp6VTOdY7wlJCJNcL1mZNqX/N52uHY+4XimAJPHF2n
         AxCqU9C11FiZtwgjGWKUywPgjHX+KRCSDfMOUXyhyPWBs1ZX8H0s9I18IWjd7OKszfbe
         IY07WgKL8j6BzeNtI2fkNFsLG+UbH+7tGgz6kdxZs7cyn7TohoatYy+zAMHA+mXX5WLk
         uDURREXSkzS9vCgPXR2v5/IK5BQz6Z9PUGHsl04ti4HpJrnqauoWzo1u+9w3uaOTsydC
         XAsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731570024; x=1732174824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fl/odM5F+aCAqNT2I99hqJtZ1nhfTbsQV2C1i2L/K2w=;
        b=fKLp5z+6e1oIiZ58tkdc8l+0k5pPnZXJsWZ7LzJBEokh5cgMlxy1A8LoFv31tzUXSE
         iAdGNGCkOHxw1hAHgF1pdVTtDmk2WdQWCcVr7LzgM0rhO/xJS+QGVJ6P0rwuL7v7Zg8v
         W+cYHmxBDLgMwRorlwcDPILKKzFJXWjgaqB9ECMYycrMjvvHAho0MRm2O6YIx6KOriuW
         7KmD+DnGsdvx7feY8fbMAtJJ8suynXwlG8NuKBNJhVuaKxecNUvZkqdLfEJxD16/aNXZ
         PB9psVeu0BTZKf3qiSw7VoxgxKz3tPMEbQXGqV0TVLWltMb0DtPl2njgyzhh7qWwhw/U
         VHvw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Mu3tcJzAcC98+BgDhtMVVmlq7M8ar8GfJ71a2Uh9QIUoE/bSuqzASzGfiZX0FLrTMUW7@lists.linux.dev
X-Gm-Message-State: AOJu0YxbUoMa9NSOa3I0FuVg0NSGv9qQSF0X4p5EnuVVnAaUwqhqX0c+
	Bns4KVOQQuA/Lw38L6uGD5waePuwBMEzNTVO9r1kx6XrPblhX9yYRxOiwcOa6ouaAhqsGQV+/9R
	OsUZPWpB7XQu0CqFGeJrBbQheKglH/Gh4Mg5oiA==
X-Google-Smtp-Source: AGHT+IHzopnIUABF2fGujesawmVGJMGTGXfs17vJukoyhkPHV8apTP8RlwWNGTNzlDbmQ4vyJrLJN9Ot5KZLjlGTsug=
X-Received: by 2002:a05:651c:2227:b0:2fb:382e:410f with SMTP id
 38308e7fff4ca-2ff2025a3b8mr104313391fa.26.1731570023573; Wed, 13 Nov 2024
 23:40:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202411130711.xfVEiMKn-lkp@intel.com> <CACRpkdYADg4fg2VgRxFBwp1STLbX062zjbZXQ9snOf_p6NvcEA@mail.gmail.com>
 <ZzS1ko8pWGvYj895@shell.armlinux.org.uk>
In-Reply-To: <ZzS1ko8pWGvYj895@shell.armlinux.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 14 Nov 2024 08:40:12 +0100
Message-ID: <CACRpkdYYJrXGj7c=kEwk=Oe4Sgo4tpMOeRq7p16MLBtMV=ZfyQ@mail.gmail.com>
Subject: Re: [rmk:for-next 3/7] arch/arm/mm/ioremap.c:130:32: error: call to
 undeclared function 'kasan_mem_to_shadow'; ISO C99 and later do not support
 implicit function declarations
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: kernel test robot <lkp@intel.com>, Melon Liu <melon1335@163.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2024 at 3:20=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> Now corrected, assuming tonight's build is clean, no further action
> should be required.

Thanks Russell, much appreciated! Tested the linux-next
tree this morning and all seems fine.

Yours,
Linus Walleij
