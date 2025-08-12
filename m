Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9901EA6F;
	Tue, 12 Aug 2025 07:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754983678; cv=none; b=SlR6vQrvpcS3OGPEwp5j+XrhsdGl7DI8SEG7iWuwIqy+sFTzFFAuun2icrkm79e6zKH2rNB6f7/VXtna0BndvZ/CEHCWm95x23IvFmPT9YSkWk/zjDgXzQYEODIzSZC/ouectP7t90qcw0tgbmOnGb8SHwAxHJw3G25iZ014q3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754983678; c=relaxed/simple;
	bh=3e0EXaa+An4prh17FZN5+ByIUcZFPT//X78WqBkRjrY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qBrnSd7u4ORnj93QHCk6RejjDudb0+ae2agRxy6iyvSbC1x/wF72ho03XjfzA5vMFccKCrARPp/TFHbxIRYEyj/5iydhFrtGU+dwfFp9bPYd64GAwQI24NxJSgCc6nH0SaEpZIfXoDZ52L+JkKXCuSVN8EVh4R3I6pt2Z0B4Nvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADi5A/zb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADi5A/zb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438C0C4CEF0;
	Tue, 12 Aug 2025 07:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754983677;
	bh=3e0EXaa+An4prh17FZN5+ByIUcZFPT//X78WqBkRjrY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ADi5A/zbstIaLYuBH0MTxYxne9ur5CQ2iequZ+CAXyFnCcb/2ic9J6DnI1XC4vWex
	 v/gv+N/UdkEmGTu9fCmOkmkb/XUifU4YWi+MT/Bwf3N66P3h6WAGzFkUHKyvuOGbh3
	 Logyl9qcydOUXpnql7kE7GlSIeUNP3CI9XPm961PipTEGXQeNZep5CaQmn4QY9kiYZ
	 eNLBA+WqrKvr1kh/mKjosvOESVoHAOc30J66z9Nwq9UEJgO5YERbKUH6RkxalZY5SU
	 Sp4W/qU24KkmNvm8arjN3ntDqtXkR6kTWxPSTWJqTeVssecbs8K30accLFTZBS2cfX
	 F5NglqnIC/yeg==
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 09:27:50 +0200
Message-Id: <DC09SG6IXEOG.3Q8DMJF5E7QBO@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>
Subject: Re: [PATCH v14 2/3] rust: support formatting of foreign types
From: "Benno Lossin" <lossin@kernel.org>
To: "Tamir Duberstein" <tamird@gmail.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Peter Zijlstra" <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, "Will Deacon" <will@kernel.org>, "Waiman Long"
 <longman@redhat.com>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Christian
 Brauner" <brauner@kernel.org>
X-Mailer: aerc 0.20.1
References: <20250710-cstr-core-v14-0-ca7e0ca82c82@gmail.com>
 <20250710-cstr-core-v14-2-ca7e0ca82c82@gmail.com>
In-Reply-To: <20250710-cstr-core-v14-2-ca7e0ca82c82@gmail.com>

On Thu Jul 10, 2025 at 4:53 PM CEST, Tamir Duberstein wrote:
> Introduce a `fmt!` macro which wraps all arguments in
> `kernel::fmt::Adapter` and a `kernel::fmt::Display` trait. This enables
> formatting of foreign types (like `core::ffi::CStr`) that do not
> implement `core::fmt::Display` due to concerns around lossy conversions
> which do not apply in the kernel.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General=
/topic/Custom.20formatting/with/516476467
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

I'm not 100% sure we need to always use `first_span`, but it's probably
fine.

Reviewed-by: Benno Lossin <lossin@kernel.org>

---
Cheers,
Benno

> ---
>  rust/kernel/fmt.rs     | 87 ++++++++++++++++++++++++++++++++++++++++++++=
+-
>  rust/kernel/prelude.rs |  3 +-
>  rust/macros/fmt.rs     | 94 ++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  rust/macros/lib.rs     | 19 ++++++++++
>  rust/macros/quote.rs   |  7 ++++
>  5 files changed, 207 insertions(+), 3 deletions(-)
