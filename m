Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9191D1FCFEF
	for <llvm@lists.linux.dev>; Sun, 29 Mar 2026 17:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774805639; cv=pass; b=rrX3yxvzQ7WpdqYn+LI90nUOPFhH1np43N8Ws5/MbwKffGbyByiZ+aqwBi6sDMd45k1wixza/Kc8lVoY2BrKkNxhDCfWZRZfTQYecomMsSIhTaA+FALCZ5VOw6cXRoN+QQbpCnWiIQKtAwVJ9kxSNqQmGBOa9/L/q5CHUgs41e4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774805639; c=relaxed/simple;
	bh=wH8d3KmUa0Vc2ojlkNpKwIlP5oooedUQAm8z4psgdIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvSXN8goMd2nyhidWwYKN8DXjonlDt6oexYOElsxvZqQhfBrHe/qsKHnosYNUYjPvhD8ki/dijyajWv1X4CN+JcJBCLRJHULJzhzigwgpKlhPM0aYJVQhUQIALWWDpuIu/MdCdKJY/lLhjfyQzdRodQfFE/gbhPW128+YpuCEYo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmC2CBkl; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmC2CBkl"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c16cdf31cdso131556eec.3
        for <llvm@lists.linux.dev>; Sun, 29 Mar 2026 10:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774805638; cv=none;
        d=google.com; s=arc-20240605;
        b=OJ08XE+9wMip0qhnHzw6EWlCT0wSFbEuMBHQ2emTkVmoLsLSwd/HRDGgpG2wUWU9um
         05G7yAHOoxlFP8ccc8ARUSCkr/I4D9hjH642dKWS5ft2uzv5bR1Uepr7wTCslorldUD9
         vvhSRPMpoIbq1WmyJjgoWg3ZghqOmmYo+ZdBHLS3vvGNfj7f1j9HCMfPEZ9B5k55M4cI
         I2oIOIVyw0aaxufxcpGxZvuROVCGO3IrRrKk6aAgeGXoGKG8koLomKpU3x30xLw4xErx
         BvDsLfGMzdWdbWRuOrQ6P5w+oWNmSQtY1xAci5joneq+uYdBM/QMy2xNfhTQ4464M337
         4ubQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        fh=6/G2JCR1C7vb15YVKm0QvkIkchwxwpdQnQnSJUaAKRw=;
        b=VUtWG7iIIPLXEFp8cLjM+miDLmDEwWUfArOefTuan0n/ADwZGWzIbBozoHuQQNmu1Q
         70XEcr2aDdJWxF76hhi/CetyqzJ/kGeAgza6QBT5iw8EPx7LPNRT59cu8y0GPDeF0txW
         Fg/+m/RKzv8V6Gbofsea5WPBHMAhrl+JEjIF93T7tAkBB7NeiLpUJhMJvF0E0HrJQg6N
         jDbG/8QJD5dywLOhkHX2QULknnxLSkfX/A2P7C0MiGj9TkeJKa4vKI117fAsR5Qsj4/6
         Z/kgHb1jTQtWeocJwjeRkIr3cq3NtqQ3BY5RSrfnTfRbFrOYipx7Rq7s6HNmjlx7ybom
         a1hQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774805638; x=1775410438; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        b=NmC2CBkl8OmZ0EXm+WmeR4tvzrqFz6+MTYm+DJWrf/ZRr9mvLj8Hd0Ue3w5QjO7WTh
         9UsNv22x3tE9ZxjQGyy+oWULE/fddy+eY3gHZ6QuBF3ag9RpRFYyXeazH84AWCHsxJEK
         vbBlRDyr8dYsI+c7u7yaTL+fjCk54ELLl2aF5vy4D2NPM6+0jrHM9GURFW8fPFDbhKe8
         ybsPtcxWiuLB8kbL/jpHso4wz7oNfOlerDE8GytQ4SN3mdRkePMkBY8U2FiUa2PPYk9i
         gsYhj6yPXXY+uv8rIEKGcwg0dkF5tfT5JOQaLUy38aEA8K6ypoWnC2qrOktje2HB/5QC
         OTrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774805638; x=1775410438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QkCmTI7yYjAJjvmfpeVl++cohGyuqaJEN8ofoKb3dzU=;
        b=lxOvYb4968dQ0IIZRXoISD7qcvygfXag9rL+7S3iNt1EuXWdHnFQsZNfNi4fEenY6J
         u4lv7kzSIDvm72tnt/8DsYhiN18Jx6chLj1bDKdwr1PCK6SuKssLyTfFQ2bhNhXOoA8v
         es25Xtk48mYJwtmpiegZL0xpOAAMIDxY/Q4N5PSELe/6RtLwZabHVCfen2PAWxnXjWTL
         i9ZTTRM1yFhpyWVYahXC/7gX+GIPBR3GNlAtTEQmOnmrDUtUXYq+r3xD+/oDnkMEC5hh
         4MhXZvd1VS/J5Bin6/eXwsg8yycXYXw2LRUrOmdiFn7gx8arOynxCbaAf5JopRd4i+xo
         EILQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT2bX9OlbbE3c3umL6oVetBD3TqW6wozPrF0jcmOgNrPNbRb5B3tjLUATloC4KXHjObf6E@lists.linux.dev
X-Gm-Message-State: AOJu0YxZD7loHoW2hG6e4D0rWaCxVgcYMuaotK7oL6yB92C7KQzhgFY1
	Z85PDthaHFkBmtCcPlLrH1l3Kg8f87n5r5IqxIEbZ+zKH03R/h/hbvBpKT42EkO34dCm9ACIhNk
	Yfvjby1CGSG3PPupOyUYSv54494wUlTM=
X-Gm-Gg: ATEYQzxGq8E9X6XM/g4k5pXauzaufSzbkRWADkQZOYtt50SpD6ln4jTScp/bAScAGTo
	4CnIDjPLLTbqxHwNZ2ge3J+lHMfVDH0jPiB+ncNwqqS63zLIidCYcWv4GG9aDJykln878Nj3agq
	g75mmWLSRtneUe6yXlYiwGgwhSK1021G5Ae4pfbaPSw5ZWoxG6e62OHAFDpHGcPLsEXJaJxNExQ
	ztudk05hxDtJ3Hup9UEtjCcvB/NSTxP8QPD8JLC+dbzYvGTZnWcesqBTHx3EZ5nuad4VSs+rnR0
	GqC57CibobB843zxLR3xJkVksCTgbYqtncVMbYonbdObhYvWg44jpgT4YwimweEevW4dqkeA8td
	SFiuKhe/2gBl51JhfwbLlbvg=
X-Received: by 2002:a05:7301:129b:b0:2c1:7ca:cec2 with SMTP id
 5a478bee46e88-2c185f3463bmr2051760eec.8.1774805637680; Sun, 29 Mar 2026
 10:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
In-Reply-To: <20260203-inline-helpers-v2-0-beb8547a03c9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 19:33:45 +0200
X-Gm-Features: AQROBzAbWz3xOUBnSqR2d9NqgOZyOCJXfUW2zEO1m7L8IHXJSZ_QeR_z2lJXCRY
Message-ID: <CANiq72=ns52NksGEj-5kBCkD0RxH12wKawr2pH_QvHshSsz6Kw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 12:34=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Currently the only way for Rust code to call a static inline function is
> to go through a helper in rust/helpers/. This introduces performance
> costs due to additional function calls and also clutters backtraces and
> flame graphs with helper symbols.
>
> To get rid of these helper symbols, provide functionality to inline
> helpers into Rust using llvm-link. This option complements full LTO, by
> being much cheaper and avoiding incompatibility with BTF.

Applied to `rust-next` -- thanks everyone!

    [ Fixed typo. - Miguel ]

    [ Andreas writes:

        For the rnull driver, enabling helper inlining with this patch
        gives an average speedup of 2% over the set of 120 workloads that
        we publish on [2].

        Link: https://rust-for-linux.com/null-block-driver [2]

      This series also uncovered a pre-existing UB instance thanks to an
      `objtool` warning which I noticed while testing the series (details
      in the mailing list).

          - Miguel ]

    [ Some changes, apart from the rebase:

      - Added "(EXPERIMENTAL)" to Kconfig as the commit mentions.

      - Added `depends on ARM64 || X86_64` and `!UML` for now, since this i=
s
        experimental, other architectures may require other changes (e.g.
        the issues I mentioned in the mailing list for ARM and UML) and the=
y
        are not really tested so far. So let arch maintainers pick this up
        if they think it is worth it.

      - Gated the `cmd_ld_single` step also into the new mode, which also
        means that any possible future `objcopy` step is done after the
        translation, as expected.

      - Added `.gitignore` for `.bc` with exception for existing script.

      - Added `part-of-*` for helpers bitcode files as discussed, and
        dropped `$(if $(filter %_module.bc,$@),-DMODULE)` since `-DMODULE`
        is already there (would be duplicated otherwise).

      - Moved `LLVM_LINK` to keep binutils list alphabetized.

      - Fixed typo in title.

      - Dropped second `cmd_ld_single` commit message paragraph.

          - Miguel ]

...to boldly go where no Rust build has gone before.

Cheers,
Miguel
