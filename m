Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996238;
	b=T0tfQlKa9BeP8yCaQfKs4SPnN5fBe/LjBJ+ZGVjnQmy7R9tabsda+sujNvvsGn3Upiu+
	 a8WaeO0//JqPmXFzDQURgmWVXu2RzWXirZcKtcN96sdCF7HA/jRKxqQg3a2THRjSOW6A7
	 ew7WFkEPRxnPApj4DHNM441Ww80xjnYSJzk4xdWZ6ujcUQpu8oDxUzpYB8/oqrelzOAXH
	 UTNKw9PEpHog1/msM5g/J8y6/A8ZWaMQr6tRslnNZaHw7FhykANFoPdZC6uz88OZVccA6
	 GH0Yp+QBAq6YV/joXmIzeYdipP70luxmzHqcZn2Lk0pXLfNi0EYUHtezMEAyI04jphw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=j+Y2FiNk9Wl9qy2Tngasbxd4q3UxkbbYUIzjyrrCkFc=;
	b=0a2+c5SLciSB6h8MT4eFCOEgsefGY5OzEOMxBZRUszELVYwEryN5wc3cdJcgs/w2qd1O
	 Fq2XQezCUOat/TGpLtyg/AczlCULIGK0sMrlJ9+bKI0xEy0DmP85YoEgL8Ce18TjW1Qiw
	 FzJMejE080x503nGNbTFSiq7SpzVT8iTEb1GM6w4YtCszmeXhnvvRjeQG8ZyE5yisg9Hp
	 vA0rBxf1VLwj06CU84nTz93GUKuPnSb/dMKprv2jV1mvFey66E70zpOJoByvpx6jAGUTG
	 Q/XYKDvwKu+sBtBXX6x/GS7dB14fPsEa50j/tLtOHtmfvI/4qBHoQv5XWVJirt9P8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCsFF9t0;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E11D606A31C
	for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 10:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E11D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kCsFF9t0
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so5372495e9.3
        for <llvm@lists.linux.dev>; Wed, 18 Nov 2026 02:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794996237; x=1795601037; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+Y2FiNk9Wl9qy2Tngasbxd4q3UxkbbYUIzjyrrCkFc=;
        b=kCsFF9t0o0dtKLY53x3rCqBrYEUO/hMg8A/tamolCTGlZM9zZbLrAFl8+3Q8MXdxu5
         JyEoljSeBZmx9etKRQ+T1hmB3ebWx/ZZAB1nJ+Q22ANJJ4JGa6kcG6u5uT0Rm94FQM4W
         o/mcsG9TodulUvxMocUB6/oOwdPOU+vN3dl+R8t2OQq3PNyj+8Qwe1Drg5XAzHtf8wgU
         YScTmx6g6MwzPMLcxU+ylAaN39bneozRs1cJKCgdvotRZd/HczJFAeC2E79sEDValtBr
         ZtQbdeFuShyJcq8QRBvAUn+GaBS4mVvlpl7A504wB5Y/TH22VVKMcgMUV9DpTWzsAqVt
         NNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996237; x=1795601037;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+Y2FiNk9Wl9qy2Tngasbxd4q3UxkbbYUIzjyrrCkFc=;
        b=e52oHxfLllrrOtwbGdwTKIc5IdFkYFAXHZyUN2fGBRKRP03qxGo9oVYzgVo4eBSZaK
         8OPmfi2PKoVy8ppi7lzrB3bButKXL53Hjwp/vX2JgCn6O5wSUsOZ8RyzitCF6egdoY4W
         k1PQR42MLxlbhvoqPG9gERibZso4YBoIq5eCpIvLi97rcSKPMfawdcsxsbOEZmqI4qt8
         M5tqREY0T8BKDUcxudcH7ckk/Z0gCbHVYt/1LQZob6SU0+vNy45acoZSyfoQ+wfppJBk
         nBpCMSFLKIx6wJIQesjK9NsWu0OgG/YdEZ93Dg9IwLHvHtLhVqHgWSjQCGUKPQC7WjvC
         gL2Q==
X-Forwarded-Encrypted: i=1; AL+hErHANm7dArZ2DjZFvkQGAXh9LUwD25isOcTU74W8zp+TAT5baUuUYdY54XTMCNHUUVD9r/cR@lists.linux.dev
X-Gm-Message-State: APuU4Z/bVGuoW9MvN9CIph/qdjyfeY2oqUYV3hAoip+kPnxiyulFHMYS
	dM0s7E4EtWODu3wspkVtlxGNAP8eFMdLILi3fTrFfas28ar+Um+dkrYL
X-Gm-Gg: AYBFou37sVxughS1PzmxpMYTPl1mQ+D+p/MxfuXY22pnjFDeqrnyTQCFe9QS/hRdC/m
	39NwaBzhdTAhxtElvJqe5UqGbPGZVMjkqsemi0x01f5Z6Zbpx1wsNH9yjYuy9ABWijTHgIT1vLj
	PPYu1fhTrVwmjDgB2kuDTPf7C8U0+DZgHBiAM+495pQtd+Iq8MQftvRW+9+cUETxaB/jPTFUyao
	Yw1YbEuGvBnoD5G9vYg2342V7pegFGkQ4VNgc+uUSBHU4D092FPYsuiSnrzi2rPQLy1DmPOtDlL
	1oXD2HYPYXn8wkwnIKq3F41AU/W2KR7apqmx60ptSWTMaUsDBTS8uhla4V3qGe8yCyf1oZZ9KRT
	1XB8UF50N9D7ns7oBHZc4RPBG2Z1Kexym8QGWNwV4JIiYEHjoA0ogENQ+M0LjDdj7woicw4szzI
	Lc0RqD8LPlE+H2cvInCLsb4mjhSlj/ifyRUKLOIIEhfmOnGEzqHVDmQcxJE506z/GoVRW48VQod
	QkrDhIoJHVWJJkqO/NXw93P19Skk2AHY25/g9Gf+K0Dv1e3dnNU/iccRwVcUZKHZYyXoKgIzdKc
	Qy2oPK/kxIBx151q638hfBarYIMvfPKCBzRkiWvWy16Pf6u5nd6R99B7ZnITlsXrsg==
X-Received: by 2002:a05:600c:800f:b0:4bb:5bf3:8ee9 with SMTP id 5b1f17b1804b1-4bb7da4ec63mr37351435e9.31.1794996236390;
        Wed, 18 Nov 2026 02:03:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm242389095e9.3.2026.11.18.02.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:03:55 -0800 (PST)
Date: Wed, 18 Nov 2026 10:03:54 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor
 <nathan@kernel.org>, Ingo Molnar <mingo@redhat.com>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
 <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek
 Nayak <kprateek.nayak@amd.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH v2] sched/topology: Avoid unsequenced accesses to
 jiffies in sd_init()
Message-ID: <20261118100354.495fda73@pumpkin>
In-Reply-To: <CAKwvOd=9pjhCnreMvoAH_0PegYg60ouaZL=BAjB242bE48J23g@mail.gmail.com>
References: <20261116-topology-wunsequenced-v2-1-54611119172b@kernel.org>
	<20261117183043.GK1813469@noisy.programming.kicks-ass.net>
	<CAKwvOd=9pjhCnreMvoAH_0PegYg60ouaZL=BAjB242bE48J23g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Nov 2026 10:39:15 -0800
Nick Desaulniers <ndesaulniers@google.com> wrote:

> On Tue, Nov 17, 2026 at 10:30=E2=80=AFAM Peter Zijlstra <peterz@infradead=
.org> wrote:
> >
> > I don't speak enough C legal to actually understand the Changelog, but
> > the actual change seems daft. Is this really needed? =20

A better description might be saying something about ensuring the two
jiffies values are the same.
As coded they can be different with either larger.

> I would imagine a delta of the disassembly here before/after the
> change would make it more obvious (one less volatile access, which be
> have arbitrary ordering between initializing other members).
>=20
> But I guess I'm also curious why jiffies is defined as volatile
> anyway? I thought the usual guidance was to use
> cast-to-volatile-qualified pointer during access, rather than declare
> as volatile?

I'm sure that guidance was based on the fact that not all accesses needed
to be volatile.
But now the tools are getting picky and needing WRITE_ONCE() as well as
READ_ONCE() and bleating about plain accesses maybe it is less relevant.
So if all access have to be volatile why not make the variable volatile?

Doesn't this initialiser also generate 'really crap code'?
IIRC it is likely to generate an on-stack structure and then do a memcpy().

David
