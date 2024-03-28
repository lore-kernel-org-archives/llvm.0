Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81B543ABE
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711639307; cv=none; b=bqhc7/JkAdXPtKXgEbjleN5a4PV72brQxlYYCa9CRGjhU3dW4IIsZkJV2Ejqp9j6Y3njLJfX5AFnE4ykbxcapMZXpxo/74QqACH4KkzclAxleM64r3fmcrcweyNLg4ShUwQnIM2on0pwOGUWauHebfwfy7AcZxxfnj4m3y/0Ffo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711639307; c=relaxed/simple;
	bh=ondHyxfZ8OX6rwV1SB59go4V4JhpfH4Z1BXh1xU7Kls=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qdvJIPluOAGsSiTAKSlVtyCiYgrKHZVTP036bHsXwlf7x7vLUIrjMHF9rthcE8OVg6LyXTfQV+hLZRrO0t8OHJjTMj7AcVxa0pTpND+6bbA2nkIGqteBBQYUSZrKdZGRr1q5flFV3YUtuQ0vT7UntuDRi/E80EdokpMx8kU93Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ROWorwuJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ROWorwuJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711639304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ondHyxfZ8OX6rwV1SB59go4V4JhpfH4Z1BXh1xU7Kls=;
	b=ROWorwuJGRkXVOZS0/RVkPmaAV7aM5T5toa42r/LT3cAK0WpoDmFWRGAKV8w5+OCzdMRam
	ueNjDREBit9gkTcEJv8Aax6yuSrSDEE4UCmWjcU4rvn25NXMZelK/9uj+reRj7NWoBtW1o
	jDnkCWNscD91F0QPxd7mQhKFB8+bimo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-695-mCSWE_XNMR2gttLDcSZHFQ-1; Thu, 28 Mar 2024 11:21:40 -0400
X-MC-Unique: mCSWE_XNMR2gttLDcSZHFQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-33ec826d427so245918f8f.0
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 08:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711639300; x=1712244100;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ondHyxfZ8OX6rwV1SB59go4V4JhpfH4Z1BXh1xU7Kls=;
        b=mEULlKbq4izO4bfLFfaPdo5yhKjewzri/51qmNiW1/wuwAIy/vr9ueBzFXMlOQuPF4
         /d7B0rhUzSQmB16zA0C+K+E842U0jJiPqrqqLQoqT9KkXk5JGS+q8Sy2ij6qCUsbdx2q
         7gMv4TRCJnd4TOtfvoC47zqXTBOYQ4cm1JY1mPTJRckbAj9QMYVpjd2BFoWPJnjvVjBL
         5ymZeOmk6UvBxrD47aH9a0dNOk0asP3Aq+DJiZIfpsE4pNbf3ibr+sT+rlDEpukEOkI/
         zZDWsdXatDGW3VVKVWQGwz/cHxGrSGMIW9EwAqG71e555/ST6uTTX3d65CVbdE+olCMU
         VeBw==
X-Forwarded-Encrypted: i=1; AJvYcCUTseyc92trC7rRx11lYKW6Ip7jMxJ+G8URBh7/3w4zcaPpOh6D1LkhLbvHO1V4VnXGHgk1k1Uco8qjY0rFXcN65d+sHA==
X-Gm-Message-State: AOJu0YzYkgZwAPFWLEKwyqjOjbvPVTzGdBdsA/12VY4Sv2Ylmotwxwjv
	tKwQK/EnHmyEfchRup35K55F5VEgzeYSs75b713KQzgR5l+RfPmkfXoKDR50hMBSaV0f5uBMzQb
	rdbH4cHiUGpTtbwBtOPjkiFXNyFQ/Ccs/0dqiOOWuXwLkDWmIDuo=
X-Received: by 2002:a5d:4d12:0:b0:341:8f18:db39 with SMTP id z18-20020a5d4d12000000b003418f18db39mr2162773wrt.1.1711639299852;
        Thu, 28 Mar 2024 08:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4wODag+R6YZegPQpjBBcHxwLoBqvrwbnJ8kbwMlZZahD5JYP2dGk26tLHT2tkN0npnp32mg==
X-Received: by 2002:a5d:4d12:0:b0:341:8f18:db39 with SMTP id z18-20020a5d4d12000000b003418f18db39mr2162753wrt.1.1711639299507;
        Thu, 28 Mar 2024 08:21:39 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb ([2001:9e8:32de:9a00:227b:d2ff:fe26:2a7a])
        by smtp.gmail.com with ESMTPSA id m3-20020adffa03000000b003432dcdb5d3sm1987109wrr.35.2024.03.28.08.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 08:21:39 -0700 (PDT)
Message-ID: <25b5f2297c98500ed91971a61ccc4bfa5921035e.camel@redhat.com>
Subject: Re: [PATCH 6/9] nilfs2: fix out-of-range warning
From: Philipp Stanner <pstanner@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org, Ryusuke
	Konishi <konishi.ryusuke@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers
 <ndesaulniers@google.com>,  Bill Wendling <morbo@google.com>, Justin Stitt
 <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christian Brauner <brauner@kernel.org>, Jeff Layton <jlayton@kernel.org>,
 Thorsten Blum <thorsten.blum@toblux.com>,  linux-nilfs@vger.kernel.org,
 llvm@lists.linux.dev, pstanner@redhat.com
Date: Thu, 28 Mar 2024 16:21:38 +0100
In-Reply-To: <20240328143051.1069575-7-arnd@kernel.org>
References: <20240328143051.1069575-1-arnd@kernel.org>
	 <20240328143051.1069575-7-arnd@kernel.org>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-03-28 at 15:30 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> clang-14 points out that v_size is always smaller than a 64KB
> page size if that is configured by the CPU architecture:
>=20
> fs/nilfs2/ioctl.c:63:19: error: result of comparison of constant
> 65536 with expression of type '__u16' (aka 'unsigned short') is
> always false [-Werror,-Wtautological-constant-out-of-range-compare]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (argv->v_size > PAGE_SIZE)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ~~~~~~=
~~~~~~ ^ ~~~~~~~~~
>=20
> This is ok, so just shut up that warning with a cast.

nit:
It's not a warning, but actually a compile error, right?

(no idea why they make that an error btw. Warning would be perfectly
fine)

>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Should / could that be backported to stable kernels in case people
start building those with clang-14?

Regards,
P.

> ---
> =C2=A0fs/nilfs2/ioctl.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
> index f1a01c191cf5..8be471ce4f19 100644
> --- a/fs/nilfs2/ioctl.c
> +++ b/fs/nilfs2/ioctl.c
> @@ -60,7 +60,7 @@ static int nilfs_ioctl_wrap_copy(struct the_nilfs
> *nilfs,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (argv->v_nmembs =3D=3D=
 0)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return 0;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (argv->v_size > PAGE_SIZE)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if ((size_t)argv->v_size > PAG=
E_SIZE)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return -EINVAL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/*

