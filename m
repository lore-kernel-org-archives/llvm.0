Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4186F1B47C1
	for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718911923; cv=none; b=f62oKSiZOXeD1nvDStBA4UF7xCCnjDejz7ECgBdBrQ1IR0lW3CMVUaVPhGV9oNvyeQwinvX0NA0YYx+KI4ICWQOVzM8FAAQqoIotDSqtP48vlJju/hSW6O9yC+FWhRtJ7vCrQ6jJN+fx069OSbm4/4790z66DTlP9q7gnpkDYq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718911923; c=relaxed/simple;
	bh=7rH6ocXQ6md0ogCPmWYTRoZt7UcBXqJMGUr8pOD+13c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMiMyEbVxu1mHLmzenipMIvPY02qu6T2AcB5zoPTpkZ2g83RbD0gqW8BYRNese3Z+0ie9bBnHqVoYN4gZsrA5RoB2fc9Mu65GCZ+1PI0YIuL26LdzGqNFNbNQAZ7Woa9zvTnFDieUoPeSlQekg9zLSYFxKEj5okopeUnAmMyOUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hsaWiDiS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hsaWiDiS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-35f2c9e23d3so1567855f8f.0
        for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 12:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718911920; x=1719516720; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3O566UWxDabtyjph9VFA7tB9oYSkksm7L3FfctdN99o=;
        b=hsaWiDiSofEs0GmpspxZOIpNbjlHY66mrPFxIr1LGLtgGjsFz1Jbe0sfdEgM/u8/Ta
         eIS+RYhMuu2Iqx4FwTL7FRJQRAUtLpWdU4+90Lxoo0SsqGX2y4WJDJcsOiJsrttsmwtX
         Ew2p4HSFklq5O3CUzHDh29OewEGTgvT+l8PHpekUqF5Gil89hitS8Ws5Ji7QBD4h9a3s
         t+Yy9e67DSdElZW3wJ5bFcmRQwJKIf1PdnT7+PqQs1x632UOPqsaS+HhqNDuD1s9ktdi
         q+M9APd+c7SOF/IhAY6Bgq57oxgH9IClWOBuf861KRbOxn+ihkBdIjLSX0cNXxvMzg6A
         7QCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718911920; x=1719516720;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3O566UWxDabtyjph9VFA7tB9oYSkksm7L3FfctdN99o=;
        b=k1jk5dni3jtUygzQF29Yr/fieY0ChvbT0b2FAO+zvhdr9PxXqbZyzxfvaG/x3ijuB6
         ak6xWfBSgdmSmzorKLX3tPGTG8XsVXE9F/DldTQf8kohs3QMGu71NxkWLwMsmuKvErw+
         yRLqMw1RZKuSSP964U4L8wseNdYY9Zww37wGHaJOmQJghyDqDXMqf4v997RWthuCkEU0
         hQTMPNydduMnrCoqvwQmffQrm65l+qB6YoRGwK/NQjZEnfzhQ0H805AX+mve61RFM0b/
         oWzMjCvmbhWZvTuqb82W90JihtkPRToNBML4ByrswxvlbF7AnuOXmXIesE2Ps/p56VEC
         b1JA==
X-Forwarded-Encrypted: i=1; AJvYcCUqG2/hG0h8oeMl8SKL5EmiJ4NRlEUuSMCoj/iOc1sFdkSQjMzH2gEnZg1slbPVXLR/5nSVEz9B1zO91ZtRLPC5CPiUNA==
X-Gm-Message-State: AOJu0Yw/S1rPD8I+xcvV4fJxCwEn7Izu+CIC9LKfj6ib78ERL6YwgfVV
	ntwJ8L6DuLVqhovaPI8EgX7HB6ifpE4kuLcaOYqljEpFeWnCI6La061TnzP4+9xVa90w+AetB84
	GvWKNRY9/jyOEI9YudAxinbYVdxy9m29SK+sS
X-Google-Smtp-Source: AGHT+IHVqLrYuTkn4xTAztiR7d2LLvztqGHq975Y/kCK38ccFnRNQG3MLZ5h88aQZPd2n8UzJDopYxh2BWKAtoi8x6M=
X-Received: by 2002:a5d:4705:0:b0:363:b3ea:7290 with SMTP id
 ffacd0b85a97d-363b3ea733emr4419410f8f.20.1718911920255; Thu, 20 Jun 2024
 12:32:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240620181736.1270455-1-yabinc@google.com>
In-Reply-To: <20240620181736.1270455-1-yabinc@google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Jun 2024 12:31:46 -0700
Message-ID: <CAKwvOd=ZKS9LbJExCp8vrV9kLDE_Ew+mRcFH5-sYRW_2=sBiig@mail.gmail.com>
Subject: Re: [PATCH] Fix initializing a static union variable
To: Yabin Cui <yabinc@google.com>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:17=E2=80=AFAM Yabin Cui <yabinc@google.com> wrot=
e:
>
> saddr_wildcard is a static union variable initialized with {}.
> But c11 standard doesn't guarantee initializing all fields as
> zero for this case. As in https://godbolt.org/z/rWvdv6aEx,

Specifically, it sounds like C99+ is just the first member of the
union, which is dumb since that may not necessarily be the largest
variant.  Can you find the specific relevant wording from a pre-c23
spec?

> clang only initializes the first field as zero, but the bits
> corresponding to other (larger) members are undefined.

Oh, that sucks!

Reading through the internal report on this is fascinating!  Nice job
tracking down the issue!  It sounds like if we can aggressively inline
the users of this partially initialized value, then the UB from
control flow on the partially initialized value can result in
Android's kernel network tests failing.  It might be good to include
more info on "why this is a problem" in the commit message.

https://godbolt.org/z/hxnT1PTWo more clearly demonstrates the issue, IMO.

TIL that C23 clarifies this, but clang still doesn't have the correct
codegen then for -std=3Dc23.  Can you please find or file a bug about
this, then add a link to it in the commit message?

It might be interesting to link to the specific section of n3096 that
clarifies this, or if there was a corresponding defect report sent to
ISO about this.  Maybe something from
https://www.open-std.org/jtc1/sc22/wg14/www/wg14_document_log.htm
discusses this?

Can you also please (find or) file a bug against clang about this? A
compiler diagnostic would be very very helpful here, since `=3D {};` is
such a common idiom.

Patch LGTM, but I think more context can be provided in the commit
message in a v2 that helps reviewers follow along with what's going on
here.

>
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>  net/xfrm/xfrm_state.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
> index 649bb739df0d..9bc69d703e5c 100644
> --- a/net/xfrm/xfrm_state.c
> +++ b/net/xfrm/xfrm_state.c
> @@ -1139,7 +1139,7 @@ xfrm_state_find(const xfrm_address_t *daddr, const =
xfrm_address_t *saddr,
>                 struct xfrm_policy *pol, int *err,
>                 unsigned short family, u32 if_id)
>  {
> -       static xfrm_address_t saddr_wildcard =3D { };
> +       static const xfrm_address_t saddr_wildcard;
>         struct net *net =3D xp_net(pol);
>         unsigned int h, h_wildcard;
>         struct xfrm_state *x, *x0, *to_put;
> --
> 2.45.2.741.gdbec12cfda-goog
>


--=20
Thanks,
~Nick Desaulniers
