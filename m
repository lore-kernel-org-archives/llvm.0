Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A3031578B
	for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770811677; cv=pass; b=NnwT0HxoY1d5YnDCg3MA72KMCiUpxwuZQ0huTMSL84uu8Z6rI5PC+97qUK50RDfIX9qwdXE52wFZLldg9FYn4NryAG8CaAK929Zw73z96pq6h3o24Bl/zbnp0TGUJngNz12/F0uomOkCXzfHZn8wj2aBmh566ZOUOc/z9OOeNPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770811677; c=relaxed/simple;
	bh=AL9XKoqrbyx57SEE8WVgqntnIEZdm46JdRaV8xyiZ7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fBu3kRNlFcYpngvOFsQIUZXzeGpZfAu0wPWTea5RvbiknBIh+hzjjsd2D5o1PCsurw0pnv7iBT3Pg8URQhlNp0cpIdcyKfMKO533DxErZZMLd4he7xEsQsTbPXDkjgfjdfidnWhq+XkhDOgdYECtF49pHzyJdfvPIvvNYUT9Ni4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZuHC0/m; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZuHC0/m"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ba4f9df1b4so199555eec.3
        for <llvm@lists.linux.dev>; Wed, 11 Feb 2026 04:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770811675; cv=none;
        d=google.com; s=arc-20240605;
        b=lWt0z/DOGjuaHe04MZKp3MbcnQHVk0E0Tbs3E23arunsLhS8B2TIS79f/DI0i1Rnj4
         d0kbcEnuK+SV8En83QL5kEPP61kWbZLouTKUiq9DnTy3GFDxWCXcRV4veekP1Ao6NuXw
         nXijys1+kP3QDktNr9eCfvPGCp/tbTqd9r3qNVjyhlP5FU79osAGUYmCUNSGVC8TOKWX
         81dtQwC1u9Tnqs8ub+KU+Yumv84f0OMvszo9NEd2+kMKHh0H63CUoT2XhnZaguGx7QI5
         XT7nPFAhZgcOIOMf8VJEaNuR9peVQgRw2aF+JQgykbG1K+IzNSCf/53lZgcysqz3mRgh
         OY2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AL9XKoqrbyx57SEE8WVgqntnIEZdm46JdRaV8xyiZ7o=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=TsQAbWWP07Qqf72By6WBraePxIq6wqUIRiF6mEw6oCHAmqgR+ejFGZmM9xpM/JA8Ny
         hKK8jATNoqvQ73rhDGXWKJCpxpnxe+7RLqTE2jb9ECbZvVqQWajDIxu6LZGSTxADnsvN
         f/3bTsPCJ+6XvBT796+eDKTnU7TNsl6jQ38UOeNLUpmBEMFiSJpJ7gWRSF2OAvGTluu7
         XgRif09QAGATGlENkgLeAQ/tNrzWXGArefotD1td1VZP9mr1i3uKAE75eE8LjcKv//fy
         Pu6gj5Onkr4T131s6HAboh3NQVVxJkn8v3fEVxs+mbusCbpDzIPK9Z49EO+QfYRP116G
         I4Lw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811675; x=1771416475; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AL9XKoqrbyx57SEE8WVgqntnIEZdm46JdRaV8xyiZ7o=;
        b=DZuHC0/m3QQuP9b/vbMDZ4+hQ455zZDiQnZNebOaW9MlMoM3rd3MMV0rzGFoytgThV
         wtt9PWy3qWauT5SU6TRXvQZVs0OgteHXSGs80Ui2+kDjTd+GDgRmYpOyUE67Kz3J3yBd
         ZqUo+zkgTUQKwLm6RWPKMdLKiZNCvRQV1i3fufv0oSLpV9+zbdJliccyLvRrCqyuraB7
         EIdYiO7Zq4kHcm6nlmSDW7SNq7oyN2cHiLsi8mDX20FOEXcOIiZuoFAr6kcBLD9rKusg
         ydS3kyjF+iDBI3CIbonPfoT5b+83PjKm4KrbaPqRT6OZbABMID6g6HZE1uQVjFF/Z2zC
         DFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811675; x=1771416475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AL9XKoqrbyx57SEE8WVgqntnIEZdm46JdRaV8xyiZ7o=;
        b=o6JlilqhrxdWRIJ4rx5WHzhqQpX8FzK1A8i+w8ISuSKE5n7O0ox3b+DkwFB/iS0EZJ
         5H7exnITpIXZrgUROez7Z41z33hD6uOZn6PwSER7qA73pOR3lUy3gjsJQn9tJjnKcOxs
         YRlSnEXN/Mjibp+npQb2Ssb5pbNGqfJ9RN1Ql3yzzzvoiRKBWlwoVYp/9EkC4DSXMf1J
         lbR5hvpbU1+GSzh4KkTID/m9u3x7VhqMSIxWGywUn23ZSxiYKYGt3ij0Yo26QMkVbFAH
         0Wh9f9LxhZ0t3DCSr+na3fms5bfa+/m6w7Aat/t80ZFpzn/fSE6SDZITmxjFr9zqe/ox
         rcVA==
X-Gm-Message-State: AOJu0YxwmNjhS1biIgyLZi1Y1tI3uYXn3Zzha3fPpK0BPQ4/OaPqO4HS
	Xxs1xfMIHcvg6c41s0eygll/EKRR0mZtGvBGKbOnll+vvuOYl7wFN5pAxYNAqKu0IyFf77eOhDD
	tN37fz/NtyX/NJYR8M/mltRGrrVdpRb8=
X-Gm-Gg: AZuq6aIoVodLeU/dhYla/sT248enkuyCRZJUw94OxfR3peFWbhH5iXPpbAmuw0sSPmH
	tqDRG02HL5514Yqut19DJ6NG6WBjRzT3W37NskiREtf8n8J0TP0YLDVfW1GSExcxcM/FB3j30Io
	M/ajs78qBnleHZ/olfbyYdAi224xTBt4bN17HPw6txjBcQrjG+Mrv16VCQlkrG/gc8LpEqx5+jU
	e8voadY2C2Tg20ElaGaH46beeM1mvq2t4VtamIVLCgD1KSNQEtc5+cHRDDkNJXhL7UWqLMiI2Ja
	QZGbsYiXcaN5ACYniGfcAlqvXavL8p3pvfCVg6L6F1i3f3k5ph19Kr0CBxrFkbDQGP4UgAXWYLw
	EWxhVHnBT3HnOJGpZlVuRPkVK
X-Received: by 2002:a05:693c:3b07:b0:2ba:7d2c:1468 with SMTP id
 5a478bee46e88-2ba9e198373mr275401eec.8.1770811675417; Wed, 11 Feb 2026
 04:07:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260210202014.GA1098715@ax162>
In-Reply-To: <20260210202014.GA1098715@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Feb 2026 13:07:43 +0100
X-Gm-Features: AZwV_Qim-BCVdnIans59pg_0LsKowV3ON4w1_gO2b4qTqEV_jPeid2suH4faTsM
Message-ID: <CANiq72nafA9Ax5ftykpLxqMqYL-_n=F6Hq3Cojj_iSBZ-=C25g@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.0-rc3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 10, 2026 at 9:20=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> There should be no noticeable differences with this mode at runtime (at
> least when building the kernel) but if there are, please let me know.

I did a quick x86_64 defconfig with Rust and a few debug options
enabled as usual and it seems to work just as it usually does, i.e. I
didn't need to change anything on my side regarding the changes you
mention, so:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
