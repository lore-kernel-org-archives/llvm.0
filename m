Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC0F32ED31
	for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 21:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764020579; cv=none; b=IVbHTh0XH4+q0byKcY4JKBqJlq544+2UtoB2rR7aIc5HYxR9Z7L4aBvD+e4/a7FxPO1AEgTGaeEnqpjl+GLSLTf+YF4dJ5+utjxQ234ctJCQ6+fkSIQNQZCZug2qR56aFWYRvaoA+NwmKt/n2HSASukl8HvYc9erNynWh1HGV8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764020579; c=relaxed/simple;
	bh=21B8UNo59KNJ8qFUDnUl8PBh72Y8QaDRJNTNf4wTI1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJhBLjnPAPmzNOEhlIhX+38Uuhr3tXp+qp27G8SEZbH5GXZ09gIUNWxxoZBQXCdL1OpyEuKAIqZBpziXEmlOBUAYED3tuWjwNQW5jVY8aBHWypvkvIo20HAutHAVSed6skPRuzfhNOTSCyEOeEHutkoYwDmgcD9BRmp1hMWs1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QJl1xmkB; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QJl1xmkB"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so7477707a12.1
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 13:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764020575; x=1764625375; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NoAYUzaUy2oENd7JkoqDPVCvDLLlV10MU8wdc2FsfGw=;
        b=QJl1xmkB8hVoH5WYvIGyaTn0gtmORmqjQ/18FKr3FXqHA5VBfABI8A/6PajqatVRFk
         bvdFmg/askjoG9m8A0f3D7Uom1ms2uUfa/UfzQHEQ8iv2+euWi46vMG/GpGpafp/L3EG
         Ov9yTLBpvxqSflaCVe3KZifoUq2Kugw4tPwDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764020575; x=1764625375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoAYUzaUy2oENd7JkoqDPVCvDLLlV10MU8wdc2FsfGw=;
        b=fBL8Pv0b56cKRlon35O/cXlGDwsokHzLYcrm3o7esbhVEEVEMdVt8UDMcoAD1dkTtL
         a9X2aqj4mpe+Vf31KwbGaUEOhJ/zMtT7S+bH1M0aIjgFd7mYkSaH7Hh7THn4Nke7ydXR
         L5Z/Oa2rPALrDnE/WnrpYbIyReUDWgWx/THmak0L8B07b9Y2WmBI7rzzd2HNtDcVhL1a
         FIxwzGgjgAwo9tE8FQhYmFgOq+I/ojaHJYlunBDU/FBDW+W1Nw28SNCd/6mPLRnIUDat
         OHVpS5sSZgvOg6gcG4ny3IAJWjhb7bm0hYrCfW+MbNcPUxtjmNr1mUHB7Obt1rp+1R6G
         Ojpw==
X-Forwarded-Encrypted: i=1; AJvYcCVu/EuGgVWfIFy+T3S7YXwXdB6n2Ld9GBSnscGbUdspMh5JRafvJmkH9aPKAchUQLEf7vcO@lists.linux.dev
X-Gm-Message-State: AOJu0Yyqki+Q+JByDDNrKIZjYYgVRoIi2ExMaR8tR1E32FJdrMnsfmCB
	mjgqj+owSYOZ7nOCQ9yhgsESQop/lvjOYiVjsYfyHE23G+/yOqC2RiDrZorkcs3nxHbaMmNX9zQ
	SkkESn/U=
X-Gm-Gg: ASbGncsdynhw0QGCc6BpF7PzEcjZM4kco+i7SxRd4Ue+06/lyBMuwCc312DxgU0Mc+B
	NzpxKsS+EtOeur2xvrMHWHnP+CGmPe1C1nbS7T278AKfxVFSbnTxb42o3TcRi1GaAWhLYrsrRSt
	UdmwkgNCcIIbXMTGlguedDlyxC02NfwUuYdPg+4fe8a9tPOwqsJ4pz/tZaKn1MLT0tSVclJZUZM
	l0GrbFMMYHmTGqFh4kPhCNh19vae3UlASWxZNeg2nHUCgQG90TbRQ/UVySKUZUULvOW8kyDHlRr
	5gVW3GMMbXmafwV+Bo7ZtOd6uuuusiZWMO6PeJEw/xmP3UQHL5zkAoJ7kG4rUs4Iz9UaxWPAJ1V
	hIKMbFrvlx0ljimJzToQ5pGpCwQ+PAIZ/CaqBFm9g2KTVcBugfPm+blGUYC6R5mmJLVVLyUpEwi
	ZrHEkfSb4Jll+2uUrU2mMg4FM+jKb75gpsXFT0dd6oNrKcmHUgMaLSe4KLew4w
X-Google-Smtp-Source: AGHT+IGifckWSWF9f+mEsmmeUKEU2WkaApUiBNNw2c6h8usmjh3FrvhDYj9w5kmYEblq65sBFcxYtQ==
X-Received: by 2002:a17:907:d16:b0:b73:8903:f4b9 with SMTP id a640c23a62f3a-b76715674b2mr1382334366b.24.1764020575285;
        Mon, 24 Nov 2025 13:42:55 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cefeadsm1412625966b.6.2025.11.24.13.42.54
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 13:42:55 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b7355f6ef12so1013359566b.3
        for <llvm@lists.linux.dev>; Mon, 24 Nov 2025 13:42:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXG56HtLTokJ6eE6JZT/FQKQc3aJpqu1TQ5R1ngfC0XCzEGgMOcBFeBdlt2LkerEycXDJr@lists.linux.dev
X-Received: by 2002:a17:907:dab:b0:b73:4fbb:37a2 with SMTP id
 a640c23a62f3a-b7671514106mr1495344566b.5.1764020128744; Mon, 24 Nov 2025
 13:35:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com> <202511241119.C547DEF80@keescook>
In-Reply-To: <202511241119.C547DEF80@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Nov 2025 13:35:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wikqnc16e7yUTJuqnc5f4rL+y_-JpRzCLRu9WPnt3nmiQ@mail.gmail.com>
X-Gm-Features: AWmQ_blKFpIgLGtxfT-s5R89X15xCb9TiduKsCJf35qbsynIOkmHF3dcQigtmSE
Message-ID: <CAHk-=wikqnc16e7yUTJuqnc5f4rL+y_-JpRzCLRu9WPnt3nmiQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] slab: Introduce kmalloc_obj() and family
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Randy Dunlap <rdunlap@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 at 12:39, Kees Cook <kees@kernel.org> wrote:
>
> I'm not sure what you mean by "limit to pre-defined size". There's no
> such design in those helpers, except from the perspective of "detect
> and refuse to truncate overflows into too-small storage". Is that what
> you meant?

I meant that odd combination of checking both for minimal size and
then assigning to it, but upon re-reading it, I realize that the
"check for minimal size" was actually checking the size of the result
variable.

Those macros are illegible. And 99% of all users DO NOT WANT ANY OF
THAT COMPLEXITY.

Yes, the wrapper macros then pass in NULL, which then - using yet more
complexity - turns into a dummy thing.

Basically, if *I* find those macros unreadable - and I'm actually
fairly good at parsing those things - then they are way too
complicated.

And they aren't even complicated for a good reason. My alternate ones
did *more*, and did it with less code and less confusion.

And you added the complication to make the users less legible.

So no. We're not doing *any* of that. You make it simple and targeted
to the *common* case, of you don't do this at all. Because that
over-designed mess that actually turned some users *less* readable,
but one line shorter, was bad.

                    Linus
