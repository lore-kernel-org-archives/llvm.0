Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BE729CA
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 23:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E6ADC340E4;
	Mon, 24 Jan 2022 23:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1643066173;
	bh=m4lQeB2jxEx5NHaHefSlx/F98dqVWm5eHt4WwZYhJpM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=j8mCv6+aS6ePm629WrGtbqhFWtZRlSIPGQWCJ2M8Hc66L3928ziPS/9Mj1nUARG17
	 kt/RsEE5+sQQpeWWDXMEqpNYQWgH1CY1XR1Fvtawb5UzwQvOSbhwmyTA17BetPB/4B
	 g7Zu838H+7A9Xfx8JffSWEBeVxBnOui3OPHo4/lk=
Date: Mon, 24 Jan 2022 15:16:11 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Tong Zhang <ztong0001@gmail.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Luis Chamberlain <mcgrof@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, kbuild-all@lists.01.org, Linux Memory Management List
 <linux-mm@kvack.org>, Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v1] binfmt_misc: fix crash when load/unload module
Message-Id: <20220124151611.30db4381d910c853fc0c9728@linux-foundation.org>
In-Reply-To: <202201241937.i9KSsyAj-lkp@intel.com>
References: <20220124003342.1457437-1-ztong0001@gmail.com>
	<202201241937.i9KSsyAj-lkp@intel.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Jan 2022 19:40:53 +0800 kernel test robot <lkp@intel.com> wrote:

> Hi Tong,
> 
> 
> >> fs/binfmt_misc.c:828:21: error: incompatible pointer types assigning to 'struct ctl_table_header *' from 'struct sysctl_header *' [-Werror,-Wincompatible-pointer-types]
>            binfmt_misc_header = register_sysctl_mount_point("fs/binfmt_misc");
>                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 error generated.
> 
> 
> vim +828 fs/binfmt_misc.c
> 
>    821	
>    822	static int __init init_misc_binfmt(void)
>    823	{
>    824		int err = register_filesystem(&bm_fs_type);
>    825		if (!err)
>    826			insert_binfmt(&misc_format);
>    827	
>  > 828		binfmt_misc_header = register_sysctl_mount_point("fs/binfmt_misc");
>    829		if (!binfmt_misc_header) {
>    830			pr_warn("Failed to create fs/binfmt_misc sysctl mount point");
>    831			return -ENOMEM;
>    832		}
>    833		return 0;
>    834	}
>    835	

This is actually a blooper in Luis's "sysctl: add helper to register a
sysctl mount point".

Please test, review, ridicule, etc:

From: Andrew Morton <akpm@linux-foundation.org>
Subject: include/linux/sysctl.h: fix register_sysctl_mount_point() return type

The CONFIG_SYSCTL=n stub returns the wrong type.

Fixes: ee9efac48a082 ("sysctl: add helper to register a sysctl mount point")
Cc: Luis Chamberlain <mcgrof@kernel.org>
Cc: Tong Zhang <ztong0001@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 include/linux/sysctl.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/include/linux/sysctl.h~a
+++ a/include/linux/sysctl.h
@@ -265,7 +265,7 @@ static inline struct ctl_table_header *r
 	return NULL;
 }
 
-static inline struct sysctl_header *register_sysctl_mount_point(const char *path)
+static inline struct ctl_table_header *register_sysctl_mount_point(const char *path)
 {
 	return NULL;
 }
_

