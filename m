Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F35A79B;
	Mon, 14 Apr 2025 00:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744590114; cv=none; b=GG4FAmgscyFpuzLc+p3tbPN+09OYyw9+Q7UecPPX1fYFAtQbRy4vqig1nOShCmO2DoLC3VRi8YFak+Fuxi+fJUJwrVYFfb48rDs2bhJ5OvXKrJIxH395eSTQfsV1Rg9L01o5BOc+TVc7PyqlW9vs/CuWPqDxKXW0UsQN3RaeZy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744590114; c=relaxed/simple;
	bh=C35CfGuvDl/aY3AqXv6gT6YxBQow7cSevYAJnjAxCvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I3M9UkxWkqxMNyBgS4+DWFoDdqSJxoynJ4s4Eno/FO9dfHzvVLehvm0esHjXNENRSCaxBh8sO/S0Y3bcKr4UgBK9ctAErTtNhjsReFOO15eAmOfjmz8oAvowgop03Ec7c71UUCosbVCf2aj/CAkUoRQyFIJ/LjOmve4d/cBfrU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ISutobyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ISutobyR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3B7EC4CEDD;
	Mon, 14 Apr 2025 00:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744590114;
	bh=C35CfGuvDl/aY3AqXv6gT6YxBQow7cSevYAJnjAxCvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ISutobyRAso+C9kWs42Bi9EBiq4QjsknZtBsnkEgPgBDTkFBHrrTAynoMrtLmTlmU
	 h0VSP45Q3mgSdBuHcrXdrbzPT+YVEW8hsmrj1MzIx/GZgjfbUHHCeg++xXQJfwHZ9L
	 wQaoeXIfv6H14kqV1IoroPPDhSsvLIx0RUtNgqoZLcbmS/ZF7Kr1M1sLgp/xFtPF1Y
	 K4CTokDsDWpi2sh+3qQbikSzmY9HcVmh3DXHgYsffWpnAFgz9dw1xPiGgLI0xW3wbC
	 96U7muIZg5MmoxwOg+hLk6qV8Lj2T5FL75puKlBxncCiwQniV5/LHU3G0V8U1B1/gC
	 9enWMmXY2moWg==
Date: Sun, 13 Apr 2025 19:21:50 -0500
From: Nathan Chancellor <nathan@kernel.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: jlayton@kernel.org, akpm@linux-foundation.org, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ref_tracker: use %ld format specifier for PTR_ERR()
 during directory creation failure
Message-ID: <20250414002150.GA527713@ax162>
References: <20250412222744.9459-1-qasdev00@gmail.com>
 <20250413013245.GA2989337@ax162>
 <Z_uW2DLS7_NLU4gh@qasdev.system>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_uW2DLS7_NLU4gh@qasdev.system>

On Sun, Apr 13, 2025 at 11:50:00AM +0100, Qasim Ijaz wrote:
> Hi Nathan,
> 
> Thanks for the suggestion, I think this would be an improvement over
> using %ld.
> 
> Would you like me to include you in a suggested-by tag in patch v2?

No, I do not need a Suggested-by tag, feel free to send v2 without it.

Cheers,
Nathan
