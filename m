Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513011F93E
	for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 16:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NrLY/GIL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-33668163949so2675641f8f.2
        for <llvm@lists.linux.dev>; Tue, 19 Dec 2023 08:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703004579; x=1703609379; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRDzLjiMAJP8BbJu7ca4CzlHn8br6Q4rynefqovgK2E=;
        b=NrLY/GILI/9cD7I0WdE8q6z3AR8S7KcAWfwRmx6+zPRVKDp1Fw475LeMNhQF8ieEqy
         fpnbWFi9RH/RI1yFqOhKjzOQhlisdo9GOHmVk9DpLaejGl1VCnn7WPiD5SyPRU25K6IV
         7Vn6I3kD3rG4ASq/kQvZtsnTWnOI/V5TDYbhf1zPZc3RxQHhgCK6rX4zfEQ984EOzjhe
         uS/viyaeRX+BoHLl/ZElwXMP+t0n3QR+++io8NRq2tXyP5+vgFx0mq6/NgiqF46GtBkJ
         8lY7S8NfSGKN/izhNOGSKjuJO9Z7awm3wgu43Ou9QfTQA02Hp0IRE6LVsmqI+I+gcTft
         s78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004579; x=1703609379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRDzLjiMAJP8BbJu7ca4CzlHn8br6Q4rynefqovgK2E=;
        b=jruIKzggrCk5EvkuaHN+3Ge3eovybsskYJWIhbvp3Bv29e/qbtBxRU4UgImRPWMtLO
         xAdxp31r0SO7OXA+mSqhKbuZCIh+TSDiCT/PKdZZ5XBtUwFib/BXx7PKMrxgSQ+c2Bgt
         TbhQicuvgodQMHmD+TtNga6KDWmJA4vzoxvWgX1aLkvk1uUyt1FVX5rkPFrUbyUvHQtC
         YKLlM9pXasK2/Wo0OZ4yKG3Wp+mtIyQdjQ1IlEUbfJ8rFQ9JP+saYb2yY+aCesmpxnpg
         T/W0LPumS38Li4xRNS6N/mM+ZrswUadF1XUIl8epi/fY58yU5JW0Vjqv5MdDCeMEyvH9
         kCEQ==
X-Gm-Message-State: AOJu0Yx34FU+cI8MXOzzM+MWIaw9ISwKDUuWbg7wwAiMJ+bt6UsE8HoW
	fYEQ2y1Q87m54xvYhM+0xIG30ke1i0qmf3U7hpmB2g==
X-Google-Smtp-Source: AGHT+IGkSnbETqevyS5YLD3SJEnIfiIu+J0X0Py1heMFhXlPrhe8Yn8VmdFtz1I98N0U0C5dSxJ7i2tWrus4KMvpVek=
X-Received: by 2002:adf:fb49:0:b0:333:53b9:441b with SMTP id
 c9-20020adffb49000000b0033353b9441bmr4989922wrs.47.1703004579412; Tue, 19 Dec
 2023 08:49:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231215-llvm-decode-stacktrace-v1-1-201cb86f4879@quicinc.com>
 <CAKwvOdmY=Jysqai3KOYO8+c5idP9JjNGKL2xZn2sDNdj5MjTVA@mail.gmail.com> <CAFhGd8qA8Hh63iZPP33Nsxu61OycP7oqT50mDgUO-HFNUWHZxQ@mail.gmail.com>
In-Reply-To: <CAFhGd8qA8Hh63iZPP33Nsxu61OycP7oqT50mDgUO-HFNUWHZxQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 19 Dec 2023 08:49:28 -0800
Message-ID: <CAKwvOdmMCmcHVd7+ymKgVUe5uZrSvUYMaD9Fz5GSBtHBMPTnSQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/decode_stacktrace.sh: Use LLVM environment variable
To: Justin Stitt <justinstitt@google.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, Manuel Traut <manut@linutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 4:17=E2=80=AFPM Justin Stitt <justinstitt@google.co=
m> wrote:
>
> Interestingly, I am getting good stack traces on mainline with a
> LLVM-built kernel -- both with and without that patch.

Probably because:
1. you have GNU binutils installed.
2. you're not testing .o files from an LTO build (which GNU binutils
cannot decode).

--=20
Thanks,
~Nick Desaulniers
