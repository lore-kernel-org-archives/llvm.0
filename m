Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B60F2F37
	for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 13:39:47 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id b18so27432267ybp.1
        for <llvm@lists.linux.dev>; Fri, 31 Mar 2023 06:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680269986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p8HyCR6qUgL2YL9MIarBVNh91rgqxInYdUkkRv7lzCA=;
        b=nRQVT9ShE0pExTB54GDQVPUoE5xeg0yZISdISWCkiaC/z9HRj31sfeE6I5mTha44sY
         FqPQHA8gp7feZ2Ap/WXLKcka4qprU9xOlYAwx/PsdGZrVMjzLZqi2emdau+nG0Hbv0C3
         3/kWmtGI/xWfhv3DXsK6HXxEZX3kBUw71sF2+RvpC1SgGXf/T9LO5ytk9j8HSurCFxee
         8IykdnR/8W6eifFOBjLc/iLlqTguUMNQnQ6jcxlYoujxYzVJa5RTq3wnT+T4zjX/HXub
         ROpXfaWDFJ+FMzmoEHNv30WTzud50vzxa8ncXd6vRq1MBzStrtfx2oA3T2JFefm8Cyoo
         i9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680269986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8HyCR6qUgL2YL9MIarBVNh91rgqxInYdUkkRv7lzCA=;
        b=V0cEBeR4Mdztqdvw7xwIUAqTTdl03uuLgT47oP5cPU603uwzUWtgHGCNOF8EicUZ/w
         8KhomkFr6QKEZBt7KJsp0lTJcFTuOCsPsGh3XM0IsNejKdHKjNwxdBvZJXN35a3i1vQP
         /UsBRZET//YwgEymV0kZRA86FCP6ToQ+xvCgSNzALXHTLCBb6Y7wMQe8cT8cEmrhjNZq
         ZEX8fhta5WO7mfY6wOpLYvSyrXzftPl40FzPb4/eD5BjVY4QAAmmhz+tgIm7tNb/miG7
         e/wLekmxWItRoKPTeG6midutFdQj6On1XSd2TrWbBoGShZOTNw0N1/TSisGzghqzbcPn
         OWHQ==
X-Gm-Message-State: AAQBX9eib1eI84t/xosDkTJzeHSmKveUgD3AhitWogz5UCPw55jP5b2k
	WWHyOW3Z0s9dlcuvE2VgmOJ6SJOzSGSJF6URCfo=
X-Google-Smtp-Source: AKy350apgoEPMUQxWR00klwXYYscnIAK0OZLPQx0ko6VrOlHD0pJFBErJN002gXBJZ2Hpee+HGT0ekYIUQKFrIQIx4Q=
X-Received: by 2002:a25:2f84:0:b0:b6e:d788:eba0 with SMTP id
 v126-20020a252f84000000b00b6ed788eba0mr17842248ybv.11.1680269986074; Fri, 31
 Mar 2023 06:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230318041555.4192172-1-davidgow@google.com>
In-Reply-To: <20230318041555.4192172-1-davidgow@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 31 Mar 2023 15:39:35 +0200
Message-ID: <CANiq72==YbpCJPLOkCBGRkTYCOokLrEUNASn_JUpY2Ndw1sHfw@mail.gmail.com>
Subject: Re: [PATCH] arch:um: Only disable SSE on clang to work around old GCC bugs
To: David Gow <davidgow@google.com>
Cc: Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Roberto Sassu <roberto.sassu@huaweicloud.com>, SeongJae Park <sj@kernel.org>, 
	linux-um@lists.infradead.org, x86@kernel.org, llvm@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 5:16=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> Nevertheless, only disable SSE on clang setups, as that's a simple way
> of working around everyone's bugs.

Sounds good to me. If GCC >=3D 11 has fixed it, should we instead test
for GCC < 11, i.e. it could help catching future new regressions like
the linked GCC bug, if I understand correctly, right? Of course, that
could be done for the next cycle, since this one minimizes the
original change w.r.t. v6.2.

By the way, missing space on the title (`arch:um`).

Cheers,
Miguel
