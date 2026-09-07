Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB81418A3F
	for <llvm@lists.linux.dev>; Mon,  7 Sep 2026 19:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788809599; cv=pass; b=FTCB3NCdkuRaeXBsWsIFt1f8tXJtib7KC5Y/s46kpscfxUg13Cw1rQP0A9wTeHm24vRTH/eWHRfyz8xlnKoHW08CWPJ+7WzS7xy1pCoLBcJ7+EbqPQm8N12U+3o+X7qD6NLZZVNlb326vmd3B1a4uXF42Lp8hcfS+lkUuR8dGgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788809599; c=relaxed/simple;
	bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRiRLAUFsrqXaVS61oe4V0G9YvMaKDKLV/IICH8gf9pUuNme4Pp1grE+WyLXsDnrY04VhFNX96ijdbotwytFlEcPgdIjBLMb6NXGV9YHzRFqz+mBGxuaJLBqHQkiBikbwaQZ1Lr9i8vbmTTlK6UdqPzNN++zw/98dQEUOn15Ck8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T7mqQNvb; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T7mqQNvb"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed443so1005169a91.0
        for <llvm@lists.linux.dev>; Mon, 07 Sep 2026 12:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788809597; cv=none;
        d=google.com; s=arc-20260327;
        b=kiyHHxBksE4bO8M6Hcgf7/CEPZFnv2In9iorPWWtfe4FZ5gV4lxd5W2EwasB0Ufr6m
         NcpfM8YX3oKz4OHODqi5dMAanrZerE8tjJltgR5gJsmQP/HlohLJh1FMI80LNsUuJtsP
         erCLUEVl2NNU+JI9UZzdEbNq/iLl39PNzgqZKmSZKTrpHoXw1aTq+Rlz/JZ3rEFpjEOk
         LH2F4MmSNtQ51DuoqtssB/IoJ39KwSzJMnzfVZ5sk+vjRi1LaKEmhwt5ZE1kn7MD/PGe
         JJuhzBOBJuuscWcGuxTxI/Oau595+X++j6YVSsJoEYT4HoPanmAvqX+4cvePx4IewkGo
         MJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        fh=5qinDrcA1pEKZRRTpt+TfnhNPT5HQ4W9Ut8ZPRtgECY=;
        b=bHVJMgl+KQWUG8uDyNDvYVsFl1BcOezunENP7vZQr8Lux1+DDwYt9LRHzTy4jrGfBl
         TyYEo2vKdozxdEvs9HnjbjVrmYrNwcxnNOQ8riKRB/EU4HaEsmeT0Qrle+9UZ3YcD0Yv
         8sXL+p8IK4ZTOW7o90c69Uvp60gLq7nxBrzHPLbQDVjOn7r77Ks5czBOTEWbhpCDqlnL
         oB0KCeyQna3HwdUFZ21rB/cRZuSo3tQD2JG1Ek/mY3NYjy7V8I6JC7/6MPnWawgjLXpl
         b0gN5lx7nRZszQebukR3uX2Trp2CcDmc4qIvRLbmWm95ZadvZfrN22KyNrZ5h5BoChZ4
         4FdQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788809597; x=1789414397; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=T7mqQNvbx9TqIkNiP88SOr5VBRL2PYmOM4UBoZaM62F8d/nn4ji6qHCicfyttYGZND
         OVe3njXkTnmAJvgpNnyyLK/OiWZRoHWpa1OpQQePzvLBnpSUmgpZbR+unMvdqIb/D4q+
         gYv03f4TLuCaxXkdH36kO/gf4FBsM5IRJecmTGuQKZL5zSh84giIRtt+Ei2EAdrYdzm/
         sYZhk/vPytUCOVEFqMPZvQIdILpbeQbM8/IKRCUTEuGnWYhC52K4EEbWzfskfpv51kV7
         9wjGb4Apl0fHQHbQ430mQ5JK6FJjAvqQ7Vtj2NIORTFaHZYmVwAu6V+eYOp7SmG2MjNG
         aktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788809597; x=1789414397;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LbkJYZrKBAOtEAIquwnyRiPsYzlue46mhX6agZEqU8A=;
        b=hCUImFgadAAVN+z1bxV2crSThNGksKe/X+meIPB1uBu2u0jwJpr3nzb90Yef2Y8e/e
         ytBoeH9DHD+aGp2r9rjPt2mKhPWWb8HmozCI3KpK58CxGPdor6ingQApRCGPL2byw1Ll
         INwOPGpUIVfNMpo22xfjSnhRw0XD94782MdSWebcUG+6JtOBJc+z1uxIY4sLUqNeNn3p
         ePltluEV+pzmueeA++LbA0i55JvK5o5MuJoP7fJeDMVJaN13+0ta383/nfq7di2ObqpL
         71NSaS9CZfUUlr6uIgweoCVOhNMEh4R9U5QIEoljz++7U9nmdQYGgqfj1L0odCNOBCaM
         4M3g==
X-Forwarded-Encrypted: i=1; AKwUvBxWb2j8jp0YNJkmoT3UVwmjut6KKqRmSuc8ZKCKWjjZa5c2vGPcqOUFk9MqV7c4UeyccAtK@lists.linux.dev
X-Gm-Message-State: AFuF++mMHS9XueXoRwfOkd9hRv64dvYPxjdkkKIueoPODM2UnKiqZba4
	xfJgtOeFzXEwli9N7+kXotUOyfu3oFeHhC/BxPEvABjVNWK0t99Xz9TGrK/XhSCVC2RNPVmMABd
	YpkHEIfk7NodKlh/Xr3g9Z7cYDP6i+hY=
X-Gm-Gg: AYBFou0UhB3kZWNT0JOZef3AZkqpFxgWdFSEmTGrgkX4MoDiXoWpn7JzzyTc5IAbuKW
	pDWtHEoEJs+pjNqhuYNSaDIDd7XHswguZHoLuZlURMB4kvAtDteFLtNIcugFnbLE/Ea8eO4Y1gv
	QaZbedq7c6b4PSau5BJO7hF3C4BBRFgoQd5rp661IxagBnrs+/jfolCxTdj88cvp36pUAkGq2Lq
	Ho44dswrD76qhFzz29hxMNQ2mU+3c/NsBk2UJEbx/5tjYZ0+1e3uPd2osjKddlBbNXhfsGF5ZGD
	m6MzEGGoRsrGUrtfPwaswe1P8ERWv/0wntT8Pioalu1plVJLuOHyKKzb4XU56hpc4ls6wmAioIo
	6QMGlREVvgFHD+3ep0AkFVLjbPPJkz16m4d2kmMjHfZ/62gR+HjROVWprcZiyRQ==
X-Received: by 2002:a17:90b:1e04:b0:396:463e:2eeb with SMTP id
 98e67ed59e1d1-39b264b24e2mr23088437a91.0.1788809597288; Mon, 07 Sep 2026
 12:33:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev>
 <20260904-b4-arm64-callops-kcfi-v1-8-ce6687739b0c@linux.dev>
 <CANiq72=xOrSXBBdmrKYfX1=qgF37LRAMzMJd4GJkXaYHMVe9yQ@mail.gmail.com> <ap3Z-YDtzmdtMiMk@linux.dev>
In-Reply-To: <ap3Z-YDtzmdtMiMk@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 7 Sep 2026 21:33:03 +0200
X-Gm-Features: AcwNN1UJ5AD1nmjaRgagxZvj3fkfuD3Z7c-j0Zc231NENpcPq2HjO9j40kxIvNk
Message-ID: <CANiq72mVXNmqh-RdOunFLBKRwMgYHFBqJOP7NbXrd8WHPb3sAw@mail.gmail.com>
Subject: Re: [PATCH RFC 8/8] arm64: ftrace: Allow CALL_OPS on kCFI kernels
 built with Rust
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 11:24=E2=80=AFPM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> # Do not pass -fpatchable-function-entry to bindgen: its libclang may not
> # support the section argument (Clang >=3D 21), and parsing does not need=
 it.

Thanks! Hmm... Not sure if "parsing" is the right word, i.e. a flag
change could still make `bindgen` parse and generate code fine but not
match the ABI of the C compiler.

i.e. I guess I would have expected something like "...: its libclang
may not support the section argument (Clang >=3D 21) and the removal of
the flag does not change the ABI" or similar.

Cheers,
Miguel
