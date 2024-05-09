Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBEB1292CF
	for <llvm@lists.linux.dev>; Thu,  9 May 2024 22:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715292262; cv=none; b=kRet5uFJSqHsYroin8zmUJJyZrJZwJEZs7Pavvo86XVwGT08DkVNc7NaVnnl8zjrn6mK99jpr4dtNHxpJ2yffIH1XJ7iBDuxuq65DXOomrx5G1o4H7j9+FgUOiuIEcfq9e7VBwcnL6aoWXLVKJGfb924UQ86LOYvDZOtorkHJZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715292262; c=relaxed/simple;
	bh=OgJHhmIVrHJ1rqU9C9cLleVIC11QJQgCtRwBNIfc5aY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYmeWL8kK9WVOR2ottUthdyjnIFjLT3ZXEc4hF7Amm6KZtdjmxyxckevPGqF0aDvI4OzlH0jlmlPf4Ko/C2qn+w8E3viMBCg/7uOqfOWyhchDwzQR3xltV4MN+kKwWPEc7pw4US3Yl7WaFcJ7hq7AxmIxMcDo/awBDzprpWnX24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RhYAoyZ8; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RhYAoyZ8"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3c96c16bb19so835991b6e.1
        for <llvm@lists.linux.dev>; Thu, 09 May 2024 15:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715292260; x=1715897060; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaMGWwE54MRwQe9MKn89HK8vqNbPvDPLq1+qzXPGB6k=;
        b=RhYAoyZ8HPCrJGY6WQShHavzVP0rRWVfDZmeJ8S5u86yw34ep2pWsckzYL1UxUHuYR
         vOo82DcwPgjL/2YCnQwYPrpWLKePtRwmUCAbEsgxSPYOSkh7ELEzeQ1nXsFdysZlFQ7g
         KzaGg1AhVWnkPA7IPpDp0mOpazrk+Scc4iEDjBxX3t99QdYzoXsYPje9ZZW2OyD1SNJc
         nlvEPpdG0GwJXptJKgUv2l93ErxtJYctvxpJ+QOOYu+16gqTaf4gmjNvs22EXHLXBbms
         1hKaNsyZqtB+ecid9r06W8MtLbOapmWAXBbJqZ3t3AK0lEvqWBVcyuOrkkD1J7H0tg6v
         5i2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715292260; x=1715897060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaMGWwE54MRwQe9MKn89HK8vqNbPvDPLq1+qzXPGB6k=;
        b=UIMmRMibR6oSlV2jzINquAlqrqiRQTN106UOtjwDelF5c6IH2638elLzASbHx4iisa
         LZOoDFNyyQ3Vr4Ix7H2OWDFzQg+SnWRCK2MEpW+iJ/LIKdkpWyF5HUf71UcZX7M6pVHy
         c7ooaneOwEgkf/hNenFRf5frnod69u5mobD3Rtzj3eDs866Ly98Qkist3AEjwEuqMLWz
         BQ0RKkiz7lRdT233pnolgpkheUAKH+u+lYC8qHcXCXC+/6qQgw2Yi6WiWRRANqn2hpme
         k3qsEJuf5aiXFlO4lulkXZ1C/iW+QL4mQ/TndkHyPtSokad/kLf0Cm+sMG/EJDtEJmN6
         bcLw==
X-Forwarded-Encrypted: i=1; AJvYcCVDoWCCZKyNgBEAgSIIqX5d4p4RPn2ZkcM3EUcvYyiBbNoMEaGuRxYIRNpJkhGatBEj2NMT4BLEAaZP6H68RB2k8+dnBg==
X-Gm-Message-State: AOJu0Yzt/Bpq5rk2Q1UDHqKLzUXuV6SqZir/n8Vagrx0zgElpSMe9ilg
	lDwn3U5l0IVnrTocjzbrGnk8vw0UucjLpSl7JontNeD4AEjwQRdg8iAekw1DBIHTJvNl6NvgPC6
	57h7rItKExKOL4EoFGCLso7DxPSM7Ao5hXxpf
X-Google-Smtp-Source: AGHT+IGOrX7CymOEEesjDKbsfowT/rCu7eZVPPyV31UhJCy/YotrYfiCNXVJAu6ojtjG96eAKvVU1kdO7vspfPuqgL4=
X-Received: by 2002:a05:6808:1688:b0:3c7:41ba:102f with SMTP id
 5614622812f47-3c997074664mr1087661b6e.34.1715292259867; Thu, 09 May 2024
 15:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-b4-sio-scrollback-delta-v1-1-4164d162a2b8@google.com>
 <f7775510-09d8-41ef-97b2-0457e721a9ec@kernel.org> <CAFhGd8qkYYQZi37Tsj-V5pN5S4xhcyUeAZj1of2kTXG+EtVMgg@mail.gmail.com>
In-Reply-To: <CAFhGd8qkYYQZi37Tsj-V5pN5S4xhcyUeAZj1of2kTXG+EtVMgg@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Thu, 9 May 2024 15:04:07 -0700
Message-ID: <CAFhGd8oZy5aKjp-mVhh2d3U3tzTMzVRAfE039gvBACC0AdDNQw@mail.gmail.com>
Subject: Re: [PATCH] tty: vt: saturate scrollback_delta to avoid overflow
To: Jiri Slaby <jirislaby@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 3:01=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
>
> Agreed.
>
> Does an implementation like this look any better?
>
> static inline void scrolldelta(int lines)
> {
>         ...
>         /* saturate scrollback_delta so that it never wraps around */
>         if (lines > 0)
>                 scrollback_delta =3D min(scrollback_delta, INT_MAX -
> lines) + lines;
>         else
>                 scrollback_delta =3D max(scrollback_delta, INT_MIN -
> lines) + lines;
>         schedule_console_callback();
> }

I apologize for this formatting, gmail ate my tabs.

Note to self, do NOT copy/paste from vim to gmail's web client.

> Thanks
> Justin
