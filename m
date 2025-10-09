Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDF11E0E1F;
	Thu,  9 Oct 2025 19:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760037822; cv=none; b=t6+3LVWUK13oqrpcU7ac3FQP4y5N4XC2w4MA4PaduCjfR7MxYLfezwq7PIhQ9Rwkes4aI6sLhfoH3m7Y2F8zQzKpeZ/depp8Y+GvgR57EFzoq9W7qQnmexgKoq3aIzCYq7obi32D9tQ3Sdh3ZNbr1haOwT3MO1Ue4KdVB/nlIfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760037822; c=relaxed/simple;
	bh=kN26N6ZmdmvX5qUDg8eseKZvC9NjXY9htPd4izOs1eE=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=kFH6LIjr0mp+LdS5il5P9OPpBnoEvpDaWvOzbWufQk9wUO47F0mI46jH3e2zbCkMwN24nhfAdHL0rZxx3TL+tvTkmcZl0EMH7Zus5h82YB8hsX37TnKLY1Xs8ey48Js8Ldt0PGByKSNdPYqUTnSdcxrPbog7s3E1i6qW/X23o7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W+qzwOKD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W+qzwOKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6511C4CEE7;
	Thu,  9 Oct 2025 19:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1760037822;
	bh=kN26N6ZmdmvX5qUDg8eseKZvC9NjXY9htPd4izOs1eE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=W+qzwOKD7LRnjfSpXzUu6om7UswEqD8HLdCsM/+u/n8oO3rdwUyqIOEEAsn1wcTWQ
	 ux2WxjE2f+tixZ/NzFmZCgI+z8Vaq6eITcRyuiGr/sAh47UFRRDYEo/0C8RWvxFrRq
	 JtTFYlNRn9Fd75WeTsza0G11QZ27dDhBZn7xE/HU=
Date: Thu, 9 Oct 2025 12:23:41 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>
Subject: Re: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value
 `VM_READ` in crate `bindings`
Message-Id: <20251009122341.fc4a804c1893d987cec75567@linux-foundation.org>
In-Reply-To: <CANiq72kTPjukgmAxDfLg2s4JHdaKaw=bY4DLVjTr7-9bqv5D3A@mail.gmail.com>
References: <202510100127.yuqhg8uo-lkp@intel.com>
	<20251009110555.29a67af19f5cc4d40e66713c@linux-foundation.org>
	<CANiq72kKSz=UK+O4tnV0Kmw_HmJhJJ+KNZnUBWtOWqanrG+7Vg@mail.gmail.com>
	<CANiq72kTPjukgmAxDfLg2s4JHdaKaw=bY4DLVjTr7-9bqv5D3A@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 9 Oct 2025 20:15:06 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Thu, Oct 9, 2025 at 8:14 PM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > We can either define helper constants in
> > `rust/bindings/bindings_helper.h` for the ones that the Rust side is
> > already using (like last time) or use `enum`s on the C header.
> >
> > If you have it in a branch, I can prepare a quick diff for you to fold.
> 
> Should I test on
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new?
> 

Yes please.  That's the only place where this patch is hosted.

mm-new is for "new" material and is held out of linux-next until the
end of the merge window.

