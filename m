Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDA829B215
	for <llvm@lists.linux.dev>; Mon, 14 Apr 2025 12:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632819; cv=none; b=m7stB4ItfHnGwtlJTMAL2j1oUSkTEgyl172X1NaKjCEERZDZ+pQKrbaKKb2edu8qZo29FZIC43wgrxAp995Gu6ZdrT8mfDs4L+cn408OjPIhI5FpmqUqpcTjHGFFCNBkB6OrqyE/E42bloL+J64AzVEdK2gqP/2ufHUzMSrrbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632819; c=relaxed/simple;
	bh=tek+9yIhv/inJSoNG6Oa9yTvOsy+wDQ1yZOAEV9xRTQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=L7snddHehaB20wGogMWH8osJKRbSR+U+k7H4vk2hiigO6y/bybEMJLOE9vJYpiKa4x6VyL95DCmoG1J2SOQUwlVpG3faGUxTWqhdPG/5YFmzjcR8jvgL59lltMCUQfjkFJHVCbOBBCs+YH1Qyaq/pPpbEXd0lFGJLNJ7I531RuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dJpqrkAc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dJpqrkAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744632816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jGXOIiFLOKlRL+utvX2910PESSbxXzHZjxCc4Cz0fY4=;
	b=dJpqrkAcq/48ULvuqgiO+8TQ0/Oe+XzsP/iU/4N7oHbByEYN0Xn2RhhEAXODuYx+l/nzNP
	jRjf5jzv/8/6Fc0tk6k1G/RmryoJ2vf1bsuZBTHWAFYUpDCGnL9nLt6XvdYQjlKFMFpMBg
	UXC3UT9aCbncmAkrnnseDf+j9m2/GKo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-147-W9yS-uk8Or22d5cyR0Mopw-1; Mon,
 14 Apr 2025 08:13:30 -0400
X-MC-Unique: W9yS-uk8Or22d5cyR0Mopw-1
X-Mimecast-MFC-AGG-ID: W9yS-uk8Or22d5cyR0Mopw_1744632808
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 977881801A1A;
	Mon, 14 Apr 2025 12:13:28 +0000 (UTC)
Received: from [10.22.80.44] (unknown [10.22.80.44])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 539F119560AD;
	Mon, 14 Apr 2025 12:13:24 +0000 (UTC)
Date: Mon, 14 Apr 2025 14:13:18 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev, 
    linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
    Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] dm table: Fix W=1 build warning when
 mempool_needs_integrity is unused
In-Reply-To: <Z_zd1NCtn_QxaCzC@smile.fi.intel.com>
Message-ID: <a0b1fcbf-9cda-9da2-ecbe-ac5cbc75b775@redhat.com>
References: <20250407072126.3879086-1-andriy.shevchenko@linux.intel.com> <Z_zdwSCfaYDotOI2@smile.fi.intel.com> <Z_zd1NCtn_QxaCzC@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On Mon, 14 Apr 2025, Andy Shevchenko wrote:

> On Mon, Apr 14, 2025 at 01:04:49PM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 07, 2025 at 10:21:26AM +0300, Andy Shevchenko wrote:
> > > The mempool_needs_integrity is unused. This, in particular, prevents
> > > kernel builds with Clang, `make W=1` and CONFIG_WERROR=y:
> > > 
> > > drivers/md/dm-table.c:1052:7: error: variable 'mempool_needs_integrity' set but not used [-Werror,-Wunused-but-set-variable]
> > >  1052 |         bool mempool_needs_integrity = t->integrity_supported;
> > >       |              ^
> > > 
> > > Fix this by removing the leftover.
> > 
> > This issue is still present in v6.15-rc1.
> 
> I meant v6.15-rc2, of course.
> 
> -- 
> With Best Regards,
> Andy Shevchenko

I will send it to Linus (maybe with other changes) before 6.15 comes out.

Mikulas

