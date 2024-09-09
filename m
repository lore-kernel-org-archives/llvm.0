Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B9217588
	for <llvm@lists.linux.dev>; Mon,  9 Sep 2024 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725894510; cv=none; b=HbmSLKpOfrC5yCCdvvg0G/fEqs4o2bedy+5YatRWaJZgR4tRz30X/zWS5tcwYcz2NCflQwSVmb9WQt51hb1tdlMXZmCUZfA99fNvMAuUxRi7DdNHfqM3Lzi0fa5bsIB/bEPTalVOQ5bfyMhwDGq/Yad61vjFbOnnp6qLX104zsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725894510; c=relaxed/simple;
	bh=9KqX1U9K1kV1mN4DFxh60Iuz5t7pwNJ6WP08oqYSgZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMLU2c75ajHi8SLjq+UJ81ZOQMOyCBhoJa/J4T2VEVDh7lF5wOhTbSvNfESzU/U97PogJ6i6aeh7SJXNxtMTSjo0Wp5YS0fIlp8H8JGvS3q4xRGtvSE7Ehtatuqyc0o6P9Hf9C8FSLe/fSx/EDtqHitZFSnOS6pgMYGbuhkBUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaqnvQhE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaqnvQhE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47F2C4CEC5;
	Mon,  9 Sep 2024 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725894510;
	bh=9KqX1U9K1kV1mN4DFxh60Iuz5t7pwNJ6WP08oqYSgZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AaqnvQhEIvVJh8NUWg8PxM0d0pugq+bWL7jSJ2MtzOIe2Ka2Ar9iTYxPX9t8K2qXt
	 qIz/NbsuKEzvd/vBWgwR4BE7XCUWK4RRLIcdHuhUX5WeaZ/NQZM2UL4RnFbftG0LLO
	 SGcT6SNCGDjTNKyyDPOiejVFSI+K6Ieo1WcTKO9xl1+JMJbbhAn/em/svnomk94NIW
	 CU4zdeA1+tUvH7gF8croBfdd82Byxp4PZS/OODXD711fK5rDC1NJxdlrDmTnP2VJ0R
	 wUkVhxDJwWkfS321UQU8/IJFCJL3MC+J9rVtxoA/Y/McXnGPzQqm1fjFaF6zpSjmhK
	 jRaF35wC+4sDA==
Date: Mon, 9 Sep 2024 08:08:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: linaro-toolchain@lists.linaro.org
Cc: llvm@lists.linux.dev
Subject: Re: [Linaro-TCWG-CI] v6.10-12615-g08c2182cf0b47: Failure on aarch64
Message-ID: <20240909150828.GA997089@thelio-3990X>
References: <1833124036.181352.1725885451762@jenkins.jenkins>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1833124036.181352.1725885451762@jenkins.jenkins>

On Mon, Sep 09, 2024 at 12:37:30PM +0000, ci_notify@linaro.org wrote:
> Dear contributor, our automatic CI has detected problems related to your patch(es).  Please find some details below.  If you have any questions, please follow up on linaro-toolchain@lists.linaro.org mailing list, Libera's #linaro-tcwg channel, or ping your favourite Linaro toolchain developer on the usual project channel.
> 
> We understand that it might be difficult to find the necessary logs or reproduce the issue locally. If you can't get what you need from our CI within minutes, let us know and we will be happy to help.
> 
> We track this report status in https://linaro.atlassian.net/browse/LLVM-1343 , please let us know if you are looking at the problem and/or when you have a fix.
> 
> In CI config tcwg_kernel/llvm-master-aarch64-next-allmodconfig after:
> 
>   | commit v6.10-12615-g08c2182cf0b47
>   | Author: Florian Westphal <fw@strlen.de>
>   | Date:   Tue Aug 27 15:37:32 2024 +0200
>   | 
>   |     xfrm: policy: use recently added helper in more places
>   |     
>   |     No logical change intended.
>   |     
>   |     Signed-off-by: Florian Westphal <fw@strlen.de>
>   |     Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>

Thanks for the report, I'll ping my fix for this now:

https://lore.kernel.org/all/20240829-xfrm-restore-dir-assign-xfrm_hash_rebuild-v2-1-1cf8958f6e8e@kernel.org/

Cheers,
Nathan
