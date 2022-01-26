Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E76C3FCE
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 20:59:12 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id ka4so1125237ejc.11
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 12:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9eB3sinujdfOKjw1Rq4Yv5m0jvLygDYT+UfsakVwvFY=;
        b=hWc0SIhSU692E7TeE3QERHKR5x+Uc2JnoSd39zct3wR6ZvZdOU20Q/bEetUWnZH2qv
         k8Y87WwX4DNOZDY7hoIHLsc9RzoCzuP16c0Mu+JCrku3P3474tOJQ88YTSgwbgLVQOT+
         p17Rn52sDgl4b9IJo4cMCYZa4M7HXtY7gejYzswVMJo7wrdHQ9ep16fmYu3RxZQdUzfZ
         vbB9+epHe00IVsZhW5xqE5F+iIEAgrwaQry0tFSp3SRgrGpEemNiJ0xnUbptAQCNgexX
         lKuc1tIxApWOC8mTKsWuY1RGL78bfxNndcg3XKtb+4eUvrpLhDstJvA1Ol1ZPla5q89D
         6b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9eB3sinujdfOKjw1Rq4Yv5m0jvLygDYT+UfsakVwvFY=;
        b=o+K62mc+4XjD+9ycJPLhtbS2p8flcDakK643J8AMUsko80z90Xid692WIagIx/je4P
         BqLELWRZ7mnJBML5XYzn5FlccGztfxy/6p9vAOmbGCqloRIJuJmiY+GMAYwPt3y28Cbb
         Rg6BRVS79LK592H3o8hDFLN02GdBUCEOM5f67L7zoEwLOy1ju1Go/1KoNtYRtmA6GyTd
         fQvh+BMtsQQaMyQdtxzWSqPCcsT2PLLNCCRg0k9sBHg4EovZittwPL4PfiI73O5oWmae
         nN4wFK2WAqUglzkaWym3Z8mg+upwAra7MkAJMYt8VB4H0EE9MMJObvZsNFYZwig3jiaJ
         hJgQ==
X-Gm-Message-State: AOAM533EsPzSEabsfvGumHquJ3htms4isSuKhAsVeNrA1ozYcj43Syqy
	4a4ZE61Bk2EuU0UxZGjWI5cxLMo4o/v0DLR67ikd
X-Google-Smtp-Source: ABdhPJwbGFpX8vGoi0YEZndNed80nrB6pQPwjTtQxv2+KG/+YKLLOPVzvOVF4GemKeM4hVP+ZFNtczQgBVPkJvmYazE=
X-Received: by 2002:a17:906:2ed0:: with SMTP id s16mr396367eji.327.1643230750765;
 Wed, 26 Jan 2022 12:59:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-7-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-7-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Jan 2022 15:58:59 -0500
Message-ID: <CAHC9VhTJpeb37sOkvKHO7REUJ4K3YMGK6ZY_ptLjVVAkEKdpfA@mail.gmail.com>
Subject: Re: [PATCH 8/9] selinux: simplify cred_init_security
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:15 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> The parameter of selinux_cred() is declared const, so an explicit cast
> dropping the const qualifier is not necessary. Without the cast the
> local variable cred serves no purpose.
>
> Reported by clang [-Wcast-qual]
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/hooks.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Merged, thanks.

--=20
paul-moore.com
