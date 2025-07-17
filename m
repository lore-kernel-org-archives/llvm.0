Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174F2989B4
	for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752746882; cv=none; b=OcBQh7/0hT46v4uNGCL5qbvU52lN7hgdcaZHECdBlkhTqui7EEFwqiLd2zvOOy5RSNx+KMPlTNc5+yvZt1SvJddBB5FIrpcKONOOxXqQtuERGH9kH7BOyedqo0ZybJc+gF2PAVDBSj7UNKmvLpRtYoh7qbwCqo9u1lWoKoRaYUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752746882; c=relaxed/simple;
	bh=FkQy/Y3q6tMqhobUejvgOD3UsPfO0JsXG2mMvZoSgj8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t7lsvvwhojdHZoBRS5mwTpBnX8/OlfhRMq4w01qGaOxUhB1MphnTcl7e+m5ibBjiefe46PXK0SZW01jApkqK+4Y3G+NyDuesS6XKthdJ4KeCXgOtf/24kUTex/xgzsxTJQzzH9Wvo2JAq6pRaNqr6gJJDUROJipXh7ihJQXXCX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LHrndp0i; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LHrndp0i"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-31306794b30so144481a91.2
        for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 03:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752746880; x=1753351680; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkQy/Y3q6tMqhobUejvgOD3UsPfO0JsXG2mMvZoSgj8=;
        b=LHrndp0imYrQTllH138UFDDDHDBEG9+rhzGGOBreMh6OmUzAOLaXh0YbwFScuSN1gH
         Q/MaSiBCQ5v1hQDNqTSouh7m4zpFV1kV1b+xYgWFU2Hh6umecyyOC1DexLl7gGR+mlU8
         uNtsAnJb7NYElPdzhScSZqngA/M/cLOHhfJ62fl0HvQIkjMX0glbYY2j+rQapJkgmxqn
         sgVDipUuXi7/4q+sJcA8I+v6UzEzTC0KLvIYWoBMOQHYG8ZEDLXrn5xJod38y22mcvOK
         q+r5LHXgn48F5RzDkgM5lvtJCDGf9sTTB5qTbOelTu8NvVePe/tnQ/aMIHi+ccsCYpKY
         m6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752746880; x=1753351680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkQy/Y3q6tMqhobUejvgOD3UsPfO0JsXG2mMvZoSgj8=;
        b=b8K3L/q509IMVQLFqSGKpK5SEBTiqGGDJAgNIKPcx5XnHquGuLtRlFjlL06CiM9uqO
         cK51+m2aZS4g/Wb3Pw7ZThZajQvYCJ5w3BEHEr7nRaSaQcPW+pBFQYPTpJtR3UJWmRgv
         9WXo3A1sSISMCzrYEZ4q5eM0p3C3hsRJ/SXPDXhByfPHcsxmY1OBiL088hpzu0q23Zuh
         8MUc1jVxs6liMzL7izhHMWbRn8WXcbAABVXXhadPMHaj0wwikOlNYcLJGIAUxnraiA40
         p8sHyhYNkRIXioA8juWGXZWnByUXKSR9qdIS5SoNKde+uYVM13h1lZvlc3OupxG2ZBOE
         +/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfExVmI0DoO0iddfPqSuGIGlwZyGf+MDA2m8/juRRB1is30LYqbZfVQJlp+xoAbY6RGuKg@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4/OE8gQtTxvIY188uHa8VXLhg6r1jezyKy4Uv7OBxCURm9/G9
	AgzqLxZF/Alo74o9RM0L1yEE58RoMyimqgogxcVecEzGDgZslwKFvvPIMVry1Gulhoo8SDGzGH6
	QaQK0mngoTbGjhk/K9/TEjR63fs3oVx4=
X-Gm-Gg: ASbGnctgtpitcQyqBisZ0ELgkLPcphwwa1i+ATZNGvFFdnc1w5jwb9ei1RfW4H4Yy1R
	m0cdT0MzxB3EyZGS4huipi5mJortUQAs0OvbG2TTMumND8vBmfsSvV7stWwCsxnpNzzYn2vGvbz
	u7bmExH99/kdzdHXLsr1eRl63fZilSt/LjQlbpridWHMuZ2RuJw0A3vVv8T4mQjE2HfiglBYmx1
	1VujSKC
X-Google-Smtp-Source: AGHT+IHx7O5PAXTasiy9yyPUprUELmj79np3hybUvsshq6jLwxK4T3fmJzDg7uiXUMAUYMEcAk0CpU7R+CJUVfZd4m0=
X-Received: by 2002:a17:90b:4f8f:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-31c9e5fd68dmr3290528a91.0.1752746880122; Thu, 17 Jul 2025
 03:08:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717085300.work.146-kees@kernel.org> <CANiq72kPmb+7Ygk_Qvsiq+22EJVSPjjwn4whdLuTGCPwvTAssQ@mail.gmail.com>
In-Reply-To: <CANiq72kPmb+7Ygk_Qvsiq+22EJVSPjjwn4whdLuTGCPwvTAssQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Jul 2025 12:07:47 +0200
X-Gm-Features: Ac12FXwT-j99yzQ1QeDKF2d9w3_kpLJ5UpDscxnEoLwurYXccSzH2vvm19x_7h4
Message-ID: <CANiq72nqg79xB=iV4GCH8XCak2jCn+XxUX4Hm1s6n5L=5cLuvw@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: Add __kcfi_salt
To: Kees Cook <kees@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 11:51=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> It would be nice to have a quick sentence inline summarizing how it
> will be used, e.g. what kind of functions will need to be annotated.

By the way, related to the use case question: would we eventually want
such an attribute for Rust too? If so, happy to help.

Cheers,
Miguel
