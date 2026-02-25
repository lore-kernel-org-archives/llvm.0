Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A18A394479
	for <llvm@lists.linux.dev>; Wed, 25 Feb 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772016938; cv=pass; b=X2hQNdXUjrRrAvd9+pb7o+QUtaFr5GKus5NPuajvuO0wXaVBnnpVD8mAQ2WQScVY09hUUGMFz9UizbhuNIe5uBNXqiPkoPnePvRfCAN2/E96iK9xcEtSe26JLfXJPDginoBD4Ay+U3YH/5eHy8EO/ViPHN9zwlX6VO9NYMvkQ+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772016938; c=relaxed/simple;
	bh=tL44nMVwp3CAGtaRiEkw6o3moXHTCRAbdtidcvVhWXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQR30tHp8hJPkAmy9sG52UlQd9ZuD+Fv73EV2pTYtE9ZbpeXY24qtdTmwmAIvxZjNbMrl8pq6ZcNWvYvU/bWD1JgznH1xj7xOACWo0kKSBln0wtTtIqZxw4SUZLHIBQee/dEvymGlfITLrENKkNuStGBxk5Di32l0/ObehHyM3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z498ZUh2; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z498ZUh2"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bd801b4078so304442eec.2
        for <llvm@lists.linux.dev>; Wed, 25 Feb 2026 02:55:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772016936; cv=none;
        d=google.com; s=arc-20240605;
        b=lq2VnGAgoLqXNhPxWg1pCy5aiDkzXao3NNHfk4pzP0NpTBJDh22LV4V1uGFgvSs713
         rAwF8MOibuIGrpxps+dasHYeTI7UFGp8T3ecF/anLnnI48yn/BV/ItFKNla2NKDVUSwl
         KVrfPpQi6VT3JvDMhGfSnW0hKcQ9SaF1KVbP+DmxnmiB/hCJGGvmCiNj+w0l8M/dmfgK
         rU4aYEuHDTlFTm1lr1B5d71qRRKAvAggNimMZsSh+gj+z1ODqgyjH19If0t77+zLpu1E
         7abXwGBr3gNnsy8J2IEt2VSuzliJOtl9ZsUNdjt4vEZD/MZ/nCLipl/0E/k69kBINzgn
         29BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tL44nMVwp3CAGtaRiEkw6o3moXHTCRAbdtidcvVhWXM=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=N96GfIixmLbL0zqohLcSEEGTMKjmYZRdHQWZOcZEyyhzb2WfuEnR9hh3X0HPSC47mQ
         fN8qF62KDZYcCOJyA33tqND05YfU5ViIIN3hAtrZ341+f+SG7JeO7PEuhIwK/BG5gKFL
         phbkBkVq5lbXipcatoZO3rYwRi611lNIsoowbHQMrCJMzL8hKbxv6Jfx1Lh2yYJIGak6
         G0kQPbYk2ZeftQPPdiQRUErHkjAfvd4GQ++6eqnppn+XPsIOeiEdwIO9W8O+MghyRaPQ
         IrXV470gdLdlQkePMrIx4Oto3bTx7YrU/8pkgINj9PcXkdh1kysMqVRjt1PsgoyPxEGL
         BhFg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016936; x=1772621736; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tL44nMVwp3CAGtaRiEkw6o3moXHTCRAbdtidcvVhWXM=;
        b=Z498ZUh23aSdOnZ+HkZJNrOo0ht7QEPvRngHtDA31lu+p5M4It0S8NjyBHMeUgyQ1z
         RIoH1cmXVMT6lyHTFeud7r5WftmrkhLzRJSY5+CjBOPIrpSkCexBug09pYY+ei0+Hd66
         3OS4pRnCzdnHWK+YBjQxiPzuoukbWvJzDLFE1ni+P5aBVgce+99sbEUf9zqDuKow6RMe
         uIIi27aqMgHFAWlDpp5QvRPHW+KKV79ZKp8kyd+onsui9MsUx89+qx+8S5YB/peRXwve
         VOeYEUAwaUIHEAYXiWFCAPkK9NVjufRq7a4/UI/CEa150Rqiazek8cZpj6t+Pq94X0gD
         TBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016936; x=1772621736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tL44nMVwp3CAGtaRiEkw6o3moXHTCRAbdtidcvVhWXM=;
        b=pOdlNeH8WtdgLVcIVwn4Dm56Kk/t5gOvjXbqq040VhxwMmoASks2zY7jypfC2i8ofp
         430INxPbSXBPbCin8jViMNcDsp7DiNP7bHHm07N3GzyVGD+35PyKYYZIWmpJ5imZcerc
         LubjRGzD+fdHYHNytRuMOehuY1ha7+pb7k3kuVwliYqPe2Gmry+Q4MYDsl2uOjMHqlrH
         d18NpXHz1I+fqRqrWVSwsGKR37dG5jIYh68goQvFZctH8J6pdnDCt8+zQ9myLSipo1CO
         7eqztnSrfTVkqKBOGYYEGZTXFWSfB8BSlav5ptNqko8Y05CCHFn8BUvYGAUWyu4rRUj5
         ji6g==
X-Gm-Message-State: AOJu0Yz/xrcqmtdTpP3qQo9AUnV2p6c1C/e+pNKhKak/kJONyx2K7AYN
	pH4iZOSHuW55UCJD5mZ6fhg1Suo8zPI/wDq33qZRaKdTBWZm1voMR8GnbqlgHBuO6SYgusS5sdP
	7N/XkNvo5VjHAeXn7SEoLz7if1BcJHPyJQhW6
X-Gm-Gg: ATEYQzzUqsCxJL7jmS/QqEwHGJ8O/bsxUANjRL9t+taApAcaFzQ+t/4FPFDFPRTJYq4
	mlPyXvFWMQppvCVqP1aWU7Ml9p13y4iVr0wE7XcwCS/u3bd3dtzUnXYMeQvo18K9DqcvZ0rUwvc
	zUahV00/ls3N/8nb2XE5KCKtODFrDkqKO8VloOFO70pzqfVtKC9AGraaSXLMOibZlrmmSZmGDzY
	0vlWop9JKAskA96eCB+I4rym0so7pK4Oz1KufsshbjD2YWR/q7jVXVr/Cdr274FOe4MUgYb0Vw+
	hZeJ6PjjQEMiiyZxagAHTxmmU3qAU1nXryojnnnc6SDSCUFY8vugr2oUExjeHeC2GxplqBzqFQH
	2lx96HSBaLQ8JQIE7ddBwd4CG7W1z
X-Received: by 2002:a05:7300:6416:b0:2b0:4f9a:724b with SMTP id
 5a478bee46e88-2bd7bd79718mr3491287eec.6.1772016936223; Wed, 25 Feb 2026
 02:55:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225014834.GA1284670@ax162>
In-Reply-To: <20260225014834.GA1284670@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Feb 2026 11:55:24 +0100
X-Gm-Features: AaiRm50JjE1NutXempo2pJ1xDIiyoEfNq86Q53pd9RotwKXP1GmxdLNUejL6oDo
Message-ID: <CANiq72=d8c8GJEjPik5tv+LYPdFLiQOpArb1-wNck5sCzdOhkA@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.0 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 2:48=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.0 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.

As usual, thanks Nathan. I will test the new major.

Speaking of new major versions -- for the Rust "latest" combined ones,
should they be LLVM 22 or 21? i.e. isn't the "latest" set is meant to
match the LLVM major number? On the other hand, it probably works
anyway, and whoever cares about LTO should use the matching. But in
that case perhaps we should update the wording at the top of the page.

Cheers,
Miguel
