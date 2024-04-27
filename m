Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81719381C7
	for <llvm@lists.linux.dev>; Sat, 27 Apr 2024 07:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714201652; cv=none; b=bkQUxG2mhjtRhVDXrfayqvE7BTkY3ErswGgzV95IreRfwDOEdxw3+zqjI0zsnFagK03vShEJDYfR7ZW/pM4k1nOol9FhLEDSNngHkd8+MtuoBR1B/3eYS5bTuVwTx6IAvyRvYkDUyj60orJ6wqJ74E8RDOSj1Yo5SjgOPIovJjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714201652; c=relaxed/simple;
	bh=/CGA1YZNwX3gAWmnKXT2ml9BQalf1WSTv5fRQB8eosk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQHa8D/iMvfg2F2tTDpKCQh0s9eRF4E5dqCXGdwMDV0VTO6XuHseGXv2bd13eSYezynYhICIXQBqjLt31klZTes/fO+EQMCwVlWTfWpReFHyrPa4oD30le+OXi1Y2Ka3O+prE8qzcRhBLvd2zudXGqxKZr/xcaChTC9s69lv18E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9EeCJjA; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9EeCJjA"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5ce2aada130so2020090a12.1
        for <llvm@lists.linux.dev>; Sat, 27 Apr 2024 00:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714201650; x=1714806450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CGA1YZNwX3gAWmnKXT2ml9BQalf1WSTv5fRQB8eosk=;
        b=k9EeCJjAvctFUjxR0YcyiMtbQ4Z8T7G996zQkMCU2bjVwmZdDkfRCc9VRc9boAyBy5
         dzXf7Ww+cP6r2pRArZ/yzeXXbl7I6t5rDnj1Jak54WNwrGohB3WbemMTeu4hSYqHAGkj
         q8d891sQPeRvaRbGMojdX3nhluAoVSkbM61Kx3Lse5jAUyAmAH6hC9DnJcVTOqiBuegz
         svqg4src9FIGx9jYfAQJ4iZgudKQ7HBUjeNtUABQESJvCQjIOvlRaJZDL4Rezl4PumNs
         GGqYkexHM2XV1iv70RkS7E6z7MLHIsGLdD7FB0yoDq1dnqyvAs1kSGNb4trzAoLEEXkx
         KeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714201650; x=1714806450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CGA1YZNwX3gAWmnKXT2ml9BQalf1WSTv5fRQB8eosk=;
        b=Czy0wEhm4q0gKWfdq/rg3W4ScxMoXHT+nAKyARA+M2Vj/+mFYK5XJCVPOfKTpgm8HS
         4610tBdv5uTs+pPBxswl6+0MD/HniZWjCLwX7Zd91RdX+Pb/NNZkT0cOTbOmr6e7KBF4
         m5mSVZeSmWK0ltZ/A7HkTxErS8xsYGq/6jWABMhjRi12W6DBHcg/REkfj5IZz49Zflfu
         wZlGf0CE05bLS2bUh8973xyyyhjqUl0gHyf10kh0jLOBwrxtsJ0VyarWFA+jfRScY1iB
         GRBooB7zHvD/dZ329++53q+fqN5Xvhx2lGZl8xC1pzBhzubgu3c7zOPws1SWXo3xSSD/
         4L0w==
X-Forwarded-Encrypted: i=1; AJvYcCVlMD3TEnE8mY4tB38pxB2+ncygKU+Fv8QYPjqsG1alFEnHZSk89yy5LTagacI61CoPoL2fRIhr/ojBOmSVDu5hUvLBHQ==
X-Gm-Message-State: AOJu0YxcgGg5k+HNmh+7/WQ99EIVnClOCg/Tc2Nl4Xl1B1+O2QFTDF2P
	TcdRJFHeKPA87Xvg6wmNF6Qo13sxSnQeYf8rHXC8ToWxYFLGRYu2/vuZ+dVh7LqHyoWVWfl/xiq
	jCHwPgq/RmqBH+TpGFz7C28beGRw=
X-Google-Smtp-Source: AGHT+IHKofGcLoII2Oid/yXNZTA6rcCBJ0FPtB2YItGOSvF1xcF5lLBmzSBqiKigm0G2dFzG9rGbqfJbPzz3KVR7WaE=
X-Received: by 2002:a17:90b:4a85:b0:2ae:d03b:9594 with SMTP id
 lp5-20020a17090b4a8500b002aed03b9594mr1594141pjb.39.1714201649876; Sat, 27
 Apr 2024 00:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn> <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <87zftgnsun.fsf@meer.lwn.net> <CANiq72mHoh=qgOGPj29hpS7EhVcXi5Q_7GYsycKhYwj3QbsTag@mail.gmail.com>
 <f49129dd-ed6f-4940-b851-0282fc320234@loongson.cn>
In-Reply-To: <f49129dd-ed6f-4940-b851-0282fc320234@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Apr 2024 09:06:23 +0200
Message-ID: <CANiq72kDEm7prV6ynAf=rZ5VydT=cYD-Ncj=waZEUOeCA1wbGA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 27, 2024 at 6:38=E2=80=AFAM Yanteng Si <siyanteng@loongson.cn> =
wrote:
>
> What I mean is that if I translate these two patches as two separate
> patches,

Ah, I see. As far as I know and from a quick look at the history, the
translations try to be in sync with the latest non-translated status
at their own pace, and they don't mimic the development of the
non-translated side commit-by-commit.

So I don't think particular commits should be translated as separate
patches. In other words, what you did here in this v2 seems fine,
since it already contains the "final state".

Of course, there is a small risk of going out of sync with the current
patch series if e.g. the RISC-V PR does not get eventually merged in
the next merge window. This is why I mentioned that I am not sure what
the policy is for translations here (e.g. there may be a requirement
that patches to be applied to translations have been already applied
to mainline, in which case you may want to send the RISC-V bit later
-- but I don't know what the actual policy is).

Thanks!

Cheers,
Miguel
