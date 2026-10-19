Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792447154;
	b=mzzAe9cfp32bxvmftV+co8lx4teYlW+NcTxmkH2jO2yaOyIcHkQwwM0j8x8nDuxWiohE
	 wQyWAZ5CSeIW6IhLws/wl5X1fQ0gras7iWd2mw2LhA3EkAFovBiXj+tpLM0bR51WUhZQH
	 MPYzldf3kC5CUMU6ZvbCnC37zhEAcbo899nR4y2pW5sE/zQQFZ1Yp7CBNtMuOenutH2pv
	 vrzLY0x9fcABA9BCzpI0sB+NWrR9n9LOJ8ez+8lVRTCwwfiB9g8g0bfd3MQnBgbPYNNQ5
	 gr02JbgtTHZVXxbbb5ZS/zOACFK46cyaRAWhNqbxw9B7Grni9QCABlnudlrTEoTZm2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
	b=qKQzueH8IQjTqotwTZd4D58q1H2PE8GUbx+PYO0ZBXhlahmMNR2x2IM8t8NFbUB+t8wC
	 eTKKyxgWH4guRxdyk0vdJ+LXlxM+4VrTSdKkd1uJ9ffnjJ/HroIH9gKqAu8JTQQQNIOC7
	 psxrmyBiEpc16peuoPkqxSOvGaPJVhle9fK7/NJFDGhCMxQdblw10QSacxZrSmss/YQrN
	 nWVhsxLEFxN2RfIJWHPhaIkmE3zlN6+zuwU+SHi3mDqBrZ7SG0y0OTHFJ2v5nabAdkT96
	 u7l9VXhKE8VQ4hZCgyXkfS1wl+zDLYPKjWUZl15YVqGFhXcS5n42rvYWkmTVOworaGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OoAVr58l;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6699606A31C
	for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 21:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6699606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=OoAVr58l
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3514b90bb89so6768952eec.1
        for <llvm@lists.linux.dev>; Mon, 19 Oct 2026 14:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792447153; cv=none;
        d=google.com; s=arc-20260327;
        b=V/iBc9Ukt8YV8P8yxJRMJoEZmhozK/guuGrTeZDgw+Qds1p3qZ6i0XHHytL5HNWkVN
         icHy3vdB6MZ4Zb3UKxlIWGbXf/iw2ERGShSOZW7yJ42WkS9r4Nn+V4mk6UAe7XsFmEb+
         ZDTix8YF/u0SCxrC1KZfFb6Drv+mJTiUIswseiHS9QAs/9NefCGpfNVyCp2DXjh/T3/R
         qg4YTTP8QVXZ2Tox4OP2bJeL+NjGO11ITlw5HTICUdg/a64nHn98981hNo9JV/n6K2r0
         K2rEflmhigpjT11VmxqcvcX66UnyByXe3fkY1JhPwwlzqBQfTCNhaDgDBqGKWWY+xr4v
         43xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        fh=WIogyjvNoTJ01z8Rz6j7i3oO1h645JFnuaxCPU9kWvA=;
        b=gWtkXd/8ODFlDbXnDyF+3mr5VyFZRpl5mdJN1Y8vElElK/lIbnfVRzD4KZg2xr+7Hn
         jo7io550N5BvPEmJ3WJyrrMvbLYOOcPdGGNd30o8CM/nmVAT91q07pm9aVOsbkVClNCD
         hv+xm0lDPUAlUK2jVEFfLz0MX9Gsyq+UPIkvCqW5WcTSFEPolo/lmbqxT/IZnWqkoWvt
         M30k6P6/GDVpFlIifx8RuWwj+OytNuRU/rAKv/phONQBDfdGpJKWkRvgl4b6scC/u/ZH
         WCgZf6vpbFNDB4xfOAvJ0BioRJdB0GbEBc+Mi3PXl3ByBPWYEB6JSj+7uMnvsB09CiVa
         flFw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792447153; x=1793051953; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=OoAVr58lioza8l1kfoR6Gnsl37MNlrhxK1M9ZIuU8Sr5d5+EVFsLe+Wd8fAIfFuFbG
         ahH3Me2CgQ35eimodVQpwbnt8FsbbHJ8x/C2aqtW0aHILvoQKLcqMl4Kr1D6r39yUvDk
         nnOnOpXfm8kc1V/kMoaq+G45d6XCkzATEcPSn3XdfQl6dGvnuLvqDqlHQM/xA4cGzhmQ
         Lm4766py2UlyrqZDNQA+5VR5C27Asu+L1SJIdntfcn27dVckVErQwC5RqejK5EiCMr3q
         BtzmXVoYqWEx+rQGZ+mr1HP+h7uTaJ4QbC7pzAi4G8Ys7d7nmTi2f/nyMReuTXxUpUBz
         Vw/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447153; x=1793051953;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jctDokCQpU+5f4McBmCcNrit0g75bLIuZ0vnR/79ocM=;
        b=ND16uWQmp8xaFTJdks5enzXvnaFgJxTGQAM1RvvmF/UwU6ZyxSV3KcStSAOIZjFKlC
         nQCVYmZ6BJVwfvvfdSden6WjUesaOd22Ci8GGdd3hvSeiwZEc5pp1m04XrXTR8tmUjkX
         cVPBQrp15v4y5DjL+BwRCe+6OLiqwbPs/Inof7r55HXq9jeNEMhqdI7EHqy8ZdI+5gts
         IUzDGLkR9mzGxKWgywQpu/RyG3/MVZvBfTPncuOCsoVsUM1uuDfH+jBe6CdfscDwY6gi
         HHyLFj3SxJ/93zmzqVPet605UvoXHl/zGHP5uIzEhuxWhF68Y0u011YG5t+RQi2Chwru
         +hLw==
X-Forwarded-Encrypted: i=1; AKwUvByf2nZb4O0O2NgmRVvT1evTG+O/pPZf/f4FknaZmRueTSIZpD6Tq8yEdXGCameky1AHq5Ps@lists.linux.dev
X-Gm-Message-State: AFq9FYJTOSpywn8b1hzoyyeyrhql2CvC+TTpEt+VftLehgijdt4krd75
	ShUuLPrqgq64sQP5EHniTAyizdv5jEmUwEgstV4kAHMnSaY/wIAiQaYVbP6iEjVlxXWAwbXeQSz
	53HpKE9wPQFcBBgpz2DT3NiY9R/G4odRAdc6jiQzL
X-Gm-Gg: AYBFou10184L0FYzOzxMIYR78fhYs1RL20dOewCQWHb9VHbXlajLXVZ5mZfcctHgNo9
	5AOK3KcVgqrrAtsKeBoR2bLNzw7QnNAFBbv8OIpePJCwn899u6bK4EY4uYIKUt7NbmpAzcHSPPx
	VXDDjiujqvvjEXTHtSONe3pm7yyqo3AFo54j0TLcqI5IW6Iz2X0aGUi1KH3uSMZqqNHq9kxN6Et
	cbmlJZn3gG6VK3BP//jHHZCCBI7azBfkb0wu6fgpTNq52d+G5zZdzWSYfEiWEKL/MFwqYw7NvBy
	YBmJhNNUo4zda0PmVZA8SX9gpOVVDmKEqIcPne52HTRyx2BUfFdsYOy6EERYJJlZcBti5ZAXxiQ
	P60y00kToyxo=
X-Received: by 2002:a05:701b:2207:b0:136:c443:80e5 with SMTP id
 a92af1059eb24-1876658f6c4mr9237879c88.6.1792447152061; Mon, 19 Oct 2026
 14:59:12 -0700 (PDT)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
In-Reply-To: <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
From: Marco Elver <elver@google.com>
Date: Mon, 19 Oct 2026 23:58:26 +0200
X-Gm-Features: AclHuK_qWUQb64XA37ScTQq_ZMKUMtenjdgDmPfnErmCHixLBqORRUjuSE_XZSQ
Message-ID: <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Gary Guo <gary@garyguo.net>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 17:27, Gary Guo <gary@garyguo.net> wrote:
>
> On Thu Oct 15, 2026 at 3:56 PM BST, Marco Elver wrote:
> > Rust supports ThreadSanitizer instrumentation via LLVM, which is what
> > KCSAN relies on; however, Rust code is not currently instrumented.
> >
> > Pass -Zsanitizer=thread and the same TSan backend options used for C
> > code to rustc. Wire up KCSAN_SANITIZE in scripts/Makefile.lib for parity
> > with C (though rustc currently rejects linking crates with mismatched
> > instrumentation).
> >
> > rustc only accepts -Zsanitizer=thread for targets that declare support
> > for it. Of the targets used by the kernel, this is only possible for the
> > generated x86_64 target specification, so restrict instrumentation of
> > Rust code to x86_64 for now via HAVE_KCSAN_RUSTC. On other architectures
> > Rust code remains uninstrumented as before.
> >
> > All TSan options used are supported by the LLVM versions of the minimum
> > supported rustc, so no rustc-option checks are needed (they would also
> > fail, because x86_64-unknown-none used for option checks does not
> > support -Zsanitizer=thread).
> >
> > Unlike Clang and GCC, an equivalent to -fno-optimize-sibling-calls is
> > omitted for Rust because rustc provides no corresponding option. While
> > disabling tail-call optimizations helps preserve complete stacks traces
> > in reports, it is optional and not required for KCSAN to function.
> >
> > With this enabled we can detect data races in kernel Rust code and
> > between Rust and C code.
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> > Acked-by: Boqun Feng <boqun@kernel.org>
> > Signed-off-by: Marco Elver <elver@google.com>
>
> Acked-by: Gary Guo <gary@garyguo.net>

Thanks!

Which tree should this go through? The Rust tree? Probably too late
for this cycle.
