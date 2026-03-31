Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB0B43E9D6
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774979279; cv=pass; b=cSydpsEZnZLmBbInRsTkoqEurEZn+WI8VDqclmw4WZAvh6G+20rVW4bzxg40HIoQ7d1BZSf+2Xjwt2+RLQT8XsRIEfI3XiBTW3CxRj1N9XTEbfWvYFVobaFSygIzXiKFbGJsyKnUerfigorpVZzLgYYseLNRqchBty8MRxaWVKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774979279; c=relaxed/simple;
	bh=0gsHE02IRJdRhrhJLMxNqQrK8YKfaYio1tL3SdU4Cww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZkZLR7QtdCbu/Z4iKTfnMQwTCBIchFPegF/6bUzv/EkoH8N/8gJQLXQ5C3f21ip5X/9Rtt8XF1iECzI568CPZQo3U6xUHlN8bsbz2g+eARypWpW1RUZRw4cJjjiB0CujE3Np3bvr4Ehg8y6e8UcbDCdkIZ9NzcIxvKJCtfhUPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d+U6c/0X; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d+U6c/0X"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2c5729da886so183949eec.0
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:47:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774979277; cv=none;
        d=google.com; s=arc-20240605;
        b=B3Mn0Se3zsr7shMmViw0inclpbFwuEcXpqMths5kWjtCtxVsPp3Th5Nhc9RDqwrYge
         U5rseTvO0eum+XkkkDHHaK8XSO1s6fYA61qR6iIFaCQPdldOrYlOemMsw+7jmyb8jRpc
         stKdYUVuVJKBTNcWFW7O00x72+h4N47cbHL6M0Pysl7z8BYwnL0eydjnfsE50cv7sn5Z
         FSXl3yJ8iXVjVJz26a+tJ80GC1yLFKW9g5/3AdAlTLiGMLdhbnrGK9GpPiNRPuhMhFLF
         3ft3WZI53QI2Hp+cicQsX2BjGko7LEqQTTaVCYj0ZG0DH31jdasVj/0G623qvM4Siys/
         6wjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        fh=YSZUG8m4bhVOTyFeLPe3FX/sKXLL0x03wLNT56mZd1k=;
        b=S3M+IvGvhzaOJHV7uLlohyZzy5da5EYbTpQ5EtBfvB/coegtpDTd1+5cw64UE5s/yy
         K1zxBb6/cwR4R4xYA+h7kuMw3mEftnJSwI+go7mRMdMa6F/SNpMf2gv6NFpUffn5axYC
         KqrkXZpuCM25qZx0BrnrTVcIroo87+LrU/tQi7mmBHCxAStoR0xDUrYRULys3ERALcKF
         SJgiyzFT5X5EnbThbj5kvnVPrMMp5nNpmy1dIQW3209kptiZvc+zLR7z4ce7AkHVCb/A
         ifazw61R22+Ub3ABF+F7IBogi/poyLZNOZyew/94aZDMrcq0TscxXpF5EayaTJwpuPPZ
         Ni9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774979277; x=1775584077; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        b=d+U6c/0XIktiEs2UGFhJN4gKn1VRw6hmizXbh1LfRK8Yi+AGyIXxjbqc7Yh7hzGasn
         LtNf/jJ/BvDnjlqTTZshPDpIsFwMVV5U219rXGrDo1CbwqPRvlW4ohh9oR6bjS48Pj5i
         LfnSHlFdgutdO+lM3KvgfEsZMqeWKMdoTDTTtDZe8NS3k0ofQQGWUkmvwcLavN0aEEPH
         5V7D/YqiXe7bnJzcy2ezMuJ8dXmR52JPsmpAsMuYG9cmjJkjqg01RJPRde7d1yZJML79
         O+iPHCjm+UZgrKYz15gCRWkO5lj0QNXJb3niL1j+wuAs4tnDhhfmiclg1qc+LPLkWiau
         YrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774979277; x=1775584077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ysi2hafA+ptpgLLenBdk3UcWnvRmrwggzaNQGDWt5QA=;
        b=CY10Bo6jqgOO8vk/iep3kY2J6z6RNqD4iv2yWFG1bEviujXem09BRqMKv7EXENMeaw
         0jdx1xgOpT7w0qtZzpr7akhX0rElWDkB5ZmQPaLHiboUcwTAG+xld4+YvluPVU+qfglG
         TdiPwhOztu5/ykW+qcO8rHb+iuFGNHpogRu/fiLtKbRL8hqC8UdgjeViBvtrif/z9GCf
         xhYcTDjuaaH3c9iuXav7Z1mUQPkakTxZUT4MTCssRRRIqxL5m0OWnFNZd6PYgkLHlZvj
         s5j9JTuhJpDqkJopJjdFCmdP7RjRrDtXOIdhfHkZSAHFCPoVhJ1rCpjImRYbPXVrkAMR
         eEAg==
X-Forwarded-Encrypted: i=1; AJvYcCWKlU7dOrQB+v2BJLsRc+Iwv+13QPHwH/xWRfhOur0FUejw9jai+s8tFps0DHZ1x5pouK06@lists.linux.dev
X-Gm-Message-State: AOJu0YwUfsH6UUxjOlEM8KswgZLVkBxVXwM/ajs6Rwk0QsgYqDzFNMR7
	ARldlteMe/aGd9uRvUTPhlOocT7Tpwh1VtYEtJrRVyp1wSDOEsZ4OrHtjlLw/1Y+3gSgedYtQX8
	woNncaWe+g4Qh4BqWgfRqrnLmp8pKgQc=
X-Gm-Gg: ATEYQzzGXcU6Ue2Y3LrTFfv6lXeZ8JfLwXYcwzHuxa0uhoEI51lHmYmlil3vTQgy6kw
	dwXj8/cUIH4igx1QUau/VnrFmZrSlDo2kLmB/nssGm5nLTeeBFB0Mym3HZI716b+MGtD9/Zz7Ug
	HxpBfqX52ufvWORCIHulPOl+c3IzpSDkGnVne6o7TKd/rB2XTGwvmVrNGSyJeqwaJ+7ICH/bX6L
	qAz9e7Rmj2VNeM/lS95pAsdrCxjaTaLbPZofdjCwzXeENnwr0HGbvPZOpQw+gvDmGMIUQPUArXq
	aZ3Rs5QcpChyT6Sci5gpUo3tNkC0c/7s+PJ18I731BkYJnqlhKZzKdEmyWlTfdcqIJmTjn3M3pd
	Bl1B+XDceBazl1pV+jjHZmOI=
X-Received: by 2002:a05:693c:3013:b0:2be:1f56:ed0d with SMTP id
 5a478bee46e88-2c9333b1713mr40887eec.6.1774979276969; Tue, 31 Mar 2026
 10:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-5-kees@kernel.org>
 <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
In-Reply-To: <CAHk-=wiJ6Q_qMHSe-hs+QvqKVZphvDZjvFP_gQLw1eaWimv8+w@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 19:47:44 +0200
X-Gm-Features: AQROBzCQ6Wo3TBLhc4gV7S4by1XCetN63ihcS6-yEhM3XyLxgnvaM_4biv0PCmo
Message-ID: <CANiq72kL3rTKyDNYmD7wXiKCVJSfa1bnp2L8NShXU7OPmWjJ4w@mail.gmail.com>
Subject: Re: [PATCH 5/5] types: Add standard __ob_trap and __ob_wrap scalar types
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Mark Rutland <mark.rutland@arm.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner <tglx@kernel.org>, Finn Thain <fthain@linux-m68k.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	llvm@lists.linux.dev, Marco Elver <elver@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nicolas Schier <nsc@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 7:11=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> No stupid one-character things. If we go down this path it would need
> to be "wrapping_u32" or whatever.

That sounds close to similar types provided by Rust, i.e. if something
like these types are used, then it would be nice to match names if
possible (assuming they are similar enough, i.e. no surprises).

e.g. with generics they do `Wrapping<u32>` or, in other cases, without
generics they name them something like e.g. `NonZeroU32`.

Having said that...

> This needs to look _very_different_.

I think there is an actual risk of someone e.g. copying an expression
from one place to another, with the operators behaving differently,
yeah.

In the Rust side, even if those "explicit" types like the
`wrapping_u32` you suggest exist, we generally use the methods on the
normal integers instead, e.g.

    i.wrapping_add(1)

    micros.saturating_mul(NSEC_PER_USEC)

    self.index.checked_mul(page::PAGE_SIZE)?

etc.

The advantage is precisely that it is more explicit and avoids
confusing the operators when copy-pasting code and so on.

So that could perhaps be an option? Kees et al. have been thinking
about this for a long time as far as I recall.

[ And for the usual operators on integer primitives, we panic by
default (configurable via Kconfig), but at least that applies to all
Rust code, which is all new, and kernel developers get accustomed to
think about what they actually want for a particular operation and
whether they need one of the explicit behaviors above, so it has been
good so far, but it remains to be seen what happens when we have way
more code around etc. It does mean someone copying a simple math
expression from C to Rust could forget about it, though... ]

Cheers,
Miguel
