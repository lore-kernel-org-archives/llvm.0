Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015193FC7
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 20:16:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id a8so946082ejc.8
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 12:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=A3b8xpUhSLA5M+IUc3Agl+5CEs6ipYNvsnYaDA/rCGQ=;
        b=fddLQHWQ9FWkZ1IMQ1ZUpxLMcE7AdfrOem/bhqB9SWPr7z61z/l0rnUUpSDqkhVYMS
         m3naNjBHWGRtJBs++9DtG6o68enjNAjmxMyV5SK6Aqa6EycnEfR6iyzj4EGeUTsN3cH9
         Uznjb33bfprUf9XRE5aON6kudelbj34Ct1Whfe5+HLKe8Ci9gYEIpdYHw0QupPDKXQLW
         BDcElgkakgyh6Zkx1GDdbums3gTceeJjtQIt7IZ287FJyyQviVf55eGEmVWcbqILEuTx
         zF3g45AE5qJaOh2Odi+xtMLtWmcMJeMMvnC5mBvfaNyeGRynKNoiZCdbc6WcaR3TSxDK
         De2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=A3b8xpUhSLA5M+IUc3Agl+5CEs6ipYNvsnYaDA/rCGQ=;
        b=7xAtyzQQ5GxT5q8yM7u13rIex04l3tBnFZf+nQKhoMsjl7Neg41vaEEVJ1yxD+h0hd
         R5/PyC+tXxc+yxqc+1NBlDKiXRNryTTpLLfrnqkMVt7JC0sv3R/vS6P325uFSz5UO4WQ
         nUh42TkVG72n6jjknBw9BbDsockohd3Nx+FQzoXv6ab74c5//Z4uJQp06BD87N9mU1I6
         kB9ouwoGn7dDNAJdfrXvOzjkaWH534mFIt3yA4YdWz3nv2oDcsaWPfGq996XZwMFC40d
         JyPgyDedruWVjF8lZa5d5IIfGP5PRt5iHt/L/oo7evV6vGF7Ulo1my98Q2F5NAi7Q5KL
         QTNA==
X-Gm-Message-State: AOAM531o4X2VD2bXRCWS8M9zSqIViGCHr49XsTjiYPDTjgV+D/pr4uWn
	rWogqgkTN+pxwocR2KPXhfEsCT1nGiYzd2bTu4vt
X-Google-Smtp-Source: ABdhPJz4+ZIfL4JZ7er4GLbfEAAChz0dMPqm7fOs5fzCEK006fkfioZAiwokuBYiTq6k3bdCehyi0TnvF3RM3BMp09E=
X-Received: by 2002:a17:907:7faa:: with SMTP id qk42mr298070ejc.29.1643228207156;
 Wed, 26 Jan 2022 12:16:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-3-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-3-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Jan 2022 15:16:36 -0500
Message-ID: <CAHC9VhRb3bcFVG3ZGgnqDXx0RizSVh6Vxjh88ytkhO-gu+o14w@mail.gmail.com>
Subject: Re: [PATCH 4/9] selinux: enclose macro arguments in parenthesis
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Xiong Zhenwu <xiong.zhenwu@zte.com.cn>, 
	Tyler Hicks <tyhicks@linux.microsoft.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Xiu Jianfeng <xiujianfeng@huawei.com>, Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:14 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> Enclose the macro arguments in parenthesis to avoid potential evaluation
> order issues.
>
> Note the xperm and ebitmap macros are still not side-effect safe due to
> double evaluation.
>
> Reported by clang-tidy [bugprone-macro-parentheses]
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/include/security.h | 4 ++--
>  security/selinux/ss/ebitmap.h       | 6 +++---
>  security/selinux/ss/sidtab.c        | 4 ++--
>  3 files changed, 7 insertions(+), 7 deletions(-)

Merged, thanks.

--=20
paul-moore.com
