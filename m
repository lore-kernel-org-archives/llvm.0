Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57CC20A5DD
	for <llvm@lists.linux.dev>; Fri,  8 Nov 2024 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079924; cv=none; b=M+SOGJgL1LYkcpXH/DiflbJIK3aDAWQBCDnJRpY+4UTrBXg5gspRoen+9B7rujaNWKZ4/Qyplvkc9XHBKYiw3t1eCrB+Zf2qOhyf+QPApxTBS2XfoeWZH+FUnlyMLOIeP38SC5fausEDw1kv2Xz2Iy5jcrmARU+CXJoLIeIyhjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079924; c=relaxed/simple;
	bh=VzP/LDCirUJQ3l+YlFKHGVOCDG843Dq6kqqElg0cEHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftA20VprKfBAjzhoGu15gFJecqBWIZHLC3xNr7zfpHPDtl+lhSj4sjiVAASwzg0yc1scrCDfVVgRgO2K0pVicZj8hBfmjBGzqat7MP4UqhW+fZGhYZsja3Ma0xf4TyiPk0nQy8UPg/r9bmR35NmsRStl49hKhA1P02YTGopTwsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O95d5/h3; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O95d5/h3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731079923; x=1762615923;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VzP/LDCirUJQ3l+YlFKHGVOCDG843Dq6kqqElg0cEHU=;
  b=O95d5/h3c875c5H5xPcjKH9rB4NWNikNFASzudUuxOBkskyzq0dj2vwL
   CQV36wOPgy8095S+0jyBqvpku6fhYZwRvNh2GoNw4weOdyDlDr6/7pa6f
   QvsVW8/HAHoqJuI6D2xLVC5xBDEZfLMMFqhFk1ErbAmXDev6pJmCW+1AL
   K2vrPdQGDUIUbQ6RqGCQv3I5JuwI3qpjfla5CUL2U/5KmscMt1fh6tdti
   /VMTENgN0b0jtRYVHl7dYHxxsmMKYTWjVNrey6vIGmDqZTWK/NwnmFvNv
   IZj0e9ecHuT9842oY9LrSulpei3mLYd2JyLIBmHwcHp8sfjPtrRqR3gnJ
   w==;
X-CSE-ConnectionGUID: 1lH+Lu57RsOnZmE883Z47Q==
X-CSE-MsgGUID: /N9rYkPHTTS/chRyYa/xOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41528854"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41528854"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 07:32:03 -0800
X-CSE-ConnectionGUID: ouOLeQSeQ2aZVDdpdPf2+g==
X-CSE-MsgGUID: luzJEKbTTMuRAJTeJZMh3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="108903402"
Received: from smile.fi.intel.com ([10.237.72.154])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 07:31:59 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1t9Qxo-0000000Cewz-1VNX;
	Fri, 08 Nov 2024 17:31:56 +0200
Date: Fri, 8 Nov 2024 17:31:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH v4 1/1] x86/cpu: Make sure flag_is_changeable_p() is
 always being used
Message-ID: <Zy4u7ByPh7WOnpdv@smile.fi.intel.com>
References: <20241108141235.1456557-1-andriy.shevchenko@linux.intel.com>
 <B7F5B222-2982-43D5-87A5-7510EDCCB4DF@zytor.com>
 <Zy4rw-yx0JL7_-lk@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy4rw-yx0JL7_-lk@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 08, 2024 at 05:18:27PM +0200, Andy Shevchenko wrote:
> On Fri, Nov 08, 2024 at 04:13:05PM +0100, H. Peter Anvin wrote:
> > On November 8, 2024 3:11:46 PM GMT+01:00, Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > >When flag_is_changeable_p() is unused, it prevents kernel builds
> > >with clang, `make W=1` and CONFIG_WERROR=y:
> > >
> > >arch/x86/kernel/cpu/common.c:351:19: error: unused function 'flag_is_changeable_p' [-Werror,-Wunused-function]
> > >  351 | static inline int flag_is_changeable_p(u32 flag)
> > >      |                   ^~~~~~~~~~~~~~~~~~~~
> > >
> > >Fix this by moving core around to make sure flag_is_changeable_p() is
> > >always being used.
> > >
> > >See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> > >inline functions for W=1 build").
> > >
> > >While at it, fix the argument type to be unsigned long, although it currently
> > >only runs in 32-bit cases.

...

> > It's good that you are changing the return type, but we need to be consistent
> > and change f1, f2 to match. At the same time, I suggest changing the return
> > type to bool.
> 
> Ah, that makes sense!

All addressed in v5:
20241108153105.1578186-1-andriy.shevchenko@linux.intel.com
You are in Cc there.

-- 
With Best Regards,
Andy Shevchenko


