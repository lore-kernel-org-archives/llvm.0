Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792482645;
	b=fJulySxIpctC5nmMrYngRR97KZbToSAHMdzPgGfjafi7bqXplbZI6AlXXsii6Ei7b5c5
	 bY9GoKuKZR4HDSiDhGS3VRcJ4Tmfe3yPBQuQQ2qoPhnpzr7eZ61whSZ8ebfnYoqDZwAiN
	 lc15my2VxrkleEVzNYkTpV70JjACnE72Otzm9b4JxZ8KICcH9x7+rdsLqqiXj8nLWEIuO
	 /SdiNUyKvSAkgvl08L8z+CqOvb3AwtBdVXCMZPex6qCFOsBP5mjPRagUadl8OLiukTzQs
	 YeaclLAtJijpajwBlR/kLuwDPspAJefdXU9NtS8HIxQ6EF7otE4ztMDCIt3yAH48Skw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792482645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
	b=C87vOj3QtPkk8jRSZkNymH9uFZfgFYlWkpykxKNXzos2ThSveSA8yWa9bXOvuYuL/7Ex
	 czm2csjNU9ZS/buBtCEhwWnQ2NFbtrnKFj5xpWuYvZvaIu+MfAJIOwmBIZ5EWlQgV7/OR
	 S55UIuFWg0ySThi09clgTyOCqBJaAAbN82PbICJ7nlI3QfIDZfSNVrBAJD/ZR/oJd8C5L
	 G5iW+B5tRhjoiMVscLDsd8qN66K4SMCT4626S6p+cPeZ3ahOeNRqejoRnuTcUtj4/5U0R
	 tpz9WPNMvwTixFrrxd/6pkgXWgdXOtTtfW4ZDfHLIEwN58vqVyElRFlGJ37XftWvWYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oaTUK6MU;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30736606A31C
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 07:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30736606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oaTUK6MU
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b0584ad71so2041763f8f.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 00:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792482643; x=1793087443; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
        b=oaTUK6MUPy1poFSN1qe95LcBIXtUhnN2xNEdUVZIeKLJ1e3BQrkMqu3YM5rc0PXmsy
         qMcbAOAwCfdRAl/ji3zpsPg17ZEzuX0shY845Uh7ZO8TXrjYb3BqRhSv46oJsiwBr7in
         xdr4Mij7549wW7y/lE8wS6OKtENJQRvyCqTxkfcwB8kqVLfoOcDKuEWpz6Uy404UxBbn
         QnFaWJXbOV7qrpgGO1kQNLThOS0TaEcTp/4K+dAIxCcl8/ufqFT5ijBe3WME86hPTtkN
         RxqfrR0RylJnGeqBVXDwIloK9m7Fpp+WmEKb4Vg075RLs+FzeJ6NC15+8BABy8dVVd0x
         xcjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792482643; x=1793087443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sA34k/OHNnDaVB340gpRDLf/E75aOs1zHz4HrHbZ028=;
        b=cVfWygnHrrQ1Tf5rp5PAKwjbMkBANUDoFuOBMACTVOIl1+7V0MyGzLAQoKj5n6dU1l
         AMYWXugdHYA0n3vciCnwpgJ2GnSS53Z/ilzC84HRBGPwaciccx9COS/CuxwhCdtuf/ux
         Zg1PwPhjpk3bgFDmURnztF9UYHssEDnCCNsh3/BKnp474Q+2TGYYBzWIwV7iwuyEIYha
         9Ul3RjXCcpAPMr+hzTwe0Fjnby02NQ1FPWxUesBKMVnlbcvhyYSBvaFqPchJpELoq9Kt
         FJuSFn8uGL2WDw+dtFTfWXcP4CyI6rnC2+1im9N1NhkmTJaMK7pei8FIQG3zWdgtMCXu
         zsKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxeaII8wAzpb5eKXsjGHW/X1XXrMvwfv0bwOEMavTD9wGFz637gthmnYlw3bpBqir/ut9PT@lists.linux.dev
X-Gm-Message-State: AFq9FYLRLx4TCoXbJDr15jjSquvPQ38d0pcsq/InTWbG4QOYflWQIqmg
	uCeAohI12Mvb4NWGnmE27r2nenIEdOP3RD1s09+8zExspLl5CwyOkFihXLq9SA==
X-Gm-Gg: AYBFou2rud4ftRi/L8iLP3rQ3RXH2tNizAtNOAgIfMhYEpxmhAmWwkgJBI9NR9m6R+T
	PNd7BbqPWaJw2diu1ZjrvjDMFm3kx3r2TK8NUvFaKoH8KIW6VkPEgVWO3EsZzVZH8+y1hZUtuyw
	pInmZEEa6OMqk5uTsIu5tGTz47FZe8zONrQ6TFYJFgLyebLnUxH/KT/ZYm0QnZgTLXP9+YFgtYI
	T1PFIxlBSBUvdSftlu6pgH/hMhkhZqJJBZFwP0XRu7swsttDut/WTkiKriHlcrBwBJNldp/lz32
	0NG0NBG+4GwIDPXFtzWIimHv49GHKVgEH2ams2+tCJGf2LaM9suQdjlyktDUBThrV+NZyVqbMeW
	h64AXYZDXmSTTVnyvvEMXWM6pEO+sJW6rUyKvvB/BdnyQvgjoqERMR8LU3WbtwHc4Vcl25qee1j
	qlG5dokcl0ForMjV5r2I5+/ky48oHn6KU1DcCc7MxogvhE58OpSM137e/kfU9FIwDPPZjIBIFPI
	PFQ0fNR8W3GJn3VgUvQXwJJ2YUJgqc48EBqVbuUuPbwxooG+LT375v2lRgTSMmnoLLVY6gED/qK
	shWRb9nVyD6s8CHyuN++/Z5JJfUYTb9blq/e7lUgOI19w+HbZN7WL4ozTqmBOu1XnXR15y1B7X3
	xyGuyeuD8f9Zi2YIYTqEbLvwMlcUdkXX86szLXG1VEDKtYvuloCtdkFJTolVIkpsRtme554Rx/D
	Lwst4H
X-Received: by 2002:a5d:6391:0:b0:48d:c178:f6e9 with SMTP id ffacd0b85a97d-48e07bbd618mr15587418f8f.20.1792482643365;
        Tue, 20 Oct 2026 00:50:43 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8185d2sm4581409f8f.28.2026.10.20.00.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 00:50:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:50:39 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jinseob Kim <kimjinseob88@gmail.com>
Cc: jic23@kernel.org, linux-iio@vger.kernel.org, dlechner@baylibre.com,
 nuno.sa@analog.com, andy@kernel.org, linux-kernel@vger.kernel.org,
 lkp@intel.com, oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH] iio: osf: avoid a large stack frame in osf_core_init
Message-ID: <20261020095039.00004c88@gmail.com>
In-Reply-To: <fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
References: <202610191514.fRYyu0HX-lkp@intel.com>
	<fc593496353a60a15fd5ef1a2786d41dd9bdff3a.1792403576.git.kimjinseob88@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Oct 2026 18:58:49 +0900
Jinseob Kim <kimjinseob88@gmail.com> wrote:

> Clang reports a 1344-byte stack frame in osf_core_init() for
> hexagon-allmodconfig, exceeding CONFIG_FRAME_WARN=1280.
> 
> The aggregate assignment materializes a temporary struct osf_device on
> the stack and copies it to the destination. With the mutex and caches
> added by the IIO support, this structure is 1328 bytes in the reported
> configuration.
> 
> Clear the destination directly, then set dev and initialize latest_lock
> as before. This preserves zero initialization of all other fields,
> including when the core is reinitialized for a new session, without the
> large temporary object.
> 
> With the reported Clang 24.0.0git compiler and Hexagon configuration, the
> frame decreases from 1344 to 8 bytes and the warning disappears.
> 
> Fixes: 7329986669f2 ("iio: osf: add IIO devices from capability reports")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610191514.fRYyu0HX-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
