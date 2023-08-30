Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9E579C1
	for <llvm@lists.linux.dev>; Wed, 30 Aug 2023 19:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234F1C433C7;
	Wed, 30 Aug 2023 19:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693424962;
	bh=jieN0qxUfZHYIEeq2xNYl2N2poqn5+xpcJ8r2b5GRm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ptWMBRJqNBEWg1YUKbp0gstqBIy/QesqWiLqq2+vaKFIdW9cC6m7KJrascM62Fz8J
	 vMi7mpJ5yZHvy6A2AMsDkIoj3ZQvNOZ+D4pJ0+Gec9ObwaGkbJ1/GRlp4Hd7iZMGCR
	 tFBc/j1d2i2XFzpu4agDIj2nTQ9fbIGzOmGpnlCLa8gfS/1zNA+6+LaqhSrBmNUX9F
	 YGVawD9w5wGnR5/NeiniKXOC+nwO/lI1kshLpxcX2cWm8QOGsG3xd70KMFfJfHCKWY
	 jQYV/P9hU8nd1n1O63gjO28xsfZKqppO4JWArhgMGuKqeklIw9PnuQ7FPwxx4PiaOL
	 MLjDj75B36ikA==
Date: Wed, 30 Aug 2023 12:49:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: clang-built-linux <llvm@lists.linux.dev>,
	clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: RFC: blocking posts to the older mailing list
Message-ID: <20230830194920.GA2263564@dev-arch.thelio-3990X>
References: <CAKwvOdk_GVOdT==9=X=+s=xaD4PrvwXWoKePNJJ5WRmYHkrTqg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdk_GVOdT==9=X=+s=xaD4PrvwXWoKePNJJ5WRmYHkrTqg@mail.gmail.com>

On Wed, Aug 30, 2023 at 11:46:39AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> Hi folks,
> We established the newer mailing list <llvm@lists.linux.dev> a few
> years ago with archives available at https://lore.kernel.org/llvm/.
> 
> This is in preference to our previous mailing list
> <clang-built-linux@googlegroups.com> with archives available at
> https://groups.google.com/g/clang-built-linux.
> 
> These can both be found on our homepage
> <https://clangbuiltlinux.github.io/>.  While it was our intent to
> deprecate the old list (and still is), we have not yet taken any
> action to actually block new posts on the old one.
> 
> RFC but my plan is to change the following settings on the old google group:
> 1. Who can post: anyone on the web -> group owners
> 2. Who can contact group owners: anyone on the web -> group members
> 3. Message moderation: no moderation -> moderate all
> 4. New member restrictions: no restrictions -> new members cannot post
> 5. Rejected message notification: off -> on
> 6. Include default rejected message response: unchecked -> checked
> with link to new ML as message

This sounds reasonable to me. I am still subscribed to the old list and
the only stuff I have really seen sent to it is just junk/spam, with the
occasional mail that was sent to clang-built-linux@ and llvm@, so there
should be no functional loss. I think we have been clear enough with
people who were still using the old mailing list that they should
completely switch over to the new one. If they mess up and get a message
that the mail was rejected with an explanation of why, it will be even
more obvious what to do :)

> Then update our homepage to note that the archive for the old ML is
> explicitly deprecated.
> 
> I think that will prevent further confusion, and sorry that I haven't
> taken these steps sooner!
> 
> Thoughts?

+1 from me

> Another outstanding issue is that it doesn't seem like there's
> available tools for exporting the old google groups archive, AFAIK.  I
> would love to be corrected though.

Unfortunately, the tool I think I had looked into using at one point is
now marked as deprecated/broken:

https://github.com/icy/google-group-crawler

So aside from us looking into how to export the archives that we should
have in our own inboxes as mbox files or seeing if someone else has
built a tool of that sort, I am not sure that we have much recourse for
getting those archives out of Google Groups... Fortunately, I am not
sure that we had many discussions on the list that were not also Cc'd to
some list that lore.kernel.org archives. In fact, you can use the c: and
t: search option to find messges that we sent to that list that got
archived on lore:

https://lore.kernel.org/all/?q=c:clang-built-linux@googlegroups.com+OR+t:clang-built-linux@googlegroups.com

So I think that might just be good enough to say between our issue
tracker and what we have on lore, potential loss of access to our Google
Groups archive should the service shut down or experience some sort of
data loss should not impact our ability to look back for answers about
why we did or did not do something.

Thanks for writing this up and keeping us consistent!

Cheers,
Nathan
