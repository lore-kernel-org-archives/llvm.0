Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567228;
	b=oIsYNPwgtuMzpxNq/IstOZvL7YtE7Wa3S6nak5zhHN4KPcOxnmtlf9QS8aIXzg3gqNpb
	 3Aa/99zFx/2AIiAS8AtZiv5u8RL9VYTW7Bx+5l4NmboxhmFTva++U2+021XRJLOYZYTs6
	 UEMUvepoLWKSopXHTG+4SEzhTuuPlO1dlMXAwHk7gFEr5BH9WPBjLYnBNUCeO1VZ9Vp9q
	 PrpsrCwhEcCPCffDSxDTsv+F3qeF54AiY0Vr178bt4fl/LSvLhLYO3w4KmiPZDuU8CT2j
	 ktHs0mPrQx8nkER1wdNfJtZzHRZsd/sFL1Cp2h2oAiFDh9u/k6VKZWJHfk3UHAYtA2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
	b=CiuzHO23uhOEPRsbdoL/xqG8ebwZLWC65g9906CMOfGPCo2NyXsjDlHETwXodagI8Qea
	 2GWyS5J7zis5MkBPeOM+X13VmkfmdOGnwLZEOUanpc3S2mEbXFBDurDspiJeXu/etEaVw
	 eeWPgQxt4BbcDqQ4Lf5+M7IWwXlWGKJBxGTXzrwF2ywe9tUHvE/qRa0U8sROHvSgQUKSW
	 TwURRXY1+5ePnpItq3+T+v1iXIvPAafjky6x04lc5MZdxwBWBDHU1HHbbI6l3O/G1NZlp
	 EPrHQCxngMYUwrRPuIqiaKL2TjRBFlBjTT7LUDIYqrkxloJOCaYpNmhXh8jZhi4sEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kbwDX0EH;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD61F606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 00:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD61F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kbwDX0EH
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-38355b03cb8so5050650eec.0
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 16:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795567227; x=1796172027; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
        b=kbwDX0EHGQuQPrOum7P17seK70uqLdhdJUsbfy5rfNum6Eic6IVNXJd1Nww3vXiaec
         9KO0hKAr3as/TNez/OdvuAmAQ65SAcM2Dw8KyEwcR6M7KNkBknnuhiE2R4UEodCWCeDL
         W6QjBlIQRn2nHd64yy+xh9Zgbin3lvhgQ9o3yDzbLuLc+xFO0G57x+OSPJXzzx+zQJ0J
         fW0AP0Sb/xDGbNBeX6PYDdUcbU12Tnme4aTL7jr+2JKYbSdY6b2qERuv9Yi7FrSxD/wz
         LbIiIRpPu+iP+nnFA2IfIZqOiWE/5cNqW+0dbiSLpkgjNepPMxdtH8rOHzE5Gyfp599J
         OTrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567227; x=1796172027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOpg3uSPPiTt8UBdeq8O6ud7wdhrFnrJaDHHSURW9XQ=;
        b=s5O/rShAFP1wVQP+QOVinpl/x4S0Xn8dk8Ic4ENgV/VDTUBYacOcQvpwlANEjcsNeJ
         flcTVgEOZJhfp2Pgq7kXatvz1JXCUutIv4lpbxjg+g5lAfAsu7RQ12KaiBIUq5VnuS7q
         v5NS6ATvPNca3J2eXkI6DI7c6KmC7STBOSwrmPD4alTHau7ceY42ddAPI/x6fGiB0U1q
         j2DrX2A2wapqv5XTu57d0JZ8cPElWyNFzimjH3OVohNcAOsDWhl99eezrXMbTf5w/zO/
         R7HYQWYoOPMAk8G5aGJsOWdPbzIdlrH8OHGpukAfDll73YjMGBiqKC9w4SYUQhdBMGIL
         IGbA==
X-Forwarded-Encrypted: i=1; AL+hErGKwFeWv5gfOsBGJ3iCi+ConxhOkfTq/qJV5im1dJNENs+OVrpiNjU5IQRM3Z6kP9X4Ara+@lists.linux.dev
X-Gm-Message-State: APuU4Z9DZg7ve19bdAEFCkG9K5TPU5ZG4Syml8kRUFV1rqHjMhwoxPsb
	Qw4ZbGY3sWM6+hg4tnDTtr4V1oLxCJXSmx4KaYG8rZA8194i9SH+KLmUIUOMQ1MtA5Au3GKMI24
	XH0dFVwpDdw==
X-Received: from dyhd10.prod.google.com ([2002:a05:7300:828a:b0:386:95bc:ec27])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:2419:b0:367:185e:867a
 with SMTP id 5a478bee46e88-38571027a5dmr18199472eec.38.1795567226076; Tue, 24
 Nov 2026 16:40:26 -0800 (PST)
Date: Tue, 24 Nov 2026 16:40:24 -0800
In-Reply-To: <179540977827.3135.7089774240645592681@kernel.org>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261122045326.19641-1-irogers@google.com> <179540977827.3135.7089774240645592681@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125004024.1004485-1-irogers@google.com>
Subject: Re: [PATCH net-next v2] tg3: Propagate PHY reset retry failures in tg3_phy_reset_5703_4_5()
From: Ian Rogers <irogers@google.com>
To: netdev-bot+sashiko@kernel.org
Cc: pavan.chebbi@broadcom.com, michael.chan@broadcom.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, elkin@google.com, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 22, 2026 at 8:56 PM <netdev-bot+sashiko@kernel.org> wrote:
>
> [Severity: Medium]
> Is this description accurate? In tg3_get_invariants(), an error from
> tg3_phy_probe() is logged and probe keeps going:
[...]
> [Severity: High]
> Can this early return leave the BCM5703/5704/5705 PHY in its DSP test
> configuration?

Both points are valid - returning early skips unblocking DSP 0x8005 and
clearing MII_TG3_EXT_CTRL 0x3000 when test-pattern retries are exhausted
(while callers such as tg3_reset_hw() ignore tg3_phy_reset()'s return
value), and tg3_get_invariants() logs the tg3_phy_probe() failure
without aborting PCI probe.

I'll send a v3 for net-next that keeps the existing post-loop cleanup
intact and simply guards the MII_CTRL1000 restore with a boolean flag so
phy9_orig is only written back if MII_CTRL1000 was actually read.

Thanks,
Ian

pw-bot: cr
