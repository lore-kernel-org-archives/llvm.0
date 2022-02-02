Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3702F28
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 21:19:49 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id s1so464061ilj.7
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 13:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1f3qkBr7OwcMuEx7wDz36wE1LVweMZmBxkf7MbPeZyY=;
        b=FW3cbUBB7agROZ5YjTp7b4wsXG8Zt/C3ptprYzXJKdtvPFTcrX4Afpqs/7NS0o+/vE
         jJsIE6EDQb7vXkcYP4K+7r7iydD7Ze+2DI4m1g1gypljaI34DYo3pml8tDShbPTwYwQR
         Y5Q/+q4U9oYRq9zmfzxVrrKBbuu8oz3uFgyuUnzt/v/cL6uVTNyOB4OneO53sQT1Vo1D
         lMRJ8D40UcPgYxD3SRwynNM6V2lPtVR6JyM7Lmw03ey4Yh2r855NYSl837GElvTPH8F9
         EiuVUBLvwyKelinM55k0PZ1TuyQrDYT42NL1Dsey6+ck8I1lgr1WdovEBekVjCGeqt2X
         v45A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1f3qkBr7OwcMuEx7wDz36wE1LVweMZmBxkf7MbPeZyY=;
        b=Li825f4KkqpUJ/vQXF8nQT0jLv7MwQV4Zevg00Qm0cPXI2gd7W1QjX5CZQFbIYZ8j/
         pTdPR0WY9cajha/fdxiy4jaXMgU+8eIxVqDEv3Cl4ZU7/MIrigXLa+YoRDqsWEWB05rx
         3pCHFVHKpgVhwS+epSNOkoYORnwjdh7v0gBp+m2lyqdRyC+rQ8aW8TBLVYv/+px1q9uR
         QpFuVrmt7u/xwb/E10HLxG8mIYRw3swjGI/Ooyc9Cx/p1qYNdVVzZCRXCYq6JGI0hNCw
         4FxYkqkDUCeAI/wPnX7lHiVX9iEpTVPmJxDo+fQrhJL1OsQ82Tpxw7v+LClMxUnU3lgK
         6Dzw==
X-Gm-Message-State: AOAM533Cn041TaOflV9FEfLZdNleiY3vv/Q4f6oh35RyujjjFzg/N0La
	H/Tz+FHqwCndyVjQpxh67YtX0aN5cVayNnih79jLGoix
X-Google-Smtp-Source: ABdhPJwltdwbEUw1cD6vun2+dt9kM8XuGcKuEW6K+qmiH1QnB8UKmy7cfDAtdjSF3hCiPhz+q6+7gGJ4BjDsp+QuIoI=
X-Received: by 2002:a05:6e02:80d:: with SMTP id u13mr18427272ilm.151.1643836788498;
 Wed, 02 Feb 2022 13:19:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220202003033.704951-1-keescook@chromium.org>
 <20220202003033.704951-2-keescook@chromium.org> <CANiq72n1d7ouKNi+pbsy7chsg0DfCXxez27qqtS9XE1n3m5=8Q@mail.gmail.com>
 <202202021307.75435AF9@keescook>
In-Reply-To: <202202021307.75435AF9@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 2 Feb 2022 22:19:37 +0100
Message-ID: <CANiq72kw_=6HfSbVJovxQuJwYT8sQ2TNnyRa8gr6v1i5Jws9ZA@mail.gmail.com>
Subject: Re: [PATCH 1/4] Compiler Attributes: Add Clang's __pass_object_size
To: Kees Cook <keescook@chromium.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	George Burgess IV <gbiv@google.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-hardening@vger.kernel.org, 
	linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 2, 2022 at 10:09 PM Kees Cook <keescook@chromium.org> wrote:
>
> It's the kind of detail I feel like I might forget a month from now, so
> I added it as a bit of a hint. If you think it's too redundant, I can
> leave it off.

If you think it is valuable having it nearby (e.g. when inspecting the
definition of the attribute in a call site), then it is fine having
them -- I am all for documentation (and we could consider having a
small summary/one-liner for all attributes). But, in general, I would
avoid repeating all the compiler docs (or, if needed, we could fix
those upstream if they are not clear etc.).

Thanks!

Cheers,
Miguel
