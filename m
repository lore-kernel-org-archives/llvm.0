Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920C21EB9F4;
	Tue,  7 Jan 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736249536; cv=none; b=TYiV7cI1dgVXDiu09QJg+c0vZa4YIHYJ+4Wt8uf+DckvB007wjAWMHWRBlkRiogUTXpWW5RL/rr7mA4/aNjQaXWMIX4rzXOakI+s+W87XzehtRqcf3YNNRf+Ed/deLoHxqJM9dSkg6EZTWFLS+kanILc5P82G9f5FvaMCSupZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736249536; c=relaxed/simple;
	bh=lG4Nce+uZ0sTr28rqk1YUfOYT97MSuZqJYXmHKbftKM=;
	h=From:To:Cc:Subject:In-Reply-To:Message-ID:References:Date:
	 MIME-Version:Content-Type; b=mhY+Bj1g7l56ghR5CuUN2g/wmapruvUG79b+f0rYzXBqeqM0RMf0RMEvFD8y+VJ2B8MKi5AJ+ygMaMmv7DfHwtlci/TdtAGaXX7MBQKAh1hsnkFRKI0ZNm6BgtKu9H7xA3vqz4xM1M4cE2X+v4QYM6Gsj1SFiuqN65+j0cREdZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c3mBKXyf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c3mBKXyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C2CC4CEDD;
	Tue,  7 Jan 2025 11:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736249535;
	bh=lG4Nce+uZ0sTr28rqk1YUfOYT97MSuZqJYXmHKbftKM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=c3mBKXyfhUPHX3Lm01KTM2LluhVu4RigTuHqECCc0HNJO07sJla02YOTYs1b10rDo
	 LDaZXSkWzbYVOjCNLh9zZAVD2hM0CpFbR5gzQXm5Wc4spUv1YLjmhK/ZuC1cYXqBKm
	 K9geIa1IFv6NknaUDkUHSgyjkAvGnr+apgOxj2OskvwBjVHddtmnhB/nKfixHqwRRR
	 YIlJzA75Nah0PFdmH3bXuOLmhQahbrwaVDb6lI1c0DiwqIDtyg9EAfiXtcEHV+Pw4D
	 lwKLWMvEIL3vmWvVbHBOYgbuIWHZL+Ex22DBnLEy+FDsk4u+Ekn490r/RBDRl3jEly
	 kjBv7VO/8AvGQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  =?us-ascii?Q?=3D=3Futf-8=3FQ=3FBj=3DC3=3DB6rn=3F=3D?= Roy
 Baron <bjorn3_gh@protonmail.com>,  "Benno Lossin"
 <benno.lossin@proton.me>,  "Alice Ryhl" <aliceryhl@google.com>,  "Trevor
 Gross" <tmgross@umich.edu>,  "Nathan Chancellor" <nathan@kernel.org>,
  "Nick Desaulniers" <ndesaulniers@google.com>,  "Bill Wendling"
 <morbo@google.com>,  "Justin Stitt" <justinstitt@google.com>,  "Masahiro
 Yamada" <masahiroy@kernel.org>,  "Andrew Morton"
 <akpm@linux-foundation.org>,  "Petr Mladek" <pmladek@suse.com>,  "Tejun
 Heo" <tj@kernel.org>,  "Yoann Congal" <yoann.congal@smile.fr>,  "Roman
 Gushchin" <roman.gushchin@linux.dev>,  "Jens Axboe" <axboe@kernel.dk>,
  "Chen Ridong" <chenridong@huawei.com>,  "Jann Horn" <jannh@google.com>,
  "Mark Rutland" <mark.rutland@arm.com>,  "Vincent Guittot"
 <vincent.guittot@linaro.org>,  <rust-for-linux@vger.kernel.org>,
  <llvm@lists.linux.dev>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] kbuild: rust: add
 `CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE`
In-Reply-To: <20250105194054.545201-2-gary@garyguo.net> (Gary Guo's message of
	"Sun, 05 Jan 2025 19:40:04 +0000")
Message-ID: <87sepu6g01.fsf@kernel.org>
References: <20250105194054.545201-1-gary@garyguo.net>
	<g0aCpjtjrF4h4VqDb6tPmmnpMuCSrny8aEjIp9Ljh2oCMHauEcnZJcWWgJRPbLz5v2vx2wMhP-DccxS6fi-nSg==@protonmail.internalid>
	<20250105194054.545201-2-gary@garyguo.net>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 07 Jan 2025 12:29:39 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> This config detects if Rust and Clang have matching LLVM major version.
> All IR or bitcode operations (e.g. LTO) rely on LLVM major version to be
> matching, otherwise it may generate errors, or worse, miscompile silently
> due to change of IR semantics.
>
> It's usually suggested to use the exact same LLVM version, but this can
> be difficult to guarantee. Rust's suggestion [1] is also major-version only,
> so I think this check is sufficient for the kernel.
>
> Link: https://doc.rust-lang.org/rustc/linker-plugin-lto.html [1]
> Signed-off-by: Gary Guo <gary@garyguo.net>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


