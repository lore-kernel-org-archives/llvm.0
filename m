Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127F6FC10
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 15:56:43 +0000 (UTC)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-63cfd6e3835so26495866d6.3
        for <llvm@lists.linux.dev>; Mon, 07 Aug 2023 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691423803; x=1692028603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4/3HCjX2FDd6NwWI7Dfn7wM+IO0cTfOjTBaP0ZWhR0M=;
        b=I1KtwYq4X9vF8dUm+SAYay5Osh496KIl8EIso0fdsHP6AuSjHU/0bwM0PCABqlhzXP
         Y5bIJbEowf/pc1Yae2myn0Y2m4fnl2Afx/gzEsZ5KOBfIgomZuEBj4r0bN5WYsopRJ+6
         YY0qTlRtCrdJ36hp71KMjmnUHyVCoYUE7LJunJ02bO+hwe8W+xNIclOjcrFUskUNK9LR
         8syzk+aviPXbxQmmAnvyDKcn03pXe3PJ9JqZX5X9LyPnPOCD69FiPKj7ZxxJ2zITHklH
         vhKD9sT3f7KjYfnx+knNpFj0qsm0J+dFMlRC9AoEJ8RNc6cJVcRWBRwkQbDwjCIE/qkf
         LzyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691423803; x=1692028603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/3HCjX2FDd6NwWI7Dfn7wM+IO0cTfOjTBaP0ZWhR0M=;
        b=dfR94zvdbtT23nEa6Vz303ebdvxrjQkfoJ6S85f0ela8/cVNVHBFdNUiynP1Rgp8pb
         YgvfqC7zHvsPonO/6cbA0onB/YIHqJalNWUXbC+eb+AayqGo62ttDGVNfKUhZo/qZ1U6
         aGQxNlj4epyUp5b4kHbcsZCJpKuNMuQeKjJjOodcRSjQ3fQBxBo1JuWhh/MiYjGzm+SY
         lUXE8eOlDiRSguvO7Gv744IGzYmiceYxvClRJGxZkKJ8sJ20i0f8kAJ3EPcREo2jwpQc
         SRhv/GfMHdOQVTHqrn+a5Zqbzn2qPPfTS9CTZQD9ZuTuxP94oQPvA0stu2B1asx5D1g1
         oToQ==
X-Gm-Message-State: AOJu0YxgaIRdfD9/uJ2DjW0lEE6aMhbQF3uNLEgkDSnyk3BokuEDGezF
	EoVGPZQd09HS8t3emLQ6RxGIYcucvJnTqIynCzBe8A==
X-Google-Smtp-Source: AGHT+IGlTi0iRwJC5cwOfwrT4Jmzbh8fldheRHVXoIZi9LPsr5+w6AnDdx9fHDpY4Q6JYsbgGCWC9X9YJ1lew0ivQg8=
X-Received: by 2002:a0c:cb8b:0:b0:63d:3abe:162b with SMTP id
 p11-20020a0ccb8b000000b0063d3abe162bmr8702323qvk.38.1691423802650; Mon, 07
 Aug 2023 08:56:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230806083021.2243574-1-kernel@xen0n.name> <CAAhV-H4ypd-+z-KbeGM6C_mNk0aggk2yhdDik-XfPNWqsO=j=A@mail.gmail.com>
 <d591bfef-9146-abf6-04d0-96600ebb7a15@xen0n.name> <254baed00504ef3cec36e58540a3fdcca346a407.camel@xry111.site>
In-Reply-To: <254baed00504ef3cec36e58540a3fdcca346a407.camel@xry111.site>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Aug 2023 08:56:31 -0700
Message-ID: <CAKwvOdkJy12sZiqPyoZWb2-m4r5zywjo-cHkHGBu9XksU-RRxg@mail.gmail.com>
Subject: Re: [PATCH v2] LoongArch: Replace -ffreestanding with finer-grained -fno-builtin's
To: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>, Nathan Chancellor <nathan@kernel.org>, loongarch@lists.linux.dev, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <git@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 12:17=E2=80=AFAM Xi Ruoyao <xry111@xry111.site> wrot=
e:
>
> On Sun, 2023-08-06 at 18:31 +0800, WANG Xuerui wrote:
> > > > +cflags-y +=3D -fno-builtin-memcpy -fno-builtin-memmove -fno-builti=
n-memset
>
> Can we only apply them for GCC <=3D 13?  I think with GCC 14 the built-in
> implementations are quite reasonable (well, maybe it's some human ego
> because I wrote them :).

Yes, and because only GCC-13 and older users should pay that penalty.

--=20
Thanks,
~Nick Desaulniers
