Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38121E8852
	for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 17:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729530800; cv=none; b=WR//x9QgRcRSrSG4bAlDTiz3HS67yicLdFRXrka0hgD14plRq+kxVUnh03LynAem6MUHFgryyva5U9t8LOFXqQuLRkzDLnCmD/K/yfWpxeNrO1LA2tzPcqgpzgHGPYe7Em7ikRI9TX/S5ION3R4W/HxPbSbtP0VPq7cBmX6eBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729530800; c=relaxed/simple;
	bh=AKGUa9HVhL1DgtmZqXIpB957RrjigEuHhMqNpUgoZNs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMmheUnUQk4U/IkOg7JRPGKzA9BnmlmA+SSF49ruYfaZAif2Qr8ibTIwankB/SzBA19hNbN3hXgyeNxuzttbrVDX1/T0RtVUYGHurr3ycqQ/IB5o+5IbKpa8G9E5C8VJZt/Bo/vDzf6Pkh3jGXdUYadC+4u8MTMdzvKUyVXyEc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIVVorEa; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIVVorEa"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so38947865e9.0
        for <llvm@lists.linux.dev>; Mon, 21 Oct 2024 10:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729530796; x=1730135596; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vIluIAwMUTUE/eR1vRRj+RdoUmdMgjbC2v9uVOonL6s=;
        b=KIVVorEayT/sRt/d1OXL7/D2AXhBHjTsokUFBUlB7WlsSN1EGQ99VpRPuxDXz45pz5
         N3M0Wsz8N94pZ3fZQIbTnVHdCLRn1x+mfyCpYSXh4wGIxGYMO5ugdDu5s4uJhlEVNan3
         GdUIbwUZF9lz8N3qMaecRjS5a5ErImV/b++OVUcjR3HB0g96GwLeDvJwTK1R1mlA9rsu
         XGJVWXX0obO0haWsjUk/1BjTD2yNd7DP6ID2y67+9eHi+QQEMm0AGcC6qyC8/dp+iPP1
         W3OyMLCGisGv1rsKIbsOjT5CXhubcbkHHGMVIJthkXao+3KXog21my7xykg1s2ysPjkU
         CbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530796; x=1730135596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vIluIAwMUTUE/eR1vRRj+RdoUmdMgjbC2v9uVOonL6s=;
        b=JHuyNx1b/SA8C43niRLAP77rkc5zI7twRtduqvsXi9t9TyOiBvg/Akp2dXfvcQfQPK
         j6CTH37kDaKUOvvH4OVxkoz0lsBwHlrhD89mCILzR9FnyQHtz3N+pBkiDvCxfWPt2dBA
         2yf5aT/gB/2lg2d5oLyko0h88eSgoch5tKGMayNrgzMfE2PA+V2tOioniQQdugJb5aBz
         6l9sb4YwHDUzUthLWAkRLvp3atbn1v4n7Qdx1A89FKhzRGzqeTM3bY6mQ16Ed6Ygdtdi
         7N6yxUupmG7Xx8SK9URTMotg0aPltXzzVAlVJGIfgDwLld4IMhN0RnBhX6aXSXi0E4da
         QDzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7d0SurFoyWtqoTxGQgP/VwK7jD+yI+7ZbpCPIEBscaeEMMwLLgRjtQZiXxD+fRKC/DZqQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4Nx4u3s7hOACAwZIaoCE+Rf+I/HS2vNR6Tu8/0wtNqZ9QpEqO
	iR1WagHkDnJ2cfRN3mr1zGjVb+q4oLB7v1OktpO5BSIioFpQWTON5kXOmzi9IfaKqarYuVsk/pn
	K4WWSaKZ+l7vKCMBLisFfs1RglSI=
X-Google-Smtp-Source: AGHT+IFvFFwCBZPEFVvJfGZmKvzpSgoyd0lix8VnZz9h/ZZELYJi0jCL2irDzbC73GlnOsRJ1sx57L07id50l89bL6w=
X-Received: by 2002:a05:600c:19d2:b0:431:3c67:fb86 with SMTP id
 5b1f17b1804b1-431616a404dmr89446045e9.33.1729530795938; Mon, 21 Oct 2024
 10:13:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241021120013.3209481-1-elver@google.com> <20241021120013.3209481-2-elver@google.com>
In-Reply-To: <20241021120013.3209481-2-elver@google.com>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Mon, 21 Oct 2024 19:13:05 +0200
Message-ID: <CA+fCnZcU1P5RxLmHekgsWGWQZ+oOQQLqH_LC0JxqBtLJqR3c7A@mail.gmail.com>
Subject: Re: [PATCH 2/2] Revert "kasan: Disable Software Tag-Based KASAN with GCC"
To: Marco Elver <elver@google.com>
Cc: Will Deacon <will@kernel.org>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, Andrew Pinski <pinskia@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 2:00=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> This reverts commit 7aed6a2c51ffc97a126e0ea0c270fab7af97ae18.
>
> Now that __no_sanitize_address attribute is fixed for KASAN_SW_TAGS with
> GCC, allow re-enabling KASAN_SW_TAGS with GCC.
>
> Cc: Andrey Konovalov <andreyknvl@gmail.com>
> Cc: Andrew Pinski <pinskia@gmail.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  lib/Kconfig.kasan | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> index 233ab2096924..98016e137b7f 100644
> --- a/lib/Kconfig.kasan
> +++ b/lib/Kconfig.kasan
> @@ -22,11 +22,8 @@ config ARCH_DISABLE_KASAN_INLINE
>  config CC_HAS_KASAN_GENERIC
>         def_bool $(cc-option, -fsanitize=3Dkernel-address)
>
> -# GCC appears to ignore no_sanitize_address when -fsanitize=3Dkernel-hwa=
ddress
> -# is passed. See https://bugzilla.kernel.org/show_bug.cgi?id=3D218854 (a=
nd
> -# the linked LKML thread) for more details.
>  config CC_HAS_KASAN_SW_TAGS
> -       def_bool !CC_IS_GCC && $(cc-option, -fsanitize=3Dkernel-hwaddress=
)
> +       def_bool $(cc-option, -fsanitize=3Dkernel-hwaddress)
>
>  # This option is only required for software KASAN modes.
>  # Old GCC versions do not have proper support for no_sanitize_address.
> @@ -101,7 +98,7 @@ config KASAN_SW_TAGS
>         help
>           Enables Software Tag-Based KASAN.
>
> -         Requires Clang.
> +         Requires GCC 11+ or Clang.
>
>           Supported only on arm64 CPUs and relies on Top Byte Ignore.
>
> --
> 2.47.0.rc1.288.g06298d1525-goog
>

Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
