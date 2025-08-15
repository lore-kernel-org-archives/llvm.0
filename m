Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3ABF30E82D
	for <llvm@lists.linux.dev>; Fri, 15 Aug 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.228.1.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755276129; cv=none; b=XXdB/gPLlTzGdtaeO9X2kpEgYXhWWFzwsth71ayT9BoVhBG54frrhU7EOGYiC0IElFdZAcnBFT5apV4oWebJtglu0V+U/dTPO4S/pgy0MOVWVK4wgE15O3eCUhY4TIQJTTsODOMPLmitI+wMKlT3/88VUz3dTKcHb5mN6TBnA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755276129; c=relaxed/simple;
	bh=YNnF98V/d1J/g71YSMmy+PpRsNt0b+QK8zrhLaRJBBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1+v1tayXy2okK8qgTN+oxLsEEFp3KRus5r39m3R+UIbuqrxEyZzxlCQc/Jw30SAP0qIyvAp75+NgRPZNwZDmzVgmXojcMIIc68JoEbQFmt2WXHoXjCRqQZlPcSgcvZ8NK+JjpogQtdUis3T25B+SGyBFRY1XB/psijp+QJdXao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass smtp.mailfrom=kernel.crashing.org; arc=none smtp.client-ip=63.228.1.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.crashing.org
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 57FGg0P42568454;
	Fri, 15 Aug 2025 11:42:00 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 57FGfxjE2568453;
	Fri, 15 Aug 2025 11:41:59 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 15 Aug 2025 11:41:59 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 05/17] powerpc: Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <aJ9jV80oYG6rPN1o@gate>
References: <20250804163910.work.929-kees@kernel.org>
 <20250804164417.1612371-5-kees@kernel.org>
 <7f4f4d07-38f7-444c-adff-ec2a2387e86b@linux.ibm.com>
 <aJ9hsHj9lsHvvhcA@gate>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ9hsHj9lsHvvhcA@gate>

On Fri, Aug 15, 2025 at 11:34:56AM -0500, Segher Boessenkool wrote:
> On Thu, Aug 07, 2025 at 03:16:35PM +0530, Madhavan Srinivasan wrote:
> > making them eligible for compiler optimization.
> 
> You can instead use GCC for this.  __builtin_ffs () exists since 2003,

Erm, 1992 actually, but stuff has moved around since then :-)

> and has this attribute built-in, as well as tens of other optimisations
> that the kernel thing misses.
> 
> Of course using existing stuff instead of cobbling together something
> half working prevents you from having a lot of fun ;-)


Segher
