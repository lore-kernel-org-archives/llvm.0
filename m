Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD30A2DC798
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 23:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777074884; cv=pass; b=iGa0WDrf6q7oVJJ5p9AM2haAd/yN9XlSWpCKLCF26oo7WC4Uypl+Q/VPoZQ2jmtNGhO1LlnfFVB6O6qH0zpPRM2mWZEgv0Cl5cMM44/sg8cZlSilIzwoNJSFM+LG+TfT95k/LVwarju09nIjcH9eya5n/TgLlAyQUt+gPUJTRcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777074884; c=relaxed/simple;
	bh=5WCqxVi5zvwO1R1WPCjofkbxGaKa8lBOi58ektf9Erg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PjB7UjLbHa4jbdRdFJO1M8iFmR2c5MCGKqHEjMDPgHqOkIQx8gbX0VmI+xIqO1k1aO5gVbs8NR9Hd+q8HvzU24YfclbBn5R4O9ZE53CPChEsH2mzhQL4R7N20J0DEvNuzvK2PvkGwlOJFrDNpTSM9IpRDuX48Sw5pJFlTRTCImY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dp76vDbB; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dp76vDbB"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2dd52990758so519997eec.1
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 16:54:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777074883; cv=none;
        d=google.com; s=arc-20240605;
        b=iSRG7m15YYGq/X0iDe4m1f77Tb+rdAEZ/HRlsXIu7fqAZ5bqjsI2iZOo8kn2V3Lysd
         NdGlObLL/t27gPkyy/HdcEH5a82aSTwEFZJchk7gYLUNiNtlYQlBRjbHVNcEQ9OlyNWv
         asfGAPUf/Cz9kVDWdF6Q9VgCUD1CPdmknQkdkl2AxNSIwIzSPvKURJbh4SkMjzGwi3hn
         6tT01yaIkFuztphFyeU4gL7ZA3raAWFJQ5yYP0un7YyoB+Ujizh9qcP6BsQnXMNf5IBF
         UYZ07DCt41HG6OUepBPp9YvEi1ovgXoAQR5EB21Ym2MvZcaVgA3Eu1VAGTWFfJDTl3LB
         N6Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5WCqxVi5zvwO1R1WPCjofkbxGaKa8lBOi58ektf9Erg=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=F4ZP2HetGsQje2R0U43VdjxufT5lEEO8VV7InfdQYEmzsJu1bVA/1Tag5qAKz7KRJW
         H6YWLqJSvAiFDIUd+LeMoxYmfA5ZqygSL6cKxAP32UkQflTLM+J/lwyfgEwR+f+8kiCF
         6pRmC9V9jJJ8VIGMheMoNSiwhTq/bbyQlMXseKazC73bNiUY7SDdorUNzIWZlblFQcHd
         SnzqJ06puZGggoakZEkTCVRmDhLMDBWzlNouJwzro6//znV/hhqYUFFH1IafNj6RPjrx
         9LuU3rTXekreqE9uw2hwmx2mx4boj2hl5pblzEEXRKRuFc4yRww8+MY7x/av20rYW2Yd
         Fmtg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777074883; x=1777679683; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WCqxVi5zvwO1R1WPCjofkbxGaKa8lBOi58ektf9Erg=;
        b=Dp76vDbBjW3Aj7KrztRVuwtI1Ax/ltLv8Pu/7sn9rYNMHqG4GAjSSVYwjVpylmWJI5
         ef3SSxcLkXcIQjWVjriMzgdzRc2pOWC8bHwrNwxw8a+o+8v5QWtkq54XOxY78KE1D4oT
         kmqefYjc7yRZPWINa/KZeqJnfinwNMZDYhm0p+qLo1t0l4RlLZDNewLkApRmRD1zD+84
         3tKstZJYTacbEuCtMyF8WMGQdxC233AYAQLXow50U7tZ6cbSJnQECR+i7ShrhlsL2tfJ
         yxKWhPfAS7IeUDJEI3Hwz7q/Rqe6MS9o4GW1SFCcXnwxmj0kk5Z0cZq96S9LgFBLK2gH
         5EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777074883; x=1777679683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5WCqxVi5zvwO1R1WPCjofkbxGaKa8lBOi58ektf9Erg=;
        b=ixQdpRKwPBIqCjvAcBtdY9Xu3P6B4FWKnl2qdNXM24JIJ+OAYJe0ggrYj8TP/3Z0sc
         SICDCgybaAn7X57WxFryxC1Wsd2RjdhdhZpbAxJwcEo/msUrU0X2Jnxm752fJTvRsEpz
         Wc+lOI45si8NPQR0K7T2EDHMIWU3pQnXpJXzS09KOZqv5G7VPykbklyaITn2aDIzQT04
         EfTrpDeG/Z7V4NZjX689d6nWvzo4qlcNJDV/pOhOah4vQ6wjdBzsZJQ3Q8CskhTADYyv
         oiRDfKq+ockstScZnNlkK7yabysVAh0Q8OW+StrUGyqWSFibqcc+I2zF2ufC/idf7BuQ
         xpbw==
X-Gm-Message-State: AOJu0YzQd+saXjuUzIu9VZgQtXJRQUBb8Jqsmso5X8LJSuuHtHRqJaUp
	00p2MEhXPkm8XWv945LGOFM8jK6T5yTCwfoGsYTfT74eQ0Wh/XUyAaMhN7086vwcSYYcMan+5nS
	D2lt4wXGGTK5clTy415m5S6zyRx9p9hY=
X-Gm-Gg: AeBDievU3VDmVEw09eIJS1ht7chz0xsFhNcpTxFPoffhzitcC0BNE9Fmmgp4IUE8+Yq
	fMhw1QprMD6gz1mhtWH3hHD6X8M3/Z3yZ9CQA/gh54VdlYYES4zQqx7CanWRyfE12dTUaIOgFBs
	nWCCa4YsneforZK1kdgwTWoHLEib2hw7biYIQYBTggy3V2IIIkjdkjwt4HS/rY231vZHPLt/SvG
	sdH99MLWpHhy6HYm6ux8stBlNVMihk3YOr5nitDsILJpQhbLVaV2+Z6QXHY/FWlx3SecJinHlo1
	o1H0LMgz/oCHg4fxu8abluJY6mfQYif+PS495zgb2KWYYv9SIzsRkGHamb1u8mJKVVdu5MhUPPw
	ZT/as37II0l9NythEeLB00rA/lWS/tSlXRw==
X-Received: by 2002:a05:7300:7494:b0:2dc:e799:934f with SMTP id
 5a478bee46e88-2e479910f1emr7409949eec.3.1777074882821; Fri, 24 Apr 2026
 16:54:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260422053019.GA3090128@ax162>
In-Reply-To: <20260422053019.GA3090128@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 25 Apr 2026 01:54:30 +0200
X-Gm-Features: AQROBzCxO62WtEF7X_Hog6dNoP0B1oejIM3QN38bfUS94g5-mqc2KXmLqhs1R7c
Message-ID: <CANiq72kjHY8HXAmwOfJAf333fsToYCsk0RONZ6gFFGR1B035nw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.4 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 7:30=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.4 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 22.x
> series is no longer supported.

As usual, tested with Rust enabled -- it seems to work, thanks!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
