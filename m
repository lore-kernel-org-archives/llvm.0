Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6992D2D247;
	Tue,  6 Jun 2023 22:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61186C4339C;
	Tue,  6 Jun 2023 22:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686090543;
	bh=BE/Y78iy49nztkz3B5s6KdQt99eoZP/TQ2E6JCvgLgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPjbOJUanlgEhGuh3eudn3EeTrBQfiBtMJrMUPZe0/CrAOZQNkCimZAbZyJec3UN/
	 7L0HYyfYZLNfR+SHaI0eavaM8akiWXPRTb8EcUrJ9nqPf/eEIymhJRSMUjQ5aXJA5a
	 6Ci1lBAWpOHT15pFRT/sRhVJ+Mx8cpZNXpN0fpaeBgxoLWHo4lfOVB3jPkYLbZ2EWb
	 Z4VKa7xQGJeqrdyROpyCcvcEePM+ldBIsMu6GT1dzjm+bpqO7H9EM2qEmCwUrkCP95
	 q3El9eKvBLEzaca3grvyj/LtQQQIazW6RqvrGOTXEWIjeLycs/vFEmA5eZi2ccTazk
	 KCQBP8SdJ125g==
Date: Tue, 6 Jun 2023 15:29:01 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Miroslav Benes <mbenes@suse.cz>,
	kernel test robot <lkp@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [tip:objtool/core 8/12] vmlinux.o: warning: objtool:
 rust_begin_unwind+0x5c: rust_helper_BUG() is missing a __noreturn annotation
Message-ID: <20230606222901.kzz5dpglz7c5okhk@treble>
References: <202306070408.EFxuDoRs-lkp@intel.com>
 <20230606215212.r7if2gsynajugf6j@treble>
 <CANiq72nD3wvOxfUq9mxTiPDbf+VKmbU+eVepO7QY_G2LT-UOEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nD3wvOxfUq9mxTiPDbf+VKmbU+eVepO7QY_G2LT-UOEg@mail.gmail.com>

On Wed, Jun 07, 2023 at 12:22:45AM +0200, Miguel Ojeda wrote:
> On Tue, Jun 6, 2023 at 11:52 PM Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > So it seems to be an issue with bindgen, though that github issue has
> > been resolved.  Any idea when this will show up in a toolchain?
> >
> > In the meantime we may have to get objtool to manually silence the
> > warning, unless you have any better ideas.
> 
> We were going to update `bindgen`, so we can just do that -- one more
> reason to do so! :)
> 
> If the update goes into the upcoming merge window, would that be fine
> with you? Or do you need it for this current cycle?

The next merge window would be good.  Eventually I want to get objtool
to zero warnings so we can do -Werror, but we're not there yet :-)

Thanks!

-- 
Josh
