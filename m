Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4A223DF;
	Thu,  1 Jun 2023 20:19:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1EEC433EF;
	Thu,  1 Jun 2023 20:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1685650790;
	bh=Mmy4uHsvTyotgTSiPT9gqnXFjrQ4yMuFOXvXV7IgCIQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qazHqD10snMjOMmOjBi9Zw/XWYnQyhjqwEZhFndPOtZ++FZGbEiamGGRP3x1KJHL9
	 o0DzIIMhwBfl5MzVTsMmGdUnBWnqv5rYTTaYPCq7wesuObr8ID3MbYkgueA9K7Ggl6
	 wiDO8p1Lu3ClhWvryKkdIBlKXLr+ceJeAmSnO7UY=
Date: Thu, 1 Jun 2023 13:19:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Nhat Pham <nphamcs@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5938/6538] mm/zswap.c:1183:6: warning:
 variable 'ret' is used uninitialized whenever 'if' condition is true
Message-Id: <20230601131949.e6ff7f41ac3fec6875b16e8c@linux-foundation.org>
In-Reply-To: <202306011435.2BxsHFUE-lkp@intel.com>
References: <202306011435.2BxsHFUE-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Jun 2023 14:29:13 +0800 kernel test robot <lkp@intel.com> wrote:

>            if (objcg && !obj_cgroup_may_zswap(objcg))
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/zswap.c:1327:9: note: uninitialized use occurs here
>            return ret;
>                   ^~~
>    mm/zswap.c:1183:2: note: remove the 'if' if its condition is always false
>            if (objcg && !obj_cgroup_may_zswap(objcg))
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    mm/zswap.c:1158:9: note: initialize the variable 'ret' to silence this warning
>            int ret;
>                   ^

Thanks.  I did the below.  Maybe ENOMEM would be more appropriate...

--- a/mm/zswap.c~zswap-do-not-shrink-if-cgroup-may-not-zswap-fix
+++ a/mm/zswap.c
@@ -1180,8 +1180,10 @@ static int zswap_frontswap_store(unsigne
 	 * local cgroup limits.
 	 */
 	objcg = get_obj_cgroup_from_page(page);
-	if (objcg && !obj_cgroup_may_zswap(objcg))
+	if (objcg && !obj_cgroup_may_zswap(objcg)) {
+		ret = -ENOSPC;
 		goto reject;
+	}
 
 	/* reclaim space if needed */
 	if (zswap_is_full()) {
_

