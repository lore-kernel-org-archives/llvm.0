Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5795A320CD9
	for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 19:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776798948; cv=pass; b=cp6bopXE7vsbuArlrvViv+4ULRzdPg1HMlkeqLC5NDi+ohndrvZp/M1L+1v8AhWhlE6PSLKW9PJXY+0dOKrSmVVYEGlUQVVyt3tWkGX/bOelU4QK4lJcagSuFvcK0AP0nBBGH0zTCmPysP7CSJqacrqYfLRVG7bDwKtTCtcE9rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776798948; c=relaxed/simple;
	bh=SplQH1kVYpECskXUZfaSCtF8vozJNxZusO+SRmx4YLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=at+NjF+8+cRKL2R92O3q4U72VKklxU+Yu5QQ62LbUNqrnWqTMFSBR1drd2viLWbMfwweauAIPs0bfea79n5wKTBYheoZc6MRIPFTUO5VFLclgqsjCJaIwBkigj010GqcOlJBYtbwaGlc6ru/sj0dmP6XHUazKjSeQPWsYikpTn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbZtwFOY; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbZtwFOY"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c750eaf4cso186871c88.0
        for <llvm@lists.linux.dev>; Tue, 21 Apr 2026 12:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776798946; cv=none;
        d=google.com; s=arc-20240605;
        b=dU47F7Rwd8P+GExZPiuPuR9OQ4lcWTEvJxNkBATpNclVlQ0crS7J174FXHKu0gN9Jn
         KvPLWXSrZkNCjb2b1GEhJXzfn+9mXm8Wvs4Hu8IloxSMkfXccZd16fi10zIBTYI7AGWp
         rWV5CYqWlRw7G937RXNarpasdSg+rAyLTIqPihCODqCIoFCz7Suw4GYXSPqDhbm0bard
         3uaZwdPOEEsZ744RzpSC6j5JIhwLK0LuFZ84WYGcF67y2zX4MvyM3GGwkzLneaIhUaa+
         YfkuhSB1vtczR91A6jZatmzb6mkaDU/oo0Gkrc1os2xEJmiN1i5n1X671I700ebIWye4
         pcng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SplQH1kVYpECskXUZfaSCtF8vozJNxZusO+SRmx4YLQ=;
        fh=KJ6bWeLrgtE1lFd0PuAijZDkWtv5c3kZIbn0tOsgqeg=;
        b=R77RTeuK6/GsM1urmoppw1iSLCyDSN3JihY6Wdz7wd991MveMCzITC8trwVMh9fbRC
         FDK57g2RdI9Q8NJ+oj7PIwETaqak/XLGjC+Sq9Fmk8smbxHywsZeJOKNmr0zdpqOIM1H
         +HhvcqeAk5j89DnMnP9rgkx1YTeaLCv3QXPdwfs3Zya0Kl+PaorEVPKvTHQEWc6cBkAt
         LuKX7GXCrbQD3c67takB302t4ZLC5Vn1zERtuozAFIxLiWstqIqVW7sB4vUFRPJJqf5B
         VEbm2CZ9TSw/drlXDpZtVg1OH4218Ul6Kua4fN+LbDDSCFobGcDQBpV+0YUnEx1nFq7Y
         3hJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776798946; x=1777403746; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SplQH1kVYpECskXUZfaSCtF8vozJNxZusO+SRmx4YLQ=;
        b=QbZtwFOYXVdYHhyWJQSzO67U1GB8gXboiTdYZ0jh5LuGUEOOX/FUgJ9jRhIQUFVpdm
         qGUtc0BZiR0i5UF5VQC4aaSWMlMuw3xq0otNdc6tmCcYFv6OBpsXM/Qo0Vh1izpSDM9V
         VlcMJawCLyMxO1dfzLm4WFthO5FVEa0vSMLsS/R8R5YAcuioyRNT9mnVfihhyVOAGp9U
         zQLhuRcmLtwpL+QnPiCgkVuCywXV1MnD0CJ9DlTQ16lFjCQ4KIEMrwsQwobVpag5WuRl
         UcLZdLeh5sOlQBwFxGyXMc6OneEWpuby8hZQpPJ5NdbkGpNSr+CHgoMxmxUynhNb1chq
         Hcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776798946; x=1777403746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SplQH1kVYpECskXUZfaSCtF8vozJNxZusO+SRmx4YLQ=;
        b=irIh+8TySgn56FFHkiPg1yiK38I5Tqo0h9C2YwaSaAoxjf1f9+MZqsthT6Dm2JnpXz
         TgYcFfU1o0yjM3pJzXzRxlCQRVSugSr/GQstSV/GFf4BI5TAC2iq+aGCRTUCJIGjw3dK
         +Wqn9VpeUFg2oqlNKHrzHBoswDAZs3+/9m33MoPPEQxaRqfSA5rg0WWT0Nrj28hfw8HQ
         yb6Qrs/WLyvSGCX8AHeaF4wUJNHfl0ML2sBRkZv8WyDq+nhn+UE27kHf/lwttUx5jAU6
         thnsKxFN0MidtIzVIDCErpRZwNyTcvsiRuyRl0rzpoxY5H7a+I8YnOTQFffksr7siXZA
         SHjg==
X-Forwarded-Encrypted: i=1; AFNElJ8odo5SfUMBsD6YMVtIOoprzTgF2RdF3nKLMpftohCRMXiKVZkqrvJU4AwEqEtPF58lQktm@lists.linux.dev
X-Gm-Message-State: AOJu0YyJS55PmQER1Tf0Wu1n9l54rJMyDQbtjQ4SRcVpWLymTnHJ7XQL
	ZE2K3wRkg7AOa+qMMuc+dbVyd1WtXzUA3N880RYNhfIhKtmK1d8TaJENKJSKpaKvsMKoVuahvhu
	+wxNNTs9U9hJvWqSHM7UG+gP3PvmTy5I=
X-Gm-Gg: AeBDietpGyvSePFX1YGUjVwNL18CTTRPoiensVQgfejXFUOCdUTpeBMzj35ebIGjp3x
	SDzcKMkLXk9gkz6W6qB6d5AvHff9QZb+f9qSgbM8fMudXqfMtVEFq7KLeFkidPHk0XXxkPAFtVy
	+dzxBYJ6oQALjNmdgbvHbm4Ikfgs2aUglnsq7bm20w0gjBHaPY76LJG/fvkauZmai2P/g5FWYQy
	gUjjv7o3m6GdtJoKEB8GkHUa1Xy0S+aSde6ZVxTDIKxMdrNX2cTPeCryrOOI7KmSn4CgnQGOEek
	O/PiCwMi/ncczvQVWRwrG7bt1zSR4fOX5XWHvCT94W3IyNI/b9Q8dEWXThcIGNE20H/gTTbDEwe
	K9D7/cIJlKKKsgvEWhby1u4tC4+JAaARLxw==
X-Received: by 2002:a05:7301:128d:b0:2dd:5641:ef0 with SMTP id
 5a478bee46e88-2e47930f7b4mr4550193eec.6.1776798946455; Tue, 21 Apr 2026
 12:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com>
In-Reply-To: <20260421190351.1976329-1-elver@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 21 Apr 2026 21:15:33 +0200
X-Gm-Features: AQROBzDdDZNUJfhQd7Z-wjyoZjCf0gT_s_5pOXiQ7E0xKwlm0hDWneC8YltC9BY
Message-ID: <CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: Marco Elver <elver@google.com>
Cc: kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 9:04=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Add support for the `__access__` attribute, which is supported since gcc
> >=3D 11 but not currently supported by clang.

> + * Optional: only supported since gcc >=3D 11

From a quick try in Compiler Explorer, it seems GCC recognizes it
starting with GCC 10 rather than 11. It also seems to be in the docs.
Is there a reason for the 11?

Apart from that, the addition looks OK:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
