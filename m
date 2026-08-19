Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9BF47A876
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787154966; cv=pass; b=ulqV0QVKQUWYieC8NJlFX81GBr4U8agdMG++5hUbfYQoi1RxdeTorvMeNfLbN0bi91lgQRQxd15sCJHSmVkaBLM1mZDgNv3MLx7QAY0ds/wSGncqyBHDY7+C8r9+t1Bo1zgdJ/rQMqbATumwjbxko06AfEZWyCfPciogIshoieY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787154966; c=relaxed/simple;
	bh=QCNVGM6JXF/7JnLS+3lu6Q1utffymbytyo9HJaN2nbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3pQkRCiNepEBxJSY9fYcU5tTSvB9cYPWQr5gVZjXHqyCxx/wH4SiGHFCkFd23tncc+MT4qmHOQFIiDaNRJbbvUo6mnPMdfECa6ioK3TRC58T1U54sH83mGz0K8aJBvdsRCg53kebKODtXo6/YeAQQ3jrCX/9fR05buDTUZX6ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iD5LKgSq; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iD5LKgSq"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f23e851626so8540546d6.3
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 08:56:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787154964; cv=none;
        d=google.com; s=arc-20260327;
        b=I/ekdhkVGRB+ovQCSpiDRnNbtEAOxriCAOVBnB8ZSxw7tMhH+NRwYKuY+1zHvPDvWn
         5lcaqV6dere4Ql3AUkeCnjbLD/IVNY7z5To1Gug+9PdmnutjR8Od+CdJih/wo+X7sBcx
         725vnE4ThUbU6RCbLg4JIgS5vJsG19mvCFHRgYs4YNQLyJDXfzmHfPqjZSjAKZK/lyr4
         W5Gao3eGNV7E3CIDLhsv9JOUn8/o81nZic+a9veIuLJ99wdB43dNYm3yzn5xvDq6+mot
         w1aJxdGcb9S0I5ShTsRivoj6SPC8MznnCQgCHr/FGw7AhzXHCsGAmwyeKWHHLCrY8DN9
         SI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        fh=iO/S8K2yX0ppz5p3EqWS2N4+tYTK0PlvOkM3AuW8qNI=;
        b=EyKyPsqC4Vv64IpDok0b9dRb03XP4xEJU+YvkhW7UoearNfR4vPuUCLp20NhSqPq4a
         YMGmVNGSCs+/hvFyc7aFxByMHDPiZg1JdMHMe/+unN3G5m9iuPtUaKqS1R4Bpa8elx4j
         t/0+pNFV6s369JXmZwbVAVN14uefldwELpEqMaB9OE2eyR0OF9I3Q7BiIhpKkqJpEINn
         f+yQ7Pw4LYQgzJKJus/vT1XeirHdxS17sosnJqnBvf1nXbhk/72EuYA5/Qp6v90KSPvn
         nzzVdvUiIPnaoqMAHQmvbnBwhmEP9Fvtnd6fhCipS0ikrDyHwg5nn5L88sVsCQe8TX+k
         0xDA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787154963; x=1787759763; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=iD5LKgSqb5QHQOh6wtajy+lVaPzScFcGi3NVXdu7cHAhwdru15iCtpOs+l5oLhOd79
         YH9VOQR6nf9U07/Z0JRsyIIzVUSYQ+q2urkBcS0gmXnlSnhj8+ClKUEASueHhpGG+PQe
         qVDQQRJGY9sGRqabrFSSenYIEqstMJBCK2fCZaNWmC4rzxOL+OxyMSAplZpyF6J6vndk
         lwUPt6XZPZiBHDOe/3RvjNtvrUXiN+i1XPcNakTw6sUqpVWgiZYMUkAnspfReeQiSXqH
         BwbbtHanmMIiZ922sQJ844DVXajA5HM8R3gMk/fV64WmggrYG4SoepKjDOELxyMYC7p/
         sL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787154963; x=1787759763;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=luqgKeY9BCSFP8cqU5Wk0SA2ZSLwx1JOWvC8sMgRww4=;
        b=WEGkUzXkIax/4VLSWCkrkudIkF25Y6HOx97mOGgEgXG8dHkeVqMvbo2udgd5DfYEy5
         A6pnWZBqjfibyB70kPuOSgpfhax5Vqwd0Kn73zLyQfllYOzouHx0+FNC/rNlktHgXQdM
         NW7uvcn6332kBmgJgcaRO5ofxiXNsHtS/SMf3qAlgM+GQKgigEXK4wWyJwAouKn2UqaG
         gnkUE6qsL704h9Cs77nBczU6zFyuru3jLgJQrFKljz113y0EEPEfkpwPVszb48V43reW
         jNTEgGZaKK5tcRmXqXJHmP1aOSd8I2QHB6ccDFcSN7YW3zxcbMqUpWe34sNsPIBv78+F
         2Shw==
X-Forwarded-Encrypted: i=1; AHgh+RrIZquWTl8RlbN+F7ByJiyZGV6FCVS4L4/d1K7lrTMCBohc+njf00fs5DxQVgClJyExeJi/@lists.linux.dev
X-Gm-Message-State: AFuF++ma+kSxGqyeUcQHKhU4hwJAX6jvkDSczFcRrdcF4X0OUfU8jalN
	lHymNq+H8Pj3xOVjQtDqhbALH8zPmV2OvB8FiUh1TNARIEIabFYHopDOILhI9eM6KPF1FTmBchS
	CccYvTVgpOgfrmECtesWBapfU8KcHzRdZYw==
X-Gm-Gg: AR+sD10Q+5kD4Xt7PPj5Rm+01Zb6GeaBztadb3xHawmcHO4h1w5f3h/FSAFtLPq9xVm
	4A8KZFVNI/zV5/VL0heQKNzbkh6DstGDlDaT8YhamDOcYWZUlCNNeZtxTCx10RlLPf0JeCc8CB7
	dfiWDdLWSto++oron0+Osc2+3X+JbdItbXfjCrDfOm0fdocobvC+/CyEd3AE8EZHOKPON6lyWin
	I3bbW5fz7oipedH9k2HPNqOygyiuoQUAQ4LFNFRi87dyH2OZUpobsNk2IfLUVtX3PB4hmI0higK
	9YUbnpaNAl12bEPi1g+1arl81bBB9OS8Rjif6/PSkA==
X-Received: by 2002:a05:6214:dc5:b0:8e7:8d53:2417 with SMTP id
 6a1803df08f44-90c5eac9942mr52592116d6.27.1787154963571; Wed, 19 Aug 2026
 08:56:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813083536.970196-1-ansuelsmth@gmail.com> <20260817134727.1f76d6dd@kernel.org>
 <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
In-Reply-To: <6a8376ef.be1895d6.92f57.c9dd@mx.google.com>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Wed, 19 Aug 2026 17:55:51 +0200
X-Gm-Features: AcwNN1WR7Zj_IFCR5YdVpGhfxkJspgU8SJdxW5GIgyyCDjlcNc7jn8kiW6V-vUc
Message-ID: <CA+_ehUyRKtuCtak5XD_1LUMEmLTn4JfeSDapsAEwo304uxyVqA@mail.gmail.com>
Subject: Re: [PATCH v14 00/12] net: pcs: Introduce support for fwnode PCS
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 17 ago 2026 alle ore 23:02 Christian Marangi
<ansuelsmth@gmail.com> ha scritto:
>
> On Mon, Aug 17, 2026 at 01:47:27PM -0700, Jakub Kicinski wrote:
> > On Thu, 13 Aug 2026 10:35:05 +0200 Christian Marangi wrote:
> > > This series introduce a most awaited feature that is correctly
> > > provide PCS with fwnode without having to use specific export symbol
> > > and additional handling of PCS in phylink.
> > >
> > > At times there were 2 different implementation (this and the one
> > > from Sean) but Sean agreed that this can be picked and used in favor
> > > of his implementation as long as his case with race condition is
> > > correctly handled.
> >
> > Coccicheck says:
> >
> >   drivers/net/phy/phylink.c:1039:31-34:
> >     ERROR: invalid reference to the index variable of the iterator on line 1028
> >
> >   drivers/net/phy/phylink.c:1364:26-29:
> >     ERROR: invalid reference to the index variable of the iterator on line 1346
> >
> >   drivers/net/phy/phylink.c:582:7-10:
> >     ERROR: invalid reference to the index variable of the iterator on line 569
> >
> > I vaguely recall that you're supposed to make a copy of the pointer,
> > not just add a "found" boolean. Dunno if it ever happened but Linus
> > was trying to make the list iterators override the pointer on exit.
>
> Oh! I wasn't aware of this intention... I have seen lots of pattern where
> the last value of the iterator was directly used (if detected valid)
>
> It's and easy fix... I can send a new revision right away if you want,
> I'm already on it fixing this in the meantime.
>

Sooo should I post a v15 with the fix? It would be great to have this for 7.3.
