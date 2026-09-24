Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A354D5983
	for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 23:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790293206; cv=none; b=R51c1rB9B53X3WoajsLgAeIRTlfWzD/tJcDMS9oOV1EvqjzbZFRuKu8xJkHA+od80f/8Pj+uBoPuzBMphOW99SKgUTbN+EV3iYpuhcGkG4A5juqGvp7q8YpvxK8kBkAH/4ENlXorLmp1yuX+v6RmECubYglvHDkS1VYZ+etVfjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790293206; c=relaxed/simple;
	bh=4h4cpDObZqi2JEPN69eOCH4YBG2slYUeYHjBIAENU48=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=oZ2W8gwYU4JSWesAgNW+foxNpmKs58gJvZ0xANX0ygqtwMLFAV/l80Mv592g3fpq/0cydnbTFRoFkWlfkXFzB7mqbR3cxX72lgZsm2El8GlF1cYrUIIy+Q5NNXphRvd1n/9pwQqfsE6mAeqYW3H3vDurezBCpUSXBVog9ZmXM1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fasBR6D8; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fasBR6D8"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so77124a12.2
        for <llvm@lists.linux.dev>; Thu, 24 Sep 2026 16:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790293204; x=1790898004; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gn5dD1CJfoor6GODqvLgahaKF8S1PUZ5xI0XuIL5LIc=;
        b=fasBR6D837UanxRmpUxyMgqFuj8CJX2Sm0DMUbqyGIhDllju+CjfcGmGP3qwhq8XvH
         qY1Uv4RKeNtOooQx2Umjx4aWDiAcFsiPNWK9Pl8Gf9DYradq0Ut8HCHcn1NGOkOKGsFv
         R9lAyGf0xahsmJeSsSaJyW8YJbo6NhNMUdLraCGilXvJ4dNZVwiZ1YyxVHpy5Qy6Plhz
         NA/n5DqYSTGArE37B8NhU1BEos/gOvHtWtEVdUZTMWIxBWDvMKGUcK58kWwlj3uSFYd+
         DEsZrLO0B5vxClQhvLTkVImW6aJIqcz4AcQ2hMx2WwDBsTFDK/o/qQ7o5QANd32TgDWK
         v7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790293204; x=1790898004;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gn5dD1CJfoor6GODqvLgahaKF8S1PUZ5xI0XuIL5LIc=;
        b=IeNCAYtlmT3k+hiuYxey/7J5s35dkBHR4dcT58n1jHuZ9i+cjpBr7eCJsAEwzix3yM
         mkdJ19ODmjEt9DkfYAWdbDa/8NgurqZK39MtOw0InbpSDNz8ryh75b1+t7QKjC56WLg0
         5sZSegGGiPQL5FjmV3Hu0IvY8Hpdqt4lOiBWs+4O/aj/T4YoYOAoEaEuEzxVbXnewd7h
         m9+UHy+Fnk8nUbXLKjKRbhlVROXDU00MfNR5rP4GCNJDJkLY3CdoRv/0sVd1nkctvqCi
         hIrwz/xqPsYCszp3s4+2Qa0pdJAuOXE7sIPb0Q+OEXGOj1uu+bH11YKOXi78krfcxTAe
         juDQ==
X-Forwarded-Encrypted: i=1; AKwUvBx21nGQ0V2RIzLl1DttXU60GCMBvYVJLQRrc9ZBrC8jYec3UGjFzwVdvFXtig4zUG0btIBV@lists.linux.dev
X-Gm-Message-State: AFuF++l/P7a+V0adT7CmTGns7NGZ5SzJClgdai/BAH5mcK3F2UdVh1X4
	P5tHxTsuqzQKx83Ob9OQi+O3GzUc+BcS+vCW2q5QuR6psLy0XKXsp8K1
X-Gm-Gg: AYBFou2246jWQ8haOnMwvVFyzxjqQm6KExLIbfdrMokliTGPYBKRNcKXmSvZadBAOKG
	+qaZQg0y8skxEY8zTRLHv9JMn+wJ3ZHMhW/BdAQVu0WvoL0fUsobR75Rt1rT10ue25PN/umoAR+
	7VQTyaHY+5TBLElTuFJcGo1QBqjKmX00dSpBT363P4SQ3a945gXLkUJ+tVlnotHLVl8ZCI1y4gn
	f9okjiJXNZJHkLKTD7b0uU1vjzGYuFPyodPJ5zdEy93tBl7XlQ0hjZmimSi/8cO6DGD+gC0wJwt
	jvGnfXCRSW05l42mnpeGfzdmsJVOnrv56IKsqnslYXfh7WoIKel14eEoOtR4KKYRXa2+A8TDdCl
	8IAkynWah5cZ5K5PvIDpq6zAJ9u7knnIiAOGgl2qhPIdmFVi6rfbkGNbQwdM3j9D/BxbM8i32rB
	Cu46T/EKWAk/EHEVPV/WQZoyFew+vQvBCvsdEKK7A5fU9Wsenf/ozs1r/6cCC9SGknoMd2nEunc
	VgXkuHIDk/ZoyeIoU6Hic6izCV4P4zqnwOKJo6FENM8lBuBiv6l8WONZGADV3pojb3MvS1A91q/
	z+0=
X-Received: by 2002:a17:90b:1648:b0:39e:6c69:34d8 with SMTP id 98e67ed59e1d1-3a098fc574cmr3554656a91.60.1790293203799;
        Thu, 24 Sep 2026 16:40:03 -0700 (PDT)
Received: from localhost ([153.61.198.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efaeb3sm909723a91.2.2026.09.24.16.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 16:40:03 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 24 Sep 2026 23:40:01 +0000
Message-Id: <DLNXZ2WK7TPD.2RZBUNRS4FA4L@gmail.com>
Cc: "Leon Hwang" <leon.hwang@linux.dev>, "Ihor Solodrai"
 <ihor.solodrai@linux.dev>, "Josh Poimboeuf" <jpoimboe@kernel.org>,
 <live-patching@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
 <llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <bpf@vger.kernel.org>, <linux-efi@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Ben Cressey" <ben@cressey.dev>, "Florent
 Revest (Anthropic)" <florent.revest@linux.dev>
Subject: Re: [PATCH v2 6/9] arm64: cfi: Use
 CONFIG_ARM64_FUNCTION_PREFIX_NOPS for the type hash offset
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nsc@kernel.org>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Bill Wendling" <morbo@google.com>, "Justin
 Stitt" <justinstitt@google.com>, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Puranjay
 Mohan" <puranjay@kernel.org>, "Xu Kuohai" <xukuohai@huaweicloud.com>, "Ard
 Biesheuvel" <ardb@kernel.org>, "Ilias Apalodimas"
 <ilias.apalodimas@linaro.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Sami Tolvanen" <samitolvanen@google.com>, "Kees
 Cook" <kees@kernel.org>
In-Reply-To: <20260924-b4-arm64-callops-kcfi-v2-6-587865b6d991@linux.dev>
References: <20260924-b4-arm64-callops-kcfi-v2-0-587865b6d991@linux.dev> <20260924-b4-arm64-callops-kcfi-v2-6-587865b6d991@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, Sep 24, 2026 at 10:35 PM Jose Fernandez (Anthropic) <jose.fernandez@linux.dev> wrote:
>  static inline void emit_kcfi(u32 hash, struct jit_ctx *ctx)
>  {
> -	if (IS_ENABLED(CONFIG_CFI))
> -		emit_u32_data(hash, ctx);
> +	if (!IS_ENABLED(CONFIG_CFI))
> +		return;
> +
> +	emit_u32_data(hash, ctx);
> +	for (int i = 0; i < CONFIG_ARM64_FUNCTION_PREFIX_NOPS; i++)
> +		emit(A64_NOP, ctx);
>  }

For the series:
Acked-by: Alexei Starovoitov <ast@kernel.org>

unrelated minor issue:
ctx.offset[] is counted from ro_image, but bpf_prog_fill_jited_linfo()
adds it to prog->bpf_func which is ro_image + cfi_get_offset().
So with CFI jited_line_info is already off by one insn.
After this patch it will be off by 4 or 6.
s390 does
	jit.addrs[i] -= cfi_get_offset();
before the call.
Would be great to send a follow up eventually.

