Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7A836E465;
	Tue, 14 Apr 2026 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776148492; cv=none; b=W20TWWbflat/Cfqf2t/6j83WR6rG/KPKHeM16jv98fgLI1YT+BGKhBfYdu/R5qPZE4cc65NpMU1ATr5PecXNaS41mAqyR4/9dASP0rbXqD17GcamasHe+7aNTABvxH3hhi/gdVHCGYQ8Lp7GR7Yy/vM660iAi0ayq94iIEOpdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776148492; c=relaxed/simple;
	bh=mgBUD7wSaXZoUYP99YR5NXBdjEgv1q8QVUk10fhTJKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc4u+h38iAbpUQfFz9CnDmg1vYmli3IcfGO7KqHjxPEPrNXbfE6bBepcYUYPm6Q/0jINtxPTXyaXbN2rQop66gXVwcVkpPynXkOMbE6110V9MAWilcAMCbSPtfFUH0WPsyy8TkCY7N3iL0sp9uGE5+kSIdROffAzJTdTaF26oSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEsF0tZn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEsF0tZn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466AEC2BCB3;
	Tue, 14 Apr 2026 06:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776148491;
	bh=mgBUD7wSaXZoUYP99YR5NXBdjEgv1q8QVUk10fhTJKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eEsF0tZnHNO+VvlXEkZIEaLMLmtsJ8XcdYYrNQo+j06GKfHmWDaQIMxG+gCr7Gf4G
	 7KNSYJpkPBn5Ae6RntiYPt7DRb/DKLFlwI1OveYVg/+5EP0PXySvUbEmfZwfY8FNln
	 /DNOdWN7HjTvRW0/rW1qFOAAQvnpwEqjDlK6Vb7RTcVECvupMfTuJnX0KRr7ycWGxW
	 Ehh0Mm1IJPqQOh0Kt3ui9GzLMcTUDrcdaxZQ5iLt5mc6krlUu9KDo6AnMBKZ28cnJi
	 B12ltqfQOecAP2KEbzqXIwV63EgDEYZI4vCdme9fcHB/t+9WUuR59nOBkSwU8yMQsK
	 J5wecCbG7FBkg==
Date: Mon, 13 Apr 2026 23:34:49 -0700
From: Namhyung Kim <namhyung@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: Joe Perches <joe@perches.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
Message-ID: <ad3gCbtbvArjtIcQ@google.com>
References: <20260407165551.3075684-1-irogers@google.com>
 <672710335e73ed76ddcd176a5879817c40d1c314.camel@perches.com>
 <CAP-5=fX92ncYELs_XQXw55A=PYxBnLY2V1CqSpCV71Zc9Pf3oA@mail.gmail.com>
 <404f559a885169513b7e3526eeff77148ee55bb8.camel@perches.com>
 <CAP-5=fWteCfNQ7DmwLorcs9h3iH__XK01CrwnJ4-qUfcDCsSSA@mail.gmail.com>
 <b4e9f338b8cdc168f90848b8daf321386b863915.camel@perches.com>
 <CAP-5=fUfhcmt=kzY0GsAZm5J_EiyttMHOTbUyFkp+CjiRcitWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAP-5=fUfhcmt=kzY0GsAZm5J_EiyttMHOTbUyFkp+CjiRcitWg@mail.gmail.com>

On Mon, Apr 13, 2026 at 10:50:59AM -0700, Ian Rogers wrote:
> On Mon, Apr 13, 2026 at 9:54 AM Joe Perches <joe@perches.com> wrote:
> >
> > On Mon, 2026-04-13 at 09:19 -0700, Ian Rogers wrote:
> > > On Mon, Apr 13, 2026 at 8:45 AM Joe Perches <[joe@perches.com](mailto:joe@perches.com)> wrote:
> > > > On Mon, 2026-04-13 at 08:39 -0700, Ian Rogers wrote:
> > > On Tue, Apr 7, 2026 at 10:11 AM Joe Perches <[[joe@perches.com](mailto:joe@perches.com)](mailto:[joe@perches.com](mailto:joe@perches.com))> wrote:
> > > On Tue, 2026-04-07 at 09:55 -0700, Ian Rogers wrote:
> > > > > Sorting headers is desirable to avoid issues like duplicate includes.
> > > > > > Perhaps.
> > > > > > Some others prefer reverse-christmas-tree by length ordering for #includes
> > > > > > though I think it's poor style.
> > > > > Thanks Joe. I second not switching to a reverse-christmas-tree style :-)
> > > > > If this patch is okay, could we bring it in through the perf tree?
> > > > It's likely better to avoid this suggestion.
> > > > The issue is that others strongly prefer that reverse-christmas-tree
> > > > style and would object so nak.
> > > Presumably that is a kernel suggestion rather than a tools directory
> > > suggestion. We can move the file into tools/perf, tools/lib/perf, etc.
> > > if that removes more global concerns. perf hasn't adopted a
> > > reverse-christmas-tree style.
> >
> > Fine by me.
> > Just curious: is this a style control file used by directory depth/path?
> 
> clang-format searches from the directory containing the file to be
> formatted upwards until it finds a .clang-format file. This change
> places the style in tools/, which is my preferred location for
> consistency across different tools and libraries. Header file ordering
> is a different issue within the kernel tree because it generally only
> references itself.

I think we need confirmation from other folks in tools/ if we want to
put it there.

Thanks,
Namhyung

