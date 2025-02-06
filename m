Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1317B50B
	for <llvm@lists.linux.dev>; Thu,  6 Feb 2025 18:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867485; cv=none; b=YsR9bgScvXiHTaojtDIopjhq5uwtkwa3r+Va4R1onD16ffH2iNAcm872HpOfJ0OTcQY+Vu50nD4X+vEhDotYGv3RuMmAFTbFOIaxxUbJT8LQ76Fpsi3PU6/TvAxcEjL2+oS6K6TvJr/64lyrFY6Ssr/EvoQwgomfkaMF9mkf+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867485; c=relaxed/simple;
	bh=H06jBhEq0ZvoyRwldPFwqWy+epMU+OsCTJMton0k8KA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=skfapBGXPRRB3xetwzT9fImULAKFhwvDtMcdjSNDrIfqq+Fcb35BNgFfGcJqaEP2LMqRB7bw5YqSwXOV4EEVCXGzb6DyLUKoKnrEwYa0OcxxBs218vg5bMCzEtHghi9RPGR808wAk9JOljF7hY0MfSAxgyOp72iavadxFVtCZ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGSkS89U; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGSkS89U"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-307e067f236so784421fa.0
        for <llvm@lists.linux.dev>; Thu, 06 Feb 2025 10:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738867481; x=1739472281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H06jBhEq0ZvoyRwldPFwqWy+epMU+OsCTJMton0k8KA=;
        b=XGSkS89UZuD4nQQPiHH0M/Lk7kmY3T8hTWHMo4lhYlRxWOTLfcpFBQs/jPQhSZgo02
         rLtWhxb0Ku509rSXGMzwjhcbVg5aAXDiSGWgEmqF6lAdkNBGotMREyV3UWLv5HRwrRea
         /iO32YDDFgfuekvXDihligUg7dUQop4vzG0IL4mWUaGEHbWW1r5LEv7upmDBrujmfRwG
         gvAh5K3iljkvryplhc3Ft1Aq4smCY2sR/yruKPbheCNGbvWcwORt8MAxKGMP0PiIUQDf
         RFpTbfnooS0lZaLSgTG8V0M3tyMaDXQByJLABqqiydqPlc1QpwXblEDHJdVOs20kJhhD
         D2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867481; x=1739472281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H06jBhEq0ZvoyRwldPFwqWy+epMU+OsCTJMton0k8KA=;
        b=vHPdrGwXFV2PyYGF+BRJ3wN/JQ+jxSbfWrZXed0rnBGVerUa1WtrC4eTohlr1MKsl0
         6e0noiFbCCuOkWuqFFNSuhVr25BQBXjSnIfvdW87g1aq2GiHXsxTgPXpl2EgWCPwjFuH
         s9t58xdVItiildLwXUakNB14mE3TGpKCskHmrjbfEhVTiwrHJSIDpwzPxeJyEwr9sDwR
         Lc6NdscqMMvEKxq9Zx4p0jp5keWE03FxKKEea2AOFeK/q9dVr5LN4BROKY69dmBsvhLj
         OmD4z+L+lz0/+TBJcXuvpUSWYknWzZ9n2o8Fw0DSZQMqHk+RtmIdI9HMrwGFoJjy0oRy
         H10Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs5FEerNtcxDU2wgvDXbHLM4SglwOqmujhwdU/wLN+i2ea8AFwzM22b6JeQn73hICIjS2y@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd8S7jvC1bmXWOgldYysBjOIIu010uVJ9BDNjjuydquLyDCLli
	HhzW1M68Ujn+cIImmtvTpv+BT9V0owiu9qkpbLOzasiXLxcw6i1SPd2jCnvqBVqqhou6mmcNjOe
	TBcIRMdRmCPm1TSZj06aGS7SLkF4=
X-Gm-Gg: ASbGncsTS3+CwvRRNbAJkWCqixtvL5mGVBMfU6ln0nNPFFrG1Wu4CM/kcqYTBSAy9l9
	wKzKxQRIVMjOSX/WhSydbxXYvxRU5LPxGL3DMzBBjxosQjEq5rph/nF99PoC6EQcqdbqzkIlO
X-Google-Smtp-Source: AGHT+IG18G8c3BNK0462z1B7bHuXmFbkRkoQrfyVbHlRk8icvjAP9ATJESDc/jxw0zv8YmIwtjHga082a7yX+HHZEAo=
X-Received: by 2002:a2e:bea0:0:b0:302:1c90:58f3 with SMTP id
 38308e7fff4ca-307e561e7e1mr155531fa.0.1738867481327; Thu, 06 Feb 2025
 10:44:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206175216.work.225-kees@kernel.org> <CAHp75Vf=84tWvv57Kj5A5bLenQSkC5yDHTHy-u0iK1_U87nvBw@mail.gmail.com>
In-Reply-To: <CAHp75Vf=84tWvv57Kj5A5bLenQSkC5yDHTHy-u0iK1_U87nvBw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 19:44:10 +0100
X-Gm-Features: AWEUYZmQcvul9joL7qcMjQEXWIhbEmA3MIwFwA7IB5y_DbfYl1Y7BR1lcbApAJ0
Message-ID: <CANiq72kGUOgP60SaEwiBcgsDJnjdvJZ1VJtyf3a_+sQJjiffng@mail.gmail.com>
Subject: Re: [PATCH 0/3] string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Kees Cook <kees@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Kent Overstreet <kent.overstreet@linux.dev>, Andy Shevchenko <andy@kernel.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Philipp Reisner <philipp.reisner@linbit.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 7:42=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> What's the minimum Clang version we build kernel with? 12?

13.0.1 for most architectures according to `scripts/min-tool-version.sh`.

Cheers,
Miguel
