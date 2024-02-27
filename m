Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D631C6B0
	for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 16:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709052679; cv=none; b=C3cbMsOq4YpcNy9j3fm5yaAW0JcX3eNqyzW4hbSsRm8JB/V53pEaMuOGeHzykx4K2yoOnST15EC98GvCISma629QYLHTyLcUi7NagTwd5foAV5CHvQyeZuQ3Lfkbio3Ly5NqXb4Wa0AZ+sxsXMAKTmVfVTAEbtngG1a45F/QzoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709052679; c=relaxed/simple;
	bh=OUt6CYZupNiEST0iA+DgEudMWAk4Tmq4OhXq/et4EQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dwm2XNgcfteqSTl8MQCgus7UqMtLKbMeT62StkgBdMyRNGKIt+v4TcRsTKCp/q3hJUuQSP4bOcEonU2VkRxWXaFT0lsfk5dwuJtKNGPWzJ9fguz5QRRdV7rgDuBbVQ//M7DYio6LRU3dSUlX6MbZUZfSR5K+mXCBbZlS53arZH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbvbE23r; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbvbE23r"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e4d48a5823so3664104b3a.1
        for <llvm@lists.linux.dev>; Tue, 27 Feb 2024 08:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709052678; x=1709657478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUt6CYZupNiEST0iA+DgEudMWAk4Tmq4OhXq/et4EQw=;
        b=nbvbE23rgsKuk39IAFpUksoFpqaDXWR0LFRXCM6NlnsNdGtOPKJ+YWqEZXxREx7frX
         tcNqdZ3RhD758Du0dBbcdsJmyaK1VbWb6JSJjXPnE/Rl0JsOSdUFCWiMKYuyvtmCM3U5
         BI9msYRN/p7VY5Qn2BO6rRefhyFzVze08KmNSZhPloLOTCGhcu3knmPOm7yXw5uybis6
         2/0C+z2q6MfDb3xL8r5ZLg/sW2MCHhCOqVvpD/FVmkyeYyhvDoe5ZAzT7ezkvJPQtYE5
         l2ib0rP9PIE3qxMny7xf9K4oUQhbO83JJf57UfyBalgLIv62ZSBRyn4ETZQokD6++fu/
         i/dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709052678; x=1709657478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OUt6CYZupNiEST0iA+DgEudMWAk4Tmq4OhXq/et4EQw=;
        b=wxAe41+tFi6cmwi0MLP6OioD/gF6a6S7+CZ7tkwMthqFQbUe3IljYXP0932BuCvv1t
         FncpF5EppPdQH6VNmKWB478jZNMwzEyuVI4tniRs8r8bdEi29Yajr7rU10wlslTpSnEV
         BkBcDariFT2YjF7PIhQVMeQf4gjPB17AX0Cl5q+/KLsjow6RIjojQ1CeL0JTttshB8ys
         mcTCLKJkmyE3OBFKwqRy8CL/hvFQTSK8Xv7hCzKx1TRcs64M49v1cGq4AoSjE0m8PkaX
         RAbf7qQ2x8SXHh/xLiCVgVtGxsEWFXhcEsdOg8/94Kh1oZ/+wSzXZWw8tnhV5XyNwIyj
         aONw==
X-Gm-Message-State: AOJu0YwyOWJIipu/Vw7Mq0PdqKTyER9MLAQoKei9f54mo5LnCS0O9CIv
	WJ/edEWMkonCgPopVHfXk+TZPvpYRbs81i6y1O9WMx3wCqJI4l+Dc9O4B9MSCiprarDalwSZ1vQ
	Xud5sZVqP9/2XIDyAn8qBCGMT7qo=
X-Google-Smtp-Source: AGHT+IHGmk6+rXLPMR3cGR+KN3oHpSsuNkYvicHZWiyeZmHFsnZ45UBOqJWlavu5KkvgBCp3GBye1fgIbui93FLfwDA=
X-Received: by 2002:a05:6a20:ce4d:b0:1a0:ea67:ecb2 with SMTP id
 id13-20020a056a20ce4d00b001a0ea67ecb2mr3077170pzb.12.1709052677564; Tue, 27
 Feb 2024 08:51:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240208002841.GA2601476@dev-arch.thelio-3990X>
 <CANiq72=G--5LW-9sg2PscTL863mFVNdnX7LUQX2Xj02qZs4crA@mail.gmail.com>
 <20240212234850.GB3221859@dev-arch.thelio-3990X> <20240213025303.GA4006766@dev-arch.thelio-3990X>
 <CANiq72npYCD-zKqcXPNOAxnKiUCCXGbFQaGo-8=0-171ni+ncQ@mail.gmail.com>
 <CANiq72kcQUuxcno00+QWrstrcfwC+2_Bvh+8dr5kgVkEtrWOEA@mail.gmail.com> <20240227153728.GA819789@dev-arch.thelio-3990X>
In-Reply-To: <20240227153728.GA819789@dev-arch.thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 17:51:04 +0100
Message-ID: <CANiq72mmDquTeoEVErwXH7bVhP0+UifCrK0n=-HD97noWLqryA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 18.1.0-rc2 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, Conor Dooley <Conor.Dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2024 at 4:37=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> How far back would you like it added? I don't necessarily mind
> rebuilding older releases but certain entities may notice the checksums
> change.
>
> https://gitlab.com/Linaro/tuxmake/-/merge_requests/364
>
> Not the end of the world though.

I think a reasonable set would be those versions matching the LLVM
that Rust bundles (for `rustc` versions we have since 6.1 LTS). That
is: 15, 16 and 17.

Conveniently, LLVM 15 also matches the minimum external LLVM supported
by `rustc` in 6.6 LTS.

If those are too much, LLVM 17 would already cover what 6.6 LTS' Rust bundl=
es.

Cheers,
Miguel
