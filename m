Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839E2379ED7
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 06:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772432017; cv=pass; b=SZ5sr+6Un7FYGqNEoZMhZICQbKrME0tg/3bkb/1PxcDTh1Q2HCX7auHjlfJC4k3XNElhvVOusxb3TsTC959Y2yTqLsHSh0t820LZcjHMOe6oUVBwzzIUXPxsoHi0shCuxAgcX83z7Qt1Jq/ROCkHa8OpT39mAWr2NSUTlDnghUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772432017; c=relaxed/simple;
	bh=+Q6GGX8zNMM8BQ0PS2o57GNeCicr0Q6irsXem04CyRU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=avh8u5q+JAXfnazC8y98snbNWKXgNAHi/ERiPOi14TA4LC6Uof7SfQryzQBq4truTIXqKVSG48rSVhdp8p2KM/1DCA/7II1kCBD8xW6pA/TO0hIXBW1Nyv37H4dJ6mEOTDenpO2nYlHFKbEbt76D92RJ85aG15+vsQPJjKf7N4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nsI6CC29; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nsI6CC29"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-386fb2c31e2so68611611fa.1
        for <llvm@lists.linux.dev>; Sun, 01 Mar 2026 22:13:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772432010; cv=none;
        d=google.com; s=arc-20240605;
        b=eNqtbf54a3YNoLS6JO9p1J5uiRZXZgBRYfjy4ctNAeLUGhnUjkyj4XIftl+FJdx8ew
         FJu8zqTaqq4VTEQFhUW0svK+vBKw2dVQZktQOoFPcIkFa2pBza/YcNQCfXPtT81svD6z
         2FfMk9D9/gHhSrBVyyI+a9fIyIKFP+VfWfXydYpusUj4qggPuFYwWOlbixfuPNcRPq+y
         vozacZKy4ksDelvFQu9sS4hWc12KrO8JeW5yMlu+sAzrkG9WJfjf9MWdVCwPRren5F3w
         LAHHkWXOPx5v9ruL7mZdtFzWsDdIcbZ8kBal/9kbvJfY5lot9sEcQ9Wl37MZ1UAq90o/
         oRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ux5RqO/ZTufyk9Xe7c4ok2Mzm+WSW1boQMNoNgz5Yho=;
        fh=h4UoZnDlzOoGYCikAApw5u+2wB/baV4ckKuSHyBg1HQ=;
        b=W5eKaXKyCMANVVm5UMpSde764ai9BJJ8tHxE3G+cagLkwJ4Yqc8qf40prZoSgkPmG+
         pKqoQweU31YqKCKn3e/6/y5/phv3OuAIBkhkqGVELd/6lsCKAqrcGjzNfFcyplWTBeNC
         6O3eeyiXBFhiz3+PxUbSxTtR8aYNF6kT9Ko0KdCz0o0YHQYcxv6tU+o3e9y7hWcfVHCO
         9IWrVjVA6CLASwfNpFoRJXs4kID/hOD6a5eFjt2NByA3cFYNJZvkZWPc+UVnNe7W1XP8
         PkoHalRjVlJipCUhJo6S/NQ45ITdwKbS1QAjw2FL3/hOH80IE133muC5kLbxyPvSK2Na
         He/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772432010; x=1773036810; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ux5RqO/ZTufyk9Xe7c4ok2Mzm+WSW1boQMNoNgz5Yho=;
        b=nsI6CC29mVhvzrqUL9Q1RXtuWPyp+XCjtBWa4+TEXCQkuOt+nQxXqHE2QmnHxk90FQ
         LX+uDHaq+g4n6fm269DQFO1N15EmtGDXKkBvyck/jkJVqkQ9vyALeIS0TVcIO7d2ukVy
         /4gCjEsF+gehK155eeb2vsscblFcv4ZbUmNV38XbmHEuy5N3OKn3pQratJb8TvK3u8cP
         /2KU8LLAA1dGuzJPBF+1AV65r9ytwi0z0y9WFNJHS9ybHuz5q4ZeqNbCPYu5DqnOKErO
         dwFVrzBI4KjyLe971L/Tzr5g4JvIKn/JfQoWk2eZ3dbg5XR7arbEGgAe60lxa4F2MuR7
         rDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772432010; x=1773036810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ux5RqO/ZTufyk9Xe7c4ok2Mzm+WSW1boQMNoNgz5Yho=;
        b=WbNRaqBFqXOMe0KnFU17nZKWguEVaHZi25ojFxvu0EQs6L4AZ/B6hy4GFQW0lgPJrt
         bzmJbaUip8aTupnWen34f+b9C1ACMmxYGMYxrMmwb6Ezs8SDX3rot3S5J7/nMkiL4iAy
         yTwysh6j977ObzkgOxetcp14Br3W+6Jc22le/vxEIagjloiwXZSecxt3vkODtRCEedsY
         tsInN+67Mjv6dyv2I5yHboi9e/SCLTutAeGX1gN/QxY4VEVmy+YdhsdITB3NEFYOwWTQ
         9poHo8kAgPpYLv8zh3HnXcOZy1QUYnhj9Qyg2GyLpY8K6fORfX7spLYIueJ9bygq8ov1
         xgzA==
X-Forwarded-Encrypted: i=1; AJvYcCXLhsvyKddYHfO8IkJIKHzKCVi5CwOhPLPAftb/W6LfZYNS2tJchkACOhzRB/1nS1hUNq6O@lists.linux.dev
X-Gm-Message-State: AOJu0YwGddY/vZouaoufo8TnU8XdkJGrj06ti6hi8WUDhu1wPHn6ucuZ
	6M4TFK29TzDdguFJ2mix9QrOwPQitel38GqfbIxjF1udA/V5EIIqCtPsxHB/Ik6aoBpeNlhxdiw
	4zmQHLINvDROGJHczy4WaigjUa1F0LZU=
X-Gm-Gg: ATEYQzwM9AyPupF7rK0MKeVFtWm7Go7mXhlk8quUwqCX/KwrxSIEMIZLF8r5ZA4C5PY
	YYvAcWgFnf5/n1LPn7GgvYEFK4bCSBBJv1FQ9yz0gwo8GEbuFxNH4k67xyq6FQv2879lc9kBXt8
	HPccZ65dIiy5RVO4uhF3DlQqKIlUDWwDfzPH16W11L94U5vAXcow4k/ICeL+/C3MHTsdyTgJbiH
	P7wZDlXT40X/x7wy81rMi8ynh+tBIYiy7SX33EFoYlhbBk2+KhiuR9qjeVT2ipIdNrk4ZB2GUMe
	v+B1bIiH/PQIe9FHvi6vOICym2IFv0gotHmDA9CfCPMboQHXHk4RFuZl73iVBUwVoPpOeGC0C5f
	McrmNZBVGXPsKkV0YB68qO628150=
X-Received: by 2002:a05:651c:19a0:b0:37f:a216:e473 with SMTP id
 38308e7fff4ca-389ff08accdmr74673101fa.0.1772432010206; Sun, 01 Mar 2026
 22:13:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260226111721.25454-1-yuuchihsu@gmail.com> <20260226171401.7461b9da@kernel.org>
 <CAPAzCqE3k9PehK9gec7pcfq-Tnjsx-reD63GUaO+MEnP8LZ0Vg@mail.gmail.com>
In-Reply-To: <CAPAzCqE3k9PehK9gec7pcfq-Tnjsx-reD63GUaO+MEnP8LZ0Vg@mail.gmail.com>
From: Sam Su <yuuchihsu@gmail.com>
Date: Mon, 2 Mar 2026 14:13:18 +0800
X-Gm-Features: AaiRm50l6QwVrBMPu3EbKOf4uYs_vW7YhtWWMq4Ps4rEAgTsv1FkTCq0fhJK2-0
Message-ID: <CAPAzCqEmfhZNk4Ysjo80QXX6ijyek7Vz9mexQ91tO0pwA67tvg@mail.gmail.com>
Subject: Re: [PATCH] net: ipv6: fix ARM64 alignment fault in fib_multipath_hash_from_keys()
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

I just sent out the v2 patch, which includes this missing READ_ONCE()
fix for the read side as you suggested.

I also wanted to share a quick update on the WRITE_ONCE() behavior we
discussed. I tested the sysctl write on my ARM64 device and dumped the
assembly. Surprisingly, the original code didn't crash.

Looking at the objdump, because the ARM64 kernel workaround for Clang
LTO (commit e35123d83ee3) only strengthens the read side to use `ldar`
(Load-Acquire), the WRITE_ONCE() here falls back to regular store
instructions. Clang actually splits the 8-byte struct write into two
separate 32-bit `str Wn` instructions:

    b905ae68      str     w8, [x19, #0x5ac]  // user_seed
    b905b268      str     w8, [x19, #0x5b0]  // mp_seed

This completely confirms your concern: the current WRITE_ONCE(struct)
quietly destroys atomicity and exposes a tear-write vulnerability
without crashing the hardware.

Splitting it explicitly into two 32-bit WRITE_ONCE() calls in the v2
patch was definitely the right move. I have tested all these changes
on my ARM64 board, and everything works perfectly.

Thanks again for the review and guidance!

Best regards,
Yung Chih.

Sam Su <yuuchihsu@gmail.com> =E6=96=BC 2026=E5=B9=B42=E6=9C=8827=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:12=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Jakub Kicinski <kuba@kernel.org> =E6=96=BC 2026=E5=B9=B42=E6=9C=8827=E6=
=97=A5=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=889:14=E5=AF=AB=E9=81=93=EF=BC=9A
> >
> > On Thu, 26 Feb 2026 19:17:21 +0800 Yung Chih Su wrote:
> > > Fixes: [4ee2a8cace3fb9a34aea6a56426f89d26dd514f3] ("net: ipv4: Add a =
sysctl to set multipath hash seed")
> >
> > Please use the traditional abbreviated format of the Fixes tag
>
> Hi Jakub,
>
> Got it, my apologies for the formatting mistake.
> I will format it strictly as 12-char abbreviated without brackets in
> the upcoming v2 patch:
> Fixes: 4ee2a8cace3f ("net: ipv4: Add a sysctl to set multipath hash seed"=
)
>
> I am currently preparing the v2 patch which will also include Eric
> Dumazet's suggestion regarding the WRITE_ONCE() and READ_ONCE() on the
> sysctl read/write side.
>  I will send out the v2 after my local testing is done.
>
> Thanks for the review!
>
> Best regards,
> Yung Chih
