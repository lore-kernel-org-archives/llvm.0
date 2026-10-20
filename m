Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792492487;
	b=wDV8ly3wBsVLE/GcHn66NzSG57Zi0JaOSRJui+3U4PYZWzeAvNuXRCbFrVoSoKSQfXka
	 0QO6biIzekBsT5ucGo8FcJ7R7W7WE44fBwUwEn8DdQeE9Nc7P/JGDts4Fx2C5mjSGflPj
	 uy73gh5xQ0QNbK+WqqZ9/n8HVJ6q+6fjYq31a6Q7oq7JDxqi09HdBDfvzkF5lwHF1cepF
	 aaLBqxDUif8Eyrk6WAWrk6U7mFYLctyAPRViYruQq2XjVM3wR6jn6yvM6ImPtmbTz7Vxh
	 R98oEyr4V5EX6upV2L26V6U+Q8yZTe3ubSDx5WJcd59d/kOYoZjOPRL+M52AgZGYzKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
	b=VU5fMr20h6zUTGS0KzKerINF9NqVCNPPxwOOXHvXQMBML0WJjgsDP3KznY0QW5JNq6tX
	 ztlOccnH25FkXAy24GapnPT33lIvLM2wylFlU/wSOFhs+sirTBssztciTbAtaSmnwuGnM
	 p11aWUuKGQ6hiviRvYDqBlOgncD6iOuEFmCBaJH6lVRvzP6dERrg10ph8B1aHccIROOcN
	 +RUxzO6w768bgLxAOkdDtkKmMwLyKx14eUyVxdCsW52mncPjZsk6m76eZz3RGhQ10l5b7
	 QC90vM8+tWjuVclaVOFy01ObJ8VrJlrTwEOs82pkVFCz+0NlrXRySuTo7FdENLTcOAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8AE606A320
	for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 10:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE8AE606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-35c76e9614aso5732239eec.0
        for <llvm@lists.linux.dev>; Tue, 20 Oct 2026 03:34:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792492486; cv=none;
        d=google.com; s=arc-20260327;
        b=eDc5RtP+ACyHTeDpj00gob5Gx6KeRKj9AJRRNSW4t5S908gSyAhdCkqCx5wnfS5rvv
         dnr0NJvGqyAdaH4BrRdSgl0AKJjCiMr41WM9wIwXFO7zdd/He0vJ5ZJNZ9ZfcZRIvVVZ
         QXVHfNDzCt0UwiaNGYcSDJ2ffH+SLw0OfFYPzLTK+9kuHicIgCkEmS4EKB9FDKLfQ9K3
         +9/qdUWviruTted6ZZRdQNkabJYfoq5pcVKc9ParbCTm1vFRNf53JRN0mAtK5isVrFYB
         ZlFBvUqLKSQ8YgJxZliE8f3qKFfDlPnkNGmOPgulI/xw6lBQdIHr2EemPrZCsajsDIKy
         anKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        fh=1Wrordfsu+Ez9n/fSjIOA3QoK8TI0O6IsZ8V1wHSyhU=;
        b=PUPNDl+4WZwJ0Meo81OLc/l0MO7DyOgtkiZ4v4TOfFBzN6DIHjchgh7sJDkz/oPfWi
         caNTNGO0siXWozWJaQ9fVfHFiu1632lRXDxxilHpNHahAquudL6AiqkPOUb4ECCnbgfc
         YXZb9WHwtCVlZePoQ4qHBr7q8eXZwMlrWpUKGarCpFZB8xKXXKoSDEtQ705NcWM+JT7B
         Ewh9briqdG7umMlASAMubtweyv0Hu+CPbo4r82S/tKc/FFnVKOL1IQSsh9O3R8h5EZ/E
         R1NTrQVdjSrXi5pNOfiLLzD3FfmZlXFbJc4xgKAG7zoloyAFcjrSGkwCXvsikwa/D1cK
         FrEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792492486; x=1793097286; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=Blnk7Sx54v8QGfFdUNlkxpWMfIAj/UF4hk0o4UiziElvJdI/EgY72oau+oSHJ+2fYG
         exiQ/5Gp/B+l6rLhxv68toW9GY2re6BdBkc/RO8aF4ygbU42G300Zj4PvyZp4ExTfKBQ
         jq/AgdXJC/O7QBiZ5xPcVZCISQ9bVs4WSm/BnBVn8ZTSnwWKj6L9KzLD/++rvlodG3X6
         INt/7t+pm6Wz4YyiU5rnwV7u7aj9yXX4e6jLXtSfgUWekUA47kGf5B17UWRGpVNy0VRz
         ahrKsvia5631dlefVsW/B4v1xld80JmXOgkH4qVr5EvS5/a5XLxSRkjubCI0CnJlE3/T
         fUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492486; x=1793097286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yqug8sdWoY+Xi/S1g7k8vlRdY1kPSN8O1HjSFthE/o=;
        b=jAix6oqVYU/d66RbGUh8irgNiOF8HwdxrDAmkVJaoPiJCqpT7uXv2ToTWqF/RFvCww
         0zNyLNYeNrfmeEWfrBa11AifBvXpp7mbG10jQqXbFkY2Sl5XpCL35zY3oigiGpIn5xpS
         fgB8ot6o8WaKRXZHJsfzBJi4vsohStYvwe7t5dmH1tndEjZTZCLY+6RJBzP82j3Cc6S5
         JMMEDTzALS9Q2f66TO75p9T/orJnhd0aWCUG56vLYU6jCUZ7Q2qKmgk1yHg29xqA2wCg
         OramQvu7waejPyCNewWGCbk8d1VFlPbMLTPe2jP47F/be4DL/+1Bs+bM82ie+YqOwgJV
         sFWg==
X-Forwarded-Encrypted: i=1; AKwUvBwvUVInRYi+aiDxAzl7WyDZH2JN6cRpOUxeZ4VcUrExeaSMZ/W0D6RdibCQ6nPhtpk1RCL+@lists.linux.dev
X-Gm-Message-State: AFq9FYKKI5tZ9OzvvvBBK5tmE4+c9h3OeaQ2Lz/SlJwSHympBKBjJCN/
	MKdlpDb3IU0eBpwAB16t0M/FV6wVsUoTDGvu5BN70DfVFFuEhc9mu1HahxCk70fBuXZxam0m/UY
	znLRbEqS86bEAauSRlcJSaNjObZVbm7g6isvIl3kW
X-Gm-Gg: AYBFou0feErrpGPrh41j/+KJn/d9UiFlgtIan4gzkF9rxKS58kln5MRgyVoR7hUxroP
	h3HAE/Q2LYF4wu0tMjiuJwhFkjPmOW0VXnEzxJ2PTeFKfXRC1dgAQCEMUTjdcAqJz8FufQzLvcc
	28gFDI3Qz7uBFJ/sMaMda4AgXEc7XYIYCuvOAXph4L9ZQQSrEPSvt0wopKUUAwcfzJCoH8YeGLA
	69jtLwex1r5wfYQ1oW8tdlI2V6XYdPUh3o4+6V3DYUDi6djbcKbn5TAbVPKiMdPcxAHly26k5in
	YDu6bA49eB7cUBzbcfbzjwoe/6jXP/KZ+3ETHciGuIkarKIaLoYF1N2401K+LiOBfUdaH+f5j2W
	JTTZulO5YOFAmnVa1UW+m6Q==
X-Received: by 2002:a05:701b:4657:b0:183:bebb:e93b with SMTP id
 a92af1059eb24-1850d3705c0mr13844857c88.6.1792492484834; Tue, 20 Oct 2026
 03:34:44 -0700 (PDT)
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
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com> <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
In-Reply-To: <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 20 Oct 2026 12:34:07 +0200
X-Gm-Features: AclHuK9vxwrK8NaLvu2ec0o5N9md4lXO8zMypsPDxXbgQlLlX57bi1hqfmPPF_I
Message-ID: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
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
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 at 12:27, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Oct 19, 2026 at 11:59=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Which tree should this go through? The Rust tree? Probably too late
> > for this cycle.
>
> I think you send KCSAN PRs, so I thought you would use that, thus the
> Acked-bys (I suspect others thought the same). But the Rust or Kbuild
> trees are also a possibility, yeah.

Happy to take it - but in the interest of avoiding conflicts, thought
it might be better suited for the Rust (or Kbuild trees).

> In any case, at least for Kbuild and Rust, the PRs were already sent
> (and, generally speaking, I would have expected a patch like this to
> be in the list for longer anyway).

Needs some -next time, too.

If I don't hear otherwise, I'll pick it up later this week / next week.

Thanks,
-- Marco
