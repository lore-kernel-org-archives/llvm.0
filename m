Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE2D2361FB
	for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737042927; cv=none; b=NeyipDohK/stOr8byvI+hO+4Z5J4Rk1MKSWUJq6gtEuaBd2ULiZhn9bkgKxvyPYkxaQB5w/gA7EnUpxAU8Sq3USCRCQVFPxcORmlHgA6uVrYwzSIxdK8E/Gi5vVatE1Yag+jioRfFDiUuzvL1W5e/QvNYHA+l+eBxCUzwjla6tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737042927; c=relaxed/simple;
	bh=ZFjmnolHYIBa/0xzcIhFoIkXCGzMecStxVfoIlpFaF4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baJJlfCpZoXzMWqV8PNyPBoE0/eTedUg2cm5n7F43C/d5vneSpgoAu1Iu8GxQt/v0E3HCSo/bkNF3ZOSMW3dTA2Ctuppi7+e3iOwEwLLgqeyqyyipKitCoVLrqpGONWGiYYokf+s2IU9v0n8RAJGrOJ4eLQwinX3vVwYGnNVjR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKOYfctE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKOYfctE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f440e152fdso245658a91.0
        for <llvm@lists.linux.dev>; Thu, 16 Jan 2025 07:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737042926; x=1737647726; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFjmnolHYIBa/0xzcIhFoIkXCGzMecStxVfoIlpFaF4=;
        b=JKOYfctEcemAUF60NhEiRFuAy8hj39JLBVbC7XypigCkkf4oTyqBuLiSzEUuGseEsY
         jBqXeLq0uTTwWN+befHGIZCW8Wqri6uKPioXP6UoaFDS3kSqN9EpcLmaex57Yr+LzZFF
         zcIkqsmI+NHg+fP1/Lb5Ce4ylyytxYJgd+BSkqxl6jDgjnG0AQgSlHuu7SjsuCQiGsJT
         hLwfnosQqOZFZ+FLzAJ+MwZgGZqeNe/3O8Kv2iOxOUiqZkSuZVouMOOFbO8a44j0PeRn
         UScZOklZLSrv+IE5dVX7X8d/FKSP+bOimNlq0TLTIYrA4E2V/chrPb5Z2jnr6rht/0Zn
         eQKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737042926; x=1737647726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFjmnolHYIBa/0xzcIhFoIkXCGzMecStxVfoIlpFaF4=;
        b=Ae2ylS5SaP7eHesbtrxWfcfAbbu4Q16ol6nI9YMU7owOKty/POJVOyeVOuljSTJCJu
         SF5r11kZ2I+2CcAWJP002q4eLNusZFqn4gxzsKLqQlHc4eG2jQFQc9iKcYMWfpS73Spi
         mWByogvkxo3swbme6sXGs6y6f+sE1HdNgHoaJhja7Am7KgeC4B1H6JeqmrMLhRC3kr2M
         hlJ6XKYIgDtoccUZ3zR8hgyZrvG3O9EwoIXXJCGqB9bM1HWJ/d5LYyYUcMYhRzwkNGFE
         6CRAAvrTAoTR6/Qk46vCETE5nmZrJ8g/eD02zK712/kMNgfE2zyfmd+a9prMLRDY+Mb3
         kJOg==
X-Gm-Message-State: AOJu0YwxpdCcgSeKKVQd5icrbTUYl/7rcuW+SxV5iNrCnPU+gVOnVNzp
	MZCiMvdCrxx7NM2UpkPVgqt6nzCYCb7zD3ZaTABCH1aEdllfgqrVvfQhEt9ezv3eToLgyFY4Z0k
	CZlPA/vdaL5RNJiEMSMgM9wuHyrY=
X-Gm-Gg: ASbGncuRG3hoFuc24ofVr8mJPsPk+fw/30JLjx7eP210JN1vY2BO5ThDpvWHr6HzPhB
	s0t2Hc6N1QlYjdiVZKtRmihlNDCsowOMivIpLpg==
X-Google-Smtp-Source: AGHT+IGnso+GS6kl2tWrWC9nauafbzJUul21b9Ij1ZXkrvFPBpF/YarV9Bc+4pFuNPFtduqjY/4PEDMDF1jR+8ws5qk=
X-Received: by 2002:a17:90b:2545:b0:2f2:a9bd:afe9 with SMTP id
 98e67ed59e1d1-2f548f055ffmr18581146a91.2.1737042925786; Thu, 16 Jan 2025
 07:55:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114214100.GA331869@ax162>
In-Reply-To: <20250114214100.GA331869@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jan 2025 16:55:13 +0100
X-Gm-Features: AbW1kvYP22hHZXuP8oAqRiHS6490htM81S5ozhEg-TyUXBU4XGpuWVwYsPFFKUw
Message-ID: <CANiq72n-4WMzwb4DtxWDmo7=3HAbi8GxArX0Bkz7pVgCzT12AQ@mail.gmail.com>
Subject: Re: Prebuilt LLVM 19.1.7 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, conor@kernel.org, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 10:41=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I have built and uploaded LLVM 19.1.7 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 19.x
> series is no longer supported.

Works for Rust, thanks as usual! :)

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
