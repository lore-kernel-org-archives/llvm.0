Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383241F1511
	for <llvm@lists.linux.dev>; Tue,  1 Apr 2025 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743508120; cv=none; b=AiCwZOp1I2lHre/ubsusLqfPjWu4hMRmJG4+2JgC4D0RvsNaRH2kcJkWNFmLA7YJHtKy4fPfmwHRc+OBU6X3Ie28bEn+Eyj2PApMa8Jqh6GbIUYNkM9Ryy10joIO2ljyhQv07vv01DpUkKOvP+jJPJVuVgrsj69mr6cwdF2SI4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743508120; c=relaxed/simple;
	bh=j4cNwCRlrFpFSBwNGdjlUQbBME13gNUf7IKtJypdu8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Km4XhjeTuA8bt5zgYvvakRqvvo5C7K0Zg8OYyytoCIuB+gWh+Q0OXlpz3M9LoLUXMoAxB6daVv//dX8jEuX4BgZSxXAjnrlqhP8CcAWO+R91NTz9UFv+atzArWyc7JdYcNx4KOF0sBHOJw2Bdsvld6sh+of29r63X5uQVzAbU6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0jYLQ13; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0jYLQ13"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6eaf1b6ce9aso56271956d6.2
        for <llvm@lists.linux.dev>; Tue, 01 Apr 2025 04:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743508118; x=1744112918; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JsXZCePmvudsSqTwIbgn3R1iW6p/klgWKA4FSGxF+zE=;
        b=d0jYLQ13+Tpc/ijGFVgmRTi0qbG6D/h7W/pwPeqykxhMuqlX+V3qIDVbfnFYpprwgs
         4DxCM25fcLVeNQYK/9AM45LE7NzC2t6TxT+v0JBxUJefW2ixCR/eXZQIGD2hOvfWONHY
         ZB8mgG7Rk43NpDcCPWtJTeMjYBQMYtF6T1krCoRGjXwqm819THG3kEMbg62hiay9AJLj
         /1G+RlCruNZjM15IzNJgcmCN5awqO7c6d2IrRAqInIk/zdiREcdluBqJ0WLDeGyGaL7A
         BFcGFx7oSW5SZEVElCUuaMrlqrJlZTj+QiO2SemJ+BhOdUFaHYmob7iD2f5p/+QA42/n
         6i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743508118; x=1744112918;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JsXZCePmvudsSqTwIbgn3R1iW6p/klgWKA4FSGxF+zE=;
        b=FeHvAtz0ZZFpDqJ6sQuwayvtxWla0n0sAVGZLr+//l/SxAl64RHJ0dcT8CT5SOjLhS
         lt+LnD95RShvIS9QXbc4jwZGSBKRHC4in5bxRSE24+AS92zmvt9B0wjNzE2o8xKr+tHk
         Qk6A65scmihIV51U3poQ7qeRNFCt1NtQvnuSyITpVvxheEW06JbRX2gInnNOGBgzOcKj
         pB432DPF+mVzWT3DE1gK27ni95yzgvN8Itn6ubGkUcUQKJfu7T4kPZl1QBbh8gHFs7z8
         1TK4r7ce/K2MEM6XrFckIeCoYy/NeiIzj+sZFmrENX/oZeWXrQ8LPCHD8dPdfkUARXEd
         9Q7A==
X-Forwarded-Encrypted: i=1; AJvYcCWtLCVQ+sgpRG56ixAldBAew0yALVfgdywW0rOcFnjxpuzpAXg45GKVNI1jqw4Mm8BS+YzF@lists.linux.dev
X-Gm-Message-State: AOJu0YyMwRuuX7oVX5ASOa96jXmU8/CoLJsLI+LtSb7DHdR8Tn3RRF9T
	Byb5m90UvaGpO0/97LZlnoBb6oWiDHl5abkogQvnjizepWH2aXb4AH04vqEVmyqntBOSQgXYBB6
	Z4LyI7MJI7JBsPJB0TH8eeu0Wi7I=
X-Gm-Gg: ASbGncu2oqB5LLDHp3r60d+BifJfot3Rxp4lKCkJCcvLBqAu6TlAeNTwGrulppexPSQ
	XVYjwZKETq6xglAJmSV640wcv9/Ktf/E9dVGFuAq0oWxJhh6CL8x51gPxhvwYjrAP0YbM7FiQ6p
	fdhurW1JRVi55RVJSfGtRy/wmq
X-Google-Smtp-Source: AGHT+IG0D09JE+clFayUFjRycfEmC0SL9ur+j6S6WyW+b23U2JA1UlXnE/8ZP/mZYwa08jXXmFmpP9tUuDCPqiJa1mw=
X-Received: by 2002:a05:6214:405:b0:6e8:ebfa:42f9 with SMTP id
 6a1803df08f44-6eed5fd6238mr256687496d6.16.1743508118101; Tue, 01 Apr 2025
 04:48:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250114123935.18346-1-ansuelsmth@gmail.com> <20250114123935.18346-4-ansuelsmth@gmail.com>
 <Z-u67D7xl2_SR-hg@gondor.apana.org.au> <CA+_ehUzZruhT7Bko2Xm2kyOaZxUPA4vNLQhq_5V30gfjgmfcng@mail.gmail.com>
 <Z-vGkbmX2PQ_gt7Z@gondor.apana.org.au> <CA+_ehUxCD1+CUJ_6rXa8ra=tZ1Nr1LCZVYQ0X9RhDndJ33F=ug@mail.gmail.com>
 <Z-vO4ImhytEpGEEy@gondor.apana.org.au>
In-Reply-To: <Z-vO4ImhytEpGEEy@gondor.apana.org.au>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 1 Apr 2025 13:48:25 +0200
X-Gm-Features: AQ5f1JroDBAVkfRzfQBMAA_NED86-2L0fYxvt5U11RRVyvSBoKqVpUH8k40o3-4
Message-ID: <CA+_ehUxO+oJaO0CC2BCr=ydmjpXE1hngxW8b926NG+io5HvEBQ@mail.gmail.com>
Subject: Re: [PATCH v11 3/3] crypto: Add Inside Secure SafeXcel EIP-93 crypto
 engine support
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Antoine Tenart <atenart@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-crypto@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, upstream@airoha.com, 
	Richard van Schagen <vschagen@icloud.com>
Content-Type: text/plain; charset="UTF-8"

Il giorno mar 1 apr 2025 alle ore 13:33 Herbert Xu
<herbert@gondor.apana.org.au> ha scritto:
>
> On Tue, Apr 01, 2025 at 01:20:44PM +0200, Christian Marangi (Ansuel) wrote:
> >
> > Sorry but isn't it enough to acquire lock before eip93_put_descriptor to
> > prevent 2 thread?
>
> It would be, but where is the lock? In the other places where the
> same function is used you take the ring write lock.  But not here
> in the hash function.
>

Oh god! You are right, now I'm noticing... The scoped guard is missing!

Let me quickly send a fix-up patch!
