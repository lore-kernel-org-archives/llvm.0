Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BCAC2C81
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 15:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ECE0C93056
	for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 15:26:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="fH4FAr7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1637940397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipM/TXyq3fa2xD6xL+IODfRBAa1n0lqHCOEC6lhGz2w=;
	b=fH4FAr7ax00biFRspLsNjb0ze3JPDHFQiXw5nz3dCryky0GVjtS7odrrBG4SXFEnuMPupb
	C2rBVxwhqhzGHZtfe1Vkui9Kv/3RpHXES00WTFF0HitxpBYX8DbwD7DlSx07p0XbnTXy7w
	obXYs76FMoUXfcO17O5JJI58FIkJK9U=
Received: 
	by mail.zx2c4.com (OpenSMTPD) with ESMTPSA id 0e4fc1b2 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
	for <llvm@lists.linux.dev>;
	Fri, 26 Nov 2021 15:26:37 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id x32so21080400ybi.12
        for <llvm@lists.linux.dev>; Fri, 26 Nov 2021 07:26:36 -0800 (PST)
X-Gm-Message-State: AOAM531VQTA6E6/oWwC9D/hV90g+YyCOGKffoxDR1wEIsyEjA4uWeBBE
	jHkBN439Hf5jQ92D7bJrva6sMYK2/7JIuu1zJdM=
X-Google-Smtp-Source: ABdhPJz1jC7tzRI2Jev0YFMgIakMjnOGUeXIERuvNVU50Dbr302WyOqELo2lVx6sJzZ8S49+xbTN3CiBb8Raeb2tmIk=
X-Received: by 2002:a25:acd4:: with SMTP id x20mr16477398ybd.416.1637940395629;
 Fri, 26 Nov 2021 07:26:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211126143329.2689618-1-arnd@kernel.org> <CAHmME9rotnZRzqeD43FJmSX6-i2CwvUVpXHrFkLGt+qVVdxK7A@mail.gmail.com>
 <CAK8P3a2KfmmGDbVHULWevB0hv71P2oi2ZCHEAqT=8dQfa0=cqQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2KfmmGDbVHULWevB0hv71P2oi2ZCHEAqT=8dQfa0=cqQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 26 Nov 2021 10:26:09 -0500
X-Gmail-Original-Message-ID: <CAHmME9q3ihG6OukcbhgkzwMUY7y+N3tKrGu2aRHjkgmAv4j=WQ@mail.gmail.com>
Message-ID: <CAHmME9q3ihG6OukcbhgkzwMUY7y+N3tKrGu2aRHjkgmAv4j=WQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: siphash - use _unaligned version by default
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"David S. Miller" <davem@davemloft.net>, 
	Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 26, 2021 at 10:18 AM Arnd Bergmann <arnd@kernel.org> wrote:
> I have not tested this specific patch on all platforms, but I did
> extensive testing of the get_unaligned()/put_unaligned() helpers
> in my rewrite earlier this year[1], making sure that these are NOPs
> on all the important architectures, and that they prevent the use
> of trapping ldrd/ldm instructions on ARMv6/ARMv7.

If you're confident that the codegen doesn't change for ARMv8 and
x86{,_64}, then:

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

We should probably Cc stable@, right?

I'm preparing a patchset for DaveM's stable tree today, and I can take
this in that patchset.

Jason
