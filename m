Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFFE1ACED2
	for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 15:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745075634; cv=none; b=Tp1aD3EvJl0Ogvqq11ZuiYCBXM+SBX3n8ceaOiImYqkNSNZJt2NQNe8dr3hOgNG0LHdIStFmqYdsClSBq2Meo1m3JixrmTFZvsSN2rs+WWgCpF8JhDqMBnkAtLfh7D/SFhAjhx3MjIUYBe2jusAnjzIQWqzNGgRsNzS75ZUnKNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745075634; c=relaxed/simple;
	bh=xjS2bMDeIbhC0yshi+jMm+EWIBUbVhlRrjV+NI3C8Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eyZYwOBtXI1IFkMxgkDOXlqMzpPV+ssWtWu/ddjX81/IhLWqQpnwwjVAsNI7AIyTInJ6T6tYtzz/PUnTjw7A0FxduPmPrgpPTJ+aN7faUxz3NmUyLqp9oaDPITRFtQQbjkRdhDxMGKiq3lnPK1RmN8XustcOJzDNXYBB5ormInc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NvDDzCFw; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NvDDzCFw"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff5544af03so647128a91.1
        for <llvm@lists.linux.dev>; Sat, 19 Apr 2025 08:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745075632; x=1745680432; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjS2bMDeIbhC0yshi+jMm+EWIBUbVhlRrjV+NI3C8Ok=;
        b=NvDDzCFwZwLQ2jEdK8tXhhuZlpu9rbBxL0gyUxDTzK/Gn2AMJbR0brMOHjs5lON7ii
         cs9blGZ15VIvUE7egdYBpf0fqbpkP0id8fzExgbW1ZHZI8EJYFaKUJIFiZPCVA3+XyRG
         4fbT2vwuRCe1CatcEk0mzHEo1YwgwzMG0EEjaQ1aTdRoRCKiMRB7cHwY0EuOTda8mIrO
         l6dZGchDhtIYFTBVuZ1jQCkHhG5L2QtOdAWslPP9EKSdt+sbySi/D/jTEmtF+b8mmBge
         0ApmEJ1bHC7d0qv7lyh/YcpiJ73xmbLWcM37WL+fWL93vRjS8A7Is5JvG87SN+QHi7m5
         Ju3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745075632; x=1745680432;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjS2bMDeIbhC0yshi+jMm+EWIBUbVhlRrjV+NI3C8Ok=;
        b=q7hUsol321PUOAzvukl68exsa9PoDLsftwF2u70xP3OMzeuARXrdUgjD64hd7xuwi4
         YmJcmyUmZvaQ6phjBtJiBiFgzfv2J2SCjlnZydRPdikEK2oztgOO2oL5vj4Nt0zcuP0z
         W0I1Rq7kVk4JTNdHxtHTxmRzLZ7HAU/kBp3OHCS0U62Eo1rTI/8p+PmXSRo1FsqWrZHg
         A7nWPZ/vnhXmWJyS0iG6ubkquhJEVrbtbnZNSZCgJ7tMIehIrRAq1l/ZC0nawhjGvOW5
         j74lqBc+kxH7O1NqDOIERZBMv6+DPPkheWQJvguJ8apT+J0j05I2120Kc9T34twd+kIs
         U8WA==
X-Gm-Message-State: AOJu0YzzFf+iTxo+8MXQeQVfY4Opm/oFIkeMmeCubC5AI64gFWT9VELd
	b/TONAx2c282u53zR8h95pGy61EaiDmgl5Lk797PPXKkenRmZ7IEQ4Di43gAMMlvhyNe6U8MtlP
	gCZMJVrGvHTVVYAJs16RE2Kb7Wuc9ehuG
X-Gm-Gg: ASbGncv9c1G5mqSwYxUdanRiYzDTGQP+tYik56qLzcOFv5pTw8zgCFeNekH4A4egMDY
	HIFwKwMIuldID4WJXcQxCeK9rlEA2pdUtND06VDa2vWfXkqR07xLKJoehHvIKd1z9ltM7VtGJ1X
	U/4im2acOR05DerilTaUKZ+g==
X-Google-Smtp-Source: AGHT+IG1aCfPQhnBXsvG8ECP52ka2sLz5yKvS0cOAtGpRTOS3+qv2td4+5bLSvnUJnRNYP0BaXxwScy8wtNUpAhrsdw=
X-Received: by 2002:a17:90b:1d06:b0:2ff:7970:d2bd with SMTP id
 98e67ed59e1d1-3087bbc4f53mr3345545a91.5.1745075632258; Sat, 19 Apr 2025
 08:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250416152800.GA570023@ax162>
In-Reply-To: <20250416152800.GA570023@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 19 Apr 2025 17:13:39 +0200
X-Gm-Features: ATxdqUGRNkjsD6enVW3TUiA5cYbGWXxCCSBQlvVzerYHNWFwSBicBV9k8htVI0Y
Message-ID: <CANiq72kB6H9g24Aw+Oux4oiJdwWbutyMw0uvLEUBUjg=Mj3jzg@mail.gmail.com>
Subject: Re: Prebuilt LLVM 20.1.3 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 5:28=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I have built and uploaded LLVM 20.1.3 to
> https://mirrors.edge.kernel.org/pub/tools/llvm/.
>
> If there are any issues found, please let us know via email or
> https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
> opportunity to get them fixed in main and backported before the 20.x
> series is no longer supported.

Looks good, thanks! I also did a few quick tests on the older 20.1 ones.

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
