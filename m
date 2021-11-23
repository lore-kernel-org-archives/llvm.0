Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86E02C82
	for <llvm@lists.linux.dev>; Tue, 23 Nov 2021 16:45:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1DCEA60C4A;
	Tue, 23 Nov 2021 16:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637685945;
	bh=3KEImncoqMLthsMarKv21aRN6/5hNWPKDMzLQKihgKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=koRSe/9rQ/dfUInsksU7RXviAdkKjVU+u7VVZh8IRsU5d6ULNKTT74BGLEKjeXSvm
	 06lE1xMJQryO8mIoioqNC5O0bMdl+GXnb/i+yeWVinLanMG/1ZT+A1x6AbYo5wr8sr
	 B3MlnESy9Ie2IxGOPlJjLX3ljwPVbYkR7eQ0oYv+NRMUqYDKg9q0bCaB0jDaWXrmOn
	 PbahKRlYyGf3YmaXx6Rh6RppbfvEVnUso+WDOEeyqBPKK+/PcaiqumzS14AFsnM3MT
	 4tQIsCLZYXWNS5yBUIvb80PVip13LjlaANQ1eTkd7bH6N3MonIaqB9TGV7gOubJw1M
	 o5HntmeVruUtg==
Date: Tue, 23 Nov 2021 10:50:57 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Joe Perches <joe@perches.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: arch/mips/mm/tlbex.c:2243:3: warning: unannotated fall-through
 between switch labels
Message-ID: <20211123165057.GA7382@embeddedor>
References: <202111230719.OZDUHU4z-lkp@intel.com>
 <20211123005528.GA550759@embeddedor>
 <ea07a2f1e20503965c7c2eba7c0a7a4538457265.camel@perches.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea07a2f1e20503965c7c2eba7c0a7a4538457265.camel@perches.com>

On Tue, Nov 23, 2021 at 12:52:30AM -0800, Joe Perches wrote:
> 
> Perhaps this would be better:

Feel free to send a proper patch.

Thanks for the feedback.
--
Gustavo
