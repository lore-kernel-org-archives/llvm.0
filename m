Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904BF3438A9
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523298; cv=pass; b=fKxt+VhdZ+Bp8gn3DoxvD7vrYOh2RYtyc0cWS6GsHJRErbp5+hPhZRw5Rc09VZ4VWk9YwCRh/+yfcdhK7+FsNTJdTfYu1PAYcGWMKCSQmmXA1oUMsA496kSnywjiUTCOd6cXgsixamrxXKYFUez2P7VQHBY9kY5aIRwog6yRCEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523298; c=relaxed/simple;
	bh=KAD9ksCybhc8clv14bTiCcv/CYLxdm47VVR2R99SEPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ejhIi9j4A2BAmRaZJ1botOBr6x8+LyRad6yafYWxf8PCccdA4WiHZ3KKtkZ8iGY0noBVPl1A8XrIEAkr/+vk0nKISqoP0u+ZCk7s/47yp/bl3f4j1Pble8VofxEiqDekokR3f0MpBe7fwbWKQ7dZwNM66arxnn31aiSQxeSl6M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PIuG7kL+; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PIuG7kL+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2055573c8cso104793666b.3
        for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 01:28:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786523295; cv=none;
        d=google.com; s=arc-20260327;
        b=VgmYnRnqkZGXgGcNV1++TqAvp5x5J4STJlHwCnhHWlRSrGSEn1OF2O5q7r0BodVWsk
         cHP3NlRF69E54gIRT4vg2jq2yMF7oadbdsBMnL3SfVNFdFrjN7LGejGX7FkYNh3qzpDt
         ukFcdhpUBFiVU5oSR7FwWskBkjQJ+y5F/k1HIaUoHNQSzMbdra+6uHEUMZxSbv3+k6Qt
         GqYpR3lXBEkCmeAoBdOOo7Zn8oWw4uwnghpn6WOua9lEmR4fWAIhhzkaYqQ3uM15e20x
         +kajFf+t8NqYNF31OhqNQII/ncn67ymTtBaHEQA02VHjQQTAhcITZM5fDiNCZrodktGb
         fvJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        fh=pfSvQONTJwlFKYoNwhS7UHKx/Y7De+mb2SxdN2MgeZg=;
        b=h5ew9aEKyQBUaB4+83bfDLmTRcR86GUnuL8m/oebdOfjn7MfBp613DIPogSgSrjfgx
         h0aAwwF1SgkeDCWuh2xOS/O6bZk8UN0FKmcn6Nnp2lC3GdMRyEVIK7Ab0rvwekMLuckw
         qIjwtwfO4AQd+FbBCKdyBToOONNW4o92LeGkxqD19fmjsHTLiKif6xQtoOh/65eCsA4i
         HPZ0gfxFrElywGub7qzwAiiLrIFWPdVL5NkXHp2a33GsFgNfzTTn6wBW/vBiN/9b0vTj
         e1y6zJf4TOQiA7Xbpu4FQUBwso9fppva0hu/vDl3jGbGJLoDVMRe89ZVM1aAGXal8xI9
         YiSA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786523295; x=1787128095; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        b=PIuG7kL+xaSY6R3mbxweXAMW9z82Ni3ZpvpNX2wTWfqkmjQFl/1lSc6xobBAXJedWB
         qJsveT83ORSdVd15fhnTQAAFsEeNg3vBsrbax9eFM+2ZB5HDHG3WK3tu6m33MzzBGveO
         2BN0DKH5rSaJBYi38u3EVcvO3UT6L5Q2JJk2n9M3gu7Uuu8cKmTuewkWtELuIBtXIJvS
         z3iVQGMb1r9hKtUc9iUp/vnxXPW7Bh6mi/u/fWLwyZLFp1RXwN1FuCuL3kLvxB5Gi3Wx
         C6z+u7DfKS6QwSTKKvLQEqSHygZoM8TmIhLbGKIX+F/fFPZhyh5Cxgb815KVb5tMX1g/
         FsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523295; x=1787128095;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gePGGlYpZfXvdIs3VK1gl2M+9nY8+WmTeiFl+AMl4iU=;
        b=j6XGHNEv8jLPCU9OT06JqD6EkOHOeDncw7rAQag2rD1dj0f0DYOcvP0OFC6PzP1FwW
         6dEaDKnEiWrE0Q4/ITbj/sdCVSzlwDNeo/O2WtxJcSB79LPcxuLsTZjr+oa2ogdmKKrb
         E8lF+FDzygEqbHEBHWAiDrr44Cd6GoagFoXOc0k5F6+ut8FtBpjD9V7x49Va5z1SC+pI
         YyIz76iWTv/DX0480sPDj1EhdDMywHkHkUAnfb8NQlUQWu2/SOsS8S3et1y+udNqSEq1
         BeU7h92zTm7M4cCQAiA4y1TDbN+kCCHm5iFXEVQe4rkQqkn6JSUa7797bvueaPUVrSsY
         nB7A==
X-Forwarded-Encrypted: i=1; AHgh+RrEnKDfClSf01IEfPfDdu/V0bug+y0lScEKVvcqwGFqGNXwRrWYpLxNsXnmw9k8u6Hs8pNn@lists.linux.dev
X-Gm-Message-State: AOJu0YwRTLf5M6oU9wURbWzKpMv99CpjpGZo+EkShLNQoaIn7+E3vtHT
	XE3vAiPJA3qUTmb3B4tVkgP1Iyc8VPaJHIzhf6YkvYfd1GqUOBO/ICuKRKPm6/O40p8eaK/Hvao
	s1u+fwXfgq2XiwO8k9LBKL3eDqh5hI5s=
X-Gm-Gg: AR+sD118UANb5N+6wyDKMQNDxHbNz8k7KHfRwm0EYo7jonIj2g7MnClPg7oEfsen4Gl
	JhgaXCwOFBPA7U3lAebqfwFT4KIKCB4gCjsT9AFKzaVjnav/VeJrozfzZh8cqrYg0HSQvrUnPp1
	oo+6jP0MeuJuulHaaDzL0uFcMlVlxXJZ2/tSQ/Qqq1DCPD4DgbSFYG79rQJey7znuhH1GHbjOr7
	alzRDZMKLBxNe8HSqEeaOgLyKU8YFXQ024X3nMKRET3ScLRJiNbUwZx2Q+/rsE7bNznuaNDqLk8
	95kttlkYodRmgy1uIsmGfwnLpjRxbU2rBFVqfBfbMJDCM1nhJ1rXuMr8amKoLvyX7B65lrKYHTM
	nr+Nebq+oxF4rNYtGOJP4Qx36+Yi+Pw==
X-Received: by 2002:a17:907:7251:b0:c20:eea4:267c with SMTP id
 a640c23a62f3a-c20f305ee93mr132768966b.30.1786523294569; Wed, 12 Aug 2026
 01:28:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
 <20260803-alpha-clang-v1-2-1c4ba5ba7a64@gmail.com> <CA+=Fv5R0tdFeEKWgSVTjfXbs=guZmR8zy8FGbqUZNSKiyB24aA@mail.gmail.com>
 <alpine.DEB.2.21.2608110653370.48788@angie.orcam.me.uk> <CA+=Fv5SvjHgf7_5aXp_xBpE42FmM1XTXLrEkzjdQ60NRHKkwpw@mail.gmail.com>
 <alpine.DEB.2.21.2608112254100.48788@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2608112254100.48788@angie.orcam.me.uk>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 12 Aug 2026 10:28:03 +0200
X-Gm-Features: AUfX_mxFGFTXsloghSaGbl7nrZA4hTgYyp3DHtv9-CHPmf-xGOOB1T8KYXQqRBU
Message-ID: <CA+=Fv5TKNW776xCe6XJ6LsvnsYF1r+QxUrsnG2Z2o5JRJP4NsQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] alpha: read $gp and $sp explicitly for clang
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Magnus Lindholm <lindholm@kernel.org>, Matt Turner <mattst88@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 11:56=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>
>  FAOD it's also the space in `"=3Dr" (gptr)'.
>
>   Maciej

Done!

Magnus
