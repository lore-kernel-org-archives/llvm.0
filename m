Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D3533E4;
	Wed, 22 Jan 2025 01:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737509378; cv=none; b=DRf4Qox9LE8Sjqhn2HQu7dZ8z7TeuHWgSnPLWxzjPNJCeVdH6TmhAOZNFtZiQ4rex0W1csZyezPoEE85KivbELV/87Vhtb1X65swlvFfe4gT+cgAuz59oH2dVYsNsJ7yYUYOEbgEc/nuyB+jH0CfOmBHCTYMS3YjaVdqr6lqwCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737509378; c=relaxed/simple;
	bh=Rgj94aQExIsrOGa6RsX94dbd73q6i5CZzviQiD4yAwQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Df3npAcPW3lHORNXJatA1hbzJ0OG1LSLX9xyOL+dXg6PGopHf7vok46PQi8eqF+5dzr7rZ04gMByisz1Ln18nqrF7IpTxQq9uyoUrKadW5tmLhKBLE6ALN/MDX6t38tgEHv5BjAvxZNFDAFmlVcLSIds1nk5aT7DgyEv8VdBkAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuMO660r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuMO660r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A0EC4CEDF;
	Wed, 22 Jan 2025 01:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737509377;
	bh=Rgj94aQExIsrOGa6RsX94dbd73q6i5CZzviQiD4yAwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kuMO660rgXbJHRFRJfd2CeeF+9TciW++rKMi8bMXSpoSxjF6RuBRZ1Jdu7MGrF1yl
	 /hCqgL+XYNahm8LGRXRr/KJ+Ab1SXCe5krdZ5AFvBPn65sbwuN/o1jAogQ3N/tHOEc
	 z62a7QDFUI7AdSjP2inKDRo9gIsCGhNYahUqih2/b5XXvvWEYtSapexRqatQwpsYRN
	 peKeIQtgxnC9ea88EMx+sHqj5tZkzbX2Hf+qF72fA7OKYw0fymqcs6CkhDVnrkDlUX
	 E4MlOmknF6iN168VdZhWNCQLNSUJw0YdH04HQBe1UN3Chghyy0r74EFJlrvn0uNgNT
	 dfmB+O3nqj2BQ==
Date: Tue, 21 Jan 2025 18:29:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [morimoto:sound-cleanup-2025-01-16-2 7/23]
 sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this
 goto statement to its label
Message-ID: <20250122012933.GA1058871@ax162>
References: <202501171455.ZDrGYjE5-lkp@intel.com>
 <878qr3k5lo.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878qr3k5lo.wl-kuninori.morimoto.gx@renesas.com>

Hi Kuninori,

Not a part of the kernel test robot team but I help maintain the clang
build support so I hope I can help.

On Wed, Jan 22, 2025 at 01:19:31AM +0000, Kuninori Morimoto wrote:
> > tree:   https://github.com/morimoto/linux sound-cleanup-2025-01-16-2
> > head:   e3977d58d39b9fd3d4f04615aa580d4fa702aa0e
> > commit: 08af04b193d94a1cbda7863d699552bd674dacd2 [7/23] ASoC: audio-graph-card2: use snd_soc_ret()
> > config: i386-randconfig-013-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171455.ZDrGYjE5-lkp@intel.com/config)
> > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171455.ZDrGYjE5-lkp@intel.com/reproduce)
> (snip)
> > >> sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this goto statement to its label
> >     1013 |                         goto end;
> >          |                         ^
> >    sound/soc/generic/audio-graph-card2.c:1030:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
> >     1030 |         struct device_node *codec1_port __free(device_node) = of_graph_get_remote_port(ep1);
> >          |                             ^
> 
> I couldn't reproduce this issue on clang v18.1.3 (Ubuntu 24.04.1 LTS).
> Is it clang new feature (19.1.3) ?

Odd, this check has been around in clang for some time, I can reproduce
it with clang-14 using the configuration that the test robot used.

  $ clang --version | head -1
  ClangBuiltLinux clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)

  $ git switch -d 08af04b193d94a1cbda7863d699552bd674dacd2
  HEAD is now at 08af04b193d9 ASoC: audio-graph-card2: use snd_soc_ret()

  $ curl -LSso .config https://download.01.org/0day-ci/archive/20250117/202501171455.ZDrGYjE5-lkp@intel.com/config

  $ make -skj"$(nproc)" ARCH=i386 LLVM=1 olddefconfig sound/soc/generic/audio-graph-card2.o
  sound/soc/generic/audio-graph-card2.c:1013:4: error: cannot jump from this goto statement to its label
                          goto end;
                          ^
  sound/soc/generic/audio-graph-card2.c:1030:22: note: jump bypasses initialization of variable with __attribute__((cleanup))
          struct device_node *codec1_port __free(device_node) = of_graph_get_remote_port(ep1);
                              ^
  ...

Not sure if it is something specific with this configuration that
triggers it but it should be reproducible using those steps.

Cheers,
Nathan
