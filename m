Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D222F2B
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 17:47:13 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id i62so4251149ioa.1
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 09:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OdOUOSrNjs8WGrwM3cNkf3QDO2RSIWw0of1a994x9is=;
        b=qUet28M/qXwcV735iKonPeQ+jqwhVlbPrZ5v9ERd6dwm84VFOR8zYyWA97AbVMMPpk
         mdNSsJygXfKzrKCP78dj12yoxV745szFny0DHcntoUkwt943/a7cO5dorUahC/6IJ00/
         ozJYiM3vgpSfxlYM/OlXUbNnO+TbLiwEhq9atmoz8mPx/dFEuC7imBFdF93rzQ2iavnc
         Zb8ehMoGhPEzYOD10JM9BHrsRaoX0IBGcMMlLaUBs6P50tFW8STe4WeFavBqkIoahEYh
         rNUldx7DrdAwacU7fFK/lB/bGzTvCGaywBPCTkO4Uiu5e0hOd+XFUoZxrZsTLX3igbPw
         8hHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OdOUOSrNjs8WGrwM3cNkf3QDO2RSIWw0of1a994x9is=;
        b=o0b04MFl12IAsFjINmTKc5L2XuAyYI28ZIEGGFElems5kQTMGBK8dz82x9gtRZwRZe
         Twry/MPjqDJdpKqU+UrdlAHEVKTxnMarPZXLXrpC0C0wZLVgbgYiXhGp1Rkc2NS5PKoH
         CBt25/KDJBHlBIZ/umZnl2Yoc5Tr0xTz4zV6ZMMCMxz4HZAPDu3MEzJmj3Q30H+nsvcP
         4eOtTWQb4PC/Jqcb6zzyuit1nrCU4TbQvpn+F0Q0s1ZAFiRKngG0gVeLnIzx8ulfzc2Y
         bwXW5TNwIZ+pLhcerO2j0G0bAmaWE+jC53+y60O9NY2rxsgR1z3nfUb0TYEuJYA2iiRk
         aRpQ==
X-Gm-Message-State: AOAM533y0rZ3RUq5MMNTpyij+Mm5/z3MUA4KMOLHa7GEa/LwEOiynjpP
	KD10MY3KvbZ/1I5vHOU8BrdRkl+13p5LPHv4dFI=
X-Google-Smtp-Source: ABdhPJx52ZDGvyoTS5OSrCU01ffJy15/Go+Qu53BiKESGtTam0tj+EOKusrFAbEcqE/fXnAA6wgsovfQDjukEOXBLsk=
X-Received: by 2002:a5d:941a:: with SMTP id v26mr18767908ion.64.1643910432327;
 Thu, 03 Feb 2022 09:47:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220203173307.1033257-1-keescook@chromium.org>
In-Reply-To: <20220203173307.1033257-1-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 3 Feb 2022 18:47:01 +0100
Message-ID: <CANiq72mnF5qxfHGoDmvueMY7n2us9ZtA-u3igCJ+QjcbfKMP=g@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] fortify: Add Clang support
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, George Burgess IV <gbiv@google.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 3, 2022 at 6:33 PM Kees Cook <keescook@chromium.org> wrote:
>
> This has been updated from feedback on the v5 series. Builds correctly with Clang 12.0.1
> too now. :)

Looks fine to me! Thanks for the changes. I assume you are taking these, so:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
