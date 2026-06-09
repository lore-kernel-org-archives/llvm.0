Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7348A2DE
	for <llvm@lists.linux.dev>; Tue,  9 Jun 2026 22:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781043959; cv=none; b=SMLbwqSLFfDhtukuYsQ4aUqxneW7Dl1BqBecQoAhtQfh9yy1JvIY8oATHam4Pzm+kKtetlzP0jt91aEyg3S+S5SCPtwHWgtCHR3/pCMKmF+4B+MfGOuchjn4H8AWFmmLACowv3mZEpifdD/n/0sDl5MGF5MK/MuGMduNBrJLgIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781043959; c=relaxed/simple;
	bh=EbnvOc6q3M9bu6s+LJyPIX6jYqRrX3EP2WtbZXh/ifI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bLEfrYMFj+rHWyvDZRdCLkkKZQUNmcUs4V+RKc3Sg0ZMpjrH9BzYqLtHLPPfodFdLIN1OIgq3vXk7CTaPMMgIo7IJZ7pemwzip0A3ETMsLkZCGMDqd+uMCxproz1ZouT5P/RUCFV0gKSm1qXwgu5z3Xwt0AOYXy/Nw3JCjEA/ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iSZ4tLli; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iSZ4tLli"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c855599a77aso3018037a12.0
        for <llvm@lists.linux.dev>; Tue, 09 Jun 2026 15:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043957; x=1781648757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nN/Jy9B/0TiaOAqcpt4MHIDHsIu8QVblj/3gdv+TtyY=;
        b=iSZ4tLlisgRpbUuAIenmd00lA21g8hawyDPLXcb5mtIkn8p8VQumskdFXKBMG/5CqA
         aLh9dua/6u6X9euzQ4Mte3xVJsbQm7sF0ZdwvMPnqhQvpTaCPDxUfer1VW6GfrUfVyJl
         Khzxw45Qb/ioLJtUehWcqjLLMXX/roT1jsQBQeMUuMMymvlfZlIuxoC2qzYQMCIEYXjX
         pMSEOx+aHulViIDtPZleYO6eCRjBged/I7Ru9raBUY4uIx/J5PGl0LfErBSc8Lbk939n
         6OWyrGQuJiUOWA9OIrmF2JRyENCLTDjwzqtTCSZJDpTXxvFtGckQKObtasly3ZYpdern
         14TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043957; x=1781648757;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nN/Jy9B/0TiaOAqcpt4MHIDHsIu8QVblj/3gdv+TtyY=;
        b=ILtioneInr8yqhx0BzA1+LCGXFaxvqFc+aU3hkixWJPGNZi3eope8lhBQUWN8gqpBP
         nzTV00eT7moT3bxtCwgcFGmCoDncxIpvHEcJES3Kmv5jMYbBz6dRi4AkSluZQG/yAsSF
         g74mDwH244QPbfP02MXaOpj/5QJrgT9fEoGc3zspCO2sJUGVL4bd7o1haCkbONRIK8vb
         BWYh+x6CM6KWabHiPmQ0P8eTH5VSO8yi37eCuafLI5idAH33dxKWMU6vxbNhT9SI45X3
         vSoFRZKppzWEIMAhPX/u1r52ZOfQSYnCBlgWcpiD+mX4xhulOFdFu1aAQRpwhOcnZ+mR
         WRrQ==
X-Forwarded-Encrypted: i=1; AFNElJ//mvZUBzMY7XVXSQJPP+Yd28X9h49jxpRhHD+z67kvt2qF90O8TWzoxxe8TD3qJbyXTLdC@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs2/4r1GjCgY9kN9JPM1RDajwsS3B722qRb2gsw4LPI4gPedP+
	mY1DYHzJf1mHbhttRifoavYIkaPwQ949EQ6kb3yiSuCu2Rly0PNUwbp3DlAeW958KcQ=
X-Gm-Gg: Acq92OEsrz5PIkAT3tf3LqK4tnYxa9jHJZo30bi3DqwT8lxvid6OrQ6LYX/iF7CVW8Z
	FPCbB23bTJtg8ERUkSxkH/KC2Lk7hZFIPDjuxiQMes7bupUAzNRXnpj7uWcrmZ2QnJBF9X1Vdd6
	KaKM7mLXAe6fZJgNB6FcBtlG7cEFkB99pPC/N/MdX3Rg7/nLBZKkSoT7KM+E1PybGx8Pdfe4HIt
	UgaYljuJLeR4vaKGan6npxrjtK1wcCKkHD5yeDP3iZtzIkpETV2sXFiWtqk7qbhPXSfno+z3XQd
	/XxIwcdsnD7uPcRK+nr/yciAxEm4SyTA5vF7IYJfKdA52ONdalUwsE1uPM/LmDx50EtfS1I2unN
	I9zn7n/DCTM/f4IgKa4+UWGPbPUjEE59YkxLPEOoDf0y6H7Bj/epxfp6YQgdFHgnzmrOYXx0Y3I
	kZqU5FujDyJlcs8Jli3Fi5jEd6fP6/wzM=
X-Received: by 2002:a05:6300:8088:b0:3a0:aee6:acc1 with SMTP id adf61e73a8af0-3b5345cd84emr6242857637.33.1781043957586;
        Tue, 09 Jun 2026 15:25:57 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-c85df0bdbe4sm19516834a12.32.2026.06.09.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:57 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Mithil Bavishi <bavishimithil@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260604054048.18980-1-bavishimithil@gmail.com>
References: <20260604054048.18980-1-bavishimithil@gmail.com>
Subject: Re: [PATCH v3] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
Message-Id: <178104395668.234140.12825758789646628656.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:25:56 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 03 Jun 2026 22:40:48 -0700, Mithil Bavishi wrote:
> With CONFIG_CFI enabled, OMAP4 can trap in omap4_enter_lowpower()
> because omap_pm_ops.finish_suspend points directly to the assembly
> routine omap4_finish_suspend, which lacks the expected KCFI type
> metadata.
> 
> Annotate omap4_finish_suspend with SYM_TYPED_FUNC_START so the assembly
> routine carries the KCFI type metadata.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: Add CFI type for omap4_finish_suspend
      commit: d58849ac304472fdc75f44c468743d75ca75c2ce

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

