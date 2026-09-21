Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BBF4F93C7
	for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 18:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015464; cv=none; b=paaCXEVW/hkcFf/X2Zv5qv54KlC9Qouv7H9xsd+1hVCboIPXVw0d1VZkYhHgfLtQjBrTnfa27jRZoGuCnbk0XRt5uT+SK+v4Ppl9wl3wVhMbxfyaA860xwZmqzbyY6+kE4n+PXW4f7GWaBkyIV6TU13S5Rs8fyBiT2Kl0lidslQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015464; c=relaxed/simple;
	bh=TTaDVJxvd23TMPUHinu1BvIxlfSLR9eQbV5/IV4Szh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fcc+hvyklva1zAZguzN7FyeZqO41DqXKp0btacf5jVi/BE+q9JJ00A7TISdJ3WfLMnQAjnSM0SXOaV1hJMuNzB7h2EV+zpJ6ixjI5Gb/nQDjB9bREqymQ3L0S+OcUO5iIpPMRf5fts1oEfAbwMUZo5h5r8Wo7Qyd6Rnv+w0w8hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlyGFJIl; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlyGFJIl"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a49a40209dso1036171fa.0
        for <llvm@lists.linux.dev>; Mon, 21 Sep 2026 11:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015461; x=1790620261; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cK98X0r3BDRCEVKy2aZh2DV2AxA23p29nMm/EUx3t08=;
        b=GlyGFJIlzBWXwmmFVBNehlj/dBg1EY5phMnujtoEVYF5wnxca0WVECb3y5lqFPwdTx
         Y38xxdb8mU1KtN2qj3IxUmaH988p94kacnO4gfhbReLeSYUYIrdON92lD0Q4Sj9VqNV0
         epcgNzORif6Np+p7dArUS0p16XcWnLyCygEkSfv7XHwvs7k9AU/8UBkqrddg8uUTteIr
         5JX/ig3EP9uCszfykvUsJ4npXgcl6ZKdeVKU6aE2EpJwZ6NIlJ7dw5+H79GAweB8HABT
         Rs3Kd4DHXGtb44GbviE1BAhR5PZHn56h01DRQPi5xi46IFHo49UStsETlWq6W/OnBLzM
         xMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015461; x=1790620261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cK98X0r3BDRCEVKy2aZh2DV2AxA23p29nMm/EUx3t08=;
        b=zbGQ6SnxmAwKhbYuOiQyk+h3RYaMvVSJDdSY+TGncumDQYFI6jhLXj9EsJBuDpnf5P
         YgOAyVV3DgDWbOREwMnt78iUBYvj7dCRNvEe7PQFPJzm3ooVSARsUbaq3/zZj2FC4PZq
         azdi3HYIQw7L3eN6LEEWxqywwBdVROLm3r9RYDnjRnLwj5s+vDVlI87jPt50qqe1YFlB
         sK24W2/+wGAuqMehWyEd+TVSgTe/hA8A29aSVg7p1YBqFR2029ulI0qmiw58JNE6yMgw
         ZJKmV4JfeviHXBi0WiaeqXg3yhE5ozIhvAzTCO4kgKsU7njvtriWTNf+MAsGbmi7T9Z1
         lKnw==
X-Forwarded-Encrypted: i=1; AKwUvBzP2G0hhkyE6Fv7H5+dBqKwimZy/UyBHO1XW5/aosJ4gQO3n9Fm+7pvd6NnRWOPOmGIu1I1@lists.linux.dev
X-Gm-Message-State: AFuF++mfbr0oZFQ5C1Udc7knun00RnnqI9kuOSVIElVEpOeUt4HzDQa5
	t6tfZitq9Z0GJ7LTguB1ilCOhHzpdfZxGu2UjjOl0Z3C9Av5uOaJjJtM
X-Gm-Gg: AYBFou3B6nUT1e2FimSsBztlhqyIgfw0UTkipC+L/MjomzmPK8LPS4ZILzfOdA8Q6dn
	vgqva2xWROOD4QX6wO/aMZzdMH94I/UQnxumWW8HM4n6+LrkhWipMR+1FsRlSCqfllZ2vaQRzkj
	+37a/D51iJ8+C1LknfyvMho+N7zIrRmhM/NO+TJacVmA5dnCxYACWwspyWFWHbEsbEJHwgKnDm2
	wSlSmTJFrE4AwvrmfPSvM2jPSdaBRaivSrr7C3pQ89VwVEsrF5YyzNaFTXFjc93KTs296syULT0
	M8qRTGbRiBgiv+CdQpJW6Fx5xQuqfmtC27WBanQU5wu5+R8oD7u2wR+ikuCMvll9M/pcxM7+LN7
	xVwBCC7e4GnV+yhFRD7VsBtwo2oznrBaBLV0JCL3fEFrOmVnyxsufXQ/tn+rKZ9JdNrkqdR5M6J
	rTPbSTlNpJL3Ulx4G4w5BlootMqY2Z+kAoxiMd1DTmp3gHfBVi3ZkY1EOPVgu8y86rmsS1jrrTn
	yxo2IPzQHCC8kh72Ys/Xj55jrh8506UZv8iGqdrRzQikHEgASpjwtKy1lFqI9tvjrb4qng=
X-Received: by 2002:a05:651c:1474:b0:3a5:d31c:71a8 with SMTP id 38308e7fff4ca-3a624c8eb8bmr1246471fa.3.1790015460867;
        Mon, 21 Sep 2026 11:31:00 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6075fcafbsm23739241fa.27.2026.09.21.11.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:31:00 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v7 07/10] iio: pressure: dps310: read buffered samples from the hardware FIFO
Date: Mon, 21 Sep 2026 21:30:59 +0300
Message-ID: <20260921183059.231935-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178992913316.706584.7705975324672941059.b4-review@b4>
References: <20260918122517.377565-1-zoone.rupert@gmail.com> <20260918122517.377565-8-zoone.rupert@gmail.com> <178992913316.706584.7705975324672941059.b4-review@b4>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 20 Sep 2026 19:32:13 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> Given n is used in a couple of places, I'd keep the handling simple
> by doing it as
> 	for (i = 0, n = 0; i < DPS310_FIFO_DEPTH; i++, n++)

Gone down to one counter, since n only ever tracked i here. Patch 9 adds
a max_scans break after the store, where that form would lose the last
entry read, so there the test moved to the top of the loop.

> > +	data->fifo_hold = NULL;  
> 
> Why clear fifo_hold?  Nothing ever checks if it is NULL.

Nothing does, so the function had nothing left to do and both callers
just kfree() now. The clearing moved to the alloc side, otherwise a
pressure session followed by a temperature-only one double frees.

Rupesh
