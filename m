Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159E1808
	for <llvm@lists.linux.dev>; Sat, 16 Dec 2023 00:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XO1ZnUDA"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso14139635e9.2
        for <llvm@lists.linux.dev>; Fri, 15 Dec 2023 16:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702688040; x=1703292840; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0wkBeN2mknWfCaYD90okNAjhG97xOBmh5EL3y5dSjM=;
        b=XO1ZnUDAs3T1P4VF7BgoTKeuyVSR8C2zufXBNWX0QqbiMkNGdRXvvGGA0tjAeif5Up
         l8LI0bwzG5Gs5592jXyt4NJKRShir7RarQxSBjQF2ocN20UE9iQvnIPoP6IjZSpP3Fsj
         ypNi/RO/bntLVrcKRXpKOkWGYuvbIUBsz3KoDQ5zJeEsRElseEJwahMF58zXt+XZWvRo
         dBpuL5AuSHKiPIBu8Xk1sljxGfTXCn/dEiNeYfD8/1NedRejHx/+7BRXk5puiAV7z0gy
         kcZeEGlHDa0WkRN7BvxnA5EWvtlQ6WAohHx7MqzEUWi9K18YKO/cu8f31TKZiT4r+NlQ
         VUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702688040; x=1703292840;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I0wkBeN2mknWfCaYD90okNAjhG97xOBmh5EL3y5dSjM=;
        b=v60G0G1yXPD2qCbGesbrn+pEXmG6o+B2okK3XC2HDXPTycztB4mnp3rdPsC7JS5yUU
         K1opCIye2ua1LWWDbePexMfab8j8te1pGzSvNzsDXrbYrAXjLzidU4aPpeOEMiuY2XNC
         jPTs133XuJFvecu+S9tbE24VvIi1t9z5kUIitaIfgv8AavWRhyHlAmP+/GAMEDKZ7sYs
         nX6spSCFbgM23YAuBWswy2HLI1Ys3XSZEuRAt9YjuCI5EUlhhNjWlU4egsr3Foy2MLmn
         0LiDHJldOz+TX8Ljv6UjpYWkO3a/LoDrz48rccKbhDtNnYOVCh1AkfCuhCC5T0mWYkDP
         zq7Q==
X-Gm-Message-State: AOJu0YzbXOgsC0MGj30F2YQVUSR1zin7YDL2aKr/lc7GgbN8zplzaar3
	4QGTzoJXvRiKQ24MtEXQWWqE9/nKfpwZdStk4W4=
X-Google-Smtp-Source: AGHT+IFuGmazbLWUSb4nLKggAzQnLeNmhiza7lIRh77ULXtw19cTSgKhotygxYJ0AUw8jKf6X6LfkImHGcy9Q5DkS7c=
X-Received: by 2002:adf:f609:0:b0:336:458b:38d with SMTP id
 t9-20020adff609000000b00336458b038dmr2405362wrp.115.1702688040032; Fri, 15
 Dec 2023 16:54:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231215091216.135791411@infradead.org>
In-Reply-To: <20231215091216.135791411@infradead.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 15 Dec 2023 16:53:48 -0800
Message-ID: <CAADnVQJoEkdjyCEJRPASjBw1QGsKYrF33QdMGc1RZa9b88bAEA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] x86/cfi,bpf: Fix CFI vs eBPF
To: Peter Zijlstra <peterz@infradead.org>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Martin KaFai Lau <martin.lau@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	Network Development <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	linux-arch <linux-arch@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Joao Moreira <joao@overdrivepizza.com>, 
	Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 1:33=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> Hi!
>
> What started with the simple observation that bpf_dispatcher_*_func() was
> broken for calling CFI functions with a __nocfi calling context for FineI=
BT
> ended up with a complete BPF wide CFI fixup.
>
> With these changes on the BPF selftest suite passes without crashing -- t=
here's
> still a few failures, but Alexei has graciously offered to look into thos=
e.
>
> (Alexei, I have presumed your SoB on the very last patch, please update
> as you see fit)
>
> Changes since v2 are numerous but include:
>  - cfi_get_offset() -- as a means to communicate the offset (ast)
>  - 5 new patches fixing various BPF internals to be CFI clean

Looks great to me. Pushed to bpf-next.

There is a failure on s390 that I temporarily denylisted
with an extra patch.
And sent a proposed fix:
https://lore.kernel.org/bpf/20231216004549.78355-1-alexei.starovoitov@gmail=
.com/

Ilya,
please take a look.

> Note: it *might* be possible to merge the
> bpf_bpf_tcp_ca.c:unsupported_ops[] thing into the CFI stubs, as is
> get_info will have a NULL stub, unlike the others.

That's a good idea. Will clean up unsupported_ops.
Either myself or Martin will follow up.
