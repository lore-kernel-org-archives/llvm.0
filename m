Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794342682;
	b=sZlTFbevvMku0XxcClA5vASWFw2zFhgNR80G1QZS4ECm9vKL2q4HKGE1rT40DAgl1K5E
	 TgmbsNnTj3dAnLvlvet06LagfyO/yOgB0F4mCeSnVcfVx84ghneII3sbVvAdCrveb/KTp
	 MoFAO8r5BH1Kn0XnszhPioHOsNVG0TbFO1V7XZzuLbtQlyWS9xAjW9vr0/HndaasCIY6G
	 4QsYfDzZZE+hbm97P3pPjeL5mNAebLOjVGTHXaT6gMaSzh5jntYzcro5g+YzxENX9ppSj
	 jJoBAGpYnI6sXe5iF7E7500wfqSwKKoaCMnINoLX+tykcxlcsS9AR+98X0+n5pZXfzg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
	b=om88y7RA+XzFS0abkLnVUWcnBpdR6cqdZwirB45gfGjLcbTs5bwyEbm9/ExlDE4OH4RM
	 u0jMIli9ng+s5T88qqYSe+grBfNUrvIqcmwtPn1R3mi7MaBoP92bVkryyVO/Vn3/aJNka
	 Wx29+4DH0izC9m/XdYgW4E6iUNJGT9Zg+TitL2e/h3Mne2JIqVAiP0lTydsJcbwM2r80o
	 ZTtu+OlVA44PH/gg06w57HenaO10WtDjF35GKkwJ8TbiXeCvY7vOPlq8JScgrEJOKmv8S
	 p5EU4vp7FZ5ADwT1EWPw1dxxxkNaupdI/P5Tc8YHd6mYMEqPoJ8apGFYIk3Vda2KAkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnI++WHM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB483606C8E4
	for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 20:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB483606C8E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lnI++WHM
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd69a8bf5e5so143581a12.2
        for <llvm@lists.linux.dev>; Tue, 10 Nov 2026 12:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794342681; cv=none;
        d=google.com; s=arc-20260327;
        b=L3Iq0BL8voX+wyAyrqouYHAi0jyvTQj2tLEqxImvQ/zrD4eN53JiRIsCxKJFZBM240
         0zbC5DkU/AtrZNOf/uVPXu/rdRBOzQ1Ciq9zVC74fGrnwVWdzzRAY2hqPsUJkI6ZP3+0
         OzM6BNW1E9m2HtNIljxRJGNid2/0EFGNPRZh1iqBTf5q7txJvhqo4BrMNGKxdegP8HAu
         WpiEyTRHUqBIub9JzsrB1TgRiMHmZ58hD/GESHnThLIAzLaCW5D+1di8ncvH5HFCbae6
         HuH7kqoalZRgdoYJcu5HzpDu5PctaAP4Ry75aA0vquv3VjJTEevK3oFZHaTiKvg3f1wq
         bNLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        fh=K8J/a6cKEXy1QZhzgUeQmTElyjGpJdJhx2qJnrLrhl8=;
        b=MA07b48aWFSaE1Qiwua5RbG/LH5Yf9bpT1cmEgZtr+mXFwkf2QmcrvtSgZUyYQaVIB
         /9RhcTSQEgIiFSzUhxm9NHWORY8rvhYyzPhodb9EJcw1b5UECb+jdJfel4IKVLEdUJfA
         3K9fsYZdO5TytXDUzTwp33762j+/ZRbTP6Bm/ODGgoLXRyz6h01N0P1WYohEvxnelKwf
         Cdvb7FWFVXeNayDS6/pr6C2gYTW0PN4fxhjFbFqaNbVMWtSYIWM3f5UT3YsOMJgJRlLg
         dg4OR0wX555GypDFDqxjU5zgGhB0MpLk8N99y1GqmrxaPPnxAUXMPlDo+R8GO3XxD43U
         9wsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342681; x=1794947481; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=lnI++WHMRALZqtRBGDKGfpf3AiI8ovosY1Ppo56rB4+sr1DMnWVAleorDqRU4t6IVB
         h+9Jsm1G4L/MFZeX+eiEjiq6LhANvNalS6Xt3A6zrQGR1ucuRL3Hnj1MCQanO4pQRH/6
         co4/wg2eQ8cSJDmDOTdhxYBP1LjvU/Dv8t8NVzLQr//26OWlpJHaT1sZ56XOAmTpzihR
         N4i63xQzK6pYJpcaZ4M1hLz2fOGktlUXrmKSlxE+Ene7fbGSgNRM2hbvkIFByqPssHDP
         VLTfi+t/RCzBWTfV0TLb4UGQ4KExBlaX8UDrLub5AJyJIQvNFc60jZujJdutgoNbL0RH
         WPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342681; x=1794947481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euMDcLXwVyFRBye3EMDIFi0Mnp2snBdaowuxW7mbjUU=;
        b=wcDldFpaTLLKqPvfFNR6zXq2Ao5uk0ohPMVKU3pg8nyq+w5Ct8pR131BPIJW3t8AjO
         txS8/IXDScm3M4oJpFTThuR6tPX3NNl1RKE9jpzA2wm4C60J30hueXnzlGH6Q2XYTAac
         KbXLLxfaHRKYENRfq3AmRLWoOBA1kCFfRX1xfBwmABUfqHhIp0QtbCycDurZmR/cwb54
         xLh2QkIzPhyWi7cBUVxN48UoQsw569yB51rFNYZoedF3Q1iI2R94IP0k2gHO6cuyzUFD
         fDlTGGQSB6sUMWN8bsF24nNiJ62DWixU0EvDwJWJa+TmbwiVG7Jwcm1QvW4fNH5W3Mk8
         vj9w==
X-Forwarded-Encrypted: i=1; AL+hErEQGUsc85fM5g4nqmHgOMmQY+bngeC8PTjXwCtR+0IJGZ+0aPLHQpWAHe42+m39T9V9NlZp@lists.linux.dev
X-Gm-Message-State: APuU4Z/kHoVgZ+Xp9BPFxhSF6HxrEEdEvsqBfNuPD4xFvkjI/sW9/j8N
	Y9GqphBfrSA2BpG7isEaC7drV7kPg7LjXgp0Zycq7L1+1TaaG17PaUtrf09OSBnFaQ4NXjWZfPB
	t+WBc0RB+aqORmUfaVQwF6xQp7Wln8Hc=
X-Gm-Gg: AYBFou2QXvvQ/cFn35PY+9BiexpVXHQq+lgnEfFMlkMcjyom1N3U5FEfEJJzi+vu+mF
	0QhjEk/O4ncuASbSmJ5pogjR9u0NU7KmlxjPAh8kGQJvEqwqUjZs0/prPjFgiFGowWtuvTd/irU
	1dGFOBzNW9mkoaUUAeFb4YntGwlBdMj/C2VwEHKCVde3Gw1Itz/W/NF1shpUwI9nyCgwB32VIsB
	zE/c+cr1bpH/TqEAsvoASyHCLwWldcqzR+s3RZFJzoVia8yrg5ckGMmV5f/1Sf3n0/tqz7mOOed
	HKSRObirxfPQYPYz1QHdXZ+9zaK8gtdC3d70PeascW2bLX+iPhQNWF4V6rxoUHzZL0bScIGNZfj
	seBUimFiKGqqhE7Wt+Ak/RuieU/MJOF1vBILo/V88vqcTDeUUAjobqx1VegJcAnTkZ6wNanwGD9
	IjW8iJnV2+ACCdfThMhmxqhYHv6YEeGg73piuxHi0/e/g87KxyWppnC4AhFs592i/cdaT8f0FS1
	X+jr6aNM4SWTJXpdXbCZ5Caknme7HIsVO4Cztv+Fi9NfOI8ZMhv8N20LA==
X-Received: by 2002:a17:90b:4b0e:b0:3ab:be66:ddc5 with SMTP id
 98e67ed59e1d1-3b182f3642cmr189775a91.6.1794342681275; Tue, 10 Nov 2026
 12:31:21 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 21:31:08 +0100
X-Gm-Features: AclHuK_uckGpnRQludUiuJa2Hr3E-2Svi5DrMdfVjm-Nu4czLx7g97kWJ04gZ0I
Message-ID: <CANiq72npfiOC2ZCan-zAe-h79kba_5jtWFAeAoigCs_hnO8gJA@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:

Any comments on this?

If it helps, then I am happy to take it via one of the Rust trees with
an Acked-by from x86.

Thanks!

Cheers,
Miguel
