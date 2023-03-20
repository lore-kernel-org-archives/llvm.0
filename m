Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592FB7C
	for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 17:12:46 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id h14so6815438pgj.7
        for <llvm@lists.linux.dev>; Mon, 20 Mar 2023 10:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1679332366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmWlUrBsdui62naHPBXviasLQ1IpmNaEBqAkkNsvPFE=;
        b=Z+0w3FqZwtBPOzV4oIA4P/OUfwXMLPz6cnhzcMWzL17u9E2BfSmTfyUHj6uTZ9FDGd
         hxstHTNh96Qzw+XZwVeWINDL6kRJGjq1+vLSXS+r/zefVx3f5mBCkMeX3OLxZi7no4x3
         PYAlFzN5f14p31Tfx4BgvuaqQLLm3licxVHEAzkabDbuwlLemYjjT/04tVi2riUX9fx3
         5tqJq540I5YOr2fY0Y7lj6Y5SHWEaSekeaZ/d7ygWhIrMuE6KDQgcoGBHgFYLnO1WqUt
         ioqwkBi3ycWnOgDxT0zAiHH/J2l5g7tT7heQMF/7Nz+bt9JVUQA+oDZEQSep9PMhkyvy
         SYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679332366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmWlUrBsdui62naHPBXviasLQ1IpmNaEBqAkkNsvPFE=;
        b=RVA5Pbb2YrGVKZUnqa7YQMWdy+ja1KMwntHXVzQsAf84uJGUxiMP2wctm5qZKA6PmZ
         eNHzxsZjMZqrMF3VH/f7+HBWggtzHGj2z57BYAlvcDRwQeZ8WcuHxr16+JTJs3RtD5FB
         zC/mTpoUX0LPgnw3xYfyTF+ZbtoTOZYRhUqCNTtdTvANb1OPwLmgorLJebwc6V1dBa0J
         IKJo+AM4FBED72dXp8CzsrsdFGaENcTRsjXdvHofZXl9O272V/0WhSczYrxQGCy7YNGq
         WrFJVEd5MzaUniiDZFHL5D5vupwuQPIw4+ruFZ3Qi0CDO42cDxYco7udgkc9lfqPyv93
         XTAA==
X-Gm-Message-State: AO0yUKVX04nFPq+vhIS31rQzpLYhnyyKzVANudaFh+hWLEfMBLCno682
	bZtdRHpDLkOQV0KGHe22fKLH5xV/sfA/c5KAjDrc7A==
X-Google-Smtp-Source: AK7set/hXJGh1zHl6WqKkrL6udHog9Pk5f4E4o1E9CDAEMlvuUPjcwzbKm8xuxNmWZ9fHrsPC4GfyTJIMfXm675EaZs=
X-Received: by 2002:a63:bd4a:0:b0:503:7be3:e81d with SMTP id
 d10-20020a63bd4a000000b005037be3e81dmr2077439pgp.1.1679332365378; Mon, 20 Mar
 2023 10:12:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
In-Reply-To: <CAK_uB7iP=6Rjo6hGbDC9tq8+NE1ip=Zu-LwUDG=94sD4A-zKZA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 20 Mar 2023 10:12:26 -0700
Message-ID: <CAKwvOdm9m8UtUVF1xYoheSnk_mHzZKDa68QJP2biF+ax_1mP6w@mail.gmail.com>
Subject: Re: How to compile Linux kernel to llvm bitcodes?
To: tr4v3ler <0xtr4v3ler@gmail.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 2:53=E2=80=AFAM tr4v3ler <0xtr4v3ler@gmail.com> wro=
te:
>
> Hi=EF=BC=8CI found the following compilation targets in the makefile(http=
s://github.com/torvalds/linux/blob/master/scripts/Makefile.build#L136) of t=
he Linux kernel. However, I don't know how to make this goal effective, com=
pile the Linux kernel, and generate llvm bitcodes. Do I need to specify spe=
cific parameters for the make command? Or through environment variables?

What precisely are you looking for? A single .ll file? A single .bc
file? .ll or .bc files for every translation unit?
--=20
Thanks,
~Nick Desaulniers
