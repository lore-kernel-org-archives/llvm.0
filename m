Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE93425CFF;
	Wed, 21 Jan 2026 21:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769029477; cv=none; b=jUq/nI9lo7MYEv+lIGGd8nZ70Zcd498PE+mcDWpgJhA55enq8Hl0lpNag4oDzgJ4bDK09anHiKZ7mE+vaz5/aBPAhGsbzAdftP+RWVQhRsNAZ0s4IVLa+WtPU9xHcD7c/AT2Q+WZD2JFwbB4xX0ynUbqjumNn2pCF4tBOPuYQK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769029477; c=relaxed/simple;
	bh=XqPSo2qYJf+IM8qIZYWHCUSgyZyv4XBXXJSAz69WzIY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TyVdjP6C8BoTjwCL63Y68QXvzUSENhpTnigN/1xnQwvKrb4s3dU/lPFjOxIZG50Dvp4hYXiL78Ss0U8wsqGNCOtpGsA2OjZV+/wzuemSfmNCUad9jhzNSYfQ7y/elHAnK+Buy98yxKtcy9Vnqa5UtG0nrmxugR0lvLfYlcbiRhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=I5bRxiWn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="I5bRxiWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 121E7C4CEF1;
	Wed, 21 Jan 2026 21:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1769029475;
	bh=XqPSo2qYJf+IM8qIZYWHCUSgyZyv4XBXXJSAz69WzIY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I5bRxiWnPPbDS5UooeiebkHj2C9Wr0HfuLqxuj6LdfoYJvX+CylLeqozD04rrsY6X
	 ypWlsq35EnQN0dBjTTnh7hdi7DNMfpTdVAeZbghrQG6fhjdgD0dWmji/XQJnH8qR4y
	 Jtsuud/8lBn6YgFsccic5dGF6y09gN3NhWrjYXx8=
Date: Wed, 21 Jan 2026 13:04:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Andrey Konovalov <andreyknvl@gmail.com>
Subject: Re: [linux-next:master 7687/8302] ERROR: modpost:
 "vrealloc_node_align_noprof" [mm/kasan/kasan_test.ko] undefined!
Message-Id: <20260121130434.1ab5355bb6ef31feabf4c4f3@linux-foundation.org>
In-Reply-To: <8d5cea70-0e1d-4442-b761-e6589346d654@gmail.com>
References: <202601211250.6uQzZrQp-lkp@intel.com>
	<8d5cea70-0e1d-4442-b761-e6589346d654@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Jan 2026 18:04:36 +0100 Andrey Ryabinin <ryabinin.a.a@gmail.com> wrote:

> 
> On 1/21/26 5:57 AM, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   053966c344dbd346e71305f530e91ea77916189f
> > commit: 22228c860d2633a22656cc506022c657fec15194 [7687/8302] mm/kasan/kunit: extend vmalloc OOB tests to cover vrealloc()
> > config: x86_64-randconfig-121-20260120 (https://download.01.org/0day-ci/archive/20260121/202601211250.6uQzZrQp-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211250.6uQzZrQp-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601211250.6uQzZrQp-lkp@intel.com/
> > 
> > Note: the linux-next/master HEAD 053966c344dbd346e71305f530e91ea77916189f builds fine.
> >       It may have been fixed somewhere.
> > 
> 
> Yep, this has been fixed independently by https://lkml.kernel.org/r/20260107-export-vrealloc_node_align_noprof-v1-1-a581bec13054@google.com
> It would be nice to reorder the patches so that the fix is applied before the kunit patch.

No probs, I reordered the application order:

: vmalloc-export-vrealloc_node_align_noprof.patch
: #
: mm-kasan-kunit-extend-vmalloc-oob-tests-to-cover-vrealloc.patch
: mm-kasan-kunit-extend-vmalloc-oob-tests-to-cover-vrealloc-fix.patch

(from https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/pc/devel-series)
(not pushed out yet)
