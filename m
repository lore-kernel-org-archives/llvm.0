Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74099489FD9
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991766; cv=pass; b=VI6XV2nxjMEA38cmfXRMD103KMrTwYaMdcRgMT/a/kuiLs9amiLgq1foEp/daoY59WjZxZ8JlCL0neVRiNJ2NSDXPqxJF70ppTZxj9XCAIVHGseDzWf26sVcf9oY8NuXteZr6yHf3z/nnA8r9mBeh9wHCIdiRxmXzCv2tFAlvFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991766; c=relaxed/simple;
	bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZHHrFMQHuUwlhv7eF7DGji3chg2X0sthmnMDUvz5UxIdQMZKv+roL3ImVBvxyPZgysZg1xbUKbF4Mr8zZOv9HucPsf4TDAXEkEyvLm+ig6w75h/qW/cUWLO1rHFVUT+ovlbwvbErPCqYIYwYXT/0AAsfGmT2BJBZz9Y5dfllb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DyT7LeHH; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DyT7LeHH"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso52327905e9.0
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 15:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788991763; cv=none;
        d=google.com; s=arc-20260327;
        b=DejK1hiE97MEHa5tgjyYvy0GyLxE79YsHaj143QFwU93m4u1tmQTJJVEzzsOYRiyBI
         VaBRfxyt6NenMssC+XaMDwsmITSg1eB1HAhhya1JwSKN+csUczj+16MwFbaqO8GJu8Np
         eEQ/4jMVPTNoXpwTZfndMBZSlD8xCVoElNXjGzyE7tN9di+2eq5+yAie8CMxlsMmV0kn
         MUz4fCA+DpLsqDKwhlhPk77t+NKrWX8n0qgdlcFBMbctp7Pifu3kbqUlE7Jd5Ur80RvF
         vD/hfxiYiIDcSl5Fhblh5gKICEi69SZdot6zzjY57LkcjsNUT+FQQZKmWsoXFtaCF5kS
         4JPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        fh=IB07KCfqE+/56O1fvX8WQAmTQPQXGxjoEqu9qXqT3hs=;
        b=M0h+Il+o2T+NOa/vKaSVltwllyfHmwaHwq86SrviN0I9FfrN94b0lYCKaxGhaMn8wp
         vTxhlThmu8e/7maBxhJaO23DPqf5+cVKLvFvrZ0V2XN/CGkRd89MOYjFEihoCseg98NL
         ArTTSvrwfnAWZ3nP25bMwb7utkocgli3QeT2V0kDtoUGVCjWRmdDKez35/Xpn408+hyS
         N0PcJUga819+eZGiAUWn7EILHyNcVvvTcTTQb3xvUmdSBB95AFyQ95DGG+6wjPY2LNvl
         +HFeAX99FyqtV6xVNsmDo2Kd12hVuqeoHHyYZA7I3ttrSSb78gWx89cgFa8DSzI4dYzh
         YGmA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788991763; x=1789596563; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=DyT7LeHH0wR9Rwg7vWKSpwlu0u5EpbtHj4mORlC2/3hnxhLfVWELGE47jHuvz4v6ML
         OCQr55uozrYQNiy91hOO9Dm2zh19yElRuiaINTNdgvpI+GMASol0pEXz5/l4N7flRQo3
         gUiDvC+9iyrxu/86OrgU808DvkqKATccuEi0V5yKrWS0CBE9c6FmmZ+ioB9lwyp21MT3
         nlJVY71ZO1avIsaeGsbAkSy+kadAZi9mzHjFrs0VnZ/hR/ZAwfC0kJGg3KtvRHd+JN2j
         cgDQAXQgLueZ3GJvDRo7CSZpvX81g3c1lvHdBe3uX7zUp6NA3GwMOJqgp7j4+fD1wdKc
         4ZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991763; x=1789596563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=R4oHINZJmEysXUv//5Hz4gpC+uc2MBmlQXv5zFPViD2OQstLTa1VhCbpKdqX23RzTh
         cI6MUa6XAoWrLiQ51T/r7lxLqq6fHW3CM7CFfMqrEFVoGqTT77BFr9iOtCgBHa7bHCBG
         YBYgTdeA9/bAPVMYC8Yf3GSx9EpBjagZ4uvu/tvLP+81+qyVvdJYH9ROSdlW+Xf5/j5x
         F1YkO5Jy57pwhmcC0qqu/qPAcyjOwxeZ19ynUl3h1OWhbLytneWw0F9IblBcWIh3uK6A
         0/Ok+vlEEPhKTiZFIRn6IUJdrNpkPl1Tjra69K71WIrIzWbLF3JG6yTzfGo54yh8XVFl
         t6mg==
X-Forwarded-Encrypted: i=1; AKwUvBwgRABv/yAw+nhX3x9nfS5h6i74jLD5m6W97uJqUvDpCdUznzmi094vVcri8B6U5jpuPLjb@lists.linux.dev
X-Gm-Message-State: AFuF++kQHhxvfpfW4BXZUO0If+Ics4oyhy9TB774YBXENv5FjQ6+Ov8K
	UPWxdmut14+Lf238AYoAJk3zPMTDmksopK8LQemoPcHtha13+XMtDQOMwbVqBvsoi4SI7Ekbnws
	RkKc3zMvqsA5pdp7tJmAilwrxWaSihZjzLf+qjUFF
X-Gm-Gg: AYBFou03JRaLg4ikGrPtkxth5xBy7Xlh9Hr7LseHSIaWka0KMLjRLhUH+TklJc7gNU/
	J++E9SmdpHRkgo83QSz2Ahr4XCppQeDjt3a3gGdf25HKO8uTCvO/MGcs5ny3Zi1iqGnyMWF4BxC
	MF9KPcgCN+B3IbsGbJbXTNcxtW5jzHGJm/DKdFBrpP37KnDZ8Cyy5tDKwUpu/gypw0inUCMwRRY
	vcFDvwJ/ZUnzO2z3XXSr7/n376M6z4t+3RavmbisMSLX/RAKC6Dw7ZsQ5wYpnKjc2FY81vmPEfb
	yWlAh0RVk4J3LPZ/BfrxNdL1tSceRB0VSmT5MlmkZgx55IL0IOq19awhUywi9rxR2ExffKmIePd
	dsX7MUNQkjDlSBY3Mf8Xa1E25buxygL48hKKk+zXUFY0Yxl5gVhWboTjBp9ERNs0RDrMSzzU=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id
 5b1f17b1804b1-49d1f109802mr74781425e9.7.1788991761946; Wed, 09 Sep 2026
 15:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com> <aqFptJRjLZIL-NX7@gremlin>
In-Reply-To: <aqFptJRjLZIL-NX7@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Sep 2026 15:09:10 -0700
X-Gm-Features: AcwNN1VBBOSItlzf2aBfQ1Tsn20Bkz1vl5nUIWxayca3KAiKBTvQ_pPLoFqBSq8
Message-ID: <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:17=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> On Tue, Sep 08, 2026 at 02:06:18PM -0700, Nick Desaulniers wrote:
> > It would be cool if your LLM could generate any visualizations of
> > what's going on during a build? Seeing what's serial vs parallelized
> > in perhaps useful. Particularly when you can compare the before vs
> > after.
>
> Great idea!
>
> I asked it to do exactly that, attached. Came out quite nice and sums it =
up
> nicely :)
>
> It also provided an ASCII version:

unreadable, but the pictures you attached are worth a thousand words.
Particularly exciting are the speed ups to the usual edit+compile+run
loop.

For the blue graph (the top one, first), any idea what that dip in the
middle is? That's always what annoyed me.
--=20
Thanks,
~Nick Desaulniers
