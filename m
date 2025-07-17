Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD9F2FCE29
	for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 16:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770941; cv=none; b=twopv0cgztVkzqx9/iPd17glsaptWCYBw5sq73Ek+Wfr22DOQj2aD5vgpru/TJRDLLbtNt+VPeOO7EbBQu7L2QZ8dx3BPzy9ZJtGdCFTDXI1nguDEcfBER9OdBB+LiBVV7DJC4Pzo45U+x1HkR/y9F3LsP0Ix0iFmVcje4kSyF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770941; c=relaxed/simple;
	bh=ATfb/Vyv7N7+qY0CZhZfMQ/VkrzG4iMeplRhL+HK3KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aM6zZm8TBz9RPGZMMxI1oRSgx6DmuYI7jJBJvA3TZwI0uHfk5sZk+X8u4l4i3cPcgbTadEcpLdBKXwfWxrblSSgyLGiHHlbiCSosH7+fbu+wKtPpuPI5jPX+D3Mug1QA0X6IuROY1IWB7f4GQTZHKQmNZt62u81gDsPmP44c1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S9sgPuRf; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S9sgPuRf"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2357c61cda7so1665ad.1
        for <llvm@lists.linux.dev>; Thu, 17 Jul 2025 09:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752770939; x=1753375739; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATfb/Vyv7N7+qY0CZhZfMQ/VkrzG4iMeplRhL+HK3KU=;
        b=S9sgPuRfoWvnOmKdXGtEmHQ15Qe7enDfDrUvy2jihVNcXFobVJf1nV3O75TBVqZvIc
         AzWZyxyaXYXCEDWuJNuqlOgOdyP3LN29Hu+Zn6ySDTGmc94zq1dhMC1oaX8DQaB878f8
         QQ7ICVQffOb0jvGzzIKZf2XcRO4zD6qhO98X4kWOnr4dyiBVSJqCvLr5q0prEBJG5ylM
         wQU8jBHuoAL4mi2qQqgiMXGzNhUDvOk9bb5HKRHi4nfPCUA6vLHzG6G7P4hJPnNn1y7m
         vp02sX+AVL4mN8uQuSvy0NQnSg9T0X1m9SOjWZHlJBUlpJT0qTvRUq6HlRdUiEuWKAeA
         m//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752770939; x=1753375739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATfb/Vyv7N7+qY0CZhZfMQ/VkrzG4iMeplRhL+HK3KU=;
        b=CPS274/GIlOONjtYIHdkiJK/SHOEWXQUXvWfkx5FBX3x0r+Gg025673gTaJ8+nMj/P
         BefeeazRr5diUOSteNBt0mq4z6g94pTDy8A5aHafvxw7Vy/j9N2+ihSfhSVoZ3hVcbQM
         q7VDP+eb5yGdyM4s1Hxjx3/XyO6cZ2dGcOXKMa9+avWTMgkQaX307QdteaypXy7niaA5
         cVAW5hr5SbQhp5KDyhQ0bP/jj4AaSSMdodZieHVfr8Y8CZJ3au3CdGu0LAwVClF96Toz
         bEnjaKW9mqQ4N7vsdHGRauM3w8FttNgF4MrW/mc7Cf5utCietFgi1RK2/rXO6jlPD+O/
         14Mg==
X-Forwarded-Encrypted: i=1; AJvYcCW2W1f4R4ehZyKz+3hDTvBbuObMxtk2wCnhvHGWr8yTsP4zHcfblhCRgoylDyJk740wVXnI@lists.linux.dev
X-Gm-Message-State: AOJu0Ywj7C8F8ibPx+GjGyrVXXi74ccIeGU1I88+bMaFcMuFvdchEyvG
	n4GsBwlVYtNNr3TeRAYDV7DgnOymWRA5CXZud4xds2vM37f7FZNfEGESdR+7VC/lcqwbusIQTmX
	1rafUSHYM2Cx8asc3PGSZAXkuaGdHokS2Hk2xgG7V
X-Gm-Gg: ASbGncusY1DVR/8XukG9hN4Mf4SJygaCUOdSA2FS8mkvJ5G8YN4DAwbZRXgfMjuxT7s
	vytkNXNqHV+sL87cwBPUUMSvYUkuFn29mUyxkGtCE5OUCWXZqUGW+w8P7zzJ8OOfPDe6NhsXuxX
	GQFRpgJKtBSGFNOT0JaG0rdivaGkaT/sZCj9RlnF4Ax09iE2I3LWcyXlYhPSHbWM6u3g5m3X2+2
	lsw
X-Google-Smtp-Source: AGHT+IE+PDwwXnWhFQm24s8cPhGCQ5EY64CdyLsDsuABTQ+2CmXVfJv7P3ynyPa5W8nuCz7rsH1o5Cw3ZUsHX0Zgg+0=
X-Received: by 2002:a17:903:2342:b0:23c:5f63:b67 with SMTP id
 d9443c01a7336-23e39268bacmr302515ad.4.1752770938454; Thu, 17 Jul 2025
 09:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717085300.work.146-kees@kernel.org> <CANiq72kPmb+7Ygk_Qvsiq+22EJVSPjjwn4whdLuTGCPwvTAssQ@mail.gmail.com>
 <CANiq72nqg79xB=iV4GCH8XCak2jCn+XxUX4Hm1s6n5L=5cLuvw@mail.gmail.com>
In-Reply-To: <CANiq72nqg79xB=iV4GCH8XCak2jCn+XxUX4Hm1s6n5L=5cLuvw@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 17 Jul 2025 09:48:21 -0700
X-Gm-Features: Ac12FXzbJOlwBZd244gzQ7hjYG8HHbdgWFdeM8CQEG3LxeALfQRXXRCHDtw62hI
Message-ID: <CABCJKufPphD3en91N89yekUam4Nv7+C7YPJMv7h2SmZcyhGhdA@mail.gmail.com>
Subject: Re: [PATCH] Compiler Attributes: Add __kcfi_salt
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Bill Wendling <morbo@google.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2025 at 3:08=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jul 17, 2025 at 11:51=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > It would be nice to have a quick sentence inline summarizing how it
> > will be used, e.g. what kind of functions will need to be annotated.
>
> By the way, related to the use case question: would we eventually want
> such an attribute for Rust too? If so, happy to help.

I would definitely like to see Rust support for this too. Otherwise,
we would have to drop the attribute when Rust is enabled to avoid CFI
type mismatches with C code.

Sami
