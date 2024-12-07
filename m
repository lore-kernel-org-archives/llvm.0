Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8AE13C690
	for <llvm@lists.linux.dev>; Sat,  7 Dec 2024 12:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733575520; cv=none; b=Lfn7KYXZuIz12tVB1VuIsr1wr91PH+jFVlmjY1yBKQ+AHh09HAJHx+rd08fYYU8Bm50dXQvWv4QNVhgpztb6+zs5gBpRtElU2hSqvXhBRqL/XWsW5G6jDMAm3Skh1Xna6w1BFVjTFx12vdN3vCwB+FQFeqq9Qu9XNh2J4MGjlkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733575520; c=relaxed/simple;
	bh=WM9dhS+XJ8Y/DlkDR1zqqAPj4j/n4NFEAeMDfBwNaZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DLu0RGhOMhgU5i2IFROuPOpG/cCmuE48jJV+HPwvQJaPtuaHwubgxnTGqihDNs+6tFmpSqSlBoUCRP2Tw9X7oKW65dh5lYFsdIVmymrw7gEH7NWZ0Rf6JGVx4gmiVXCpZe0KkpPBxyUArStCTkQmusrfIF1dPbReBD7qoyaMP0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpTE1XkT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpTE1XkT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso372288166b.1
        for <llvm@lists.linux.dev>; Sat, 07 Dec 2024 04:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733575517; x=1734180317; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGQkzKFSDY9TmwP9AaO3pZHfF41YjBH8/yCe8njtTKs=;
        b=IpTE1XkTIf7uKXI1+m40gTMIDskxYyIj+k+h4j8O/gqlnhUZVdYaSvT6MpwddXugx3
         htJ6oKOBiuBp3+Ba9hsXW4Fs20Zw1X9es1YSxn/r5gIDy897HRSKVSsLyq+ajfgR2qpC
         YwKBhmHMwG2oEASYqMF9jGdJf8TN3qITsh+IZveGPEIKbLZxBAB99ed7rQZAyGOHVSti
         Z97gRz/a2p+tFghdc9VDI3O8v6j7fgXTCE4NlZnouL0ohEbmekh6v56kdFE7IFE12vFx
         hI1HldjTsVM7Rq47AXZdNtQaNMDMBx60cd0iSepMGwTKrr5HpPQWN+vtsEFgXjiq/I0t
         pOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733575517; x=1734180317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wGQkzKFSDY9TmwP9AaO3pZHfF41YjBH8/yCe8njtTKs=;
        b=PLRSGI99yvSwt+FGTcb5YPUSBwWKKszXE80mWL33sjVUI/pCW6kqFe7yVBu9zoVI/4
         DMBfrQUYz+33quVf0Im0ft+CjqcJZVA7iAhPRu9JClYkSCtBuO4FCN8Jm81Cngo75mTf
         oWzGTmB4WQhG4jSquhdc3qmgMVzZZWeYOAF7s7EHyySMl6rAWlvV7GSBBYLHFKR70wrc
         mPPXvTsDp9dn4uw2kZn6jJeuX4ilqloPYLu/k29T2HcL33fBuG94FLocqMbtQWZtrosH
         DIWUJfIGDpV3TYZJ6Gfv5fHcK/Ce+kyOezs6lRiAJZtRQFZKJcQUPdzq1N6WnDW77R8z
         06OA==
X-Forwarded-Encrypted: i=1; AJvYcCWnRl3UrRpKbysoye0bVO6mBgTQHS93bTOHh4KrDgWD4/sp3VZ++CObMze+brICl9+YjZuK@lists.linux.dev
X-Gm-Message-State: AOJu0YzIxXipE5eOyKb6AGzHMfdP/wUyV7kRbovCLCLgk6+ciHq0gP/y
	6kLc337SBRHXK1HOABelPyKPa3H81wyGBx0S8ROmWLc44FO2OR7UrTV5dCE7RXPadDuEoNDzbfV
	sh9EbCTeCycRpkuqlw30vlZwrvy8=
X-Gm-Gg: ASbGncsfFmqUOxpfU78PbT68JOcTpH5vwA0DtSZ6yJxZEPq2CA7ybxL7+hG014ic+9c
	1NC8VqonRfpTgNT3nusNT8mFXLNvNKqA=
X-Google-Smtp-Source: AGHT+IFKLT/0vBLq8e4+Q9cBsFCmjYKYarCQPpvMXUHvXes9qzmJwCAEBQoHpEZanqb6oPfHlcskXKrazzFRS2f9zhw=
X-Received: by 2002:a17:907:9516:b0:aa6:1ee0:c111 with SMTP id
 a640c23a62f3a-aa63a33cbf7mr437084566b.42.1733575517044; Sat, 07 Dec 2024
 04:45:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com> <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com> <abdd7862f136aa676b2d2c324369f4a43ff9909c.camel@gwdg.de>
 <CAMZ6RqKzGiRNMeLsQKRNrxvW_bXB-kEi11udQ82kKX6tGCrqcg@mail.gmail.com> <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
In-Reply-To: <9607300dfca5d71ca9570b1e1de0864e524f356b.camel@gwdg.de>
From: Vincent Mailhol <vincent.mailhol@gmail.com>
Date: Sat, 7 Dec 2024 21:45:05 +0900
Message-ID: <CAMZ6RqJGqBqvgxzp5yPFY1pk0WkkwEMM34qU-dZ3kXfsnKaqEg@mail.gmail.com>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of __is_constexpr()
To: Martin Uecker <muecker@gwdg.de>
Cc: David Laight <David.Laight@aculab.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Yury Norov <yury.norov@gmail.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Rikard Falkeborn <rikard.falkeborn@gmail.com>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, 
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"coresight@lists.linaro.org" <coresight@lists.linaro.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat. 7 Dec. 2024 at 17:39, Martin Uecker <muecker@gwdg.de> wrote:
> Am Freitag, dem 06.12.2024 um 16:26 +0900 schrieb Vincent Mailhol:
> > > On Fri. 6 Dec. 2024 at 15:40, Martin Uecker <muecker@gwdg.de> wrote:
> > > > > Am Freitag, dem 06.12.2024 um 02:25 +0000 schrieb David Laight:
> > > > > > > From: Vincent Mailhol
> > > > > > > > > Sent: 05 December 2024 15:31

(...)

> > > > > > > > > @Martin, do you agree that I remove the accreditation?
> > >
> > > So, do you agree to have the accreditation removed in compiler.h?
> > > Personally, I do not mind. I am also OK to remove you from the
> > > documentation and add you to the CREDITS file if you'd like to.
>
> Sorry, I somehow didn't read this part. Please do whatever you think is
> most appropriate (but please update my email to the new above if it
> still appears anywhere).

OK. Then I will remove the accreditation from the  compiler.h
documentation and instead add an entry in the CREDITS file in a
separate patch. I think this is the most appropriate way.

> I find it amazing how much time the Linux kernel community spends
> revising code to make it work perfectly.
>
> Still, I am wondering whether some of this time and effort should not
> be targeted at C compilers and language work to make these macro
> hacks unnecessary?

It seems to me that the long term solution to this problem are the
constexpr functions.

But the core issue is that before getting this support in Linux, we
have to wait for this to be added to the C2Y draft, then implemented
in the compilers (probably just reusing the C++ constexpr functions)
and finally wait maybe one more decade for the C2Y support to reach
the kernel. For reference the kernel supports C11 only from 2022=E2=80=A6 S=
o
maybe we will see those in the kernel around 2037? Meanwhile, we have
to deal with those hacks.


Yours sincerely,
Vincent Mailhol
