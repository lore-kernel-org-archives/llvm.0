Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4165A1BD9DF
	for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 11:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738236247; cv=none; b=siAm2sji2XzAGL27Yx3WGaPeKB+LVU6uZCMpOTdnDXNl11y4MZ1/4fo3Rg1n6I81K0ONsRJtOsb4KQ1v7U7Ie5IuhahyQ3w+YwaC1+Nw/cYv8ozYYmB77lFtvQh24NJwihB9gIVVKKgkJL8rHR8Zx77/ceGLID0rmCXhTFvMPEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738236247; c=relaxed/simple;
	bh=wDl2kfGArafP0t3yD1cDiGvh5wGA0nD57PSF/Ozc0fU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=R8k69OsyCNsLU01+OCYnwu475BXpIlmhk4NG+hB5Z18cWBCIe0iht9WBOhb6LJ0XOzs/6Z2x1hOiOUfq6o5tTeYO6vwV5m3w1XIT3/tqUjmRwHutnweJjs5dhrw2Era/2Zoh4UFqIFdB2IlxAYtG47pVZF24FjaYh77b2u5Rmao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQUppjjK; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQUppjjK"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-436a03197b2so4400665e9.2
        for <llvm@lists.linux.dev>; Thu, 30 Jan 2025 03:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738236244; x=1738841044; darn=lists.linux.dev;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Id92T0AVX6JDwaxiz3z7oRBD6wW+GTifuBoqUY0sTA=;
        b=PQUppjjKmEc2OpO762+0ClOryJXOL6/O5Ux/fEGgm2OVJLDDOJ/TxjuG+kJ+49P1Y0
         MRvqsYlHe2/xlKuN/UqjK7pBEXNL5OZuIt7Wb9o0BbUFMHe7S+UadQlFOJYhzKiRi2BD
         XBl+OUfmPqsYNldZurN49iJoA/mblm5aOjuPRa55j6mlozsWiKveCTDCraG8d/AaccrC
         uQ7Urnzb+Osok+KXL675DkXXVAzbQgUE0bTAQOKfnys743aim/5CVupp0h9eP7kdLFQI
         W/Xoz/zmFaci1rzspJnDe09jtg3HCjprCIOmJCPAUa7QU6Hhf1g85f2611FMx13egWr3
         pw9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738236244; x=1738841044;
        h=mime-version:user-agent:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Id92T0AVX6JDwaxiz3z7oRBD6wW+GTifuBoqUY0sTA=;
        b=mmwwMopq8ALGBRh8eB4hVB+T1azM9xyVRGe1XnVdIsisvAidUURhA/Nio20mXO7Wc7
         g66G318O33KhP8/f+3DuF4Gr5YBI3vN9Iw/Rudd4EQXcDAn4IoEuX9QTBCmNCSzNEC56
         anGsRtRYeaPiZKgL/7wHtwpx5J8ScVhty10kMvCEKwy72kIW0/JnxhJRLpbr+kE6dHbz
         6y4lm4H8PJvVMUd8tOIKEzxAVPJtp62GT8EL4FJQR1Fi4g3nxQm8h7lDgdS4fybFcYPw
         dmyJiWoRsrJoNmKxgvo2ITxL2c1B490RVfgF1DzlCUsE4thQtGBfpvmcD2/mLHuHcK1M
         5FGA==
X-Forwarded-Encrypted: i=1; AJvYcCXvP1+cMkztBUL/K964ueZxLl5xduE7KAhnCdx/hJUJEhMf8q2J5ANOtYOvwGOb8riI5pM0@lists.linux.dev
X-Gm-Message-State: AOJu0YxntSQEuLwazLLpYnhADNxLDQIPNph27ruUdHtKICM+vTHf2cLC
	fYQbz90i0/5IM79o24Mi3gP64U54/x7CKIsL1tVnvJKGWlNUH714
X-Gm-Gg: ASbGnctKmLCnaYqHGqKYuiLuNfz4jOeaCpZtKwxMUOCX8BcApwp+Nruso84VYaJ78oY
	TKu0EZIXUemgLDYz7PPdMFJBGpfRc0ZTOkVOt3t7COcwW9Alhu17UH8M2caODacB5Qx2715GayT
	Roqcm7/LYk8Icxi/ikg9kx3vNAK5Fs6sSM6aLLUn6KfYGkLKPeWU2VKhv4Wdm7dbJ0RuPbPQFMd
	gXdWxSZ/KlwFilLgrhcIKW5yiBaqKh6rOq2F5tjuuQRMTpYiMAL6uFu21ZJAORPt2CPT7VbX5Rl
	aUrPzq3WZRny0jDZAFO3kGUsJHJs
X-Google-Smtp-Source: AGHT+IGn3W76KCgmgMIkQT/WdD1sCcWCm5LqI+wFsAmXytxdLRcHtMo25bA2WjiLnRFQbbwNF4GiZg==
X-Received: by 2002:a05:600c:3494:b0:434:a315:19c with SMTP id 5b1f17b1804b1-438dc3a85b3mr56757135e9.3.1738236244282;
        Thu, 30 Jan 2025 03:24:04 -0800 (PST)
Received: from imac ([2a02:8010:60a0:0:846f:7c2d:e5a5:73a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d75de282sm49377315e9.2.2025.01.30.03.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 03:24:03 -0800 (PST)
From: Donald Hunter <donald.hunter@gmail.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,  "Jonathan Corbet"
 <corbet@lwn.net>,  linux-kernel@vger.kernel.org,  Bill Wendling
 <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,  Nick
 Desaulniers <ndesaulniers@google.com>,  bpf@vger.kernel.org,
  llvm@lists.linux.dev,  workflows@vger.kernel.org
Subject: Re: [RFC 0/6] Raise the bar with regards to Python and Sphinx
 requirements
In-Reply-To: <cover.1738166451.git.mchehab+huawei@kernel.org> (Mauro Carvalho
	Chehab's message of "Wed, 29 Jan 2025 17:09:31 +0100")
Date: Thu, 30 Jan 2025 09:33:30 +0000
Message-ID: <m2zfj87ij9.fsf@gmail.com>
References: <cover.1738166451.git.mchehab+huawei@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> This series comes after https://lore.kernel.org/linux-doc/87a5b96296.fsf@trenco.lwn.net/T/#t
> It  increases the minimal requirements for Sphinx and Python.
>
> Sphinx release dates:
>
> 	Release 2.4.0 (released Feb 09, 2020)
> 	Release 2.4.4 (released Mar 05, 2020) (current minimal requirement)
> 	Release 3.4.0 (released Dec 20, 2020)
> 	Release 3.4.3 (released Jan 08, 2021)
>
> 	(https://www.sphinx-doc.org/en/master/changes/index.html)

It's worth mentioning here that my fix for the C performance regression
landed in Sphinx 7.4.0. All versions from 3.0.0 to 7.3.x are much slower
for building the kernel docs. See #12162 here:

https://www.sphinx-doc.org/en/master/changes/7.4.html#id7

