Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17057E770;
	Tue, 12 Dec 2023 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdjPA9iI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC667C433C8;
	Tue, 12 Dec 2023 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702404689;
	bh=aTooqJi/9Xqt+cjd7L60cT1QoG/95iwAClvybjn4azg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdjPA9iIzUZ7l/nAHzvy/OeSlIAYRsNiKBMKtrQqYKw/Jdc9FTOD34Y/mnyquQYim
	 uNwcLlJ/vv9WNHgTrCt+IIJa8vTFiOLnNI01NVTMeZ81k0tLqtdvoIKtedzlXkKZW0
	 T3nt+aohd++A9PFa6Q+xlt3Zps7xM9biP/jQbiiuObdi6cVQkNWqNsqcfBDcLtTKah
	 O5sKDiNYc7UWqTEWyr8rGnG7J0y1qvDpb2qy7AbLk9Xklhium0XwqfeL9mRnvf2RDP
	 HBL/EBRLV+FkDfEtr4ORjbUy2pP96nco1IltvImbpPoSrnQo7tqO+LNvFrVPTA0hDW
	 io7qZeHuen8eg==
Date: Tue, 12 Dec 2023 11:11:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
Message-ID: <20231212181126.GA2910857@dev-arch.thelio-3990X>
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
 <df0d8a01-eac3-43b2-8498-e237a0fe6eb5@nvidia.com>
 <CANiq72n5OB0X9sHoNf-htRY9z93gzdg-BqdrOUDTqTEvUytoNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n5OB0X9sHoNf-htRY9z93gzdg-BqdrOUDTqTEvUytoNA@mail.gmail.com>

On Tue, Dec 12, 2023 at 01:43:16PM +0100, Miguel Ojeda wrote:
> On Tue, Dec 12, 2023 at 4:14 AM John Hubbard <jhubbard@nvidia.com> wrote:
> >
> > "make LLVM=1 <anything>" doesn't work for me, and therefore I suspect it
> > doesn't work for at least a few other people, as well.
> >
> > Instead, I have to run "make CC=clang <anything>", which works just
> > fine.
> >
> > The docs should consistently reflect this, yes?
> 
> No, they should not. `LLVM=1` is the "right" one for all architectures
> (except s390) -- see Documentation/kbuild/llvm.rst.
> 
> If `LLVM=1` does not work for you, then that should be fixed. Could
> you please give some details? For instance, is it related to Rust
> (does it work with a `defconfig` build without enabling Rust)? Do you
> have all the LLVM software installed with the right names (see what
> `LLVM=1` expands to)? etc.

Right, there are definitely edges cases with LLVM=1, namely for s390 as
mentioned as well as powerpc but for at least arm{,64} and x86{,_64},
things should work well and they should be fixed if not. Additional
information and bug reports are always welcomed at either
llvm@lists.linux.dev or https://github.com/ClangBuiltLinux/linux/issues.

Cheers,
Nathan
