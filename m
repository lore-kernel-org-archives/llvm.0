Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D513C186E58;
	Sun,  8 Mar 2026 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772992996; cv=none; b=WgYuRTVrbqFjPxgHUv8Iu6lRMzYK5vFpaP1oZaDolluxQIAD1TDG0wuekyLx9TTtGx0QGfaww4LXj+P99qM1VOQReqHyuOLlgM25HurI5WCEAz8ti6xq3sW3pN9tiqQY1ytqjz3dX01AhNcHTlc9k4VxNhw6OjExBcCaGMpgYls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772992996; c=relaxed/simple;
	bh=rmJMdlEXDjwGvBgpvp1qb6ZGImcvRLTk9sD7zdDDS1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILXrPIVwGkYDXagf/xdP+d6YriL2bKQ4WGBucL4sAMWVW7uOHOu4R6ZyMF8uh37sjNr+yxZI6OBrp0EpEykMPFjoMb9HBsxnwpSXIJKjksLRMY/G3usmwMceEi16SJMMzbG2UEnAbP+R+/P9DWcfHv3fhqbLGzZEin/uZ4I1SQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aH4mGr9U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aH4mGr9U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95EB4C116C6;
	Sun,  8 Mar 2026 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772992996;
	bh=rmJMdlEXDjwGvBgpvp1qb6ZGImcvRLTk9sD7zdDDS1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aH4mGr9UYO5eiH6AIYXjfCmgDRp3A7ggtu+GzfHkqbKy+0vL0gxX2TlSiTUU68lSO
	 mZwlZNtMkKgE7gZt2SaP+89cW14wfxz5VTb7zjO3U4Qc/MZDUTTQBF4rKQUNfW8Pzz
	 vLgqbwOYuL5pL7ApHNUav/WPPEIhafkLtcKq52vRCG6/UUXjJs4DEVZPEDwZkiLhHO
	 QnLEE3cbrLBK76mO0kYVn73zwcIvs4ZkXYBBvuljg5cqfZHlHXs4VGEcqlLzNnMQCG
	 9QDmJGzlL2xsps7prrX2KVszEA31X9jT224ZwKGHyHVQMy/T94Bf9iriN3gqEz4pBA
	 1qPa6++O6An9w==
Date: Sun, 8 Mar 2026 20:03:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Xie Yuanbin <qq570070308@gmail.com>
Cc: akpm@linux-foundation.org, Liam.Howlett@oracle.com, david@kernel.org,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, llvm@lists.linux.dev,
	mhocko@suse.com, morbo@google.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: optimize once judgment with clang
Message-ID: <aa2523KDNwWXHbDD@kernel.org>
References: <aavd4hoAO1DFLuJP@kernel.org>
 <20260307144135.380683-1-qq570070308@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307144135.380683-1-qq570070308@gmail.com>

On Sat, Mar 07, 2026 at 10:41:35PM +0800, Xie Yuanbin wrote:
> On Sat, 7 Mar 2026 10:12:18 +0200, Mike Rapoport wrote:
> > On Sat, Mar 07, 2026 at 02:54:04PM +0800, Xie Yuanbin wrote:
> >> commit 242b872239f6a7deacbc ("include/linux/once_lite.h: fix judgment in
> >> WARN_ONCE with clang") helps optimize performance and size under the
> >> clang compiler, but the modification is not complete.
> >
> > How much does it actually optimize for size?
> 
> Basing on commit a0ae2a256046c0c5d377 ("Add linux-next specific
> files for 20260306"), compiler "Debian clang version 21.1.8 (5)",
> arm64 default defconfig, and setting CONFIG_CC_OPTIMIZE_FOR_SIZE=y,
> the size result is:
> |                                    | size     |
> |                                   -|         -|
> | Image.gz                           | 14256146 |
> | size of ".text" section in vmlinex | 17035264 |
> 
> Basing on above, revert the commit 242b872239f6a7deacbc
> ("include/linux/once_lite.h: fix judgment in WARN_ONCE with clang"),
> and build again:
> |                                    | size            |
> |                                   -|	              -|
> | Image.gz                           | 14258152(+2006) |
> | size of ".text" section in vmlinex | 17039360(+4096) |

It would be nice to see where the difference is with scripts/bloat-o-meter.

And while commit 242b872239f6a7deacbc is a oneliner that essentially
updates most of the _ONCE constructs, I'm not convinced that the churn in
the patch that updates include/linux/mmdebug.h worth it.
Do you have the numbers for this patch as well?

> > Note that performance is really not critical here because we are already
> > dealing with slow path of debug code.
> 
> It seems that WARN_ON_ONCE_GFP() is not affected by in CONFIG_DEBUG_VM,
> and it is used in __alloc_frozen_pages_noprof(), which seems to be a hot
> path.

What might be useful there is to change the order of conditions so that
__ret_warn_once will be evaluated first.

-- 
Sincerely yours,
Mike.
