Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD23CFF61
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682036; cv=pass; b=rHUJ3usMA8FXzbyIVYneTOaDMbMKFXwx34MVXKylI7ySftMiAyky7NzepYC9iIahfIRV0+KTw+QpV0uWLIjI1i4SMlnvVPxokegIU/EZXKdddzYgCOhxmchVfdlGFGEM2lHJ+YS2kQl/JnzoyEfrfIKxd8B9wjgADFflFZfidEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682036; c=relaxed/simple;
	bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SRuQLnNDQVf6w3SqFuXfjwI2eWi/ZxG2O/xyWHv5dUqY1SptgXUB0XZ7X0E+qX7WWCAPwBiG9qTBZp1pvpxaib/IqG28Vj0+0LTa/yUOnmKyrd66Y6nDgwEWLFN51PPE1tXbQt8KDyQBBDO0vkTMEC2o9gb482d9MvAf4Zc2v+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tPG+cVFs; arc=pass smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tPG+cVFs"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50906a98ffeso48121cf.0
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 10:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773682034; cv=none;
        d=google.com; s=arc-20240605;
        b=YXHz6IprwkX4ffgsSiN1dqwFdTrRgYG31i6gVNCazf9mIQwnIot5Y/KbpEvmZK53W1
         zPQbAYu90BtttOtjtRfZQbUvMZ1h7uE4aUlmKwdADg8UiH/T2SHRqSMTUrADLaGZ5G+D
         rAgVaQmS2gFnKmeNUoL1vTLf0YMJEfmKW1l5kHso+rJ7bR1I++77EToSmypDnOnkECi7
         FB0kDY1YX4GrGJp12mCH8AascPQyxNgUFsr6jcRXz/oMAOCxmNrgiluxlQt6o9+pgxnP
         zAWPlkyBD+yw7135g2fcjF+df4G7i3wlwgvYYDNfriVL4TLgLVBerW3ijeuV2E8NWXK6
         tD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
        fh=qucU4qZqt93oHgxZDtKg7hH+U8o4+6/J/3efd0/in4Q=;
        b=GdgT0MfyghzEX27WSQ44HHjqH+Dz7lyF3ua1F7G4TN9qx1LCp1MQ97ON3EW8Wt5pq/
         wqbb1lAUmnaeJpy+6m2eCtm+ut7UIokaMtYPfzWg4a5W+lngpFGEp3cmXmB5kPZ2H28c
         PQ48QXxQB4ZKyNXmNQcn/8BykVOSY9+JuoK9wqRsl7R4VrhGcCMgsCEnwFMVYp0eBEhs
         RYR/zCCYSWbsE+OQWCcRLXsgsJaCKoBEAYXUCBvD7hjzDWa02m23eSJ0yx50dlfupiJe
         N2lAMbf5ktKe3hKJHtFoA3gEoA13GelOP8RxkfHwJOFFE/VkxxV6VXJLfTZz/zO+x0i2
         GuMA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773682034; x=1774286834; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
        b=tPG+cVFs8DJwyyJ5pvUW8HZh3YCp8pxdfC+/B5CSsOaaqUUaM0XZ+PCPQn9784Rpc4
         +PmcjYKKYGGHoNi8EpYT5Tdl/6MOjZIVAMkCS/Ior7nA+lryK9RUXhovRspgoHB2XBO4
         2A79SbB/Bz4d+AFo7/tm7+YJobFx2mAWFNyA3fsoH9uE7vSGPyY1kL6JIyCCyjF9OExh
         yb8INxxhme8mvvIuBBlc5IYa3XcaJcOuGFhsq4rJYgmsfmSWr4SEv6/n9UcBiEQRl1JG
         u7QGvKxhQoYokytg4iK7wvgn0KW+kt33McDycfCkRgQ3TObOZpbOQPdFTv1GLgJZbWbf
         HUDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773682034; x=1774286834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hLmWZrjgoou8ms4KpWMSp6GeKo7AfRzoVomlCjML0m8=;
        b=mpWsHM6HJtUEswV7taBqM5MykdxN1ORRS6f/iHPLbKPDxBeHl9r/b/x71QenOr2rQl
         hwA6ZjVDDmCCXdgp2xWguYMna7Bwt9qyluHye9/sbU5G1o4xHZGfo/PLFKzmBYJa8xxY
         WbzP61k2IB6HY52oiRFpX+uj5aWgqO9HvVFY8Yvbp/alWvnh08Vb6so/Z4qLTo4jkzxn
         t5d/8Mygm/o2l1GGpfcDow3swKxjBcqt82y6M6vRozYrwp0GH6ED6CU2pTpv4iilCF0z
         +gmxpZJ1ObxerjpwvLgmAvkLKQ36wLuP+zbWn2naWocj10oTY0dI9VM/eqtPe2zhe9UU
         sfAg==
X-Forwarded-Encrypted: i=1; AJvYcCXoJWhqkZTC+YJ7GvffSw3+Cq1zTV6EkyGggWhcaS9eXD37eXhUWrOzYGtbMhvvqqA58Ucc@lists.linux.dev
X-Gm-Message-State: AOJu0YwwiWv/O6NbGxiRxAlHm3OeW0UfFmMW3hWjdasmuM1KIgSwvCq+
	68LVz2plalXfjF8UQErK1rpKQsr/xOe688z1I7UkSdJQt6a6mZyHXcxgWoZUtn42ls1zapxlzJT
	IH5rNRlWGHvk30Js9nym/xZFIy+aIRknygcNWGlST
X-Gm-Gg: ATEYQzw9UV57OYufTudNPfKMcouzwRgNQ2n4Q0zkmG8C9pPAzaLajnOnWGSOLhBnO9g
	fwd55vXQFM6yhZx1JCnKGSkkeMSuZ8JS290TwiTksU61XbaveTypqd2Pv9NDX0vxUkWG3EIUr4n
	KuAmpcUMqit4wHxlNk5puU6uKs0L2I2+V0bakTHMRLa5NviwvoqwSM968TVKL2uxxYyxazzuVSd
	3AJ23YP2rYQ2+3Ht6IS/GkZ9Wxx5+iY1PlHITQ6kYkKS6z7HyOYrahVmfA73y/zkbc9Y/sGKg0W
	XCWmn2061H/a/fSfLPjeOshZNiGeRoO2rs4=
X-Received: by 2002:a05:622a:1101:b0:509:371:f2ab with SMTP id
 d75a77b69052e-50998d570b3mr466031cf.16.1773682032756; Mon, 16 Mar 2026
 10:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger> <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
In-Reply-To: <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
From: Rong Xu <xur@google.com>
Date: Mon, 16 Mar 2026 17:27:01 +0000
X-Gm-Features: AaiRm508nRBQqyKi0J_S3aneXqflQ2aLZ7Rt_tMpMtL8dLzIVmmTeN_BSRBpyuI
Message-ID: <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think the problem was $(AR) mPi and llvm-ar <=3D 14 do work correctly
in preserving the orders for "thin" archives without --thin.

We can either
(1) Bump the LLVM version to 15 and remove the --thin flag, or
(2) Implement a condition, as the --thin flag is only required for
llvm-ar. I assume the reported error was using gcc? (can someone send
a link for the failure?)

I think (2) is less involved. I can prepare a updated patch.

-Rong

On Mon, Mar 16, 2026 at 1:59=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Mar 16, 2026 at 2:40=E2=80=AFPM Nicolas Schier <nsc@kernel.org> w=
rote:
> >
> > The simpliest solution would be to declare binutils 2.38 as build
> > dependency; but I am afraid that it is still "too new", right now.
>
> From the last bump at commit 118c40b7b503 ("kbuild: require gcc-8 and
> binutils-2.30"), it seems binutils' minimum is supposed to go at
> roughly the same pace as GCC's. Cc'ing Arnd.
>
> Debian Old Stable has 2.40, so we would leave out Old Old Stable which
> would have a recent enough GCC otherwise, so I guess that means we
> cannot?
>
> (I was taking a look at this minimum yesterday, because I was thinking
> of removing the comment for a workaround related to binutils <=3D 2.36
> in `Documentation/rust/quick-start.rst` when I bump the Rust minimum.
> Of course, that comment is less critical, and those debugging a
> Rust-enabled kernel likely have newer binutils anyway).
>
> Cheers,
> Miguel
