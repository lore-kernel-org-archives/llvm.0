Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793747008;
	b=D4MCAov0QiEcnsCoRt3k5ccg8PoctEoGlQ+GQ+Z1WNWGnmWjF0GvUKVoyVPN864GRmf9
	 b1hLGpVMu5YjhJp4Ij6s1OHekjHZHGsEyHRWybcwx4qk+3xwdGVO7gGdnlMGRHkPIxC1C
	 J8B+xKCrRcqC3fDr8X4Z/Zs9FNkaoxvACjD//FYQQ/bonHRMyPidybYw+JVZIxN2tLP6s
	 LhfSBRCjIGBX0tfdogT34xDlIc0x0//CN0QniexUPd4sTNh2c+b1UG0r9mhezQXD2clGZ
	 4ioplUz0J/nHttr0KmnQSoCSOhyfaequP/p0kORARRuJgX3rJgy2CY2BaQtD7Xyuiww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793747008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=l22MxaExXx2RO2+ezWq0CB4Ta82xkRaqq8ZcfjriRS8=;
	b=37PsV1WhCUTBo8Jui+JKbmMRfsG52HzC1jFp2LG8qCjwQErWapk9f/GldE/MxuIA6oQl
	 4wkuZQxFPNwuptuRSflkQLGY83huNbHCnTh8UBl2F85klZ+kEkF5ButXim9PF9JxBKYVu
	 xpkFQjqrZUphMMNY1ZciHmQt1921blM31FyU7q8iNX5a23PkpMe8Qs7KkWFWY4x9NztDL
	 9y3ApUJuFmxTUyiMtBEldJJEODDM1z6QONvVaNRa+OHP+Xtm7pl3PFbHhwUm6zIsr3KFS
	 dWw1G+nNZw3z3hOa9cQWxYhsVNZbySyvOouioFBVjxRyBdQEpyaYLRsvf3Ob+25ZUPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FqdSWJkW;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476B7606A324
	for <llvm@lists.linux.dev>; Tue,  3 Nov 2026 23:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 476B7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FqdSWJkW
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a215e64962so620075e9.1
        for <llvm@lists.linux.dev>; Tue, 03 Nov 2026 15:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793747007; x=1794351807; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l22MxaExXx2RO2+ezWq0CB4Ta82xkRaqq8ZcfjriRS8=;
        b=FqdSWJkWBbFmMxChKnsXxKiHG1PeT+QX2nae8a9sTMebZrjM16Dr6/xCynpD6t+pe4
         kohwnAiHDuuNfijojv++k3tj76yI0GHXU0zS0Uh51JjX+QRrWqtWyVdYdzie4kDze/0c
         OjerjDN+ffgZCKdXFYaMWS8ISvf+KZt4RhcOn/Ud2s8zRmGqeN9TQClMUZ+ejSIpATG5
         gHp5mrHbwwQGLIhVgecPGLDjsOVs567ny4wg0ywYV4/BEKyh/LyEUlpeNhocmV47Es4z
         o1Iw0SIIsnB+yfeHM1EmGszRaeZ6omRuefYbjqs8msNtzpxbGRdrY7u1AcVNt4fniP1S
         HYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793747007; x=1794351807;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l22MxaExXx2RO2+ezWq0CB4Ta82xkRaqq8ZcfjriRS8=;
        b=xYdCDSA484ixMd81UFAG1wg2gmbBsOwM9Q01XuIdO7yeA69DxeVquSEg5lO8gks+sh
         uh4OctQhuN5b2djH3h7fZXfY1V4ISJchdhHX5ffHOt0jieZx5yq3Tc06eLrrvNWb8eMf
         +vOaxXdlv2hkgbmpYb6i4zwnSTKZLdBEnu0RkaTpdBd5+8+jghw/iGvjQcoEzQiRzA5G
         62ySEE+EycFeNdOR7y1p8Ht0q4vunBYKyfzoPPTj6ijipkElS3GDC7fp9BR6mitQXcNC
         I4OzT+5mxrznrPUjeEJaHP7ViMjY/0aAeUXYp66RextbjKi/YMaXa7zstLieeKg612he
         aoJg==
X-Forwarded-Encrypted: i=1; AKwUvBzgX15uA5qDsCTHyX1cHoEht0AQJr7qBHDald4tXPNwMSsKasrzIgl79lRMLPiUOv5ln9oh@lists.linux.dev
X-Gm-Message-State: APuU4Z9rJvR+7HgMIVxuI+BslvmNrNUbNeo2SKiRZJ43Ic4N0eUwdN/U
	Sjqu7Amgfsrg397g/kEEE48LLRVNsu8H234Ttwly6NZ7kFOrwwVGXzFi
X-Gm-Gg: AYBFou2Hu3iW/hxa9iUK8V/UkQTHv/3UAmQsIShcYs2WVzONgajtrGNWAVcwcijWpqX
	CwYNto063PaEMvG9TxObEqCcRKxOa7qfY2GGaN6gOOuBQQaUsI5oyJI0locaiFDnyOIyou/21Ld
	+UTb33iSn3J5VodJWgDKsTsMWl1CM1UHPKyV/IwulXZI8A/NRnSx8T17IdqtItDGzvL2YiagBCe
	JWpe2zKXO7DGt3FEmxwng+TJqzNg+Q2SJSUXNZcetjoJgkkVBkkk+t/YS6QBTsn8zS0mkRQR4NN
	x/TxAwN6Dx9wm6ihXOYRvoQ9E1bswdMuwx2WBvwUzPV/mOiE4uaHUb3uYBnVekDgRvPGC7Yvgx8
	QOrCw/mbbc4R92bCxKDQYlAUJDR3Uu1xuKgIKw98o1PkQ7bfmCVBN7jzI5ioIdsJm+vFPEh59kB
	SuTTtmMT2DVFf7jt4tnIv5jTUh+UphyY5mi89HMjYmdP8oP76VJs6ZNdpn1sKlAd5OFRpMnDTIR
	uxnLoBzgTPH56LmWJS6GEsW40yUe6uSOtw4b3lDSa7iG6qzxX/RPPL7p8u+b+Me5blAP2R2WIOC
	3Acox+q9rZC+GbLoyHGEp7YcweUkOZYmBjdH4cLy0BZ5nm9M7ddSL5TTK9X/zvU0DvC5e0QlZcv
	LjKNxpIy0Rw==
X-Received: by 2002:a05:600c:3556:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4ac187a80b4mr362053555e9.19.1793747006566;
        Tue, 03 Nov 2026 15:03:26 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b452eb99b1sm1703755e9.3.2026.11.03.15.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:03:26 -0800 (PST)
Date: Tue, 3 Nov 2026 23:03:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rosalie Fang <rosaliefang@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Kuan-Wei Chiu <visitorckw@gmail.com>,
 Guan-Chun Wu <409411716@gms.tku.edu.tw>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Greg Thelen <gthelen@google.com>, Yi
 Zhu <chuyee@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/base64: fix -Wconstant-conversion warning in
 INIT_1()
Message-ID: <20261103230325.12fff6b0@pumpkin>
In-Reply-To: <20261103190052.GA267580@ax162>
References: <20261103163404.159582-1-rosaliefang@google.com>
	<20261103190052.GA267580@ax162>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 12:00:52 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> Hi Rosalie,
> 
> On Tue, Nov 03, 2026 at 04:34:04PM +0000, Rosalie Fang wrote:
> > When expanding BASE64_REV_INIT() for v in 0x7c..0x7f (124..127), the
> > unselected ternary branch (v) - '0' + 52 evaluates to 128..131, which
> > exceeds SCHAR_MAX (127). Recent Clang versions diagnose implicit integer
> > constant conversions in unevaluated ternary arms when initializing the
> > s8 lookup tables:
> > 
> >   lib/base64.c:58:18: error: implicit conversion from 'int' to 's8'
> >   (aka 'signed char') changes value from 131 to -125
> >   [-Werror,-Wconstant-conversion]
> >      58 |         [BASE64_IMAP] = BASE64_REV_INIT('+', ',')
> >         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
> >   lib/base64.c:34:42: note: expanded from macro 'INIT_1'
> >      34 |                 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> >         |                                              ~~~~~~~~~~^~~~
> > 
> > Explicitly cast the digit-branch expression to s8 to silence the
> > warning.
> > 
> > Fixes: c4eb7ad32eab ("lib/base64: optimize base64_decode() with reverse lookup tables")
> > Assisted-by: LLM
> > Signed-off-by: Rosalie Fang <rosaliefang@google.com>
> > ---
> >  lib/base64.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/lib/base64.c b/lib/base64.c
> > index 325c7332b049..1489c048b1fd 100644
> > --- a/lib/base64.c
> > +++ b/lib/base64.c
> > @@ -31,7 +31,7 @@ static const char base64_tables[][65] = {
> >  #define INIT_1(v, ch_62, ch_63) \
> >  	[v] = (v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
> >  		: (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
> > -		: (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
> > +		: (v) >= '0' && (v) <= '9' ? (s8)((v) - '0' + 52) \
> >  		: (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1
> >  
> >  /*
> > -- 
> > 2.56.0.385.gac671c819a-goog
> >   
> 
> Thanks for the change. I avoided this in a different way, which has
> recently been merged into a tree that should be merged into mainline
> relatively soon:
> 
>   https://git.kernel.org/akpm/mm/c/3af83c11cf5990fda0bfe3959aa6391ff903ffdd

#define INIT_1(v, ch_62, ch_63) \
	[v] = (s8)((v) >= 'A' && (v) <= 'Z' ? (v) - 'A' \
		 : (v) >= 'a' && (v) <= 'z' ? (v) - 'a' + 26 \
		 : (v) >= '0' && (v) <= '9' ? (v) - '0' + 52 \
		 : (v) == (ch_62) ? 62 : (v) == (ch_63) ? 63 : -1)
probably looks best?

> For the record, I do hope that
> 
>   https://github.com/llvm/llvm-project/pull/226775
> 
> eventually gets merged so that these workarounds will be unnecessary but
> I am not sure how that will play out yet.

Someone really doesn't like kernel code!
There are other warnings like 'cast of pointer to/from integer of a different
size' that it would be nice not to have reported in code that will be optimised
away.
At least the kernel gave up on some of the 'type limits' warnings, they
had similar problems (even inside __builtin_choose_expr()).

David

(I'm reading these unthreaded...)

