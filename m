Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19954173
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QguUO9iElD2uimtN6/KPbOt0qekHNlpVkvs8+DjH69c=; b=uaK3s2h5rUUptGzpogZMFDWObe
	9ULZR/LqtY/+bEM2lmks7rtmA/gvNTdTE0cJFb5ebFuqX0ZMmKP5MPDeDKuX5xnzPIh6FHG8K34Ok
	m9SA9LjwcR2yFL0SWaXTAXlFcczAbZyc+LGLFI/bdXOsd0y2i+DhvW3izMOHxAUSTBsBoBUUeiBqe
	UaO48mGvCi7SJFTFxM44tKdXa4hMH/hXmsUrx9yF0DM/PZZ+NR9FBsUEGKMByeAlqKvkttrxn/+/H
	O6wMgYXnJvYi3IKF/R5V1YwdbnuESffdlAYaXM9Yj6kjVpHhns2rtpSsFpM1MtDwyVMTiigB8MJLq
	B/aWlgyQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCQL8-009Bmm-83; Tue, 25 Jan 2022 18:14:46 +0000
Date: Tue, 25 Jan 2022 10:14:46 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, Tong Zhang <ztong0001@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v1] binfmt_misc: fix crash when load/unload module
Message-ID: <YfA+FshocO96c/WH@bombadil.infradead.org>
References: <20220124003342.1457437-1-ztong0001@gmail.com>
 <202201241937.i9KSsyAj-lkp@intel.com>
 <20220124151611.30db4381d910c853fc0c9728@linux-foundation.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220124151611.30db4381d910c853fc0c9728@linux-foundation.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, Jan 24, 2022 at 03:16:11PM -0800, Andrew Morton wrote:
> On Mon, 24 Jan 2022 19:40:53 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > Hi Tong,
> > 
> > 
> > >> fs/binfmt_misc.c:828:21: error: incompatible pointer types assigning to 'struct ctl_table_header *' from 'struct sysctl_header *' [-Werror,-Wincompatible-pointer-types]
> >            binfmt_misc_header = register_sysctl_mount_point("fs/binfmt_misc");
> >                               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    1 error generated.
> > 
> > 
> > vim +828 fs/binfmt_misc.c
> > 
> >    821	
> >    822	static int __init init_misc_binfmt(void)
> >    823	{
> >    824		int err = register_filesystem(&bm_fs_type);
> >    825		if (!err)
> >    826			insert_binfmt(&misc_format);
> >    827	
> >  > 828		binfmt_misc_header = register_sysctl_mount_point("fs/binfmt_misc");
> >    829		if (!binfmt_misc_header) {
> >    830			pr_warn("Failed to create fs/binfmt_misc sysctl mount point");
> >    831			return -ENOMEM;
> >    832		}
> >    833		return 0;
> >    834	}
> >    835	
> 
> This is actually a blooper in Luis's "sysctl: add helper to register a
> sysctl mount point".
> 
> Please test, review, ridicule, etc:
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: include/linux/sysctl.h: fix register_sysctl_mount_point() return type
> 
> The CONFIG_SYSCTL=n stub returns the wrong type.
> 
> Fixes: ee9efac48a082 ("sysctl: add helper to register a sysctl mount point")
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Tong Zhang <ztong0001@gmail.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis
