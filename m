Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79AE3FCE
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 20:39:47 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id p7so774584edc.12
        for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 12:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l7DUOY04nkFG5go2AK7MEd/Kn3oqfvoF5znhY+cKRCI=;
        b=Y4YS3nqxVI3qAI9hE231qFibOam+wQhPEQMglpNTCeicUI6uahT9M4ujieJxvh40wF
         W3bX0huo14ja4NoM5IfWpfM93n7KDc7dn5OF4Uanjy7TLf0muY/bJW4hhpyoGMMEs6DN
         QDykz47b7Sg8JcYAz9BhI+pasVDsOigYaU6fvSRqnMJOzGpFVz/zaL7U2iUusLFlCkI7
         u0bYsbKPymr8JRieJceQEzo1oDDysT0y5Od5cKXSJowvZZE4U84kRq38ytPEF3CzS7+K
         UoegJq+1SFxF//FuZCAKpwS59UayCF6AzRSPQ/mBXWdJt/eOdU32GlCQpETPX3LnoS4R
         8ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l7DUOY04nkFG5go2AK7MEd/Kn3oqfvoF5znhY+cKRCI=;
        b=YWPY2vZTGsWsKGaoML8gX3jvDG8PrG7zEdUIsYE0bWnxDEKq1Fpj1PFX4zzgfhFC66
         b+Jo+EHAuJTbM2gznQxoKczjvjNJdUdyl2QAXc6hBlphbwQYl4JpYXgD0wOzOjhOUpfA
         IJ1WnHYoE9mGrDXtwfD284sZMepMaXfMMQQhRj3m02bUdfO7pwzONy+lTth4XOVED3BP
         2cEzOQa9JzwbNs/hG4Sh0Crk3xQN9SCOM0fhV7laIzGkI1RTe3t8i5WPwPSCr160sGwH
         nbJKEUv/4Y290iHl5XZJutpE/aX5tzHwD8xySD/mpu3ymsdBH527Fq/TCwAqzuvpcOox
         IF8Q==
X-Gm-Message-State: AOAM532E8z8SBkLZ/z8s+1Ospi15AlUW0zRnkccCDuLVZQlOGDyzOJvN
	ukpWoAsIwOmHyQd3u6sKTPyKndNqVTsuaTKaeEY7
X-Google-Smtp-Source: ABdhPJwyF7U+ek4Il56UU3sKDPPKNSjRF7qsyBRSDNyaokYCGGTsL7whQzihFmepsVtYfAS79Kbt7ZsVZaP4HqEqydw=
X-Received: by 2002:aa7:c40a:: with SMTP id j10mr715995edq.232.1643229585969;
 Wed, 26 Jan 2022 12:39:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220125141422.32655-1-cgzones@googlemail.com> <20220125141422.32655-5-cgzones@googlemail.com>
In-Reply-To: <20220125141422.32655-5-cgzones@googlemail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 26 Jan 2022 15:39:35 -0500
Message-ID: <CAHC9VhSxd+D+33O9EEkm2h=Gv6EfByLMJx9dyj0DjcT9GhfKhQ@mail.gmail.com>
Subject: Re: [PATCH 6/9] selinux: drop unused parameter of avtab_insert_node
To: =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>
Cc: selinux@vger.kernel.org, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Eric Paris <eparis@parisplace.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Jeff Vander Stoep <jeffv@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 9:14 AM Christian G=C3=B6ttsche
<cgzones@googlemail.com> wrote:
>
> The parameter cur is not used in avtab_insert_node().
>
> Reported by clang [-Wunused-parameter]
>
> Signed-off-by: Christian G=C3=B6ttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/avtab.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Merged, thanks.

--=20
paul-moore.com
