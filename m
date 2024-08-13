Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF815A8;
	Tue, 13 Aug 2024 02:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723516030; cv=none; b=iM/BaHtkTZ7nJm/hRWTJvp/mU9bFzta9mQiY1WBHogMvu+mjX8+pu2t8LttOtE/kEejWBq/an3YFKJsl5r2YZtS/0T973+y07NNeM5TfUm4Ve2Ua2mgFVHWE//jWkLLu6rYmNuI+kDd4zRAgN2sckJHN41kAfC3+3IbNPUrDEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723516030; c=relaxed/simple;
	bh=BNKxi8ZSUbKsrCQYhJ3UVnTTPjsmP6XSBIsh1KzfWa4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=sbSegm+Vuf4/E8/heggqGgCKOn9adLTp9nfeGv+mZ9T+SSNVC+aWVGw2eq248bGAXoPMr47VXMptAkYmA5go4+qh14Rwfa/RWRkUmUe6uYuJpjUpxa4keD/9qAoUYm/CSB+WD+RRDFxn3RjxmfCrp97SyqliALBmW9Ch/E9gH9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jk2Blacd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jk2Blacd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412B0C4AF0D;
	Tue, 13 Aug 2024 02:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723516029;
	bh=BNKxi8ZSUbKsrCQYhJ3UVnTTPjsmP6XSBIsh1KzfWa4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Jk2BlacdXxo39tgdVjQAHH0HoTnXNUOKonUhvvNHy6jk6uJMU7nu1GhhBWT8ygEDZ
	 DyBLz5RtjzVizdpfn8ZHYmfLptfn5IdMKEXpb0WFW7WjQxdCGSH3OWlD52V13bfoUN
	 bfdOamoWKx0ncj2UtRXtc2nhWI9JG228ChHRzaWk=
Date: Mon, 12 Aug 2024 19:27:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Peter Xu <peterx@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 206/222]
 arch/x86/include/asm/pgtable.h:1420:10: error: invalid output size for
 constraint '+q'
Message-Id: <20240812192708.9b30a06b3fdc850430bd2a7f@linux-foundation.org>
In-Reply-To: <ZrpKtnQqkrbfaUhp@x1n>
References: <202408111850.Y7rbVXOo-lkp@intel.com>
	<ZrpKtnQqkrbfaUhp@x1n>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Aug 2024 13:47:34 -0400 Peter Xu <peterx@redhat.com> wrote:

> I'll squash this when I repost the whole 1g pud series soon (with quite a
> few commit message enhancements, and English fixes).

I'll drop the series "mm/mprotect: Fix dax puds", v4.  Please work
against latest mm-unstable.

