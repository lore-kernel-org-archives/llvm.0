Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BFC330B15
	for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 11:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787138768; cv=none; b=f2HaSwP6KQzBiVZMQa2uNT/Q7eeN7YLZlDo6wN8fj0qK+HZT24tqA2f9zK871uLcFivHBAnvzYxsgymRs0PmUKoyMNPNR1eBVyHViuZL6zyfQbugF2zDmy11+3YaBh5t8f+w4gSmBu+vaRyQzobyPlYOsRa0KGm1hGSOdznUsRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787138768; c=relaxed/simple;
	bh=DlndU5taWNx6tKyg+8t2Gy/P71MCmKsz3gxWRPy329I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AJopFt5y38CNlsP7+DEschRv0p9u+D3PMq5+a7sjNxAc6ZELMbk7+SWgHFO/orj1w+jsZYgxaMibyu7ZNN7E5u82IXZjWWM1ErrA7vosM1MQ0B+C8iC2+ajZwxJytsvNG/3ezQO5EYl5IhqZmc272Oc8KVghprNveNLOYVPgs5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BTvGEde4; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BTvGEde4"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4798bea72f9so486170f8f.1
        for <llvm@lists.linux.dev>; Wed, 19 Aug 2026 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787138765; x=1787743565; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nNv5oyh/WioqDT4lcsso1NW86uSM1Pfl5uAe7Xj7oow=;
        b=BTvGEde49mgPhfsodZqiAoWE59Q+dl9cFlT3QRhNNfyPrBwxY8/RrRcn4m0Y909sy4
         baHQvZuwnSSDfwI1god8qWAaBpYJIu/tziHbtfS7CwW/XN3o27WvlxhnJWy7pepvhG+r
         enty+hgL2mKIUE1ClFo37bIfRC1h7BW9FCQd4p6Qs3WEHY0byHXHLYRelnUUc/QQC0sH
         MGJ3Fc86ELJCxMh+87oPgktW5JCmSvkQDcWujNaS68ElOB5rlEcVQRjfbnaEa20SqQ6U
         LgHZsL0Tr23w/hhyohamf5Ehv2OFZ21fPKE8dPft9GD7oscgptH8qMN6WjpwOP/d7dKH
         Tpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787138765; x=1787743565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nNv5oyh/WioqDT4lcsso1NW86uSM1Pfl5uAe7Xj7oow=;
        b=WvP/6rRtCWKIS71bqbC7rwTx6b5S/YGleQ+T/6cSzkfvq9llXT7j9s3uLXsJ+TnPf9
         erC5eohzLo4aIl5ivcJ8epnxpqdkLs2AGHZfoNjsS15ekcLh82wiCG6QpFo+KV73a3dj
         TkViY6gXv9ovCOpnM/CCKwbo8GtUv9dYqj0YIJ5/aPksHlt+HHRGR/vPa257CzATNQHT
         zu7vttRlvEMjw8/acOxJx7CAi69PBSvsGsGMP5jSBq1tgDkOeMy4YKNALq6i8fJ1Bdej
         Wcf0Anp1bAatEAhRG4110axJ4Ebh2F4HX4G2NVlWOFvg/jrFnBZ1ZU9fnQxyY+bE3EIT
         FTAQ==
X-Forwarded-Encrypted: i=1; AHgh+RrfQZnrvDSQvrJKofWUCTKcnxHqpmRVK828w+WAOblnuUpdH1OZ+YbCpRRdMx+3WtfEhBYX@lists.linux.dev
X-Gm-Message-State: AOJu0YwWXifvOM6wYuzyj3tZT3ZEmJ7FV4wnB/q8TPXORg4iXDlUg2xb
	QDe2raAlBagImS3AjleuxQRNxJaGnl1kEscvxDBEw6IEhE+7Dl37xPdw
X-Gm-Gg: AR+sD109Q7iEa2hHT0YvsAcSXmQXFfiOdPexs/VkpRmjTjnADkGdtFjgsxDRHaQDXv3
	ekWGgFrtEH/VCMrtpnhQNGjRBbk8Si2KdLoXZLpYJIgOs3cB19tEDC0KRbE8He0iIHJ0mbv0/2I
	oRrAYhyIllK+CVRPNLFbwhGzwRunOBmP5Tt8+JrqcjpdebFi2fJxNBJEjee2FWbWY7/AjsRaq5U
	W4jyuc0xluJee/xfhK2bFY9mTl0c5C6G57vhki9nwDNZNyyHQZ/MlwowKHpdCpeegbMC+mCr3UX
	o+sxcJ+N6LS6TEY9edJ04fW7FZH3YSSqO+GNwtmjtUg4R0eYOMkg4f5FIhMCzhtadgKa1issX80
	JqPKuWEN9ABprKCsazyZF+CmomI+r4WV+62P+ImQeImWZEnMsmdCAgWBOSISH1PfDW1HRzQe1We
	BeEZA+tLgQ5lNjfXWdmTxP16JniAW8pPIEBL+HJee51XrmKm4sAhqf+7KIDxfjiHirzVFe04FC6
	cwIoPjY5z74m/Mdh4cHv2cRhQ==
X-Received: by 2002:a05:600c:5253:b0:496:c18c:f9a3 with SMTP id 5b1f17b1804b1-499aa19a172mr62224955e9.5.1787138765123;
        Wed, 19 Aug 2026 04:26:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9dffa59sm74622055e9.3.2026.08.19.04.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:26:04 -0700 (PDT)
Date: Wed, 19 Aug 2026 12:26:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Matt Turner <mattst88@gmail.com>, Richard Henderson
 <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Nicolas
 Schier <nsc@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [PATCH 0/2] alpha: enable building with clang
Message-ID: <20260819122600.6324a511@pumpkin>
In-Reply-To: <CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
References: <20260803-alpha-clang-v1-0-1c4ba5ba7a64@gmail.com>
	<20260803195135.GA1083357@ax162>
	<CAKwvOdnLVh3uhBTcHVcag7gL+i8Cj3B0YUa2V+UdL1TQ3p=KvA@mail.gmail.com>
	<CAEdQ38HhVk0rmq5ZRHbQABgLix8hq49QjzxNDodk_++DmA5Thw@mail.gmail.com>
	<CAKwvOdn_Lt6trZSHg+BRTv6v6mC=X3hCWbNe3R7Fs6n1FcHuCA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 09:24:37 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:

...
> Wild.  Where did you even get real hardware? I know very little about Alpha.

There are two PC-case size alpha in my garage.
They have PCI, 64bit PCI and ISA expansion slots.
I'd guess they are 25-30 years old and are hardly used.
Both worked last time I tried to boot them, but the scsi disks have
stuck bearings.

They are close to going to the tip, but could be free to a good home!

	David




