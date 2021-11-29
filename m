Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2718A72
	for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 17:27:40 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id x6so22359527iol.13
        for <llvm@lists.linux.dev>; Mon, 29 Nov 2021 09:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wrGFhL5nOtXhmiJzkqjUxe8GF1wNu9qcRKkCoZjMWXQ=;
        b=DCJXCOwVOX664MqyL5+MD32jM9hvaUge59YYsU99LvkkBA7Smxq6v8nJb4QwmE/GBT
         CStijYOqpNxckcXejJVl6W/xXcZ0bRPHuU7+/IpBFpDAhJ+67z8MoeJY2chHKK3SASnI
         uZkZCHYEzgKtKWYW6jy2rCio1X/PuJt1qf8EbUzOBCEg7NVPByVWiLXgv0vFKkoUIU6f
         RpywVmgTo+V8ncY7PL9OhJBoAw7+bnjk36ICZClclFlhUg8bPTFsIzA6Y7b/U3r56Sn0
         /M6CTNlBaLRQ8WJjeBe96dSktIyk3r6ZnCNZ2hwg6hLrfxRaTxXoGJ1GBRd0PlfE69O4
         pDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wrGFhL5nOtXhmiJzkqjUxe8GF1wNu9qcRKkCoZjMWXQ=;
        b=gpvmR0xunJna2E7+4cu3+tLNtq0RB+vrHvymCVkzM2RmyNIbxI6LC9t+0jVYqG7OPM
         vYRalGh3EWl5I0aa0QrbEA4a5o+UWdDsOqXRJ5sH1+ePmPpZjRQEXkRuxB8AtOjoZzRI
         EXmSmXqmSbnAUn6AjWEvqyOIhcsxmGozCQYqB+dK0/xNaF8GM3E54MIsqOHh4x/Bm4Rf
         PuLivbd1c65JpoR8ZqnYvSSOt5N6m3Ugp91XiAjv+4IKKgz026LJ6xuGx8CpG06tdGRU
         xTcPR+MriGM/SZ0EJT/swYwgPqypywIgrQc7nz8I34FpBMl5niJfB+JzrKc0mpnG862e
         ko0Q==
X-Gm-Message-State: AOAM532cygaoU85tdkKGCKi0jnUK6HZXH3VSVtzRkVrBuwrJTGAJDfbs
	gyIRY2T6Ra48ZD5gGJNuzQIANEPXU2XnbhMItU0=
X-Google-Smtp-Source: ABdhPJwbIuxigybLWCK3iRwGHDf3f9obH4Ajtc2RJYfTi2iTkZPNYjc22hORdU2OiXk1YcRoLM/ZHngHZyOaMDcDmYg=
X-Received: by 2002:a02:cb8f:: with SMTP id u15mr76513020jap.131.1638206859331;
 Mon, 29 Nov 2021 09:27:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211129165803.470795-1-nathan@kernel.org>
In-Reply-To: <20211129165803.470795-1-nathan@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 29 Nov 2021 18:27:28 +0100
Message-ID: <CANiq72msbRw12Rv=tXJf4r0gjWfMvKqMCkjEU_2XcyJUmVHG_w@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] Bump minimum supported version of LLVM to 11.0.0
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Tom Stellard <tstellar@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Jakub Kicinski <kuba@kernel.org>, CKI Project <cki-project@redhat.com>, kernelci@groups.io, 
	llvm@lists.linux.dev, linux-kernel <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 29, 2021 at 6:01 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> tree. If that is not true, scream so that we can see what can be done

The patches themselves look good to me. Let's see if somebody screams! :)

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
