Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900073B634B
	for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 18:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773339583; cv=pass; b=REXvnraIB//MFZtEANyBVDPHj3EJkM6y4DpVhUlJoahE9/wnwix9QoFi0MJZNxf1C8gzYT+07gwiwOerEPABAgU6tuu9su51VHgiXhCtFUJULxhNFIfvrYRxvE4kjRi2rvRSIx9RqGePTXSh27c+NKz0tj/NlU2msu/mt1dJCcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773339583; c=relaxed/simple;
	bh=RpNiXDAE+taeWZnGMx/djr6110y6v5HGJRLyCPqoeNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q1xz8GNG3Br4cv84TIk80kPBVoHdDGoNKQzTOHOCsp0z0hN28h9DPezKO/8aM9ey2A3S6IW+fVA1olFvdHnR/EeeA9suBYlOSUIb3p9fguN/thoxB34t7/qGI40TtbH1W9WjzEiq2aCqNYBewARL1ZpTqKKCnCkXzeSMqqW/jFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEO5s/rg; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEO5s/rg"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2be22d699c9so81594eec.0
        for <llvm@lists.linux.dev>; Thu, 12 Mar 2026 11:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773339577; cv=none;
        d=google.com; s=arc-20240605;
        b=fBQsOszkzAdLI4NpYovH51bE711zJ8b7dPB1O2pju7/owkfHS4+lDvUqonQDxUxUfo
         txf7L0eRsCuYhGvHp1jPe9nhTJY6KqBYRHGso6sCpoa/u64iGbuMBVaQnxuxPbOrVy2s
         hyfjfewlVQh8+wA19dKJ5ur/YJXevpheU+AhkdaBV7HFem6BoSEA07Ba0ss3zkLENxjs
         oxyTsbwlFkCUUvUbj6IQCPLWkFt/KfYDPh5N2iTHWhoa3+DpJOOYiY8zXVUd3bCFIsds
         FcTymVDkIhUpNstJuraVHy9IQwWyGVDYXaLj4PaZXxMv3fVkGgIOseGBJ13dGytvQcAx
         rFOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpNiXDAE+taeWZnGMx/djr6110y6v5HGJRLyCPqoeNI=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=isdGVWF8FAiGCxYQbL+xbhp1s5N4wMNhL+aqliXybVLm4fbzzhbSkkmzS2uadjV3kZ
         Q1VPV+Njl6p0KR2JF6vMjp6KWnp6OfdnWC5jTO+4gdtMvRTXikZB3azyyAIl4psG7kF4
         T6dPR9bOubrbkqJxY45F2J4TSGbUQIa3Lzk3YdK35IiS+/qvAk/vst4oX2leuS11xXJm
         bNiAUw53vDRz5jKExskb17YNeReHx5js8v0j8vLshIR9TC684s+XxdRl2zaBtPPliYR0
         IOcghPBPXtLc+jsd+KV1SeIgWT9oEmPN5D/oeI6rbeIr+IqA/8X1KLTqaoYVUviL8KTC
         iU3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773339577; x=1773944377; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RpNiXDAE+taeWZnGMx/djr6110y6v5HGJRLyCPqoeNI=;
        b=jEO5s/rgDXlkr55bKwelmLXPGsIWRc9HkBg9QZtQTYFnZdkxwMioxdZ4JxbMBAmK/5
         JymhDia2Cmp9QAfiZtmxTKNUeJTu5l3DoUYX8G+euFuiM/VWZoeJ29Mx0r6I9JgAUGrD
         IcveB8pEWUs24Oo6kHmWMFWrFG1b+J3H2YVauFKeo8ng6kzF4FhhSH+2wl5Dm4gN6Mgm
         RJly1z1anMEBzPVXyagvsFzVt/wCj96gC5O3XuXdf9LZCixa/EAtYPCM2Q6250Olh4ij
         hWtnuHaqt92UPCRCKAQMxmi9zTSWsUXzyyt70AzwxcJdh5HCtaSfOBHSjlTvPYBxFKbo
         XfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773339577; x=1773944377;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RpNiXDAE+taeWZnGMx/djr6110y6v5HGJRLyCPqoeNI=;
        b=OpBeZFQZqLWJRQRXwcZlqP+8DUZd7bzyiTGhNml60bO9/WBBKYL+XYnikhsrQeqImE
         j1Kzdb/rzf0QNPIE/hf8YcDZeGMnMiBIs+LKWh7dHNaBQsibowQlYcdKPJbJ6OoSEUZf
         u5hVaxM4ocnY6gbKeJsys7BoiCwhZULpwOJGM0hAh3+k2bwXzXT3wrXKvTZhvGprWCix
         bD0t7aW+xiLncsEbAbCrcbeP2F7M15sbHiBxNgxE8x1Bn8/5etG7MCuundM7kLVGdMCs
         hj/ad53Ut9/17bOJxDsKJxvs4qe+Ly9b0YXVIFdmynTq/pGAY2grTUWT8kbyONdOwrVb
         1i+Q==
X-Gm-Message-State: AOJu0YxuIeKsiCpRy2Ce2vqcMcqcdJ+P7zPXoANdmPf4hHlUAzODyZ/I
	0W+qGhJbe8agUiim5mkz0jc0yZf8++EJ4vCsdemzOm2TaUApeN0zQjTsi2JrDmOEewfRBhf4vA3
	2mnnfW9NqjHp4Ur5NrA/Mo5ddn1VKXO4=
X-Gm-Gg: ATEYQzyyAmGF3Y9HTDU+K0pAf2dD8YUw9CJEHZ2VBpGiV/7PKNw1YktHLNCwSxBnchl
	lNkxmb0ipJauMyll+v+7gWVCyPGHZ02Sk9ePmC84uaPredKCVxVG4Iwn5nUYgHZMweFurBUp9qb
	KewsaeN/9QDvrunbfzSbr7zRRK55673EwqBwJ7F+13hszVzXgFdwc4EtrkLcKY5O7GTGXCmkmL5
	pGWfcdSBGPK+u+Fx4x4ZXlzYEPnsUcDSKP9dUg0sFDh0hliOfiogBgk7hAWd+geRmh3XS0Ux/Qj
	rsnUx2pz9rOLFWwLVjk5UT3eHzhEoG9R1bakUTDrsN2TkB90FfUnqZzYfJLzAPdhBIgkmpfx9cU
	L9Nnpqh4oYva8FOEdkBf+iLo=
X-Received: by 2002:a05:7301:fa8b:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2bea5538210mr173440eec.3.1773339577205; Thu, 12 Mar 2026
 11:19:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311071652.GA1991880@ax162>
In-Reply-To: <20260311071652.GA1991880@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 19:19:22 +0100
X-Gm-Features: AaiRm51kAUNkJEU6OonpCbwhDL1HIuHv13f3yqZVZu3WpWfHANbwjxGrnwHaOzQ
Message-ID: <CANiq72k5KipAULbzyFDxEQLZCK9o_4Xf4rYcFo0RhF=3RyGG5Q@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.1 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:16=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 22.1.1 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 22.x
> series is no longer supported.

Tested it with a Rust enabled build as usual (just the LLVM toolchain,
without the "LLVM latest with Rust" combined packages, since they use
LLVM 22.1.0 instead):

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
