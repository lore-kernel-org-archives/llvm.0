Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794873355;
	b=zDHJrcNGkwTVcwhQr9usGtcL3kOm07Jp0sjCt2G3mWyqdMZDmwtOAohrchPjYOA/8LYo
	 8u+3cBJ9ZQvrRDIJ1QMz1itGZM4KNwbYYa7G+h+yK11uCH0GxyXOhLfFzbGWniokduKhf
	 xncZ4Ie0hCAsT1r4YA8S4OmERZxRScqa7JneXgQmTah5nktTx8znNf4BOaXGi72v9qCky
	 t2XdVCfqZLaOeStTDFlwInrQDI9ZAKEMzyol8mD7rH/XWJgp4E9iF5uhXBEQOVPon5gsC
	 NOCd5In+mYmcA5pfrCTQmTjbOIuhXL476Akyb+rnP0dKV9sX4DX9yPa/HEG4rTB72qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
	b=tS+8kUii5gcQjM73rgZDDJN0C4TkMvDICWeWV5ZWxnh+fuJlNxr5nFBkc1iqqSLQP1lp
	 i+o7XQ7PCrrBieBwtxkfGnogp75dYu0lFHF9u5GjUlFNFCtZhFofwPAtbFIRZ6ka5Fn8+
	 2buL7rG4swojI4r6guR9TVSdLnT436LH1VtgZ8dssS/0XdksAstiuEHsqhLUVprCSJtsX
	 egkY0s5rqtTn6JmJRgWnWqQdszqgqlAwL+S/k1nR8Zr1TTKzicX0DTlLx0qbHrrB0x/e1
	 NL3/1qsRApEr0gP1cYDVvmOOJ6LHFaHO5/o7pvMcGH53eiVpHf1MBD4pa8NfpxiOgtw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=YxODiixQ;
	arc=fail smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0539606A32A
	for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 23:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0539606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=YxODiixQ
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4adae187d94so3113746fac.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 15:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794873354; cv=none;
        d=google.com; s=arc-20260327;
        b=CLx16RHRDyz8LhqRZuXBAqOzXCaC6BuzoFOli0svoEHRFfdH194WYEnZBmqsNKyMU7
         WBbRaM2pMV5aS4wXHk+7bUb0UebrZDN3t7oLeg7ybJAe5wXefDZoN/gVK+3KUmtgP9Aq
         f32d7eHGUgiFaTmcSKYxKDSxXaxTcE7DqMfenvYA+3TaNJGbpc2L7+nHimPTZdtmjjxW
         dKbRWGPFel086h2tQ55fT5wakM4FuypuEyMfameaT5wjT7nkxC87GumE6NoGuxLLBsPG
         Zt7Do4t5yCTT/8QI/WEnP9vRqqML76tpRArG2JkE693WDaMmKetkY7SE3qkKc6Sijpgo
         Swrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        fh=CLGZ4+mJBV4PyDRaKD+rBVSxJPAjn10eEkwXRkH3ick=;
        b=VaA1su64ZfUS5WvyZXFIJ0T0efgZAL9A5Ep02dGAhy6Rs7mnAWIxbw00V+ZAa3kPJX
         xVkHjjEGchPW5eWXgPKDxVhO69tANDGvlMS5UNlf/gwR/Y5iqlEmAd8rtoNHl+wJceA9
         V4y5vdUX8/ozyM1PItzCDNw+as9Dk3Q81rnv/bENWmEuuAK9zk7iFEBhZ6IKLDeOGYRR
         s+VusQKreLSUhoAuBrWm/qm7nGoO3zt5cHBvkr5qqhfePbNjewh1A8tOyi1kEabjVU2t
         WSF82C3K376RWHuRilta0cRr5nKYtIBDi0F3hs1j3AXwhUxp/xaNSy9euJwxTJtlffBA
         nklQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794873354; x=1795478154; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=YxODiixQ4aIP5tlTEC5dlAeIeFkQqCury/ytmBMOAaITpMc5mjQ25FInThjI09hTyZ
         pbvrwoBM/KEXQwfaNjnJMRP7Ixa+mzAiqiqWNhK3oyjRAyv7zt2RTTA7YIQQWMzSWnAT
         q/RCP/vziT9rMvSiB3qJL7O4qaecWFo8Etzavd0F244wmhFhluLluVDrSP72l7pvqGIQ
         +nPC4/aUtVkZ6Lez70tQm01/5jMhSvWWDAD16CP+pMGHbAWQx7cP8JKQP/U/dvuYKGqV
         UQN5nszeKuLZ/WlO/h+DCXDp+u5cGQYEmq5we5c2FPT1YQhbApWEUFsKkjuELGohfZsb
         Dc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873354; x=1795478154;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pBcsIqN5fGPsZcVWkz3kK83U3k9KWzXvm7Zsz1tEHJk=;
        b=U/bTU34I7Y3w9QqdfUAJIpcBneSYByC+snJWCNXoEDLPHg6uwjk5mn3zsYNANu4apc
         5z+/8EyMiqxk/gZTgCrlgVDA+NMwFCf6nggm8W3/6onGO79uVdhpUa58h+OQnO0HlDUE
         T+GHSvBmYzVwO3a8DpZAswl6nuXpOORmqoicBRS9ZiaQEsifr/xg1xn6jmes03WiECzd
         dGHPuXslcI4Z0qJAciVFgfJ0U+kCuYP1rLgmPVWWNuqmY9t+EWnRk2BiwRoV6VfIiOgT
         GgW8qFvXdzw8Ww9TOPI1pLG2885697kQBaxgTxgly0zXE4FmIjIfCmlQt1qoJ+AAFhNn
         a4cg==
X-Forwarded-Encrypted: i=1; AL+hErFQ+cG20kStpeyGo6mcRvpWk8OP7ke80qg9xyYNrYd6U+LcuMgKB5Y07HJfGMjrhYCCWHVf@lists.linux.dev
X-Gm-Message-State: APuU4Z8JrS9v+FY59IN4zHE5LB5HooRQil8cp4tY+zzg61IOtabn9PMC
	Fa85qaofoXgDG2j2jUEvKE5a0F6WVap6xYO36I49r4rWo1bdOefJ8jh1NX2DF7ASFwtflP6knE6
	3klQMsDdz855P9mfeJf/dJMH1bqWCC+9WlhXipqUokQ==
X-Gm-Gg: AYBFou3yz3Qs7gIZbBAOmuCagkUTTTuT4Ay1pOJ0/1WcZ6SGypIFsEq7PVuTsfIh4Fm
	Wu3rI7P2JD6hvbJDHdDjog1H1/aFJ90OOyKK0P0KGldFkEMHyxL5+X2NXKQegxpChcKwpDRUbkK
	ehbHDNKkUzFj9ncIRgqPBIRit6ZxTKjowfWc+xH9pGh0/TKXN6lhxhDE5iNfRfkAYUrEeT3q3Lb
	qqddNjlNlSBAeHDESovdm7tJcl+AGZb9WXKgslk72XT0Hhkfc9vK7J3/iD4w+EHjZuUoij5eb+0
	87FqXJeYH3UlK6ueaCLlNKNisLLX0qUmmcz5pzro3a3/GqKPt2VGugG7Wd5A/8aM3N7iUnH8NRA
	CgaJtq6b6UGWb8WXAq/7UfzJTVjz9mUuhwZlX34QxhPjWob0L+EVPL8zR45VZasyRUvVmP5Vuou
	YX/JM21Y3sBQ==
X-Received: by 2002:a05:6871:b2a:b0:494:b8f4:9a22 with SMTP id
 586e51a60fabf-4afdf70bba7mr10365207fac.28.1794873353687; Mon, 16 Nov 2026
 15:55:53 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1794281983.git.tianyi@cloudflare.com> <avOvI8xrHI0dwyHj@devvm16445.scu0.facebook.com>
 <CAG4wq-egD55NZDw+OKVKTKN2tQJ9oKEC504wFv=xoMXyJ-0z4g@mail.gmail.com>
 <20261115113902.4834dda6@kernel.org> <CAG4wq-dhd5a5zxQcSShaKifYd2z+pMpHaCYtZJRX1QCxEH4dfg@mail.gmail.com>
 <20261116142710.347e8571@kernel.org>
In-Reply-To: <20261116142710.347e8571@kernel.org>
From: Tianyi Gao <tianyi@cloudflare.com>
Date: Mon, 16 Nov 2026 23:55:42 +0000
X-Gm-Features: Aa3M54oRvcr-c3A5HCcCKnOxqAqDaGkfnfsAP0Ey0SL0I7zgF2gu0s6ZsVqnle8
Message-ID: <CAG4wq-cDYa2GkpWSYeOLwEPv45BtucZk+r=N2b1Srd=gUUO4MQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 00/15] xdp: add SKB core extensions to keep RX
 metadata until skb creation
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf.kernel@gmail.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Vladimir Vdovin <deliran@verdict.gg>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Donald Hunter <donald.hunter@gmail.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Magnus Karlsson <magnus.karlsson@intel.com>, 
	Tushar Vyavahare <tushar.vyavahare@intel.com>, Jason Xing <kerneljasonxing@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Madalin Bucur <madalin.bucur@nxp.com>, 
	Ioana Ciornei <ioana.ciornei@nxp.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Chris J Arges <carges@cloudflare.com>, 
	Jakub Sitnicki <jakub@cloudflare.com>, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	llvm@lists.linux.dev, kernel-team@cloudflare.com, 
	Tianyi Gao <tianyi.gao@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 14:27:10 -0800 Jakub Kicinski wrote:
> The question is _why_ you use it. Let's leave the cpumap case aside,
> you provided no legitimate reason why having an XDP prog in that case
> is a problem. With veth - you are right that attaching XDP causes
> problems for pure skb traffic. For veth cases, however, there's no
> strong reason to delay the skb allocation. Hence my question.
> Why not let the driver allocate the skb if we know that the
> redirect target will need to allocate one, anyway.

Sorry for not being clear enough.

On the setup we want to build: an XDP program on the NIC does the
decap for all traffic. The services run in namespaces, so the packets
must be delivered into them. Some services attach their own XDP
program to the veth, and some do not. The host does not control the
service's program.

For a veth with a program, the skb path has the problems you mention,
so the host uses XDP_REDIRECT. For a veth without a program, we want
to use XDP_REDIRECT too, so that the host delivers to every namespace
in the same way.

In a minimal benchmark, pktgen sends UDP, and perf stat counts the
cycles on the RX CPU. bpf_redirect_peer() from tc costs 3% more
cycles per packet than XDP_REDIRECT with the checksum status kept
(mlx5, one extra __netif_receive_skb_core()). So one XDP_REDIRECT path
for all namespaces is both simpler and cheaper.

> Since your patches are not a natural / clean extension of the existing
> infrastructure - we should step back and make sure the use case is
> practically justified.

Maybe I am missing something here. XDP_REDIRECT into a veth works
without an XDP program on the veth. To me, it is natural that the RX
metadata also reaches the skb on that path, without attaching an extra
XDP program.

Thank you for taking the time to look into this. I would really
appreciate it if you could point out which part does not look natural
to you.

Thanks,
Tianyi
