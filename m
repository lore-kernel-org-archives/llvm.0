Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064B1D5CC9
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873489; cv=none; b=KksiGOr4nSGUbWpdNNDy41tXleMisVL7rSFV2JSen57DCGqVPJ3bru/2FTWax7g3GGFEh6Eyv4miJM3bW+6qogN54ev6SQtAsWskf74081bQhCFRqZv35kHBlq3n2F+V8Y5dhNGBlqMH+AYnvdUbPPXl2VIen73fxgCCvVtSIOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873489; c=relaxed/simple;
	bh=mA3ZR1DLbQrQkL9PKCipYpYPc8aTCrcmFCztxVCijFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bKzkwHwEqYJPfJOsY7PgS8KLfDtSYQH/DAhv21bXHt2qMPqSdDoSnftI9tuDz8Rp+MmYAvALE5YcvEPaxIQu34/IiAka1+ajfcKeDKWR54mHIy3Vx0+jMlLXu7Sd7N4VBKrlD8b9flrhLMwPbnYEbdLW8Qey1UbrBfFkAuWEvwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4645dde00a7so3988507b6e.1
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 05:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774873487; x=1775478287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woUempTeRL+MJtlKxpfNaT94H+rNPuTZjIMDTveSMCs=;
        b=Nr/rkQxOLH0KUiy9wDAUM4G2Mgtb/nrG1zgYsvh6AQ3kh2UBseQbxy8EgvRElANm7D
         vNFCUwXml90g0EYrfixWG4h3D89q4QbCeTwS++8XUE34eDXNos+b9spDfcf55lkFoNKU
         7cvwEjq3175rEY/V1UM+KlWJITxAQ9tnRGjb8qzFzbdruxajtivrgr/4ou67ylfTBKvo
         38TqB84kHTDzFn78KeFFTI3IvjYNGjXaF6rtoYHWW+E7VkrgUNxn0m8gade5Y/3UDnJb
         1en6xmq+/vGiL0xjTOAB5teqthosx2w94wZxVqFWKUAC2XkxWaOtO+bjq8PnLSggVMQO
         3U7A==
X-Forwarded-Encrypted: i=1; AJvYcCXIPo2QqljfasL2BGL3/ruPd0dTKiu65iVloBX2s5fRtJ5HiLZHYPEfrv5SibgIDm8YGwD9@lists.linux.dev
X-Gm-Message-State: AOJu0YylyJJfYeCa+6HVXalcI70/pDJ3W5bwzVNBDNwNkKNRSGmFF9Y2
	uF4Vr6RE8319innENWzjMwYhAt59Ss/rRsX0wkcWiIrbsmsGB8umJS0GR8FeDZxR
X-Gm-Gg: ATEYQzyCLoRMRd9dFm3aqvIg3+ff5dqIkkCMnyc/dYtJBj59Wq2uiS24rkHgCDy+7JF
	ehLagtBIaX15agYmhtk1da0OsDGaMZVDPbv78tp0/IgSmHyEwOWAVMNBVxLnZ/ncbZYg+57w48C
	mhaPhzX6NmrKEye7Bw0zFGlPa/KVck7o2oKDVBWmcR6nmtbo2XUU3iBTJTbwZ6xn2UBDZOUqVn5
	ZFXW1jOqBWXJzN1B17PZnS2Z55sKWI1UsINFx93rNB/s8rkLZ4IHt2b4b3R5MFcKmFgbXSvfAca
	ID15Cco1ksaPdr5U5pfWG5cGuLRNldforL0tKl+egeFxjkoERPOpB7kd6hdFybtzdYtPn4NIZIv
	PdMvOdQdAmNr7fR5ub6DhCkLVT0X+62oOu3itdPF4uP1R0TD6kVpYHRxyvKp2Y/texOwzQFl26P
	5QqCrbVVPNfi20jL/TIf2L+ChGyw8HNNWyL4P8chWPv5TwVT6pXKw8C/Y9HsC3
X-Received: by 2002:a05:6820:826:b0:67e:3251:d70f with SMTP id 006d021491bc7-67e3251d9damr1592271eaf.4.1774873486566;
        Mon, 30 Mar 2026 05:24:46 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-41d0494be33sm4969184fac.5.2026.03.30.05.24.46
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 05:24:46 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d1872504cbso4328230a34.0
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 05:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVugt+vX7ng/Kv1lHc0zKB6bI2PQ2AVBa2AY5PfRhYMXpgt46lWrkbKJBNsCQWrBCevaK+N@lists.linux.dev
X-Received: by 2002:a05:6102:4498:b0:602:896a:84ba with SMTP id
 ada2fe7eead31-604e4df3704mr5271926137.17.1774873037674; Mon, 30 Mar 2026
 05:17:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
 <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
 <9cf5a94c-0f37-446c-b63d-ddac5674d220@gmail.com> <acVOL5Psz6kHlhq2@shell.armlinux.org.uk>
 <641592e3-2354-4238-9eb8-a1f5c2a13126@app.fastmail.com> <CAMuHMdUUfVCBZFi2WoOYibJLVnyPY-joRDJDowgHwjN_DGeEzw@mail.gmail.com>
 <93439e91-cf81-477b-b880-a813bb01ad7c@app.fastmail.com> <CAMuHMdU-+dm83TVttfarT7QxE5ySpQ2LJ_k6oFKMWRcbaWcCdA@mail.gmail.com>
 <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
In-Reply-To: <26d690ab-d68f-401f-ae2d-7aa4de081bce@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 14:17:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
X-Gm-Features: AQROBzD1En3iKQ5LsAPqOXpbj6O32MjUPo3QPwr0lgIQkMqaR2Lx1_ZSwol-K3A
Message-ID: <CAMuHMdWDy9mNuzDaYfE6r+P8MSTBEGsyRzisLF_d_FWX+6qCVQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, acourbot@nvidia.com, 
	Andrew Morton <akpm@linux-foundation.org>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, David Gow <david@davidgow.net>, 
	Gary Guo <gary@garyguo.net>, Johannes Berg <johannes@sipsolutions.net>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, llvm@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Mark Rutland <mark.rutland@arm.com>, mmaurer@google.com, 
	Bill Wendling <morbo@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nicolas Schier <nsc@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, rust-for-linux@vger.kernel.org, 
	Trevor Gross <tmgross@umich.edu>, "Uladzislau Rezki (Sony)" <urezki@gmail.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Mon, 30 Mar 2026 at 14:14, Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Mar 30, 2026, at 14:03, Geert Uytterhoeven wrote:
> > On Fri, 27 Mar 2026 at 10:02, Arnd Bergmann <arnd@arndb.de> wrote:
> >>
> >> echo 'struct { short a : 3; short b :15; short c :14; } x; int y = sizeof(x);' | m68k-linux-gcc -xc - -S -o-
> >>
> >> this produces '4' on m68k-linux-gcc, but '6' everywhere else. I originally
> >> thought this was related to this 2009 change in both compilers
> >
> > Oh, now I remember.  AFAIK (holding wood and a rabbit leg) we don't
> > have any bitfield members spanning multiple base type instances in
> > the kernel.
>
> There are certainly very few of those, but two example I found in
> UAPI are
>
> struct dvd_layer {
>         __u8 book_version       : 4;
>         __u8 book_type          : 4;
>
>         __u8 min_rate           : 4;
>         __u8 disc_size          : 4;
>
>         __u8 layer_type         : 4;
>         __u8 track_path         : 1;
>         __u8 nlayers            : 2;
>
>         __u8 track_density      : 4; // crosses u8 boundary
>         __u8 linear_density     : 4;
>         __u8 bca                : 1;
>         __u32 start_sector;
>         __u32 end_sector;
>         __u32 end_sector_l0;
> };
>
> struct usb_raw_ep_caps {
>         __u32   type_control    : 1;
>         __u32   type_iso        : 1;
>         __u32   type_bulk       : 1;
>         __u32   type_int        : 1;
>         __u32   dir_in          : 1;
>         __u32   dir_out         : 1;
>        // 2 bit padding on m68k, 26 bits elsewhere
> };

So we just need to make padding explicit? Sounds familiar ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
