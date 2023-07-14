Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4BED521;
	Fri, 14 Jul 2023 15:57:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F4BC433C7;
	Fri, 14 Jul 2023 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1689350247;
	bh=lwc2mqtMamKbQhuz7C+HFzR/YjxrhWRQte11nnNxhgg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KLbopqqHwf7VLeiIZrQB/ZCljR0ODPzFrSOjaQtfHAumIDfVbBsWu7HipSsaCmdvM
	 KjA+Tp9Eiwro5yj8zQmkWFnuT28AplKPWV+Pjy+UixKC0PaoPNccd8ljmePwqjXrYA
	 cIlvyQKUsh2n/HCABEEKP2cd3t0u2OJ39vovfJG8=
Date: Fri, 14 Jul 2023 08:57:26 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Carlos Maiolino <cem@kernel.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Lukas Czerner <lczerner@redhat.com>, Jan Kara
 <jack@suse.cz>
Subject: Re: [akpm-mm:mm-unstable 161/178] mm/shmem_quota.c:286:5: warning:
 no previous prototype for function 'shmem_mark_dquot_dirty'
Message-Id: <20230714085726.4b015152cd5b5182250b2a66@linux-foundation.org>
In-Reply-To: <202307141341.R961dyMt-lkp@intel.com>
References: <202307141341.R961dyMt-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jul 2023 13:10:19 +0800 kernel test robot <lkp@intel.com> wrote:

> >> mm/shmem_quota.c:286:5: warning: no previous prototype for function 'shmem_mark_dquot_dirty' [-Wmissing-prototypes]
>      286 | int shmem_mark_dquot_dirty(struct dquot *dquot)
>          |     ^
>    mm/shmem_quota.c:286:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>      286 | int shmem_mark_dquot_dirty(struct dquot *dquot)
>          | ^
>          | static 
> >> mm/shmem_quota.c:291:5: warning: no previous prototype for function 'shmem_dquot_write_info' [-Wmissing-prototypes]
>      291 | int shmem_dquot_write_info(struct super_block *sb, int type)
>          |     ^
>    mm/shmem_quota.c:291:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>      291 | int shmem_dquot_write_info(struct super_block *sb, int type)

Thanks.

--- a/mm/shmem_quota.c~shmem-prepare-shmem-quota-infrastructure-fix
+++ a/mm/shmem_quota.c
@@ -283,12 +283,12 @@ out_dqlock:
 	return 0;
 }
 
-int shmem_mark_dquot_dirty(struct dquot *dquot)
+static int shmem_mark_dquot_dirty(struct dquot *dquot)
 {
 	return 0;
 }
 
-int shmem_dquot_write_info(struct super_block *sb, int type)
+static int shmem_dquot_write_info(struct super_block *sb, int type)
 {
 	return 0;
 }
_

