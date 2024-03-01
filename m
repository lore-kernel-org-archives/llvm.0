Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6340C47F54;
	Fri,  1 Mar 2024 04:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709266294; cv=none; b=Px+ffosyMMa4mlxHmBZE24MV93OSQndLoBeWWWaETFkx38TnLI/TFB/KHTwnP43QubMEIp8LPEGAAzsnbVuskXVvrfapgaQE77sHTXxVtv/P2aYSs5+/48VOQ+rmleWziCT0Zvng1eCZhpGXAI4vJXHMyOTbSZsT51zmLzHePYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709266294; c=relaxed/simple;
	bh=ZLiSyJsBWiOF24DbvxEQPfAShr4vD9tN2Du0IVdD+n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bz14pCfDjzLR60wqikFk1oKM0WpgBIGeShsTBuPcIN+EuK4VA9pAamR9ZSZ5F4vWtqL47KzO96bWeQRh8K0FDvD5ZnysZmZP7s/JJVPBQO5Jb2pVZHvWqzkEmWBwSLr127jPZApS/P0k85FLOoWiOTmAzzxE+cHB7NQIMAlOdZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PgY2u64R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PgY2u64R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B4DC433C7;
	Fri,  1 Mar 2024 04:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709266293;
	bh=ZLiSyJsBWiOF24DbvxEQPfAShr4vD9tN2Du0IVdD+n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PgY2u64RwkNjf3Lnofj3jJx+gUbJlkkcDGjpXZUdDRGrzf4mAIFY3FNQzFpVHNEIT
	 FgFMstK53T1/JQqdbCxrtsmbAj2hBeGSWjNGJ+3vObhZIYfHl3XNZZ/48APsqGqh5W
	 XpNw1Q2by4zN03DS7xMa6tQ+4ANw3noJy3Kwg8EfuoSoxXHx9S6uEO6Y4JfqjKB2cf
	 KYs2eXa+JgXHsWnRubgopQyrXMWSyFOPXFz1DGar3QnJAvte6j006iCUbZkIaWJKKd
	 S3DPtgPbQb+1H7+I/NBzGUE/uFrm0QZWG/qG4D/eiUKoml+O5N6p50hIJFfrVXR5Zh
	 UDdFEOSJSSJ4w==
Date: Thu, 29 Feb 2024 21:11:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: Re: [trace:trace/for-next 28/29]
 include/trace/events/sunrpc.h:703:4: warning: result of comparison against a
 string literal is unspecified (use an explicit string comparison function
 instead)
Message-ID: <20240301041131.GB577965@dev-arch.thelio-3990X>
References: <202402292111.KIdExylU-lkp@intel.com>
 <20240229180616.48d2c0eb@gandalf.local.home>
 <20240229234455.GA1020819@dev-arch.thelio-3990X>
 <20240229185558.70b6ea86@gandalf.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229185558.70b6ea86@gandalf.local.home>

On Thu, Feb 29, 2024 at 06:55:58PM -0500, Steven Rostedt wrote:
> On Thu, 29 Feb 2024 16:44:55 -0700
> Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > > I don't build with clang, does this quiet the warning?  
> > 
> > Unfortunately, it does not. I tested with LLVM 17.0.6 from kernel.org:
> > 
> > https://mirrors.edge.kernel.org/pub/tools/llvm/
> > 
> > If there is no other way to silence it, we could potentially use the
> > diag infrastructure to silence it, I could look at that tomorrow.
> 
> Is it the exact same warning? I wonder if I make it into an if statement,
> it would be better?
> 
> #define __assign_str(dst, src)						\
> 	do {								\
> 		char *__str__ = __get_str(dst);				\
> 		int __len__ = __get_dynamic_array_len(dst) - 1;		\
> 		if (__builtin_constant_p(src))				\
> 			WARN_ON_ONCE(strcmp((src), __data_offsets.dst##_ptr_)); \
> 		else							\
> 			WARN_ON_ONCE((src) != __data_offsets.dst##_ptr_);\
> 		memcpy(__str__, __data_offsets.dst##_ptr_ ? :		\
> 		       EVENT_NULL_STR, __len__);			\
> 		__str__[__len__] = '\0';				\
> 	} while (0)
> 
> Then the compiler may be better in optimizing out the "bad" portion.

No, that does not work either, I diffed the warnings and they are
identical minus line numbers. I don't think clang takes
__builtin_constant_p() into account in the front end but I could be
wrong. In fact, I think clang (and even gcc sometimes) will still warn
for code even if it is within an 'if (0)' block, it's been used as
justification before in commit 37b47298ab86 ("sched: Disable
-Wunused-but-set-variable").

Cheers,
Nathan
