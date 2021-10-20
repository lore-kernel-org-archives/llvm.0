Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2537F2C80
	for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 22:45:14 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id d125so26638797iof.5
        for <llvm@lists.linux.dev>; Wed, 20 Oct 2021 15:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2vzxjST9VYYskOzjypmiYVHx0fvZtSsG8PABlYBv/lo=;
        b=TpzToV6EG5NUMGvXt9S6KBsFTYzNG1TBuUj7D8E7KHRuTeoKxkz/1cLf9ok80ducUC
         rLnxwzxNRLFR9u+OTJDabjXniDjDaNj1IPessl3Zx5KNjj/vmwL1+14E0DSVC0G74AQv
         0l5l8723o4ZWIJp7ff+Ue7Dkli9FKp4w7K5PPsJbZHe2T083X5u6P6uPd1jsTsK3C779
         Z+wWqFbfItnh06U0SzgLfTdHOsh+jSQGM6UhB1OWLhYCBoCcsINdbmfdfUR9rp0hpf1L
         PxWAkqAyjM1iFZPjXlSnH3cCq+38EvDfdU34oX7/A/AF82ztBU72PQrOKv+k9grakUny
         Rdyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2vzxjST9VYYskOzjypmiYVHx0fvZtSsG8PABlYBv/lo=;
        b=fbMAcZ7MJxPm9303icQ+dDOVSpcPAT9ygwRLmEPmL8JIXDD2eb9vAy/tGKYLAuuIis
         AxmVegepEEgdOIT5U5q/laMSP7CqZXENFdrUxTGLB9Wstu33DKH6XK38o+JnlrGetIES
         hCaOxAAZzwrbV3qhmV6qIkg3rAQfluA1BqY6CnvewoU0zOEc6qozr8Tv6eT2fLCCpSc1
         QRwxMlitbmZ+c96WG4VeaG8+fguHy1GxNWN9e/XHBsyK6lKOt1uITI0IVWKWYCY+TE8N
         zSI0Z/avSfwSgbd5enRqr+pQDZVFqU2QfSgy1vLzDMiSJJwjpLSshaHSNTF8Rofv42BK
         +m9w==
X-Gm-Message-State: AOAM530Hl6xIbuN8CB54obhuXUCaF5fMqgAZyl2GN/GIyA6L833cub/L
	nMhwV2Bgb8NwCmK8XaHeWHbZBLph9bHBjm2vYOU=
X-Google-Smtp-Source: ABdhPJzKe9Xa4H2Z7T3/fu3kurLNBai+i5fhrTTk8e89yITi5PcdWxHypOm7vYfTQCEx4PjAb85K5bGwKERsh6jHdrU=
X-Received: by 2002:a5d:9d56:: with SMTP id k22mr1299385iok.177.1634769913268;
 Wed, 20 Oct 2021 15:45:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211020200039.170424-1-keescook@chromium.org>
In-Reply-To: <20211020200039.170424-1-keescook@chromium.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 21 Oct 2021 00:45:02 +0200
Message-ID: <CANiq72ncBda6WE6ZTF9WDssHkMmM+JC5q8vkdNwiXFXTsSrnwA@mail.gmail.com>
Subject: Re: [PATCH] compiler-gcc.h: Define __SANITIZE_ADDRESS__ under
 hwaddress sanitizer
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>, 
	Will Deacon <will@kernel.org>, Arvind Sankar <nivedita@alum.mit.edu>, 
	Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, 
	Ard Biesheuvel <ardb@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 20, 2021 at 10:00 PM Kees Cook <keescook@chromium.org> wrote:
>
> I'm intending to take this via my overflow series, since that is what introduces
> the compile-test regression tests (which found this legitimate bug). :)

Not sure if there is a particular reason I was in the `To` field
(please let me know if so), but the patch sounds good to me!

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
