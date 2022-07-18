Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302A833CC
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 18:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A861C341C0;
	Mon, 18 Jul 2022 18:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658168535;
	bh=zyNWEak7xuAKLRfXthOBkxNPNxT5bcFLqsBMm4e7quQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IyTPqr2wV3uijFOOSNQ8ZNxWWP9VMwbAL+BP2J6rnreWtEwhIj54ZML5S/IdaqCob
	 F0XsWipE1cnosddnCMk4o04d+T4soinygJHtHHpjwnD5vktiXX2SwcGEq2Q9qKEOGb
	 fytau8lIqh3gORUEiT/zbaX/De+UKm3jSum1THOrzFYmCszMtvYjVTffgYOj2rPHfZ
	 Ap+XMfFfVCv6WDVbLCd/jbU0E9W/a+QGzfkFceypf0EoKau7eZrtRaQu9TuG8y14Eu
	 7ZsXAxWxuOdl45c5suL5z79bs5TYJ7vFJZu/KeBh2voTdhLOuV/qWk3RO9qEBB80Z+
	 VNFIY4eI2mRjQ==
Date: Mon, 18 Jul 2022 11:22:13 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Justin Stitt <justinstitt@google.com>
Cc: Justin Stitt <jstitt007@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3] include/uapi/linux/swab.h: move explicit cast outside
 ternary
Message-ID: <YtWk1abYruK6DIoL@dev-arch.thelio-3990X>
References: <20220608223539.470472-1-justinstitt@google.com>
 <YqJYrImC3Bk40H1H@dev-arch.thelio-3990X>
 <CAFhGd8qTc-=Fjw2LZW4HYJtVyizkLhYRyv-TYLd1ji-9oR9EdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFhGd8qTc-=Fjw2LZW4HYJtVyizkLhYRyv-TYLd1ji-9oR9EdA@mail.gmail.com>

On Mon, Jul 18, 2022 at 11:12:25AM -0700, Justin Stitt wrote:
> Any chance a maintainer could take a look at this patch? I am trying
> to get it through this cycle and we are so close to enabling the
> -Wformat option for Clang. This patch fixes over 50 warnings and
> there's only a handful of patches remaining until we can enable
> -Wformat.

I think this change is already picked up? It's in -next.

https://git.kernel.org/akpm/mm/c/d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
https://git.kernel.org/next/linux-next/c/d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7

Cheers,
Nathan
