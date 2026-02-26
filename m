Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C57C37BE75
	for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 12:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772107367; cv=pass; b=dezF6XsJ9/EBPtAGcI8hJI1IrReTJvE35EKJnkmm/kzTVgbl0bS7TT/fPInx2e3AK+DqJ5YiKz+wGL8Os0M7vZn/IOeC6lBNpYJGems8q4MOLw3MBxJQpwsKhbg1j3Skf4ppW1g53y8LzvJ1tiqaGWS9DAafiB9WW/tFnmk/Ov0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772107367; c=relaxed/simple;
	bh=fHxx47e62Ab7AB98KxFyfkkORZp6y4ke1RxkXL5ZGIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHhNi3xWN7pnkBpHyuc7FVRbGR6PMtH9PlIjOm/HRdDyAFWfbfT6m3JHPIPyELlFxS81TJozNZEMEV4aKvWfKTcrNjq3yPsAWyRofa93b8wAf13Q0QyECShfD8QnsmEG1nZ+/cleLNwSVKDGp+IWg7K2zxr1qTSt70FtPH91KBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KxRxsmu3; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KxRxsmu3"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-506989e8516so7745151cf.0
        for <llvm@lists.linux.dev>; Thu, 26 Feb 2026 04:02:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772107365; cv=none;
        d=google.com; s=arc-20240605;
        b=iGIGpeXAKiZ4p5G/2QHEosm1qt6tSaCM78w6kt8sC7jgx8FnQZCoI8NN1PYv19TUIZ
         XJ7xko+lpmCsQP/5P0Er9c3h6W9QvRysGQkhIgD9urbdjlYCDXYpaoyh6n3U2AFltXX9
         frCqRnYn4FaeWlBfF16wRcXsZNM7GAouVqEDoFPp/+qoLK9/oLJCqohHwTHH3JnuUQoG
         ud2uyu3K8Q7yWT5uDYS5tHrZ0cELSIkwdOz+kzUY1MiNb2UzctVJB3GbZUKGG2f84eF6
         LdKRl73hVWtte/oVUT+5qdYPf5eW5LfFD3DtE/O48GbCza7H9x1pdsmuLHuel3x+slOr
         /Zsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WTO8df51m5646oak+wdzFx9B/WJc7HZU55MTR+mSHDU=;
        fh=EAmz4fcVG1JW2F781rMysfUMXbURaaS9cLUM4T9A8aQ=;
        b=A4ko7Uza98JnyTkW4PgvdsOAcuVTifBkKxoGyaF3bL825MJXP/0bBpnX6KjFc1Klkc
         8bI+/iOuVS7ZgnkDLzmByNsRCzpMz/DkWIc0qIbDuRBdL9FJ/yqsjadjOo9zNuer2j19
         g0603zY701rvW9WfiyasRZimCtb5HtcXmd7Wv56KXs55DeRku+BCYvoVI/9UIJ+gCHej
         KH+uC+SdOU1wbaRoz5Jz4RczwM1musYGKLeWPoirgw8XFczSQrk/ioUEb1Sc8SOGAIEl
         dW8eRctE6/xoADmqEjYCcoAxsRS9O03XeinCBuZFPF1wgEs4vRnmvh7PQGG1FFwdhTux
         4y8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772107365; x=1772712165; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WTO8df51m5646oak+wdzFx9B/WJc7HZU55MTR+mSHDU=;
        b=KxRxsmu3D20aIdaGDWNQ6325wucfKWGTtFGoAXqpf8NcU4YbJ/yJSFBHkQI6g7IskC
         vtpi99Gqf6q/ltxrVR/oi4unXZD9v65imZ0ksESxOCpS92zIojclzoxer3/bpfNul91T
         CZYeW+tnQQuvr85vfECDwYQB68RMBSD9VV5G4r+N53CUw+nYXdJ3NfhV0C9VA/xhtYdi
         grgcL/qmtBJHUDURerJOYhAwxH2Acm0Fk31Jpdd+gGSrB59DIMdwzsC1dm+2wEpJANup
         ea1wnqZlofqYAmY4O7UK73jz63eITphswjn+q3abNNmaU+7LOkG14rlNJZPBKro7dTm5
         pFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772107365; x=1772712165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WTO8df51m5646oak+wdzFx9B/WJc7HZU55MTR+mSHDU=;
        b=KuBctWQ2WrNlbS462n+cPDlHDRl/TMn2vZlnODrVEwGUihJQfEAXfedSbKITwlQK7c
         gxBG6Oo9zVik6KrWMQbOOqJZoQhJ/1U0XECt9+eXRDd1JuEIjwGUqVz69TvvyS09Sc3Y
         p6AY1GOUMavG+cd6I7SO7CuM7M2YSIrhLuh/aVqVD2ak9vwaS0qC8IcAXUIXe+vBqd6y
         CWXUNT6HL8Q6pFpd3PU9kPKsxAxSuCExq6m+S7TNLRe/U70wtrZup/gEfIkrUmmr4Kmr
         ZskU3bokN9o/YsKq3AB/LAi/Yq9ggD6VKMrmqgyTM0tqIEnABq2V45Dv8a0oFCA64H1s
         UV/A==
X-Forwarded-Encrypted: i=1; AJvYcCV9wDHbg5RSUiF9PdpIkwa7HIVQRitNmP7cv1uSYgdtiZV+lDB+MbdNxtshTunlzbZvl12T@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3msZbcFfZuyPYi8n8FbcY8UJxHZj8E2CTYSDK10kMSmUQEzrc
	cHscLlsEul2tj3Xo00YX9xJttF6lO8dJTTCKTUlnWngkJsKp21Ujo2sbc4ysEKJ+Q2hygaHzvTq
	9I6FyJmXoCw6R4gbRNebO1N51021wHbKmKapbEaf8
X-Gm-Gg: ATEYQzzeVsx0bga0TtrboDrzZRXR/m+5QGpZ5sCK3l8Aan94+QzEk64fzBE2hYrUZ8V
	mzvG2l3XRo1DHD+okh35KBEn1DE8tYAOIwOqHTJaZ7sXUXkSm2E8yzPBv/sWEgvkSYrmlDCBeor
	f5KrI5cTTNkGRy6QeJXVtX0/sfYbKiSsL6uYgjYY3D25wNsZSBKNG0FdVX8dZFMdsGFFUxuzDRm
	K4GH5byoK4cFAi276YjEhWKlumAiLevKMQs3r3qV/XmAi1mYArhq0t77b4ReDmfbfZU3RubxEl6
	85bxf5eK3XSsHFjf2HDJFf5PlsBwyViAq0eQTudllAmw9Au2qLg=
X-Received: by 2002:ac8:7c4e:0:b0:506:1c3b:c896 with SMTP id
 d75a77b69052e-50745ed2822mr19991151cf.11.1772107364456; Thu, 26 Feb 2026
 04:02:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226111721.25454-1-yuuchihsu@gmail.com>
In-Reply-To: <20260226111721.25454-1-yuuchihsu@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 26 Feb 2026 13:02:31 +0100
X-Gm-Features: AaiRm53OMr1sZRwTFEY50Od6VH3Wz_vM8hHKwZUR308MKmTdUom4P_0a0eb-MOs
Message-ID: <CANn89i+rJeZHoGna5PGWN31UGDO3jy1xx-rWs0SA23H6mU6qKw@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: fix ARM64 alignment fault in fib_multipath_hash_from_keys()
To: Yung Chih Su <yuuchihsu@gmail.com>
Cc: davem@davemloft.net, dsahern@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 12:18=E2=80=AFPM Yung Chih Su <yuuchihsu@gmail.com>=
 wrote:
>
> struct sysctl_fib_multipath_hash_seed contains two u32 fields (user_seed
> and mp_seed), making it an 8-byte structure with a 4-byte alignment requi=
rement.
>
> In fib_multipath_hash_from_keys(), the code evaluates the entire struct
> atomically via READ_ONCE():
>
> mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).mp_seed;
> While this silently works on GCC by falling back to unaligned regular loa=
ds
> (e.g., LDR/LDUR) which the ARM64 kernel tolerates, it causes a fatal kern=
el
> panic when compiled with Clang and LTO enabled.
>
> Commit e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when
> CONFIG_LTO=3Dy") strengthens READ_ONCE() to use Load-Acquire instructions
> (ldar / ldapr) to prevent compiler reordering bugs under Clang LTO.
>
> Since the macro evaluates the full 8-byte struct, Clang emits a 64-bit
> ldar instruction. ARM64 architecture strictly requires ldar to be
> naturally aligned. Executing a 64-bit ldar on a 4-byte aligned address
> (e.g., ending in 0xEC) triggers a strict Alignment Fault (FSC =3D 0x21).
>
> Fix this by moving the READ_ONCE() directly to the specific u32 member:
>
> mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp_seed);
> This instructs the compiler to emit a 32-bit load (ldar Wn or ldr Wn),
> which perfectly satisfies the 4-byte alignment requirement and resolves
> the crash.
>
> Fixes: [4ee2a8cace3fb9a34aea6a56426f89d26dd514f3] ("net: ipv4: Add a sysc=
tl to set multipath hash seed")
> Signed-off-by: Yung Chih Su <yuuchihsu@gmail.com>
> ---
>  include/net/ip_fib.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/net/ip_fib.h b/include/net/ip_fib.h
> index b4495c38e0a0..318593743b6e 100644
> --- a/include/net/ip_fib.h
> +++ b/include/net/ip_fib.h
> @@ -559,7 +559,7 @@ static inline u32 fib_multipath_hash_from_keys(const =
struct net *net,
>         siphash_aligned_key_t hash_key;
>         u32 mp_seed;
>
> -       mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed).m=
p_seed;
> +       mp_seed =3D READ_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed.mp=
_seed);
>         fib_multipath_hash_construct_key(&hash_key, mp_seed);
>
>         return flow_hash_from_keys_seed(keys, &hash_key);

What about proc_fib_multipath_hash_set_seed() ?

It has :

WRITE_ONCE(net->ipv4.sysctl_fib_multipath_hash_seed, new);

Which is IMO strange, regardless of ARM64 clang and whats not.
