Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4A412BF1
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022362; cv=none; b=Wxiax7rdI7oeYTbgw86F/vQHw1t2qt5l4B/ZXwpK1NXOVidqPWNfv3W9tgf+oMlWgpAP3NTzqcbeapHKdryip1CFrhHH0xbTEjarHLHXq7vEcGL1chkPwD5rw6Ffu+lq7O7i7IpS8W6SG3sST+Dwp8ywPefXMr7YvlI8uUFhA2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022362; c=relaxed/simple;
	bh=Em/8Q4T5WVyJTc8ied0AfMAXsr9lQ4Pf+YUf8+Llc58=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=md8IeLYXyJHrSFQlTjp9gcuWTDv179Z0+EVjzQozn3XQJ7eLvVPaAbVtIwUtTyIjARrkUF6wvxAbFUvieyiRMTP1os6nZyGxnwFkYC1jvu7JMmHj6oOnjR4MWH++K0ay7Sd/nMW+aJo6/WvcqsJ4IWXFq6n/A+twvHWs9GSLvNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=la2K0wct; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B7PQMvx8; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="la2K0wct";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B7PQMvx8"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 52C00EC031D
	for <llvm@lists.linux.dev>; Sat,  3 Oct 2026 06:12:39 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 03 Oct 2026 06:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791022349;
	 x=1791108749; bh=TsvOMud2kpRikmVD2T66+I1gHy71FYtl6qh7nZPWTPo=; b=
	la2K0wctqo4WPWtHG6E63XtnuP0GoueJk3Nikxp0TPFctyYg965XZpnmz2POBM29
	pT9IbmN/2lXX2ROzM7iGsuz9Y3Xndty6lrUgMuiVvKrvISzXMiF53qoQfVp/Lbtn
	yEgfkFWepUtJLYRf8KCJ1WPpElY88RHcyI0y7POO7qm8XlLQOs7bo1iGNCQWdD4y
	D0bytlW8GNVpL9OXcf8DtvVemjjtsoG1PO/Pwxi/99PO2VrYJSUkkKs5cU2thA/c
	xZeP7HL0T49zaI4wWR2EFrdXe76hdMW1HOIQfWAlqbAYIVMALS+rKLwof5DQHne9
	AHEDcxoFoPtInaKicT0QkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791022349; x=
	1791108749; bh=TsvOMud2kpRikmVD2T66+I1gHy71FYtl6qh7nZPWTPo=; b=B
	7PQMvx8GalMYv1Z2fbl/GxHYK/LGCs1NhEvC/uZ63bCaIi92gDP/Z9lV/gGtPiCj
	l8cDsWVFitayuJxoKGpYDPmrTJqFY2l1naEfooXa9UupBgAvcTpUJ/9kCLqK1go/
	gL0ypnLC9GJLiniJKWAjTDqdjTH6fivg7ACd1bIGkLR4igyOolBrFQUG9ra01lOd
	jTutnU8jCBjsRKMHcEn3ewy8SNI9AkoRcPWR2+1yePEXl95X0EIKfhq4vk4WqHO6
	jHb0t7cy5YIHeedSp+cHSLdnfWJBsHm2tNfnQds2RhoUgMR+6XxRbuHPU27nBktQ
	tTx48+MaZz+sj9ZTnMkVQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791022349; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PGxsdm1AbGlzdHMubGludXguZGV2Pg==;
	s=fm1:rsa-sha256:NiMkGm/P/WKOGhHRXRgSIny8jqkM5KTCwDa2SQkaad93GAW
	rX7EQtEgQWh94/iM1126db9eCuxGH8l1L/JZvHiksG53rnV+qlQR18o9X9DHJxV5
	hXN4VvxKd8yjqZnZ2nShIsYxh6mPN/kFoGcWQY+uaHjGqswyj1NAMCkGrRtA8Bjh
	n/IyTa3K7dDqmjY3/65dyIhGUg1lIXiTmEVLrKoq4HxQ+uVVctZsFc5JRkpyo6sA
	8D5idd9hvGMkjbruRl0esYs17R6QQTlWHVvPtkjCJA26QsCabcemH/gC7qhT10T8
	2eh5Ahfn+lPOZ/YLIvM0tiGVay6dfTKOPS/yTXQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:bSBg07AyJDh8nIznW2E0BJ7e3SFvW04lYLBX16wcRdI=:Em/8Q4T5WVyJTc8ied0AfMAXsr9lQ4Pf+YUf8+Llc58=;
X-ME-Sender: <xms:BNXAakND3vmOHS6r9JSvgH3WBKf8Vx9cwbv1VeB9Eo3RwF7Ry_I4YA>
    <xme:BNXAalypYwt55h3-1htHlDvRcabtYW3afDfKcYR7S81Zg2SbOp_CQMbNFfRFjx7HI
    VDMnQmElqjJOYbVnBLaYKiyhgDa5JtYzwDc154kirSvV1qcwvaEnLeW>
X-ME-Proxy-Cause: dmFkZTFBB7hs3NcjUVHct1drZuqXiA1pIQAz979fbY6M5ydA53D5Io4XIec8GFXHnKC3ih
    0j9MGHsCNmtSvpdgGYBm5WA//Rdnq/6SfTFJT7Fxjye7NOKWuVepnxsBeMpXqIzqLv5YjL
    63Cpqug36HSavId07c3mtDDRfIUkA7OiECcQNefT7QvV5aZPdvMiIE02vP/AifaPn9zGgO
    NPfzVvSmsnHVAJGfbQHPswy219nFHprFzN+2QyEin65K9AMUi9mLMWQWFwEZbYIHybUewD
    8nZwWDFzo7e1lWdrFA0yknag0sNYATtaSqc63mdkJ1Oh32G327MSBwFKBRvsBL5OjheKRA
    shkRUJ+qQNqdYL54mTKI+865Up5tehCG1YK4JKPX1lIeQ/EVSTTj7IAWIAoY70Egs9tB8t
    zs4qWTWdSw2Q10l2Lqb5J0QbdiOXHihiQJBNQCs+LCjXcIuVLN9Teti1EKRil8ZHIpilsr
    scKeuJv3e8kZT8DbTL0m8+BNHuUZEBjgUYxpeYqLZn+cdXeG42J7mcuvKknCGe5sEnVLnE
    YfkRegqaQBYlnnOvYHme+pXvzeAFtJByO/MAWiEJ60IGj6HEmMvj5fz+0JoMd8YsUmMZFC
    JjHA+Z8G6tCgboe5Svw4ubdWibYjiC/axV+qkQ7e5yKghCORCeW0zXndvUPg
X-ME-Proxy: <xmx:CdXAatScP8RgrbtbNEcyop2hU8vbiMQ7Lu8dOi2HKE5aicrsP454Qw>
    <xmx:CdXAaugx8tC2WMIsQEL8dk-HJOK_29OjgecI1a6i5j3KPwVKHtjiUQ>
    <xmx:CdXAahbWR6WER36AkqZy_oh7Ca_y4FMyyGaPPR_QQXGVHaE8g1t95g>
    <xmx:CdXAavXsyFNWArcDud0ELs0v5qj1PvLSNGc1jQ4KXLGzkEk_mQnqMQ>
    <xmx:DdXAan8zml3uyKc9IBaqckjec0I-LwvAjmiL6Dfcrr4kkCVOz-gfiWjX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id BFEB832A008A; Sat,  3 Oct 2026 06:12:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A3bqS_zWz5jN
Date: Sat, 03 Oct 2026 12:12:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>, "Miguel Ojeda" <ojeda@kernel.org>
Cc: "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Linus Walleij" <linusw@kernel.org>,
 "Christian Schrefl" <chrisi.schrefl@gmail.com>,
 "Bradley Morgan" <brads@mainlining.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <1682542c-b5c7-4031-9d8b-7ba1d0a3ee19@app.fastmail.com>
In-Reply-To: <20261003093827.77857-2-kmehltretter@gmail.com>
References: <20261003093827.77857-1-kmehltretter@gmail.com>
 <20261003093827.77857-2-kmehltretter@gmail.com>
Subject: Re: [PATCH 1/2] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sat, Oct 3, 2026, at 11:38, Karl Mehltretter wrote:
> Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
> and 4-byte exchanges there and turns any other size into a link error
> via __bad_xchg().

Note that 16-bit atomics are only in ARMv6K (1136r1, 1176),
not ARMv6 (1136r0). 

> No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
> helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
> unconditionally, so building with CONFIG_RUST=y for ARMv5 fails:
>
>   ld.lld: error: undefined symbol: __bad_xchg
>   >>> referenced by helpers.c
>   >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)
>
> Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
> atomic_t operations already do. This is safe because SMP requires
> ARMv6K or later.

This was previously impossible because you could have ARMv6 kernels
with SMP enabled, but now that Krzysztof has merged my series to
remove OMAP2 and i.MX6, this should work.

If anyone wants to backport this to older kernels, they would
also require d70242427110 ("ARM: rework ARM11 CPU selection logic").

Otherwise, this looks good,

Acked-by: Arnd Bergmann <arnd@arndb.de>

    Arnd
