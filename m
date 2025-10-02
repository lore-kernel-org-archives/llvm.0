Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF7F846F;
	Thu,  2 Oct 2025 22:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759445005; cv=none; b=p3FhzH7kawwe2x275q5VtQFOQ3pJOTNqnQkVbXeVnAaUhS6gqncdnFRni9lFK42Tu2/lTlowQDotYmuj7Oihu3KJtSvrnPFE40TBEc3t7nre4NxYiHbkSrmgnOjaS1+Y7G4nfRW7TCS/iNVtVkX3f2fNGA7009prTI+HW+T7f8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759445005; c=relaxed/simple;
	bh=xgulY8EEmp4F1qL8A6kHHyk1dn3V0wGV5VjKu/RbI9E=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=peGkpiDu2tGDU//nn8orWqCRsVxojJzZ3qm5HXJEhe7J+ya06olntZd3ZlIbTI++4TYMquz3zN3UIsYhXLKpu06SRc0Qs4rt5g3ktyI1RhcxeyETLX+5+u/e87iDRoSFis0sfT4UdN8FkS3EjHY7Q4JmD7VO+Q5KoFoS9E9ebSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OjEaa7D/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OjEaa7D/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B433C4CEF4;
	Thu,  2 Oct 2025 22:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1759445004;
	bh=xgulY8EEmp4F1qL8A6kHHyk1dn3V0wGV5VjKu/RbI9E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OjEaa7D/jdzc49Xrd0qFcYZNJwUcwdZEnG0bWo/Fh+DU7oM/sJAransWSTc6+OekF
	 AgO1qU9XgkL04IY/B5dEa0+nbdyWYS1TTSBSrlXKU5bA1oqAaqdt0f+gp9dJmnYK22
	 NUZf4LdRyVGRbUJDVq4JMMNjbZHqIvEYZyLYH6tg=
Date: Thu, 2 Oct 2025 15:43:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Jakub Acs <acsjakub@amazon.de>,
 llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux Memory
 Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
Message-Id: <20251002154323.ca15e98421255ae2978e8d6b@linux-foundation.org>
In-Reply-To: <CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
References: <202510030449.VfSaAjvd-lkp@intel.com>
	<20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
	<CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com>
	<20251002152753.c756678dfdcf739e2fbf74f7@linux-foundation.org>
	<CANiq72kWWPAZ3gq2ktMpVeMKpWOU1nAmYi-4d-BgbuDti77ggg@mail.gmail.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 3 Oct 2025 00:39:16 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Fri, Oct 3, 2025 at 12:27 AM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > Sorry, this is rather annoying.  Rust is breaking the build for a very
> > simple patch.  Many developers aren't rust-enabled and probably aren't
> > even able to test a fix - my attempt to get a rust build setup working
> > didn't end happily.
> >
> > Jakub's patch fixes a kernel crash and needs to be merged into mainline
> > and -stable reasonably soon.  But that is now blocked until someone who
> > knows how to fix this error and how to test it gets down and does those
> > things.
> >
> > Jakub's patch is present in current linux-next.  Can someone please
> > send us a fix?
> 
> I am not sure I follow -- the diff I gave you should work.

It would be nice if someone were to test it!

> If you have a branch you want me to test and/or give you a formal
> patch on top of that or similar, I can do that.

Thanks.  As mentioned, today's linux-next is where the problem is being
observed.

I'm queueing the below as a fixup against Jakub's original.  This should
appear in tomorrow's linux-next.  Or the day after - it's a timezone
thing.

From: Andrew Morton <akpm@linux-foundation.org>
Subject: mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise-fix
Date: Thu Oct  2 03:37:47 PM PDT 2025

Rust bindgen wasn't able to handle the BIT() macro.  Add a helper (from
Miguel) to fix this.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510030449.VfSaAjvd-lkp@intel.com/
Cc: Axel Rasmussen <axelrasmussen@google.com>
Cc: Chengming Zhou <chengming.zhou@linux.dev>
Cc: David Hildenbrand <david@redhat.com>
Cc: Jakub Acs <acsjakub@amazon.de>
Cc: Peter Xu <peterx@redhat.com>
Cc: SeongJae Park <sj@kernel.org>
Cc: Xu Xin <xu.xin16@zte.com.cn>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 rust/bindings/bindings_helper.h |    1 +
 1 file changed, 1 insertion(+)

--- a/rust/bindings/bindings_helper.h~mm-ksm-fix-flag-dropping-behavior-in-ksm_madvise-fix
+++ a/rust/bindings/bindings_helper.h
@@ -99,3 +99,4 @@ const xa_mark_t RUST_CONST_HELPER_XA_PRE
 
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC = XA_FLAGS_ALLOC;
 const gfp_t RUST_CONST_HELPER_XA_FLAGS_ALLOC1 = XA_FLAGS_ALLOC1;
+const vm_flags_t RUST_CONST_HELPER_VM_MERGEABLE = VM_MERGEABLE;
_

