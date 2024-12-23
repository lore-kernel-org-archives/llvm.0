Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5221438F82
	for <llvm@lists.linux.dev>; Mon, 23 Dec 2024 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734989692; cv=none; b=eTbTzYhH3GFgyPU/5nJpFmuq7aRGJCnfuHwsPl5jYS5tpdQPEDi3+HzAjDEpMbZIXejIcoVEIzXaccINClsBDZRLrrdlskauEnpGatKdOq6yKmiz4niq7FmLLaiyWir/vmBKLVrWnX4cLkblaiLeGLA3McUwldWqGYjH5z0oKIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734989692; c=relaxed/simple;
	bh=OGJCOMgJOVjnbmNIgPp/LcwghPvx2QwDbY2U8PvCx6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMm/Dv/gMPydHCGRwY5C3ToocKrowegcv5wicAjmXMbnCTfbqMyHYyfptUNlPKROJcs29HymXWld7/tmLEyh5+qdwC9qqeGw7fJ9PVIIErs+hn5Fofttipi0cHxkM2wBeGbiMC6nYxmRlQi3dQVfaRx+Tmt+ytVMCNh5SxPQW3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7pcVf2B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7pcVf2B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D734C4CED3;
	Mon, 23 Dec 2024 21:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734989691;
	bh=OGJCOMgJOVjnbmNIgPp/LcwghPvx2QwDbY2U8PvCx6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7pcVf2BdKXK1OmQB1YuUvARbS5r1CsmFqb0DjJrPqop1U9m5qbwp3pSkccbYUK1Z
	 9L8bLeMxl8ulUhzMUN3dpgVrGwshkNIe+whrj6ZZ8U95tBT4GM/YhSslLOvsfJ8pTr
	 tZ5rZIqiagZrQO7N97V4UwkdFRdoUy3ZlKKjEodNYvRatMb3+oFShsOS0fAQ7RxpV8
	 V8E0fdN/kxD9+9MGcQDK+alcm838/BNJSNNvuh1LA8w3cYyiMxrfCo+2pVBLbSpE1i
	 GyLh/Ed42zVx+EajuoRb/SFZbOoE6nUC894cMFAP6lffN4uvKKMKoGJqTBYyXjMn8j
	 CQ9oR3lGhm4NA==
Date: Mon, 23 Dec 2024 14:34:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Philip Li <philip.li@intel.com>
Cc: lkp@intel.com, llvm@lists.linux.dev, peterz@infradead.org,
	jpoimboe@kernel.org
Subject: Re: Removing LLVM objtool warning filter
Message-ID: <20241223213447.GA1188382@ax162>
References: <20241220200617.GA936171@ax162>
 <Z2YMxZtiHCV5+w9H@rli9-mobl>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2YMxZtiHCV5+w9H@rli9-mobl>

Hi Philip,

On Sat, Dec 21, 2024 at 08:33:09AM +0800, Philip Li wrote:
> On Fri, Dec 20, 2024 at 01:06:17PM -0700, Nathan Chancellor wrote:
> > Hi Philip and other LKP folks,
> > 
> > At some point, I believe there was a filter set up so that reports of
> > objtool warnings that appear in clang builds were sent only to our
> > mailing list (llvm@lists.linux.dev) for triage. At this point, we
> > believe it is best to treat those reports like other objtool reports and
> > send them to the author of the change that introduced the warning with
> > our list on CC in case people think it is a compiler bug or need further
> > help understanding what is going on. Is that possible?
> 
> Got it Nathan, I will update the bot to send out this warning to author
> and cc llvm list, same as other warnings from clang.

Thanks a lot!

> Just to confirm, is it applied to all clang version or only latest one
> like clang 19/20?

Let's do all clang versions and see how noisy it is. If we need to scale
it back to just the latest, we can definitely do so.

Cheers,
Nathan
