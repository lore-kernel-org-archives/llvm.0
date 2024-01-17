Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F741DFC4;
	Wed, 17 Jan 2024 11:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705491564; cv=none; b=X/rj/nD9fbSZwkm2a+ZsWaHmZKXiY5eurIjTPfmHe0oprn1KEzRK06MXMKAwWDyJGYX/Xe2dStOxjoXFA3R2nA4NXuieO5CKh+mBtg/qp8aUT5wVrLvjw1DuDkrRRSOwiJVoU4ffb50Gcm4QUoDFDQnynjd3GczDTGMLDFnjQQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705491564; c=relaxed/simple;
	bh=43UGfCDdEvCVvDsN7X8nURLg41bNrqQt/4NRXB+ssjk=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=SydoRg7Yb+fLXU6OeED2jP0N/qjyEKEmvJ7WrJI1b+2uvPt0pcEd6ocHp4KQY/ykJMV/s8g/cmrLe9bPDVldJH1lA6cLkg/YWx6L/Pjs6gDnY9isC+lPe2LEprC5OauviYMSzjRktYtZ4yEZzGQnf/eA7P1EO8hPAdV1anTxI94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CBeu9/3O; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CBeu9/3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705491562; x=1737027562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=43UGfCDdEvCVvDsN7X8nURLg41bNrqQt/4NRXB+ssjk=;
  b=CBeu9/3OWQHZdTs7/cc6uMR6YrJE31OZscJdZTj6/xrkF1jU3enYfRUQ
   Qjd+aDjV4T3CGyyjjqElzXd+A/kJoAMF99OR6ImQOV9Vi6HvS0MGiV/96
   uUh30XqED/UJ/nbGL7AotRUP32akORO5cG1zLAxfMdJYJUcI6e9xamMXr
   wVwwYlYmeS9q6W1IkZ+HAg575VmQ1sLxH1yiFUdKIl4II/iJABCkxmHsb
   tROROlhnWEpaDGc01qbZiO1ESAZoUVKhsxeIYxaDu0uVMtSFfVcCh3lFF
   57IF913uuYI3eo8m1FNpX17kH1ayzEBMhs2E8Ixxg2qwoG81q6nYgGYPJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="13501545"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="13501545"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 03:39:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1115654340"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="1115654340"
Received: from tassilo.jf.intel.com (HELO tassilo) ([10.54.38.190])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 03:39:18 -0800
Date: Wed, 17 Jan 2024 03:39:16 -0800
From: Andi Kleen <ak@linux.intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>,
	Kevin Loughlin <kevinloughlin@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Michael Kelley <mikelley@microsoft.com>,
	Pankaj Gupta <pankaj.gupta@amd.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Arnd Bergmann <arnd@arndb.de>,
	Steve Rutherford <srutherford@google.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Hou Wenlong <houwenlong.hwl@antgroup.com>,
	Vegard Nossum <vegard.nossum@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Wang Jinchao <wangjinchao@xfusion.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Brian Gerst <brgerst@gmail.com>, Hugh Dickins <hughd@google.com>,
	Joerg Roedel <jroedel@suse.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	Brijesh Singh <brijesh.singh@amd.com>,
	Michael Roth <michael.roth@amd.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-coco@lists.linux.dev, Ashish Kalra <ashish.kalra@amd.com>,
	Adam Dunlap <acdunlap@google.com>, Peter Gonda <pgonda@google.com>,
	Jacob Xu <jacobhxu@google.com>,
	Sidharth Telang <sidtelang@google.com>
Subject: Re: [RFC PATCH v2] x86/sev: enforce RIP-relative accesses in early
 SEV/SME code
Message-ID: <Zae8ZKTpcN_BzaqU@tassilo>
References: <ZZ7YuEexYSaZYmLK@tassilo>
 <20240111223650.3502633-1-kevinloughlin@google.com>
 <20240115204634.GHZaWZqsVyU_fvn_RW@fat_crate.local>
 <CAMj1kXH=k26nNyB+LQJ7WUJgbD2f3PREyjCzSngMCGc+72XJ6w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXH=k26nNyB+LQJ7WUJgbD2f3PREyjCzSngMCGc+72XJ6w@mail.gmail.com>

On Wed, Jan 17, 2024 at 11:59:14AM +0100, Ard Biesheuvel wrote:
> On Mon, 15 Jan 2024 at 21:47, Borislav Petkov <bp@alien8.de> wrote:
> >
> > On Thu, Jan 11, 2024 at 10:36:50PM +0000, Kevin Loughlin wrote:
> > > SEV/SME code can execute prior to page table fixups for kernel
> > > relocation. However, as with global variables accessed in
> > > __startup_64(), the compiler is not required to generate RIP-relative
> > > accesses for SEV/SME global variables, causing certain flavors of SEV
> > > hosts and guests built with clang to crash during boot.
> >
> > So, about that. If I understand my gcc toolchain folks correctly:
> >
> > mcmodel=kernel - everything fits into the high 31 bit of the address
> > space
> >
> > -fPIE/PIC - position independent
> >
> > And supplied both don't make a whole lotta of sense: if you're building
> > position-independent, then mcmodel=kernel would be overridden by the
> > first.
> >
> > I have no clue why clang enabled it...
> >
> > So, *actually* the proper fix here should be not to add this "fixed_up"
> > gunk everywhere but remove mcmodel=kernel from the build and simply do
> > -fPIE/PIC.

For the SEV file this might not work because it also has functions
that get called later at runtime, and may need to reference real
globals. I doubt the linker could resolve that.

For linking the whole kernel, I haven't seen the latest numbers, but
traditionally -fPIE/PIC cost some performance because globals get loaded
through the GOT instead of directly as immediates. That's why the original
x86-64 port went with -mcmodel=kernel.

Of course for the startup code it doesn't matter, but it might make
a difference for hot path code.

> >
> 
> Fully agree. All this fiddling with RIP relative references from C
> code is going to be a maintenance burden going forward.

IIC it's only a few functions in this case, so it shouldn't be that bad.
The early x86 startup code has a few other areas with odd restrictions,
so it's not unprecedented.

-Andi
