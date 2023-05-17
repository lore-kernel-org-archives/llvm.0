Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4058111AD;
	Wed, 17 May 2023 20:00:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559B2C433D2;
	Wed, 17 May 2023 20:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1684353606;
	bh=YEXzUQMGmMYYDvvFnfKW1qhHqJwHH2pcNV7QOnG2qT8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=07atsoaty2g2xcIK3thUAlU/31BdoTwbfVGmSozYuwc86tCT60rkCpGFoTbgx1Tgf
	 wI6fyFqaC0o52AkmOQt4fqKCmEFKvZ2ec+V/SxgMkN2aKdLx2wbZGIyC7k7LFYma+2
	 MniJYIHPC2VSFLOitLzTWN/BPwJnU+MQhgU88VXU=
Date: Wed, 17 May 2023 13:00:05 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Oscar Salvador <osalvador@suse.de>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [akpm-mm:mm-unstable 111/127]
 include/linux/stackdepot.h:116:26: error: declaration of 'struct seq_file'
 will not be visible outside of this function
Message-Id: <20230517130005.a08d32697747f514bb2c5bc7@linux-foundation.org>
In-Reply-To: <202305171411.iw7APiY8-lkp@intel.com>
References: <202305171411.iw7APiY8-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 17 May 2023 14:33:32 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
> head:   3dabb05be4612527104198f754de8c5443f7f765
> commit: e435b85a4aea7a82259105d5d8025655460052e1 [111/127] mm, page_owner: add page_owner_stacks file to print out only stacks and their counte
> config: arm-buildonly-randconfig-r006-20230517

Thanks, I did this:

--- a/include/linux/stackdepot.h~mm-page_owner-add-page_owner_stacks-file-to-print-out-only-stacks-and-their-counte-fix
+++ a/include/linux/stackdepot.h
@@ -25,6 +25,7 @@
 #include <linux/gfp.h>
 
 typedef u32 depot_stack_handle_t;
+struct seq_file;
 
 /*
  * Number of bits in the handle that stack depot doesn't use. Users may store
_

