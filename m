Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792599133;
	b=yaFkqdtqCwFeqb6WcHP4NemUFgwMFhPetS8WCzh/CyBL7fIAndCfHY4yk0tupvm8dj06
	 9u7TrC4SxjAyqCDLBWYrhJXZHGe77dFEFKI2Ha/CPZT9fATIijvTH0sSieY5QuXjpGroN
	 UYCNn4VTYFVqItQETAv1Azi1276ZGqDI1JPCQh6APotAlTxz6Cf7njIqJAENm2uRGK5ml
	 Bkaq8iG/s+PdQKt3LWV5En7lXkuTNW7z6sIex0YwUkZb3Av9rhn+L/V5RJ0mcBRkLSmDm
	 hR2ChWHtaqUiOg7MRELaqrqMdGZivIoRXvG7Mpw17jnD/G5GLMkjMLhp0kMRy44qYjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792599133;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Nv4dga8Beqk0UYUE4xptK3XxJoHuljS/2JzvfnhjtMU=;
	b=Sex5FqipPpIASGKPf74UKP57f5TWUl+GRQkUA4XtbC8k1MvMcJ4b5gWpcuWNyUezmV83
	 AN7Sbl96EUeXsz0XWNplnKGu2a0YMwNQMRH3zhkWBStRTobV4aXs3zDydtoD4KsZflZTf
	 fXk9QPyr+uL6r6SMV4PVapXrxgHzYNIB5YCGdxEjHfThxwK1z/g8PjJHhSF8ykgtCehDz
	 WRa6LFPPQ2xR84C6QjHKG6qejWmcjWI5c6b3+jRN6ArPoEKAocJce1gk0MPuOvLSo9rlp
	 rU/7kNbBqk/ZJQOEeXE9tOJU5MSKA6OZjS+Ga+lc8KJ/dSStnHiz5jKitCg6s0QJJ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et7iQEWD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7225606A319
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 16:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Et7iQEWD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A5AD1F000C2
	for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 16:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792599132;
	bh=Nv4dga8Beqk0UYUE4xptK3XxJoHuljS/2JzvfnhjtMU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Et7iQEWDGAKMCS2o9c+29zSscUpl4CwbBKX8IxuAImdtHVYke6AKTJ4Jmc8+DZd4r
	 b5l8l7eJ44H4jVM9hI5Oz26AfSTFROnUPh2PIGm5CaxcPeFsUbExbJGdlkIq3lNO6N
	 k9NpiDRyq0YoGA1nwoUk4u4rRqN9E3Sea5xaTrM4UnAUX+kMx8oBz939fEbwdUxNC2
	 bM8vAN8Rz5rEIqWgmnAIXI20slEs56wv09DKHMVMrZx+4gRZltyOqFa1jo9cSyGc7A
	 /WU7qrG+JtyIbSG94Q2A7voiuFDI579PpwXaxYF5/jiEvuzD7+xKvHNFP0XDflg8wk
	 +b5MbKEcqgBkg==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-48eee44b908so520753fac.1
        for <llvm@lists.linux.dev>; Wed, 21 Oct 2026 09:12:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx0Dfhe2kxcf88aHD3RbSwtDkx2j2Fs3FhbgxVOaZp1rUuSgcRie8m2XpXpd7f+Uclul4C7@lists.linux.dev
X-Gm-Message-State: AFq9FYL0RmlD0EUx3Eu4bQE5ykNa3rnMzMhPvHqQLWWAI3z45vWl4BmY
	LaGAWAO7Dxz1lmRuZtC6J08t0QY7YtQVKteMNf4o1/kL0uta/aJs6/eTzUDWzDDiVWCU/DeryJ4
	nVe0ZgLJ9NoJIGXCol2En/mdiWS2GjGs=
X-Received: by 2002:a05:6871:4e86:b0:49e:472c:6b12 with SMTP id
 586e51a60fabf-4a7dc2bb889mr1367699fac.52.1792599131843; Wed, 21 Oct 2026
 09:12:11 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261021152658.2618709-1-gthelen@google.com>
In-Reply-To: <20261021152658.2618709-1-gthelen@google.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Wed, 21 Oct 2026 18:12:00 +0200
X-Gmail-Original-Message-ID: <CAL4Wiirq6kO+U+zMaKppTTx=4TBT0R4=TPT2qfFuN8U+N0Cz8A@mail.gmail.com>
X-Gm-Features: AclHuK_w2i57ia4yV8d-q-ZdbSEDqvhVGU3hAiIbV2vwLx8691QNitdURm0Db6k
Message-ID: <CAL4Wiirq6kO+U+zMaKppTTx=4TBT0R4=TPT2qfFuN8U+N0Cz8A@mail.gmail.com>
Subject: Re: [PATCH net] selftests/net: tcp_mmap: remove unused -k option and keepflag
To: Greg Thelen <gthelen@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Soheil Hassas Yeganeh <soheil@google.com>, netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 21 oct. 2026 =C3=A0 17:27, Greg Thelen <gthelen@google.com> a =C3=
=A9crit :
>
> Commit aacb0c2e524c ("selftests: net: tcp_mmap must use
> TCP_ZEROCOPY_RECEIVE") removed the only read of keepflag in child_thread(=
),
> leaving the file-scope keepflag variable set by the -k option in main() b=
ut
> never read. This triggers a Clang 23 warning:
>
>   tcp_mmap.c:91:12: error: variable 'keepflag' set but not used
>   [-Werror,-Wunused-but-set-global]
>
> Remove the unused keepflag variable and the dead -k getopt option.
>
> Fixes: aacb0c2e524c ("selftests: net: tcp_mmap must use TCP_ZEROCOPY_RECE=
IVE")
> Signed-off-by: Greg Thelen <gthelen@google.com>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>

Thanks!
