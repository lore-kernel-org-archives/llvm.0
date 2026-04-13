Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8657E3C2763
	for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 15:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776094777; cv=pass; b=faJHwQNWbII2rxxTzh74YTkl/T+hv/ckFU5sdQ+iZCCnagAALVLemO6bkaj04GqOZDGq1Hbq6wPMmat9crYi6Inb/U3wOIIWf+jb2F/vyj1Y2U8J1KxUYX2ZJWLisQvgnOB67TL1uPQRUlLk8tzo1KG7IuiEjkfXNWuLhgGg2Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776094777; c=relaxed/simple;
	bh=fcJJywVrUYDctjHpWN7AmlWpqkUGVBfWhvkLcoiWh0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTjsX06PB2sXJRJohSNT3FV9GAE7xHKLJ/KMNRSqnkrdjlnpesy10nJms5VveH9gf2w+tugF8i/a++2sNzdaREFmO8iCEZw/ZeQjo29KKKzRZygDBr99KBnATYCrLfOSZ1vukiTmsxIZnnGU1W8FvPRI32FmSHkd3uoqrt6DWT8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nd1KuHSw; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nd1KuHSw"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12bfe0ae81aso40166c88.0
        for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 08:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776094772; cv=none;
        d=google.com; s=arc-20240605;
        b=L/C3oC0x25FqmLeR9wqDg+qI5xdu8ZLjapTtZm3Sqy8TbWHDBomp9aL8d5768gvvtk
         3YlNabiB3KjEPLFdnQDXBE/t3BTsh9YfbHoPXWFvq53vjau95Tf4vSTaPT8VYCmW4DIl
         ZVUySiBfMiqho1II/m0ZQR8l2xTG7M7oVMzN9Z9HHLOpYNOkSMsCBzcs16saAqA+L/5B
         8G0vey1B2C8eRpKTkj3hDQC4+RxGhnIbwdQJiC+Dr8ULT6DY7aDok1Cd3F3Quv3e9ply
         Exngbx78IU8noTSVFiBTvUCWvnBV6+hY3vSWkTK5NO4/N2h0u2RfxBsD6X8vOsmEDYdR
         DdWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcJJywVrUYDctjHpWN7AmlWpqkUGVBfWhvkLcoiWh0o=;
        fh=blqLn5Kf9U8YiduOBGxt/rUjULAIfqkiV+MXsiOIUkc=;
        b=BAXw7NP79BZtgZ5UYzrElJP6uSKi38LR9OPyG/lHCAiW/w9XiG4FKRy6N4nxRffY2A
         ebjZn7UP5uYNG2D9QQ3zui2ovrSyE8Z/iWZhW3sNmkwX3X6tF27WPRuHApEW+ShSwLAS
         M7PqmUQwJXLHhPfM+PzVL/9BHK3yJsRj9oI7JZDwNRR7asnSasS8jugtjWeZxlskGjco
         V66LLTj2SH/AY6XQCAQvipJpa9X5Qm4W+H30a0gEe/dJAORJhn58pFQRur2y5re+zxAs
         ZMq/DXF1jYpkIQECoQhr/28rYVAJK13EkRrRa6eTIqw0tgDM8WhPLulSe68PRM/kGtqu
         y1GA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776094772; x=1776699572; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcJJywVrUYDctjHpWN7AmlWpqkUGVBfWhvkLcoiWh0o=;
        b=nd1KuHSwkTYeCEx2TpbYKA4Or5ceAHJYU0RrHwVItwxhkMqXOMiwzVf64eblmDgGHF
         pAUFWDNrLLChIK5Mi7rGBTEQuBO/BKjGK25BClWYE8q4KuFXVIad0rsnzAeopEjBsOq9
         q975x3QCImvCNdTZI7grQBtj4+IpERly0iZryTX6ItXL0bh8wi7ZW76RjWV+4Pbfq1T4
         BeojEC9+VMK3FYwJbbtVNt1+WNTigrRqmS/wttzXu4BlXVhF7McK+DppuU1Ojs3u/Eji
         BHePb9W/Q86Icwjgc9iShw0oig5cqUE36TGCdG7n57zHlzFOKg4xlJn1JqF7DX3Y/qgn
         V+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094772; x=1776699572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fcJJywVrUYDctjHpWN7AmlWpqkUGVBfWhvkLcoiWh0o=;
        b=BoicERr7jHSOkWusIRodrc0gWkPemY2YEcHIpA+wo4pne/L4QFmw01rhTs2HDHPN6h
         tSa7vvDF8xEKr8cSJpq+pHF6dO5V9iaKcNj6eZT89Lp1HCHR7oWTZAXik4BZq6F8OzYb
         bIm8vSKajwps7SUB4xaUq8RcYVsS8qWNxdsefJ+wrbDF+2XVO0m9QbIRRAj8XXzPtUHz
         1tZEzg7LQBqjs/xzR55BmwCAQ0v8xGmkBQDYN9aTDT6iRpr6Cl0yQ/BK2Lv0Xrty67Kx
         kzv70LCJRgO2eKGS3xqe6IjvNJWBXq4vOsPmd4iO20QnD3DQa3zgkzJ07YCFJMYOHnNs
         ZAPw==
X-Forwarded-Encrypted: i=1; AFNElJ8UO1a2/nI9wtG7IajrGbavwS714h7In9UW5pTJi26XN5W9I0OMJH3bL1Igh1nRp/LWOsfW@lists.linux.dev
X-Gm-Message-State: AOJu0Yxl9EHwzF89RqnXn0/CMuRFpRRbog7reJOyhV0pIR7PKdvS6bxa
	+Sc+ybOZXjPM0OeObqA8HXpKmIos6hnK1whpTPUbS5EP2b98P8jzFdvrA/Uq97leTDmUG1BafTj
	b0im1LvQ76926q+0DpKgJ3YvZtHb+CRFIPzn6+fE2
X-Gm-Gg: AeBDies84mzmwwuHbGn7JdvYI44nUC3JE9v+jk/cETYUbCd9tNozCXgv+nWW2kxydsH
	czrE8BmakxjSszrJOLCYtBKspFVE6a1AqkJpOyBaPR6gE5F68XLoRy6aCoYK1WxKUpeV64CzSxY
	OzT2T3348VAXPSuTS8xUNKycXqseUlsMMfBj/sj3Virn8UbgTFU22fXaUxNYDAdED4is9ItjY52
	NTdfGHBL0vy4dPPMnXQMM2uSIgtDcLM8ZMvH2NGDXWZ2JUffEFPm9eB+DCkM/oIbal/YRTXveXm
	eOWG11Hqr+QGUNDF38b+cCGJ6HsHWWC2CDNqxLoLGJjKByE4
X-Received: by 2002:a05:7022:6882:b0:12c:4928:57c3 with SMTP id
 a92af1059eb24-12c49285965mr153189c88.19.1776094771059; Mon, 13 Apr 2026
 08:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407165551.3075684-1-irogers@google.com> <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
In-Reply-To: <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 13 Apr 2026 08:39:18 -0700
X-Gm-Features: AQROBzCy0EKMqIRUhO9POGSJol28e_f5mX6Y7Gb87wdIX4WVMvDoddAq8ZvmUo8
Message-ID: <CAP-5=fX92ncYELs_XQXw55A=PYxBnLY2V1CqSpCV71Zc9Pf3oA@mail.gmail.com>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
To: Joe Perches <joe@perches.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 10:11=E2=80=AFAM Joe Perches <joe@perches.com> wrote=
:
>
> On Tue, 2026-04-07 at 09:55 -0700, Ian Rogers wrote:
>
> > Sorting headers is desirable to avoid issues like duplicate includes.
>
> Perhaps.
>
> Some others prefer reverse-christmas-tree by length ordering for #include=
s
> though I think it's poor style.

Thanks Joe. I second not switching to a reverse-christmas-tree style :-)

If this patch is okay, could we bring it in through the perf tree?
Namhyung/Arnaldo, are you okay with doing this? Being able to easily
`git clang-format` is useful for my work in perf, and the motivating
conversation occurred on linux-perf-users.

Thanks,
Ian
