Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF4B269D17
	for <llvm@lists.linux.dev>; Tue, 21 Oct 2025 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761046568; cv=none; b=RlyJ8LtB71cwbsQmU1BlYPtd0XIeOidknLNWARQseWIg13+eJ+GKOYi01JZdeyMgHIYBB8njjZU15J20GN7h7Fp8f+mpiHZbnXmb1JSTQL+TV2dO+NqdMZvJewGVYhbWuuG687hedMM0DpP3xe4pPAafeCaisuh+qcp0SzfrmQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761046568; c=relaxed/simple;
	bh=MxUDQ5N67L3DNoFFm1UEI6IOpyrdOyH/NzZFSOBSSTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=MrRG78yo77Rgx8Qk0Ua4VXtu6zOr4K4CkGuX54v2gruqtQUjiaDP6mqODL4dtqc2f/y7R9kBq4kREtzXD4WQsXNJaMAzrh1mlQFdWaO/JphBMcphkgXdxMH9jPhhAMCymh2M/hJDLcPcQW9VDesk4mDMpMZ8PMt1iOI4ivmreio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A5dI0hmd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A5dI0hmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761046565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZW8G7xaYKIqDzm7twhZQA/XqA1M+W1xvb6MCkNiK+7g=;
	b=A5dI0hmds2/KzavxORVYlaMhhxPgSGwu0v4u6nKvBMVdEL6mRfpI2o/eGjMc1NpQEFDNSe
	s8agXxFNTZsySWIiabFD52KIZSxQ6udmqHHYunQ1xUgDusaYad+Uihpu9Ch127lxN7uc4W
	vjZxjrlh6eC2o3M6oJ0S0EETclrPsKA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-689-37eYeXkdPRebMw9ghkPgWA-1; Tue,
 21 Oct 2025 07:36:01 -0400
X-MC-Unique: 37eYeXkdPRebMw9ghkPgWA-1
X-Mimecast-MFC-AGG-ID: 37eYeXkdPRebMw9ghkPgWA_1761046560
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E342818002C1;
	Tue, 21 Oct 2025 11:35:59 +0000 (UTC)
Received: from bfoster (unknown [10.22.65.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 380DF1955F22;
	Tue, 21 Oct 2025 11:35:58 +0000 (UTC)
Date: Tue, 21 Oct 2025 07:40:17 -0400
From: Brian Foster <bfoster@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [brauner-github:vfs-6.19.iomap 20/25]
 fs/iomap/buffered-io.c:870:37: error: incompatible pointer to integer
 conversion passing 'u64 *' (aka 'unsigned long long *') to parameter of type
 'u64' (aka 'unsigned long long'); remove &
Message-ID: <aPdxITrzVtGeM2Zu@bfoster>
References: <202510210751.8T3mTZMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202510210751.8T3mTZMw-lkp@intel.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hLEkyvxlXM-kI4rSjSjosGT_nyfkkmo7Q_ilix1hkvo_1761046560
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 21, 2025 at 07:26:24AM +0800, kernel test robot wrote:
> tree:   https://github.com/brauner/linux.git vfs-6.19.iomap
> head:   d61f6a3dc4f623b16ed43dd6113f594403b35211
> commit: b50d39532fdab9126c794139babaec5798e79567 [20/25] iomap: optional zero range dirty folio processing
> config: x86_64-buildonly-randconfig-003-20251021 (https://download.01.org/0day-ci/archive/20251021/202510210751.8T3mTZMw-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210751.8T3mTZMw-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510210751.8T3mTZMw-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> fs/iomap/buffered-io.c:870:37: error: incompatible pointer to integer conversion passing 'u64 *' (aka 'unsigned long long *') to parameter of type 'u64' (aka 'unsigned long long'); remove & [-Wint-conversion]
>      870 |                 status = iomap_iter_advance(iter, &len);
>          |                                                   ^~~~
>    include/linux/iomap.h:251:53: note: passing argument to parameter 'count' here
>      251 | int iomap_iter_advance(struct iomap_iter *iter, u64 count);
>          |                                                     ^
>    1 error generated.
> 

Ugh.. I guess this is because I didn't have Joanne's "iomap: simplify
iomap_iter_advance()" locally. Something like the diff below should
address it. Note that I won't have time to test properly until tomorrow
so this is compile tested only, but pretty straightforward.

BTW I'm not aware if this was published anywhere before now in the v6.19
branch, so if there's a general branch that is preferred to use for
pending iomap work or whatever let me know and I'll move over to it.

Brian

--- 8< ---

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index 72196e5021b1..a5a9caae602e 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -867,7 +867,9 @@ static int iomap_write_begin(struct iomap_iter *iter,
 	if (folio_pos(folio) > iter->pos) {
 		len = min_t(u64, folio_pos(folio) - iter->pos,
 				 iomap_length(iter));
-		status = iomap_iter_advance(iter, &len);
+		status = iomap_iter_advance(iter, len);
+		if (!status)
+			len = iomap_length(iter);
 		if (status || !len)
 			goto out_unlock;
 	}

