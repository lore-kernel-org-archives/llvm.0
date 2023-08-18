Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F7D525F
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 17:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A31C433C8;
	Fri, 18 Aug 2023 17:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692380347;
	bh=4mrMBMQCt3eC/q7RwFbH0gGMN9gDD6qugmRXW2bkuOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZKinp7UZ9KJ92P7fJU5Nymt/UY1x44pWnjgR4gMHJyYeuAmHxTTjQecajXghL8VlT
	 gOPO62VL3dKQ/R1xYz11JiFmiQCssmFvFeHkJQDVJM7/SzOB0PgZJ11IYDkCR6FZzC
	 jMuCVz/TJhG19D2EfmO8OnIrQAxyPt3E8b/eu28hwkeLz4wgy57aBV9YH1nMLpkhUa
	 HNYv+u3OtDBCXECVLEWFMwk8VXFk2RMELRVHmrR6nwTBuBu+H8hf+8TPqCF+hIhdLB
	 ZdP5FbgJeFeXYqldPjVmakqp1DN4b8LRcbwN1p/28cMn6Z4ORmHe0D20LzvieocvRc
	 /OJ3YN60PrHDw==
Date: Fri, 18 Aug 2023 18:39:02 +0100
From: Lee Jones <lee@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>, Pavel Machek <pavel@ucw.cz>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] leds: pca955x: fix -Wvoid-pointer-to-enum-cast warning
Message-ID: <20230818173902.GE986605@google.com>
References: <20230816-void-drivers-leds-leds-pca955x-v1-1-2967e4c1bdcc@google.com>
 <20230818160154.GZ986605@google.com>
 <20230818160648.GA939927@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818160648.GA939927@dev-arch.thelio-3990X>

On Fri, 18 Aug 2023, Nathan Chancellor wrote:

> On Fri, Aug 18, 2023 at 05:01:54PM +0100, Lee Jones wrote:
> > On Wed, 16 Aug 2023, Justin Stitt wrote:
> > 
> > > When building with clang 18 I see the following warning:
> > > |      drivers/leds/leds-pca955x.c:487:15: warning: cast to smaller integer
> > > |      type 'enum pca955x_type' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> > > |        487 |                 chip_type = (enum pca955x_type)md;
> > > 
> > > This is due to the fact that `md` is a void* while `enum pca995x_type` has the
> > > size of an int.
> > > 
> > > Add uintptr_t cast to silence clang warning while also keeping enum cast
> > > for readability and consistency with other `chip_type` assignment just a
> > > few lines below:
> > > |	chip_type = (enum pca955x_type)id->driver_data;
> > > 
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1910
> > > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > 
> > A review from Nathan would be good here.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Thank you.

-- 
Lee Jones [李琼斯]
