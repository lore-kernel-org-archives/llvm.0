Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987586;
	b=XNKmEvVseuZ83SE3KOSPwaB5Av+TFiP3Tie8lDgtJrDn2rl9fynHHjzfUSrft+oo2HTH
	 1IpismT+P72MM71bPciU4SF6aRvRKvLW8TjswIejZdS156j2HtQbI0IsanSCBENRjVFEO
	 7s1JasorgV0H+7FC7jyZAxUWIH6crfEF3fr8TWq3N/HR1nxFichzku6pFzfesNlhFlWIC
	 Gzka+B2GE0EDz+e5Nvx98FjoBgFcsCllMleLFC6YbkP4C2MJ+g3rssXNkS3GvEPDX/bnj
	 wRZrmZfyQi4+O5pl3X8qi5PoihWcmwTdDaZlzeN+DeYb3nvAmqHh/hBwwqRXyQv5C2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
	b=xihGUuJMwSlojC7YFg1rbXwHeerYh+Nyb18TcOA9+WgV/YRLIHDaJ7pBs/w4AHvFT8P/
	 gl+Tl1ezxv9N35zJnbzPZkG9CiZEcjlXlw8MWviB1eb0Ho2tbUdoLK6Qlf0w/nuvvJjdR
	 Kc7r9XWfAfBy6QlFMWR5OLom8Wrk1/bJ2RLRbotLNLkyaEa7uvmWUoWlWShCAIeQ/KEi3
	 cyL4hXUiLJsLY18D7mmO8EBPcm83izDwEcw3OIobIiyc+Yo7vavaw6ILIZ+aDygSBWAyh
	 CWejumkPIg29gK8RwHGSzfLxal9DZ8RJYJDY5DxOY7eT54smI9khH6zyfrxsEpA+ghQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RB6OnD8m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10C7606A334
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 17:53:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D10C7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RB6OnD8m
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so6309855e9.0
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 09:53:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793987584; cv=none;
        d=google.com; s=arc-20260327;
        b=aanDeuJ/Y6vPR6Amqrg7cHJ/CQuwBvvti39YtvsyZGP2Ca9Fy5cMOk5yW+FPoPhMMW
         skPPUBqY5Nzw4twQUtK+GNdyR2wkfwHeydla/v+B1bNa/pKo/Vl9jkh2544QiVqQGJYd
         Ni54tgo+dOS91Hy6maHVQYXfO86T5doX/+VC6vqchx+iuIde+E7usMD7Qhs4JHYHws1F
         Kk6bQchlk2XH024QSctEUu4WfNRmCdA82f5erEbB1JYkNIhbLbSnTp2tzsMJSqEwgxRe
         t0YvPexzY75sC9RmfsObJK5vJFCk+0VfuLsE0yoYd5zr8ot5O8GAvmKriDdtqOlM1g7R
         0P6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        fh=4VEi+g4FWVSi4v7vzN6tqvgagQK5E/8dVa7sQFKzWwg=;
        b=HLVuIOjhaE36m8k1BPFkauVurP7sorCQmJE380fYOoxaMw4mu557DUjfJCL63ac/0T
         3WEIFzb6xT4T7xOBb6+/pXaRhYQDIwnvmncf4Wlc0D5IDqdNOGbs7We0gSt4RsAZgj1U
         PxNjNaipnYMeV6i82Fqb47wxKhpSb7IjBjLmvD7IZmu4TaIftUlrdUlbjSOKUWaq+K2h
         KWPb2+ZMffevEcUyDEo8ZSUDMQpErLpihUYwtVb3/sOcWqDbO3Nyq6IQFl9iZE8Vv1FS
         JR1zTtaUvnQGh5tc0jGBBWb4xNfWEJ+KtlaXeHBH5G4mdbdO5Odewv4ijVzXnLBjY1im
         ntfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793987584; x=1794592384; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        b=RB6OnD8mvKjoOLeI8Xbl0uddOKUowagGnDUfTX9xrnKnANrKD7Zp+7LGL39YMv/KGl
         jHZ5qSqEZT0qe3Ou9rm7caLpe0pwrtlU5PJ027rh20DZWlHifO4gS4JqDY02cfoLOrwO
         D4R0aIz90tequLoJKCf/667iSsMBckxetg4L7Xw7ec12StxoPP9YN8aETxuf7JwRk5Ww
         14ekV+AOGgbgD43uQJ0aLmG0+i3mphaKrRPVPwRETgcMSj8ovydrh6xy/+fDHz8HFgw/
         ULDGqI4OK3nicqpUn2uZs9gM2ScHpTm3AAPHO5X2E3LQ9GY+laVQ8eHAVolwrG0n81dL
         /zsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987584; x=1794592384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZ43LFlhd+sk5fh/FJb4zHzz1CW3FUt2jfsXu1lejAk=;
        b=FsxQLGIeCF5NQbOkfGvC2WQZfyxhy8aLPyueIJ/TqPURfTp5FJNFctrEtrXhB5ELFF
         zP4EEEQGJfa5xy7dFSWM2qd1A3ezsoQ0oTBumuHwpvYF6bRrTS51CWS9c11bp2wZBAlj
         ZRsLY26PcOlGqcVYOam9mqJcxIsePRlVebf83m+Qs7csbjq4K4RX3CjbvKJ51qhFWb2X
         ic2CNGhqPA18hPORyjjhhzHAB2swJovUGnG2qUhutmDbiQ0HzJoGNC48rdU0p2eOZ/tA
         D03e0bLD7+fbhSd6LMEyNKICqGwubUcscFvg3b611KVw/jSGWZHZMZdirtVugJqXFu6u
         iF+Q==
X-Forwarded-Encrypted: i=1; AKwUvBxwhQbQkFm4QA1Mv0Zks8ALDEwTkuuTVP84UZiYQIxbCh6k9cJGJY2XpUjrZ7WQT1POiOaZ@lists.linux.dev
X-Gm-Message-State: APuU4Z9WvPDu0IGT5HlXDV2hlouFvOBxuaaK+SCDZ5zgC0725GbuR2Xn
	icn+joUJ73zC/Ztwg6wfxEmO+dOXCluhnxPtRq4ClnZHPwYQd64guw6/lcSYYwF+4L55NzmdG3Q
	ysSE7R7gmjVoMz4d1juzZr9lD+pmZuaxha7iz9BT5
X-Gm-Gg: AYBFou0xUnM/cr8M9ULnVIDMFjPqFJOu3QbamhfmnE9HuqkgSEBfXp+OYaJPU0zqQ25
	xhmoPjQJgfvV8q4xmDhE2d5G7HkB2xu+XalWjjlWurb99T/g6pRA1Blw5dRSVUl9qF9TrEL0xtC
	WB07OJ89Zz/AY9YGmMjZE06g6gUmlZOpRTGA/mlM7nNz6I7KGMrWPVTSxrBYIGVWF9C3t8R+Qud
	H9ByqyOOzl+uSbOE2lnkwLWEw7lZWetkkyi+u08tqTJNBS7SXBxDPz0keAkOtjGahRS8Ro0LaMM
	pFfU7tYk+5CV/O6oK9Y6SQ1XBXW4TWHJy7dYTvPNYvcLQp/hGMq6Z+vWMrvha649VF3Ou2mIcko
	5LcFpoFM3oXHks1YnWKoJNPikaWD+Kp50rwYkbnCZTErk0gvo2lOYj1/jTw==
X-Received: by 2002:a05:600c:6387:b0:4a7:9025:5c3b with SMTP id
 5b1f17b1804b1-4b6de1c6450mr56262855e9.19.1793987583819; Fri, 06 Nov 2026
 09:53:03 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com> <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
From: Snehasish Kumar <snehasishk@google.com>
Date: Fri, 6 Nov 2026 09:52:27 -0800
X-Gm-Features: AclHuK9INR2TnwJM3Zpn1cFZ_averI8IiQe0rbAuzb--L9go7NViW8h1McGlP0Q
Message-ID: <CA+aGii5ZbLRMsvOZ=Xk_gS10O_WgjEc=oW9vJ2yYPrRdwpZbZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>
Cc: Douglas Anderson <dianders@chromium.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Just one thing: I think we should also have this flag for Rust so Rust
> and c are consistent.
>
> Rong
>
> On Fri, Nov 6, 2026 at 9:38=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > This looks good to me. Thanks!
> >
> > Reviewed-by: Rong Xu <xur@google.com>
> >
> > -Rong
> >
> > On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chrom=
ium.org> wrote:
> > >
> > > Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> > > Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> > > automatically passes -mllvm -sample-profile-use-profi whenever
> > > -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> > > inference algorithm (Profi) by default.
> > >
> > > However, as Rong Xu noted [2], the kernel's AutoFDO implementation us=
es
> > > flow-sensitive discriminators (FS-AFDO), and Profi has known issues w=
ith
> > > FS-AFDO that degrade runtime performance compared to LLVM's original
> > > profile propagation algorithm. In addition, Profi's min-cost max-flow
> > > solver (applyFlowInference) can hit pathological compile times (30+
> > > minutes or hangs) on certain kernel control-flow graphs when profiles
> > > drift slightly or when combined with GCOV [3].

LGTM. I've seen degradations without FSAFDO too, reproducible on SPEC
workloads 531.deepsjeng and 502.gcc while controlling for profile
drift with newer versions of clang.

Reviewed-by: Snehasish Kumar <snehasishk@google.com>
