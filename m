Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DBD42A96
	for <llvm@lists.linux.dev>; Tue, 25 Mar 2025 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742871764; cv=none; b=WtqxNC2ZfEedjSTZvjKknt9rhPA/JQzqLICft62j1xPKR96kTSjdJxPe4talqbFXz8L1P51rdRoYkQkyfsIibv8L4rsgeqRkFtM1y3BDw9yysbuW5XxmgzSF8lGHEd56eU6PUKbrMNCcAw7CCws8+iK3ajaYaU5tQOtqMj98uzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742871764; c=relaxed/simple;
	bh=p+6PwRCtOXKT7ZJv96aTDIh/LRMyr3o7sI/Y1/kJn5I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Sg9B6yTv3bh7PkpW4qI1822DCj4ZInef/lGiji9bHAMkWdUVWD1csn1UyZqrUfixvgdp4Cg8x/aXVXPG2AM4W0gxy9v5PMRKyaPbZsoh81mgVTA/pRVfGMMzOoefJOX4CoU7OGZyEb/Fgc6OoyG+omc4OyFMXR4P7RZvCBLU2j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PUu+TYpj; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PUu+TYpj"
Message-ID: <52e7d34e-cf86-40d6-a294-b318df98d72a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742871760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGGsd72H09Ek4y5Nasx3ldah0+WIfjmF4R9A3El2Gqs=;
	b=PUu+TYpjV89j/VYrhe12ry4OhxeGSCw5aIZ3H1/JBah4h8SPGbDBX7xlgwnNaSRF5bdnYw
	Ex9q8FoYlmI6FH0MWym2+K6fCdyFdznFmZChjy6qVGWvCS80saUwOh3nqhlOa2H05nGVua
	/ha1F1sMacAizT5OrurYNI8iWw7xMGc=
Date: Tue, 25 Mar 2025 11:01:45 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kunwu Chan <kunwu.chan@linux.dev>
Subject: Re: [PATCH v2] rust: sync: optimize rust symbol generation for
 CondVar
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Kunwu Chan <kunwu.chan@hotmail.com>, Grace Deng <Grace.Deng006@gmail.com>
References: <20250324061835.1693125-1-kunwu.chan@linux.dev>
 <CANiq72=KjT8HRJA0NStHeqm-9286gay496CU8edNALPQ9_N+ww@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72=KjT8HRJA0NStHeqm-9286gay496CU8edNALPQ9_N+ww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2025/3/24 17:37, Miguel Ojeda wrote:
> On Mon, Mar 24, 2025 at 7:19 AM Kunwu Chan<kunwu.chan@linux.dev> wrote:
>> Link:https://github.com/Rust-for-Linux/linux/issues/1145
>> Suggested-by: Alice Ryhl<aliceryhl@google.com>
> Nit: I typically use Link after Suggested-by, to mimic what the docs
> require about Reported-by with Link. (No need to resend a new version
> just for this :)
Thanks for the kind reminder, I'll follow this next time
>> - Remove '#[inline]' for notify()
> It is good that the commit matches the log now, though I wonder if in
> the future we may want the `#[inline]` for `notify` anyway, even if
> LLVM does that one on its own today.
Now, the default '-Copt-level' is 2 when define 
'CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE',
and in  KBUILD_RUSTFLAGS the  '-Ccodegen-units' is 1.

So if the config not change, the result should be the same.

And the actualy compile steps for rust/kernel.o is as following:

make -f ./scripts/Makefile.build obj=rust
# RUSTC L rust/kernel.o
OBJTREE=/media/kunwuchan/68d922f3-5dde-45b0-af93-c45ba81d85ef/linux-next 
rustc --edition=2021 -Zbinary_dep_depinfo=y -Astable_features 
-Dnon_ascii_idents -Dunsafe_op_in_unsafe_fn -Wmissing_docs 
-Wrust_2018_idioms -Wunreachable_pub -Wclippy::all 
-Wclippy::ignored_unit_patterns -Wclippy::mut_mut 
-Wclippy::needless_bitwise_bool -Wclippy::needless_continue 
-Aclippy::needless_lifetimes -Wclippy::no_mangle_with_rust_abi 
-Wclippy::undocumented_unsafe_blocks 
-Wclippy::unnecessary_safety_comment -Wclippy::unnecessary_safety_doc 
-Wrustdoc::missing_crate_level_docs -Wrustdoc::unescaped_backticks 
-Cpanic=abort -Cembed-bitcode=n -Clto=n -Cforce-unwind-tables=n 
-Ccodegen-units=1 -Csymbol-mangling-version=v0 -Crelocation-model=static 
-Zfunction-sections=n -Wclippy::float_arithmetic 
--target=aarch64-unknown-none-softfloat -Cforce-unwind-tables=n 
-Zbranch-protection=bti,pac-ret -Copt-level=2 -Cdebug-assertions=y 
-Coverflow-checks=y -Cforce-frame-pointers=y -Cdebuginfo=1 
@./include/generated/rustc_cfg --extern ffi --extern pin_init --extern 
build_error --extern macros --extern bindings --extern uapi 
--emit=dep-info=rust/.kernel.o.d --emit=obj=rust/kernel.o 
--emit=metadata=rust/libkernel.rmeta --crate-type rlib -L./rust 
--crate-name kernel rust/kernel/lib.rs --sysroot=/dev/null
# EXPORTS rust/exports_kernel_generated.h
   llvm-nm -p --defined-only rust/kernel.o | awk '$2~/(T|R|D|B)/ && 
$3!~/__cfi/ && $3!~/__odr_asan/ { printf "EXPORT_SYMBOL_RUST_GPL(%s);
",$3 }' > rust/exports_kernel_generated.h

> Cheers,
> Miguel

-- 
Thanks,
   Kunwu.Chan(Tao.Chan)

