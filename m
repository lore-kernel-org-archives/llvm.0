Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53F262814
	for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741855764; cv=none; b=EFqE3XJu+MQAO598raJ3+e6PQ2zy2k5/RaS0LK6aiHnLPwfXWq/3XwzEFfHd7OQqvVi5WD42rzBBh0b5fDnLDhVVO/HMeInQbVQauRdk9zb2hqKecpFAYizh6IKbsaoJgmN+BmJ0WsrJDiC679zFJJkyea3aPr3bsy4EMO2Dwqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741855764; c=relaxed/simple;
	bh=wDdfhJhBThiZUn+0LbZ9lmE9r4DbYfHvlI21cG6BxoI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hL5my8XsneMOxwf8uoR8vDgqUzwHGIOU5f0A3DqfrOXwXj8Dx9vH6u7VKY9mxSSojGhN/2nN5A8f6Q6FbLOi7w62QWkZlSNzizbjzv0AV5rn4DlVa2zS38VZ3R4ALuhyS/AJzHm9z7kbmExoFAVXXKX0s6EWDGDx9lvms4bkcjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dsDWmjAH; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dsDWmjAH"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so711329e87.1
        for <llvm@lists.linux.dev>; Thu, 13 Mar 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741855760; x=1742460560; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH0/G8dnIsLEQps0a+QRu5yJlelIyIdUnSqN98914W0=;
        b=dsDWmjAHdpeuJX1cOID/Ox2hirC9eZ6giz92gaF+MpJPdgN1BpmlKa3IAstbhOY8t7
         AYvJ6ty3VPNyqr0JVSPr0cmEdGA/5vX/VPD/LYKkeVNe9sd12mIzMKiSi9tBG6jpOS1Y
         MQ8HafZR3ixSiQBdATQ3ZRHWBjkabHn9AtR2DAcWPNW7k/cbBWxzv5EZqWb62iEtDYBW
         IfaxBycmBaqNWCxQhmt2j63qkRzMiirrvthj90+IXVgeW1LOXRF6qT3EUVL3gs49THoH
         5LlWDEImO6TKl4aXX//BgzH1sJi7+xTzmXt8qlLrsNByTSDK0rpF6YFYTjcmq2OSOtK2
         iEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741855760; x=1742460560;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH0/G8dnIsLEQps0a+QRu5yJlelIyIdUnSqN98914W0=;
        b=BiyzCAN3b4Y8Hr3Tup6YeujtIW45KXUzcPmwQP+HXLbt+bo0rK3xZfktqLtS2+Sl1L
         OC3YeUkEYMHFLRcTu5KfjzhgYFVwCdMpo2mLVhAIAQ3NhS68oxfH18hVdp1tKpaj2Bwm
         5ttmDNVrXuExOzRgY1lVdWt3kj5+8UP9cuWgK0oHmV7s/udjZR3u9iN6J1Xpfw4+Wmxs
         jUGCUgE3Qh2TX9LOlsmH/2rJozbFZ3xIy6Jh4YQPQDl06PNV+otdByw71N82crxwUho2
         bsB4bYdJoFplSbgmWr6Y3qoyWGqYwBmKoI0EinjGsN0VOXMF3ZwCwqOX1iRRy5lMWEbQ
         eTAw==
X-Forwarded-Encrypted: i=1; AJvYcCWJ+HFIiCtDGmtsftZWtamzd4E0TKMq+YqLMVDv9JB1EOek1iY7BeoaCCEqtJeDFTHO3LC7@lists.linux.dev
X-Gm-Message-State: AOJu0YzwYRQe7MCdeBsbXALW/6hWkzDITEL6R1LlqE+BF5Xcg1nmNZbS
	Y/wLL3+UyywT4i7a28T7OhF+CFFGVvP9HNX1gQOoTKvdbMCr87Hcz6Aqq1L+U6M82KRZ0y8luHz
	IhDnMLOj23GwrcY9evmBu0ddKZJFYy4inQ6xU55EXM7rlMNPbGEHXQA==
X-Gm-Gg: ASbGncsPZTzwOEV+pckI1/FxiDM+aszh2GJU6x8oSYpOemD4RyQpKkmTZZCX2eW5MsG
	fsjiP1DuBivZnsJBThkC1INfASo14AQQCQjhDPKzjLrRAh1C285wVqrJXLy6xZQbENM23ObSrf+
	WPYyLu0HPTxuCQwpCwTInK4DcIWA==
X-Google-Smtp-Source: AGHT+IHZkAfEyI5h1xNp9EscwBtm7RYtlJrFqFkZLqQeebsL2P20q1EFV/vAiiJ7hbwVCtlIBk24ytpLzUux5mvsmjw=
X-Received: by 2002:a05:6512:ba6:b0:549:5b54:2c6c with SMTP id
 2adb3069b0e04-54990e673f2mr9060936e87.23.1741855759797; Thu, 13 Mar 2025
 01:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
 <20250311-arm-fix-vectors-with-linker-dce-v1-2-ec4c382e3bfd@kernel.org>
In-Reply-To: <20250311-arm-fix-vectors-with-linker-dce-v1-2-ec4c382e3bfd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 13 Mar 2025 09:49:06 +0100
X-Gm-Features: AQ5f1Jr7N3AP_OP74JY7L1V0VadIJIbOxnWg4sgQC81ix5N9CYiTFnZob5PuCj4
Message-ID: <CACRpkdatTYZ9oxSBdjTbs-LjF3ONqcA-9vYojPc-KSGZmoEO=A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: add KEEP() keyword to ARM_VECTORS
To: Nathan Chancellor <nathan@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Christian Eggers <ceggers@arri.de>, 
	Arnd Bergmann <arnd@arndb.de>, Yuntao Liu <liuyuntao12@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 8:44=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:

> From: Christian Eggers <ceggers@arri.de>
>
> Without this, the vectors are removed if LD_DEAD_CODE_DATA_ELIMINATION
> is enabled.  At startup, the CPU (silently) hangs in the undefined
> instruction exception as soon as the first timer interrupt arrives.
>
> On my setup, the system also boots fine without the 2nd and 3rd KEEP()
> statements, so I cannot tell whether these are actually required.
>
> Cc: stable@vger.kernel.org
> Fixes: ed0f94102251 ("ARM: 9404/1: arm32: enable HAVE_LD_DEAD_CODE_DATA_E=
LIMINATION")
> Signed-off-by: Christian Eggers <ceggers@arri.de>
> [nathan: Use OVERLAY_KEEP() to avoid breaking old ld.lld versions]
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
