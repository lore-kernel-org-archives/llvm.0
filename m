Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729B36A035
	for <llvm@lists.linux.dev>; Sun, 12 Apr 2026 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776023318; cv=pass; b=KaJxKGZYtzWvwHyhjKDT5/Lxwn2SwORGccESfvP0t4bOVb5LR9u8d6sNDqgO/176EU4unLRPf/ntVonfmi2QA89ay6g4l1O6eoyfRA+HuONF3pzqqOjHw/3fjZi7T7lplKsPUF9a8Klm+XYqx3QxgUeCIkiSnimdybR/gE9/t/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776023318; c=relaxed/simple;
	bh=NxqsjoK+yGMWggMv6T7D/77gA5UUJSr6otloCZMecJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCLTf5tbE5muy4H8hFRYOth+PBJttP0RggAqyXLsF7Ky7q4enuKEiav/nmcJhqqw9i3e+fYXLxPQg8zvyXHKhoKz90iuhdduIAOOWM35CCj+KtHPXFvPuq9DMxQ8NktNBRKcsjl2G95cdn7ptfgqMJ6lR5/qIceZmKTFMOLLOy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bozaNhl6; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bozaNhl6"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bda3b4318dso156794eec.1
        for <llvm@lists.linux.dev>; Sun, 12 Apr 2026 12:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776023317; cv=none;
        d=google.com; s=arc-20240605;
        b=foQUc4lFmY3WoIL49DDSLBNaLciDK5QgPx+InPG5SZZQI3ZanOVR3esh68LqMySoe8
         mJMMYC86IjbjgY+PREjZdW4Bk0+N9svUxb6cdikiYdWYdhOvXZkLoSo22VUArPnte23S
         mAf7WMOGPNgTNhTWVkNFyJRb5PrfLR4bThwt07xwTWEvbZucGF3vuIaSFGx3fDKvbYIT
         UHj4tFQLeKSoK/KP0M1EPgxg2GMRCg1DNXjj0JastIcNNjer19/IevXUZAhePRhhjFOk
         ZhqS5Yd/1P4JRdBUguspw78p9YewqW0ASaQYj2uFOgpoYAcwtx5p6vfIJW3JxRoC0uN4
         3pOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NxqsjoK+yGMWggMv6T7D/77gA5UUJSr6otloCZMecJQ=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=ApNbaexEAgIQM9rXCWRF+8nHHw3m+1QPEvkhcEyqhKKHiksKtsh3NQVxToy4wNl9VE
         6QqlBPkinogXOgw6LJHT/p1IPVxdUQqBzOhgJKbyENBBmpRib4l95ytge1V2UyxEOrcb
         2ccsIY0ngAft07gQgr1CnR/bm1JRsjHMblMjN6Qrms53t/Aic3rPZeb1TZW6fQOy82BW
         xO65EXQAV0PwxizhzurkkqSFjVi8nJNRTduOCQc5+4eY9iK7XCqp7LdSKNIll+NgHVRh
         6M/anTbRpM8591myRz67Snd3MchyEw2qNshuXlNOv0GZ/v07ld5mHi2eHP5eK+/jgkR8
         6IBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776023317; x=1776628117; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxqsjoK+yGMWggMv6T7D/77gA5UUJSr6otloCZMecJQ=;
        b=bozaNhl6/0Vv8/T3fZpp/8PR/LnrrV3rR2muDOr6YOeO2g9//WFIZYjqSIp025+0hg
         dbeAOrEf8tNNjowxmIErXqTHzZhuKdyUIir9wI7SqCTtLqp6YOg+5jRySoo/McVHCQp6
         GqLmL5T58aGeEburbyvXSsohZDoU/e2tqTP4ZUVp9N+9N5ZSVWHJJ9mdpcvxqY709sR7
         9jmBOjLnsYPBR42EgtP476AxUpHz8atK/KHmuIy9Fe6WtbGbuy/b6dC6z2leopSqtyCd
         TsLY8K9s+gDI70Y3D/Jgyvmnf+RHJ3s0Ap+M66NgN25X8nbRGpF6PVOAH5OxHGgNVynU
         d6Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776023317; x=1776628117;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NxqsjoK+yGMWggMv6T7D/77gA5UUJSr6otloCZMecJQ=;
        b=Ju3rfPILfAD/ZZcwFX1+MsiqC5vCxFGqeSk0Al0DQaM0UN/OKh5JAI0o4O8vnKCRjo
         EyC8P7PM4Oy/b6Nq0nHru0nh4ngdm75igu4Y+kFWis5NkvDYhTl1P/KkmvuaEZ2WIfCK
         TZKrOer8lTmmzBlU2ihtp3Ef43t3WIYAxDuUSnz3uoIdMCogSHNdqtzAfe9y6EHKWWHg
         oD3U3wSK8yByBG07LmyjoqNP/DDkDgnMd+Ev+Ym6g1ry4OF3Y7alpDrV28Y/RVzcW1Rq
         HWVKuXMIkprSPNRdzu7P0FKraTARe0FBmmxivRL+WFuADfaPM7vEJbhwj50ILCZ1X4dI
         wWGg==
X-Gm-Message-State: AOJu0YzfFg2PihKYmlVIwc/L3w6eYlh5b+b1qFOvLK9opTtOf2cqXSk4
	cpyY3a5cgL2VhXy+LaGi3vszJTgiceY2L1xD84BJOT8ZBWgSa/kfmN4HjAYkiMUjVzu59Px5du3
	Cr9+xYdXb+bfz7/KXsUKsptfCNiYkEMs=
X-Gm-Gg: AeBDiev+ZtKKrPs+CBEm5R5hCcWrLL5g5gpS1SHsb2U+nbS7seJFtZsImryzD1CFxtF
	XIEaRIasfAbKrofvsUYnLDx3d9VU0cSwLptKy2yS3w0WVI51TXV/JeGdlzsCPk6/YMl3NU6nAUJ
	+cYJhsFzcIaw0OZnNlWNqRTCp4vjJi0PwJrpllRdfXECFQeOgafCuCLwMJgbT5yax5UiNa32nKV
	A0d/v8MFCX5ws9Ufl04rfyqGWFY0jccRdBdRQu7SYzZBWUaaf+SAIaDsiPwHk/aQ82xQNvrGvTM
	9UFRu++JxhaVvhA5VCwNJv6OKBCf6PZc3AEpvVloGz9NuINHWMS126cdlttGCizAUrHp6Fcm+NN
	doTveblH8AL8jpqMTtqjb5sk=
X-Received: by 2002:a05:7300:ff44:b0:2d9:2896:2794 with SMTP id
 5a478bee46e88-2d928962c0fmr182428eec.7.1776023316571; Sun, 12 Apr 2026
 12:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408001057.GA3264248@ax162>
In-Reply-To: <20260408001057.GA3264248@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 12 Apr 2026 21:48:23 +0200
X-Gm-Features: AQROBzBPJ2VLqO_0_EGAxadOlVlEoKv__AykyBvYCRZYJ35qjnMa3R0JKBRa0JY
Message-ID: <CANiq72m=bZ9vQGrAEC3u-_xrXk+9Kcri4TDXKxNnc7jY+Mfr5w@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 2:11=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 22.1.3 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 22.x
> series is no longer supported.

As usual, boot-tested a Rust-enabled x86_64 build with some debug
options enabled etc. using `rustup` for the Rust binaries:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
