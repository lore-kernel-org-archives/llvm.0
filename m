Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9244C1DE3AC
	for <llvm@lists.linux.dev>; Thu, 17 Oct 2024 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729175967; cv=none; b=Z0AC8ySR4rbOoSy6pcv5Bx65150DXl49qQu0JfzVPVyCVPGAFPt//zKOJmqPTmTOzWwK4mshNdmsWrjYIn27J+Vuc6KJr2DkCslFt+awxiPyhdgeKt8AUgFKmQar6G/HpN1lsbysYA+qrPpyrBSUE7BoaaDtILRBeSip/7DEcRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729175967; c=relaxed/simple;
	bh=9oit/thLyld+bUeO2UJnVhAa57xvMBNyYEsD/Io8Cjs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LogP8aVmO136Gn4lpyneVEQiUKR7w0v04kUpIBKF1urGSOsTK5mmt1pbYxrImBEX1P/ezgqeppTfQgb0Z9vzkrvlPexhCGubra+nm/O/hkUOegj2vvlvXzSxHkOmv56N3sqfikqoEY9DTE3dEQhTYiBRfn/7QyEabuoCG4U1oyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cBT9/28d; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cBT9/28d"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so12732571fa.3
        for <llvm@lists.linux.dev>; Thu, 17 Oct 2024 07:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729175961; x=1729780761; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ao1EDwk8G2Gh/KlletTTz27frRb4cGhvN/Lwv/y4ZgY=;
        b=cBT9/28dHFUYKThOzQQJc9gLM92ICL9o0i6+Ia+PtH3TCiJd1KapX9ed9Kn86G53cl
         2BIpPn+e6NHLhVq/N7f+fd/hxpsOGBI/qHWNy4RuFzQrh8ImoecZZHCPHSIDgzMYQH7X
         4fBKtXMGsZAhTAJkoFk7DCeC7A8hBqpDTs2545S+eL+hWvd+hWyuyJfHwyTVy7qOvXuC
         qsnl6rKSZJ+gg/HErrM4dfq0R5Yy9k6A2MxFqzmmKkVafJxFok4xuzOhPzPV0LeEI7p/
         MQPJ2fS/vib1EFldWtSnQ9skFqe4BHN08dn0BPInX2ydtRNeqYS2l3Z2DzZodBcG/9SA
         7RYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729175961; x=1729780761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ao1EDwk8G2Gh/KlletTTz27frRb4cGhvN/Lwv/y4ZgY=;
        b=KziFhlr6MAGTv3eHBtWGM9a4z7JR/EIgI0sBywsdhJdl8Hx4ARUr0KubDgCwywrZ9I
         XOZNRHrmId3u20CN1/hV2m2BboNrPYox/SUbkX1FGn3l2+w5vKspuOponKlU0pO5gEw0
         SsFiCnNK4Dtks+yzo+bYGQ7XuiH+9YGnCknXm9QYrFeAUpyAnPyAlm2eynNemytmeVpI
         8AyDGEnuCjgoMJVN5hEe9avasDCB3hhoT2zuU4RWgRgjqZMrab5TXSz9taEd0xoOiuoG
         wWnKebgMaa/V8GqEguI7OTMdozlyz0ixco4tKARoA16KQHzAJUA33UXjxE3TiT9Dyc7O
         HIGw==
X-Forwarded-Encrypted: i=1; AJvYcCVqLEsp28Jtuir3qo4FtdZDmIURxZrfJwuSttzyYNjw/az3fu9JY2TM66f7RNDpoCLrC2vC@lists.linux.dev
X-Gm-Message-State: AOJu0YyjjBvJwcEB/GmoI4irVJDnU43Swis7mY0rP0fW1SgKZt1K+vFC
	BiBEq9Qk/mcpUx3jfqhll85KI7Ndz4pbSbcefDjfE+IBkIfd5BtrrLJ7XKNZdBVYoH93pt8EEjg
	cUS+7VgNcHuWkqmjXm2Kd12brsLU=
X-Google-Smtp-Source: AGHT+IGzqtZS7+rlQOpFBWT7CS7K9qxJDD0BXRTjzIHXK5LIuMKlmWTZ0Fik7DL47ZG3BwfcaVKmt4GsyfqdkOdxzoI=
X-Received: by 2002:a2e:a986:0:b0:2fa:dadf:aad5 with SMTP id
 38308e7fff4ca-2fb61ba2de2mr56101521fa.28.1729175960369; Thu, 17 Oct 2024
 07:39:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241009121424.1472485-1-andrew.shadura@collabora.co.uk> <1e450049-d173-4a6f-b857-71b7c6f50e6f@collabora.co.uk>
In-Reply-To: <1e450049-d173-4a6f-b857-71b7c6f50e6f@collabora.co.uk>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 17 Oct 2024 10:39:08 -0400
Message-ID: <CABBYNZLfwE=L-h4c+eqJqdhZt+LvDTnDCADrtEsLbVLwP-uaNA@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Fix type of len in rfcomm_sock_getsockopt{,_old}()
To: Andrej Shadura <andrew.shadura@collabora.co.uk>
Cc: linux-bluetooth@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Aleksei Vetrov <vvvvvv@google.com>, llvm@lists.linux.dev, 
	kernel@collabora.com, George Burgess <gbiv@chromium.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrej,

On Thu, Oct 17, 2024 at 9:47=E2=80=AFAM Andrej Shadura
<andrew.shadura@collabora.co.uk> wrote:
>
> On 09/10/2024 14:14, Andrej Shadura wrote:
> > Commit 9bf4e919ccad worked around an issue introduced after an
> > innocuous optimisation change in LLVM main:
> >
> >> len is defined as an 'int' because it is assigned from
> >> '__user int *optlen'. However, it is clamped against the result of
> >> sizeof(), which has a type of 'size_t' ('unsigned long' for 64-bit
> >> platforms). This is done with min_t() because min() requires
> >> compatible types, which results in both len and the result of
> >> sizeof() being casted to 'unsigned int', meaning len changes signs
> >> and the result of sizeof() is truncated. From there, len is passed
> >> to copy_to_user(), which has a third parameter type of 'unsigned
> >> long', so it is widened and changes signs again. This excessive
> >> casting in combination with the KCSAN instrumentation causes LLVM to
> >> fail to eliminate the __bad_copy_from() call, failing the build.
> >
> > The same issue occurs in rfcomm in functions rfcomm_sock_getsockopt
> > and rfcomm_sock_getsockopt_old.
> >
> > Change the type of len to size_t in both rfcomm_sock_getsockopt and
> > rfcomm_sock_getsockopt_old and replace min_t() with min().
>
> Any more reviews please? It would be great to have this fix merged :)

I was waiting to see if David had any more feedback, but if he doesn't
I'm happy to merge this later today.

> Thanks in advance.
>
> --
> Cheers,
>    Andrej
>


--=20
Luiz Augusto von Dentz
