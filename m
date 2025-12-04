Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558C4314B9F
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854799; cv=none; b=t1suk04gc2i5f9NEtc7HYqMsheZ2dIj2AInW4E4bwcxQzVAZ4rfgY0J05+iqk8TQ/uDvhgqzN3GXJm7Xtl3+PJ7S/IgYrBPiC7X5jNF32qn7X+YuP/NgzMAC/4V1mS2Xw8ZUbS1AJn2ynmeiSBq0aQFN0KS6J7jWJWqyaSuLY+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854799; c=relaxed/simple;
	bh=2MwlNczNZit1CagROWXg9y4FC8jkaNGyodCcIkwwmE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R+3GPgegMAjsOXz9qs/OZm0yFLmrrKmeIY87DOvwp9w491vFirOYOo/YV13YniiaOO4LUbzqtVBOI40ioieqCVLbiKFjsAIUuHpr9cMnnqbZFFt9UzdLg+7CDd7P1ez99CsgNjObOzCl08xCDhfeLjr4tovuX42M5MfqtQLPcec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wv1qcM6M; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wv1qcM6M"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297f2c718a8so1388025ad.3
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 05:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764854797; x=1765459597; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MwlNczNZit1CagROWXg9y4FC8jkaNGyodCcIkwwmE4=;
        b=Wv1qcM6MjJ+LHBvxfZO0dCDlBzQLJcm6zZBuPc4/HJp6DinT0CAG3d8htmJESv9Nev
         rP/EwuLa5l0GfW9LxZawlOtWZ5OCRdLW9XxQJQZ3EgJ4AixwSuHfQ6pMEgcbuBqPKqE6
         qSZBum4AnqfRDkcvKsLprhzAEUccC5g+IcRqkjtYOY4ds64ZlAdVkQGFn6yW+1qzX8L+
         F+2QCsKA/zXJE2mGOmKj68rm4ateTGSEYxurCWlxmJi6OT1DlQY3j0Y1o0hSjf5L0faE
         yRuWFSrERyL4ux2E3Ku64Qr4jjmVCNosBAcn68IS9Nb6fQD/94MeHdvg+IjZDvLljWaD
         P+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854797; x=1765459597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2MwlNczNZit1CagROWXg9y4FC8jkaNGyodCcIkwwmE4=;
        b=CuIETzBXwt8MQJUV1jg8enQdLD/Qq3VTOeHWGvIJVRgBYDt8MCTQzqxP9YKv5lB9kZ
         +64XuTFm3GQzD0X/fSRaOOOTf8dNxt9A97idX7E3tBQLJkhr6Qbvn0acfZA3sO3bGcK8
         PhjVKd2Gcbke6p92m43uA7sd8TVxvYK2Px+LjwGQUE0A88JwQ8etySwArVa5tDxDWEey
         yUlvLf93l+2Cf5iBLuG+F7dVBbiZ+sb+dhMVjMGUnCdYUsrFqmmUVTnxWqEfMUkpAkiZ
         qQmdq1IjcCdmbnlLFPtiLL4KgQKNsi2s26hOHi0Fb/O3a/LzRXSw8+N017EJrPBy0D8p
         v7FA==
X-Gm-Message-State: AOJu0YzalbzeFssXVbvmhKchfUBbxrh2m3HBvhjYWUl1kPvCztBfycA9
	NlJjYfhgg+eGJaJL5MswANHWvsvBoQtoZp8i5CPba4GBYO9vMK52uTJWPEfvMnAnHt29S/lVdkz
	jyGnGIO+umxXIfdfZAfjCCbDcde4ZuSv5tt40
X-Gm-Gg: ASbGncu81UekFGs+U9VnLd4oQoVb4KUa8CLVGNali2yX67OTAVaye1HtXpCpiV5qTzX
	PUoORc4Ed5hOGXUSR7Z8lsU1iiIe+bMJu32jOT752RV3TOPdT6KPUVNGyYtjwHOk5PxW2zWnrTM
	4e7BmtvZusHGPmhFnGoVZgTh//ah0cwbZtEeIgB+HyI2UK41W/wRROjrhBCIUrzLnKsUCzmfQHB
	SAyGQ07tdTBi59kLyX/GKb4jlFnIejVRefWOrIyHjNQPKr1ug2atd4tZBKkG0b/Hx9APbMROXoV
	aSUayV5JQM0FqtVZSM2YSaUndPPPeoCSuDUnhi6tw5339eZIz4pAMJUrfrmKaNY75PTOKQVBAUB
	aYHSP+7RJYH/KDg==
X-Google-Smtp-Source: AGHT+IFkJD+DGO6SEi8eVbQHE+C+M36qt+oWEXzjnmJxhj0YxfChQ5D9Z/v70vnY4t28lT0MINzvfeRfwdUbmXNvdlw=
X-Received: by 2002:a05:7300:df0a:b0:2a4:3593:2c0a with SMTP id
 5a478bee46e88-2ab92e85242mr3780570eec.3.1764854797548; Thu, 04 Dec 2025
 05:26:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251203024451.GA1766218@ax162>
In-Reply-To: <20251203024451.GA1766218@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 14:26:24 +0100
X-Gm-Features: AWmQ_bmGl8u79mT4fs4x-BNMMRxcRBWCEfv35-xpdMiZ0cjqmDh-6FDGNgxbT4A
Message-ID: <CANiq72mpvn78+6NmiMr8vhtnsgQpbbfw6jfhp8B-Pc=dHk-jTA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 21.1.7 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 3:44=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> I have built and uploaded LLVM 21.1.7 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 21.x
> series is no longer supported.

As usual, I did a quick QEMU-test with Rust enabled:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
