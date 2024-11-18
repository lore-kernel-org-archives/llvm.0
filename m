Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D44642D;
	Mon, 18 Nov 2024 14:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731940037; cv=none; b=Prn2fGbOS+qEFdLCHw08oPQ3+qYDKMSNWj6S/uKA19mF70XnmnrguXn9nffdOP+c+q3LTPv9569UjiSvOyF8iWKJL4k0s6cxtBRUFiciScF4+CcgoZQMZp4zmviavZHyY3ZI+Jgg9WzXL+7kWr/xqUQTXLjnV4M2cDSSVo/lHd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731940037; c=relaxed/simple;
	bh=l2GLJwNs6fi0Ntb/ai1SNGsE1sk5fcPC58D8uUQF1Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JK6BbDDZ8oYejpdpKcjRuVG9Kl9cut+TezOe/kayUdfaj1E1JwjUpvfKbcTF0LBiWIGgke82feXLMH9/ZIbbLvmhCNdcE6v2keZHh1F2OTmwg2hksSH86XQp0aAauIO/rRpgyUyqTxKzCywrat18Ww/rm5jYsp9hbmaq9z3ybtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFXaoT72; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFXaoT72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BBEC4CECC;
	Mon, 18 Nov 2024 14:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731940036;
	bh=l2GLJwNs6fi0Ntb/ai1SNGsE1sk5fcPC58D8uUQF1Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFXaoT72fAE0a+n5SewKFL8IH/uFiDs+H83wUtEnXqaGCuGOjEdf+HtvzcGkv7+ao
	 gFLKRIO3MFP8rtglwVrmC10iDcS8n/ssh6jR3gbvO9nhlqjpJShfs1Tk02udbL+I1T
	 iY1j1TBRpFQ35+fbbyk+AaoKY+8BE2fs45y9dkhs0AFM7OVbUCyqSAObo8+zHrwMyC
	 ifvtVadUko8dT7bLq1DrYrtfXE1j5qvu3udotEhtlLsuA8X7d3DcvSYrfxsmFnoe4D
	 Kmv2LLTVFjSofrp+fA1RyCA1c2UcNCQPzblhq7h7Ukz4fYspvY9IlFRVDbVqdGI0+j
	 s9/vB56jzoLcQ==
Date: Mon, 18 Nov 2024 07:27:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [dhowells-fs:rxrpc-iothread 54/64] net/rxrpc/input.c:902:3:
 error: invalid operand in inline asm: ' shr${1:z} $1
Message-ID: <20241118142714.GA1941815@thelio-3990X>
References: <202411180620.8uhr11le-lkp@intel.com>
 <828048.1731919321@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <828048.1731919321@warthog.procyon.org.uk>

On Mon, Nov 18, 2024 at 08:42:01AM +0000, David Howells wrote:
> kernel test robot <lkp@intel.com> wrote:
> 
> >    net/rxrpc/input.c:789:8: note: expanded from macro 'shiftr_adv_rotr'
> >      789 |                         asm(" shr%z1 %1\n"                              \
> >          |                             ^
> > >> net/rxrpc/input.c:902:3: error: invalid operand in inline asm: ' shr${1:z} $1
> >     inc $0
> 
> Um.  "shr%z1" is fine in gcc.  I'm guessing clang is missing something.  I

Yes, it seems so. I have filed
https://github.com/llvm/llvm-project/issues/116629 upstream for this.

> guarded the definition with __GNUC__, but I guess clang defines __GNUC__ to
> say that it is gcc compatible?

Correct, for largely historical reasons.

  $ echo | clang -E -dM -x c - | rg GNUC
  #define __GNUC_MINOR__ 2
  #define __GNUC_PATCHLEVEL__ 1
  #define __GNUC_STDC_INLINE__ 1
  #define __GNUC__ 4

Consider explicitly checking for GCC there until we can implement this
in clang:

  #if defined(CONFIG_X86) && defined(CONFIG_CC_IS_GCC)

Cheers,
Nathan
