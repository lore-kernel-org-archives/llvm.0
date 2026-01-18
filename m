Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B74F32F75B
	for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 13:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768741772; cv=pass; b=c+Ftul7yFc88YoMbQNM9PLoSbR0hK7TMCOh8H5LzPYciflu4CO+qbS9yibEGZmITZ/3XC05W8JZRFoDJMv/OZ3WHc0YUFhfRN0I4z1Tp4gV/crtKR6gmNsL7kCb9c6RjO0a/5LfB3RJTOBlT4EbntNrePBeOyrKXFh2CAJb3YxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768741772; c=relaxed/simple;
	bh=jxj024glRRmiiDeojcX6khS1GlYLZYI5j7rZtk8s8zA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A6Reu2/yjvcPOTZi5CULqj1jct8kiw8dqie6a40mtErs4o4XFtS2ZOLBW8QV9PcJue9ILhA2XRCpXZUBdQJRdJPSISdb764FwKc+b+Th5iFsqto/L5Nlt7+7fs0v1s80aJxrdQlwbeQFRBF7ZhMYZ6KpSlEwQaLiaMt+JQKGdj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z+CP51L/; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z+CP51L/"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ae60247d30so113058eec.2
        for <llvm@lists.linux.dev>; Sun, 18 Jan 2026 05:09:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768741771; cv=none;
        d=google.com; s=arc-20240605;
        b=HKP6Lu/1RdKZEC9rMiRpNxWKTALL3SLRBCYu7CLe095cL1a2MIk1OeLtB3aTc9nYzC
         1h4kYwP8GK5Kaoq44/BQmu2te0MNHZ9pMurdF1yZRDVFSHF0nO0FrcTMLLKuaTZjU6mz
         SkxHrGJWpxfGg6twK7Exu98+cPOwvaz36bqm/ZZijHl4+VykxuDtKXciqwO71eZGqN3u
         VSAQoBK1ZGqt5wdlHsVhAxB+3ycY15y42MHMDeEHNyFI5EduhYCrKG1GKe7vvfCvHsK8
         bLkojW09wnJ1RTemtNdLIqhHm+p5tlYgU7Y8WCphcQSLEsZ0xnx3AZpax6Jw4fDFazK5
         2tjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jxj024glRRmiiDeojcX6khS1GlYLZYI5j7rZtk8s8zA=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=AmfTRjkZNHdekYhH3Ucq96CztWpbxB+L/Qk35aF0KaCTV1sl5uAOFqHI6pY47jtgqs
         k3XD84WvUrvMZZI3CtwNQbbuibko/PtvvAf2ec8P+G0j2LuuxUo5UMURaU9xOQu2Yb1q
         Zes0ob4/z1yZrt2bnboSYCy6gwd3aIgsfkFTJIVssH+uK0D/3xVaYniWSllEq/C+G7EB
         kvAZPPq1UuUW0mMWizjfWxbnznqYH/FXAPQNxJ23+lJxK/dSmeNaLeYSzUtiNCTyXXkz
         ufPNgVU1uW3Fbhk9qVV5VJK3JDjEEt/flPYUnikl2lWpkTwtZ3gFafWHMy9gHBxq8bGR
         qyjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768741771; x=1769346571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxj024glRRmiiDeojcX6khS1GlYLZYI5j7rZtk8s8zA=;
        b=Z+CP51L/cNCZ0K3+DMcNRXwv873SqdA6rtML9/QODHb6Gg9h8L072elLpMT7ZEY9Z9
         oH8nQuXQNrvSt/A8IBWpM7yrMBb/8mYB8UnxVxcgtaSLch2q0nJHTmH+eVW2TsYhcbgV
         +e3MLTP2Kfq0GLmck7sJHDWlokdtXxwY+CBjswehFYwVW/WQ+aRM85XLHh+C6hjd8vu/
         TgFztDRKVXuoJrFSl/hFc80UG1z05JIEI4ORZ1Pi57S9qbrLwqDWmYLfQGeCa5wJ0686
         a706SylKTqm9343Z5QvFmT0cBoEewp5LacnVqDf9Hr+Ygi53YVBbzRvpJWJutD/48DZQ
         tp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768741771; x=1769346571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jxj024glRRmiiDeojcX6khS1GlYLZYI5j7rZtk8s8zA=;
        b=N6BtS4LiRO2zvxag8VgFOtL+7Xkiv6xIVO3/wC7g9bIdsNPDgtd8OtkHO6rF5jb762
         cj23qfrk5jvAIWHBK1a4ZgfZmkql9eeZBufRTG2uELRUDYbkPnbyGzRiYaGeJ0hvZl49
         hmJzHjdIZTE0fACDfXCEvYB2JXTqfS5TZDRdxXZzTDsIb8MJAM0cYo6MHGUGQ1JpJPqE
         BhbF4P6wEKOt/It68RKkYUo1UbdrBoJb4m1Bvup5hHQkZlMys+oafdRLwMOS4b+FeoDQ
         vxGqOl4jffu2W9rJuLfGVVjtIe2iYri2HbjvveO+jE5wDSnAziCaNgTn0wlgZtx3xldv
         cCzg==
X-Gm-Message-State: AOJu0Yzpwlp4bVyzRVUUVkKt4tBnhsQptPEbELi76m4OZz2Dija6Z0nC
	MWYSHEkAPPuwA9h+bEuHBolK1H47zfzblv0BDAB7xxKX+OLld4iarO9SqVppH2pgoShmOAxNirI
	llus1tTwS3z+C0DdyODxL1AIq9p6JVD4ZXx1W+bU=
X-Gm-Gg: AY/fxX4ovbr/cPuXb5wieIEh4RlnAFtsoaIDRXA4Te0LcOlLrgZ+q8m8J290cVHUMbF
	ZeYWrOrhE2YNJ3nvDLZgCYriwdKs5z9kORNGsXUyoQS6q0ZsAm5gWy72lYn5gVaa097jGo4R/Vb
	q2BUlxuQ3T8IS60KZ7izqSavT13/PrJZul/abNVrb/CV690+cuBUz5EaLwtLveOYCckJg8oVg4q
	uFWvwiWRttzTiJcI1GlHPsUjRUp8DtyGdRgZqJVgAANqhQ5aJRXFblLFMmapiG1CAlWLfr2quZK
	Wz/n1xVU2IYoV0HprzfM62AtueNkpnVtRiypD/2Fbkdiaj2QZb7bFGhFpHLZB0oswySebxJ5kjz
	ssS79ggkRIMd/
X-Received: by 2002:a05:7301:3f13:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b6b40fc353mr3732010eec.7.1768741769097; Sun, 18 Jan 2026
 05:09:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260117001822.GA1195901@ax162>
In-Reply-To: <20260117001822.GA1195901@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 14:09:15 +0100
X-Gm-Features: AZwV_QjiefUYKm-uosZDb8rh0YGyL-mK9eNxR_-LxeYaptCInbwXFqiUCW1MlUc
Message-ID: <CANiq72=SSPkQfaPF=Npo+LzTG8ghtJNdrM-F7x09Rgwkm0BEbg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.0-rc1 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 1:18=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.0-rc1 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> This is a prerelease version of LLVM, similar to how the Linux kernel
> release candidates work. If there are any issues found, please let us
> know via email or https://github.com/ClangBuiltLinux/linux/issues/new,
> so that we have an opportunity to get them fixed in main and backported
> to the 22.x branch before 22.1.0 is officially released.

I gave it a quick x86_64 debug QEMU boot test (taking the Rust
toolchain from `rustup`) and it seems to work!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
