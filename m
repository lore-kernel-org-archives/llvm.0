Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EE930C344
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 11:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760443105; cv=none; b=Frd+owJy6tk4pB+PHCS44XYTAk8DCcCyia3zGlutDcum7uX4TK5j18tbdsUvB8d9kz9MxXHnmkRIyZcTO70qB7mlkEFZkVyKwl5RKBjJoPt64EXFg7IJtsih73ydKScRejVz/CtGnmIxV7oz7CtRpoYvEMvzV1c9iTLyGddYH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760443105; c=relaxed/simple;
	bh=DQcppO9zbJMHem9XFygkT9zl07JxR8H/tW98+lITK5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WMCjpUMnaKRtVySBTYOKKeOGtgz5438jkhJPAjIXAm0/EIA7yiBABEAOD6k8KarKHjxvpAx+seU2vvOHcgmEImXzG537WNMdDED5QGVASQ8FtkSYpmpCBj5FAcZ4zItNBqkN+1Kl2RmPgW+1pNQDktu/kl0aw3wqSL5i2RiejqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fi/nrYx8; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fi/nrYx8"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27eda3a38ceso11210405ad.3
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 04:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760443103; x=1761047903; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTrmlwTskkr/kKbtRF4NeJMF7KiXf++loWOpKi8ycAY=;
        b=Fi/nrYx8GaWup3st0FRXf1pYjotdc9r4MMJsSqBxX9z8vjyVvIzWWlkfDD42+HFcy+
         cnzfA8juXVkED1VnP9Y9RETisV1cCm4ujBRROYNdANzD6yB5wk0RwcSoWjjKnugvyYJn
         pJ9cVFyf8b/+D4+iPeFPKyq7i8iyGLhvPTVewxM/un4RDRV0Y7uu7K7NK8DkEW5Y6IRq
         3fcj8qFYgpuMLPXpP4q1EAfxY2V0zwTUdmv7Et8Iu0Jy7pLaINZ/Qw2Y2LzlzuERgT4Q
         vi1eNO/BjfFdqvcC47QU/OT/KbP/JBXH+YB+UA2Z/cJXd62xzlvfp88lhebe3E14kLFa
         rXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760443103; x=1761047903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTrmlwTskkr/kKbtRF4NeJMF7KiXf++loWOpKi8ycAY=;
        b=vBU7XjKsLiNeaqNJ5ebsZScB7R7w9ks6W1AjBhWm9rTomJ3KZL5wN8lXGToMfhTpxF
         JAIRuW0jSg1r97Mizexaeh7HFVgdBYY07PB1iBhibF2nRmmb5P6CGb8PlVsiTkr43Um7
         IgDfZakIdaUygJVXhY/it4bqjCtlZeBJk+xilwTE7ZLQgCezCARCEcdc5h61iKfvtAQg
         /grnHkag8FM5S//4c44/DKk9SkCs4BNIKTGraj/VRtAn4bVGK624GfxS7BuSv6gq8PO3
         DSs5C/aWe0XqP1brKafe013tv6vPDkptYkK/E0Oby6w0e9F44LL4fCnogcmXIfN3xTcf
         XYtw==
X-Forwarded-Encrypted: i=1; AJvYcCVWvTY+giYNvlBY//wCJkBTz1S6lCWWVX6fV0vQOQwuhsed4v8zQ34tgLoQVri1K3UdKj2P@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq1+FAmwnTc4Fgy0zWy29nCc9et27EzagWbM2APyOEp7TNGkg5
	9A/vdN8LK0XdFqEB73YtXhiwcTikQpdUP8PQAPgmelgCn6HJvNZMVfdekLM6xoWSP+IV1Xu15oV
	of7qOWwncGqil0WOgZjMlgMPaQ8PeJlc=
X-Gm-Gg: ASbGncscAIx7SBZ0o94FANlOuQnNhyH7RxR99P7PTXaoHNPuonL7VtGYbkoU4RnoVOE
	N8839WxCwYcB5NpWjK+d4+XZFRtDoNWfAVhgyt9q7k2Ioxsqc7CLhdwb3Gni9XhfhMaVrXnK+3b
	zK9oxZWYxKMViJKQshWIwxuc3DUFlUVmZYCT+HBZ96kKM/neNKr4Byxi+ihEJvqyT0wykOkoofu
	ZfJ/aRPgWGlGNLrlWd6VXrSKe/cS8jHRUi1Rx4Q5p0PQ+1k7mQ58kGvlhmGdEeuBai82Ln0CFty
	8I3xwbgoFVaB3TrqcSs9MqyfzocegXZv/V+iaVP7WWO2OlBhgu7oMHM=
X-Google-Smtp-Source: AGHT+IE5mD/OqZwnZKBsKCjL4XqIp9LWIF2r4C8a99CzvazlBr1ZWoDhjbQJXYRKSAmFGV4Ksc8hZ5kDX58X7OqE8yE=
X-Received: by 2002:a17:902:e849:b0:27e:e96a:4bf with SMTP id
 d9443c01a7336-290273c6246mr201519995ad.2.1760443103387; Tue, 14 Oct 2025
 04:58:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251014094511.627258-1-gtucker@gtucker.io> <20251014094511.627258-2-gtucker@gtucker.io>
In-Reply-To: <20251014094511.627258-2-gtucker@gtucker.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Oct 2025 13:58:10 +0200
X-Gm-Features: AS18NWDBj5affi_lUiES-5b_WCz6GVsApMNcuTw9-KEiFct1NPsDYKVQGOwC3Bg
Message-ID: <CANiq72nVxPY8xB9xEnkZ=zNFh0EfQvaMAPH4ygRr-yEwpK=OWg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] kbuild: add Makefile.container with CONTAINER option
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	automated-testing@lists.yoctoproject.org, Arnd Bergmann <arnd@arndb.de>, 
	workflows@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 11:45=E2=80=AFAM Guillaume Tucker <gtucker@gtucker.=
io> wrote:
>
> Add scripts/Makefile.container to wrap the make command in a container
> using the CONTAINER=3D variable to specify the image name.  For example:
>
>     make -f scripts/Makefile.container CONTAINER=3Dkorg-gcc defconfig
>
> The container image name is entirely arbitrary and the container tool
> may be Docker, Podman or any other compatible alternative specified by
> the CONTAINER_COMMAND variable.  The default is set to docker for now.

IIUC, this wraps reruns `make` inside the container, but it means
hardcoding a particular tool and path, right? (unless one sets even
more variables)

The cover letter says one can create an alias for this, but one could
also do that for the underlying call anyway, unless I am missing
something. And if we do this, then I would prefer one doesn't need to
type `-f ...`.

Put another way, for a user, what is the benefit of having this extra
way of running in a container? For instance, I could see the benefit
if different tools had different flags or it was a complicated
procedure, but I think at least `podman` shares the flags used here.

Should this instead be a document inside `Documentation/` somewhere
that explains how to do this, pitfalls, advanced options, etc. and
give example command lines for different tools?

If we do end up with `CONTAINER=3D`, then I think it should make it work
without having to pass `-f ...`, to make it easier. Or, even better,
like the KUnit script, we could have a script that does the right
thing and reads a config from the user, so that one can just type
something like, picking whatever tooling the user configured (e.g.
Docker vs. Podman, default image, etc.):

    scripts/container.py defconfig

Thanks!

Cheers,
Miguel
