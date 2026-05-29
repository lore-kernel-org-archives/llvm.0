Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2DE31077A
	for <llvm@lists.linux.dev>; Fri, 29 May 2026 15:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780067748; cv=none; b=otbH+3QklOxy6eLb0Tc1+JBDgwjfUkiU9hUWXwCplbip1H96GGuSt66FWZkyE46b34lXruks4vpTpTJikeOpUh7isl6nWTwa+KND/aKgaqgFODAu10A28caZht162sY44q2d1tpUCwAvsKUBm+zLCqmfTNR1B3uLeMRxBgKKMRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780067748; c=relaxed/simple;
	bh=fWFAdV+JOyH12J5qJODzNqZnI6jDhwXChZlfdA7v5UU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JivXopepUODN7fzsk+IQEEilsuRIsEeFmZGLii7Yjd0dsSdq4Uy2HaWhLQkWJog45RD7cxI/3yx4kBAW+4II3XOk3dyu8T9SrXT8adNkpN7HRLViKaFoG4vpUhHdz8vUwrkJpB4SdJu14g4cLXTx1DFFJCdZS9NHvL97wTFnH/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ulQ1ZLSk; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ulQ1ZLSk"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11937237B;
	Fri, 29 May 2026 08:15:41 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D6BF3F632;
	Fri, 29 May 2026 08:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780067746; bh=fWFAdV+JOyH12J5qJODzNqZnI6jDhwXChZlfdA7v5UU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ulQ1ZLSkMPkrB5QdlIIxzjsjRL/856PTT171Di/imlqfT6z47bwj81HeytSTjyrkH
	 Tv/1S+UD2KVsIbccpaBYIcE2XndYnNbJ88KGSkdqnDTQweyGm0BBiSQatF/KXty/wX
	 6Y+5HCL5EM+r/czqLAPAVIUWOMgvP7weju94qQJs=
Date: Fri, 29 May 2026 16:15:40 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Will Deacon <will@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
	stable@kernel.org, Bo Ye <bo.ye@mediatek.com>,
	Isaac Manjarres <isaacmanjarres@google.com>,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] rust: arm64: set uwtable llvm module flag for
 CONFIG_UNWIND_TABLES
Message-ID: <ahmtnD9hD1uc9FFU@arm.com>
References: <20260527-uwtable-module-flag-v1-1-caa41342be4b@google.com>
 <CANiq72mCYOXrWM7_3jby_ZvYmspXsYVzRqhTgQiBF0bdDLAaEg@mail.gmail.com>
 <ahkzD01e14wOTNBk@google.com>
 <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=eccCAvfG4kYA52uV5+1ysU6QFYq+3GUgTVwJ4=kxDwQ@mail.gmail.com>

On Fri, May 29, 2026 at 04:29:26PM +0200, Miguel Ojeda wrote:
> On Fri, May 29, 2026 at 8:32 AM Alice Ryhl <aliceryhl@google.com> wrote:
> > Hrm, is there a way to perform the version check in the Makefile, or do
> > I need a Kconfig for whether the fix is needed?
> 
> We shouldn't need a Kconfig -- we can do e.g.
> 
>   KBUILD_RUSTFLAGS += $(if $(call
> rustc-min-version,109800),,-Zllvm_module_flag=uwtable:u32:2:max)
> 
> I tested with 1.96 and nightly -- I can apply it to the Rust tree if
> arm64 prefers.

Please do.

-- 
Catalin
