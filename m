Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5A3F1059;
	Fri, 28 Aug 2026 21:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787952679; cv=none; b=RvVFlnb9hsHYPByZ8voI/KFFi0hsJ0YccZWiBH9XrVyytDK8LyqMa2fyUYv6SFpQRWBEYLN2lM4F2mGLoFUaBuNRntwiii/111QfY/NTAcbzdk8IW1x9RtCIsjdElFPfUWH13i1NJqPrIzVZN7LRSPnARPFbIkL37bIT7mdxchQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787952679; c=relaxed/simple;
	bh=vK0MWqvsEM8G61x3hHaMlLU9QkQBw6bwsPBPwytLNVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OvonYPFdKoCHCWD41NIooatqAY+dv/vqMf880qP99Ou9e22mU+FThzn4ALo8Nfr44rpkRr5uTUjpj9jTtqOmlO8lZ4d7QBDOrUuWMgqHYizP8gAxTDMzkDyn1zcYkU+sE1E5l3ACPwWs91sR9hYny1n8oVtTExY6sf2yujpT/Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyyiH+Br; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyyiH+Br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17DB61F000E9;
	Fri, 28 Aug 2026 21:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787952678;
	bh=vtiMS/3YslYhddnyU0cS2S0GILaOrhkFCql6qI+eOOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IyyiH+BrPBg2ehoA0W8i4rSUiq16bhTtSxFggxUjyx7XQoGmUcdQkbxb/5XD1dP29
	 idJE103gb4kCd1IBD4StT8oT3veyk9iAqwFfgyD3mIzRm6tO5bt3ZpLuib7OPg+Brh
	 Obcb3rr5yuBWfCXhNWoOWMqNuaWrtuR1RElT6o+/RK5747WIOTotk+njxMh2ZNiAIx
	 pgTeQjn7HG+OFrBKDYhOPGsqlpxD+X8r0CY82R9EWHZrVfuOmg9ruzCFsGlXsNAy/I
	 kp4YPwwCLd3+pu510nugQJYYXA8V9lxCcvktfuhwN0ravbkiLg6Rq31E7SQ7Skf4jw
	 KFe11/YiNFWDw==
Date: Fri, 28 Aug 2026 14:31:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Subject: Re: Prebuilt LLVM 23.1.0 uploaded
Message-ID: <20260828213114.GA430879@ax162>
References: <20260827190431.GA1817346@ax162>
 <CANiq72nM+yxePYAD1wM+_Wjhm3E6+TpwXkP6BAK9ZwkuJqkNbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nM+yxePYAD1wM+_Wjhm3E6+TpwXkP6BAK9ZwkuJqkNbQ@mail.gmail.com>

On Fri, Aug 28, 2026 at 06:56:37PM +0200, Miguel Ojeda wrote:
> By the way, in the table in the LLVM page, it is still has the the -rc3 row.

Hmmm, interesting. My generated index.html has 23.1.0 in it locally and
there is no error when uploading with kup, so maybe it is a mirroring
problem? I'll reach out to helpdesk@ to see, thanks for noticing!

-- 
Cheers,
Nathan
