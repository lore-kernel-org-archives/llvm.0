Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B703620C001;
	Tue, 12 Aug 2025 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755036212; cv=none; b=KZ1nLalgfUIAKqSA4d+TW6kW1Dd1yUlKv2ktdhiN+9xN8JL6eyT0nG01BuYLq99lXTxNMf2iAEC/VEgVZtxDh4hD/yzfPsUQ9qF6Z5RUufbyMH/18uXdDAS0bSUtkcqfxiKVYQNSy//X+a2oqLktOHZze1rF2SJfsW41PRZ0+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755036212; c=relaxed/simple;
	bh=exvvZP2rP+R5jI+G7rsqT5N9VfuXc9aPekZm6d12tNY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PEf1Eg/SoZWv4e5kKVHptLjdDOc8hd+O7de5Isq/duc+AxVQnZx/JkV42FVNJ9QQ1oIzae3/zh8pj+01V/3CKrF8hAci3iZ1zHGhZcc3qdUzI51R1ib3F5AyveLaYPlCNqC8OlHTs9aoMwAzuO/cm/dIA8Co0XAVw7wHbjgScnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=lsQi2ZUe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="lsQi2ZUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136E6C4CEF0;
	Tue, 12 Aug 2025 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1755036212;
	bh=exvvZP2rP+R5jI+G7rsqT5N9VfuXc9aPekZm6d12tNY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lsQi2ZUegaHNI4h3O3XuHaqI2JTiMeCPKyOIncLGwlszYvrcTn363rIxyKcGmPW+8
	 zTD2ur8XXDWwW8ZSJoK0s9GSaKciMzayx8DWNBa2Ed3tpWlaCTWvVzc/gHT/FNAfVM
	 9ZhgKdef8c0piqe25zuYDgg0sRyGLrkP0DW4Tc1k=
Date: Tue, 12 Aug 2025 15:03:31 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-new 101/118] arch/powerpc/mm/ptdump/shared.c:70:1:
 error: use of 'pgtable_level' with tag type that does not match previous
 declaration
Message-Id: <20250812150331.cfe4090372c3864aa768fa7f@linux-foundation.org>
In-Reply-To: <522f31cc-f250-4883-8832-0d26ebf5210b@redhat.com>
References: <202508130304.5FJqRz2c-lkp@intel.com>
	<0c96fa0e-6f7e-4cca-8d57-f3e3786d44fa@redhat.com>
	<522f31cc-f250-4883-8832-0d26ebf5210b@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 12 Aug 2025 22:57:18 +0200 David Hildenbrand <david@redhat.com> wrote:

> >>      3 errors generated.
> > 
> > Huh, I cross compiled this on a bunch of ppc configs, but maybe not emough.
> > 
> > No, on the branch I submitted that did not exist.
> > 
> > Probably due to the rebase.
> 
> Ehm, no, Andrew, could it be that you accidentally dropped the ppc patch 
> from mm-new. I can spot all but that patch in there:
> 
> https://lkml.kernel.org/r/20250811112631.759341-7-david@redhat.com

yup, I totally missed that one, sorry.  Added now.
