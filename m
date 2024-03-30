Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055766FB9;
	Sat, 30 Mar 2024 02:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711766236; cv=none; b=c4fJvnBwBo6fuWsbpS+rgJicvndU9C7r9fUGkzphJUknywzHjoP0K44cy9+xx7Uo4MTFvYuUqsGEe8GKbwOyusOfSJ/4wxKUC71hzIQLLCWVEyv0zobtkFPAxznd6AJ22ytr5bpRdbCQdCMF+cmaZFqK2yDuWYyBmB6Ug1HDEoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711766236; c=relaxed/simple;
	bh=TuxpzpBxgpxp3mHMp3xdDynVyv0p0Jnlp8gC97HDOTk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PyXnwddZ0VbhRBPY2LIPsDsTM28qJmrZJatTpDizy9Oupdp/pPK470MM6ALxh7XH5QgZGRSyyI+xybLNEYgrXcMmwZlL11uEK2+I5I2N/kbo3th7Nh7gvpksNEVVqDF4lJr5H/9zuj5FuPrahy+xdGXetUIkpJrFW/aO9Q2uWX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gL9wTSZu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gL9wTSZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CF32C433C7;
	Sat, 30 Mar 2024 02:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1711766235;
	bh=TuxpzpBxgpxp3mHMp3xdDynVyv0p0Jnlp8gC97HDOTk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gL9wTSZuHMU7GrhYPCmugWLG7zmo95LxX1RjKnDb/K3UraaKjuqiV7k3ErCrtQRNI
	 sRuxclN6P3Sllqeq7Xk6Rkd6kWKUNHpqLaYO5euqaFXG4hXKeXZNbtjxolXnHfEHf3
	 3cxryJQePuct5ym0YEfS+hFxFP8vy0WUABMEZAv8=
Date: Fri, 29 Mar 2024 19:37:14 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Kent Overstreet <kent.overstreet@linux.dev>, Kees
 Cook <keescook@chromium.org>
Subject: Re: [linux-next:master 1076/1266] include/linux/alloc_tag.h:43:2:
 error:
 "Memory allocation profiling is incompatible with ARCH_NEEDS_WEAK_PER_CPU"
Message-Id: <20240329193714.8e968aad80b39be32b848f82@linux-foundation.org>
In-Reply-To: <CAJuCfpEKhhbG45RLFyh5yJ4iZ8NdqWcbj_+rf3=9Kg+hdxTtVg@mail.gmail.com>
References: <202403290334.USWrYrMw-lkp@intel.com>
	<CAJuCfpEKhhbG45RLFyh5yJ4iZ8NdqWcbj_+rf3=9Kg+hdxTtVg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 28 Mar 2024 13:02:44 -0700 Suren Baghdasaryan <surenb@google.com> wrote:

> Well, this is what I expected, we do not support this feature for
> ARCH_NEEDS_WEAK_PER_CPU (alpha and s390 with CONFIG_SMP=y &&
> CONFIG_MODULE=y).
> Unfortunately ARCH_NEEDS_WEAK_PER_CPU is not a config option, so I
> can't add it as a dependency for CONFIG_MEM_ALLOC_PROFILING. Should I
> handle this differently?

Make it a config option?  That would be a cleanup on its own.
