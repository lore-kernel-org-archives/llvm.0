Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A21E1E1C0;
	Thu, 10 Aug 2023 17:02:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2985EC433C7;
	Thu, 10 Aug 2023 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1691686923;
	bh=jPcoo18ehBOrrT6IjZwT7PuoeoBDMfMQK8T/HxxkxgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fyCXgahvtkfXnfXbC1+pfc2L27Y0UqvLsvUpfDL+FfgaSJeA/mLOoVZ5jm3v3owkK
	 8LNivsC2kmr+AWiBKRMu1g0OYzMiJelLfDC2cRIATqVLAZhHcJS7BM7n16WnHhhE3n
	 rN4xf/d4lZSFDxyOGnHFHqiQ0Y+cxqwzJ+e3JBcc=
Date: Thu, 10 Aug 2023 10:02:02 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Marco Elver <elver@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, kernel test robot
 <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Linux
 Memory Management List <linux-mm@kvack.org>, Miguel Ojeda
 <ojeda@kernel.org>
Subject: Re: [linux-next:master 8173/8441] include/linux/list.h:53:13:
 warning: '__preserve_most__' calling convention is not supported for this
 target
Message-Id: <20230810100202.93059f4ba94e4400e9a63b39@linux-foundation.org>
In-Reply-To: <CANpmjNNjzeKyB7V7r73qW9zzqYeMEEK27pfFV9aBm6yfLjJeng@mail.gmail.com>
References: <202308091820.0dPY7D6f-lkp@intel.com>
	<ZNN1WdZ5J/e5OPAt@elver.google.com>
	<CAKwvOd=hgqas-kMxvOgviff43XBmwgERrfGi-ZO45DOcEuG_yw@mail.gmail.com>
	<CANpmjNNjzeKyB7V7r73qW9zzqYeMEEK27pfFV9aBm6yfLjJeng@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Aug 2023 18:00:32 +0200 Marco Elver <elver@google.com> wrote:

> Andrew, please shout if you'd rather have them as fix patches.

I grabbed it, thanks.
