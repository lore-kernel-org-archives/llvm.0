Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B81DF62
	for <llvm@lists.linux.dev>; Wed,  2 Aug 2023 23:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0CCBC433C8;
	Wed,  2 Aug 2023 23:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691017468;
	bh=AyckQbINUXyvMIJTDA4FvQVV7MtXBC3frps+2v05rDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLmEHvkuER6UeMI6RiY7RXRNJX3AyMg/4Yds8SA7hPLDCdecDjVsKUBqHQzg3tDq1
	 Dd1g2hZU3/YZfzKd38CaEJqMEr4cxjNj10Oac4boeHiANhUJs2ExFnt1V2wC+7sV1R
	 tNHkcefYD6H36QKFcgCxdkeSdQY0K0i0hIie0jPV/c/rO+Dq3XqCWHq67jUg7Qtv+o
	 MmGpJM0Hro2TlL4Mhb8hWinTXjeL3Qv3Ebs5WzWjiASL4Mo6ou7S79aF8ZomunadQk
	 zzPvJRVDEVCrFuJYn8QaTKjuFj9ox13Ga45u7JkG0Q/aBdglsylkPrxJf9J0/Pkce4
	 oFa6qMgrrx1Fw==
Date: Wed, 2 Aug 2023 16:04:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	"Sahin, Okan" <okan.sahin@analog.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"zzzzTilki, zzzzIbrahim" <Ibrahim.Tilki@analog.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, linux@leemhuis.info
Subject: Re: [PATCH v3 2/2] regulator: max77857: Add ADI MAX77857/59/MAX77831
 Regulator Support
Message-ID: <20230802230426.GA3027248@dev-arch.thelio-3990X>
References: <20230717050736.10075-1-okan.sahin@analog.com>
 <20230717050736.10075-3-okan.sahin@analog.com>
 <20230718155502.GA3542993@dev-arch.thelio-3990X>
 <20230726161033.GA1102409@dev-arch.thelio-3990X>
 <PH7PR03MB739122A373964651D995EA5AE701A@PH7PR03MB7391.namprd03.prod.outlook.com>
 <20230727145143.GB2013261@dev-arch.thelio-3990X>
 <CAKwvOdnPQEdbTGBO0hBn7CC4d0xtRV2zmfrYDfAhH0stfDYeJA@mail.gmail.com>
 <32af6891-8246-46de-ba1d-ae1999f6eb10@sirena.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <32af6891-8246-46de-ba1d-ae1999f6eb10@sirena.org.uk>

On Thu, Aug 03, 2023 at 12:02:38AM +0100, Mark Brown wrote:
> On Wed, Aug 02, 2023 at 03:52:52PM -0700, Nick Desaulniers wrote:
> > Hi Okan,
> > Have you sent a follow up fix? The build should not remain broken for
> > so long.  Otherwise I think Broonie should drop your patch.
> 
> Someone sent what's probably a fix but I was waiting for some
> confirmation that the change actually works on hardware, it's not super
> obvious.

Got a pointer? I don't see anything on lore:

https://lore.kernel.org/all/?q=dfn:drivers/regulator/max77857-regulator.c

Cheers,
Nathan
