Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B1F186E2A
	for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 20:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722284058; cv=none; b=NvyF2PAvM357RQAmlaSaEBwandnsYH5+iutNyNob5yc7EDndBGY5CF5HDkGDbxPYK5Zep9Z9aK9mFkpRbYnXo7yuwq9jRWi1lyQiOC+waII4VnH1uJhuXk69onWC/lBMU1UWieHgn3KUQQ9MLdwnq1Cuk1gDGAc8TJ2glqVGCw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722284058; c=relaxed/simple;
	bh=6qk7HpHLYEwpFQisMPINM615aHGawWFZGy/k2uka1U8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WImZ6NlSTqetw1XTEyr/91dw3wKj0QBWXNusTL8pLxe/KUUTjQ8Ptico5lmGNSMW+Wixix+Ykb0Zp9JTvXuPUw+iITfQU0Dt1usHAVIWZS1A84AoYoRScVe8L21e1DmuL1g07cvq6PCgfIYpItcJRQnzzZxcDRy8Fk1+zK9k++4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yt/grmbl; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yt/grmbl"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7aa7703cf08so2771939a12.2
        for <llvm@lists.linux.dev>; Mon, 29 Jul 2024 13:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722284056; x=1722888856; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qk7HpHLYEwpFQisMPINM615aHGawWFZGy/k2uka1U8=;
        b=Yt/grmblhUGv+0PsE4AloDJo3a/ROindKyy6BMd3bssbb3L6UloyIqnSHyi5y5lZeU
         BcHHyonWz6I/nDxbKuS1byAJ8DIc4yHhycQ6dMFc0kuKKI87PbllrbtqaUB14NcTo0sp
         PuYulChBaNDuVmp5DQY+hzypfI8Cj7bSOaXeym0jFOesApiBJSeIdoBAXPWWsVRvuCox
         5VY/VeGY5+4LDxApJQdjBSRxMpj/K7/nwcXkIGpryGqNM8kb8rQtibKVUmCjdOiTnDq8
         quMJ/udcNGaaCZ0gAPKqvvZck1GXhQRlGzZWe4yOlQnxIwtX3Jx6hP1sbV6eHpCBHuCN
         BWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722284056; x=1722888856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qk7HpHLYEwpFQisMPINM615aHGawWFZGy/k2uka1U8=;
        b=fDzOModaxtj4C+Akrt3hrCDOFO9Um+A/Y5iRA0mh3qrWC93msSilFPQCmp+o/UlhLi
         ZHIyjKFwt2MDBCTW4YVNGdDC1kShm8FOzC+j4lCTXFWsitGGXgo2wZQoiOXCv2Tf/0Ap
         a6mdKOnGEfJrWB+RxqTWtBEGoRHbWDuKfPUI9hRok7apWJDeaMoD1kXZpJ3ARf/bEg1N
         08KOxOH9gdqRJgs8MMgKvOifbAQfZBqpBNEHjBxCfqKJMnul/9NZ4t/raU7fT8Wsw0YU
         KeVLXzTzZV9ySsXeyGmX3+e1UGI2n+UaLoi4CdDH1ND43OIO6RLg57vL1OBoKOrbmBP0
         HCPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWomBnjIrIfpwnCVQPHF8mZPDcPtJa2CE9iFfKC+s9vWUlvMaoGuW+vMtAGlC8uUC5QQbkDh6btUSgmA0Gs7CCmn2BXLw==
X-Gm-Message-State: AOJu0YwlGb2TSLwyCG6yOATAK9vQwxSmBaqwunFrwjFW2zQ4Q18LGvf9
	vH/9qhhayRu8t5zNMB9NI+4BlvXWq/QDpq0ySCAiKAGOEvHm6Ie2sGmBc3818nZMsWtWUu+rUcV
	kk8TVajGEzmY4CZNWWptFHh6bo34=
X-Google-Smtp-Source: AGHT+IF1NSOQXcTtDLn17s4oBxIGTzFnq3W2Jf9YK/PPitYbhT2D0ah5RqbVUMt/rquJYM17X6DDvmsmxqf4MKKxwKM=
X-Received: by 2002:a05:6a21:9986:b0:1c4:244c:ebc2 with SMTP id
 adf61e73a8af0-1c4a1324e22mr10250575637.30.1722284055679; Mon, 29 Jul 2024
 13:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240729-clang-format-for-each-macro-update-v1-1-9c554ecfec3e@gmail.com>
In-Reply-To: <20240729-clang-format-for-each-macro-update-v1-1-9c554ecfec3e@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Jul 2024 22:14:02 +0200
Message-ID: <CANiq72kFpS5BE7Ea8=Z6SUi_Y2RAt5wsssHyqL3ocgR1UOHJMg@mail.gmail.com>
Subject: Re: [PATCH] clang-format: Update with v6.11-rc1's `for_each` macro list
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Mon, Jul 29, 2024 at 9:56=E2=80=AFPM Javier Carrasco
<javier.carrasco.cruz@gmail.com> wrote:
>
> Note that commit 4792f9dd1293 ("clang-format: Update with the latest
> for_each macro list") added the macro `displayid_iter_for_each`, which
> is not part of include/ and tools/ (it is defined in
> drivers/gpu/drm/drm_displayid_internal.h), and the shell fragment used
> to update the list will drop it. In order to keep the macro on the list,
> manual intervention will always be required.

Thanks for the patch!

That macro was inside `include/` back then, so now it should be
removed from the list.

Of course, if we want to include internal headers, that is also an
option to be discussed, but we should be consistent either way.

Cheers,
Miguel
